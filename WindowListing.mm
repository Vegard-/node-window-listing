#include <Foundation/Foundation.h>
#include <Cocoa/Cocoa.h>
#include <node.h>
#include <v8.h>

void Method(const v8::FunctionCallbackInfo<v8::Value>& args) {
  v8::Isolate* isolate = args.GetIsolate();
  v8::HandleScope scope(isolate);

  NSArray *windows = (NSArray *) CGWindowListCopyWindowInfo(kCGWindowListExcludeDesktopElements, kCGNullWindowID);
  v8::Handle<v8::Array> result = v8::Array::New(isolate, windows.count);
  int i = 0;
  for(NSDictionary *window in windows){
    int ownerPid = [[window objectForKey:(NSString *)kCGWindowOwnerPID] intValue];
    int windowId = [[window objectForKey:(NSString *)kCGWindowNumber] intValue];
    NSString *title = [window objectForKey:(NSString *)kCGWindowName];
    NSString *ownerName = [window objectForKey:(NSString *)kCGWindowOwnerName];

    v8::Local<v8::Object> windowObj = v8::Object::New(isolate);
    windowObj->Set(v8::String::NewFromUtf8(isolate, "pid"), v8::Integer::New(isolate, ownerPid));
    if (ownerName && ownerName.length > 0){
      windowObj->Set(v8::String::NewFromUtf8(isolate, "pname"), v8::String::NewFromUtf8(isolate, ownerName.UTF8String));
    }
    windowObj->Set(v8::String::NewFromUtf8(isolate, "windowId"), v8::Integer::New(isolate, windowId));
    if (title && title.length > 0){
      windowObj->Set(v8::String::NewFromUtf8(isolate, "windowTitle"), v8::String::NewFromUtf8(isolate, title.UTF8String));
    }
    result->Set(i++, windowObj);
  }
  args.GetReturnValue().Set(result);
}

void init(v8::Local<v8::Object> target) {
  NODE_SET_METHOD(target, "getAll", Method);
}

NODE_MODULE(binding, init);

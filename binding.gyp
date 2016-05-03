{
  'make_global_settings': [
    ['CXX','/usr/bin/clang++'],
    ['LINK','/usr/bin/clang++'],
  ],
  'targets': [
    {
      'target_name': 'windowListing',
      'sources': [ 'WindowListing.mm' ],
      'conditions': [
        [ 'OS=="mac"', {
          'xcode_settings': {
            "OTHER_CPLUSPLUSFLAGS" : [ "-std=c++11", "-stdlib=libc++" ],
            "OTHER_LDFLAGS": [ "-stdlib=libc++" ],
            "MACOSX_DEPLOYMENT_TARGET": "10.7"
          },

        }],
      ],
      'include_dirs': [
         'include',
      ],
      "libraries": [
        "-framework Foundation",
        "-framework Cocoa"
      ]
    }
  ]
}

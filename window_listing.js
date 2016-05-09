"use strict";

module.exports = (function(){
  let exec = require('child_process').exec;
  let path = require('path');
  let bashInterpreter = require('bash-interpreter');
  let svc = {};
  svc.getAll = getAll;
  return svc;

  function getAll(uid){
    var cmd = [];
    if (uid){
      cmd.push('launchctl asuser ' + uid + " ");
    }
    cmd.push('"' + path.resolve(__dirname, "bin/WindowList") + '"');
    return execute(cmd.join('')).then((output)=>{
      return bashInterpreter.parse(output, {
        headers: {
          "PID": "pid",
          "WindowID": "windowId",
          "Title": "windowTitle"
        }
      });
    });
  }


	function execute(cmd) {
    return new Promise((resolve, reject)=>{
      var options = {
  			cwd: path.resolve(process.cwd()),
  			encoding: 'utf8',
  			maxBuffer: 2*1024*1024
  		};
  		var output;
      exec(cmd, options, function(err, stdout, stderr){
        if (!err){
          resolve(stdout);
        } else {
          reject(new Error(err));
        }
      });
    });
	}

})();

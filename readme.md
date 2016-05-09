WindowListing
============

NodeJS package for listing windows (window id, window title, process id, process name) on OS X.

## Getting started

    npm install --save Vegard-/node-window-listing

## Usage

    let windowListing = require('window-listing');
    windowListing.getAll().then((windows)=>{
      console.log(windows);
    });

Output:

    [
      {
        "pid": 70244,
        "pname": "Google Chrome",
        "windowId": 12941,
        "windowTitle": "Vegard-/node-window-listing: NodeJS package for listing windows (window id, window title, process id, process name) on OS X."
      },
      {
        "pid": 70244,
        "pname": "Google Chrome",
        "windowId": 12940
      },
      {
        "pid": 83708,
        "pname": "Atom",
        "windowId": 12910
      },
      ...
    ]

## Specifying UID when retrieving windows

  var myExampleUID = 501;
  let windowListing = require('window-listing');
  windowListing.getAll(myExampleUID).then((windows)=>{
    console.log(windows);
  });

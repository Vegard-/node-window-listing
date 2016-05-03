WindowListing
============

NodeJS package for listing windows (window id, window title, process id, process name) on OS X.

## Getting started

    npm install --save Vegard-/node-window-listing

## Usage

    let windowListing = require('window-listing');
    console.log(windowListing.getAll());

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
      {
        "pid": 83708,
        "pname": "Atom",
        "windowId": 12899,
        "windowTitle": "readme.md — /Users/vader/repositories/node-window-listing"
      },
      {
        "pid": 82964,
        "pname": "SourceTree",
        "windowId": 12896,
        "windowTitle": "node-window-listing (Git)"
      },
      {
        "pid": 82964,
        "pname": "SourceTree",
        "windowId": 12873,
        "windowTitle": "SourceTree"
      },
      {
        "pid": 82964,
        "pname": "SourceTree",
        "windowId": 12872
      },
      {
        "pid": 81633,
        "pname": "Spotify",
        "windowId": 12722
      }
    ]

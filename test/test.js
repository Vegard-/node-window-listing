'use strict';

var windowListing = require('../window_listing');

var assert = require('chai').assert;
describe('Window listing', function() {
  it('should return array of windows.', function (done) {
    windowListing.getAll().then(function(windows){
      console.log('windowListing.getAll()   =', windows);
      assert.isAbove(windows.length > 0, 0, "No windows was found.");
      done();
    }, function(err){
      assert.fail("Failed:", err);
    });
  });
});

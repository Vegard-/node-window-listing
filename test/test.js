'use strict';

var assert = require('assert');
var windowListing = require('../window_listing');

assert(windowListing.getAll().length > 0, "No windows was found.");
console.log('windowListing.getAll() =', windowListing.getAll());

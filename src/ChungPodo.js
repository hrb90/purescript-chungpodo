"use strict";

exports.mergeSafe = function (r) {
  return function (s) {
    return Object.assign({}, r, s);
  }
}
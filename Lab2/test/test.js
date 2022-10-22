var assert = require('assert');
const lib = require('../src/hello');

describe('Array', function () {
  describe('#indexOf()', function () {
    it('should return -1 when the value is not present', function () {
      assert.equal([1, 2, 3].indexOf(4), -1);
    });
  });
});

describe("Hello", function () {
  describe("#hello()", function () {
    it("should return Hello World!", function () {
      assert.equal(lib.hello(), "Hello World!");
    });
  });
});

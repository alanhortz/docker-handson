var assert = require('chai').assert;

describe('Array', function(){
  describe('indexOf()', function(){
    it('should return -1 when the value is not present', function(){
      assert.equal(-1, [1,2,3].indexOf(4));
    });
  });
  
  describe('length', function(){
  	it('should be aqual to 3 when the array contains 3 items', function() {
  		assert.equal(3, [1,2,3].length);
  	});
  });
  
});
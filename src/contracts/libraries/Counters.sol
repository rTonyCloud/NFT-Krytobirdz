// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import './SafeMath.sol';


/** 
* @title Counters
* @author Matt Condon (@Shrugs)
* @dev Provides counters that can only be incremented or decremented by one. This can e.g to track te number
* of elements in a mapping, issuing ERC721 ids, or counting request ids.
* 
* Include with 'using COunters for COunters.COunter;'
* SInce it is not possible to overflow a 256 bit integer with increments of one, 'increment' can skip the SafeMath
* overflow check, thereby saving gas. This does assume however correct usage, in that the underlying '_value' is never
* directly accessed.
*/

library Counters {
    using SafeMath for uint256;

struct Counter {
    uint256 _value;
}

function current(Counter storage counter) internal view returns(uint256) {
    return counter._value;
}

// function that increment by 1
function increment(Counter storage counter) internal {
    counter._value += 1;
}

// function that always decrement by 1 
function decrement(Counter storage counter) internal {
    counter._value = counter._value.sub(1);
}

}

// build your own variable type with the keyword 'struct'
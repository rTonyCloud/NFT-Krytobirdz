// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SafeMath {
    // build functions to perform safe math operations 
    // otherwise replace inutitive preventative measures


    // function add r = x + y
    function add(uint256 x, uint256 y) internal pure returns(uint256) {
        uint256 r = x + y;
            require(r >= x, 'SafeMath: addition Overflow');
        return r;
    }

    // function subtract r = x + y
    function sub(uint256 x, uint256 y) internal pure returns(uint256) {
            require(y <= x, 'SafeMath: substraction Overflow');
        uint256 r = x - y;
    return r;
    }   

    
    // function multiply r = x * y 
    function mul(uint256 x, uint256 y) internal pure returns(uint256) {
        //gass optimization
        if(x == 0) {
            return 0;
        }

        uint256 r = x * y;
            require(r / x == y, 'SafeMath: multiplication overflow');
        return r;
    }

    // function divide r = x / y;
    function divide(uint256 x, uint256 y) internal pure returns(uint256) {
            require(y > 0, 'SafeMath: divide overflow');
            uint256 r = x / y;
        return r;
    }

    // module function r = x % y
    function mod(uint256 x, uint256 y) internal pure returns(uint256) {
            require(y != 0, 'safemath: modulo by zero');
        return x % y;
    }
}
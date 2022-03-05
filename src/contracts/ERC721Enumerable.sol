// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// contract imports
import './ERC721.sol';

import './interfaces/IERC721Enumerable.sol';


contract ERC721Enumerable is IERC721Enumerable, ERC721 {

    uint256[] private _allTokens;

    // mapping from tokenId to position in _allTokens array
    mapping(uint256 => uint256) private _allTokensIndex;
    // mapping of owner to list of all owner token ids
    mapping(address => uint256[]) private _ownedTokens;
    // mapping from token ID index of the owner tokens list
    mapping(uint256 => uint256) private _ownerTokensIndex;

    constructor() {
        _registerInterface(bytes4(keccak256('totalSupply(bytes4)')^
        keccak256('tokenByIndex(bytes4)')^keccak256('tokenOfOwnerByIndex(bytes4)')));
    }



    //function tokenByIndex(uint256 _index) external view returns (uint256);


    //function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256);
    
    function _mint(address to, uint256 tokenId) internal override(ERC721) {
        super._mint(to, tokenId); 
        // 2 things! A. add tokens to the owner
        // B. all tokens to our totalsupply - to allTokens

        _addTokenToAllEnumeration(tokenId);
        _addTokensToOwnerEnumeration(to, tokenId);
    }

    // add tokens to the _alltokens array and set the positin of the tokens indexes
    function _addTokenToAllEnumeration(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }
    
    function _addTokensToOwnerEnumeration(address to, uint256 tokenId) private {
        // Exercise - challenge - DO these three things:
        // 1. add address and token ID to the _ownToken
        // 2. ownedTokensIndex tokenId set to address of ownedTokens position
        // 3. we want to execute the function with minting
        // 4. bonus is to compile and test
        _allTokensIndex[tokenId] = _ownedTokens[to].length;
        _ownedTokens[to].push(tokenId);

    }


    // two functions - one that returns tokenByIndex and
    // another on that returns tokenOfOwnerByIndex

    function tokenByIndex(uint256 index) public override view returns(uint) {
        // make sure the index is not out of bounds of the 
        // total supply

        require(index < totalSupply(), 'Global index is out of bounds!');
        return _allTokens[index];
    }

    function tokenOfOwnerByIndex(address owner, uint index) public override view returns(uint256) {
        require(index < balanceOf(owner), 'owner index is out of bounds!');
        return _ownedTokens[owner][index];
    }

    
    
    // returns the supply to allTokens
    function totalSupply() public override view returns(uint256) {
        return _allTokens.length;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721.sol';


contract ERC721Enumerable is ERC721 {

    uint256[] private _allTokens;

    // mapping from tokenId to position in _allTokens array
    mapping(uint256 => uint256) private _allTokensIndex;
    // mapping of owner to list of all owner token ids
    mapping(address => uint256[]) private _ownedTokens;
    // mapping from token ID index of the owner tokens list
    mapping(uint256 => uint256) private _ownerTokensIndex;


    //function tokenByIndex(uint256 _index) external view returns (uint256);


    //function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256);
    
    function _mint(address to, uint256 tokenId) internal override(ERC721) {
        super._mint(to, tokenId); 
        // 2 things! A. add tokens to the owner
        // B. all tokens to our totalsupply - to allTokens

        _addTokenToTotalSupply(tokenId);
    }

    function _addTokenToTotalSupply(uint256 tokenId) private {

        _allTokens.push(tokenId);
    }

    function totalSupply() public view returns(uint256) {
        return _allTokens.length;
    }
}
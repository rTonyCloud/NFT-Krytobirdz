// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
building the minting function:
a. nft to point to an address
b. keep track of the token ids
c. keep track of token owner addresses to token ids
d. keep track of how many tokens an owner address has
e. create an event that emits a transfer log - contract address, 
    Where it is being minted to, _id.. 
*/


contract ERC721 {
    // creates a log of minting tokens
    event Transfer(
    address from,
    address to, 
    uint256 tokenId); 

    // mapping in solidity create a hash table of keypair value 
    mapping(uint256 => address) private _tokenOwner;

    // mapping from owner to number of owned tokens
    mapping(address => uint256) private _OwnedTokensCount;

    // @notice Cout all NFTs assigned to an owner
    // @dev NFTs assigned to the zero address are considered invalid
    // function throws for queries about the zero address.
    // @param _owner An address for whom to query the balance
    // @return the number of NFTs owned by '_owner', possibly zero

    function balanceOf(address _owner) public view returns(uint256) {
        require(_owner != address(0), 'owner query for non-existent token');
        return _OwnedTokensCount[_owner];
    }

        /// @notice Find the owner of an NFT
    /// @dev NFTs assigned to zero address are considered invalid, and queries
    ///  about them do throw.
    /// @param _tokenId The identifier for an NFT
    /// @return The address of the owner of the NFT
    
    function ownerOf(uint256 _tokenId) external view returns (address) {
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0), 'owner query for non-existent token');
        return owner;
        
    }


    function _exists(uint256 tokenId) internal view returns(bool){
        // setting the address of the nft ownert to check mapping
        // of the address from tokenOwner at the tokenId
        address owner = _tokenOwner[tokenId];
        // returns owner with a valid address that's not zero
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal virtual {
        // requires that the address isn't zero
        require(to != address(0), 'ERC721: minting to the zero address');
        // requires that the token doesn't already exist
        require(!_exists(tokenId), 'ERC721: token aleady minted');
        // adding a new address with a token id for minting
        _tokenOwner[tokenId] = to;
        // mapping address of the tokenCount on with each address minting + 1 to the count.
        _OwnedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './ERC721Connector.sol';

contract Krytobird is ERC721Connector {

        // array to store our NFTs
        string[] public kryptoBirdz;

        mapping(string => bool) _kryptoBirdzExists;

        function mint(string memory _kryptoBird) public {

            require(_kryptoBirdzExists[_kryptoBird],
            'Error - kryptoBIrd already exists');
            // this function is deprecated - uint _id = KryptoBirdz.push(_kryptoBird);
            kryptoBirdz.push(_kryptoBird);
            uint _id = kryptoBirdz.length - 1;

            //.push() no longer returns the length but a ref to the added element

            
            _mint(msg.sender, _id);


            _kryptoBirdzExists[_kryptoBird] = true; 
        
        
        }



    constructor() ERC721Connector('KrytoBird', 'KBIRDZ') {
    {}
    }
    
}


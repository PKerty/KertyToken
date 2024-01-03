//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract KertyToken is ERC20{
    
    constructor(uint256 initialSupply) ERC20("Kerty Token", "KRT") {
        _mint(msg.sender, initialSupply); 
    }


}

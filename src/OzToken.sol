// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OzToken is ERC20 {
    constructor(uint256 _initSupply) ERC20("OzToken", "OZT") {
        _mint(msg.sender, _initSupply);
    }
    
}
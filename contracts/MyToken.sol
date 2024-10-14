// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GYMToken is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("GYMToken", "GYM") Ownable(msg.sender) {
        _mint(msg.sender, initialSupply * (10 ** decimals()));
    }

    // Función para recompensar usuarios con tokens
    function rewardUser(address user, uint256 amount) external onlyOwner {
        require(user != address(0), "Cannot reward the zero address");
        require(amount > 0, "Amount must be greater than 0");
        _mint(user, amount * (10 ** decimals()));
    }

    // Función para canjear tokens por servicios
    function redeemForService(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient tokens");
        _burn(msg.sender, amount);
    }
}



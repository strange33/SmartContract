//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.17;

contract Coin{
    address public minter;

    mapping(address => uint) public balances;

    event Sent(address from,address to,uint ammount);

    constructor(){
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
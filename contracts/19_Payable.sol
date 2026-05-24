// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Teleton {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier isPropietario() {
        require(msg.sender == owner, "No eres el propietario");
        _;
    }

    //
    function depositar() public payable {

    }

    function retirar () public isPropietario {
        //línea deprecada, ya no se utiliza .tranfer()
        //payable(owner).transfer(address(this).balance);
        //estructura corregida
        uint256 balance = address(this).balance;
        (bool success, ) = payable(owner).call{value: balance}("");
        require(success, "La transferencia fallo");
    }

}
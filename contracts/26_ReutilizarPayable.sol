// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

interface ITeleton {
    function depositar() external payable;
    function retirar() external;
    function owner() external view returns (address);

    /*modificadores: 
        - public (acceso desde cualquier parte del contrato)
        - external (acceso solo desde fuera del contrato)
        - private (acceso solo desde dentro del contrato)
        - default 
    */
}

contract TeletonEscolar {

    ITeleton public teleton;

    constructor(address direccionTeleton) {
        teleton = ITeleton(direccionTeleton);
    }

    function donar() public payable {
        teleton.depositar();
    }

    function verOwner() public view returns (address){
        return teleton.owner();
    }

    function cobrar() public {
        teleton.retirar();
    }

}
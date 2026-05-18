// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract Hospital280076 {
    struct Paciente {
        uint id;
        string nombre_paciente;
        uint edad;
    }

    Paciente[]  public pacientes;

    constructor () {
        console.log("Ejecutado por: 280076 - Josue Paulo Pulido Torres");
    }

}
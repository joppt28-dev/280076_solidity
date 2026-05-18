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

    address public dirContrato = address(this);

    constructor () {
        console.log("Ejecutado por: 280076 - Josue Paulo Pulido Torres");
    }

    function agregarElemento(uint _id, string memory _nombre_paciente, uint _edad) public {
        pacientes.push(Paciente(_id, _nombre_paciente, _edad));
    }

    function contarElementos () public view returns (Paciente[] memory){
        console.log("Ejecutado por: 280076 - Josue Paulo Pulido Torres");
        return pacientes;
    }

    
}
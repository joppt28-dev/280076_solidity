// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract Hospital280076 {
    struct Paciente {
        uint id;
        string nombre_paciente;
        uint edad;
        bool estado;
    }

    Paciente[]  public pacientes;

    address public dirContrato = address(this);

    modifier consultadoPor() {
        console.log("Ejecutado por: 280076 - Josue Paulo Pulido Torres");
        _;
    }

    constructor () consultadoPor{
    }

    function agregarElemento(uint _id, string memory _nombre_paciente, uint _edad, bool _estado) public consultadoPor {
        for (uint i = 0; i < pacientes.length; i++) {
            require(pacientes[i].id != _id, "Error: El ID del paciente ya se encuentra registrado.");
        }
        require(_edad > 10, "La edad debe ser mayor a 10");
        pacientes.push(Paciente(_id, _nombre_paciente, _edad, _estado));
    }

    function contarElementos () public view consultadoPor returns (Paciente[] memory) {
        return pacientes;
    }

}
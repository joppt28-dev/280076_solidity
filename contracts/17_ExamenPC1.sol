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

    //Paciente[]  public pacientes;
    mapping (uint => Paciente) public pacientes;

    uint[] public idsPacientes;

    address public dirContrato = address(this);

    uint256 cantidad;

    modifier consultadoPor() {
        console.log("Ejecutado por: 280076 - Josue Paulo Pulido Torres");
        _;
    }

    constructor () consultadoPor{
    }

    function agregarElemento(uint _id, string memory _nombre_paciente, uint _edad, bool _estado) public consultadoPor {
        require(pacientes[_id].id == 0, "Error: El ID del paciente ya se encuentra registrado.");
        require(_edad > 10, "La edad debe ser mayor a 10");
        pacientes[_id]= Paciente(_id, _nombre_paciente, _edad, _estado);
        idsPacientes.push(_id);
        cantidad ++;
    }

    function contarElementos () public view consultadoPor returns (Paciente[] memory) {
        Paciente[] memory p = new Paciente[](cantidad);
        for (uint i = 0; i < idsPacientes.length; i++) {
            uint idActual = idsPacientes[i];
            p[i] = pacientes[idActual];
        }
        return p;
    }

    function inactivarElemento (uint _id) public {
        pacientes[_id].estado = false;
    }

    function mostrarElementosActivos() public consultadoPor{
        for (uint i = 0; i < idsPacientes.length; i++) {
            uint idActual = idsPacientes[i];
            if (pacientes[idActual].estado == true) {
                console.log("Paciente activo : ID:", pacientes[idActual].id, "| Nombre:", pacientes[idActual].nombre_paciente);
            }
        }
    }

    function mostrarElementosImpares() public consultadoPor {
        for (uint i = 0; i < idsPacientes.length; i++) {
            uint idActual = idsPacientes[i];
            if (idActual % 2 != 0) {
                console.log("Paciente ID Impar : ID:", pacientes[idActual].id, "| Nombre:", pacientes[idActual].nombre_paciente);
            }
        }
    }

}
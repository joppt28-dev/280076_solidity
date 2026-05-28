// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract BibliotecaSimple {
    struct Libro {
        uint id;
        string titulo;
        bool prestado;
    }

    mapping (uint => Libro) private libros;

    event RegistroDeLibro(address invocador, uint _id ,string _titulo);
    event PrestamoDeLibro(address invocador, uint _id, string _titulo, bool _estado);

    function registrarLibro (uint _id, string memory nombre) public {
        require(_id > 99, "El id debe ser mayor a 99");
        require(libros[_id].id == 0, "Libro ya existe");
        libros[_id] = Libro(_id, nombre, false);
        emit RegistroDeLibro(msg.sender, _id, nombre);
    }

    function obtenerLibro (uint i) public view returns (uint, string memory, bool) {
        Libro memory l = libros[i];
        return (l.id, l.titulo, l.prestado);
    }

    function prestarLibro(uint _id) public {
        require(libros[_id].id != 0, "Libro no existe");
        require(libros[_id].prestado == false, "El libro esta prestado");
        libros[_id].prestado = true;
        emit PrestamoDeLibro(msg.sender, libros[_id].id, libros[_id].titulo, libros[_id].prestado);
    }
}
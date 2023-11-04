
class Venta{
  late Cliente cliente;
  late int valor;
  late DateTime fechaDePago;
  Venta(this.cliente,this.valor,this.fechaDePago);
}

class Cliente{
  late String nombre;
  late DateTime fecha;
  late DateTime nacimiento;
  Cliente(this.nombre, this.fecha, this.nacimiento);
}

List<Venta> ventas = [
];

List<Cliente> clientes = [
Cliente("Ana Gómez", DateTime(2023, 7, 2), DateTime(1995, 2, 15)),
Cliente("Pedro Martínez", DateTime(2022, 5, 10), DateTime(1992, 9, 5)),
Cliente("María Sánchez", DateTime(2023, 1, 20), DateTime(1990, 12, 3)),
Cliente("Juan López", DateTime(2022, 11, 5), DateTime(1998, 7, 18)),
Cliente("Sara Fernández", DateTime(2023, 9, 12), DateTime(2002, 3, 25)),
Cliente("Carlos Rodríguez", DateTime(2022, 3, 30), DateTime(1994, 5, 8)),
Cliente("Laura Pérez", DateTime(2023, 4, 8), DateTime(1999, 8, 14)),
Cliente("Miguel García", DateTime(2022, 6, 16), DateTime(2000, 10, 20)),
Cliente("Lucía Martín", DateTime(2023, 8, 25), DateTime(1997, 6, 30)),
Cliente("Javier Díaz", DateTime(2022, 10, 3), DateTime(2004, 4, 10)),
Cliente("Paula Moreno", DateTime(2023, 12, 1), DateTime(2001, 1, 5)),
Cliente("Andrés Vázquez", DateTime(2022, 2, 14), DateTime(1993, 11, 23)),
Cliente("Carmen Ruiz", DateTime(2023, 6, 5), DateTime(1996, 4, 12)),
Cliente("Diego Gutiérrez", DateTime(2022, 7, 19), DateTime(1991, 10, 3)),
Cliente("Marta Jiménez", DateTime(2023, 5, 27), DateTime(1998, 9, 16)),
Cliente("Roberto López", DateTime(2022, 9, 8), DateTime(1999, 5, 27)),
Cliente("Elena Sánchez", DateTime(2023, 2, 11), DateTime(2003, 2, 8)),
Cliente("Antonio González", DateTime(2022, 4, 30), DateTime(1996, 11, 17)),
Cliente("Isabel Fernández", DateTime(2023, 10, 17), DateTime(2000, 7, 22)),
Cliente("Raúl García", DateTime(2022, 12, 23), DateTime(1997, 6, 29)),
Cliente("Nuria Rodríguez", DateTime(2023, 3, 9), DateTime(1994, 1, 9)),
Cliente("Óscar Martínez", DateTime(2022, 8, 13), DateTime(2002, 8, 30)),
Cliente("Silvia Pérez", DateTime(2023, 11, 18), DateTime(1992, 4, 17)),
Cliente("Ricardo Sánchez", DateTime(2022, 1, 29), DateTime(1995, 3, 12)),
Cliente("Celia López", DateTime(2023, 7, 4), DateTime(2001, 9, 1)),
Cliente("Hugo Díaz", DateTime(2022, 10, 20), DateTime(1998, 12, 8)),
Cliente("Luisa Moreno", DateTime(2023, 9, 6), DateTime(1993, 5, 30)),
Cliente("Gonzalo Vázquez", DateTime(2022, 5, 14), DateTime(2004, 6, 14)),
Cliente("Patricia Ruiz", DateTime(2023, 12, 25), DateTime(1991, 8, 11)),
Cliente("Mario Gutiérrez", DateTime(2022, 6, 27), DateTime(1999, 4, 6)),

];


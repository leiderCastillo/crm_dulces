

import 'package:crm_dulces/estructuras.dart';

int edad(DateTime nacimiento){
  int yearNacimiento = nacimiento.year;
  int yearActual = DateTime.now().year;
  return yearActual - yearNacimiento;
}

String fecha(DateTime tiempo){
  return "${tiempo.day}/${tiempo.month}/${tiempo.year}";
}

List<Cliente> busquedaNombre(String nombre,List<Cliente> listaClientes){
  return listaClientes.where(
    (usuario) {
      return usuario.nombre.toLowerCase().contains(nombre.toLowerCase());
    }
  ).toList();
}

List<Venta> busquedaNombreVenta(String nombre,List<Venta> listaVenta){
  return listaVenta.where(
    (venta) {
      return venta.cliente.nombre.toLowerCase().contains(nombre.toLowerCase());
    }
  ).toList();
}

int parseoInt(String valor){
  String variable = valor.trim().replaceAll(" ", "");
  return int.parse(variable);
}


int obtenerVentas(){
  int ventasto = 0;
  for (var venta in ventas) {
    ventasto = venta.valor + ventasto;
  }
  return ventasto;
}

List<double> obtenerPorcentEdad(){
  double v10=0;
  double v20=0;
  double v40=0;
  double v80=0;
  int total = clientes.length;

  for (var cliente in clientes) {
    double edads  = edad(cliente.nacimiento).toDouble();
    if(edads <= 10){
      v10 = edads;
    }else if(edads <= 20){
      v20 = edads;
    }else if(edads <= 40){
      v40 = edads;
    }else{
      v80 = edads;
    }
  }

  v10 = v10 * 100 / total;
  v20 = v20 * 100 / total;
  v40 = v40 * 100 / total;
  v80 = v80 * 100 / total;

  return [v10,v20,v40,v80];
}

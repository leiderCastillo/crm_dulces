

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crm_dulces/estructuras.dart';
import 'package:crm_dulces/interfaces/ventas%20copy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      String nombreListaNormalizado =  usuario.nombre.toLowerCase();
      String nombreBusquedaNormalizado = nombre.toLowerCase();
      return nombreListaNormalizado.characters.containsAll(nombreBusquedaNormalizado.characters);
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
  try{
    return int.parse(variable);
  }catch(e){
    return 872556477388;
  }
  
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
    print("edad: $edads");
    if(edads <= 10){
      v10 +=1;
    }else if(edads <= 20){
      v20 +=1;
    }else if(edads <= 40){
      v40 +=1;
    }else{
      v80 +=1;
    }
    
  }

  v10 = double.parse((v10 * 100 / total).toStringAsFixed(1));
  v20 = double.parse((v20 * 100 / total).toStringAsFixed(1));
  v40 = double.parse((v40 * 100 / total).toStringAsFixed(1));
  v80 = double.parse((v80 * 100 / total).toStringAsFixed(1));
  if(v10.isNaN &
  v20.isNaN &
  v40.isNaN &
  v80.isNaN){
    return [];
  }else{
    return [v10,v20,v40,v80];
  }
  
}


List<UsuarioVenta> topClientes(){
  print("saquiiiiasuidauisda");
  List<Venta> tempVentas = ventas;
  List<Cliente> tempClientes = clientes;
  List<UsuarioVenta> top  = [];
  for (var cliente in tempClientes) {
    int valores = (tempVentas.where((element) => element.cliente == cliente)).toList().length;
    top.add(UsuarioVenta(cliente: cliente, compra: valores));
  }
  top.sort((a, b) => b.compra.compareTo( a.compra));
  top.removeWhere((element) => element.compra == 0);
  return top;
}
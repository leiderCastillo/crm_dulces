import 'package:crm_dulces/estilos.dart';
import 'package:crm_dulces/estructuras.dart';
import 'package:crm_dulces/funciones.dart';
import 'package:crm_dulces/interfaces/menu.dart';
import 'package:crm_dulces/interfaces/widgets.dart';
import 'package:flutter/material.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  bool modoBusqueda = false;
  TextEditingController controllerBuscador = TextEditingController();
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerNacimiento = TextEditingController();
  DateTime nacimientoTemp = DateTime(0);
  List<Cliente> clientestemp = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ancho = MediaQuery.of(context).size.width;
    alto = MediaQuery.of(context).size.height;
    return Expanded(
        child: ListView(
      children: [
        const AppBarApp(titulo: "Clientes"),
        Container(
          padding: EdgeInsets.all(ancho > 500 ? 20 : 10),
          margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: Colors.grey.shade200,
                    offset: Offset(0, 10))
              ]),
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Agregar nuevo cliente",style: fuenteSeleccionada1),
              const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                    child: 
                    TextField(
                      controller: controllerNombre,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)
                        )),
                        labelText: "Nombre Completo"
                      ),
                  )
                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 2,
                    child: TextField(
                      controller: controllerNacimiento,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)
                        )),
                        labelText: "Fecha de nacimiento"
                      ),
                      onTap: () {
                        showDatePicker(
                                initialEntryMode:
                                    DatePickerEntryMode.calendarOnly,
                                initialDatePickerMode: DatePickerMode.year,
                                context: context,
                                initialDate: nacimientoTemp != DateTime(0)
                                    ? nacimientoTemp
                                    : DateTime.now(),
                                firstDate: DateTime(1960),
                                lastDate: DateTime.now())
                            .then((value) {
                          if (value != null) {
                            nacimientoTemp = value!;
                            controllerNacimiento.text = fecha(nacimientoTemp);
                          }
                        });
                      },
                    )),
                    SizedBox(width: 10,),
                BotonIconAppBar(
                    onPressed: () {
                      if (controllerNacimiento.text.isNotEmpty &&
                          controllerNombre.text.isNotEmpty) {
                        setState(() {
                          clientes.add(Cliente(controllerNombre.text,
                              DateTime.now(), nacimientoTemp));
                          nacimientoTemp = DateTime(0);
                          controllerNombre.text = "";
                          controllerNacimiento.text = "";
                          modoBusqueda = false;
                        });
                      } else {
                        print("Error, no ingreso un dato");
                      }
                    },
                    icono: Icons.group_add_outlined,
                    ),
              ],
            ),
            ],
          )
        ),
        Container(
            height: 70,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                            BoxShadow(
                                blurRadius: 20,
                                color: Colors.grey.shade200,
                                offset: Offset(0, 10))
                            ],
                        ),
                        child: TextField(
                          controller: controllerBuscador,
                          decoration: const InputDecoration(
                              hintText: "Buscar por nombre",
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none),
                          onChanged: (value) {
                            setState(() {
                              clientestemp = busquedaNombre(
                                  controllerBuscador.text, clientes);
                              modoBusqueda = true;
                              setState(() {});
                            });
                          },
                        ))),
                const SizedBox(
                  width: 10,
                ),
                AnimatedContainer(
                  curve: Curves.ease,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  height: 70,
                  width: controllerBuscador.text.isNotEmpty ? 140 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("   Buscando.."),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            controllerBuscador.text = "";
                            modoBusqueda = false;
                          });
                        },
                        icon: Icon(Icons.close))
                    ],
                  )
                )
              ],
            )),
        const SizedBox(
          height: 6,
        ),
        if (clientes.isNotEmpty)Container(
          padding: EdgeInsets.all(ancho > 500 ? 10 : 2),
          margin: EdgeInsets.fromLTRB(10,0, 10, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [        
            BoxShadow(
                blurRadius: 20,
                color: Colors.grey.shade200,
                offset: Offset(0, 10))
            ]
          ),
          child:
          DataTable(
              columnSpacing: 5,
              columns: [
                DataColumn(
                    label: Text(
                      textAlign: TextAlign.left,
                  "Nombre",
                  style: fuenteTablaTitulo,
                )),
                DataColumn(
                    label: Text(
                  "Edad",
                  style: fuenteTablaTitulo,
                )),
                DataColumn(
                    label: Text(
                  "Registro",
                  style: fuenteTablaTitulo,
                )),
                DataColumn(
                    label: Text(
                  "Editar",
                  style: fuenteTablaTitulo,
                )),
                DataColumn(
                    label: Text(
                  "Eliminar",
                  style: fuenteTablaTitulo,
                )),
              ],
              rows: modoBusqueda
                  ? clientestemp.reversed.map((cliente) {
                      return DataRow(cells: [
                        DataCell(Text(cliente.nombre)),
                        DataCell(Text(edad(cliente.nacimiento).toString())),
                        DataCell(Text(fecha(cliente.fecha))),
                        DataCell(BotonIcon(
                          icono: Icons.edit,
                          onPressed: () {},
                        )),
                        DataCell(BotonIcon(
                          icono: Icons.delete_outline,
                          onPressed: () {
                            print("mensaje");
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Advertencia"),
                                  content: Text.rich(
                                    TextSpan(
                                      text: "Está a punto de eliminar al cliente ",
                                      children: [
                                        TextSpan(text: " \"${cliente.nombre}\" ",style: fuenteSeleccionada1),
                                        TextSpan(text: "y todos sus registros, incluyendo los registros de ventas.\n¿Está seguro de proceder con la eliminación de este cliente?")
                                      ]
                                    )
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancelar")
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                        foregroundColor: Colors.white
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          clientes.removeWhere((element) => element == cliente);
                                          clientestemp.removeWhere((element) => element == cliente);
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cliente eliminado")));
                                        Navigator.pop(context);
                                      },
                                      child: Text("Eliminar")
                                    ),
                                  ],
                                );
                              },
                            );
                          
                          },
                        )),
                      ]);
                    }).toList()
                  : clientes.reversed.map((cliente) {
                      return DataRow(cells: [
                        DataCell(Text(cliente.nombre)),
                        DataCell(Text(edad(cliente.nacimiento).toString())),
                        DataCell(Text(fecha(cliente.fecha))),
                        DataCell(BotonIcon(
                          icono: Icons.edit,
                          onPressed: () {},
                        )),
                        DataCell(BotonIcon(
                          icono: Icons.delete_outline,
                          onPressed: () {
                            print("mensaje");
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Advertencia"),
                                  content: Text.rich(
                                    TextSpan(
                                      text: "Está a punto de eliminar al cliente ",
                                      children: [
                                        TextSpan(text: " \"${cliente.nombre}\" ",style: fuenteSeleccionada1),
                                        TextSpan(text: "y todos sus registros, incluyendo los registros de ventas.\n¿Está seguro de proceder con la eliminación de este cliente?")
                                      ]
                                    )
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancelar")
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                        foregroundColor: Colors.white
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          clientes.removeWhere((element) => element == cliente);
                                          clientestemp.removeWhere((element) => element == cliente);
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cliente eliminado")));
                                        Navigator.pop(context);
                                      },
                                      child: Text("Eliminar")
                                    ),
                                  ],
                                );
                              },
                            );
                          
                          },
                        )),
                      ]);
                    }).toList())
        )],
    ));
  }
}

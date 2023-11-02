import 'package:crm_dulces/estilos.dart';
import 'package:crm_dulces/estructuras.dart';
import 'package:crm_dulces/funciones.dart';
import 'package:crm_dulces/interfaces/menu.dart';
import 'package:crm_dulces/interfaces/widgets.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: 
        CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: AppBarApp(
                titulo: "Dashboard",
              )
            ),
            SliverToBoxAdapter(
              child: 
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,20,0),
                child:Text(
                  "Datos",
                  style: fuenteSubtitulo,
                  textScaleFactor: 1.6,
                )
              )
            ),
            SliverToBoxAdapter(
              child: Wrap(
                alignment:WrapAlignment.center,
                children: [
                  CardDashBoard(
                    imgDireccion: "./assets/money.png",
                    Dato: "\$ ${obtenerVentas()}",
                    titulo: "Total de ventas"
                  ),
                  CardDashBoard(
                    imgDireccion: "./assets/target.png",
                    Dato: "${clientes.length}",
                    titulo: "Clientes Registrados"
                  ),
                  CardDashBoard(
                    imgDireccion: "./assets/customer.png",
                    Dato: "\$ $totalVenta",
                    titulo: "Clientes en los últimos 30 dias"
                  ),
                  CardDashBoard(
                    imgDireccion: "./assets/meeting.png",
                    Dato: "\$ $totalVenta",
                    titulo: "Clientes en el último año"
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: 
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,20,20),
                child:Text(
                  "Estadísticas",
                  style: fuenteSubtitulo,
                  textScaleFactor: 1.6,
                )
              )
            ),
            SliverToBoxAdapter(
              child:Wrap(
                alignment: WrapAlignment.center,
                children: [
                  CardGCirculo(
                    porcentajes: obtenerPorcentEdad(),
                    colores: [Colors.red,Colors.blue,Colors.purple,Colors.amber],
                    titulos: ["1-10","11-20","20-40","40-80"],
                  ),
                ],
              )
            )
          ],
        )
    
    );
  }
}
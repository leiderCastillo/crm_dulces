import 'package:crm_dulces/estilos.dart';
import 'package:crm_dulces/interfaces/menu.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BotonIconAppBar extends StatefulWidget {
  final IconData icono;
  final VoidCallback onPressed;
  const BotonIconAppBar({
      super.key,required this.onPressed,required this.icono,
  });

  @override
  State<BotonIconAppBar> createState() => _BotonIconAppBarState();
}

class _BotonIconAppBarState extends State<BotonIconAppBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.fromLTRB(6,6,6,6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icono,size: 30,),
          ],
        ),
      ),
    );
  }
}


class BotonIcon extends StatefulWidget {
  final IconData icono;
  final VoidCallback onPressed;
  const BotonIcon({
      super.key,required this.onPressed,required this.icono,
  });

  @override
  State<BotonIcon> createState() => _BotonIconState();
}

class _BotonIconState extends State<BotonIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.fromLTRB(6,6,6,6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(82, 243, 243, 48)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icono),
          ],
        ),
      ),
    );
  }
}


class BotonIcono extends StatefulWidget {
  final String texto;
  final IconData icono;
  final VoidCallback onPressed;
  const BotonIcono({
      super.key,required this.onPressed, required this.texto, required this.icono,
  });

  @override
  State<BotonIcono> createState() => _BotonIconoState();
}

class _BotonIconoState extends State<BotonIcono> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(10,5,10,5),
        padding: const EdgeInsets.fromLTRB(20,6,20,6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amberAccent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icono),
            const SizedBox(width: 10,),
            Text(widget.texto)
          ],
        ),
      ),
    );
  }
}


class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.fromLTRB(10,5,10,5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CircleAvatar(
            minRadius: 20,
            maxRadius: 50,
          ),
          SizedBox(height: 10,),
          Text("Leider Castillo"),
          Text("Administrador"),
          BotonIcono(
            onPressed: (){},
            texto:"Salir",
            icono: Icons.exit_to_app
          )
        ],
      ),
    );
  }
}
//onTap: () {},
              //title: Text("Ventas",style:vista == 2 ? fuenteSeleccionada1 : fuenteNoSeleccionada1),
              //leading

class BotonMenu extends StatefulWidget {
  final bool activo;
  final VoidCallback onPressed;
  final String title;
  final IconData icono; 
  const BotonMenu({super.key, required this.activo, required this.onPressed, required this.title, required this.icono});

  @override
  State<BotonMenu> createState() => _BotonMenuState();
}

class _BotonMenuState extends State<BotonMenu> {
  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: 
    AnimatedContainer(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.fromLTRB(10,5,10,5),
      margin: EdgeInsets.fromLTRB(10,5,10,5),
      decoration: BoxDecoration(
        color: widget.activo ? Colors.amberAccent : Colors.amber,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Icon(widget.icono),
          const SizedBox(width: 10,),
          Text(widget.title,style: TextStyle(fontWeight: widget.activo ? FontWeight.bold : FontWeight.normal),)
        ],
      ),
    )
    );
  }
}


class BotonMenuIcono extends StatefulWidget {
  final bool activo;
  final VoidCallback onPressed;
  final String title;
  final IconData icono; 
  const BotonMenuIcono({super.key, required this.activo, required this.onPressed, required this.title, required this.icono});

  @override
  State<BotonMenuIcono> createState() => _BotonMenuIconoState();
}

class _BotonMenuIconoState extends State<BotonMenuIcono> {
  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: 
    AnimatedContainer(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.fromLTRB(10,0,10,0),
      decoration: BoxDecoration(
        color: widget.activo ? Colors.amberAccent : Colors.amber,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Icon(widget.icono),
      
    )
    );
  }
}


class AppBarApp extends StatelessWidget {
  final String titulo;
  const AppBarApp({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        color: Colors.amberAccent,
        boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Colors.grey.shade200,
                offset: Offset(0, 10))
            ],
      ),
      margin: EdgeInsets.fromLTRB(ancho>500?5:10,10,10,10),
      
      width: ancho,
      padding: EdgeInsets.fromLTRB(20,20,20,20),
      child: Text(titulo,style: titulo2,),
      
    );
  }
}

class CardDashBoard extends StatelessWidget {
  final String imgDireccion;
  final String Dato;
  final String titulo;
  const CardDashBoard({super.key,required this.imgDireccion, required this.Dato, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 250,
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.fromLTRB(20,10,20,10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 245, 245, 245),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color.fromARGB(76, 158, 158, 158),
            offset: Offset(0,10)
          )
        ]
      ),child: Column(
        children: [
          Expanded(
            child: Image.asset(imgDireccion),
          ),
          Text(Dato,textScaleFactor: 1.6,),
          Text(titulo,style: fuenteTablaTitulo,)
        ],
      ),
    );
  }
}


class CardGCirculo extends StatelessWidget {
  final List<double> porcentajes;
  final List<String> titulos;
  final List<Color> colores;
  const CardGCirculo({super.key, required this.porcentajes, required this.titulos, required this.colores});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 250,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(20,10,20,10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 245, 245, 245),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color.fromARGB(76, 158, 158, 158),
            offset: Offset(0,10)
          )
        ]
      ),
      child:
    
      PieChart(
        swapAnimationCurve: Curves.easeInOutBack,
        swapAnimationDuration: const Duration(milliseconds: 200),
        PieChartData(
          sectionsSpace: 20,
          sections: titulos.map((e) {
            int index  = titulos.indexWhere((element) => element == e);
            return PieChartSectionData(
              titleStyle: TextStyle(fontWeight: FontWeight.bold),
              showTitle: true,
              radius: 60,
              color: colores[index],
              title: titulos[index],
              value: porcentajes[index],
            );
          }
          ).toList()
        )
      )
    );
  }
}
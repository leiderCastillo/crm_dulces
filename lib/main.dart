import 'package:crm_dulces/estilos.dart';
import 'package:crm_dulces/interfaces/clientes.dart';
import 'package:crm_dulces/interfaces/sugerencias.dart';
import 'package:crm_dulces/interfaces/ventas.dart';
import 'package:crm_dulces/interfaces/widgets.dart';
import 'package:flutter/material.dart';
import 'package:crm_dulces/interfaces/dashboard.dart';



double ancho = 0;
double alto = 0;
int vista = 0;

void main() {

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRM CANBYTE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CRM CANBYTE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    ancho = MediaQuery.of(context).size.width;
    alto = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: 
      ancho >= 500 ? 
      Row(
        children: [ 
        Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            boxShadow: [
                            BoxShadow(
                                blurRadius: 20,
                                color: Colors.grey.shade200,
                                offset: Offset(0, 10))
                            ],
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              opacity: 1.4,
              colorFilter: ColorFilter.mode(Colors.amber, BlendMode.color),
              fit: BoxFit.cover,
              image: Image.asset("./assets/fondo.jpg").image
            )
          ),
          width: 200,
          child: 
            Column(
              children: [
                const SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.all(10),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("CRM CANBYTE",style: titulo,),
                      if(ancho < 300)IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.close)
                      )
                    ],
                  )
                ),
                BotonMenu(
                  activo: vista == 0,
                  onPressed: () {
                    setState(() {
                      vista = 0;
                    });
                  },
                  title: "Resúmen",
                  icono: Icons.data_thresholding_outlined,
                ),
                BotonMenu(
                  activo: vista == 1,
                  onPressed: () {
                    setState(() {
                      vista = 1;
                    });
                  },
                  title: "Clientes",
                  icono: Icons.group_outlined,
                ),
                BotonMenu(
                  activo: vista == 2,
                  onPressed: () {
                    setState(() {
                      vista = 2;
                    });
                  },
                  title: "Ventas",
                  icono: Icons.shopping_bag_outlined,
                ),
                BotonMenu(
                  activo: vista == 3,
                  onPressed: () {
                    setState(() {
                      vista = 3;
                    });
                  },
                  title: "Sugerencias",
                  icono: Icons.question_answer_outlined,
                ),
                const Spacer(flex: 10,),
                BotonIcono(
                  onPressed: (){print("ia");},
                  texto: "Chat IA",
                  icono: Icons.view_in_ar_rounded
                ),
                BotonIcono(
                  onPressed: (){print("Preferencias");},
                  texto: "Settings",
                  icono: Icons.settings
                ),

                const Admin()
              ],
            )
        ),
        if(vista==0)const Dashboard(),
        if(vista==1)const Clientes(),
        if(vista==2)const Ventas(),
        if(vista==3)const Sugerencias(),
        ],
      )://VERSION MOBIL
      Column(
        children: [ 
        if(vista==0)const Dashboard(),
        if(vista==1)const Clientes(),
        if(vista==2)const Ventas(),
        if(vista==3)const Sugerencias(),

        Container(
          color: Colors.amber,
          width: ancho,
          padding: const EdgeInsetsDirectional.all(10),
          //height: 20,
          child: 
            Row(
              children: [
                const SizedBox(height: 10,),
                BotonMenuIcono(
                  activo: vista == 0,
                  onPressed: () {
                    setState(() {
                      vista = 0;
                    });
                  },
                  title: "Resúmen",
                  icono: Icons.data_thresholding_outlined,
                ),
                BotonMenuIcono(
                  activo: vista == 1,
                  onPressed: () {
                    setState(() {
                      vista = 1;
                    });
                  },
                  title: "Clientes",
                  icono: Icons.group_outlined,
                ),
                BotonMenuIcono(
                  activo: vista == 2,
                  onPressed: () {
                    setState(() {
                      vista = 2;
                    });
                  },
                  title: "Ventas",
                  icono: Icons.shopping_bag_outlined,
                ),
                BotonMenuIcono(
                  activo: vista == 3,
                  onPressed: () {
                    setState(() {
                      vista = 3;
                    });
                  },
                  title: "Sugerencia",
                  icono: Icons.question_answer_outlined,
                ),
                const Spacer(flex: 10,),
                BotonMenuIcono(
                  activo: vista == 5,
                  onPressed: (){print("ia");},
                  title: "Chat IA",
                  icono: Icons.view_in_ar_rounded
                ),
                BotonMenuIcono(
                  activo: vista == 6,
                  onPressed: (){print("Preferencias");},
                  title: "Settings",
                  icono: Icons.settings
                ),
              ],
            )
        ),
        
        ],
      )

    );
    
  }
}

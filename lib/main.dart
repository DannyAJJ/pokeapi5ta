import 'dart:async';
import 'package:pokeapi5ta/pokenombre.dart' as nomm; 
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'globales.dart' as glob;


Future<nomm.Pokenombre> nombres() async{

  var respuesta = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=156&offset=493'));
  var data = jsonDecode(respuesta.body);
  var dato = nomm.Pokenombre.fromJson(data);
  return dato;

}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unova Pokedex',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Unova Pokedex'),
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
  void initState() {

    super.initState();
    
    glob.data= nombres();

  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:
      Stack(
        children: [
           Image(image: const AssetImage('assets/fondo3.jpg'),width: MediaQuery.sizeOf(context).width,height: MediaQuery.sizeOf(context).height,fit: BoxFit.fill,),
          Row(children: [
            Expanded(flex: 38,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, MediaQuery.sizeOf(context).width*0.25, 0, 0),
                child: const Imagen(),
              )),
            Expanded( flex: 62,
              child: FutureBuilder(
                future: glob.data,
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return ListView.builder(
                              itemCount: 156,
                              itemBuilder: (BuildContext context, int index) {
                                return  Baner(
                                  id: index+494,
                                  data: snapshot.data as nomm.Pokenombre,
                                );
                              }
                            );
                  }else{
                    return const CircularProgressIndicator();
                  }
              
                }
              ))
          ],),
        ],
      )
    );
  }
}

class Imagen extends StatefulWidget {
  const Imagen({
    super.key,
  });
  @override
  State<Imagen> createState() => _ImagenState();
}

class _ImagenState extends State<Imagen> {
  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
                
                onTap: () {
                  Timer.periodic(const Duration(milliseconds: 400), (timer) {
                    setState(() {
                    glob.subieja;
                  });
                  });
                  
                },
                child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${glob.subieja}.png',width: MediaQuery.sizeOf(context).width*0.5,fit: BoxFit.fitWidth,),
              ); 
    
  }
}


class Baner extends StatefulWidget {
  
  const Baner({
    super.key,
    required this.id, 
    required this.data,
  });
  final int id;
  final nomm.Pokenombre data;

  @override
  State<Baner> createState() => _BanerState();
}

class _BanerState extends State<Baner> {
  
  @override
  Widget build(BuildContext context) {
    String idt= '';
    int idreal = widget.id-493;
    if(idreal<100){if(idreal<10){idt='00$idreal';}else{idt='0$idreal';}}else{idt=idreal.toString();}
    return GestureDetector(
      onTap: () {
        glob.subieja = widget.id;
      },
      child: Stack(
        children: [
        SvgPicture.asset("assets/banner.svg",
            //width: MediaQuery.of(context).size.width,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.of(context).size.width/11,
            allowDrawingOutsideViewBox: true,
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width*0.015,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/11,
              child:
               Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.id}.png",width: MediaQuery.sizeOf(context).width,)),
            SizedBox(
              width: MediaQuery.sizeOf(context).width*0.1,
            ),
             //Text(glob.nombres[widget.id-494], style: const TextStyle(color: Colors.white)),
             Text('${idt} ', style: const TextStyle(color: Colors.white)),
             Text('${widget.data.results[widget.id-494].name.toString().characters.first.toUpperCase()}${widget.data.results[widget.id-494].name.toString().characters.getRange(1,widget.data.results[widget.id-494].name.toString().length)}', style: const TextStyle(color: Colors.white, fontFamily: 'pokemon pixel', fontSize: 20)),
          ],
        )
      
      ],),
    );
  }
}

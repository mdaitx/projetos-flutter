import 'package:flutter/material.dart';
import 'package:tde_aula_12/services/character_service.dart';

import 'models/character.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CharacterService service = CharacterService();

  late Future<List<Character>> _personagensFuture;
  late List<Character> _personagens;
  late List<Character> _personagensFiltrados;

  @override
  void initState() {
    super.initState();
    _personagensFuture = _getCharacters();
  }

  Future<List<Character>>_getCharacters() async {
    _personagens = await service.getCharacter();
    _personagensFiltrados = _personagens;
    return _personagens;
  }

  _filtroPersonagens(String filtro) {
    setState(() {
      _personagensFiltrados = _personagens.where((item) => item.name.toLowerCase().contains(filtro.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personagens"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  _filtroPersonagens(value);
               },
                  decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText:"Filtro"),
              ),
            ),
            FutureBuilder<List<Character>>(
                future: _personagensFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ListView.separated(
                            itemBuilder: (context, index){
                              return ListTile(
                                title: Text(_personagensFiltrados[index].name),
                                leading: Image.network(snapshot.data![index].image),
                              );
                            },
                            separatorBuilder: (context, int) {
                              return Divider();},
                            itemCount: _personagensFiltrados.length),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text("Erro ao carregar os dados");
                  }


                    return Center(child:CircularProgressIndicator());
                }),
          ],
        ),
      ),
    );
  }
}

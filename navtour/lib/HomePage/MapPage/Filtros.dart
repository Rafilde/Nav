import 'package:flutter/material.dart';
import 'package:navtour/HomePage/MapPage/Explorar.dart';

/*void main() {
  runApp(FilterPage());
}*/

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
            tooltip: 'Back',
            onPressed: () {
                Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Categorias',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: _buildCategoryTags(
                  'Entretenimento',
                  [
                    'Parques',
                    'Academia',
                    'Filmes para viagem',
                    'Atrações',
                    'Vida noturna',
                    'Museus',
                    'Bibliotecas',
                    'Entrega',
                    'Música ao vivo',
                  ],
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(65, 0, 0, 0),
                      blurRadius: 2.0,
                      spreadRadius: 0,
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16.0), // Espaço vertical entre categorias
              Container(
                child: _buildCategoryTags(
                  'Compras',
                  [
                    'Supermercados',
                    'Cosméticos',
                    'Concessionárias',
                    'Casa de jardim',
                    'Vestuário',
                    'Shopping centers',
                    'Eletrônicos',
                    'Artigos esportivos',
                    'Conveniência',
                  ],
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(65, 0, 0, 0),
                      blurRadius: 2.0,
                      spreadRadius: 0,
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16.0), // Espaço vertical entre categorias
              Container(
                child: _buildCategoryTags(
                  'Serviços',
                  [
                    'Banco 24h',
                    'Salão de beleza',
                    'Gasolina',
                    'Alugar carro',
                    'Hotéis',
                    'Lava-rápido',
                    'Lavagem a seco',
                    'Hospitais e clínicas',
                    'Eletroposto',
                    'Farmácias',
                  ],
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(65, 0, 0, 0),
                      blurRadius: 2.0,
                      spreadRadius: 0,
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTags(String categoryName, List<String> tags) {
    return Padding(
      padding: EdgeInsets.all(16.0), // Espaçamento em torno das tags
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Alinha à esquerda
        children: [
          Text(
            categoryName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0), // Espaço vertical entre o título e as tags
          Wrap(
            spacing: 25.0, // Espaçamento horizontal entre as tags
            runSpacing: 25.0, // Espaçamento vertical entre as tags
            children: tags.map((tag) {
              return InputChip(
                elevation: 2,
                shadowColor: Color.fromARGB(93, 0, 0, 0),
                label: Text(
                  tag,
                  style: TextStyle(
                    color: Colors.blue, // Cor do texto da tag
                  ),
                ),
                onPressed: () {
                  print('Tag "$tag" clicada.');
                },
                backgroundColor: Colors.white, // Cor de fundo da tag
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20.0), // Borda da tag arredondada
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

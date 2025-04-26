import 'package:flutter/material.dart';

final List<String> userDestinos = [];
final List<Map<String, String>> samplePacotes = [
    {'name': 'Paris, França', 'image': 'https://francabrasil.com.br/wp-content/uploads/sites/11/2015/02/paris-1024x682.jpg'},
  {'name': 'Nova York, EUA', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4jSloPC5Zp89oWPldg1zaTyXf0nvdz2OfLQ&s'},
  {'name': 'Tóquio, Japão', 'image': 'https://s2.glbimg.com/1NqTrdukaHaNY2ZGKqaSkb2dnO4=/e.glbimg.com/og/ed/f/original/2021/08/02/gettyimages-1208124099.jpg'},
  {'name': 'Rio de Janeiro, Brasil', 'image': 'https://blog.paineirascorcovado.com.br/wp-content/uploads/2024/11/Cristo-Redentor-Por-do-sol-1024x683.jpg'},
  {'name': 'Sydney, Austrália', 'image': 'https://australiabrasil.com.br/wp-content/uploads/sites/2/2021/06/sydney-1-2.jpg'},
  {'name': 'Londres, Reino Unido', 'image': 'https://static.mundoeducacao.uol.com.br/mundoeducacao/2021/11/big-ben.jpg'},
  {'name': 'Roma, Itália', 'image': 'https://morarnaeuropa.com.br/wp-content/uploads/2020/08/Roma-capital-da-It%C3%A1lia-vaticano-pra%C3%A7a-s%C3%A3o-pedro.jpg'},
  {'name': 'Barcelona, Espanha', 'image': 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Sagrada_Familia_01.jpg'},
  {'name': 'Dubai, Emirados Árabes', 'image': 'https://upload.wikimedia.org/wikipedia/commons/0/0c/Burj_Khalifa.jpg'},
  {'name': 'Bangkok, Tailândia', 'image': 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Wat_Arun_Ratchawararam_Ratchawaramahawihan.jpg'},
  {'name': 'Cairo, Egito', 'image': 'https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg'},
  {'name': 'Buenos Aires, Argentina', 'image': 'https://upload.wikimedia.org/wikipedia/commons/0/0e/Obelisco_Buenos_Aires.jpg'},
  {'name': 'Lisboa, Portugal', 'image': 'https://upload.wikimedia.org/wikipedia/commons/6/6f/Torre_de_Bel%C3%A9m_%28cropped%29.jpg'},
  {'name': 'Moscou, Rússia', 'image': 'https://upload.wikimedia.org/wikipedia/commons/f/f2/St_Basils_Cathedral-500px.jpg'},
  {'name': 'Cidade do Cabo, África do Sul', 'image': 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Table_Mountain_from_Blaydon_View.jpg'},
];

void main() {
  runApp(ExploreMundoApp());
}

class ExploreMundoApp extends StatelessWidget {
  const ExploreMundoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => HomeScreen(),
        '/destinos': (_) => DestinosScreen(),
        '/pacotes': (_) => PacotesScreen(),
        '/contato': (_) => ContatoScreen(),
        '/sobre': (_) => SobreScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(Duration(seconds: 3), () {
      if (!_isHovered && _pageController.hasClients) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
      if (mounted) _startAutoScroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Mundo'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Image.network(
                'https://media.gettyimages.com/id/1028463210/pt/foto/happy-family-traveling-by-plane-and-taking-a-selfie.jpg?s=612x612&w=0&k=20&c=2l4ZYfS1iMZPLTP3u-mdX6Pvb6Js5Aooalgy5n9wciM=',
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: Text(
                'Bem-vindo ao Explore Mundo!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Descubra destinos incríveis e planeje sua próxima aventura.',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 34),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: samplePacotes.map((pacote) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              pacote['image']!,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.broken_image, size: 120),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            pacote['name']!,
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 34),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 450.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/pacotes');
                },
                icon: Icon(Icons.card_travel),
                label: Text('Ver Pacotes Disponíveis'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/destinos');
              break;
            case 1:
              Navigator.pushNamed(context, '/pacotes');
              break;
            case 2:
              Navigator.pushNamed(context, '/contato');
              break;
            case 3:
              Navigator.pushNamed(context, '/sobre');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Destinos'),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'Pacotes'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Contato'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Sobre Nós'),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Explore Mundo', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          _buildDrawerItem(context, Icons.place, 'Destinos', '/destinos'),
          _buildDrawerItem(context, Icons.card_travel, 'Pacotes', '/pacotes'),
          _buildDrawerItem(context, Icons.contact_mail, 'Contato', '/contato'),
          _buildDrawerItem(context, Icons.info, 'Sobre Nós', '/sobre'),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class DestinosScreen extends StatefulWidget {
  const DestinosScreen({super.key});

  @override
  _DestinosScreenState createState() => _DestinosScreenState();
}
class _DestinosScreenState extends State<DestinosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meus Destinos')),
      body: userDestinos.isEmpty
          ? Center(child: Text('Nenhum destino adicionado.'))
          : ListView.builder(
              itemCount: userDestinos.length,
              itemBuilder: (_, index) {
                final destino = userDestinos[index];
                final imageUrl = samplePacotes.firstWhere(
                  (pacote) => pacote['name'] == destino,
                  orElse: () => {'image': ''},
                )['image']!;
                return ListTile(
                  leading: imageUrl.isNotEmpty
                      ? Image.network(
                          imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.broken_image),
                        )
                      : Icon(Icons.image_not_supported),
                  title: Text(destino),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() => userDestinos.removeAt(index));
                    },
                  ),
                );
              },
            ),
    );
  }
}

class PacotesScreen extends StatefulWidget {
  const PacotesScreen({super.key});

  @override
  _PacotesScreenState createState() => _PacotesScreenState();
}

class _PacotesScreenState extends State<PacotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pacotes Disponíveis')),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          mainAxisSpacing: 25,  // distância vertical das imagens na aba pacote
          crossAxisSpacing: 40, // distância horizontal das imagens na aba pacote
          childAspectRatio: 3 / 4,
        ),
        itemCount: samplePacotes.length,
        itemBuilder: (_, index) {
          final pacote = samplePacotes[index]['name']!;
          final imageUrl = samplePacotes[index]['image']!;
          final added = userDestinos.contains(pacote);
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    imageUrl,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(pacote, style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                    icon: Icon(added ? Icons.remove_circle : Icons.add_circle),
                    onPressed: () {
                      setState(() {
                        if (added) {
                          userDestinos.remove(pacote);
                        } else {
                          userDestinos.add(pacote);
                        }
                      });
                    },
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}
class ContatoScreen extends StatelessWidget {
  const ContatoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contato')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('E-mail: exploreomundo@gmail.com', style: TextStyle(fontSize: 16)),
            Text('Telefone: (11) 4002-8922', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sobre Nós')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 250.0, vertical: 16.0),
        child: Center(
          child: Text(
            'Informações sobre a Explore Mundo\n\n'
            'A Explore Mundo é uma agência de viagens dedicada a oferecer experiências '
            'incríveis aos seus clientes. Com anos de atuação no mercado, proporcionamos '
            'pacotes personalizados, suporte 24/7 e uma plataforma intuitiva para '
            'planejar suas férias dos sonhos. Nosso compromisso é garantir que cada viagem '
            'seja única, segura e repleta de momentos inesquecíveis. '
            'Visite nosso site para mais detalhes e reserve sua próxima aventura com a gente! '
            'Além disso, contamos com uma equipe de especialistas em viagens que está sempre '
            'pronta para oferecer dicas e recomendações exclusivas. '
            'Seja para destinos exóticos, culturais ou relaxantes, temos algo especial para você. '
            '\n\nEstamos aqui para ajudar você a explorar o mundo e criar memórias que durarão para sempre!',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

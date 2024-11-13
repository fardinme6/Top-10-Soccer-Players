import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Top 10 Soccer players App',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/soccer.jpg'),
            ),
            Text(
              'Top 10 Soccer Players',
              style: TextStyle(
                fontFamily: 'STENCIL',
                fontSize: 28,
                color: Colors.blue,
              ),
            ),
            Text(
              'By: Fardin Mehry',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'V 1.0',
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

class Player {
  final String name;
  final String imagePath;
  final String details;

  Player({required this.name, required this.imagePath, required this.details});
}

class HomeScreen extends StatelessWidget {
  final List<Player> players = [
    Player(
      name: "Cristiano Ronaldo (Portugal)",
      imagePath: 'images/ronaldo.jpg',
      details:
          "Cristiano Ronaldo is widely regarded as one of the greatest footballers of all time. Born on February 5, 1985, in Madeira, Portugal, he has achieved extraordinary success throughout his career. Known for his incredible athleticism, goal-scoring ability, and relentless work ethic.",
    ),
    Player(
      name: "Lionel Messi (Argentina)",
      imagePath: 'images/messi.jpg',
      details:
          "Lionel Messi is widely considered one of the greatest footballers of all time. Born on June 24, 1987, in Rosario, Argentina, After joining **FC Barcelona** at a young age, he went on to become the club's all-time top scorer and won numerous **La Liga** and **UEFA Champions League** titles.",
    ),
    Player(
        name: "Karim Benzema (France)",
        imagePath: 'images/benzema.jpeg',
        details:
            "Karim Benzema known for his exceptional finishing, technical skill, and intelligent play. Born on December 19, 1987, in Lyon, France, Benzema Plays at **Real Madrid**, where he became the club's second all-time top scorer and helped secure numerous titles, including **4 UEFA Champions League trophies** and **3 La Liga titles**."),
    Player(
        name: "Pele (Brazil)",
        imagePath: 'images/pele.jpg',
        details:
            "Pelé, born Edson Arantes do Nascimento on October 23, 1940, is widely regarded as one of the greatest football players of all time. The Brazilian forward won three FIFA World Cup titles (1958, 1962, and 1970), a feat unmatched by any other player. Known for his extraordinary skill, vision, and goal-scoring ability, Pelé scored over 1,000 career goals."),
    Player(
        name: "Diego Maradona (Argentina)",
        imagePath: 'images/maradona.jpg',
        details:
            "Diego Maradona, born on October 30, 1960, in Argentina, is widely considered one of the greatest footballers in history. Known for his exceptional dribbling, vision, and creativity, Maradona led Argentina to victory in the 1986 FIFA World Cup."),
    Player(
        name: "Roberto Carlos (Brazil)",
        imagePath: 'images/carlos.png',
        details:
            "Roberto Carlos is a Brazilian former footballer, widely regarded as one of the greatest left-backs in history. Born on April 10, 1973, he was known for his powerful free kicks, speed, and attacking prowess. Carlos had a long and successful career, playing for clubs like Real Madrid and winning multiple titles, including the FIFA World Cup in 2002."),
    Player(
        name: "Neymar Junior (Brazil)",
        imagePath: 'images/neymar.jpg',
        details:
            "Neymar Jr. is a Brazilian professional footballer, born on February 5, 1992, known for his flair, skill, and creativity on the field. He rose to prominence at Santos FC before moving to Barcelona, where he won numerous titles, including the UEFA Champions League. In 2017, Neymar transferred to Paris Saint-Germain for a world-record fee."),
    Player(
        name: "Iker Casillas (Spain)",
        imagePath: 'images/casillas.jpg',
        details:
            "Iker Casillas is a retired Spanish goalkeeper, Born on May 20, 1981, he spent the majority of his career at Real Madrid, winning numerous La Liga and UEFA Champions League titles. Casillas was also a key player for the Spanish national team, helping them secure the 2010 FIFA World Cup and two UEFA European Championships."),
    Player(
        name: "Zinedine Zidane (France)",
        imagePath: 'images/zidan.jpg',
        details:
            "Zinedine Zidane is a retired French footballer and current coach, widely regarded as one of the greatest players of all time. Born on June 23, 1972, in Marseille, Zidane played for top clubs like Juventus and Real Madrid, winning numerous domestic and international titles, including the 1998 FIFA World Cup and UEFA Euro 2000 with France."),
    Player(
        name: "Sergio Ramos (Spain)",
        imagePath: 'images/ramos.jpg',
        details:
            "Sergio Ramos is a Spanish footballer, born on March 30, 1986, known for his leadership, defensive prowess, and goal-scoring ability. He spent the majority of his career at Real Madrid, winning numerous La Liga and UEFA Champions League titles. Ramos was a key figure for Spain, helping them win the 2010 FIFA World Cup and two UEFA European Championships."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: Text(
          'Top 10 Soccer Players',
          style: TextStyle(color: Colors.white, fontFamily: 'PAPYRUS'),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'Share the app') {
                print('Share the app selected');
              } else if (value == 'About') {
                print('About selected');
              } else if (value == 'Exit') {
                Navigator.of(context).pop();
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Share the app', 'About', 'Exit'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];
          return ListTile(
            title: Text(player.name),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ItemDetailsScreen(player: player),
              ));
            },
          );
        },
      ),
    );
  }
}

class ItemDetailsScreen extends StatelessWidget {
  final Player player;

  ItemDetailsScreen({required this.player});
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(player.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                player.imagePath,
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              player.details,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchURL(
                    'https://www.espn.in/football/story/_/id/40490059/ranking-top-25-men-soccer-players-21st-century/${Uri.encodeComponent(player.name)}');
              },
              child: Text('More Details'),
            ),
          ],
        ),
      ),
    );
  }
}

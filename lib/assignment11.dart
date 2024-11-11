import 'package:flutter/material.dart';

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
  // Updated list of players with their image paths and details
  final List<Player> players = [
    Player(
      name: "Cristiano Ronaldo (Portugal)",
      imagePath: "images/ronaldo.png",
      details: "Cristiano Ronaldo is widely regarded as one of the greatest footballers of all time. Born on February 5, 1985, in Madeira, Portugal, he has achieved extraordinary success throughout his career. Known for his incredible athleticism, goal-scoring ability, and relentless work ethic, Ronaldo has won numerous titles, including **5 Ballon d'Ors**, **4 UEFA Champions League trophies**, and **1 UEFA European Championship** with Portugal. He became Real Madrid’s all-time top scorer and has enjoyed successful stints at **Manchester United**, **Real Madrid**, **Juventus**, and **Al Nassr**. Ronaldo is known for his versatility, physicality, and leadership on the pitch, making him one of the most iconic athletes in the world.",
    ),
    Player(
      name: "Lionel Messi (Argentina)",
      imagePath: "images/messi.jpg",
      details: "Lionel Messi is widely considered one of the greatest footballers of all time. Born on June 24, 1987, in Rosario, Argentina, Messi is known for his extraordinary dribbling, vision, and playmaking ability. After joining **FC Barcelona** at a young age, he went on to become the club's all-time top scorer and won numerous **La Liga** and **UEFA Champions League** titles. Messi has won **7 Ballon d'Ors**, a record, and led Argentina to victory in the **2021 Copa América** and the **2022 FIFA World Cup**. His technical brilliance and consistency have made him a global icon and one of the most admired athletes in history.",
    ),
  Player(
  name: "Karim Benzema (France)",
  imagePath: "images/benzema.jpg",
  details: "Karim Benzema is one of the top strikers of his generation, known for his exceptional finishing, technical skill, and intelligent play. Born on December 19, 1987, in Lyon, France, Benzema spent the majority of his career at **Real Madrid**, where he became the club's second all-time top scorer and helped secure numerous titles, including **4 UEFA Champions League trophies** and **3 La Liga titles**. Benzema is renowned for his ability to create and finish chances, and his leadership on the pitch was pivotal in Real Madrid's success in recent years, especially during their Champions League victories. In 2022, he won his first **Ballon d'Or**, recognizing his brilliant performances and consistent excellence."
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top 10 Soccer Players'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Share the app') {
                // Implement sharing functionality
              } else if (value == 'About') {
                // Show about dialog or screen
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

  // Receive player data from the previous screen
  ItemDetailsScreen({required this.player});

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
            // Player image
            Center(
              child: Image.asset(
                player.imagePath,
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Player details
            Text(
              player.details,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement more details functionality if needed
              },
              child: Text('More Details'),
            ),
          ],
        ),
      ),
    );
  }
}


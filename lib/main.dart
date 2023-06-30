import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Card Example'),
        ),
        backgroundColor: Colors.blue,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CardCarousel(
              cards: [
                CardData(
                  title: 'Card 1',
                  subheader: 'Card Subheader 1',
                  photoUrl: './assets/images/DogCard.png',
                  description: 'Card Description 1',
                  buttonText: 'Button 1',
                  onPressed: () {
                    // Handle button press for card 1
                  },
                ),
                CardData(
                  title: 'Card 2',
                  subheader: 'Card Subheader 2',
                  photoUrl: './assets/images/DogCard.png',
                  description: 'Card Description 2',
                  buttonText: 'Button 2',
                  onPressed: () {
                    // Handle button press for card 2
                  },
                ),
                CardData(
                  title: 'Card 3',
                  subheader: 'Card Subheader 3',
                  photoUrl: './assets/images/DogCard.png',
                  description: 'Card Description 3',
                  buttonText: 'Button 3',
                  onPressed: () {
                    // Handle button press for card 3
                  },
                ),
                CardData(
                  title: 'Card 4',
                  subheader: 'Card Subheader 4',
                  photoUrl: './assets/images/DogCard.png',
                  description: 'Card Description 4',
                  buttonText: 'Button 4',
                  onPressed: () {
                    // Handle button press for card 4
                  },
                ),
                CardData(
                  title: 'Card 5',
                  subheader: 'Card Subheader 5',
                  photoUrl: './assets/images/DogCard.png',
                  description: 'Card Description 5',
                  buttonText: 'Button 5',
                  onPressed: () {
                    // Handle button press for card 5
                  },
                ),
                CardData(
                  title: 'The Last Card',
                  subheader: 'Card Subheader 5',
                  photoUrl: './assets/images/DogCard.png',
                  description: 'Card Description 5',
                  buttonText: 'Button 5',
                  onPressed: () {
                    // Handle button press for card 5
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardCarousel extends StatefulWidget {
  final List<CardData> cards;

  const CardCarousel({required this.cards});

  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 650,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.cards.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, _) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CardWidget(
                      cardData: widget.cards[index],
                    ),
                  );
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(widget.cards.length, (int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? Colors.white
                    : Color.fromARGB(255, 28, 27, 31).withOpacity(0.5),
              ),
            );
          }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class CardWidget extends StatelessWidget {
  final CardData cardData;

  const CardWidget({required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: 320, // Adjust the width to make each card thicker
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(cardData.title),
              subtitle: Text(cardData.subheader),
            ),
            Container(
              width: 320,
              height: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(cardData.photoUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(cardData.description),
            ),
            ElevatedButton(
              onPressed: cardData.onPressed,
              child: Text(cardData.buttonText),
            ),
            SizedBox(
              height: 10,
            ), // Add additional space below the button using SizedBox
          ],
        ),
      ),
    );
  }
}

class CardData {
  final String title;
  final String subheader;
  final String photoUrl;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  const CardData({
    required this.title,
    required this.subheader,
    required this.photoUrl,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });
}

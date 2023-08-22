import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});
}

class QuoteGenerator {
  List<Quote> quotes = [
    Quote(
      text: "El éxito es ir de fracaso en fracaso sin perder el entusiasmo.",
      author: "Winston Churchill",
    ),
    Quote(
      text: "El único modo de hacer un gran trabajo es amar lo que haces.",
      author: "Steve Jobs",
    ),
    Quote(
      text: "El futuro pertenece a quienes creen en la belleza de sus sueños.",
      author: "Eleanor Roosevelt",
    ),
    // Agrega más frases inspiradoras aquí
  ];

  Quote getRandomQuote() {
    final Random random = Random();
    return quotes[random.nextInt(quotes.length)];
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuotePage(),
    );
  }
}

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  Quote currentQuote = Quote(text: "", author: "");
  QuoteGenerator quoteGenerator = QuoteGenerator();

  void generateQuote() {
    setState(() {
      currentQuote = quoteGenerator.getRandomQuote();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: generateQuote,
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentQuote.text,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  "- ${currentQuote.author}",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

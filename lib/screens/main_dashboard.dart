import 'package:animal_feeder_game/components/animals_grid_view.dart';
import 'package:animal_feeder_game/screens/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MainDashboard extends StatelessWidget {
  const MainDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: Center(child: AnimalsGridView())),
          Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const FeedScreen())),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Share your meal',
                  style: GoogleFonts.andika(
                      textStyle: Theme.of(context).textTheme.bodyMedium),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

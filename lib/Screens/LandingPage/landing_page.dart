import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tefontai_chrome_extension/Theme/theme_notifier.dart';

class LandingPage extends StatefulWidget {
  final VoidCallback showInformationPage;
  const LandingPage({super.key, required this.showInformationPage});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Variables
  bool isSwitched = false;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    loadSwitchState();
  }

  // Laods user's theme from sharedpreferences
  void loadSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  // Saves user's theme to sharedpreferences
  void saveSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save the switch state
    prefs.setBool('isDarkMode', isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      // Appbar starts here
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 0,

        // Row for title
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Row for logo and title text
            Row(
              children: [
                // log container
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      // Background image here
                      image: AssetImage(
                        "assets/images/logo.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(
                  width: 3.0,
                ),

                // Title RichText
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Tefont',
                        style: GoogleFonts.roboto(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      TextSpan(
                        text: 'ai',
                        style: GoogleFonts.inter(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFFD47CC3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Transform around switch for toggling the theme
            Transform.scale(
              scale: 0.5,

              // Switch for theme
              child: Switch(
                activeTrackColor: Theme.of(context).colorScheme.inversePrimary,
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;

                    // Save the switch state when it changes
                    saveSwitchState();
                    themeNotifier.toggleTheme();
                  });
                },
              ),
            ),
          ],
        ),
      ),
      // AppBar ends here

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
            flex: 2,
            child: Image(
              image: AssetImage("assets/images/design.png"),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Welcome to ',
                            style: GoogleFonts.roboto(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          TextSpan(
                            text: 'Tefont',
                            style: GoogleFonts.roboto(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w800,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          TextSpan(
                            text: 'ai',
                            style: GoogleFonts.inter(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFFD47CC3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "simply dummy text of the printing \n simply dummy text.",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color(0xFFD47CC3),
                  ),
                ),
                onPressed: widget.showInformationPage,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.roboto(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationPage extends StatefulWidget {
  final VoidCallback showLandingPage;
  const InformationPage({super.key, required this.showLandingPage});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  // Controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // Stack starts here
      body: Stack(
        children: [
          // First positioned
          Positioned(
            top: 20.0,
            left: 15.0,
            right: 15.0,

            // Column starts here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gesturedetector around arrow back icon
                GestureDetector(
                  onTap: widget.showLandingPage,

                  // Arrow back icon here
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),

                // Padding around richtext
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),

                  // Richtext here
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(
                        height: 1.1,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Provide \n',
                          style: GoogleFonts.inter(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        TextSpan(
                          text: 'Your Details \n',
                          style: GoogleFonts.inter(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Credential text here
                Text(
                  "Your Credentials",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),

                // Padding around username TextFormField
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),

                  // Username TextFormField here
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),

                // Padding around fullname TextFormField
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),

                  // Fullname TextFormField here
                  child: TextFormField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

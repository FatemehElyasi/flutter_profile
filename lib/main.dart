import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

        brightness: Brightness.dark,
        primarySwatch: Colors.cyan,
        primaryColor: Colors.pink.shade400,
        dividerTheme: DividerThemeData(
          color: Colors.white,
        ),
        //background
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),

        textTheme: GoogleFonts.latoTextTheme(const TextTheme(
          bodyLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
              fontSize: 13, color: Color.fromARGB(100, 255, 255, 255)),
          headlineMedium: TextStyle(fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SkillType {
  photoShop,
  xd,
  illustrator,
  afterEffect,
  lightRoom,
}

class _MyHomePageState extends State<MyHomePage> {
  SkillType skills = SkillType.photoShop;

  void updateSelectedSkill(SkillType type) {
    setState(() {
      skills = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Curriculum vitae',
        ),
        actions: const [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics:BouncingScrollPhysics() ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/profile_image.png',
                        width: 60,
                        height: 60,
                      )),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Brice Seraph in",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text("Product & Print Designer ",
                            style: Theme.of(context).textTheme.bodyMedium),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location,
                              color: Theme.of(context).textTheme.bodySmall!.color,
                              size: 14,
                            ),
                            Text(
                              "Paris, France",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//---------------------------------------Skill
class Skill extends StatelessWidget {

  //state
  final SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;

  //func for pass parent widget
  final Function() onTap;

  Skill({
    super.key,
    required this.type,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius=BorderRadius.circular(12);

    return InkWell(
      borderRadius: defaultBorderRadius,
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white10,
                borderRadius: defaultBorderRadius,
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive? BoxDecoration(
                boxShadow: [
                  BoxShadow(color: shadowColor.withOpacity(0.5),blurRadius: 20)
                ]
              ):null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

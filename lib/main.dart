import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme()
          : MyAppThemeConfig.light().getTheme(),
      //themeMode:ThemeMode.dark ,
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (themeMode == ThemeMode.dark) {
              themeMode = ThemeMode.light;
            } else {
              themeMode = ThemeMode.dark;
            }
          });
        },
      ),
    );
  }
}

//---------------------------------------Theme
class MyAppThemeConfig {
  final Color primaryColor = Colors.pink.shade400;
  late final Color primaryTextColor;
  late final Color secondaryTextColor;
  late final Color surfaceColor;
  late final Color backgroundColor;
  late final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Color(0x0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = Color(0xdffffff),
        backgroundColor = Colors.white,
        appBarColor = Colors.white70,
        brightness = Brightness.light;

//---------------------------------
  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      primarySwatch: Colors.cyan,
      brightness: brightness,

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white,
      ),
      //background
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
          backgroundColor: appBarColor, foregroundColor: primaryTextColor),
      //input text theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        filled: true,
      ),

      textTheme: GoogleFonts.latoTextTheme(TextTheme(
        bodyLarge: TextStyle(
          fontSize: 15,
          color: primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(fontSize: 13, color: secondaryTextColor),
        headlineMedium:
            TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
        titleMedium: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: primaryTextColor),
      )),
    );
  }
}
//---------------------------------------

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;

  const MyHomePage({super.key, required this.toggleThemeMode});

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
        title: Text(
          'Curriculum vitae',
        ),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          InkWell(
            onTap: widget.toggleThemeMode,
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
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
            const Padding(
              padding: EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(
                  'This page contains current and previous announcements of what’s new on the Flutter website and blog. For details about what’s new in the Flutter releases see the release notes page.'),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
              child: Row(
                children: [
                  Text("Skills",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w700)),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 12,
                  ),
                ],
              ),
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                children: [
                  Skill(
                    type: SkillType.photoShop,
                    title: "Photoshop",
                    imagePath: "assets/images/app_icon_01.png",
                    shadowColor: Colors.blue,
                    isActive: skills == SkillType.photoShop,
                    onTap: () {
                      updateSelectedSkill(SkillType.photoShop);
                    },
                  ),
                  Skill(
                    type: SkillType.xd,
                    title: "Adobe XD",
                    imagePath: "assets/images/app_icon_05.png",
                    shadowColor: Colors.pink,
                    isActive: skills == SkillType.xd,
                    onTap: () {
                      updateSelectedSkill(SkillType.xd);
                    },
                  ),
                  Skill(
                    type: SkillType.illustrator,
                    title: "Illustrator",
                    imagePath: "assets/images/app_icon_04.png",
                    shadowColor: Colors.orange,
                    isActive: skills == SkillType.illustrator,
                    onTap: () {
                      updateSelectedSkill(SkillType.illustrator);
                    },
                  ),
                  Skill(
                    type: SkillType.afterEffect,
                    title: "After Effect ",
                    imagePath: "assets/images/app_icon_03.png",
                    shadowColor: Colors.blue,
                    isActive: skills == SkillType.afterEffect,
                    onTap: () {
                      updateSelectedSkill(SkillType.afterEffect);
                    },
                  ),
                  Skill(
                    type: SkillType.lightRoom,
                    title: "Lightroom",
                    imagePath: "assets/images/app_icon_02.png",
                    shadowColor: Colors.blue,
                    isActive: skills == SkillType.lightRoom,
                    onTap: () {
                      updateSelectedSkill(SkillType.lightRoom);
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Personal Information",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(CupertinoIcons.at)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(CupertinoIcons.lock)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 40,
                      child:
                          ElevatedButton(onPressed: () {}, child: Text("Save")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------Skill
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
    final BorderRadius defaultBorderRadius = BorderRadius.circular(12);

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
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.5), blurRadius: 20)
                    ])
                  : null,
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

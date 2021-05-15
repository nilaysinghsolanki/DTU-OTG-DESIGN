import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:nilay_dtuotg_2/Screens/authScreen.dart';
import 'package:nilay_dtuotg_2/Screens/homeTab.dart';
import 'package:nilay_dtuotg_2/plus_controller.dart';
import 'package:path/path.dart';
import 'package:rive/rive.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context1) {

    List<Widget> ScatteredListtiles=[
      ListTile(
        title: Text("Log In"),
          onTap: () {
            Navigator.push(
             context1,
              MaterialPageRoute(builder: (context) => AuthScreen()),
            );

          }
      ),


      ListTile(leading: Icon(Icons.calendar_today,color: Colors.blueAccent,),
      title: Text("Schedule"),),

      ListTile(
        leading: Icon(Icons.motorcycle_rounded,color: Colors.greenAccent,),
        title: Text("Catch-A-Ride"),
      ),

      ListTile(
        leading: Icon(Icons.report,color: Colors.red ,),
        title: Text("Emergency"),
      ),
      ListTile(
        leading: Icon(Icons.work,color: Colors.black,),
        title: Text("Active Projects",),
      ),
    Container(
      alignment: Alignment.bottomCenter,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
        ),

        title: Text("I have a B-Plan , for selling DTU"),
        subtitle: Text("-Every Entrepreneur at E-cell"),
      ),

    )

    ];


    return MaterialApp(



      title: 'Rive Flutter Demo',
      home: Scaffold(
        drawer: Drawer(





            child: Container(
              color: Colors.transparent,
              child: ListView(

                children: ScatteredListtiles,
              ),
            ), // Populate the Drawer in the next step.
        ),




      body: MyRiveAnimation(

      ),),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> ScatteredListtiles=[
      Column(
        children: [

          Container(

            child: ListTile(leading: Text("Events"),


              ),
          ),
        ],
      ),
      ListTile(
          leading: Text("PE-204"),
          title: Text("3-4AM"),
          subtitle: Text("TG6-TF8")
          ,
          trailing: Icon(Icons.schedule),

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddingPage()),
            );

          }
      ),
      Container(
        alignment: Alignment.bottomCenter,
        child: ListTile(


          trailing: Text("Projects"),
        ),
      ),

      ListTile(
        leading: Text("Internship/Job Opportunities"),
      trailing: Icon(Icons.work_outline),),

    ];

    return Flexible(
      child:  StaggeredGridView.countBuilder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),




        crossAxisCount:4,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) =>  AnimationConfiguration.staggeredGrid(
          
          
          position: index,
          columnCount: 0,

          duration: const Duration(milliseconds: 500),
          child: SlideAnimation(
            horizontalOffset: 100.0,
            child: FlipAnimation(
              flipAxis: FlipAxis.y,
              child: Container(
                
                child: Center(child: ScatteredListtiles[index]),
                color: Colors.white,

              ),
            ),
          ),
        ),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 4 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}



class AddingPage extends StatefulWidget {
  @override
  _AddingPageState createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  @override
  Widget build(BuildContext context) {

    List<Icon> myicons=[
      Icon(FontAwesomeIcons.star,color: Colors.purple,),
      Icon(Icons.schedule_outlined,color: Colors.black,),
      Icon(FontAwesomeIcons.tasks,color: Colors.greenAccent,),
    ];
    List<Text> titlelist=[
      Text("Add to Events"),
      Text("Add to Schedule"),
      Text("Share details about Projects"),
    ];
    List<Text> subtitlelist=[
      Text("Update via this feature to let people know the details of any event"),
      Text("Update your personal schedule with new tasks assigned like self study,sports.etc"),
      Text(
          "Update via this feature to let people know the details of any projects in DTU, looking for Volunteers"),

    ];

    return Expanded(


      child: Container(
        alignment: Alignment.center,
        color:Colors.transparent,









        child:
        ListView.builder(
          physics: BouncingScrollPhysics(),


          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(

              position: index,
              duration: const Duration(milliseconds: 350),
              child: SlideAnimation(
                verticalOffset: 100.0,
                child: FlipAnimation(
                  child: Card( elevation: 5,

                    child: ListTile(



                      contentPadding: EdgeInsets.all(20),
                      tileColor: Colors.transparent,
                      selectedTileColor: Colors.cyan,

                      leading: myicons[index],
                      title: titlelist[index],
                      subtitle: subtitlelist[index],
                    ),

                  ),
                ),
              ),
            );
          },
        )
        ,


      ),
    );

  }
}

class MyRiveAnimation extends StatefulWidget {
  @override
  _MyRiveAnimationState createState() => _MyRiveAnimationState();
}

class _MyRiveAnimationState extends State<MyRiveAnimation> {
  PlusAnimation _plusAnimation;
  static const double width = 500;
  static const double height = 200;
  Color newcolor=Colors.greenAccent;






  Artboard _riveArtboard;
  bool _adding_to_app_pressed = false;
  bool _events_pressed=false;


  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('Assets/appbar.riv').then(
          (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;

        // Add a controller to play back a known animation on the main/default
        // artboard. We store a reference to it so we can toggle playback.

        setState(() => _riveArtboard = artboard);
        _riveArtboard.addController(_plusAnimation = PlusAnimation('Idle'));
      },
    );
  }

  void _animationchanged(bool _adding_page_active) {
    if (_plusAnimation == null) {
      _riveArtboard.addController(
        _plusAnimation = PlusAnimation('Plus'),
      );
    }

    if (_adding_page_active == true) {
      _plusAnimation.start();
      newcolor=Colors.lightGreenAccent;

    } else {
      _plusAnimation.reverse();
      newcolor=Colors.greenAccent;
    }

    setState(() {
      if (_adding_page_active == true) {
        _plusAnimation.isActive = false;
        _riveArtboard.addController(_plusAnimation = PlusAnimation('Plus'));

        print("_adding_page_active");
      }
      _adding_to_app_pressed = _adding_page_active;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Container(


      color: newcolor,
      alignment: Alignment.center,




      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height,
            color: newcolor,
          ),
          //NAVIGATION OF PAGES
          if (_adding_to_app_pressed == true) AddingPage() else if(_adding_to_app_pressed==false) HomePage() ,



              Container(

                padding: EdgeInsets.all(0),
                width: width,

                color: Colors.transparent,
                child: _riveArtboard == null
                    ? const SizedBox()
                    : GestureDetector(
                  onTapUp: (tapinfo) {
                    var localtouchposition =
                    (context.findRenderObject() as RenderBox)
                        .globalToLocal(tapinfo.globalPosition);

                    var tophalftouched = localtouchposition.dy < height / 2;
                    var hometouched = localtouchposition.dx < width / 6;
                    var internshiptouched =
                        localtouchposition.dx < 2 * (width / 6);
                    var profiletouched = localtouchposition.dx < width;
                    var lowerblanktouched =
                        localtouchposition.dx < 3 * (width / 6);
                    var eventstouched =
                        localtouchposition.dx < 5 * (width / 8);

                    if (!tophalftouched) {
                      if (hometouched) {
                        if (!_adding_to_app_pressed) {
                          setState(() {


                            _plusAnimation.isActive = false;
                            _riveArtboard.addController(
                                _plusAnimation = PlusAnimation('home'));
                          });
                        }
                      } else if (internshiptouched) {
                        if (!_adding_to_app_pressed) {
                          setState(() {

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeTab()),
                              );


                            _plusAnimation.isActive = false;
                            _riveArtboard.addController(
                                _plusAnimation = PlusAnimation('internship'));
                          });
                        }
                      } else if (lowerblanktouched) {
                        setState(() {
                          _adding_to_app_pressed = !_adding_to_app_pressed;
                          _animationchanged(_adding_to_app_pressed);
                        });
                      } else if (eventstouched) {
                        if (!_adding_to_app_pressed) {
                          setState(() {
                            _plusAnimation.isActive = false;
                            _riveArtboard.addController(
                                _plusAnimation = PlusAnimation('events'));
                          });
                        }
                      } else if (profiletouched) {
                        if (!_adding_to_app_pressed) {
                          setState(() {

    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AuthScreen()),
    );
                            _plusAnimation.isActive = false;
                            _riveArtboard.addController(
                                _plusAnimation = PlusAnimation('profile'));
                            print("Profile Touched");
                          });
                        }
                      }
                    } else {
                      setState(() {
                        _adding_to_app_pressed = !_adding_to_app_pressed;
                        _animationchanged(_adding_to_app_pressed);


                      });
                    }
                  },
                  child: Container(
                    color: newcolor,

                    child: Rive(
                      artboard: _riveArtboard,
                      alignment: Alignment.bottomCenter,
                      useArtboardSize: true,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ],
          ),
    );


  }
}

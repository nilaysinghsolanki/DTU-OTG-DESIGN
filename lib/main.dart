

import 'package:date_time_picker/date_time_picker.dart';
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
var event_name;
var event_description;
List <Widget>  Events=[

];
/////////////////////COLORS
Color newcolor=Color(0xfff2efe4);
TextStyle dark_theme_text_style=TextStyle(
  color: Colors.white
);
Color tilecolor=Colors.white;


TextStyle general_text_style=TextStyle(
color: Colors.brown
);
////////////////////////////PAGESNAVIGATION
bool _events_pressed=false;
bool _adding_to_app_pressed = false;

class MyApp extends StatelessWidget {
  PlusAnimation _plusAnimation;
  static const double width = 500;
  static const double height = 200;








  Artboard _riveArtboard;
  bool _events_pressed=false;
  bool _adding_to_app_pressed = false;

  @override
  Widget build(BuildContext context1) {

    List<Widget> ScatteredListtiles=[
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: newcolor,),
        child: ListTile(
          title: Text("log out",style: general_text_style,),



        ),
      ),



      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          color: newcolor),
        child: ListTile(

          leading: Icon(Icons.calendar_today,color: Colors.brown,),
        title: Text("Schedule",style: general_text_style),
        ),
      ),

      ListTile(

        leading: Icon(Icons.motorcycle_rounded,color:Colors.brown,),
        title: Text("Catch-A-Ride",style: general_text_style),
      ),

      ListTile(
    tileColor:  newcolor,
        leading: Icon(Icons.report,color: Colors.brown ,),
        title: Text("Emergency",style: general_text_style),
      ),
      ListTile(
        tileColor:  newcolor,
        leading: Icon(Icons.work,color: Colors.brown,),
        title: Text("Active Projects",style: general_text_style),
      ),
    Container(
      color: newcolor,
      alignment: Alignment.bottomCenter,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
        ),

        title: Text("I have a B-Plan , for selling DTU",style: general_text_style),
        subtitle: Text("-Every Entrepreneur at E-cell",style: general_text_style),
      ),

    )

    ];


    return MaterialApp(



      title: 'Rive Flutter Demo',
      home: Scaffold(
        drawer: Drawer(
          





            child: Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: newcolor
                ),


                child: Center(
                  child: ListView(
                    
                    



                    children: ScatteredListtiles,
                  ),
                ),
              ),
            ), // Populate the Drawer in the next step.
        ),




      body: MyRiveAnimation(

      ),),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////HOMEPAGE
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width = 500;
  double height = 200;
  @override
  Widget build(BuildContext context) {
    List<Widget> ScatteredListtiles=[
      Column(
        children: [
          Container(
            child: Column(),

            color: newcolor,
          ),

          Container(

            

            child: ListTile(leading: Text("Events",style: general_text_style),


              ),
          ),
        ],
      ),
      ListTile(
        
          leading: Text("PE-204",style: general_text_style),
          title: Text("3-4AM",style: general_text_style),
          subtitle: Text("TG6-TF8",style: general_text_style)
          ,
          trailing: Icon(Icons.schedule),

          onTap: () {



          }
      ),
      Container(
        alignment: Alignment.bottomCenter,
        child: ListTile(


          trailing: Text("Projects",style: general_text_style),
        ),
      ),

      ListTile(
        leading: Text("Internship/Job Opportunities",style: general_text_style),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                ),

                child: Center(child: ScatteredListtiles[index]),


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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////ADDEVENTSPAGE
class AddEventsPage extends StatefulWidget {
  const AddEventsPage({Key key}) : super(key: key);

  @override
  _AddEventsPageState createState() => _AddEventsPageState();
}

class _AddEventsPageState extends State<AddEventsPage> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        backgroundColor: newcolor,
        body: Container(
          color: newcolor,
          child: Center(
            child: FloatingActionButton(
              elevation: 0,

              backgroundColor: Colors.white,
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
//////////////////////////ADDTOSCHEDULEPAGE
class AddToSchedulePage extends StatefulWidget {
  const AddToSchedulePage({Key key}) : super(key: key);

  @override
  _AddToSchedulePageState createState() => _AddToSchedulePageState();
}

class _AddToSchedulePageState extends State<AddToSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        backgroundColor: newcolor,
        body: Container(
          color: newcolor,
          child: Center(
            child: FloatingActionButton(
              elevation: 0,

              backgroundColor: Colors.white,
              onPressed: (){
                Navigator.pop(context);

              },
            ),
          ),
        ),
      ),
    );;
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////ADDPROJECTPAGE
class AddProjectPage extends StatefulWidget {
  const AddProjectPage({Key key}) : super(key: key);

  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        backgroundColor: newcolor,
        body: Container(
          color: newcolor,
          child: Center(
            child: FloatingActionButton(
              tooltip: "Add Project",
              elevation: 0,

              backgroundColor: Colors.white,
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////EVENTSPAGE

class EventsPage extends StatefulWidget {
  const EventsPage({Key key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}


class _EventsPageState extends State<EventsPage> {

  @override
  Widget build(BuildContext context) {
    return Expanded(


      child: Expanded(
        child: Container(
          alignment: Alignment.center,
          color:Colors.transparent,









          child:
          ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: Events.length,



            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(


                position: index,
                duration: const Duration(milliseconds: 350),
                child: SlideAnimation(
                  verticalOffset: 100.0,
                  child: FlipAnimation(
                      child: Events[index]
                  ),
                ),
              );
            },
          )
          ,


        ),
      ),
    );
  }
}
////////////////////CUSTOMPAGE
class CustomPage extends StatefulWidget {
  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  var event_description_channged;
  var event_name_changed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: newcolor,
        iconTheme:IconThemeData(
          color: Colors.black
        ),
      ),
      backgroundColor: newcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(elevation: 0,
                color: newcolor,
                child: TextField(





                    style: TextStyle(


                        color: Colors.brown,fontSize: 30

                    ),



                    cursorColor: Colors.brown,
                    cursorHeight: 35,

                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.black26,width: 4),
                          borderRadius: BorderRadius.circular(25.0),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.black26,width: 3),
                          borderRadius: BorderRadius.circular(25.0),

                        ),
                        labelText: "Name of the event",
                        hintText:"TELL US!!!!!",
                        helperText: 'Keep it short, this is just a demo.',
                        hintStyle: TextStyle(color: Colors.black26),
                        labelStyle: TextStyle(
                            color: Colors.brown,fontSize: 30
                        ),
                        hoverColor: Colors.brown,
                        fillColor: newcolor,
                        focusColor: Colors.white
                    ),
                    onChanged: ( NameOfEvent) {
                      print("The value entered is : $NameOfEvent");
                      event_name_changed="$NameOfEvent";


                    }
                ),
              ),
            ),




            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(elevation: 0,
                color: newcolor,
                child: TextField(





                  style: TextStyle(


                      color: Colors.brown,fontSize: 30

                  ),



                  cursorColor: Colors.brown,
                  cursorHeight: 35,

                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:  BorderSide(color: Colors.black26,width: 4),
                      borderRadius: BorderRadius.circular(25.0),
                    ),

                      enabledBorder: OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.black26,width: 3),
                        borderRadius: BorderRadius.circular(25.0),

                      ),
                    labelText: "Name of the event",
                    hintText:"TELL US!!!!!",
                      helperText: 'Keep it short, this is just a demo.',
                    hintStyle: TextStyle(color: Colors.black26),
                    labelStyle: TextStyle(
                        color: Colors.brown,fontSize: 30
                    ),
                    hoverColor: Colors.brown,
                    fillColor: newcolor,
                    focusColor: Colors.white
                  ),
                    onChanged: (DescriptionOfEvent) {
                      print("The value entered is : $DescriptionOfEvent");
                       event_description_channged="$DescriptionOfEvent";


                    }
                ),
              ),
            ),
            FloatingActionButton(onPressed: (){
              event_description=event_description_channged;
              event_name=event_name_changed;
              Navigator.push(context, MaterialPageRoute(builder:(context)=>EventsPage()));
              Events.add(Card(
                child: ListTile(
                  title: Text(event_name),
                ),
              ));
            })
          ],
        ),
      ),
    );
  }
}



///////////////////////////////////////////////////////////////////////////////////////ADDINGPAGE
class AddingPage extends StatefulWidget {
  @override
  _AddingPageState createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  PlusAnimation _plusAnimation;
   double width = 500;
   double height = 200;
  Color newcolor=Color(0xfff2efe4);






  Artboard _riveArtboard;
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
  void _events_page_function(bool _eventspressed) {


    if (_adding_to_app_pressed == false) {
      if (_events_pressed == true) {
        newcolor=Color(0xfff2efe4);

        setState(() {
          _events_pressed = _eventspressed;
        });
      }
      else
        newcolor=Color(0xfff2efe4);
    }
  }
  void _adding_page_open_function(bool _adding_page_active) {
    if (_plusAnimation == null) {
      _riveArtboard.addController(
        _plusAnimation = PlusAnimation('Plus'),
      );
    }


    if (_adding_page_active == true) {

      _plusAnimation.start();


    } else {
      _plusAnimation.reverse();
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

    List<Icon> myicons=[
      Icon(FontAwesomeIcons.star,color: Colors.purple,),
      Icon(Icons.schedule_outlined,color: Colors.black,),
      Icon(FontAwesomeIcons.tasks,color: Colors.greenAccent,),
    ];
    List<Text> titlelist=[
      Text("Add to Events",style: general_text_style),
      Text("Add to Schedule",style: general_text_style),
      Text("Share details about Projects",style: general_text_style),
    ];
    List<Text> subtitlelist=[
      Text("Update via this feature to let people know the details of any event"),
      Text("Update your personal schedule with new tasks assigned like self study,sports.etc"),
      Text(
          "Update via this feature to let people know the details of any projects in DTU, looking for Volunteers"),

    ];
    List<Card> AddingButtons=[
      Card(elevation: 0,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>CustomPage()));


            },
            leading:Icon(FontAwesomeIcons.star,color: Colors.purple,) ,
            title: Text("Add to Events",style: general_text_style),
            subtitle: Text("Update via this feature to let people know the details of any event"),

          ),
        ),

      ),
      Card(elevation: 0,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>AddToSchedulePage()));

            },
            leading:Icon(Icons.schedule_outlined,color: Colors.black,),
            title: Text("Add to Schedule",style: general_text_style),
            subtitle: Text("Update your personal schedule with new tasks assigned like self study,sports.etc"),

          ),
        ),

      ),
      Card(
        elevation: 0,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>AddProjectPage()));

            },
            leading:Icon(FontAwesomeIcons.tasks,color: Colors.greenAccent,),
            title: Text("Share details about Projects",style: general_text_style),
            subtitle: Text(
                "Update via this feature to let people know the details of any projects in DTU, looking for Volunteers"),

          ),
        ),

      ),

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
                  child: AddingButtons[index]
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
////////////////////////////////////////////////////RIVEANIMATION

class MyRiveAnimation extends StatefulWidget {
  @override
  _MyRiveAnimationState createState() => _MyRiveAnimationState();
}

class _MyRiveAnimationState extends State<MyRiveAnimation> {
  PlusAnimation _plusAnimation;
  static const double width = 500;
  static const double height = 200;
  Color newcolor=Color(0xfff2efe4);






  Artboard _riveArtboard;




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
 void _events_page_function(bool _eventspressed) {
   if (_adding_to_app_pressed == false) {
     if (_events_pressed == true) {
        newcolor=Color(0xfff2efe4);

       setState(() {
         _events_pressed = _eventspressed;
       });
     }
     else
       newcolor=Color(0xfff2efe4);
   }
 }
  void _adding_page_open_function(bool _adding_page_active) {
    if (_plusAnimation == null) {
      _riveArtboard.addController(
        _plusAnimation = PlusAnimation('Plus'),
      );
    }


    if (_adding_page_active == true) {

      _plusAnimation.start();
      newcolor=Color(0xfff2efe4);

    } else {
      _plusAnimation.reverse();
      if (_events_pressed==true){
      newcolor=Color(0xfff2efe4);
    }
      else if(_events_pressed==false){
        newcolor=Color(0xfff2efe4);
      }
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
          if(_adding_to_app_pressed==false && _events_pressed==false)

            Container(
              height: 200,

              child:   SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(

                  children: [

                    CircleAvatar(


                      backgroundColor: newcolor,
                      radius: 5,
                    ),

                    CircleAvatar(
                      child:
                      ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>AddEventsPage()));
                        },
                      ),
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: newcolor,
                      radius: 5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: newcolor,
                      radius: 5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: newcolor,
                      radius: 5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: newcolor,
                      radius: 5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: newcolor,
                      radius: 5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: newcolor,
                      radius: 5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: newcolor,
                      radius: 5,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: newcolor,
                      radius: 5,
                    ),

                  ],
                ),
              ),

              color: newcolor,
            )
          else Container(
            height: 200,
            color: newcolor,
          ),


          //NAVIGATION OF PAGES
          if (_adding_to_app_pressed == true) AddingPage() else if(_events_pressed==true) EventsPage()
              else HomePage(),





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
                            if(_events_pressed==true) {
                              _events_pressed = !_events_pressed;



                              _plusAnimation.isActive = false;
                              _riveArtboard.addController(
                                  _plusAnimation = PlusAnimation('home'));
                            }  });
                        }

                      } else if (internshiptouched) {
                        if (!_adding_to_app_pressed) {
                          setState(() {




                            _plusAnimation.isActive = false;
                            _riveArtboard.addController(
                                _plusAnimation = PlusAnimation('internship'));
                          });
                        }
                      } else if (lowerblanktouched) {
                        setState(() {
                          _adding_to_app_pressed = !_adding_to_app_pressed;
                          _adding_page_open_function(_adding_to_app_pressed);
                        });
                      } else if (eventstouched) {
                        if (!_adding_to_app_pressed) {
                          setState(() {


                            _events_pressed=!_events_pressed;
                            _events_page_function(_events_pressed);
                            _plusAnimation.isActive = false;
                            _riveArtboard.addController(
                                _plusAnimation = PlusAnimation('events'));
                          });
                        }
                      } else if (profiletouched) {
                        if (!_adding_to_app_pressed) {
                          setState(() {


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
                        _adding_page_open_function(_adding_to_app_pressed);


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

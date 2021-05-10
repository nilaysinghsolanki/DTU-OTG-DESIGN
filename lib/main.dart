import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:nilay_dtuotg_2/plus_controller.dart';
import 'package:rive/rive.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context1) {
    return MaterialApp(



      title: 'Rive Flutter Demo',
      home: Scaffold(




      body: MyRiveAnimation(),),
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





  Artboard _riveArtboard;
  bool _wipers = false;


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

  void _animationchanged(bool wipersOn) {
    if (_plusAnimation == null) {
      _riveArtboard.addController(
        _plusAnimation = PlusAnimation('Plus'),
      );
    }

    if (wipersOn == true) {
      _plusAnimation.start();
      newcolor=Colors.lightGreenAccent;

    } else {
      _plusAnimation.reverse();
      newcolor=Colors.greenAccent;
    }

    setState(() {
      if (wipersOn == true) {
        _plusAnimation.isActive = false;
        _riveArtboard.addController(_plusAnimation = PlusAnimation('Plus'));

        print("wiperson");
      }
      _wipers = wipersOn;
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
          _wipers == true ? Expanded(


            child: Container(
              alignment: Alignment.center,
              color:Colors.transparent,









      child:
                ListView.builder(


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
          )
    :Flexible(
            child:  StaggeredGridView.countBuilder(
physics: BouncingScrollPhysics(),




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
          ),



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
                        if (!_wipers) {
                          setState(() {
                            _plusAnimation.isActive = false;
                            _riveArtboard.addController(
                                _plusAnimation = PlusAnimation('home'));
                          });
                        }
                      } else if (internshiptouched) {
                        if (!_wipers) {
                          setState(() {
                            _plusAnimation.isActive = false;
                            _riveArtboard.addController(
                                _plusAnimation = PlusAnimation('internship'));
                          });
                        }
                      } else if (lowerblanktouched) {
                        setState(() {
                          _wipers = !_wipers;
                          _animationchanged(_wipers);
                        });
                      } else if (eventstouched) {
                        if (!_wipers) {
                          setState(() {
                            _plusAnimation.isActive = false;
                            _riveArtboard.addController(
                                _plusAnimation = PlusAnimation('events'));
                          });
                        }
                      } else if (profiletouched) {
                        if (!_wipers) {
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
                        _wipers = !_wipers;
                        _animationchanged(_wipers);


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

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false,
    home:VideoApp()));


class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController? _controller1;
  VideoPlayerController? _controller2;
  @override
  void initState() {
    super.initState();
    _controller2 = VideoPlayerController.asset(
        'assets/video/natue.video.mp4')
      ..initialize().then(
        (_) {
          setState(() {
_controller2!.play();
_controller2!.setLooping(true);
            _controller2!.setVolume(1.0);
          });
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    PageController controller =PageController();
    List<Widget> reel=[
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,color:Colors.blueGrey),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          child:SafeArea(child:Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller2!.value.size.width,
                        height: _controller2!.value.size.height,
                        child: VideoPlayer(_controller2!),),)),
                const SizedBox(height:325),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:  [
                          const  Icon(
                            Icons.account_circle,
                            size: 25,
                            color: Colors.white,
                          ),
                          const   SizedBox(height: 50),
                          const Icon(
                            Icons.message_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                          const  Text("549.5k"),
                          const  SizedBox(height: 40),
                          const Icon(
                            Icons.favorite_outline_outlined,
                            size: 25,
                            color: Colors.white,
                          ),   const  Text("9.5k"),
                          const   SizedBox(height: 40),
                          const  Icon(
                            Icons.arrow_right_rounded,
                            size: 25,
                            color: Colors.white,
                          ),   const  Text("5.5k"),
                          const   SizedBox(height: 40),
                          BottomNavigationBar(
                            selectedItemColor: Colors.white,
                            backgroundColor: Colors.black,
                            type: BottomNavigationBarType.fixed,
                            items:  const [
                              BottomNavigationBarItem(
                                icon: Icon(Icons.home_outlined,
                                    color: Colors.white),
                                label: 'Home',
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.search_outlined,
                                    color: Colors.white),
                                label: 'Discover',
                              ),
                              BottomNavigationBarItem(
                                icon:
                                Icon(Icons.add_to_queue, color: Colors.white),
                                label: '',
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.message_outlined,
                                    color: Colors.white),
                                label: 'Notifications',
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(Icons.person_outline,
                                    color: Colors.white),
                                label: 'Profile',
                              ),
                            ],
                          )
                        ],
                      ),

                    ])
              ]),
          )),


       Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:Colors.blueGrey,
        child:SafeArea(child:Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller2?.value.size.width,
                  height: _controller2?.value.size.height,
                  child: VideoPlayer(_controller2!),),)),
             const SizedBox(height:325),
                Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                        const  Icon(
                              Icons.account_circle,
                              size: 25,
                              color: Colors.white,
                            ),
                         const   SizedBox(height: 50),
                           const Icon(
                              Icons.message_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                            const  Text("549.5k"),
                          const  SizedBox(height: 40),
                            const Icon(
                              Icons.favorite_outline_outlined,
                              size: 25,
                              color: Colors.white,
                            ),   const  Text("9.5k"),
                         const   SizedBox(height: 40),
                          const  Icon(
                              Icons.arrow_right_rounded,
                              size: 25,
                              color: Colors.white,
                            ),   const  Text("5.5k"),
                            const   SizedBox(height: 40),
                            BottomNavigationBar(
                              selectedItemColor: Colors.white,
                              backgroundColor: Colors.black,
                              type: BottomNavigationBarType.fixed,
                              items:  const [
                                BottomNavigationBarItem(
                                  icon: Icon(Icons.home_outlined,
                                      color: Colors.white),
                                  label: 'Home',
                                ),
                                BottomNavigationBarItem(
                                  icon: Icon(Icons.search_outlined,
                                      color: Colors.white),
                                  label: 'Discover',
                                ),
                                BottomNavigationBarItem(
                                  icon:
                                  Icon(Icons.add_to_queue, color: Colors.white),
                                  label: '',
                                ),BottomNavigationBarItem(
                                  icon: Icon(Icons.message_outlined,
                                      color: Colors.white),
                                  label: 'Notifications',
                                ),
                                BottomNavigationBarItem(
                                  icon: Icon(Icons.person_outline,
                                      color: Colors.white),
                                  label: 'Profile',
                                ),
                              ],
                            )
                          ],
                        ),

                    ])
            ]),
         ))];

    return  Scaffold(
        body: Container(child:PageView(
        children:reel,
        controller:controller,
        scrollDirection:Axis.vertical,
    ),));
  }}



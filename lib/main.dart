import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orientation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrientationPage(),
    );
  }
}

class OrientationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation Example'),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return orientation == Orientation.portrait
              ? buildPortraitLayout()
              : buildLandscapeLayout();
        },
      ),
    );
  }

  Widget buildPortraitLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        CircleAvatar(
          radius: 150,
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
        SizedBox(height: 20),
        Text(
          'Hello, World!',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Text(
          'This is my assignment.',
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                GridTile(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey,
                      child: Center(child: Text('Item 1')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridTile(
                    child: Container(
                      color: Colors.grey,
                      child: Center(child: Text('Item 2')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridTile(
                    child: Container(
                      color: Colors.grey,
                      child: Center(child: Text('Item 3')),
                    ),
                  ),
                ),
                GridTile(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey,
                      child: Center(child: Text('Item 4')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLandscapeLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Hello, World!',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                'This is my assignment.',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      GridTile(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey,
                            child: Center(child: Text('Item 1')),
                          ),
                        ),
                      ),
                      GridTile(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey,
                            child: Center(child: Text('Item 2')),
                          ),
                        ),
                      ),
                      GridTile(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey,
                            child: Center(child: Text('Item 3')),
                          ),
                        ),
                      ),
                      GridTile(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.grey,
                            child: Center(child: Text('Item 4')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// reference : https://www.youtube.com/watch?v=GeMJz3EcBgs&list=PLcC_LKiQQc1wXCYljwrcFvPECcyIKIwkR&index=2&ab_channel=TechieBlossom
// UI : https://dribbble.com/shots/5662956-Flight-Tickets-Deal-Tracker-App-Day-340-365-Project365

import 'package:flutter/material.dart';

import './UnderDev.dart';
import './UnderDevPage.dart';
import './CustomAppBar.dart';
import './CustomShapeClipper.dart';
import './flight_listPage.dart';

void main() => runApp(MyApp());

var currVal = locations[0];
var isFlightSelected = false;
var isHotelSelected = false;
var _textController = TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flight Tickets',
      theme: appTheme,
      home: MyHomePage(),
      routes: {
        '/flightLists': (ctx) => FlightListPage(
              from: currVal,
              destination: _textController.value.text,
            ),
        '/underDevPage': (ctx) => UnderDevPage(),
      },
    );
  }
}

ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFFF3791A),
  fontFamily: 'Oxygen',
);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // index for Bottom Nav Bar.

  void _onTap(int newIndex) {
    // Callback function for Bottom Nav Bar
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomAppBar(
        tapHandler: _onTap,
        currIndex: _selectedIndex,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _selectedIndex == 0 ? UpperContainer() : UnderDev(),
            _selectedIndex == 0 ? LowerContainer() : SizedBox(height: .0),
          ],
        ),
      ),
    );
  }
}

List<String> locations = ['Boston (BOS)', 'New York (JFK)'];

class UpperContainer extends StatefulWidget {
  @override
  _UpperContainerState createState() => _UpperContainerState();
}

class _UpperContainerState extends State<UpperContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0XFFF47D15), Color(0XFFEF772C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 35.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 22.0,
                      ),
                      SizedBox(width: 5.0),
                      DropdownButton<String>(
                        value: currVal,
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.white,
                          size: 16.0,
                        ),
                        underline: Container(
                          height: 0,
                        ),
                        items: locations.map((String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(
                              val,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontFamily: 'Oxygen',
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          );
                        }).toList(),
                        selectedItemBuilder: (BuildContext ctx) {
                          return locations.map((String val) {
                            return DropdownMenuItem<String>(
                              child: Center(
                                child: Text(
                                  val,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Oxygen',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          }).toList();
                        },
                        onChanged: (String? newVal) {
                          setState(() {
                            currVal = newVal!;
                          });
                        },
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/underDevPage');
                        },
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 22.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                  child: Container(
                    child: Center(
                      child: Text(
                        'Where would',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontFamily: 'Oxygen',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    child: Center(
                      child: Text(
                        'you want to go?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontFamily: 'Oxygen',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 40.0,
                  child: TextField(
                    controller: _textController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    cursorColor: appTheme.primaryColor,
                    onSubmitted: (String ipVal) {
                      if (ipVal.isNotEmpty)
                        Navigator.of(context).pushNamed('/flightLists');
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20.0),
                      suffixIcon: Material(
                        elevation: 3.0,
                        shadowColor: Colors.black87,
                        borderRadius: BorderRadius.circular(40.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          onPressed: () {
                            if (_textController.value.text.isNotEmpty)
                              Navigator.of(context).pushNamed('/flightLists');
                          },
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ChoiceChip(
                      labelPadding: EdgeInsets.all(7.0),
                      selected: isFlightSelected,
                      onSelected: (bool newState) {
                        setState(() {
                          isFlightSelected = newState;
                        });
                      },
                      backgroundColor: Color(0XFFEF772C),
                      selectedColor: Colors.orange,
                      label: Row(
                        children: <Widget>[
                          Icon(Icons.flight, color: Colors.white),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            'Flights',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0),
                    ChoiceChip(
                      labelPadding: EdgeInsets.all(7.0),
                      selected: isHotelSelected,
                      onSelected: (bool newState) {
                        setState(() {
                          isHotelSelected = newState;
                        });
                      },
                      backgroundColor: Color(0XFFEF772C),
                      selectedColor: Colors.orange,
                      label: Row(
                        children: <Widget>[
                          Icon(Icons.hotel, color: Colors.white),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            'Hotels',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LowerContainer extends StatelessWidget {
  final cityList = ['Las Vegas', 'Athens', 'Sydney'];
  final cityDates = ['Feb 2019', 'April 2019', 'Nov 2019'];
  final discounts = ['45%', '55%', '70%'];
  final price = ['\$2,250.00', '\$4,159.00', '\$2,599.00'];
  final imageList = [
    Image.asset(
      './assets/images/lasvegas.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      './assets/images/athens.jpg',
      fit: BoxFit.cover,
    ),
    Image.asset(
      './assets/images/sydney.jpeg',
      fit: BoxFit.cover,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Currently Watched Items',
                style: TextStyle(
                  fontFamily: 'Oxygen',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext ctx) {
                        return UnderDevPage();
                      },
                    ),
                  );
                },
                child: Text(
                  'View All(12)',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Oxygen',
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFF47D15),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.0),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/underDevPage');
          },
          child: InfoCard(
            cityList: cityList,
            imageList: imageList,
            cityDates: cityDates,
            discounts: discounts,
            price: price,
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.cityList,
    required this.imageList,
    required this.cityDates,
    required this.discounts,
    required this.price,
  }) : super(key: key);

  final List<String> cityList;
  final List<Image> imageList;
  final List<String> cityDates;
  final List<String> discounts;
  final List<String> price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35 + 35.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cityList.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width * 0.45,
                      padding: EdgeInsets.only(left: 15.0, right: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: imageList[index],
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 10.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: ListTile(
                          title: Text(
                            cityList[index],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            cityDates[index],
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                          trailing: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 7.0,
                            ),
                            margin: EdgeInsets.only(right: 8.0),
                            child: Text(
                              discounts[index],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.0),
                Container(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    price[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

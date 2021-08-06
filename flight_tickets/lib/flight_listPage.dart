import 'package:flutter/material.dart';

import 'CustomShapeClipper.dart';

const Color discountBGcolor = Color(0xFFfde0c8);
const Color discountColor = Color(0xFFdf7132);
const Color flightBorderColor = Color(0xFFE6E6E6);
const Color chipBGcolor = Color(0xFFf4f4f4);

class FlightListPage extends StatelessWidget {
  final from;
  final destination;

  FlightListPage({@required this.from, @required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Results',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0, // removes shadow.
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FlightListUpperContainer(from, destination),
            FlightListLowerContainer(),
          ],
        ),
      ),
    );
  }
}

class FlightListUpperContainer extends StatefulWidget {
  final from;
  final dest;
  FlightListUpperContainer(this.from, this.dest);

  @override
  _FlightListUpperContainerState createState() =>
      _FlightListUpperContainerState();
}

class _FlightListUpperContainerState extends State<FlightListUpperContainer> {
  var from;
  var dest;

  @override
  void initState() {
    super.initState();
    from = widget.from;
    dest = widget.dest;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          right: 10.0,
          bottom: 20.0,
          child: Card(
            elevation: 15.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 250.0,
                    height: 70.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          from,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 10.0,
                          child: Center(
                            child: Container(
                              height: 4.0,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          dest,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        var temp = from;
                        from = dest;
                        dest = temp;
                      });
                    },
                    icon: Icon(Icons.import_export, size: 30.0),
                  ),
                  SizedBox(width: 17.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<String> prices = ['\$4,159', '\$5,199', '\$6,599', '\$7,099'];
List<String> discounts = ['55%', '15%', '20%', '20%'];
List<String> ratings = ['4.6', '4.3', '4.4', '4.8'];
List<String> dates = ['June 2019', 'Feb 2019', 'Jan 2019', 'Jan 2019'];
List<String> airlines = [
  'Cathay Pacific',
  'American Airlines',
  'Jet Airways',
  'British Airlines',
];

class FlightListLowerContainer extends StatelessWidget {
  const FlightListLowerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Best Deals for next 6 months',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 15.0),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8 - 155.0,
            child: DiscountList(),
          ),
        ],
      ),
    );
  }
}

class DiscountList extends StatelessWidget {
  const DiscountList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: prices.length,
      itemBuilder: (BuildContext ctx, int index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/underDevPage');
          },
          child: IntrinsicWidth(
            child: Container(
              height: 120.0,
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.only(
                left: 15.0,
                right: 10.0,
                top: 10.0,
                bottom: 10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: flightBorderColor, width: 2.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        prices[index],
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Chip(
                        backgroundColor: discountBGcolor,
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          color: discountColor,
                          fontWeight: FontWeight.bold,
                        ),
                        label: Text(discounts[index]),
                      ),
                      SizedBox(width: 10.0),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Chip(
                        avatar: Icon(Icons.calendar_today),
                        label: Text(dates[index]),
                        backgroundColor: chipBGcolor,
                      ),
                      SizedBox(width: 5.0),
                      Chip(
                        avatar: Icon(Icons.flight),
                        label: Text(airlines[index]),
                        backgroundColor: chipBGcolor,
                      ),
                      SizedBox(width: 5.0),
                      Chip(
                        avatar: Icon(Icons.star),
                        label: Text(ratings[index]),
                        backgroundColor: chipBGcolor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:covidapp/model/covidModel.dart';
import 'package:covidapp/services/network.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class FutureWidget extends StatefulWidget {
  @override
  _FutureWidgetState createState() => _FutureWidgetState();
}

const basicHeading = TextStyle(
    fontFamily: 'Teko',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.teal);

const basicText = TextStyle(
    fontFamily: 'Teko',
    fontSize: 25,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
    color: Colors.white);

class _FutureWidgetState extends State<FutureWidget> {
  Future<CovidModel> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = Network().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: FutureBuilder(
            future: data,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // return Text(snapshot.data.ghana.time);
                return Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'GHANA\'S COVID-19 DATA',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Teko',
                          letterSpacing: 2,
                        ),
                      ),
                      Divider(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CardItems(
                              snapshot: snapshot,
                              textInfo: snapshot.data.ghana.confirmed,
                              title: 'Confirmed Cases',
                              icon: Icon(
                                Icons.countertops,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: CardItems(
                              snapshot: snapshot,
                              textInfo: snapshot.data.ghana.recovered,
                              title: 'Recovered Cases',
                              icon: Icon(
                                Icons.countertops,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // buildMarquee(),
                      Text(
                        'Active cases: ${int.parse(snapshot.data.ghana.confirmed) - int.parse(snapshot.data.ghana.recovered)}',
                        style: TextStyle(
                          fontFamily: 'Teko',
                          fontSize: 20,
                          letterSpacing: 3.0,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: CardItems(
                              snapshot: snapshot,
                              textInfo: snapshot.data.ghana.deaths,
                              title: 'Death',
                              icon: Icon(
                                Icons.countertops,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: CardItems(
                              snapshot: snapshot,
                              textInfo: snapshot.data.ghana.time,
                              title: '${snapshot.data.ghana.date}',
                              icon: Icon(
                                Icons.countertops,
                                size: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Powered by Mishrule Trade LTD',
                        style: TextStyle(
                          fontFamily: 'Teko',
                          letterSpacing: 2,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Widget CardItems(
      {AsyncSnapshot snapshot, String title, String textInfo, Icon icon}) {
    return SizedBox(
      height: 210,
      child: Card(
        child: Column(
          // mainAxisAlignment:
          // MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 30),
              child: Text(title, style: basicHeading),
            ),
            Text(
              textInfo,
              style: basicText,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}

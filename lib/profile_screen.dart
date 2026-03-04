import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Influencer Profile"),
        backgroundColor: Colors.pink[400],
      ),

      body: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[

          SizedBox(height: 20.0),

          // Name
          Text(
            "Raisa Tabassum",
            style: TextStyle(
              fontSize: 26.0,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 10.0),

          Text(
            "Age: 23",
            style: TextStyle(fontSize: 18.0),
          ),

          SizedBox(height: 20.0),

          // Social Media Card
          Card(
            margin: EdgeInsets.all(15.0),
            color: Colors.grey[200],
            elevation: 5.0,

            child: Container(
              padding: EdgeInsets.all(20.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,

                children: <Widget>[

                  Text("Facebook Followers: 120K"),
                  SizedBox(height: 8.0),

                  Text("YouTube Subscribers: 85K"),
                  SizedBox(height: 8.0),

                  Text("Instagram Followers: 150K"),

                ],
              ),
            ),
          ),

          // Collaboration Info Card
          Card(
            margin: EdgeInsets.all(15.0),
            color: Colors.grey[200],
            elevation: 5.0,

            child: Container(
              padding: EdgeInsets.all(20.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,

                children: <Widget>[

                  Text("Past Collaborations: 32"),
                  SizedBox(height: 8.0),

                  Text("Rating: 4.8 / 5"),
                  SizedBox(height: 8.0),

                  Text("Pending Jobs: 3"),
                  SizedBox(height: 8.0),

                  Text("Total Offers Received: 58"),

                ],
              ),
            ),
          ),

          SizedBox(height: 20.0),

          // Button Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[

              ElevatedButton(
                onPressed: () {},
                child: Text("Edit Profile"),
              ),

              ElevatedButton(
                onPressed: () {},
                child: Text("View Offers"),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
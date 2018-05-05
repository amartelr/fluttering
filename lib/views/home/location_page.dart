import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => new _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationResult locations;
  StreamSubscription<LocationResult> streamSubscription;
  bool trackLocation = false;

  @override
  initState() {
    super.initState();
    checkGps();

    trackLocation = false;
    locations = null;
  }

  getLocations() {
    if (trackLocation) {
      setState(() => trackLocation = false);
      streamSubscription.cancel();
      streamSubscription = null;
      locations = null;
    } else {
      setState(() => trackLocation = true);

      streamSubscription = Geolocation
          .locationUpdates(
        accuracy: LocationAccuracy.best,
        displacementFilter: 0.0,
        inBackground: false,
      )
          .listen((result) {
        final location = result;
        setState(() {
          locations = location;
        });
      });

      streamSubscription.onDone(() => setState(() {
            trackLocation = false;
          }));
    }
  }

  checkGps() async {
    // final GeolocationResult result = await Geolocation.isLocationOperational();
    // if (result.isSuccessful) {
    //   print("Success");
    // } else {
      final perms = const LocationPermission(
          android: LocationPermissionAndroid.fine,
          ios: LocationPermissionIOS.always
        );

        final req = await Geolocation.requestLocationPermission(perms);

        if (!req.isSuccessful) {
          print("ERROR GPS");
        }
        else
        {
          getLocations();
        }
  //  }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('GeoLocation example'),
        actions: <Widget>[
          FlatButton(
            child: Text("Get Location"),
            onPressed: getLocations,
          )
        ],
      ),
      body: Center(
          child: Container(
        child: ListView(
          children: [
            Image.network(locations == null
                ? ""
                : "https://maps.googleapis.com/maps/api/staticmap?center=${locations.location.latitude},${locations.location.longitude}&zoom=12&size=400x400&key=YOUR_API_KEY")
          ],
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ip_info_app/data/ip_info_datasourse.dart';

import 'widgets/info_title_text.dart';
import 'widgets/ipfo_text.dart';
import 'widgets/my_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController IpinputFild = TextEditingController();

  String IpAdderss = "No Ip";
  String city = "None";
  String region = "None";
  String country = "None";
  String latLong = "None";
  String operator = "None";
  String postalCode = "None";
  String timeZone = "None";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff0F0817),
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Group .png"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: IpinputFild,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    fillColor: Color(0xff1E133E),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    my_button(
                      text: "My Ip",
                      icon: Image.asset(
                        "assets/my_ip .png",
                        width: 25,
                      ),
                      onPressed: () async {
                        String ipfromDataSourse = await IpData.getMyIpAddress();
                        IpinputFild.text = ipfromDataSourse;
                        setState(() {
                          IpAdderss = ipfromDataSourse;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    my_button(
                        text: "Get Info",
                        icon: Image.asset(
                          "assets/get_info.png",
                          width: 25,
                        ),
                        onPressed: () async {
                          Map ipInfo =
                              await IpData.getIpInformation(IpinputFild.text);
                          setState(() {
                            city = ipInfo["city"];
                            region = ipInfo["region"];
                            country = ipInfo["country"];
                            latLong = ipInfo["loc"];
                            operator = ipInfo["org"];
                            postalCode = ipInfo["postal"];
                            timeZone = ipInfo["timezone"];
                          });
                        }),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    "Information about the Ip",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Text(
                    "${IpAdderss}",
                    style: TextStyle(color: Colors.white, fontSize: 32.0),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InfoTileText(text: "City"),
                        InfoTileText(text: "Region"),
                        InfoTileText(text: "Country"),
                        InfoTileText(text: "Late and Long"),
                        InfoTileText(text: "Operator"),
                        InfoTileText(text: "Postal Code"),
                        InfoTileText(text: "Time Zone"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoText(text: "$city"),
                          InfoText(text: "$region"),
                          InfoText(text: "$country"),
                          InfoText(text: "$latLong"),
                          InfoText(
                              text:
                                  "${operator.length > 20 ? operator.substring(0, 20) : operator}"),
                          InfoText(text: "$postalCode"),
                          InfoText(text: "$timeZone"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

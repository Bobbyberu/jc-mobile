import 'package:flutter/material.dart';
import 'package:mobile/controllers/commonController.dart';
import 'package:mobile/widgets/lot.dart';

import 'models/lotDto.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<LotDto>> futureLots;

  @override
  void initState() {
    super.initState();
    CommonController commonController = new CommonController();
    futureLots = commonController.getAllLot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            // child: new Lot(lot: lotDto)
            child: FutureBuilder<List<LotDto>>(
                future: futureLots,
                builder: (context, lots) {
                  if (lots.hasData) {
                    List<LotDto> result = lots.data;
                    return ListView.builder(
                        itemCount: lots.data.length,
                        itemBuilder: (context, i) {
                          return Lot(
                              lot: new LotDto(
                                  id: result[i].id,
                                  name: result[i].name,
                                  creationDate: result[i].creationDate));
                        });
                  } else if (lots.hasError) {
                    return Text("${lots.error}");
                  } else {
                    return CircularProgressIndicator();
                  }
                })));
  }
}

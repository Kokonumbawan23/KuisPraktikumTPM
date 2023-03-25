import 'package:flutter/material.dart';
import './disease_data.dart';

class Detail extends StatefulWidget {
  final Diseases disease;
  bool liked = false;

  Detail({Key? key, required this.disease}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.disease.name),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.liked = !widget.liked;
                  });

                  widget.liked
                      ? ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                          content: Text('Halaman telah disukai'),
                          duration: Duration(seconds: 1),
                        ))
                      : ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                          content: Text('Halaman tidak disukai'),
                          duration: Duration(seconds: 1),
                        ));
                },
                child: widget.liked
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border)),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.disease.imgUrls,
                      fit: BoxFit.fill,
                    ),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              widget.disease.name,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Disease Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        widget.disease.name,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plant Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.disease.plantName,
                          textAlign: TextAlign.start),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ciri-ciri',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.disease.nutshell
                            .map((e) => Text(
                                  '- ' + e,
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Disease ID',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        widget.disease.id,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Symptom',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Text(widget.disease.symptom),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}

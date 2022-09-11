import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


enum Service { amazing, good, ok }  

class _HomePageState extends State<HomePage> {

  Service _serviceQual = Service.amazing;
  var _round = false;
  var _txtCost = TextEditingController();
  String _tipString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Time'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _txtCost,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.room_service),
                labelText: "Cost of Service",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.dinner_dining, 
                  color: Colors.grey,
                ),   
                SizedBox(width:20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      Text(
                        "How was the service",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(width:20),
                      ListTile(
                        title: Text("Amazing (20%)"),
                        leading: 
                        Radio(
                          value: Service.amazing, 
                          groupValue: _serviceQual, 
                          onChanged: (value){
                            setState(() {
                              _serviceQual=value as Service;
                            });
                          }
                        ),
                      ),
                      ListTile(
                        title: Text("Good (18%)"),
                        leading: 
                        Radio(
                          value: Service.good, 
                          groupValue: _serviceQual, 
                          onChanged: (value){
                            setState(() {
                              _serviceQual=value as Service;
                            });
                          }
                        ),
                      ),
                      ListTile(
                        title: Text("Ok (15%)"),
                        leading: Radio(
                          value: Service.ok, 
                          groupValue: _serviceQual, 
                          onChanged: (value){
                            setState(() {
                              _serviceQual=value as Service;
                            });
                          }
                        ),
                      )
                    ],
                    
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.credit_card, 
                      color: Colors.grey,
                    ),
                    SizedBox(width:20),
                    Text(
                      "Round up tip",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),   
                Switch(
                  value: _round, 
                  onChanged: (value){
                    setState(() {
                      _round = value;
                    });
                  }
                ),
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              child: Text("Calculate"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(35), // NEW
              ),
                onPressed: _tipCalculation
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Tip amount: \$${_tipString}"),
              ],
            )
          ],
        ),
      )
    );
  }
  void _tipCalculation(){
    double cost = double.parse(_txtCost.text.isEmpty?"0":_txtCost.text);
    double tip = 12;
    double value=0;
    switch (_serviceQual){
      case Service.amazing:
      value=.20;
      break;
      case Service.good:
      value=.18;
      break;
      case Service.ok:
      value=.15;
      break;
    }
    tip=cost*value;
    _tipString=_round?tip.ceil().toString():tip.toStringAsFixed(2);
    setState(() {
      
    });
  }
}
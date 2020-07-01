import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Employee.dart';
import 'EmployeeBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //TODO: 1)---------------------
  final EmployeeBloc _employeeBloc=EmployeeBloc();

  //TODO: 2)----------------------
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _employeeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee App"),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream,
          builder: (BuildContext context,AsyncSnapshot<List<Employee>> snapshot){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${snapshot.data[index].id}.",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${snapshot.data[index].name}",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),Text(
                              "\$${snapshot.data[index].salary}",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        )
                      ),
                      Container(
                        child: IconButton(icon: Icon(Icons.thumb_up),color: Colors.green, onPressed: (){
                          _employeeBloc.employeeSalaryIncrement.add(snapshot.data[index]);
                        }),
                      ),
                      Container(
                        child: IconButton(icon: Icon(Icons.thumb_down),color: Colors.red, onPressed: (){
                          _employeeBloc.employeeSalaryDecrement.add(snapshot.data[index]);
                        }),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

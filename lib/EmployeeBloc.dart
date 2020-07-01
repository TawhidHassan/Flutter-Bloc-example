//TODO: 1)import
import 'dart:async';
import 'Employee.dart';

//TODO: 2)List of emmpolyee
class EmployeeBloc{

  //sink to add in pipe
  //stream to get data from pipe
  //by pipe i mean data flow

  List <Employee> _employeeList=[
    Employee(1, "sifat2", 2000.0),
    Employee(2, "sifat8", 22000.0),
    Employee(3, "sifat9", 20200.0),
    Employee(4, "sifat11", 22000.0),
    Employee(5, "sifat10", 20300.0),
  ];

   //TODO: 3)Stream controllers
     final _employeeListStreamController=StreamController<List<Employee>>();
  //for inc and dec
     final _employeeSalaryIncrementStreamController=StreamController<Employee>();
     final _employeeSalaryDecrementStreamController=StreamController<Employee>();

  //TODO: 4)Stream sink getter
  StreamSink<List<Employee>>get employeeListSink=>_employeeListStreamController.sink;
  Stream<List<Employee>> get employeeListStream=>_employeeListStreamController.stream;

  StreamSink<Employee>get employeeSalaryIncrement=>_employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee>get employeeSalaryDecrement=>_employeeSalaryDecrementStreamController.sink;

//TODO: 5)Constructor -add data;listen to change
  EmployeeBloc()
  {
    _employeeListStreamController.add(_employeeList);

    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);

  }

  //TODO: 6)create core functions
  _incrementSalary(Employee employee){
    double salary=employee.salary;
    double incrementedSalary=salary*20/100;

    //update on class
    _employeeList[employee.id-1].salary=salary+incrementedSalary;

    //add to sink if not use that the listen not work
    employeeListSink.add(_employeeList);
  }
  _decrementSalary(Employee employee){
    double salary=employee.salary;
    double decrementedSalary=salary*20/100;

    //update on class
    _employeeList[employee.id-1].salary=salary-decrementedSalary;

    //add to sink if not use that the listen not work
    employeeListSink.add(_employeeList);
  }

//TODO: 7)dispose

void dispose()
{
  _employeeSalaryIncrementStreamController.close();
  _employeeSalaryDecrementStreamController.close();
  _employeeListStreamController.close();
}


}






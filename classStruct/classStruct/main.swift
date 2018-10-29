//
//  main.swift
//  classStruct
//
//  Created by WangShuanghai on 2018/10/29.
//  Copyright © 2018 双海. All rights reserved.
//

import Foundation

//test class/struct

let str_ = "-------------------------------------"
func prints_(str: String)
{
    print(str)
}
class Employee
{
    var no: Int = 0         //员工编号
    var name: String = ""   //员工姓名
    var job: String?        //职务
    var salary: Double = 0  //薪资
    
    var dept: Department?   //所属部门
}

struct Department
{
    var no: Int = 0   //部门编号
    var name: String = ""  //部门名称
}

var dept = Department()
dept.no = 10
dept.name = "Sales"

let emp = Employee()
emp.no = 1000
emp.name = "Martin"
emp.job = "Salesman"
emp.salary = 1250
emp.dept = dept

func updateDept(dept: inout Department)
{
    dept.name = "Research"
}
print("Department更新前：\(dept.name)")
updateDept(dept:&dept)
print("Department更新后：\(dept.name)")

func updateEmp(emp:Employee)
{
    emp.job = "Clerk"
}

print("Employee更新前:\(emp.job!)")
updateEmp(emp:emp)
print("Employee更新后:\(emp.job!)")

let emp1 = Employee()
emp1.no = 1000
emp1.name = "Martin"
emp1.job = "Salesman"
emp1.salary = 1250

let emp2 = Employee()
emp2.no = 1000
emp2.name = "Martin"
emp2.job = "Salesman"
emp2.salary = 1250

if emp1 === emp2
{
    print("emp1 === emp2")
}
if emp1 === emp1
{
    print("emp1 === emp1")
}

prints_(str:str_)
//运算符重载
var dept1 = Department()
dept1.no = 10
dept1.name = "Sales"

var dept2 = Department()
dept2.no = 10
dept2.name = "Sales"

//if dept1 == dept2
//{
//    print("dept1 = dept2")
//}

//重载运算符==和!=
func ==(lhs: Department ,rhs: Department ) -> Bool
{
    return lhs.name == rhs.name && lhs.no == rhs.no
}

func !=(lhs: Department ,rhs: Department) ->Bool
{
    if(lhs.name != rhs.name || lhs.no != rhs.no)
    {
        return true
    }
    return false
}
if dept1 == dept2
{
    print("dept1 = dept2")
}
else
{
    print("dept1 !=dept2")
}

if dept1 != dept2
{
    print("dept1 != dept2")
}
else
{
    print("dept1 = dept2")
}
prints_(str:str_)

//类型嵌套
class Employees
{
    var no: Int = 0
    var name: String = ""
    var job: String = ""
    var salary: Double = 0
    
    var dept: Departments = Departments()
    
    var day: WeekDays = WeekDays.Friday
    
    struct Departments
    {
        var no: Int = 10
        var name: String = "SALES"
    }
    
    enum WeekDays
    {
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        
        struct Day
        {
            static var message: String = "Today is..."
        }
    }
}

var emps = Employees()
print(emps.dept.name)
print(emps.day)

let friday = Employees.WeekDays.Friday
if emps.day == friday
{
    print("相等")
}

print(Employees.WeekDays.Day.message)

prints_(str:str_)

//可选链
class Employeess
{
    var no: Int = 0
    var name: String = "Tony"
    var job: String?
    var salary: Double = 0
    var dept: Departmentss = Departmentss()
}

class Departmentss
{
    var no: Int = 10
    var name: String = "SALES"
    var comp: Company = Company()
}

class Company
{
    var no: Int = 1000
    var name: String = "EOrient"
}

let empss = Employeess()
print(empss.dept.comp.name)

class Employee_1
{
    var no: Int = 0
    var name: String = "Tony"
    var job: String?
    var salary: Double = 0
    var dept: Department_1? //= Department_1()
    //var dept: Department_1 = Department_1()
}
class Department_1
{
    var no: Int = 10
    var name: String = "SAlES"
    var comp: Company_1? //= Company_1()
   // var comp: Company_1 = Company_1()
}
class Company_1
{
    var no: Int = 1000
    var name: String = "EOrient"
}
let emp_1 = Employee_1()
print(emp_1.dept!.comp!.name) //显示拆包
print(emp_1.dept?.comp?.name) //可选链
prints_(str:str_)


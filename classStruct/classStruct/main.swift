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
func prints_( str: String)
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
    var dept: Department_1? = Department_1()
    //var dept: Department_1 = Department_1()
}
class Department_1
{
    var no: Int = 10
    var name: String = "SAlES"
    var comp: Company_1? = Company_1()
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

func divide(n1: Int ,n2: Int ) ->Double?
{
    if n2 == 0
    {
        return nil
    }
    return Double(n1)/Double(n2)
}

let result1: Double? = divide(n1:100,n2:200)

//func
func recatangleArea_(_ width: Double, H height: Double) -> Double{
    let area = width * height
    return area
}
print("W X H 的长方形面积：\(recatangleArea_(320,H:480))")
prints_(str:str_)
//引用（&，inout）
func increment(value: inout Double, amount: Double = 1.0)
{
    value += amount
}
var value: Double = 10.0
increment(value: &value)
print(value)

increment(value: &value,amount:100.0)
print(value)
prints_(str:str_)
//函数类型作为另一个函数的返回类型使用
//定义计算长方形面积的函数
func recatangleArea(width: Double,height: Double) ->Double{
    let area = width * height
    return area
}
//定义计算三角形面积的函数
func triangleArea(bottom: Double,height: Double) ->Double{
    let area = 0.5 * bottom * height
    return area
}

func getArea(type: String) ->(Double,Double) ->Double{            //返回值类型是(Double,Double)->Double
    var returnFunction: (Double,Double) ->Double       //声明returnFunction类型是(Double,Double)->Double函数类型
    switch(type)
    {
        case "rect":
        returnFunction = recatangleArea            //将recatangleArea函数名赋值给变量
        case "tria":
        returnFunction = triangleArea
        default:
        returnFunction = recatangleArea
    }
    return returnFunction
}

var area: (Double,Double)->Double = getArea(type:"tria")
print("底10，高15，三角形面积：\(area(10,15) )")

area = getArea(type:"rect")
print("长28，高30，长方形面积：\(area(28,30))")

//把函数类型作为另一个函数的参数类型使用
func getAreaByFunc(funcName: (Double,Double) -> Double,a: Double,b: Double) -> Double{
    let area = funcName(a,b)
    return area
}
var result : Double = getAreaByFunc(funcName:triangleArea,a:10,b:15)
print("底10，高15，三角形面积：\(result)")
prints_(str:str_)
//嵌套函数
func calculate(opr: String) -> (Int,Int) ->Int   //返回值为函数类型
{
    func add(a: Int ,b: Int ) -> Int
    {
        return a + b
    }
    
    func sub(a: Int ,b: Int ) -> Int
    {
        return a - b
    }
    var result: (Int,Int) -> Int     //定义一个函数类型的变量result
    switch (opr)
    {
    case "+":
        result = add    //将add函数名赋值给函数类型的变量result
    case "-":
        result = sub
    default:
        result = add
        
    }
    return result    //返回函数类型
}

let f1: (Int ,Int ) -> Int = calculate(opr:"+")  //定义一个函数类型常量f1，并调用calculate函数进行赋值
print("10 + 5 = \(f1(10,5))")
let f2: (Int ,Int ) -> Int = calculate(opr:"-")
print("10 - 5 = \(f2(10,5))")
prints_(str:str_)

//闭包
//闭包隐藏关键字return
func calculateR(opr: String) -> (Int,Int) -> Int {
    var result : (Int,Int) -> Int

    switch(opr)
    {
    case "+":
        result = {a,b in a + b}
    default:
        result = {a,b in a - b}
    }
    return result
}

let t1 : (Int,Int) -> Int = calculateR(opr:"+")
print("35 + 10 = \(t1(35,10))")
let t2 : (Int,Int) -> Int = calculateR(opr:"-")
print("35 - 10 = \(t2(35,10))")
prints_(str:str_)

//闭包省了参数名

func calculates(opr: String) -> (Int,Int) -> Int {
    var result : (Int ,Int) -> Int
    switch (opr)
    {
    case "+":
        result = {$0 + $1}    //省了参数名， 同时要省了in关键字。$0指代第一个参数，$1指代第二个参数
    default:
        result = {$0 - $1}
    }
    return result
}
let k1:(Int,Int) ->Int = calculates(opr: "+")
print("15 + 10 = \(k1(15,10))")
let k2:(Int,Int) ->Int = calculates(opr: "-")
print("15 - 10 = \(k2(15,10))")
prints_(str:str_)

//使用闭包返回值
//{...}为闭包部分，可用看成一个函数，后面可用看为函数参数列表，(10,5)为闭包传递参数
let c1: Int = {(a: Int,b: Int ) -> Int in return a + b}(10,5)
print("10 + 5 = \(c1)")
let c2: Int = {(a: Int ,b: Int) -> Int in return a - b}(10,5)
print("10 - 5 = \(c2)")

prints_(str:str_)

//捕获上下文中的变量和常量
func makeArray() -> (String) ->[String]{  //返回值是(String) -> [String]函数类型。
    var ary: [String] = [String]()              //声明并初始化数组变量 它的作用域是makeArray函数体
    
    func addElement(element:String) ->[String]{         //定义了一个嵌套类型addElement函数
        ary.append(element)    //改变ary变量的值。ary变量相对于addElement而言，是上下文中的变量。
        return ary             //从函数体中返回ary变量
    }
    return addElement         //返回函数类型调用addElement.
}

let fs1 = makeArray()
print("---fs1---")
print(fs1("张三"))
print(fs1("李四"))
print(fs1("王五"))

let fs2 = makeArray()
print("---fs2---")
print(fs2("刘备"))
print(fs2("关羽"))
print(fs2("张飞"))

prints_(str:str_)

//func makeArrayB() -> [String]{
//    var ary: [String] = [String]()
//    return {(element:String) ->[String] in ary.append(element)}
//        return ary
//
//}
var testEquality1: (Int,Int) -> Bool = {return $0 == $1}
var testEquality2: (Int,Int) -> Bool = {$0 == $1}
var testEquality3: (Int,Int) ->Bool = {(a: Int,b: Int) -> Bool in return a == b}

var DoMath: (Int,Int) -> Int = {$0 - $1}
print(DoMath(100,88))

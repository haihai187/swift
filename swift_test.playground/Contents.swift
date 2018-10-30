//swift test
import UIKit
//Define
let str = "--------------------------------------"
let str_s = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
let str_Ts = "--+--+--+--+--+--+--+--+--+--+--+--+--+"

//func()
func show(str : String )
{
    print ("\(str)")
}

func addMyAccountBalances(balances : Double...) -> Double
{
    var result : Double = 0.0
    for balance in balances
    {
        result +=  balance
    }
    return result
}

func showBooks(x : Int,books : String...)
{
    print("My Entering numbers of books is \(x)")
    print("Books name is:")
    var count = 0
    for tmp in books
    {
        print(tmp)
        count += 1
    }
    print("numbers of books is \(count)")
}
//show()
show(str:str_Ts)

showBooks(x:3,books:"swift","C++","cocoa+swift")
show(str:str)
print(addMyAccountBalances(balances:1.0,2.0,3.0,4.0))
show(str:str)

var account1 = ("State Bank Personal",110.10)
var account2 = ("State Bank Business",24309.63)



func deposit(amount : Double,account : (name : String ,balance : Double)) ->(String,Double)
{
    let newBalance : Double = account.balance + amount
    return (account.name,newBalance)
}

func withdraw(amount : Double,account : (name : String,balance : Double)) ->(String,Double)
{
    let newBalance : Double = account.balance - amount
    return (account.name,newBalance)
}
let mondayTransaction = deposit
let fridayTransaction = withdraw

let modayBalance = mondayTransaction(300.0,account1)
let fridayBalance = fridayTransaction(1200,account2)

print(modayBalance,fridayBalance)

show(str:str)

func findLargestBalance(balances : Double...) -> Double
{
    var result : Double = -Double.infinity
    for balance in balances
    {
        if balance > result
        {
            result = balance
        }
    }
    return result
}

func findSmallestBalances(balances : Double...) -> Double
{
    var result : Double = Double.infinity
    for balance in balances
    {
        if balance < result
        {
            result = balance
        }
    }
    return result
}

func chooseTransaction(transaction: String ) -> (Double,(String,Double))->(String,Double)
{
    if transaction == "Deposit"
    {
        return deposit
    }
    return withdraw
}

print(findLargestBalance(balances:182.44,344.43,434.77,888.00,999.88))
print(findSmallestBalances(balances:111.33,344.43,434.77,888.00,999.88))

show(str:str)

//值永远不会隐式转换为其他类型。如果需要将值转换为其他类型，请显示创建所需要的类型。
let label = "The width is "
let width = 94
let widthLable = label + String(width)
print(widthLable)

show(str:str)
//在字符串中包含值：在括号中写入值，并在括号前写入反斜杠\
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(appleSummary,fruitSummary)

show(str:str)
//"""对于用多行的字符串，使用三个双引号()。每个引用开头的缩进都会被删除，只要它与右引号的缩进相匹配即可。
let quotation = """
Even though there's whitespace to the left,
the actual lines aren't indented.
Except for this line.
Double quotes(") Can appear without being escaped.
I still have \(apples + oranges)pieces of fruit.
"""
print(quotation)

show(str:str)
// 使用方括号([])创建数组和字典，并通过这括号中写入索引或键来访问它们的元素。最后一个元素后面允许逗号。
var shoppingList = ["catfish","water","tulips"]
shoppingList[1] = "boottle of water"
var occupations = ["Malcolm":"Captain","Kaylee":"Mechanic",]

print(shoppingList)
print(occupations)

occupations["Jayne"] = "Public Relations"
//添加数组元素append
shoppingList.append("blue paint")

show(str:str)
//创建空数组或字典
let emptyArray = [String]()
let emptyDictionary = [String:Float]()
print(emptyArray)
print(emptyDictionary)
//如果可以推断类型信息，则可以将空数组写为[]空字典，[:]例如，为变量设置新值或将参数传递给函数时。
shoppingList = []
occupations = [:]

show(str:str)

//控制流 if ,switch,for-in,while,repeat-while
let indivdualScores = [75,43,103,87,12]
var teamScore = 0
for score in indivdualScores
{
    if score > 50
    {
        teamScore += 3
    }else {
        teamScore += 1
    }
}
print(teamScore)

//在if语句中，条件必须是布尔表达。例如下面代码就是错误的
//if score {} 不能隐式比较是否为零
let x = (70 > 50)
print(x)
//let y = 0
//if y{print(y)} 错误

show(str:str)
//使用if和let一起处理可能缺少的值。这些值表示可选项。可选值包含值或包含nil以指示缺少值。?在值的类型后面写一个问号，以将值标记为可选。
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"

//如果是可选值nil，则条件为，false并且跳过括号中的代码。否则，将解包可选值并将其分配给常量let,这使得在代码块内可用的展开值。
if let name = optionalName{
    greeting = "Hello,\(name)"
}
print(greeting)

show(str:str)

let nickName : String? = nil
let fullName : String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting)
show(str:str)

let vegetable = "red pepper"
//let vegetable = "celery"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber","watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}




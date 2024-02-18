import Foundation

//Exercise 1
let add = { (a: Double, b: Double) -> Double in a + b }

let subtract = { (a: Double, b: Double) -> Double in a - b }

let multiply = { (a: Double, b: Double) -> Double in a * b }

let divide = { (a: Double, b: Double) -> Double? in
    guard b != 0 else {
        print("Ошибка: на 0 делить нельзя.")
        return nil
    }
    return a / b
}

let power = { (base: Double, exponent: Double) -> Double in pow(base, exponent) }

func calcResult(_ a: Double, _ b: Double, _ operation: (Double, Double) -> Double?) -> Double? {
    return operation(a, b)
}

func calculator() {
    print("Введите первое число:")
    let num1 = readLine() ?? ""

    print("Введите оператор (+, -, *, /, ^):")
    let operation = readLine() ?? ""

    print("Введите второе число:")
    let num2 = readLine() ?? ""
    
    var result: Double?
    
    if let num1 = Double(num1) {
        if let num2 = Double(num2) {
            switch operation {
            case "+":
                result = calcResult(num1, num2, add)
            case "-":
                result = calcResult(num1, num2, subtract)
            case "*":
                result = calcResult(num1, num2, multiply)
            case "/":
                result = calcResult(num1, num2, divide)
            case "^":
                result = calcResult(num1, num2, power)
            default:
                print("Ошибка: неподдерживаемый оператор.")
                return
            }
        }
        else {
            print("Вы ввели неверное второе число")
        }
    }
    else {
        print("Вы ввели неверное первое число")
    }


    if let result = result {
        print("Result: \(result)")
    } else {
        print("Ошибка.")
    }
}

// Call the calculator function to start the program
calculator()


//Exercise 2
import Foundation

func combineStrings() {
    print("Введите первую строку:")
    let line1 = readLine() ?? ""
    
    print("Введите вторую строку:")
    let line2 = readLine() ?? ""
    
    let combinedLine = line1 + line2
    print("Результат объединения: \(combinedLine)")
}

// Function to flip a string
func flipString() {
    print("Введите строку для переворота:")
    if let inputString = readLine() {
        let reversedString = String(inputString.reversed())
        print("Результат переворота: \(reversedString)")
    }
}

func countCharacters() {
    print("Введите строку:")
    if let inputString = readLine() {
        let characterCount = inputString.filter { !$0.isWhitespace }.count
        print("Количество символов (без пробелов) : \(characterCount)")
    }
}

func searchSubstring() {
    print("Введите строку:")
    if let mainString = readLine() {
        print("Введите подстроку для поиска:")
        if let substring = readLine() {
            if let range = mainString.range(of: substring) {
                let index = mainString.distance(from: mainString.startIndex, to: range.lowerBound)
                print("Первое вхождение подстроки на позиции: \(index)")
            } else {
                print("Подстрока не найдена.")
            }
        }
    }
}

combineStrings()
flipString()
countCharacters()
searchSubstring()

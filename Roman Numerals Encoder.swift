// Create a function taking a positive integer as its parameter and returning a string containing the Roman Numeral representation of that integer.

// Modern Roman numerals are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero. 
// In Roman numerals 1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC. 
// 2008 is written as 2000=MM, 8=VIII; or MMVIII. 
// 1666 uses each Roman symbol in descending order: MDCLXVI.


func solution(_ number:Int) -> String {
    
    //    table of transform:
    //             1 ..  4       ..  5   .. 9       ... 10
    //    1000:    M
    //    100:     C    CD - 400     D     CM - 900      M
    //    10:      X    XL - 40      L     XC - 90       C
    //    1:       I    IV - 4       V     IX - 9        X
    
    func convert(number: Int, one: String, five: String, ten: String)-> String {
        switch number {
        case 4: return one + five
        case 9: return one + ten
        default: return number >= 5 ? five + (0..<(number-5)).map { i in one }.joined() : (0..<number).map { i in one }.joined()
        }
    }
    
    //    thousands = number / 1000
    //    hundreds = (number % 1000 ) / 100
    //    tens = (number % 100) / 10
    //    units = number % 10
    
    var romanNumber = ""
    
    romanNumber += convert(number: number / 1000, one: "M", five: "", ten: "")
    romanNumber += convert(number: (number % 1000) / 100, one: "C", five: "D", ten: "M")
    romanNumber += convert(number: (number % 100) / 10, one: "X", five: "L", ten: "C")
    romanNumber += convert(number: number % 10, one: "I", five: "V", ten: "X")
    
    return romanNumber
}

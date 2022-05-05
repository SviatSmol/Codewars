// Write Number in Expanded Form

func expandedForm(_ num: Int) -> String {
    
    var intArray = String(num).map { Int(String($0)) ?? 0 }
    
    let countOfZero = intArray.count - 1
    
    var mappedArray: [Int] = []
    
    for i in 0...countOfZero {
        mappedArray.append(intArray.remove(at: countOfZero - i))
        intArray = intArray.map{ $0 * 10 }
    }
    
  return mappedArray.filter{ $0 > 0 }.reversed().map { String($0) }.joined(separator: " + ")
}

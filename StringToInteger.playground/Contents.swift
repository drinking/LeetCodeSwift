//String to Integer

func atoi(input:String)->Int{

    var sign = 1
    let preMax = Int.max/10
    let lastNum = Int.max%10
    
    let result = input.characters.reduce(0) { (output, char) -> Int in
        
        if(output == Int.max || output == Int.min){
            return output
        }
        
        if (char == "-"){
            sign = -1
        }else if let i = Int(String(char)){
            if (output > preMax || (output == preMax && i>=lastNum)){ //这个判断省了不少逻辑
                return sign == -1 ? Int.min :Int.max
            }
            return output*10+i
        }
        
        return output
    }
    

    if (sign < 0 && result > 0){
        return result*sign
    }
    
    return result
}

atoi("  -3343434343445")
atoi("  -3343434343445923840289304")

atoi("3343434343445923840289304")
atoi("+343445923840289304")
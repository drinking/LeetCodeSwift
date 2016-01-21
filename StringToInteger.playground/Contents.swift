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
            
            if (output < preMax){
                return output*10 + i
            }else if (output == preMax){
                if (sign == -1 && i > lastNum+1){
                    return Int.min
                }else if (sign == 1 && i > lastNum ){
                    return Int.max
                }else{
                    return output*10+i
                }
                
            }else{
                return sign == -1 ? Int.min :Int.max
            }
            

        }
        return output
    }
    
    return result
}

atoi("  -33434343434453945993459349593")

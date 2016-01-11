
//Valid Palindrome

func isPalindrome(input:String)->Bool{
    
    func isLetterOrDigital(char:Character)->Bool{
        return char>="a"&&char<="z" || char>="A"&&char<="Z" || char>="0"&&char<="9"
    }

    let str = input.lowercaseString
    var left = str.startIndex
    //`endIndex` is not a valid argument to `subscript`
    var right = str.endIndex.predecessor()
    
    while (left<right){
        while(!isLetterOrDigital(str[left])){
            left = left.successor()
        }
    
        while(!isLetterOrDigital(str[right])){
            right = right.predecessor()
        }
        
        if(str[left] != str[right]){
            return false
        }

        left = left.successor()
        right = right.predecessor()
    }
    return true;
}


let str1 = "A man, a plan, a canal: Panama"
let str2 = "race a car"

isPalindrome(str1)
isPalindrome(str2)
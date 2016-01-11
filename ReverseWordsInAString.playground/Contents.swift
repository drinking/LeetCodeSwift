
// Reverse Words in a String

func reverseWordsHighOrder(input:String)->String{
    return input.characters.split(" ").reverse().reduce("", combine: { (result, char) -> String in
        if(result == ""){
            return String(char)
        }else{
            return result + " " + String(char)
        }

    })
}

func reverseWords(input:String)->String{
    
    var output = ""
    
    let startIndex = input.startIndex
    var rightIndex = input.endIndex.predecessor()
    var leftIndex = rightIndex
    let characters = input.characters;
    
    while(leftIndex != startIndex){
        if(characters[leftIndex] == " " && leftIndex == rightIndex){
            rightIndex = rightIndex.predecessor()
            leftIndex = leftIndex.predecessor()
        }else if (characters[leftIndex] != " "){
            leftIndex = leftIndex.predecessor()
        }else{
            let slice = str[leftIndex.advancedBy(1)...rightIndex]
            output = output + String(slice) + " "
            leftIndex = leftIndex.predecessor()
            rightIndex = leftIndex
        }
    }
    
    if(leftIndex != rightIndex){
        output = output + String(str[leftIndex...rightIndex])
    }
    
    return output
}


let str = "the sky is blue "
reverseWordsHighOrder(str)
reverseWords(str)

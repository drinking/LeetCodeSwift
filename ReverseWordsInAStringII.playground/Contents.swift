
// Reverse Words in a String II

func reverseWords(var input:String)->String{
    
    func reverse(var startIndex:String.CharacterView.Index,var endIndex:String.CharacterView.Index){
        let characters = input.characters
        while(startIndex < endIndex){
            let startRange = Range(start: startIndex, end: startIndex.advancedBy(1))
            let endRange = Range(start: endIndex, end: endIndex.advancedBy(1))
            let startStr = String(characters[startRange])
            let endStr = String(characters[endRange])
            
            input.replaceRange(startRange, with: endStr)
            input.replaceRange(endRange, with: startStr)
            startIndex = startIndex.successor()
            endIndex = endIndex.predecessor()
        }
    }

    reverse(input.startIndex, endIndex: input.endIndex.predecessor())

    var leftIndex = input.startIndex
    let characters = input.characters
    var count = 0
    while(leftIndex != input.endIndex){
        if(characters[leftIndex] == " " ){
            reverse(leftIndex.advancedBy(-count), endIndex: leftIndex.advancedBy(-1))
            leftIndex = leftIndex.successor()
            count = 0
        }else if(leftIndex.successor() == input.endIndex){
            reverse(leftIndex.advancedBy(-count), endIndex: leftIndex)
        }
        
        leftIndex = leftIndex.successor()
        count++
    }
    return input
}


var str = "the sky is blue"
reverseWords(str)

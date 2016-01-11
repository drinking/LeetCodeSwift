//Implement strStr()

func strStr(haystack:String,needle:String)->Int{
    
    if(needle.characters.count==0 || haystack.characters.count==0){
        return -1
    }
    
    var needleIndex = needle.characters.startIndex
    for ( var index = haystack.characters.startIndex;
        index != haystack.endIndex;index=index.successor()){
            
            var haystackIndex = index
            while(haystack.characters[haystackIndex] == needle.characters[needleIndex]){
                haystackIndex = haystackIndex.successor()
                needleIndex = needleIndex.successor()
                if(needleIndex == needle.endIndex){
                    return haystack.characters.startIndex.distanceTo(haystackIndex)-needle.characters.count
                }
                
                if(haystackIndex.successor() == haystack.endIndex){
                    return -1
                }
            }
            
            needleIndex = needle.characters.startIndex
            
    }
    
    
    return -1;
}

let h = "jklsdjfhhhhello world!xkjfkdf"
let n = "hhhello world!"

strStr(h, needle: n)
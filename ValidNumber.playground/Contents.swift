//Valid Number

class Solution {
    func isNumber(s: String) -> Bool {
        
        var isNumric = false
        var scanIndex = s.characters.startIndex
        var scancount = 0
        
        while(scanIndex != s.characters.endIndex && String(s.characters[scanIndex]) == " "){
            scancount++
            scanIndex = scanIndex.successor()
        }
        
        if(scanIndex != s.characters.endIndex && (String(s.characters[scanIndex]) == "+" || String(s.characters[scanIndex]) == "-")){
            scancount++
            scanIndex = scanIndex.successor()
        }
        
        while(scanIndex != s.characters.endIndex && Int(String(s.characters[scanIndex])) != nil){
            scancount++
            isNumric = true
            scanIndex = scanIndex.successor()
        }
        
        if( scanIndex != s.characters.endIndex && String(s.characters[scanIndex]) == "."){
            scanIndex = scanIndex.successor()
            scancount++
            
            while(scanIndex != s.characters.endIndex && Int(String(s.characters[scanIndex])) != nil){
                isNumric = true
                scanIndex = scanIndex.successor()
                scancount++
            }
        }
        
        // 注意这里的isNumric判断
        if(isNumric && scanIndex != s.characters.endIndex && String(s.characters[scanIndex]) == "e"){
            scanIndex = scanIndex.successor()
            scancount++
            if(scanIndex != s.characters.endIndex && (String(s.characters[scanIndex]) == "+"
                || String(s.characters[scanIndex]) == "-")){
                    scanIndex = scanIndex.successor()
                    scancount++
            }
            
            isNumric = false
            while(scanIndex != s.characters.endIndex && Int(String(s.characters[scanIndex])) != nil){
                isNumric = true
                scanIndex = scanIndex.successor()
                scancount++
            }
        }
    
        while(scanIndex != s.characters.endIndex && String(s.characters[scanIndex]) == " "){
            scancount++
            scanIndex = scanIndex.successor()
        }
        
        return isNumric && scancount == s.characters.count
    }
}


Solution().isNumber(" +.1")
Solution().isNumber(" f23.3e-10")
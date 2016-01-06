
//Two Sum III – Data structure design

class TwoSum {
    var hashMap:Dictionary<Int,Int> = Dictionary()
    
    func add(num:Int){
        var newCount = 1
        if let count = hashMap[num]{
            newCount = count+1
        }
        hashMap[num]=newCount
    }
    
    func find(target:Int)->Bool{
        
        for num in hashMap.keys{
            if let another=hashMap[target-num]{
                if(target-num==num){
                    if (another>1){
                        return true
                    }
                }else{
                    return true
                }
            }
        }
        return false
    }
}

let twoSum = TwoSum()

twoSum.add(1)
twoSum.add(3)
twoSum.add(5)
twoSum.add(5)
twoSum.find(4)
twoSum.find(7)
twoSum.find(10)



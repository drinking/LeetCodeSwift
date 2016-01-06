
//Two Sum

//brute force
func towSum(numbers:Array<Int>,target:Int)->Array<Int>{
    
    for (var i=0;i<numbers.count;i++){
        for(var j=i+1;j<numbers.count;j++){
            if(numbers[i]+numbers[j]==target){
                return [i,j]
            }
        }
    }
    
    return []
}

//hash table
func towSumV2(numbers:Array<Int>,target:Int)->Array<Int>{
    var hashMap:Dictionary<Int,Int> = Dictionary<Int,Int>()
    for (var i=0;i<numbers.count;i++){
        let key = target-numbers[i]
        
        if(key==0){
            continue
        }
        
        if let index1 = hashMap[key] {
            return [index1,i]
        }
        hashMap[numbers[i]]=i
    }
    return []
}


let nums = [2,3,4,5,6,4,3,4,3,545,5]

towSum(nums, target: 9)

towSumV2(nums, target: 9)

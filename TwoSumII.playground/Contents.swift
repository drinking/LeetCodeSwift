
//Two Sum II – Input array is sorted

func bsearch(array:Array<Int>,target:Int,start:Int)->Int{
    
    var left = start;
    var right = array.count-1;
    while (left<right){
        let mid = (left+right)/2
        if(array[mid]<target){
            left = mid+1
        }else{
            right = mid
        }
    }
    
    if(left==right&&array[left]==target){
        return left
    }
    return -1
}

//Binary search
func twoSum(array:Array<Int>,target:Int)->Array<Int>{
    for(var i=0;i<array.count;i++){
        let index2 = bsearch(array, target: target-array[i], start: i+1);
        if(index2>0){
            return [i,index2]
        }
    }
    return []
}

let a = [1,2,3,4,5,6,7,8,9,11,12,13,14,15,23,45,67,89]
twoSum(a, target: 10)

//Two pointers

func twoSumV2(array:Array<Int>,target:Int)->Array<Int>{
    
    var left = 0
    var right = array.count-1
    while (left<right){
        if(array[left]+array[right]>target){
            right--
        }else if(array[left]+array[right]<target){
            left++
        }else{
            return [left,right]
        }
    }
    return []
}

twoSumV2(a, target: 10)
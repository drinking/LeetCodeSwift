# Dynamic programming
##题目-- [Best Time to Buy and Sell Stock - LeetCode](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/)
###1st Version
在Swift4中没有了for的i++实现，所以采用了迭代器。所以在二层迭代时需要去构建一个subArray。算法结果没有问题，但是在提交时因为性能问题被拒绝了。
```swift
class Solution {
	func maxProfit(_ prices: [Int]) -> Int {
		var profit = 0
		for (i,buy) in prices.enumerated() {
			if(i+1 == prices.count) {
				return profit
			}			
			let sub = prices[(i+1)...]
			for (_,sell) in sub.enumerated() {
				profit = max((sell-buy),profit)
			}
		}
		return profit
	}
}
```

###2nd Version
最初以为是在迭代器层面调用的性能影响，所以进一步优化了代码，其实应该不构成瓶颈。取消了迭代器的实现，代码上更精简了一些。提交，依旧因为性能问题被拒。
```swift
class Solution {
	func maxProfit(_ prices: [Int]) -> Int {
		var profit = 0
		for i in 0..<prices.count {
			for j in (i+1)..<prices.count {
				profit = max((prices[j]-prices[i]),profit)
			}			
		}
		return profit
	}
}
```


###Acceptable Version
所以最终考虑剪枝，避免无意义的循环。即发现后一买入日期比前一买入日期股票价格还要贵的话，其最终卖出利润肯定会较之前买入来的小，所以这种情况直接忽略。所以可以减少很多次循环。尤其是leetcode测试用例中的情况`[10000,9999......,0]`只要O(n)的时间效率就可以完成。
```swift
class Solution {
	func maxProfit(_ prices: [Int]) -> Int {
		var profit = 0
		var buyAt = 0
		for i in 0..<prices.count {
			if (prices[i]>prices[buyAt]) {
				continue
			}
			for j in (i+1)..<prices.count {
				let delt = prices[j]-prices[i]
				if delt > profit {
					buyAt = i
					profit = delt
				}
			}
		}
		return profit
	}
}
```
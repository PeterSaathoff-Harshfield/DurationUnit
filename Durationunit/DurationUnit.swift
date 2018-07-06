import Foundation

class DurationUnit {
	
	var date:Date
    var calendar:Calendar
	
	//standard time
	var hour:Int
	var minute:Int
	var second:Int
    var nanosecond:Int
    
	//duration unit time
	var du_unit:Int
	var du_minute:Int
	var du_second:Int
	
	init() {
		date = Date()
		calendar = Calendar.current
		
        hour = calendar.component(.hour, from: date)
		minute = calendar.component(.minute, from: date)
		second = calendar.component(.second, from: date)
		nanosecond = calendar.component(.nanosecond, from: date)
        
        let nanosecondsInDay = 24*60*60*1000000000
        let nanosecondsSoFar = (hour*60*60 + minute*60 + second)*1000000000 + nanosecond
        let elapsedPortion = Double(nanosecondsSoFar) / Double(nanosecondsInDay)
        
        du_unit = Int(elapsedPortion * 10)
        du_minute = Int(elapsedPortion * 1000) % 100
        du_second = Int(elapsedPortion * 100000) % 100
	}
	
	func updateTime() {
        date = Date()
        calendar = Calendar.current
        
        hour = calendar.component(.hour, from: date)
        minute = calendar.component(.minute, from: date)
        second = calendar.component(.second, from: date)
        nanosecond = calendar.component(.nanosecond, from: date)
        
        let nanosecondsInDay = 24*60*60*1000000000
        let nanosecondsSoFar = (hour*60*60 + minute*60 + second)*1000000000 + nanosecond
        let elapsedPortion = Double(nanosecondsSoFar) / Double(nanosecondsInDay)
        
        du_unit = Int(elapsedPortion * 10)
        du_minute = Int(elapsedPortion * 1000) % 100
        du_second = Int(elapsedPortion * 100000) % 100
	}
	
	func getTime() -> String {
		return "\(du_unit):\(String(format: "%02d", du_minute)):\(String(format: "%02d", du_second))"
	}
    
    func getStandardTime() -> String {
        return "  \(hour):\(String(format: "%02d", minute)):\(String(format: "%02d", second))"
    }
    
}

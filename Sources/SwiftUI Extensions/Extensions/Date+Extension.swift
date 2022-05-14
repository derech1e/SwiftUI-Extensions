//
//  File.swift
//  
//
//  Created by Thomas on 14.05.22.
//

import Foundation

extension Date {
    
    public func localString(dateStyle: DateFormatter.Style = .long,
                     timeStyle: DateFormatter.Style = .none) -> String {
        return DateFormatter.localizedString(
          from: self,
          dateStyle: dateStyle,
          timeStyle: timeStyle)
    }
    
    public static func parse(_ string: String, format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format

        let date = dateFormatter.date(from: string)!
        return date
    }
    
    public func get(_ component: Calendar.Component) -> Int {
        Calendar.current.component(component, from: self)
    }
    
    public var isToday: Bool {
        self.midnight == Date().midnight
    }
    
    public var dayBefore: Date {
        Calendar.current.date(byAdding: .day, value: -1, to: midnight)!
    }
    
    public var dayAfter: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
    }
    
    public var toDayInt: Int {
        let calendar = Calendar.current
        return calendar.component(.year, from: self) * 365 + calendar.component(.month, from: self) * 30 + calendar.component(.day, from: self)
    }
    
    public static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func dateAndTimetoString(format: String = "yyyy-MM-dd HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
   
    func timeIn24HourFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    func startOfCurrentMonth() -> Date {
        var components = Calendar.current.dateComponents([.year,.month], from: self)
        components.day = 1
        let firstDateOfMonth: Date = Calendar.current.date(from: components)!
        return firstDateOfMonth
    }
    
    func endOfCurrentMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfCurrentMonth())!
    }
    
    public var midnight: Date {
        let cal = Calendar(identifier: .gregorian)
        return cal.startOfDay(for: self)
    }
    
    func addMonths(amountOfMonths: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .month, value: amountOfMonths, to: self)
        return endDate ?? Date()
    }
    
    func removeMonths(amountOfMonths: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .month, value: -amountOfMonths, to: self)
        return endDate ?? Date()
    }
    
    func addYears(amountOfYears: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .year, value: amountOfYears, to: self)
        return endDate ?? Date()
    }
    
    func removeYears(amountOfYears: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .year, value: -amountOfYears, to: self)
        return endDate ?? Date()
    }
    
    func getHumanReadableDayString() -> String {
        let weekdays = [
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday"
        ]
        
        let calendar = Calendar.current.component(.weekday, from: self)
        return weekdays[calendar - 1]
    }
    
    
    func timeSinceDate(fromDate: Date) -> String {
        let earliest = self < fromDate ? self  : fromDate
        let latest = (earliest == self) ? fromDate : self
    
        let components:DateComponents = Calendar.current.dateComponents([.minute,.hour,.day,.weekOfYear,.month,.year,.second], from: earliest, to: latest)
        let year = components.year  ?? 0
        let month = components.month  ?? 0
        let week = components.weekOfYear  ?? 0
        let day = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        
        if year >= 2{
            return "\(year) years ago"
        }else if (year >= 1){
            return "1 year ago"
        }else if (month >= 2) {
             return "\(month) months ago"
        }else if (month >= 1) {
         return "1 month ago"
        }else  if (week >= 2) {
            return "\(week) weeks ago"
        } else if (week >= 1){
            return "1 week ago"
        } else if (day >= 2) {
            return "\(day) days ago"
        } else if (day >= 1){
           return "1 day ago"
        } else if (hours >= 2) {
            return "\(hours) hours ago"
        } else if (hours >= 1){
            return "1 hour ago"
        } else if (minutes >= 2) {
            return "\(minutes) minutes ago"
        } else if (minutes >= 1){
            return "1 minute ago"
        } else if (seconds >= 3) {
            return "\(seconds) seconds ago"
        } else {
            return "Just now"
        }
        
    }
}

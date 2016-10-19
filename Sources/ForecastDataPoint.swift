import Foundation

public struct ForecastDataPoint {
    var time: NSDate?
    var summary: String?
    var icon: String?
    var sunriseTime: NSDate?
    var sunsetTime: NSDate?
    var moonPhase: Double?
    var nearestStormDistance: Double?
    var nearestStormBearing: Double?
    var precipIntensity: Double?
    var precipIntensityMax: Double?
    var precipIntensityMaxTime: NSDate?
    var precipProbability: Double?
    var precipType: String?
    var precipAccumulation: Double?
    var temperature: Double?
    var temperatureMin: Double?
    var temperatureMinTime: NSDate?
    var temperatureMax: Double?
    var temperatureMaxTime: NSDate?
    var apparentTemperature: Double?
    var apparentTemperatureMin: Double?
    var apparentTemperatureMinTime: NSDate?
    var apparentTemperatureMax: Double?
    var apparentTemperatureMaxTime: NSDate?
    var dewPoint: Double?
    var windSpeed: Double?
    var windBearing: Double?
    var cloudCover: Double?
    var humidity: Double?
    var pressure: Double?
    var visibility: Double?
    var ozone: Double?
    
    static func map(data: [String: AnyObject]) -> ForecastDataPoint {
        var p = ForecastDataPoint()
        p.time = NSDate(time: data["time"] as? Double)
        p.summary = data["summary"] as? String ?? ""
        p.icon = data["icon"] as? String ?? ""
        p.sunriseTime = NSDate(time: data["sunriseTime"] as? Double)
        p.sunsetTime = NSDate(time: data["sunsetTime"] as? Double)
        p.moonPhase = data["moonPhase"] as? Double ?? nil
        p.nearestStormDistance = data["nearestStormDistance"] as? Double ?? nil
        p.nearestStormBearing = data["nearestStormBearing"] as? Double ?? nil
        p.precipIntensity = data["precipIntensity"] as? Double ?? nil
        p.precipIntensityMax = data["precipIntensityMax"] as? Double ?? nil
        p.precipIntensityMaxTime = NSDate(time: data["precipIntensityMaxTime"] as? Double)
        p.precipProbability = data["precipProbability"] as? Double ?? nil
        p.precipType = data["precipType"] as? String ?? nil
        p.precipAccumulation = data["precipAccumulation"] as? Double ?? nil
        p.temperature = data["temperature"] as? Double ?? nil
        p.temperatureMin = data["temperatureMin"] as? Double ?? nil
        p.temperatureMinTime = NSDate(time: data["temperatureMinTime"] as? Double)
        p.temperatureMax = data["temperatureMax"] as? Double ?? nil
        p.temperatureMaxTime = NSDate(time: data["temperatureMaxTime"] as? Double)
        p.apparentTemperature = data["apparentTemperature"] as? Double ?? nil
        p.apparentTemperatureMin = data["apparentTemperatureMin"] as? Double ?? nil
        p.apparentTemperatureMinTime = NSDate(time: data["apparentTemperatureMinTime"] as? Double)
        p.apparentTemperatureMax = data["apparentTemperatureMax"] as? Double ?? nil
        p.apparentTemperatureMaxTime = NSDate(time: data["apparentTemperatureMaxTime"] as? Double)
        p.dewPoint = data["dewPoint"] as? Double ?? nil
        p.windSpeed = data["windSpeed"] as? Double ?? nil
        p.windBearing = data["windBearing"] as? Double ?? nil
        p.cloudCover = data["cloudCover"] as? Double ?? nil
        p.humidity = data["humidity"] as? Double ?? nil
        p.pressure = data["pressure"] as? Double ?? nil
        p.visibility = data["visibility"] as? Double ?? nil
        p.ozone = data["ozone"] as? Double ?? nil
        return p
    }
}

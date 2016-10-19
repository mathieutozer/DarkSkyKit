import Foundation

public struct ForecastAlert {
    public var title: String?
    public var expires: NSDate?
    public var description: String?
    public var uri: String?

    public static func map(data: [String: AnyObject]) -> ForecastAlert {
        var a = ForecastAlert()
        a.title = data["title"] as? String ?? nil
        a.expires = NSDate(time: data["expires"] as? Double)
        a.description = data["description"] as? String ?? nil
        a.uri = data["uri"] as? String ?? nil
        return a
    }
}

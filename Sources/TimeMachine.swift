import Foundation
import Alamofire

public extension DarkSkyKit {
    public func timeMachine(latitude lat: Double, lognitude long: Double, date: NSDate, result: @escaping (Result<Forecast>) -> Void) {
        Alamofire.request(Router.TimeMachine(configuration, lat, long, date)).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String:AnyObject] {
                    result(Result.success(Forecast(data: json)))
                }
            case .failure(let error):
                result(Result.failure(error))
            }
        }
    }
}

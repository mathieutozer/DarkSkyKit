import Foundation
import Alamofire

public enum Router: URLRequestConvertible {
    /// Returns a URL request or throws if an `Error` was encountered.
    ///
    /// - throws: An `Error` if the underlying `URLRequest` is `nil`.
    ///
    /// - returns: A URL request.
    public func asURLRequest() throws -> URLRequest {
        return self.urlRequest as URLRequest
    }

    private static let baseURLString = "https://api.darksky.net"

    case Current(Configuration, Double, Double)
    case TimeMachine(Configuration, Double, Double, NSDate)

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        switch self {
        case .Current(let c, let lat, let long):
            return "/forecast/\(c.token)/\(lat),\(long)"
        case .TimeMachine(let c, let lat, let long, let date):
            return "/forecast/\(c.token)/\(lat),\(long),\(date.timeIntervalSince1970)"
        }
    }
    
    var urlString: String {
        return Router.baseURLString+self.path
    }
    
    var url: URL {
        return URL(string: self.urlString)!
    }

    var params: Parameters {
        var configuration: Configuration
        switch self {
        case .Current(let c, _, _):
            configuration = c
        case .TimeMachine(let c, _, _, _):
            configuration = c
        }

        var parameters = Parameters()
        if let units = configuration.units {
            parameters.updateValue(units.rawValue, forKey: "units")
        }
        if let exclude = configuration.exclude {
            parameters.updateValue(exclude.rawValue, forKey: "exclude")
        }
        if let extend = configuration.extend {
            parameters.updateValue(extend.rawValue, forKey: "extend")
        }
        if let lang = configuration.lang {
            parameters.updateValue(lang, forKey: "lang")
        }
        return parameters
    }

    var urlRequest: URLRequest {
        let url = URL(string: Router.baseURLString)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        //        return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: self.params).0
        return try! Alamofire.URLEncoding().encode(urlRequest as URLRequestConvertible, with: params)
    }
}

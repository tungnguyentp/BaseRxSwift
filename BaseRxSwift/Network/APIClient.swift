//
//  APIClient.swift
//  BaseRxSwift
//
//  Created by IMAC on 3/28/20.
//  Copyright © 2020 IMAC. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa
import Alamofire


//class ResponseResult<T: Codable>: Codable {
//    var code:Int
//    var data:[]
//    var message:String
//}

class ReponseData<T: Codable>: Codable {
    var count: Int?
    var start: Int?
    var total: Int?
    var subjects: T?
}

private let TimeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<BeberiaService>.RequestResultClosure) -> Void in
    
    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 15
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

struct BasicResponse<DataType>: Codable where DataType: Codable {
    let status: Int
    let data: DataType
    let message: String
}

class APIClient {
    
    static let shareApiClient = APIClient.init()
    private let baseURL = URL.init(string: "http://universities.hipolabs.com/")
    
    static func request <T: Codable> (apiRequest: BeberiaService) -> Observable<T> {
            return Observable.create({ (observable) -> Disposable in
                let provider = MoyaProvider<BeberiaService>(requestClosure: TimeoutClosure)
                let callBack = provider.request(apiRequest, completion: { (responseResult) in
                    switch responseResult {
                    case let .success(response):
                        do {
                            let decoder = JSONDecoder()
                            
                             print(String(data: response.data, encoding: .utf8)!)
                          //  var citiss = [CityName]()
                            let data: T = try decoder.decode(BasicResponse<T>.self , from: response.data) as! T
//                            if let data1: CityNameRespone = data.data{
//                                if let citis = data1.datas{
//                                    citiss = citis
//                                }
//                            }
//
                            print(data)
                            
                      //      let result = (subjects == nil) ? responseResult.empty : responseResult.succeed(data: subjects!)
                            observable.onNext(data)
                        }catch let error {
//                            self?.requestError(message: error.localizedDescription)
//                            observable.onNext(responseResult.failed(message: error.localizedDescription))
                            
                            observable.onError(error)
                        }
                        
                        observable.onCompleted()
                        
                    case let .failure(error):
//                        self?.requestError(message: error.localizedDescription)
//                        observable.onNext(responseResult.failed(message: error.localizedDescription))
                        observable.onError(error)
                    }
                })
                return Disposables.create {
                    callBack.cancel()
                }
            })
        }
    
    // MARK: - Location
    static func getLocation(page: Int, paginate: Int,key: String) -> Observable<CityNameRespone>  {
        let parameters: Parameters = [
            "page" : page,
            "paginate" : paginate,
            "key" : key
        ]
        return self.request(apiRequest: .getLocation(param: parameters))
    }
}

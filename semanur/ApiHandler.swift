//
//  ApiHandler.swift
//  semanur
//
//  Created by Süha Karakaya on 24.03.2023.
//

import Foundation
import Alamofire

struct Model:Encodable  {
    var token: String
    var language: String
    var method: String
}

class APIHandler {
    static let instance = APIHandler()
    
    func fetchingData(parameterModel: Model, handler: @escaping (_ result:[ProfileBaseResponse]) -> Void) {
        let url = "https://mdtest.limakcimento.com/cevik/api/gateway"
//        let headers: HTTPHeaders = [String:Any]
        AF.request(url, method: .post, parameters: parameterModel, encoder: JSONParameterEncoder.default, headers: nil).response { response in
            switch response.result {
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    debugPrint(json)
                    let decoder = try JSONDecoder().decode([ProfileBaseResponse].self, from: data!)
                    handler(decoder)
                } catch {
                    debugPrint(error.localizedDescription)
                }
                
                break
            case.failure(_):
                break
            }
            
        }
    }
}

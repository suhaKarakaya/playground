//
//  ServiceManager.swift
//  semanur
//
//  Created by Süha Karakaya on 24.03.2023.
//

import Foundation
import Alamofire

final class ServiceManager {
    static let shared: ServiceManager = ServiceManager()
}

extension ServiceManager {
    func fetch<T>(path: String,  parameterModel: Model, onSuccess: @escaping (T) -> (), onError: @escaping (AFError) -> ()) where T: Codable {
//        AF.request(path, encoding: JSONEncoding.default).validate().responseDecodable(of : T.self) { response in
//            guard let model = response.value else {print(response.error as? Any); return }
//            onSuccess(model)
//        }
        AF.request(path, method: .post, parameters: parameterModel, encoder: JSONParameterEncoder.default, headers: nil).response { response in
            switch response.result {
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    debugPrint(json)
                    let decoder = try JSONDecoder().decode(T.self, from: data!)
                    onSuccess(decoder)
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

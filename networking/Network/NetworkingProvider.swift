//
//  NetworkingProvider.swift
//  networking
//
//  Created by Agustin Carbajal on 08/11/2023.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    
    private let kBaseUrl: String = "https://gorest.co.in/public/v2/users/"
    private let kStatusOk = 200...299
    
    func getUser(id: Int) {
        
//        AF.request("\(kBaseUrl)\(id)", method: .get).validate(statusCode: kStatusOk).responseDecodable(of: UserResponse.self){
//            response in
//
//            if let user = response.value {
//                print("Este es el usuario", user.email)
//            } else {
//                print("Respuesta incorrecta", response.error?.responseCode ?? "No error code")
//            }
//        }
        
        AF.request("https://gorest.co.in/public/v2/todos/33660", method: .get).validate(statusCode: kStatusOk).responseDecodable(of: Todos.self, decoder: DataDecoder()){
            response in
            
            if let todo = response.value {
                print("Este es el todo", todo.dueOn!)
            } else {
                print("Respuesta incorrecta", response.error?.responseCode ?? "No error code")
            }
        }
        
    }
    
}

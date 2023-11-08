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
    private let kToken = "c982db5bf2337421d45cb2185f51a0f7cf1f38519e3cc98b4f614420aa951f1f"
    
    // @escaping significa que en un momento futuro puedo llamar ese callback
    func getUser(id: Int, success: @escaping (_ user:  UserResponse) -> (), failure: @escaping (_ error: Error?)->()) {
        
        AF.request("\(kBaseUrl)\(id)", method: .get).validate(statusCode: kStatusOk).responseDecodable(of: UserResponse.self){
            response in

            if let user = response.value {
                print("Este es el usuario", user.email)
                success(user)
            } else {
                print("Respuesta incorrecta", response.error?.responseCode ?? "No error code")
                failure(response.error)
            }
        }
        
//        AF.request("https://gorest.co.in/public/v2/todos/33660", method: .get).validate(statusCode: kStatusOk).responseDecodable(of: Todos.self, decoder: DataDecoder()){
//            response in
//
//            if let todo = response.value {
//                print("Este es el todo", todo.dueOn!)
//            } else {
//                print("Respuesta incorrecta", response.error?.responseCode ?? "No error code")
//            }
//        }
        
    }
    
    func addUser(user: NewUser, success: @escaping (_ user:  UserResponse) -> (), failure: @escaping (_ error: Error?)->()){
        
        let headers:HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request("\(kBaseUrl)", method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: kStatusOk).responseDecodable(of: UserResponse.self){
            response in

            if let user = response.value {
                print("Este es el usuario", user.email)
                success(user)
            } else {
                print("Respuesta incorrecta", response.error ?? "No error")
                failure(response.error)
            }
        }
    }
    
}

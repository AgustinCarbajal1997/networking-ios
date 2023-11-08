//
//  User.swift
//  networking
//
//  Created by Agustin Carbajal on 08/11/2023.
//

import Foundation

//{
//"id": 1700682,
//"name": "Baladitya Bharadwaj Ret.",
//"email": "baladitya_bharadwaj_ret@purdy-kozey.test",
//"gender": "male",
//"status": "inactive"
//}

// para representar valores que pueden ser null lo hacemos con el "?"
// decodable transforma un JSON a objeto swift
struct UserResponse: Decodable {
    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: String
}

//{
//"id": 33660,
//"user_id": 5704501,
//"title": "Adulescens cito arceo exercitationem denuo adduco cimentarius aperte sursum.",
//"due_on": "2023-12-07T00:00:00.000+05:30",
//"status": "completed"
//},

struct Todos: Decodable {
    let id: Int?
    let userId: Int?
    let title: String?
    let status: String?
    let dueOn: Date?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case status
        case userId = "user_id"
        case dueOn = "due_on"
    }
}


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

struct UserResponse: Decodable {
    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: String
}

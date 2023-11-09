//
//  NewUser.swift
//  networking
//
//  Created by Agustin Carbajal on 08/11/2023.
//

import Foundation
// codable transforma un objeto swift a JSON
struct NewUser: Encodable {
    let name: String
    let email: String
    let gender: String
    let status: String
}

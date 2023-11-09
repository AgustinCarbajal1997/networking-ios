//
//  DataDecoder.swift
//  networking
//
//  Created by Agustin Carbajal on 08/11/2023.
//

import Foundation

// cada vez que queremos implemetar un decoder concreto, tenemos que usar el JSONDecoder
final class DataDecoder: JSONDecoder {
    let dataFormatter = DateFormatter()
    
    override init() {
        super.init()
        dataFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
        dateDecodingStrategy = .formatted(dataFormatter)
    }
    
}

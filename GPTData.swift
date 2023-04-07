//
//  GPTData.swift
//  ChatGPT
//
//  Created by Андрей Логвинов on 4/6/23.
//

import Foundation
struct GPTData:Decodable{
    let choices : [Choices]
}

struct Choices:Decodable{
    let text : String
}

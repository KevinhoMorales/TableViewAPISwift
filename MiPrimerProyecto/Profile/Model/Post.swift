//
//  Post.swift
//  MiPrimerProyecto
//
//  Created by Kevinho Morales on 1/2/25.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

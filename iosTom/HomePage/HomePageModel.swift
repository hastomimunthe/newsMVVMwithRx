//
//  HomePageModel.swift
//  iosTom
//
//  Created by Hastomi Riduan Munthe on 22/10/24.
//
import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

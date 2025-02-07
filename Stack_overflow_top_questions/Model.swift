//
//  Model.swift
//  Stack_overflow_top_questions
//
//  Created by Charles Michael on 2/6/25.
//

import Foundation


struct User: Hashable {
    let name: String
    let reputation: Int
    var profileImageURL: URL?
}

extension User: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "display_name"
        case profileImageURL = "profile_image"
        case reputation
    }
}

struct Question: Identifiable, Hashable {
    let id: Int
    let score: Int
    let answerCount: Int
    let viewCount: Int
    let title: String
    let body: String
    let date: Date
    let tags: [String]
    var owner: User?
}

extension Question: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "question_id"
                case date = "creation_date"
                case answerCount = "answer_count"
                case viewCount = "view_count"
                case body = "body_markdown"
                case score, title, tags, owner
    }
}

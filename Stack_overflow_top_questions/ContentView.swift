//
//  ContentView.swift
//  Stack_overflow_top_questions
//
//  Created by Charles Michael on 2/6/25.
//

import SwiftUI

struct Wrapper: Codable {
    let items: [Question]
}

struct Question: Codable {
    let score: Int
    let title: String
}


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    func performAPICall() async throws -> Question {
        let url = URL(string: "https://api.stackexchange.com/2.3/questions?pagesize=1&order=desc&sort=votes&site=stackoverflow&filter=)pe0bT2YUo)Qn0m64ED*6Equ")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper.items[0]
    }
}

#Preview {
    ContentView()
}

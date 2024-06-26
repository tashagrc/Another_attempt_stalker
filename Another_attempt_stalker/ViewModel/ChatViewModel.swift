//
//  Page1ViewModel.swift
//  Flow_Logic
//
//  Created by Natasha Radika on 26/06/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var data: Chat
    
    init(data: Chat) {
        self.data = data
    }
    
    func addItem(_ item: String) {
        data.names.append(item)
    }
}

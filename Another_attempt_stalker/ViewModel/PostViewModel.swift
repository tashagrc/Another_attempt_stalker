//
//  Page2ViewModel.swift
//  Flow_Logic
//
//  Created by Natasha Radika on 26/06/24.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var data: Post
    
    init(data: Post) {
        self.data = data
    }
    
    func addItem(_ item: String) {
        data.name.append(item)
    }
}

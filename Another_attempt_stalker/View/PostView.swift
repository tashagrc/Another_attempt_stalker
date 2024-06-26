//
//  Page2View.swift
//  Flow_Logic
//
//  Created by Natasha Radika on 26/06/24.
//

import SwiftUI

struct PostView: View {
    @ObservedObject var viewModel: Page2ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.data.items, id: \.self) { item in
                Text(item)
            }
        }
        .navigationTitle("Page 2")
    }
}

//
//  Page1View.swift
//  Flow_Logic
//
//  Created by Natasha Radika on 26/06/24.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: Page1ViewModel
    @EnvironmentObject var notificationManager: NotificationManager
    
    var body: some View {
        Button(action: {
            notificationManager.show(image: "your_image_name", title: "New Message", description: "You have a new message.", time: "Now")
        }) {
            Text("Show Notification")
        }
        List {
            ForEach(viewModel.data.names, id: \.self) { item in
                Text(item)
            }
        }
        .navigationTitle("DMs")
    }
}

//
//  NotifOverlayTest.swift
//  Flow_Logic
//
//  Created by Natasha Radika on 26/06/24.
//

import SwiftUI
import Combine

class NotificationManager: ObservableObject {
    @Published var showNotification: Bool = false
    var notificationDetails: (image: String, title: String, description: String, time: String) = ("", "", "", "")
    
    func show(image: String, title: String, description: String, time: String) {
        self.notificationDetails = (image, title, description, time)
        self.showNotification = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                self.showNotification = false
            }
        }
    }
    
    func hide() {
        self.showNotification = false
    }
}


struct NotificationViewModifier: ViewModifier {
    @EnvironmentObject var notificationManager: NotificationManager
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if notificationManager.showNotification {
                VStack {
                    MessageNotification(
                        image: notificationManager.notificationDetails.image,
                        title: notificationManager.notificationDetails.title,
                        description: notificationManager.notificationDetails.description,
                        time: notificationManager.notificationDetails.time
                    )
                    .transition(.move(edge: .top))
                    .zIndex(1)
                    Spacer()
                }
            }
        }
    }
}

extension View {
    func overlayNotification() -> some View {
        self.modifier(NotificationViewModifier())
    }
}

struct MessageNotification: View {
    let image: String
    let title: String
    let description: String
    let time: String
    
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        HStack {
            Image(image).resizable().frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(.system(size: 15, weight: .semibold))
                    Spacer()
                    Text(time)
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 94/255, green: 89/255, blue: 88/255))
                }
                Text(description)
                    .font(.system(size: 15))
            }
        }
        .onAppear() {
            soundPlayer.playSound(sound: "message_notif", type: "mp3")
        }
        .padding()
        .frame(width: 370)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 168/255, green: 165/255, blue: 164/255))
                .opacity(0.6)
                .shadow(radius: 5)
        )
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct SoundPlayer {
    func playSound(sound: String, type: String) {
        // Implement your sound playing logic here
    }
}


//
//  AccoutView.swift
//  Activity
//
//  Created by TimurSmoev on 12/24/23.
//

import SwiftUI
import UserNotifications


struct HomeView: View {
    
    @State private var selectedDate = Date()

    var body: some View {
        
        NavigationStack{
            
            Button("Notification Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }

            Button("Schedule Notification") {
                
                let content = UNMutableNotificationContent()
                content.title = "Lets Check What You've Got For Today!"
                content.subtitle = "Motivation is what gets you started. Habit is what keeps you going"
                content.sound = UNNotificationSound.default
                
                // show this notification 12 hours in seconds from now
                var dateComponents = DateComponents()
                dateComponents.hour = 8
                dateComponents.minute = 30
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // add our notification request
                UNUserNotificationCenter.current().add(request)
                
            }
            .navigationTitle("Home")
        }        
            
        }
}


#Preview {
    HomeView()
}

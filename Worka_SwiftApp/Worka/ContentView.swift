//
//  ContentView.swift
//  Worka
//
//  Created by Connor Banting on 2024-10-15.
//

import SwiftUI

struct JobApplication: Identifiable {
    var id = UUID()
    var companyName: String
    var status: String
}

struct ContentView: View {
    @State private var email: String = ""  // State variable to hold user input email
    @State private var applications: [JobApplication] = [
        JobApplication(companyName: "Google", status: "Pending"),
        JobApplication(companyName: "Apple", status: "Interview")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
               
                TextField("Enter your email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

               
                Button(action: {
                    print("Tracking job applications for: \(email)")
                }) {
                    Text("Track Applications")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

               
                List(applications) { application in
                    HStack {
                        Text(application.companyName)
                        Spacer()
                        Text(application.status)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Job Applications") 
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

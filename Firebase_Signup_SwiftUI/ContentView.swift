//
//  ContentView.swift
//  Firebase_Signup_SwiftUI
//
//  Created by Jason Cardinale on 1/8/20.
//  Copyright © 2020 Jason Cardinale. All rights reserved.
//

/*
 welcome screen
 signupBtn shows signupView
 loginBtn shows loginView
*/

import SwiftUI
import Firebase

var logOutFailed = false

struct ContentView: View {
    
    var body: some View {
        
        logOutFailed = false
        
        return Group {
            if Auth.auth().currentUser != nil {
                HomeView()
            } else {
                WelcomeView()
            }
        }
        
    }
}

struct WelcomeView: View {
        
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 30) {
                
                Text("Welcome!")
                
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                }
                
                NavigationLink(destination: SignupView()) {
                    Text("Signup")
                }
                
            }
            .navigationBarBackButtonHidden(true)
                            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

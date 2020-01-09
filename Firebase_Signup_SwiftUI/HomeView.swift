//
//  HomeView.swift
//  Firebase_Signup_SwiftUI
//
//  Created by Jason Cardinale on 1/8/20.
//  Copyright © 2020 Jason Cardinale. All rights reserved.
//

//TODO: fix issue with showing back button

import SwiftUI
import Firebase

struct HomeView: View {
    
    @State private var loggedOut = false
    
    var body: some View {
        
        NavigationView {
        
            VStack(spacing: 30) {
                
                Button(action: {
                    
                    do {
                        try Auth.auth().signOut()
                    } catch {
                        logOutFailed = true
                        print("error occured while signing out")
                    }
                    
                    if !logOutFailed {
                        print("hi")
                        self.loggedOut = true
                    }

                }) {
                    Text("Sign out")
                }
                
                NavigationLink(destination: ContentView(), isActive: $loggedOut) {
                    EmptyView()
                }
                
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

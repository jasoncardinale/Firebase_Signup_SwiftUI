//
//  LoginView.swift
//  Firebase_Signup_SwiftUI
//
//  Created by Jason Cardinale on 1/8/20.
//  Copyright © 2020 Jason Cardinale. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginSuccess: Bool = false
    
    var body: some View {
                    
        VStack(alignment: .leading, spacing: 30) {
            
            Text("Login")
            
            TextField("Email", text: $email)
            
            SecureField("Password", text: $password)
            
            NavigationLink(destination: PasswordResetView()) {
                Text("Forgot password?")
            }
            
            Button(action: {
                
                if Auth.auth().currentUser == nil {
                    
                    if self.email != "" && self.password != "" {
                        
                        Auth.auth().signIn(withEmail: self.email, password: self.password, completion: { (user, error) in
                            print(Auth.auth().currentUser?.uid ?? "no uid")
                            if error == nil {
                                self.loginSuccess = true
                            }
                        })
                        
                    }
                    
                }
                
            }) {
                
                Text("Login")
                
            }
            
            NavigationLink(destination: SignupView()) {
                Text("Create an account")
            }
            
            NavigationLink(destination: HomeView(), isActive: $loginSuccess) {
                EmptyView()
            }
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
                                
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//
//  SignupView.swift
//  Firebase_Signup_SwiftUI
//
//  Created by Jason Cardinale on 1/8/20.
//  Copyright © 2020 Jason Cardinale. All rights reserved.
//

import SwiftUI
import Firebase

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password_confirm: String = ""
    @State private var signupSuccess: Bool = false
    
    var body: some View {
                    
        VStack(alignment: .leading, spacing: 30) {
            
            Text("Create an account")
            
            TextField("Email", text: $email)
            
            SecureField("Password", text: $password)
            
            SecureField("Confirm Password", text: $password_confirm)
            
            Button(action: {
                
                if self.email != "" && self.password != "" && self.password == self.password_confirm {
                    
                    Auth.auth().createUser(withEmail: self.email, password: self.password, completion: { (user, error) in
                        print(Auth.auth().currentUser?.uid ?? "no uid")
                        if error == nil {
                            self.signupSuccess = true
                        }
                    })
                    
                }
                
            }) {
                
                Text("Create Account")
                
            }
            
            NavigationLink(destination: LoginView()) {
                Text("Already have an account")
            }
            
            //hidden NavigationLink to open HomeView on successful signup
            NavigationLink(destination: HomeView(), isActive: $signupSuccess) {
                EmptyView()
            }
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
                                
    }
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

//
//  PasswordResetView.swift
//  Firebase_Signup_SwiftUI
//
//  Created by Jason Cardinale on 1/9/20.
//  Copyright © 2020 Jason Cardinale. All rights reserved.
//

import SwiftUI
import Firebase


func resetPassword(email: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {

    Auth.auth().sendPasswordReset(withEmail: email) { (error) in
        if error == nil {
            onSuccess()
        } else {
            onError(error!.localizedDescription)
        }
    }
    
}


struct PasswordResetView: View {
    
    @State private var showPasswordAlert = false
    @State private var email: String = ""
    @State private var errorText: String = ""
    
    var passwordResetAlert: Alert {
        Alert(title: Text("Reset your password"), message: Text("Please click the link in the password reset email sent to you"), dismissButton: .default(Text("Dismiss")){
          
            self.email = ""
            self.errorText = ""

        })
    }
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Text("Please enter email")
            
            TextField("Email", text: $email)
            
            Button(action: {
                Auth.auth().sendPasswordReset(withEmail: self.email) { error in

                    if let error = error {
                        self.errorText = error.localizedDescription
                        return
                    }
                    self.showPasswordAlert.toggle()
                }
            }) {
                Text("Submit")
            }
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showPasswordAlert, content: { self.passwordResetAlert })
        
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}

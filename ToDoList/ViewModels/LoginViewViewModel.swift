//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Matheus Mascarenhas de Barros on 05/04/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){}
    
    func login(){
        guard validate() else {
            return
        }
        
        //Try to log in
        
        Auth.auth().signIn(withEmail: email, password: password) 
    }
   private  func validate() -> Bool{
       errorMessage = ""
       guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
             !password.trimmingCharacters(in: .whitespaces).isEmpty else {
           
               errorMessage = "Please fill in all fields!"
               return false
       }
       
       guard email.contains("@") && email.contains(".") else {
           errorMessage = "Pleade enter valid email"
           return false
       }
       return true
    
        
    }
}

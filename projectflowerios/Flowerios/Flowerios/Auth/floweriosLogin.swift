//
//  floweriosLogin.swift
//  Flowerios
//
//  Created by Lumi on 02/12/21.
//

import SwiftUI

let storedUsername = "Myusername"
let storedPassword = "Mypassword"

struct floweriosLogin: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationFail: Bool = false
    @State var authenticationSuccess: Bool = false
    var body: some View {
        ZStack{
            VStack{
             LoginView()
             SubView()
             UsernameField(username: $username)
             PasswordField(password: $password)
                if authenticationFail {
                    Text("Username/Password not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                } else if authenticationSuccess{
                    Text("login succeed")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                Button(action: {if self.username == storedUsername && self.password == storedPassword{
                    self.authenticationSuccess = true
                    self.authenticationFail = false
                }else {
                    self.authenticationFail = true
                }
                    
                }){
                    LoginContent()
                }
            }
            .padding()
            .background(Color.white.opacity(0.6))
        }
        .background(Image("flowerlogin"))
        }
}

struct floweriosLogin_Previews: PreviewProvider {
    static var previews: some View {
        floweriosLogin()
    }
}

struct LoginView: View {
    var body: some View {
        Text("Flowerios")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}



struct UsernameField: View {
    @Binding var username: String
    var body: some View {
        TextField("Username",text: $username)
            .padding()
            .background(Color .gray)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color .gray)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct SubView: View {
    var body: some View {
        Text("Happiness Blooms From Within")
            .font(.subheadline)
            .italic()
            .padding(.bottom, 20)
    }
}

struct LoginContent: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color .blue)
            .cornerRadius(15.0)
    }
}

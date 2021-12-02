//
//  floweriosSignup.swift
//  Flowerios
//
//  Created by Lumi on 02/12/21.
//

import SwiftUI


struct floweriosSignup: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var repassword: String = ""
    
    @State var authenticationFail: Bool = false
    @State var authenticationSuccess: Bool = false
    var body: some View {
        ZStack{
        VStack {
            SignView()
            SignSubView()
            SignUserField(username: $username)
            SignPassField(password: $password)
            SignReField(repassword: $repassword)
            if authenticationFail {
                Text("Username/Password not correct. Try again.")
                    .offset(y: -10)
                    .foregroundColor(.red)
            } else if authenticationSuccess{
                Text("succeed")
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
                SignUp()
            }
        }
        .padding()
        .background(Color.white.opacity(0.6))
        }
        .background(Image("signflower"))
    }
}


struct floweriosSignup_Previews: PreviewProvider {
    static var previews: some View {
        floweriosSignup()
    }
}
struct SignView: View {
    var body: some View {
        Text("Bungaku")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct SignSubView: View {
    var body: some View {
        Text("Where Flowers Bloom, So Does Hope")
            .font(.subheadline)
            .italic()
            .padding(.bottom, 20)
    }
}

struct SignUserField: View {
    @Binding var username: String
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(Color .gray)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct SignPassField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color .gray)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct SignReField: View {
    @Binding var repassword: String
    var body: some View {
        SecureField("Re-type Password", text: $repassword)
            .padding()
            .background(Color .gray)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct SignUp: View {
    var body: some View {
        Text("SignUp")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color .blue)
            .cornerRadius(15.0)
    }
}

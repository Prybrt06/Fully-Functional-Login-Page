//
//  ContentView.swift
//  Assignment 2
//
//  Created by Priyabrat  Duarah on 24/06/22.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String)
    {
        auth.createUser(withEmail: email, password: password){[weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView{
            if(viewModel.signedIn)
            {
                VStack{
                    Text("You are Signed in")
                        .padding()
                    
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 100, height: 30)
                            Text("Log out")
                                .foregroundColor(.white)
                        }
                        
                    })
                }
            }
            else
            {
                SingInView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct SingInView: View {
    @State var myMail: String = ""
    @State var myPassword: String = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .bold()
                .padding()
            Spacer()
            
            VStack {
                VStack {
                    HStack {
                        Text("Username")
                        Spacer()
                            
                    }
                    .padding(.horizontal,40)
                    HStack
                    {
                        Image(systemName: "person")
                        
                        TextField("Type your username", text: $myMail)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical,5)
                    Divider()
                        .frame(width: 300)
                }
                .padding(.vertical,10)
                
                VStack {
                    HStack {
                        Text("Password")
                        Spacer()
                    }
                    .padding(.horizontal,40)
                    HStack
                    {
                        Image(systemName: "lock")
                        
                        SecureField("Type your password", text: $myPassword)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical,5)
                    Divider()
                        .frame(width: 300)
                }
                .padding(.top,10)
                .padding(.bottom,5)
                
                HStack
                {
                    Spacer()
                    Button(action: {})
                    {
                        Text("forgot password?")
                    }
                }
                .padding(.horizontal, 40)
                .padding(.bottom,30)
                
                Button(action: {
                    guard !myMail.isEmpty, !myPassword.isEmpty else
                    {
                        return
                    }
                    viewModel.signIn(email: myMail, password: myPassword)
                })
                {
                    ZStack{
                        Image("background").resizable().frame(width: 300, height: 40).cornerRadius(200)
                        
                        Text("Login")
                            .foregroundColor(.white)
                    }
                   
                }
                .frame(width: 300, height: 40).cornerRadius(200)
                .padding(.bottom)
                
                Divider()
                    .frame(width: 300)
                    .padding(.bottom,40)
                
                VStack {
                    Text("Or login using")
                        .font(.footnote)
                    
                    HStack{
                        
                        Button(action: {})
                        {
                            Image("facebook")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .background(Color.white)
                                .cornerRadius(23.9)
                        }
                        
                        Button(action: {})
                        {
                            
                            Image("twitter")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .background(Color.white)
                                .cornerRadius(23.9)
                        }
                        Button(action: {})
                        {
                            
                            Image("google")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .background(Color.white)
                                .cornerRadius(23.9)
                        }
                        Button(action: {})
                        {
                            Image("apple")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .background(Color.white)
                                .cornerRadius(23.9)
                        }
                    }
                }
                Spacer()
                
                VStack{
                    Text("Don't have an account?")
                        .padding(.bottom,7)
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    
                    NavigationLink("Sign Up", destination: SingUpView())
                }
                
                Spacer()
            }
        }
    }
}

struct SingUpView: View {
    @State var myMail: String = ""
    @State var myPassword: String = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .bold()
                .padding()
            Spacer()
            
            VStack {
                VStack {
                    HStack {
                        Text("Username")
                        Spacer()
                            
                    }
                    .padding(.horizontal,40)
                    HStack
                    {
                        Image(systemName: "person")
                        
                        TextField("Type your username", text: $myMail)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical,5)
                    Divider()
                        .frame(width: 300)
                }
                .padding(.vertical,10)
                
                VStack {
                    HStack {
                        Text("Password")
                        Spacer()
                    }
                    .padding(.horizontal,40)
                    HStack
                    {
                        Image(systemName: "lock")
                        
                        SecureField("Type your password", text: $myPassword)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical,5)
                    Divider()
                        .frame(width: 300)
                }
                .padding(.top,10)
                .padding(.bottom,5)
                
                Button(action: {
                    guard !myMail.isEmpty, !myPassword.isEmpty else
                    {
                        return
                    }
                    viewModel.signUp(email: myMail, password: myPassword)
                })
                {
                    ZStack{
                        Image("background").resizable().frame(width: 300, height: 40).cornerRadius(200)
                        
                        Text("Sign Up")
                            .foregroundColor(.white)
                    }
                   
                }
                .frame(width: 300, height: 40).cornerRadius(200)
                .padding(.bottom)
                
                Divider()
                    .frame(width: 300)
                    .padding(.bottom,40)
                
                VStack {
                    Text("Or Sign Up using")
                        .font(.footnote)
                    
                    HStack{
                        
                        Button(action: {})
                        {
                            Image("facebook")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .background(Color.white)
                                .cornerRadius(23.9)
                        }
                        
                        Button(action: {})
                        {
                            
                            Image("twitter")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .background(Color.white)
                                .cornerRadius(23.9)
                        }
                        Button(action: {})
                        {
                            
                            Image("google")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .background(Color.white)
                                .cornerRadius(23.9)
                        }
                        Button(action: {})
                        {
                            Image("apple")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .background(Color.white)
                                .cornerRadius(23.9)
                        }
                    }
                }
                
                Spacer()
            }
        }
        
        .navigationTitle("Sign Up")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

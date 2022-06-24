//
//  SignUpView.swift
//  Assignment 2
//
//  Created by Priyabrat  Duarah on 25/06/22.
//

import SwiftUI

struct SingUpView: View {
    @State var myMail: String = ""
    @State var myPassword: String = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Text("Sign Up")
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
    }
}

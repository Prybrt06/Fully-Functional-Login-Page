//
//  ContentView.swift
//  Assignment 2
//
//  Created by Priyabrat  Duarah on 24/06/22.
//

import SwiftUI


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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

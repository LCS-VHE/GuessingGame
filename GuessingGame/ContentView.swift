//
//  ContentView.swift
//  GuessingGame
//
//  Created by Vincent He on 2020-11-18.
//

import SwiftUI

func check_Answer(){
    
}

struct ContentView: View {
    @State private var givenInterger = 30
    @State private var Guess = "0"
    @State private var MinimumGuess = 0
    @State private var MaximumGuess = 100
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header:Text("Your Guess")){
                        TextField("Your Guess? ", text: $Guess)
                    }
                    Section(header:Text("Guesss")){
                        HStack{
                            Spacer()
                            Button("Guess"){
                                
                            }
                            
                            Spacer()
                        }
                    }
                    Section(header:Text("Hint")){
                        Text("It is Lower than \(MinimumGuess)")
                        Text("It is Higher than \(MaximumGuess)")
                    }
                    
                    Section(header:Text("Restart ?")){
                        HStack{
                            Spacer()
                            Button("Restart? "){
                            }
                            Spacer()
                        }
                        
                        NavigationLink(
                            destination: Text("Settings"),
                            label: {
                                /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                            })
                    }
                }
            }
            .navigationBarTitle("Guessing Game")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

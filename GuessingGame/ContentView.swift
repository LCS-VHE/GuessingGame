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
    @State private var givenInterger = Int.random(in: 0...101)
    @State private var Guess = "0"
    @State private var PlaceHolderGuess = "0"
    @State private var MinimumGuess = 0
    @State private var MaximumGuess = 100
    @State private var showAlert = false
    @State private var gameover = false
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header:Text("Your Guess")){
                        TextField("Your Guess? ", text: $PlaceHolderGuess)
                    }
                    Section(header:Text("Guesss")){
                        HStack{
                            Spacer()
                            Button("Guess"){
                                self.Guess = PlaceHolderGuess
                                update_state(GivenGuess: self.Guess)
                                if Int(self.Guess) == self.givenInterger{
                                    self.gameover = true
                                }
                            }
                            .disabled(gameover)
                            
                            Spacer()
                        }
                    }
                    Section(header:Text("Hint")){
                        if Int(self.Guess) == self.givenInterger{
                            Text("It is \(Guess)")
                        } else{
                            Text("It is not \(Guess)")
                        }
                        
                        Text("It is Lower than \(MaximumGuess)")
                        Text("It is Higher than \(MinimumGuess)")
                    }
                    
                    Section(header:Text("Restart ?")){
                        HStack{
                            Spacer()
                            Button("Restart? "){
                                self.restart_staets()
                            }
                            Spacer()
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Guessing Game")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Guessing Game"), message: Text("It is \(givenInterger)"), dismissButton: .default(Text("Got it!")))
            }
        }
    }
    
    func update_state(GivenGuess:String){
        guard let GivenInt = Int(GivenGuess)else{
            return
        }
        
        if GivenInt > self.givenInterger{
            self.MaximumGuess = GivenInt
            
        }else if GivenInt < self.givenInterger{
            self.MinimumGuess = GivenInt
            
        }else if GivenInt == self.givenInterger{
            self.showAlert = true
            return
        }
        
    }
    
    func restart_staets(){
        self.MaximumGuess = 100
        self.MinimumGuess = 0
        self.PlaceHolderGuess = "0"
        self.Guess = "0"
        self.givenInterger = Int.random(in: 0...101)
        self.gameover = false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

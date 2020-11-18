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
    @State private var PlaceHolderGuess = "0"
    @State private var MinimumGuess = 0
    @State private var MaximumGuess = 100
    
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
                            }
                            
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
                            }
                            Spacer()
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Guessing Game")
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
            return
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

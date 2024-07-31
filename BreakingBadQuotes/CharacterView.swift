//
//  CharacterView.swift
//  BreakingBadQuotes
//
//  Created by Swapnil Chatterjee on 30/07/24.
//

import SwiftUI

struct CharacterView: View {
    let character : Character
    let show: String
    
    var body: some View {
        GeometryReader {
            geo in
            ScrollViewReader { proxy in
                
                ZStack(alignment : .top) {
                    Image(show.removeCaseAndSpaces())
                        .resizable()
                        .scaledToFit()
                    ScrollView{
                        
                        TabView{
                            ForEach(character.images, id: \.self){
                                characterImageUrl in
                                
                                AsyncImage(url: characterImageUrl)
                                {
                                    image in
                                    image.resizable()
                                        .scaledToFill()
                                    
                                }placeholder : {
                                    ProgressView()
                                }
                            }
                        }.tabViewStyle(.page)
                            .frame(width: geo.size.width/1.2,height: geo.size.height/1.7).clipShape(.rect(cornerRadius: 25))
                            .padding(.top,60)
                        
                        VStack(alignment : .leading) {
                            Text(character.name)
                                .font(.largeTitle)
                            Text("Potrayed By: \(character.portrayedBy)")
                                .font(.subheadline)
                            Divider()
                            Text("\(character.name) Character Info")
                                .font(.title2)
                            
                            Text("Born: \(character.birthday)")
                            
                            Divider()
                            Text("Occupations:")
                            ForEach(character.occupations,id: \.self ){
                                occupation in
                                Text("• \(occupation)").font(.subheadline)
                                
                            }
                            Divider()
                            Text("Nicknames:")
                            if character.aliases.count > 0
                            {
                                ForEach(character.aliases,id: \.self ){
                                    alias in
                                    Text("• \(alias)").font(.subheadline)
                                    
                                }
                            }
                            else {
                                Text("None").font(.subheadline)
                            }
                            Divider()
                            
                            DisclosureGroup("Status (spoiler Alert!)"){
                                
                                VStack(alignment : .leading) {
                                    Text(character.status).font(.title2)
                                    
                                    if let death = character.death {
                                        AsyncImage(url: death.image)
                                        {
                                            image in
                                            image.resizable()
                                                .scaledToFill()
                                                .clipShape(.rect(cornerRadius: 15))
                                                .onAppear(perform: {
                                                    withAnimation{
                                                        proxy.scrollTo(1,anchor: .bottom)
                                                    }
                                                })
                                        
                                        }placeholder : {
                                            ProgressView()
                                        }
                                        Text("How: \(death.details)")
                                            .padding(.bottom,7)
                                        Text("Last words: \"\(death.lastWords)\"")
                                    }
                                    
                                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                
                            }.tint(.primary)
                        }.frame(width: geo.size.width/1.25,alignment: .leading)
                            .padding(.bottom,50)
                            .id(1)
                        
                    }.scrollIndicators(.hidden)
                }
            }
          
        }.ignoresSafeArea()
    }
}

#Preview {
    CharacterView(
        character: ViewModel().character, show:  Constants.bbName
    ).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

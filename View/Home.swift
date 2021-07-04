//
//  Home.swift
//  UI-251
//
//  Created by nyannyan0328 on 2021/07/04.
//

import SwiftUI

struct Home: View {
    @StateObject var model = HomeViewModel()
    @State var selected = "UpComing"
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing:15){
                
                
              Text("Hi Member")
                    .font(.title3.bold())
                    .kerning(1.3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                
                HStack(alignment:.bottom){
                    
                    Text("Check your\n**Meeting Detatils**")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Spacer(minLength: 0)
                    
                    
                    
                    Button {
                        
                        withAnimation{
                            
                            model.addNewMeeting.toggle()
                        }
                        
                        
                        
                    } label: {
                        Text("ADD")
                            .font(.caption)
                            .foregroundColor(.black)
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(
                            
                            Capsule()
                                .stroke(Color.gray,lineWidth: 2)
                            
                            )
                        
                        
                            
                    }

                    
                    
                    
                }
                .padding(.top,10)
                
                
                HStack(spacing:0){
                    
                    
                    ForEach(["UpComing","onHold","Canceled"],id:\.self){name in
                        
                        TabButton(title: name, selected: $selected, animation: animation)
                        
                        
                    }
                    
                    
                }
                .padding(.top,10)
                
                
                if model.meetings.isEmpty{
                    
                    Image("notes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .padding(.top,30)
                        
                    
                    Text("Add ***Meetings***")
                        .font(.title)
                        .padding(.top,30)
                    
                    
                }
                
                
                VStack{
                    
                    ForEach($model.meetings){$meetings in
                        
                        MeetingCardView(meeting: $meetings)
                        
                    }
                    
                    
                    
                    
                }
                .padding(.top,25)
                
                
                
                
            }
            .padding()
            
            
        }
        .background(Color("Bg"))
        .overlay(
        
            ZStack{
            
            if model.addNewMeeting{
            
            
            AddMeeting()
                .environmentObject(model)
            
        }
        }
        
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabButton : View{
    
    var title : String
    @Binding var selected : String
    var animation : Namespace.ID
        
    var body: some View{
        Button {
            
            
            withAnimation(.spring()){
                
                selected = title
                
            }
        } label: {
            
            
            VStack{
                
                
                Text(title)
                    .font(.title3)
                    .foregroundColor(selected == title ? .black : .gray)
                
                if selected == title{
                    
                    
                    Capsule()
                        .fill(Color.red)
                        .frame(width: 100 , height: 3)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                    
                }
                else{
                    Capsule()
                        .fill(Color.clear)
                        .frame(width: 100, height: 1)
                    
                    
                    
                    
                }
                
                
                
            }
            .frame(maxWidth: .infinity)
            
        }

        
        
        
        
    }
        
    
}

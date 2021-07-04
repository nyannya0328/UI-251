//
//  MeetingCardView.swift
//  UI-251
//
//  Created by nyannyan0328 on 2021/07/04.
//

import SwiftUI

struct MeetingCardView: View {
    
    @Binding var meeting : Meeting
    var body: some View {
        VStack(spacing:10){
            
            
            HStack(alignment:.top){
                
                VStack(alignment:.leading,spacing:12){
                    
                    
                    Text(meeting.timing.formatted(date: .numeric, time: .omitted))
                        .font(.caption)
                    
                    Text(meeting.title)
                        .font(.title2.bold())
                    
                    Text("\($meeting.members.count)Members Joing")
                    
                    
                    
                    
                }
                
                Spacer(minLength: 0)
                
                ZStack(alignment: meeting.turnedON ? .trailing : .leading){
                
                    
                    Capsule()
                        .fill(.secondary)
                        .foregroundStyle(.white)
                        .frame(width: 35, height: 18)
                    
                    Capsule()
                      
                        .foregroundStyle(.white)
                        .frame(width: 18, height: 18)
                    
                    
                    
                }
                .shadow(color: .gray, radius: 5)
                .onTapGesture {
                    
                    meeting.turnedON.toggle()
                
                }
               
                
            }
            .foregroundColor(getColor())
            
            HStack(spacing:-10){
                
                ForEach(1...3,id:\.self){index in
                    
                    
                    Image("animoji\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(4)
                        .background(.white,in:Circle())
                        .background(
                        
                        Circle()
                            .stroke(Color.black,lineWidth: 3)
                        )
                    
                    
                }
                
                
                Spacer(minLength: 15)
                
                
                
                Button {
                    
                } label: {
                    Text("Join")
                        .foregroundColor(.black)
                        .padding(.horizontal,10)
                        
                }
                .buttonStyle(.bordered)
                .controlSize(.small)
                .tint(.white)
                .controlProminence(.increased)
                .shadow(radius: 1.2)

                
            }
            
            
            
        }
        .padding()
        .background(meeting.color,in: RoundedRectangle(cornerRadius: 10))
        
    }
    
    func getColor()->Color{
        
        if meeting.color == Color("Purple") || meeting.color == Color("Green"){
            
            return Color.blue
        }
        
        return Color.black
        
    }
}

struct MeetingCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

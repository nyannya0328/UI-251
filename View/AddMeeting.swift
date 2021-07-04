//
//  AddMeeting.swift
//  UI-251
//
//  Created by nyannyan0328 on 2021/07/04.
//

import SwiftUI

struct AddMeeting: View {
    @EnvironmentObject var model : HomeViewModel
    
    @State var currentMeetingdate = Meeting(title: "", timing: Date())
    
    @State var showDatePicker = false
    
    @State var selected = "Private"
    var body: some View {
        
        ScrollView(UIScreen.main.bounds.height < 850 ? .vertical : .init(), showsIndicators: false) {
            
            
            VStack{
                
                
                HStack{
                    
                    Button {
                        
                        withAnimation{
                            
                            model.addNewMeeting.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.gray,in: Circle())
                        
                    }

                    
                    Spacer(minLength: 0)
                    
                    Image("pro")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    
                }
                .overlay(
                
                    
                Text("Add new Meeting")
                    .font(.title.weight(.heavy))
                    .shadow(radius: 5)
                
               
                
                
                )
                
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Enter meeting Name")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    TextField("Enter", text: $currentMeetingdate.title)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                    
                    Divider()
                        .background(.red)
                    
                    
                }
                .padding(.top,10)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Timing")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    
                    HStack{
                        
                        let time = currentMeetingdate.timing.formatted(date: .numeric, time: .omitted)
                        
                        let date = currentMeetingdate.timing.formatted(date: .abbreviated, time: .standard)
                        
                        
                        Text("\(time),\(date)")
                            .font(.callout)
                        
                        Spacer()
                        
                        
                        Button {
                            withAnimation{
                                
                                
                                showDatePicker.toggle()
                            }
                            
                        } label: {
                            
                            
                            Image(systemName: "calendar")
                                .font(.callout)
                                .foregroundColor(.black)
                                .padding(5)
                                .background(.yellow,in: Circle())
                            
                        }

                        
                        
                        
                    }
                    
                    
                    Divider()
                        .background(.red)
                    
                    
                }
                .padding(.top,10)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Select Collaboration")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    
                    HStack(spacing:-10){
                        
                        
                        ForEach(1...3,id:\.self){index in
                            
                            
                            Image("animoji\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(4)
                                .background(.white,in:Circle())
                                .background(
                                
                                Circle()
                                    .stroke(Color.black,lineWidth: 3)
                                )
                            
                            
                        }
                        
                        
                        Spacer(minLength: 0)
                        
                        
                        Button {
                            
                        } label: {
                            
                            Text("Contact")
                                .font(.caption)
                                .foregroundColor(.black)
                            
                        }
                        .buttonStyle(.bordered)
                        .controlSize(.regular)
                        .tint(.green.opacity(0.3))
                        .controlProminence(.increased)
                        

                        
                        
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    Divider()
                        .background(.red)
                    
                    
                }
                .padding(.top,10)
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Meeting Type")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    
                    HStack(spacing:15){
                        
                        
                        
                        ForEach(["Private","Public","ONinvited"],id:\.self){meeting in
                            
                            
                            MeetingButton(title: meeting, slected: $selected)
                            
                            
                            
                        }
                        
                        
                        
                        
                    }
                  
                    Divider()
                        .background(.red)
                    
                    
                }
                .padding(.top,10)
                .padding(.bottom,5)
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Card Color")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
               
                    
                    let colors = [Color("Blue"),Color("Green"),Color("Purple"),Color("Red"),Color("Orange")]
                    
                    
                    HStack(spacing:20){
                        ForEach(colors,id:\.self){color in
                            
                            Circle()
                                .fill(color)
                                .frame(width: 30, height: 30)
                                .overlay(
                                
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                    .opacity(currentMeetingdate.color == color ? 1 : 0)
                                
                                )
                                .onTapGesture {
                                    currentMeetingdate.color = color
                                }
                            
                            
                            
                        }
                    }
                    
                    Divider()
                        .background(.red)
                    
                    
                }
                .padding(.top,10)
                
                Spacer(minLength: 20)
                
                
                Button {
                    
                    addNewMeeting()
                    
                    
                } label: {
                    
                    Text("Sucheduel")
                        .font(.title.italic())
                        .foregroundColor(.primary)
                        .padding(.vertical,7)
                        .padding(.horizontal,20)
                        
                    
                    
                }
                .buttonStyle(.bordered)
                .tint(.purple)
                .controlSize(.small)
                .controlProminence(.increased)
                .disabled(currentMeetingdate.title == "")
                
                

                
                
                
                
                
                
                
                
                
            }
            .padding()
            
            
        }
        
        
       
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("Bg"))
        .overlay(CustomDatePicker(showPicker: $showDatePicker, date: $currentMeetingdate.timing))
        .transition(.move(edge: .bottom))
    }
    
    func addNewMeeting(){
        model.meetings.append(currentMeetingdate)
        model.addNewMeeting.toggle()
        
    }
}


struct AddMeeting_Previews: PreviewProvider {
    static var previews: some View {
        AddMeeting()
    }
}




struct CustomDatePicker : View{
    
    
    @Binding var showPicker : Bool
    
    @Binding var date : Date
        
    var body: some View{
        
        
        ZStack{
            
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
            
            
            DatePicker("", selection: $date, displayedComponents: [.date,.hourAndMinute])
                .labelsHidden()
            
            Button {
                
                withAnimation{
                    
                    showPicker.toggle()
                }
                
            } label: {
                
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(.gray,in: Circle())
                
            }
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)

            
            
        }
        .opacity(showPicker ? 1 : 0)
    }
    
    
}

struct MeetingButton : View{
    
    
    var title : String
    @Binding var slected : String
    
    var body: some View{
        
        
        Button {
            withAnimation(.linear){
                
                
                slected = title
            }
            
        } label: {
            
            
            Text(title)
                .font(.footnote)
                .foregroundColor(slected == title ? .white : .gray)
                .padding(.vertical,8)
                .frame(maxWidth: .infinity)
                .background(
                
                Capsule()
                    .fill(Color.black.opacity(slected == title ? 1 : 0))
                
                )
            
                .background(
                
                Capsule()
                    .stroke(Color.green,lineWidth: 3)
                
                )
            
            
            
            
            
            
        }
        .frame(maxWidth: .infinity)

    }
    
}

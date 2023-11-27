//
//  DropDownView.swift
//  Countries
//
//  Created by Pulkit Dhirana on 26/11/23.
//

import SwiftUI

struct DropDownView: View {
    
    // name
    @State var hint: String
    @State var navigateTo: Bool = false
    var options: [CountryList]
    @State private var countryName: String = ""
    @State private var countryCities: [String] = [String]()
    @Binding var selection: String?
    @State private var show: Bool = false
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        VStack {
            ZStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                    ScrollView {
                            VStack {
                                ForEach(options, id: \.cities) { option in
                                        HStack {
                                            Button {
                                                withAnimation {
                                                    hint = option.country
                                                    countryName = option.country
                                                    show.toggle()
                                                    countryCities = option.cities
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                        navigateTo.toggle()
                                                    }

                                                }
                                            } label: {
                                                Text(option.country)
                                                    .foregroundStyle(Color.white.opacity(0.6))
                                                    .bold()
                                            }
                                            Spacer()
                                        }
                                        .padding(.horizontal, 15)
                                        .navigationDestination(isPresented: $navigateTo) {
                                            CitiesPage(countryName: countryName, cities: countryCities)
                                    }

                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 15)
                        }
                    }
                }
                .frame(height: show ? 225 : 50)
                .opacity(show ? 1 : 0)
                
            }
            .frame(height: 250)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 60)
                HStack {
                    Text(hint)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(show ? -180 : 0))
                }
                .bold()
                .padding(.horizontal)
                .foregroundStyle(.white)
            }
            .offset(y: -320)
            .onTapGesture {
                withAnimation(.snappy) {
                        show.toggle()
                }
            }
        }
        .padding()
        }
    
}

//#Preview {
//    ContentView()
//}


//
//  Header.swift
//  MRTGo
//
//  Created by Ario Syahputra on 19/07/23.
//

import SwiftUI

struct Header: View {
    @Binding var departure: String
    @Binding var destination: String
    @Binding var isDepartureChosen: Bool
    @Binding var isDestinationChosen: Bool

    var body: some View {
        ZStack {
            // Blue Header
            Rectangle()
                .foregroundColor(Color("Primary"))
                .ignoresSafeArea(.all)
                .frame(width: 400, height: 200)

            // Textfield
            VStack {
                Text("Rencana Perjalanan")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding()

                // Departure Textfield
                ZStack(alignment: .leading) {
                    Image("marker-pin-departure")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    if departure.isEmpty {
                        Text("Pilih Stasiun Keberangkatan")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 40)
                    }

//                    TextField("", text: $departure) // Use the binding here
                    TextField("", text: $departure)
                        .padding(.leading, 40)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color("Primary"))
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(200)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .onChange(of: departure) { newValue in
                    isDepartureChosen = matchedStations(stations: stations, departure: departure, isDepartureChosen: isDepartureChosen).isEmpty
                    isDepartureChosen = (stations.first(where: { station in
                        station.name == newValue
                    }) != nil)
                }

                // Destination Textfield
                ZStack(alignment: .leading) {
                    Image(!isDepartureChosen ? "marker-pin-destination-disabled" : "marker-pin-destination")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    if destination.isEmpty {
                        Text("Pilih Tujuan")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(!isDepartureChosen ? Color("Gray-400") : Color("Primary"))
                            .padding(.leading, 40)
                    }

                    TextField("", text: $destination)
                        .padding(.leading, 40)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color("Primary"))
                        .disabled(!isDepartureChosen)

                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(!isDepartureChosen ? Color("Gray-300") : .white)
                .cornerRadius(200)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .onChange(of: destination) { newValue in
                                    // Check if the entered text matches any station
                    isDestinationChosen = matchedDestination(destinationPlace: destinationPlace, destination: destination, isDestinationChosen: isDestinationChosen).isEmpty
                    isDestinationChosen = (destinationPlace.first(where: { destinations in
                        destinations.name == newValue
                    }) != nil)
                }
            }
            .padding(.bottom, 40)
        }
    }
}

//struct Header_Previews: PreviewProvider {
//    static var previews: some View {
//        Header()
//    }
//}

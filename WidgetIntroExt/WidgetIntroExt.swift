//
//  WidgetIntroExt.swift
//  WidgetIntroExt
//
//  Created by Bill Martensson on 2020-11-19.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), firstname: "Example")
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        /*
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        */
        
        var tempEntry = SimpleEntry(date: Date(), configuration: configuration, firstname: "Bill")
        
        entries.append(tempEntry)
        
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    
    var firstname = ""
}

struct WidgetIntroExtEntryView : View {
    @Environment(\.widgetFamily) private var widgetFamily
    
    
    var entry: Provider.Entry

    var body: some View {
        VStack {
            
            Text("Hej")
                .font(.largeTitle)
            
            Text(entry.firstname)
            //Text(entry.date, style: .time)
            
            if(widgetFamily == WidgetFamily.systemLarge)
            {
                Text("Denna är stor")
                InfoboxView()
            }
            
            
            
        }
        
    }
}

@main
struct WidgetIntroExt: Widget {
    let kind: String = "WidgetIntroExt"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetIntroExtEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        //.supportedFamilies([.systemMedium])
    }
}

struct WidgetIntroExt_Previews: PreviewProvider {
    static var previews: some View {
        
        
        
        WidgetIntroExtEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), firstname: "TEST"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        WidgetIntroExtEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), firstname: "TEST"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))

        WidgetIntroExtEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), firstname: "TEST"))
            .previewContext(WidgetPreviewContext(family: .systemLarge))

        
        
    }
}

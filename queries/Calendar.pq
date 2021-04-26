let
    Today = Date.From(DateTime.LocalNow()),
    // today's date
    FromYear = 2021,
    // start year 
    ToYear = 2022,
    // end year 
    StartofFiscalYear = 7,
    // month number that is start of the financial year.
    firstDayofWeek = Day.Monday,
    // week's start day
    
    FromDate = #date(FromYear, 1, 1),
    ToDate = #date(ToYear, 12, 31),
    Source =
        List.Dates(
            FromDate,
            Duration.Days(ToDate - FromDate) + 1,
            #duration(1, 0, 0, 0)
        ),
    #"Converted to Table" =
        Table.FromList(
            Source,
            Splitter.SplitByNothing(),
            null,
            null,
            ExtraValues.Error
        ),
    #"Renamed Columns" =
        Table.RenameColumns(
            #"Converted to Table",
            {
                {
                    "Column1",
                    "Date"
                }
            }
        ),
    #"Changed Type" =
        Table.TransformColumnTypes(
            #"Renamed Columns",
            {
                {
                    "Date",
                    type date
                }
            }
        ),
    #"Inserted Year" =
        Table.AddColumn(
            #"Changed Type",
            "Year",
            each Date.Year([Date]),
            Int64.Type
        ),
    #"Inserted Start of Year" =
        Table.AddColumn(
            #"Inserted Year",
            "Start of Year",
            each Date.StartOfYear([Date]),
            type date
        ),
    #"Inserted End of Year" =
        Table.AddColumn(
            #"Inserted Start of Year",
            "End of Year",
            each Date.EndOfYear([Date]),
            type date
        ),
    #"Inserted Month" =
        Table.AddColumn(
            #"Inserted End of Year",
            "Month",
            each Date.Month([Date]),
            Int64.Type
        ),
    #"Inserted Start of Month" =
        Table.AddColumn(
            #"Inserted Month",
            "Start of Month",
            each Date.StartOfMonth([Date]),
            type date
        ),
    #"Inserted End of Month" =
        Table.AddColumn(
            #"Inserted Start of Month",
            "End of Month",
            each Date.EndOfMonth([Date]),
            type date
        ),
    #"Inserted Days in Month" =
        Table.AddColumn(
            #"Inserted End of Month",
            "Days in Month",
            each Date.DaysInMonth([Date]),
            Int64.Type
        ),
    #"Inserted Day" =
        Table.AddColumn(
            #"Inserted Days in Month",
            "Day",
            each Date.Day([Date]),
            Int64.Type
        ),
    #"Inserted Day Name" =
        Table.AddColumn(
            #"Inserted Day",
            "Day Name",
            each Date.DayOfWeekName([Date]),
            type text
        ),
    #"Inserted Day of Week" =
        Table.AddColumn(
            #"Inserted Day Name",
            "Day of Week",
            each Date.DayOfWeek([Date]),
            Int64.Type
        ),
    #"Inserted Day of Year" =
        Table.AddColumn(
            #"Inserted Day of Week",
            "Day of Year",
            each Date.DayOfYear([Date]),
            Int64.Type
        ),
    #"Inserted Month Name" =
        Table.AddColumn(
            #"Inserted Day of Year",
            "Month Name",
            each Date.MonthName([Date]),
            type text
        ),
    #"Inserted Quarter" =
        Table.AddColumn(
            #"Inserted Month Name",
            "Quarter",
            each Date.QuarterOfYear([Date]),
            Int64.Type
        ),
    #"Inserted Start of Quarter" =
        Table.AddColumn(
            #"Inserted Quarter",
            "Start of Quarter",
            each Date.StartOfQuarter([Date]),
            type date
        ),
    #"Inserted End of Quarter" =
        Table.AddColumn(
            #"Inserted Start of Quarter",
            "End of Quarter",
            each Date.EndOfQuarter([Date]),
            type date
        ),
    #"Inserted Week of Year" =
        Table.AddColumn(
            #"Inserted End of Quarter",
            "Week of Year",
            each Date.WeekOfYear([Date], firstDayofWeek),
            Int64.Type
        ),
    #"Inserted Week of Month" =
        Table.AddColumn(
            #"Inserted Week of Year",
            "Week of Month",
            each Date.WeekOfMonth([Date], firstDayofWeek),
            Int64.Type
        ),
    #"Inserted Start of Week" =
        Table.AddColumn(
            #"Inserted Week of Month",
            "Start of Week",
            each Date.StartOfWeek([Date], firstDayofWeek),
            type date
        ),
    #"Inserted End of Week" =
        Table.AddColumn(
            #"Inserted Start of Week",
            "End of Week",
            each Date.EndOfWeek([Date], firstDayofWeek),
            type date
        ),
    FiscalMonthBaseIndex = 13 - StartofFiscalYear,
    adjustedFiscalMonthBaseIndex =
        if
            (
                FiscalMonthBaseIndex
                >= 12
                or FiscalMonthBaseIndex
                < 0
            )
        then
            0
        else
            FiscalMonthBaseIndex,
    #"Added Custom" =
        Table.AddColumn(
            #"Inserted End of Week",
            "FiscalBaseDate",
            each
                Date.AddMonths(
                    [Date],
                    adjustedFiscalMonthBaseIndex
                )
        ),
    #"Changed Type1" =
        Table.TransformColumnTypes(
            #"Added Custom",
            {
                {
                    "FiscalBaseDate",
                    type date
                }
            }
        ),
    #"Inserted Year1" =
        Table.AddColumn(
            #"Changed Type1",
            "Year.1",
            each Date.Year([FiscalBaseDate]),
            Int64.Type
        ),
    #"Renamed Columns1" =
        Table.RenameColumns(
            #"Inserted Year1",
            {
                {
                    "Year.1",
                    "Fiscal Year"
                }
            }
        ),
    #"Inserted Quarter1" =
        Table.AddColumn(
            #"Renamed Columns1",
            "Quarter.1",
            each Date.QuarterOfYear([FiscalBaseDate]),
            Int64.Type
        ),
    #"Renamed Columns2" =
        Table.RenameColumns(
            #"Inserted Quarter1",
            {
                {
                    "Quarter.1",
                    "Fiscal Quarter"
                }
            }
        ),
    #"Inserted Month1" =
        Table.AddColumn(
            #"Renamed Columns2",
            "Month.1",
            each Date.Month([FiscalBaseDate]),
            Int64.Type
        ),
    #"Renamed Columns3" =
        Table.RenameColumns(
            #"Inserted Month1",
            {
                {
                    "Month.1",
                    "Fiscal Month"
                }
            }
        ),
    #"Removed Columns" =
        Table.RemoveColumns(
            #"Renamed Columns3",
            {"FiscalBaseDate"}
        ),
    #"Inserted Age" =
        Table.AddColumn(
            #"Removed Columns",
            "Age",
            each [Date] - Today,
            type duration
        ),
    #"Extracted Days" =
        Table.TransformColumns(
            #"Inserted Age",
            {
                {
                    "Age",
                    Duration.Days,
                    Int64.Type
                }
            }
        ),
    #"Renamed Columns4" =
        Table.RenameColumns(
            #"Extracted Days",
            {
                {
                    "Age",
                    "Day Offset"
                }
            }
        ),
    #"Added Custom1" =
        Table.AddColumn(
            #"Renamed Columns4",
            "Month Offset",
            each
                (([Year] - Date.Year(Today)) * 12)
                + ([Month] - Date.Month(Today))
        ),
    #"Changed Type2" =
        Table.TransformColumnTypes(
            #"Added Custom1",
            {
                {
                    "Month Offset",
                    Int64.Type
                }
            }
        ),
    #"Added Custom2" =
        Table.AddColumn(
            #"Changed Type2",
            "Year Offset",
            each [Year] - Date.Year(Today)
        ),
    #"Changed Type3" =
        Table.TransformColumnTypes(
            #"Added Custom2",
            {
                {
                    "Year Offset",
                    Int64.Type
                }
            }
        ),
    #"Added Custom3" =
        Table.AddColumn(
            #"Changed Type3",
            "Quarter Offset",
            each
                (([Year] - Date.Year(Today)) * 4)
                + ([Quarter] - Date.QuarterOfYear(Today))
        ),
    #"Changed Type4" =
        Table.TransformColumnTypes(
            #"Added Custom3",
            {
                {
                    "Quarter Offset",
                    Int64.Type
                }
            }
        ),
    #"Duplicated Column" =
        Table.DuplicateColumn(
            #"Changed Type4",
            "Week of Month",
            "Week of Month - Copy"
        ),
    #"Renamed Columns5" =
        Table.RenameColumns(
            #"Duplicated Column",
            {
                {
                    "Week of Month - Copy",
                    "Week of Month_name"
                }
            }
        ),
    #"Changed Type5" =
        Table.TransformColumnTypes(
            #"Renamed Columns5",
            {
                {
                    "Week of Month_name",
                    type text
                }
            }
        ),
    #"Replaced Value" =
        Table.ReplaceValue(
            #"Changed Type5",
            "1",
            "Week1",
            Replacer.ReplaceText,
            {"Week of Month_name"}
        ),
    #"Replaced Value1" =
        Table.ReplaceValue(
            #"Replaced Value",
            "2",
            "Week2",
            Replacer.ReplaceText,
            {"Week of Month_name"}
        ),
    #"Replaced Value2" =
        Table.ReplaceValue(
            #"Replaced Value1",
            "3",
            "Week3",
            Replacer.ReplaceText,
            {"Week of Month_name"}
        ),
    #"Replaced Value3" =
        Table.ReplaceValue(
            #"Replaced Value2",
            "4",
            "Week4",
            Replacer.ReplaceText,
            {"Week of Month_name"}
        ),
    #"Replaced Value4" =
        Table.ReplaceValue(
            #"Replaced Value3",
            "5",
            "Week5",
            Replacer.ReplaceText,
            {"Week of Month_name"}
        ),
    #"Replaced Value5" =
        Table.ReplaceValue(
            #"Replaced Value4",
            "6",
            "Week6",
            Replacer.ReplaceText,
            {"Week of Month_name"}
        )
in
    #"Replaced Value5"
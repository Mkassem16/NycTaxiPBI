let
    // importing data
    Source =
        Csv.Document(
            Web.Contents("https://storage.googleapis.com/powerbi_datacamp/nyc_taxi_db.csv"),
            [
                Delimiter = ",",
                QuoteStyle = QuoteStyle.Csv
            ]
        ),
    #"Promoted Headers" =
        Table.PromoteHeaders(
            Source,
            [PromoteAllScalars = true]
        ),
    // data types transformation
    #"Changed Type" =
        Table.TransformColumnTypes(
            #"Promoted Headers",
            {
                {
                    "vendor_id",
                    Int64.Type
                },
                {
                    "pickup_datetime",
                    type datetime
                },
                {
                    "dropoff_datetime",
                    type datetime
                },
                {
                    "passenger_count",
                    Int64.Type
                },
                {
                    "trip_distance",
                    type number
                },
                {
                    "rate_code",
                    Int64.Type
                },
                {
                    "store_and_fwd_flag",
                    type text
                },
                {
                    "payment_type",
                    Int64.Type
                },
                {
                    "fare_amount",
                    type number
                },
                {
                    "extra",
                    type number
                },
                {
                    "mta_tax",
                    type number
                },
                {
                    "tip_amount",
                    type number
                },
                {
                    "tolls_amount",
                    type number
                },
                {
                    "imp_surcharge",
                    type number
                },
                {
                    "total_amount",
                    type number
                },
                {
                    "pickup_location_id",
                    Int64.Type
                },
                {
                    "dropoff_location_id",
                    Int64.Type
                }
            }
        ),
    //  currency columns
    #"Changed Type1" =
        Table.TransformColumnTypes(
            #"Changed Type",
            {
                {
                    "fare_amount",
                    Currency.Type
                },
                {
                    "extra",
                    Currency.Type
                },
                {
                    "mta_tax",
                    Currency.Type
                },
                {
                    "tip_amount",
                    Currency.Type
                },
                {
                    "tolls_amount",
                    Currency.Type
                },
                {
                    "imp_surcharge",
                    Currency.Type
                },
                {
                    "total_amount",
                    Currency.Type
                }
            }
        ),
    // extracting date only
    #"Duplicated Column" =
        Table.DuplicateColumn(
            #"Changed Type1",
            "pickup_datetime",
            "pickup_datetime - Copy"
        ),
    #"Renamed Columns" =
        Table.RenameColumns(
            #"Duplicated Column",
            {
                {
                    "pickup_datetime - Copy",
                    "date"
                }
            }
        ),
    #"Extracted Date" =
        Table.TransformColumns(
            #"Renamed Columns",
            {
                {
                    "date",
                    DateTime.Date,
                    type date
                }
            }
        ),
    #"Duplicated Column1" =
        Table.DuplicateColumn(
            #"Extracted Date",
            "pickup_datetime",
            "pickup_datetime - Copy"
        ),
    // extracting time only
    #"Extracted Time" =
        Table.TransformColumns(
            #"Duplicated Column1",
            {
                {
                    "pickup_datetime - Copy",
                    DateTime.Time,
                    type time
                }
            }
        ),
    #"Renamed Columns1" =
        Table.RenameColumns(
            #"Extracted Time",
            {
                {
                    "pickup_datetime - Copy",
                    "pickup_time"
                }
            }
        ),
    #"Changed Type2" =
        Table.TransformColumnTypes(
            #"Renamed Columns1",
            {
                {
                    "pickup_time",
                    type text
                }
            }
        ),
    // conditions for AM/PM classification
    #"Added Conditional Column" =
        Table.AddColumn(
            #"Changed Type2",
            "ampm",
            each
                if Text.Contains([pickup_time], "AM") then
                    "AM"
                else
                    "PM"
        ),
    // duration in minutes calculation
    #"Added Custom" =
        Table.AddColumn(
            #"Added Conditional Column",
            "duration",
            each [dropoff_datetime] - [pickup_datetime]
        ),
    #"Changed Type3" =
        Table.TransformColumnTypes(
            #"Added Custom",
            {
                {
                    "duration",
                    type duration
                }
            }
        ),
    #"Extracted Minutes" =
        Table.TransformColumns(
            #"Changed Type3",
            {
                {
                    "duration",
                    Duration.Minutes,
                    Int64.Type
                }
            }
        ),
    #"Changed Type4" =
        Table.TransformColumnTypes(
            #"Extracted Minutes",
            {
                {
                    "payment_type",
                    type text
                }
            }
        ),
    // payment type values
    #"Replaced Value" =
        Table.ReplaceValue(
            #"Changed Type4",
            "1",
            "Credit card",
            Replacer.ReplaceText,
            {"payment_type"}
        ),
    #"Replaced Value1" =
        Table.ReplaceValue(
            #"Replaced Value",
            "2",
            "Cash",
            Replacer.ReplaceText,
            {"payment_type"}
        ),
    #"Replaced Value2" =
        Table.ReplaceValue(
            #"Replaced Value1",
            "3",
            "No charge",
            Replacer.ReplaceText,
            {"payment_type"}
        ),
    #"Replaced Value3" =
        Table.ReplaceValue(
            #"Replaced Value2",
            "4",
            "Dispute",
            Replacer.ReplaceText,
            {"payment_type"}
        ),
    #"Replaced Value4" =
        Table.ReplaceValue(
            #"Replaced Value3",
            "5",
            "Unknown",
            Replacer.ReplaceText,
            {"payment_type"}
        ),
    #"Replaced Value5" =
        Table.ReplaceValue(
            #"Replaced Value4",
            "6",
            "Voided",
            Replacer.ReplaceText,
            {"payment_type"}
        )
in
    #"Replaced Value5"
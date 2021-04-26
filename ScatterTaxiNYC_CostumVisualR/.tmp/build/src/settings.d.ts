import { dataViewObjectsParser } from "powerbi-visuals-utils-dataviewutils";
import DataViewObjectsParser = dataViewObjectsParser.DataViewObjectsParser;
export declare class VisualSettings extends DataViewObjectsParser {
    rcv_script: rcv_scriptSettings;
}
export declare class rcv_scriptSettings {
    provider: any;
    source: any;
}

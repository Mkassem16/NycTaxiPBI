import { Visual } from "../../src/visual";
import powerbiVisualsApi from "powerbi-visuals-api";
import IVisualPlugin = powerbiVisualsApi.visuals.plugins.IVisualPlugin;
import VisualConstructorOptions = powerbiVisualsApi.extensibility.visual.VisualConstructorOptions;
var powerbiKey: any = "powerbi";
var powerbi: any = window[powerbiKey];

var ScatterTaxiNYC1112: IVisualPlugin = {
    name: 'ScatterTaxiNYC1112',
    displayName: 'ScatterTaxiNYC',
    class: 'Visual',
    apiVersion: '2.6.0',
    create: (options: VisualConstructorOptions) => {
        if (Visual) {
            return new Visual(options);
        }

        throw 'Visual instance not found';
    },
    custom: true
};

if (typeof powerbi !== "undefined") {
    powerbi.visuals = powerbi.visuals || {};
    powerbi.visuals.plugins = powerbi.visuals.plugins || {};
    powerbi.visuals.plugins["ScatterTaxiNYC1112"] = ScatterTaxiNYC1112;
}

export default ScatterTaxiNYC1112;
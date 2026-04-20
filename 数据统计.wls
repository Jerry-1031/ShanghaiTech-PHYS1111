#!/usr/bin/env wolframscript
(* ::Package:: *)

DataStatistic[x_List]:=Module[{mean,tValue=1.14,deltaB=0.0095,uncertainty},
MeanStandardDeviation[data_]:=StandardDeviation[data]/Sqrt[Length[data]];
DeltaA[data_,t_]:=t*StandardDeviation[data];
Uncertainty[data_,t_,deltaB_]:=Sqrt[DeltaA[data,t]^2+deltaB^2];mean=Mean[x];
uncertainty=Uncertainty[x,tValue,deltaB];
Print["Mean: ",mean];
Print["Standard Deviation: ",StandardDeviation[x]];
Print["Mean Standard Deviation: ",MeanStandardDeviation[x]];
Print["deltaA: ",DeltaA[x,tValue]];
Print["deltaB: ",deltaB];
Print["Uncertainty: ",uncertainty];
Return[Around[mean,uncertainty]]];

ShowFitPlot[dataX_List,dataY_List,xName_,yName_,plotName_]:=Module[{data,fitModel},data=Transpose[{dataX,dataY}];
fitModel=LinearModelFit[data,x,x];
Print["Best Fit Equation: ",fitModel["BestFit"]];
Print[Show[ListPlot[data,PlotStyle->Red,PlotLabel->plotName,AxesLabel->{xName,yName}],Plot[fitModel[x],{x,Min[dataX],Max[dataX]}]]];
Return[fitModel["BestFitParameters"]]];
ShowFitPlot[dataX_List,dataY_List,xName_,yName_]:=ShowFitPlot[dataX,dataY,xName,yName,""];
ShowFitPlot[dataX_List,dataY_List]:=ShowFitPlot[dataX,dataY,"","",""];

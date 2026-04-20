# ShanghaiTech PHYS1111 Lab Experiment - Mathematica Program
# 用于 PHYS1111 普通物理 实验数据处理的 Mathematica 程序

_Final Grade: A-_

# 各项内容

分别对应了普通物理 I 实验的各项数据处理内容。可直接对实验数据进行修改，运行即可获得处理好的数据。**不保证 $\Delta A$ 与 $\Delta B$ 的正确性。**

# 数据统计

如下的程序（位于 `数据统计.wls`）可方便对数据进行统计分析与绘图。

```mathematica
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
```

## 使用方法

将上面的程序代码粘贴进 Mathematica 中，即定义好了：
- `DataStatistic` 数据统计函数
- `ShowFitPlot` 线性拟合绘图函数

两个函数为一体机，传参方便、输出直观。

## `DataStatistic`

参数为一个列表，代表要统计的数据。你需要根据各项实验所对应仪器的 $\Delta B$ 来更改代码中的 `deltaB` 项。  
输出平均值，标准差，平均标准差，$\Delta A$，$\Delta B$，不确定度 $U$；返回最终的平均值与不确定度。

### 使用例

```mathematica
DataStatistic[{1, 2, 3, 4, 5}]
```

<img src="https://github.com/user-attachments/assets/b0d3a6d6-59dc-4e2b-9077-9e1c1bc1f4ff" />

## `ShowFitPlot`

参数为两个列表与对应的轴名称，图名称，其中轴名称与图名称可选。  
输出最佳拟合线性函数与图片；返回两个参数的列表，分别对应截距与斜率。

### 使用例

```mathematica
ShowFitPlot[{1.0, 3.1, 5.1, 6.9, 9.0}, Table[i, {i, 1, 5}], "Anon Value (a)", "Soyo Value (s)", "Anon-Soyo Fit Plot" ]
```

<img src="https://github.com/user-attachments/assets/eb12003c-8cbf-4275-b218-0bd8eee0f043" />

# Note

参考了 Github 项目 [Rankyer/ShanghaiTech-PHYS1111](https://github.com/Rankyer/ShanghaiTech-PHYS1111)，在此表示诚挚感谢。

实验记录表，实验讲义等资源见 [Sharp-shi/ShanghaiTech-PHYS1111-wqy](https://github.com/Sharp-shi/ShanghaiTech-PHYS1111-wqy)。

还有不了解 Mathematica 的人？欢迎点击我的教程 [Mathematica中的高等数学和线性代数](https://github.com/Jerry-1031/Linear-Algebra-in-Mathematica)！

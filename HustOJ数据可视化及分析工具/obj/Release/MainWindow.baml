   M S B A M L   `   `   `  ���� H  DMahApps.Metro, Version=1.6.5.1, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  | xSystem.Windows.Controls.DataVisualization.Toolkit, Version=3.5.40128.1, Culture=neutral, PublicKeyToken=31bf3856ad364e35�{clr-namespace:System.Windows.Controls.DataVisualization.Charting;assembly=System.Windows.Controls.DataVisualization.Toolkit2System.Windows.Controls.DataVisualization.Charting �rclr-namespace:System.Windows.Controls.DataVisualization;assembly=System.Windows.Controls.DataVisualization.Toolkit)System.Windows.Controls.DataVisualization ��clr-namespace:System.Windows.Controls.DataVisualization.Charting.Primitives;assembly=System.Windows.Controls.DataVisualization.Toolkit=System.Windows.Controls.DataVisualization.Charting.Primitives ( $HustOJ数据可视化及分析工具5   /HustOJ数据可视化及分析工具.MainWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     Y UMahApps.Metro.IconPacks.Modern, Version=2.3.0.4, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks  �chartingToolkit{clr-namespace:System.Windows.Controls.DataVisualization.Charting;assembly=System.Windows.Controls.DataVisualization.Toolkit  �visualizationToolkitrclr-namespace:System.Windows.Controls.DataVisualization;assembly=System.Windows.Controls.DataVisualization.Toolkit  �
Primitives�clr-namespace:System.Windows.Controls.DataVisualization.Charting.Primitives;assembly=System.Windows.Controls.DataVisualization.Toolkit  :d2http://schemas.microsoft.com/expression/blend/2008  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006    � Title$$  HustOJ数据可视化与分析��$	��750��$
��1250�� � Icon$ Assets/Icon/Icon.ico��$
��1000��$	��650�� � WindowStartupLocation$ CenterScreen=� � 	Resources  #  ChartStyleMetroNoTitleAndLegend �� 
TargetType>  8System.Windows.Controls.DataVisualization.Charting.Chart �� Property �� ValueL  FSystem.Windows.Controls.DataVisualization.ResourceDictionaryCollection  Key �� Color5  /System.Windows.Controls.DataVisualization.Title6  0System.Windows.Controls.DataVisualization.Legend �� 
TargetType	 �� Padding
 � RowDefinitions � ColumnDefinitionsM  GSystem.Windows.Controls.DataVisualization.Charting.Primitives.EdgePanel  Name   ChartAreaStyle   PlotAreaStyle K� ZIndex  ChartStyleMetroNoTitle �� Orientation ��Name  Name   LegendStyle   LegendTitle   Title  
PieACStyleB  <System.Windows.Controls.DataVisualization.Charting.PieSeries ��Name  PieACDataPointStyleE  ?System.Windows.Controls.DataVisualization.Charting.PieDataPoint �Name J� Opacity F�Name   Geometry �� StrokeMiterLimit � ToolTipB  <System.Windows.Controls.DataVisualization.Charting.DataPoint    FormattedIndependentValue   FormattedDependentValue   FormattedRatio    GeometrySelection! J� IsHitTestVisible"   GeometryHighlight  PieACPalette  LineStudentSubmitByDayStyleC	  =System.Windows.Controls.DataVisualization.Charting.LineSeries# 	  Points$ � Points% 	  PolylineStyle ( $LineStudentSubmitByDayDataPointStyleF
  @System.Windows.Controls.DataVisualization.Charting.LineDataPoint& J� RenderTransformOrigin' A�Name ) %LineStudentSubmitByDayXAxisLabelStyleJ  DSystem.Windows.Controls.DataVisualization.Charting.DateTimeAxisLabelB  <System.Windows.Controls.DataVisualization.Charting.AxisLabel(   FormattedContent 2	 .ScatterStudentTotalSubmitByDayLnDataPointStyleI  CSystem.Windows.Controls.DataVisualization.Charting.ScatterDataPoint) �� Stretch* �� StrokeLineJoin )
 %LineStudentTotalSubmitByDayLnFitStyle 2 .LineStudentTotalSubmitByDayLnFitDataPointStyle ' #ColumnStudentTotalSubmitByTimeStyleE  ?System.Windows.Controls.DataVisualization.Charting.ColumnSeries 0 ,ColumnStudentTotalSubmitByTimeDataPointStyleH  BSystem.Windows.Controls.DataVisualization.Charting.ColumnDataPoint+ ��Name, ��Name 1 -ColumnStudentTotalSubmitByTimeXAxisLabelStyle- �� TextAlignment  LineProblemSubmitByDayStyle ( $LineProblemSubmitByDayDataPointStyle ) %LineProblemSubmitByDayXAxisLabelStyle + 'ScatterProblemParticipantDataPointStyle " LineProblemParticipantFitStyle + 'LineProblemParticipantFitDataPointStyle ( $ScatterProblemCluster1DataPointStyle ( $ScatterProblemCluster2DataPointStyle ( $ScatterProblemCluster3DataPointStyle ( $ScatterProblemCluster4DataPointStyle ! LineNewProblemCountByDayStyle * &LineNewProblemCountByDayDataPointStyle + 'LineNewProblemCountByDayXAxisLabelStyle   ColumnSubmitCountByTimeStyle ) %ColumnSubmitCountByTimeDataPointStyle * &ColumnSubmitCountByTimeXAxisLabelStyle��%WG  &	        &	 (	    &	 @    &	 �    &	 �    &	     &	 �    &	     &		 I     &	
 �#    &	 e$    &	 �%    &	 <&    &	 �'    &	 l(    &	 M)    &	 �+    &	 �-    &	 �0    &	 �1    &	 3    &	 �5    &	 �8    &	 �;    &	 a>    &	 B?    &	 |A    &	 �C    &	 �C    &	 �E    �� "  .���  � ��$ 0q���  � �� .  ��  � ��$ 10q���  �@J�SnapsToDevicePixels . ��  �@ Palette   �� �� DataPointStyle " ��.���  � �� �	#FFB9D6F7�� 
Background $ 	#FFB9D6F7���� �� DataPointStyle " ��.���  � �� �	#FFFBB7B5�� 
Background $ 	#FFFBB7B5���� �� DataPointStyle " ��.���  � �� �	#FFB8C0AC�� 
Background $ 	#FFB8C0AC���� �� DataPointStyle " ��.���  � �� �	#FFFDE79C�� 
Background $ 	#FFFDE79C���� �� DataPointStyle " ��.���  � �� �	#FFA9A3BD�� 
Background $ 	#FFA9A3BD���� �� DataPointStyle " ��.���  � �� �	#FFB1A1B1�� 
Background $ 	#FFB1A1B1���� �� DataPointStyle " ��.���  � �� �	#FF9DC2B3�� 
Background $ 	#FF9DC2B3���� �� DataPointStyle " ��.���  � �� �	#FFB5B5B5�� 
Background $ 	#FFB5B5B5���� �� DataPointStyle " ��.���  � �� �	#FF98C1DC�� 
Background $ 	#FF98C1DC���� �� DataPointStyle " ��.���  � �� �	#FFC1C0AE�� 
Background $ 	#FFC1C0AE���� �� DataPointStyle " ��.���  � �� �	#FFADBDC0�� 
Background $ 	#FFADBDC0���� �� DataPointStyle " ��.���  � �� �	#FF2F8CE2�� 
Background $ 	#FF2F8CE2���� �� DataPointStyle " ��.���  � ��
 ������� 
Background $ 	Gainsboro���� �� DataPointStyle " ��.���  � �� �	#FFF4F4F4�� 
Background $ 	#FFF4F4F4���� �� DataPointStyle " ��.���  � �� �	#FFA3A3A3�� 
Background $ 	#FFA3A3A3����  �@ 
TitleStyle �� "  .���  � y�$ 	Collapsed=���  � ��$ 16(���  � ��$ Center=���  � ��$
 0,10q���  �@ LegendStyle �� "  .���  � y�$ 	Collapsed=���  � ��$
 15,0q���  � ��$ Center=���  �@ ChartAreaStyle �� " K�.���  � ��$	 100����  � ��$ 75����  �@ PlotAreaStyle �� " �.���  � ��
 ���� ��  � �� �� "  .R��� #��z��#��z��#��z��#	 z��._�� $��1,0,-1,0q�
 �� $
��Auto ��� $��* �.+�� $��0,15,0,0q�$��1�� �� $��* ��� $
��Auto �.+�  $ 	ChartArea��#��z .+�� #��z $ -1���� "  .���  � ��
 �   ���  � ��$ 1q���  � �� .  ��  � ��$ 10q���  �@J�SnapsToDevicePixels . ��  �@ Palette   �� �� DataPointStyle " ��.���  � �� �	#FFB9D6F7�� 
Background $ 	#FFB9D6F7���� �� DataPointStyle " ��.���  � �� �	#FFFBB7B5�� 
Background $ 	#FFFBB7B5���� �� DataPointStyle " ��.���  � �� �	#FFB8C0AC�� 
Background $ 	#FFB8C0AC���� �� DataPointStyle " ��.���  � �� �	#FFFDE79C�� 
Background $ 	#FFFDE79C���� �� DataPointStyle " ��.���  � �� �	#FFA9A3BD�� 
Background $ 	#FFA9A3BD���� �� DataPointStyle " ��.���  � �� �	#FFB1A1B1�� 
Background $ 	#FFB1A1B1���� �� DataPointStyle " ��.���  � �� �	#FF9DC2B3�� 
Background $ 	#FF9DC2B3���� �� DataPointStyle " ��.���  � �� �	#FFB5B5B5�� 
Background $ 	#FFB5B5B5���� �� DataPointStyle " ��.���  � �� �	#FF98C1DC�� 
Background $ 	#FF98C1DC���� �� DataPointStyle " ��.���  � �� �	#FFC1C0AE�� 
Background $ 	#FFC1C0AE���� �� DataPointStyle " ��.���  � �� �	#FFADBDC0�� 
Background $ 	#FFADBDC0���� �� DataPointStyle " ��.���  � �� �	#FF2F8CE2�� 
Background $ 	#FF2F8CE2���� �� DataPointStyle " ��.���  � ��
 ������� 
Background $ 	Gainsboro���� �� DataPointStyle " ��.���  � �� �	#FFF4F4F4�� 
Background $ 	#FFF4F4F4���� �� DataPointStyle " ��.���  � �� �	#FFA3A3A3�� 
Background $ 	#FFA3A3A3����  �@ 
TitleStyle �� "  .���  � ��$ 16(���  � ��$ Center=���  � ��$
 0,10q���  �@ LegendStyle �� "  .���  � ��$
 15,0q���  � ��$ Center=���  � ��$
 12.5(���  � �� �� "  .R��� 
������ $��0q�
������ ._��� $��1��$ 
Horizontal=�.+��� $ Items��$��0,7.5q���  � �� �� .R��� $ 
Horizontal=���  �@ ChartAreaStyle �� " K�.���  � ��$	 100����  � ��$ 75����  �@ PlotAreaStyle �� " �.���  � ��
 ���� ��  � �� �� "  .R��� #��z��#��z��#	 z��._�� 
 �� $
��Auto ��� $��* �.+�� $��0,15,0,0q�$��1��
 �� $��* ��� $
��Auto �.+�  $ Legend��$��1��#��z # z $��0q�$��Center=�$��0q���Z� ��Z�   $ 	ChartArea��#��z $��0��.+�� #��z $ -1���� "  .���  � �� .  ��  � ��$ 0q���  � �� �� "  .R��� $ PlotArea����  �@ Palette   �� �� DataPointStyle " ��.���  � �� �	#FF4BAF4B�� 
Background $ 	#FF4BAF4B���� �� DataPointStyle " ��.���  � �� �	#FFF54B00�� 
Background $ 	#FFF54B00���� "  .���  � ��
 � �����  � ��
 �������  � ��$ 5q���  � �� .  ��  �@ RatioStringFormat$ {0:p2}����  � �� �� "  .R�� $
 Root��$ 1Q�.+�F� $ Slice��#��z #��z��#��z��$ 1Q� �� .+��� #��z �� $ 
Horizontal=�.+��� $��数量: ���� #��z �� $ 
Horizontal=�.+��� $��占比: ���� #��z F� $ SelectionHighlight��#��z  
������ ! .  $ 0Q�$ 1Q�F� $ MouseOverHighlight��#��z" 
������ ! .  $ 0Q�$ 1Q�  �� �� DataPointStyle "  .���  � �� �	#FF4BAF4B��  � ��
 �������  � ��$ 5q���  � �� .  ��  �@ RatioStringFormat$ {0:p2}����  � �� �� "  .R�� $
 Root��$ 1Q�.+�F� $ Slice��#��z #��z��#��z��$ 1Q� �� .+��� #��z �� $ 
Horizontal=�.+��� $��数量: ���� #��z �� $ 
Horizontal=�.+��� $��占比: ���� #��z F� $ SelectionHighlight��#��z  
������ ! .  $ 0Q�$ 1Q�F� $ MouseOverHighlight��#��z" 
������ ! .  $ 0Q�$ 1Q��� �� DataPointStyle "  .���  � �� �	#FFF54B00��  � ��
 �������  � ��$ 5q���  � �� .  ��  �@ RatioStringFormat$ {0:p2}����  � �� �� "  .R�� $
 Root��$ 1Q�.+�F� $ Slice��#��z #��z��#��z��$ 1Q� �� .+��� #��z �� $ 
Horizontal=�.+��� $��数量: ���� #��z �� $ 
Horizontal=�.+��� $��占比: ���� #��z F� $ SelectionHighlight��#��z  
������ ! .  $ 0Q�$ 1Q�F� $ MouseOverHighlight��#��z" 
������ ! .  $ 0Q�$ 1Q��� " 	 .���  � �� .  ��  �@	 PolylineStyle �� " �.���  � ��$ 2����  �@��StrokeMiterLimit$ 1Q���  � �� �� " 	 .R��� $ PlotArea��.+�� #$ z# #��z% ���	#FF0096F5�� " 
 .���  � �� �	#FF0096F5��  � ��
 ���� ��  � ��$ 0q���  � �� .  ��  � ��$ 10����  � ��$ 10���� $ �@ IndependentValueStringFormat$ {0:D}����  � �� �� " 
 .R�� $
 Root��$ 0Q� �� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��日期: ���� #��z �� $ 
Horizontal=�.+��� $��提交数: ���� #��z .+�A� #��z��#��z��A� $& 0.661,0.321&����	#FF00AFF5A� $' SelectionHighlight��
������ $ 0Q�A� $' MouseOverHighlight��
������ $ 0Q��� "  .���  � �� .  �� ! �@ YearsIntervalStringFormat$ {0:yyyy年}���� " �@ MonthsIntervalStringFormat$ {0:yyyy年MM月dd日}���� ! �@ WeeksIntervalStringFormat$ {0:yyyy年MM月dd日}����   �@ DaysIntervalStringFormat$ {0:yyyy年MM月dd日}���� ! �@ HoursIntervalStringFormat$ {0:t}���� # �@ MinutesIntervalStringFormat$ {0:t}���� # �@ SecondsIntervalStringFormat$ {0:T}���� ( �@  MillisecondsIntervalStringFormat$ {0:mm:ss.fff}����  � �� �� "  .R��� #��z( �� "  .���  � �� �	#FF4B007D��  � �� .  ��  � ��
 ���� ��  � ��$ 5����  � ��$ 5���� $ �@ IndependentValueStringFormat$ {0:F5}����  � �� �� "  .R�� $
 Root�� �� $ Vertical=�.+��� $ 
Horizontal=�.+��� $/��)至分析起始日日数之自然对数: ���� #��z �� $ 
Horizontal=�.+��� $/��)修正减去当日总题目数提交数: ���� #��z .+�F� 4����    ���р��    � �����р�� ���    ���#��z��$
) Fill=�#��z��$��0��$* Round=�F� $ MouseOverHighlight��4����    ���р��    � �����р�� ���    ���
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� F� $ SelectionHighlight��4����    ���р��    � �����р�� ���    ���
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� �� " 	 .���  � �� .  ��  �@	 PolylineStyle �� " �.���  � ��$ 2����  �@��StrokeMiterLimit$ 1Q���  � �� �� " 	 .R��� $ PlotArea��.+�� #$ z# #��z% ���	#FF00A596�� " 
 .���  � �� �	#FF00A596��  � ��
 ���� ��  � ��$ 0q���  � �� .  ��  � ��$ 10����  � ��$ 10����  � �� �� " 
 .R�� $
 Root��$ 0Q� �� $��拟合��.+�A� #��z��#��z��A� $& 0.661,0.321&����	#FF00A596A� $' SelectionHighlight��
������ $ 0Q�A� $' MouseOverHighlight��
������ $ 0Q��� "  .���  � �� .  ��  � �� �� "  .R��� $ PlotArea���� "  .���  � �� �	#FF007DC8��  � ��
 �   ���  � ��$ 0q���  � �� .  ��  � �� �� "  .R��� $
+ Root��#��z��#��z��$ 1Q� �� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��时段: ���� #��z �� $ 
Horizontal=�.+��� $��提交数: ���� #��z ._�� #��z��.+��� $, SelectionHighlight��
������ $ 0Q��� $, MouseOverHighlight��
������ $ 0Q��� "  .���  � �� .  ��  �@ StringFormat$	 {0}����  � �� �� "  .R��� #��z( $- Center=��� " 	 .���  � �� .  ��  �@	 PolylineStyle �� " �.���  � ��$ 2����  �@��StrokeMiterLimit$ 1Q���  � �� �� " 	 .R��� $ PlotArea��.+�� #$ z# #��z% ���	#FF007DC8�� " 
 .���  � �� �	#FF007DC8��  � ��
 ���� ��  � ��$ 0q���  � �� .  ��  � ��$ 10����  � ��$ 10���� $ �@ IndependentValueStringFormat$ {0:D}����  � �� �� " 
 .R�� $
 Root��$ 0Q� �� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��日期: ���� #��z �� $ 
Horizontal=�.+��� $��提交数: ���� #��z .+�A� #��z��#��z��A� $& 0.661,0.321&����	#FF00A596A� $' SelectionHighlight��
������ $ 0Q�A� $' MouseOverHighlight��
������ $ 0Q��� "  .���  � �� .  �� ! �@ YearsIntervalStringFormat$ {0:yyyy年}���� " �@ MonthsIntervalStringFormat$ {0:yyyy年MM月dd日}���� ! �@ WeeksIntervalStringFormat$ {0:yyyy年MM月dd日}����   �@ DaysIntervalStringFormat$ {0:yyyy年MM月dd日}���� ! �@ HoursIntervalStringFormat$ {0:t}���� # �@ MinutesIntervalStringFormat$ {0:t}���� # �@ SecondsIntervalStringFormat$ {0:T}���� ( �@  MillisecondsIntervalStringFormat$ {0:mm:ss.fff}����  � �� �� "  .R��� #��z( �� "  .���  � �� �	#FF4B007D��  � �� .  ��  � ��
 ���� ��  � ��$ 5����  � ��$ 5���� $ �@ IndependentValueStringFormat$ {0:F5}����  � �� �� "  .R�� $
 Root�� �� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��题目发布周次: ���� #��z �� $ 
Horizontal=�.+��� $��参与人数: ���� #��z .+�F� 4����    ���р��    � �����р�� ���    ���#��z��$
) Fill=�#��z��$��0��$* Round=�F� $ MouseOverHighlight��4����    ���р��    � �����р�� ���    ���
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� F� $ SelectionHighlight��4����    ���р��    � �����р�� ���    ���
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� �� " 	 .���  � �� .  ��  �@	 PolylineStyle �� " �.���  � ��$ 2����  �@��StrokeMiterLimit$ 1Q���  � �� �� " 	 .R��� $ PlotArea��.+�� #$ z# #��z% ���	#FF00A596�� " 
 .���  � �� �	#FF00A596��  � ��
 ���� ��  � ��$ 0q���  � �� .  ��  � ��$ 10����  � ��$ 10����  � �� �� " 
 .R�� $
 Root��$ 0Q� �� $��拟合��.+�A� #��z��#��z��A� $& 0.661,0.321&����	#FF00A596A� $' SelectionHighlight��
������ $ 0Q�A� $' MouseOverHighlight��
������ $ 0Q��� "  .���  � �� �	#FF00A5F0��  � �� .  ��  � ��
 ���� ��  � ��$	 7.5����  � ��$	 7.5���� $ �@ IndependentValueStringFormat$ {0:F5}���� " �@ DependentValueStringFormat$ {0:F5}����  � �� �� "  .R�� $
 Root�� �� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��付出指数(Jq): ���� #��z �� $ 
Horizontal=�.+��� $��参与指数(Eq): ���� #��z .+�A� #��z��#��z��#��z��$
) Fill=�#��z��$��0��$* Round=�A� $' MouseOverHighlight��#��z��#��z��
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� A� $' SelectionHighlight��#��z��#��z��
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� �� "  .���  � �� �	#FF82B900��  � �� .  ��  � ��
 ���� ��  � ��$	 7.5����  � ��$	 7.5���� $ �@ IndependentValueStringFormat$ {0:F5}���� " �@ DependentValueStringFormat$ {0:F5}����  � �� �� "  .R�� $
 Root�� �� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��付出指数(Jq): ���� #��z �� $ 
Horizontal=�.+��� $��参与指数(Eq): ���� #��z .+�A� #��z��#��z��#��z��$
) Fill=�#��z��$��0��$* Round=�A� $' MouseOverHighlight��#��z��#��z��
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� A� $' SelectionHighlight��#��z��#��z��
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� �� "  .���  � �� �	#FFFFB900��  � �� .  ��  � ��
 ���� ��  � ��$	 7.5����  � ��$	 7.5���� $ �@ IndependentValueStringFormat$ {0:F5}���� " �@ DependentValueStringFormat$ {0:F5}����  � �� �� "  .R�� $
 Root�� �� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��付出指数(Jq): ���� #��z �� $ 
Horizontal=�.+��� $��参与指数(Eq): ���� #��z .+�A� #��z��#��z��#��z��$
) Fill=�#��z��$��0��$* Round=�A� $' MouseOverHighlight��#��z��#��z��
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� A� $' SelectionHighlight��#��z��#��z��
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� �� "  .���  � �� �	#FFF55023��  � �� .  ��  � ��
 ���� ��  � ��$	 7.5����  � ��$	 7.5���� $ �@ IndependentValueStringFormat$ {0:F5}���� " �@ DependentValueStringFormat$ {0:F5}����  � �� �� "  .R�� $
 Root�� �� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��付出指数(Jq): ���� #��z �� $ 
Horizontal=�.+��� $��参与指数(Eq): ���� #��z .+�A� #��z��#��z��#��z��$
) Fill=�#��z��$��0��$* Round=�A� $' MouseOverHighlight��#��z��#��z��
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� A� $' SelectionHighlight��#��z��#��z��
������ $ 0Q�$
) Fill=�$��1��$* Round=���Z� �� " 	 .���  � �� .  ��  �@	 PolylineStyle �� " �.���  � ��$ 2����  �@��StrokeMiterLimit$ 1Q���  � �� �� " 	 .R��� $ PlotArea��.+�� #$ z# #��z% ���	#FF4B007D�� " 
 .���  � �� �	#FF4B007D��  � ��
 ���� ��  � ��$ 0q���  � �� .  ��  � ��$ 10����  � ��$ 10���� $ �@ IndependentValueStringFormat$ {0:D}����  � �� �� " 
 .R�� $
 Root��$ 0Q� �� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��日期: ���� #��z �� $ 
Horizontal=�.+��� $��题目发布数: ���� #��z .+�A� #��z��#��z��A� $& 0.661,0.321&����	#FF4B007DA� $' SelectionHighlight��
������ $ 0Q�A� $' MouseOverHighlight��
������ $ 0Q��� "  .���  � �� .  �� ! �@ YearsIntervalStringFormat$ {0:yyyy年}���� " �@ MonthsIntervalStringFormat$ {0:yyyy年MM月dd日}���� ! �@ WeeksIntervalStringFormat$ {0:yyyy年MM月dd日}����   �@ DaysIntervalStringFormat$ {0:yyyy年MM月dd日}���� ! �@ HoursIntervalStringFormat$ {0:t}���� # �@ MinutesIntervalStringFormat$ {0:t}���� # �@ SecondsIntervalStringFormat$ {0:T}���� ( �@  MillisecondsIntervalStringFormat$ {0:mm:ss.fff}����  � �� �� "  .R��� #��z( �� "  .���  � �� .  ��  � �� �� "  .R��� $ PlotArea���� "  .���  � �� �	#FF00AFF5��  � ��
 �   ���  � ��$ 0q���  � �� .  ��  � �� �� "  .R��� $
+ Root��#��z��#��z��$ 1Q� �� $ Vertical=�.+��� $ 
Horizontal=�.+��� $��时段: ���� #��z �� $ 
Horizontal=�.+��� $��提交数: ���� #��z ._�� #��z��.+��� $, SelectionHighlight��
������ $ 0Q��� $, MouseOverHighlight��
������ $ 0Q��� "  .���  � �� .  ��  �@ StringFormat$	 {0}����  � �� �� "  .R��� #��z( $- Center=�(   "MahApps.Metro.Controls.MetroWindow.   RightWindowCommands. +   %MahApps.Metro.Controls.WindowCommands  .@��� -   / ��Name$/ mnuExportCSV��$y�	Collapsed=�.���� $ 
Horizontal=�.+�,  &MahApps.Metro.IconPacks.PackIconModern  $��24��$��24��E AControlzEx, Version=3.0.2.4, Culture=neutral, PublicKeyToken=null�  �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconModernKind, MahApps.Metro.IconPacks.Modern, Version=2.3.0.4, Culture=neutral, PublicKeyToken=null]]0   Kind$0 Download=��� $��4 0 0 0q�$��Center=�$��导出原始数据���� -   $/ mnuExportAnalyzedData��1 �� 	Placement$1 Bottom=�.���� $ 
Horizontal=�.+�  $��24��$��24��$0 Download=��� $��4 0 0 0q�$��Center=�$��导出分析数据��2 � ContextMenu2 �� .@�m� -   $#��mnuExportAnalyzedDataStudents��$��导出学生数据��m� -   $#��mnuExportAnalyzedDataProblems��$��导出题目数据��m� -   $!��mnuExportAnalyzedDataSystem��$��导出系统数据���� m� -   $��mnuExportOriginalData��$��导出原始数据���� -   $/ 	mnuUpdate��.���� $ 
Horizontal=�.+�  $��24��$��24��$0 Refresh=��� $��4 0 0 0q�$��Center=�$��从云端更新元数据��.��]� ��. .+��� $ 
Horizontal=�$	��Top=�$��0,5,0,0q�.+��� -   3 ��Name$3 chkCustomAnalyzeStartDate��$!��自定义分析起始时间��4 d� 	IsChecked$4 FalseY�$��10,0,0,0q�(  "System.Windows.Controls.DatePicker  -	   5  Name$&5  dtpUserSpecifiedAnalyzeStartDate��{�.  $��5,0,0,0q�$	��125��6   IsTodayHighlighted6 .  �� -
   $3 chkCustomAnalyzeEndDate��$!��自定义分析结束时间��$4 FalseY�$��10,0,0,0q�  -   $$5 dtpUserSpecifiedAnalyzeEndDate��{�.  $��5,0,0,0q�$	��125��6 .  �� -   $/ 	btnUpdate��$��10,0,0,0q�$��Normal"�.���� $ 
Horizontal=�$��Center=�.+�  $��10��$��10��$0 Refresh=�$��Center=��� $��1,0,0,0q�$��Center=�$��更新数据��=   7MahApps.Metro.Controls.MetroAnimatedSingleRowTabControl  -   7  Name$7 tabMain��$��0,5,0,10q�$8 �� IsSynchronizedWithCurrentItem$
8 TrueY�.@�)   #MahApps.Metro.Controls.MetroTabItem  $��学生总览与分析��+   %MahApps.Metro.Controls.ControlsHelper9   HeaderFontSize$9 25Q�.��� -   $ gridStudentMain��: � UseLayoutRounding: .  
 �� $��* � �� $��1* �$	��150���� $
��Auto ��� $��5* �$	��800��.+�]� -   ; ]�Name$; dockStudentList��$��0��$��0����. .+��� $��学生学号列表��$��	10,5,10,0q�$	��Top=�#��� ���� -   < ��Name$< txtStudentSearch��$��	10,5,10,0q�$	��Top=�$��搜索学生学号��= �� 	UndoLimit$	= 106��#��� ���� -   > ��Name$> lstStudentList��$��
10,10,10,0q�$��1q�
���   �#��� ���� $��0��$��1��$��Stretch=�$��Center=�$	��2.5��$��0q�]� -   $; dockStudentAnalyze��$��0��$��2����. .+��� -   ? ��Name$? stackStudentData��$ Vertical=�$	��Top=�$��	10,5,10,0q�.+��  �� �� �� .+��� $ Vertical=�$��0��$��2��.+��� $ 
Horizontal=�.+��� $��学号��#��� ��$��0q�� -   $ btnStudentLink��$��5,0,0,0q�{�.  .+�  -   @  Name$@ icoStudentLink��$��10��$��10��$0 
Fullscreen=�$��Center=�$��0q�$' !在网页上查看学生信息。��#��� ���� -   A ��Name$A txtStudentID��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��2��.+��� $8��2聚类分析结果(点击下方以自定义映射)��#��� ��$��0q��� -   $A txtStudentClustResult��$�� ��$��20(�$��0,5,0,10q��  �� �� �� .+��� $ Vertical=�$��0��.+��� $��	提交数��#��� ��$��0q��� -   $A txtStudentSubmitCount��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��1��.+��� $��	通过数��#��� ��$��0q��� -   $A txtStudentACCount��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��2��.+��� $��	正确率��#��� ��$��0q��� -   $A txtStudentACRate��$�� ��$��20(�$��0,5,0,10q��  �� �� �� �� .+��� $ Vertical=�$��0��.+��� $!��工作日前半日提交数��#��� ��$��0q��� -   $&A  txtStudentSubmitCountOnWorkdayAM��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��1��.+��� $!��工作日后半日提交数��#��� ��$��0q��� -   $&A  txtStudentSubmitCountOnWorkdayPM��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��2��.+��� $!��休息日前半日提交数��#��� ��$��0q��� -   $&A  txtStudentSubmitCountOnRestdayAM��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��3��.+��� $!��休息日后半日提交数��#��� ��$��0q��� -   $&A  txtStudentSubmitCountOnRestdayPM��$�� ��$��20(�$��0,5,0,10q��  �� �� �� .+��� $ Vertical=�$��0��.+��� $��完成指数(Ac)��#��� ��$��0q��� -   $A txtFittingAC��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��1��.+��� $��稳定指数(Stb)��#��� ��$��0q��� -    $A txtFittingR_Stb��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��2��.+��� $��使用指数(Kb)��#��� ��$��0q��� -!   $A txtFittingK_Kb��$�� ��$��20(�$��0,5,0,10q�� .+�  -"   $7 tabStudentCharts��$��	2.5,0,0,0q�$
8 TrueY�.@�  $��	正确率��$9 15Q�.��� .+�  -#   B  Name$B chartStudentACRate��#���  $y�Hidden=�C   SeriesC   -$   D  Name$D pieStudentACRate��H  BSystem.Windows.Controls.DataVisualization.Charting.DataPointSeriesE   DependentValuePath$E Value��F   IndependentValuePath$	F Key��$��0q�G   Palette#G [   $��日提交曲线��$9 15Q�.��� .+�  -%   $B chartStudentSubmitByDay��#���   $y�Hidden=�H   AxesH E  ?System.Windows.Controls.DataVisualization.Charting.DateTimeAxis  =  7System.Windows.Controls.DataVisualization.Charting.AxisI   Orientation$I X=�D  >System.Windows.Controls.DataVisualization.Charting.DisplayAxisJ   Title$J  ��K   ShowGridLinesK .  L   IntervalType$L Months=�M   Interval�  �System.Windows.Controls.DataVisualization.Charting.NullableConverter`1[[System.Double, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]]$M 4 N   AxisLabelStyle#N �  C  =System.Windows.Controls.DataVisualization.Charting.LinearAxis  $I Y=�$J  ��K .  C 	  -&   O 	 Name$O linStudentSubmitByDay��$E Value��$	F Key��$��0q�#���  P   DataPointStyle#P �    $��对数日总提交曲线��$9 15Q�.��� .+�  -'   $$B chartStudentTotalSubmitByDayLn��#���   $y�Hidden=�H   $I X=�$J  ��K .    $I Y=�$J  ��K .  C F  @System.Windows.Controls.DataVisualization.Charting.ScatterSeries  -(   Q  Name$"Q sctStudentTotalSubmitByDayLn��$E Value��$	F Key��$��0q�#P � 	 	  -)   $%O linStudentTotalSubmitByDayLnFit��$E Value��$	F Key��$��0q�#��� 
 #P �    $��分时段总提交数��$9 15Q�.��� .+�  -*   $#B chartStudentTotalSubmitByTime��#���   $y�Hidden=�H E  ?System.Windows.Controls.DataVisualization.Charting.CategoryAxis  $I X=�K .  #N �    $I Y=�K .  C   -+   R  Name$!R colStudentTotalSubmitByTime��$E Value��$	F Key��$��0q�#���  #P �    $��题目总览与分析��$9 25Q�.��� -,   $ gridProblemMain��
 �� $��2* �$	��350���� $
��Auto ��� $��1* �$	��200�� �� $��1* �$	��150���� $
��Auto ��� $��5* �$	��800��.+�]� --   $; dockProblemList��$��0��$��0����. .+��� $��题目编号列表��$��	10,5,10,0q�$	��Top=�#��� ���� -.   $< txtProblemSearch��$��	10,5,10,0q�$	��Top=�$��搜索题目编号��$	= 106��#��� ���� -/   $> lstProblemList��$��
10,10,10,0q�$��1q�
���   �#��� ���� $��0��$��1��$��Stretch=�$��Center=�$	��2.5��$��0q�]� -0   $; gridProblemAnalyze��$��0��$��2����. .+��� -1   $? stackProblemData��$ Vertical=�$	��Top=�$��	10,5,10,0q�.+��  �� �� �� .+��� $ Vertical=�$��0��$��2��.+��� $ 
Horizontal=�.+��� $��题号��#��� ��$��0q�� -2   $ btnProblemLink��$��5,0,0,0q�{�.  .+�  -3   $@ icoProblemLink��$��10��$��10��$0 
Fullscreen=�$��Center=�$��0q�$' !在网页上查看题目信息。��#��� ���� -4   $A txtProblemID��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��2��.+��� $��发布日期��#��� ��$��0q��� -5   $A txtProblemCreateTime��$�� ��$��20(�$��0,5,0,10q��  �� �� �� �� .+��� $ Vertical=�$��0��.+��� $��参与人数��#��� ��$��0q��� -6   $ A txtProblemParticipantCount��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��1��.+��� $��	提交数��#��� ��$��0q��� -7   $A txtProblemSubmitCount��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��2��.+��� $��	通过数��#��� ��$��0q��� -8   $A txtProblemACCount��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��3��.+��� $��	正确率��#��� ��$��0q��� -9   $A txtProblemACRate��$�� ��$��20(�$��0,5,0,10q��  �� �� .+��� $ Vertical=�$��0��.+��� $��付出指数(Jq)��#��� ��$��0q��� -:   $A txtEffortValue_Jq��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��1��.+��� $��参与指数(Eq)��#��� ��$��0q��� -;   $A txtParticipateValue_Eq��$�� ��$��20(�$��0,5,0,10q�� .+�  -<   $7 tabProblemCharts��$��	2.5,0,0,0q�$
8 TrueY�.@�  $��	正确率��$9 15Q�.��� .+�  -=   $B chartProblemACRate��#���  $y�Hidden=�C   ->   $D pieProblemACRate��$E Value��$	F Key��$��0q�#G [   $��日提交曲线��$9 15Q�.��� .+�  -?   $B chartProblemSubmitByDay��#���   $y�Hidden=�H   $I X=�$J  ��K .  $L Months=�$M 4 #N �    $I Y=�$J  ��K .  C 	  -@   $O linProblemSubmitByDay��$E Value��$	F Key��$��0q�#���  #P �  �� $��1��$��0��$��3��$��Center=�$��Stretch=�$	��2.5��$��10q�  -A   $7 tabProblemOverviewCharts��$��2��$��0��$��3��$��	2.5,0,0,0q�$
8 TrueY�.@�  $��题目参与性��$9 15Q�.��� .+�  -B   $B chartProblemParticipant��#���   $y�Hidden=�H   $I X=�$J  ��K .    $I Y=�$J  ��K .  C   -C   $Q sctProblemParticipant��$E Value��$	F Key��$��0q�#P �  	  -D   $O linProblemParticipantFit��$E Value��$	F Key��$��0q�#���  #P �    $��题目聚类��$9 15Q�.��� .+�  -E   $B chartProblemCluster��#���   $y�Hidden=�H   $I X=�$J 付出指数(Jq)��K .    $I Y=�$J 参与指数(Eq)��K .  C   -F   $Q sctProblemCluster1��$	F Key��$E Value��#P �    -G   $Q sctProblemCluster2��$	F Key��$E Value��#P �    -H   $Q sctProblemCluster3��$	F Key��$E Value��#P �    -I   $Q sctProblemCluster4��$	F Key��$E Value��#P �    $��OnlineJudge系统总览��$9 25Q�.��]� ��. .+�� $	��Top=�$��	10,5,10,0q�
 �� ��  �� �� �� �� .+��� $ Vertical=�$��0��$��4��.+��� $ 
Horizontal=�.+��� $��OJ系统地址��#��� ��$��0q�� -J   $ btnSystemLink��$��5,0,0,0q�S � Cursor$
S Hand��.+�  -K   $@ icoSystemLink��$��10��$��10��$0 
Fullscreen=�$��Center=�$��0q�$ 访问OJ系统。���� -L   $A 	txtOJLink��$��http://oj.bmeonline.cn/��$��20(�$��0,5,0,10q��� $ Vertical=�$��1��$��0��.+��� $��日志开始时间��#��� ��$��0q��� -M   $A txtStartDate��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��1��$��1��.+��� $��日志结束时间��#��� ��$��0q��� -N   $A 
txtEndDate��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��1��$��2��.+��� $��分析起始时间��#��� ��$��0q��� -O   $&A  txtUserSpecifiedAnalyzeStartDate��$�� ��$��20(�$��0,5,0,10q��� $ Vertical=�$��1��$��3��.+��� $��分析结束时间��#��� ��$��0q��� -P   $$A txtUserSpecifiedAnalyzeEndDate��$�� ��$��20(�$��0,5,0,10q�� .+�  $
8 TrueY�.@�  $��题目发布曲线��$9 15Q�.��� .+�  -Q   $B chartNewProblemCountByDay��#���   $y�Hidden=�H   $I X=�$J  ��K .  $L Months=�$M 4 #N �    $I Y=�$J  ��K .  C 	  -R   $O linNewProblemCountByDay��$E Value��$	F Key��$��0q�#���  #P �    $��分时段总提交数��$9 15Q�.��� .+�  -S   $B chartSubmitCountByTime��#���   $y�Hidden=�H   $I X=�K .  #N �    $I Y=�K .  C   -T   $R colSubmitCountByTime��$E Value��$	F Key��$��0q�#���  #P �  
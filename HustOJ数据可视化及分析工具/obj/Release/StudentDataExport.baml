   M S B A M L   `   `   `  ���� H  DMahApps.Metro, Version=1.6.5.1, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  ( $HustOJ数据可视化及分析工具<   6HustOJ数据可视化及分析工具.StudentDataExport   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     Y UMahApps.Metro.IconPacks.Modern, Version=2.3.0.4, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks    � Title$$  配置学生数据导出选项��$	��370��$	��600�� � WindowStartupLocation$ CenterOwner=� � Icon$ Assets/Icon/Icon.ico��$	��500��$	��300��.��]� ��. .+��� $	��Top=� �� Orientation$ Vertical=�.+��� $��
10,10,10,0q��� $���请指定导出的学生分析数据的存储位置、存储方式与需要导出数据的学生。建议您选择一个空目录用于导出数据，否则原有的文件可能不经询问即被覆盖。���� �� $@�:您可以通过 SHIFT 与 CTRL 键来选择多项数据。���� $��存储位置: ��$��
10,10,10,0q�]� ��. .+��� -    ��Name$ 	btnBrowse��$��Right=�$��浏览��$��0,5,10,5q�$��50���� -    ��Name$ txtExportPath��$��10,5,5,5q� �� IsReadOnlyCaretVisible .  �� 
IsReadOnly . �� -    ��Name$ chkIsDataMerged��$$��合并数据到一个文件中��$
��10,0q��� $��Bottom=�$ 
Horizontal=�$��Right=�$��	0,0,10,10q�.+��� -   $ btnOK��{�. $��导出��$��50��$��0,0,5,0q��� -   $ 	btnCancel��	 �� IsCancel	 . $��取消��$��50��]� ��. .+�]� $	��Top=���. .+��� $��Right=�$ 
Horizontal=�.+�� -   
 �Name$
 btnSelectAll��.+��� $��全选�� � Cursor$
 Hand��$��0,10,5,0q�����  �� Color# � ��� -   $
 btnDeselectAll��.+��� $��	全不选��$
 Hand��$��0,10,5,0q����� # � ��� -   $
 btnInvertSelect��.+��� $��反选��$
 Hand��$��	0,10,10,0q����� # � ���� $#��需要导出数据的学生: ��$��
10,10,10,0q��� -	    ��Name$ lstDataToExport�� �� SelectionMode$ Multiple=�$��
10,5,10,10q�#��� ��$��1q�
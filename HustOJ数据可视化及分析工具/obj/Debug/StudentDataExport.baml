   M S B A M L   `   `   `  ����H  DMahApps.Metro, Version=1.6.5.1, Culture=neutral, PublicKeyToken=nullV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5      ( $HustOJ数据可视化及分析工具<   6HustOJ数据可视化及分析工具.StudentDataExport   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5      Y UMahApps.Metro.IconPacks.Modern, Version=2.3.0.4, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks  5        � Title$$  配置学生数据导出选项��5      $	��370��6   $	��600��6%    � WindowStartupLocation$ CenterOwner=�61    � Icon$ Assets/Icon/Icon.ico��6U   $	��500��6q   $	��300��6�   .��5      ]� ��. .+�5   
   �� $	��Top=�6    �� Orientation$ Vertical=�6*   .+�5	      �� $��
10,10,10,0q�6   �� 5
      $���请指定导出的学生分析数据的存储位置、存储方式与需要导出数据的学生。建议您选择一个空目录用于导出数据，否则原有的文件可能不经询问即被覆盖。��6   �� 5      �� 5      $@�:您可以通过 SHIFT 与 CTRL 键来选择多项数据。��6   5      �� 5      $��存储位置: ��6   $��
10,10,10,0q�6&   ]� 5      ��. .+�5      �� -   5         ��Name$ 	btnBrowse��5      $��Right=�6,   $��浏览��6C   $��0,5,10,5q�6P   $��50��6b   �� 5      -   5         ��Name$ txtExportPath��5      $��10,5,5,5q�61    �� IsReadOnlyCaretVisible .  �� 
IsReadOnly . 6a   5      �� 5      -   5         ��Name$ chkIsDataMerged��5      $$��合并数据到一个文件中��60   $
��10,0q�6E   5      �� 5   
   $��Bottom=�6   $ 
Horizontal=�6-   $��Right=�6F   $��	0,0,10,10q�6b   .+�5      �� -   5        $ btnOK��5      {�. $��导出��65   $��50��6B   $��0,0,5,0q�6M   �� 5      -   5        $ 	btnCancel��5      	 �� IsCancel	 . $��取消��68   $��50��6E   5      ]� 5   
   ��. .+�5      ]� $	��Top=�6   ��. .+�5      �� $��Right=�6   $ 
Horizontal=�64   .+�5      � -   5        
 �Name$
 btnSelectAll��5      .+�5      �� $��全选��6$    � Cursor$
 Hand��6.   $��0,10,5,0q�6<   ��5      �� 5   "    �� Color# � ��62   5!      5"      � 5#      -   5        $
 btnDeselectAll��5#      .+�5$      �� $��	全不选��6$   $
 Hand��6/   $��0,10,5,0q�6=   ��5%      �� 5&   "   # � ��62   5(      5)      � 5*      -   5        $
 btnInvertSelect��5*      .+�5+      �� $��反选��6$   $
 Hand��6.   $��	0,10,10,0q�6<   ��5,      �� 5-   "   # � ��62   5/      50      51      �� 52      $#��需要导出数据的学生: ��6   $��
10,10,10,0q�6/   53      �� 54      -	   5         ��Name$ lstDataToExport��54       �� SelectionMode$ Multiple=�6/   $��
10,5,10,10q�6H   #��� ��6\   $��1q�6�   55      56      57      
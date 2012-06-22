echo building schema...
mysql -p$1 ECH_DW < ../../workbench/import.sql
echo done!

echo loading tiempo...
mysql -p$1 ECH_DW < tiempo.sql
echo done!

echo loading tipos_vivienda...
mysql -p$1 ECH_DW < tipos_vivienda.sql
echo donw!

echo loading niveles_confort...
mysql -p$1 ECH_DW < niveles_confort.sql
echo donw!

echo loading geografia_2009...
mysql -p$1 ECH_DW < geografia_2009.sql
echo done!

echo loading geografia_2010...
mysql -p$1 ECH_DW < geografia_2010.sql
echo done!

echo loading geografia_2011...
mysql -p$1 ECH_DW < geografia_2011.sql
echo done!

echo loading info_hogares_2009...
mysql -p$1 ECH_DW < info_hogares_2009.sql
echo done!

echo loading info_hogares_2010...
mysql -p$1 ECH_DW < info_hogares_2010.sql
echo done!

echo loading info_hogares_2011...
mysql -p$1 ECH_DW < info_hogares_2011.sql
echo done!


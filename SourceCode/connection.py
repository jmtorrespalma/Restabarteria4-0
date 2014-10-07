#!/bin/python3

import cx_Oracle

connection = cx_Oracle.connect('x5434510/x5434510@oracle0.ugr.es:1521/practbd.oracle0.ugr.es') ### user/pass@<hostname:port>/remote service name
cursor = connection.cursor()

#cursor.execute('select * from dual')
#print ("Here")
#cursor.fetchall()
cursor.execute("insert into empleado values(0, 'mateo', 'Activo')")
count = cursor.fetchall()[0][0]
print (count)

cursor.close()
connection.close() 

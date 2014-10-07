#!/bin/python3

import cx_Oracle
from tkinter import *


connection = cx_Oracle.connect('x5434510/x5434510@oracle0.ugr.es:1521/practbd.oracle0.ugr.es') ### user/pass@<hostname:port>/remote service name
in_cursor = connection.cursor()

def alta_empleado(nombre, posicion):
	
	in_cursor.callproc('alta', (nombre, posicion))
	
	

def baja_empleado(idempleado):

	in_cursor.callproc('baja', (idempleado))
	

def modificar_empleado(idempleado, posicion):
	
	in_cursor.callproc('modificar', (idempleado, out_cursor))


### Destroy function
def callback():
	in_cursor.close()
	connection.close()
	root.destroy()

### Creamos frame principal

root = Tk()           	### Asigns a window to root
root.minsize(500,500)	### Sets window minimum size to 500x500
mainLabel = Label(root, text='Gerente', font=('Verdana', 30))	### Creates a label
mainLabel.place(x=150)	### Displays label
root.title('Restabartería 4.0')
root.protocol("WM_DELETE_WINDOW", callback)

### Create Alta labelframe

altaFrame = LabelFrame(root, text='Dar Alta')
altaFrame.place(x=75, y=50)

Label(altaFrame, text="Nombre nuevo empleado").grid(row=0)
Label(altaFrame, text="Posición nuevo empleado").grid(row=1)
    
nombreEntry = Entry(altaFrame)
posicionEntry = Entry(altaFrame)
    
nombreEntry.grid(row=0, column=1)
posicionEntry.grid(row=1, column=1)

altaButton = Button(altaFrame, text='Confirmar', command=lambda:alta_empleado(nombreEntry.get(),posicionEntry.get()))
altaButton.grid()

### Create Baja labelframe

bajaFrame = LabelFrame(root, text='Dar Baja')
bajaFrame.place(x=75, y=150)

Label(bajaFrame, text="IDEmpleado a dar de baja").grid(row=0)

idBEntry = Entry(bajaFrame)
    
idBEntry.grid(row=0, column=1)

bajaButton = Button(bajaFrame, text='Confirmar', command=lambda:baja_empleado(idBEntry.get()))
bajaButton.grid(sticky=S)

### Create Modificar labelframe

modFrame = LabelFrame(root, text='Modificar posicion')
modFrame.place(x=75, y=250)

Label(modFrame, text="IDEmpleado a modificar").grid(row=0)
Label(modFrame, text="Nueva posición").grid(row=1)

idMEntry = Entry(modFrame)
posicionMEntry = Entry(modFrame)
    
idMEntry.grid(row=0, column=1)
posicionMEntry.grid(row=1, column=1)

modButton = Button(modFrame, text='Confirmar', command=lambda:modificar_empleado(idMEntry.get(), posicionMEntry.get()))
modButton.grid(sticky=S)

root.mainloop()		### Start the events loop

#!/bin/python3

from tkinter import *

def alta_usuario(cadena):
	print(cadena)

### Creamos frame principal

root = Tk()           	### Asigns a window to root
root.minsize(500,500)	### Sets window minimum size to 500x500
mainLabel = Label(root, text='Gerente', font=('Verdana', 30))	### Creates a label
mainLabel.place(x=150)### Displays label
root.title('Restabartería 4.0')

### Create Alta labelframe

altaFrame = LabelFrame(root, text='Dar Alta')
altaFrame.place(x=75, y=50)

Label(altaFrame, text="Nombre nuevo empleado").grid(row=0)
Label(altaFrame, text="Posición nuevo empleado").grid(row=1)
    
nombreEntry = Entry(altaFrame)
posicionEntry = Entry(altaFrame)
    
nombreEntry.grid(row=0, column=1)
posicionEntry.grid(row=1, column=1)

altaButton = Button(altaFrame, text='Confirmar', command=lambda:alta_usuario(nombreEntry.get()))
altaButton.grid()

### Create Baja labelframe

bajaFrame = LabelFrame(root, text='Dar Baja')
bajaFrame.place(x=75, y=150)

Label(bajaFrame, text="IDEmpleado a dar de baja").grid(row=0)

idBEntry = Entry(bajaFrame)
    
idBEntry.grid(row=0, column=1)

bajaButton = Button(bajaFrame, text='Confirmar')
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

modButton = Button(modFrame, text='Confirmar')
modButton.grid(sticky=S)

root.mainloop()		### Start the events loop

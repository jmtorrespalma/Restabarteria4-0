#!/bin/python3

import tkinter as tk

class Application(tk.Frame):### Inherites from tkinter.Frame
	def __init__(self, master=None):
		tk.Frame.__init__(self, master)
		self.grid()
		self.createWidgets()

	def createWidgets(self):
		self.mainLabel = tk.Label(self, text='Gerente')
		self.mainLabel.grid()
		self.quitButton = tk.Button(self, text='Quit', command=self.quit)
		self.quitButton.grid()
		#self.thisButton = tk.Button(self, text='This', command=self.quit)
		#self.thisButton.grid(row=0, column=1)

app = Application()
app.master.title('Restabartería 4.0')
app.minsize(300, 300)
app.mainloop()

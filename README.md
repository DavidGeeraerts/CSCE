# Windows Command Shell Color Explorer
---
## Overview

Windows Command Shell Color Explorer (CSCE) explorers the 256 available color schemes within the Windows command shell.
Explore the BEST colors, GOOD colors, MARGINAL colors, SOLID colors, and ERROR colors (which are not visible).


![alt text][logo]

[logo]: https://raw.githubusercontent.com/DavidGeeraerts/CSCE/master/CSCE_Intro_Screenshot.png "Screenshot of Introduction"

---
### The Menu

1. Introduction
2. Manual Color (Also sets the default)
3. Best Colors
4. Good Colors
5. All Colors
6. Random Colors
7. View Statement
8. Settings
9. Exit


#### Menu Details

1. **Introduction**

Provides a breakdown for the color class either by using the default color class or by using custom color class provided by text files

	- Provides color breakdown
		- Usuable colors
		- Unusuable colors
		- Total combinations
		- Best colors
		- Good colors
		- Marginal Colors
		- Solid colors
		- Error colors
	- ColorName
	- Color Code


2. **Manual Color**
	- Allows changing the commandshell color manually which will also become the default color for the session.


3. **Best Colors**
	- iterate through all the BEST colors either as defined by default or custom.


4. **Good Colors**
	- iterate through all the Good colors either as defined by default or custom


5. **All Colors**
	- iterate through ALL the colors


6. **Random Colors**
	- Iterate through random colors; configurable with:
		- Screen timeout (how long to show the screen before getting the next random color)
		- Number of iterations (how many times to get a random color)
		- Process timeout (control the process timeout; see the random process in action)


7. **View Statement**
	- Historical statement that the developer of CSCE came across once upon a time that spoke deeply to the state of humanity.


8. **Settings**
	- Configure the following settings:
		- Screen Timeout
		- Iterations (for random)
		- Process timeout


9. **Exit**
	- Shows Main author information
	- Shows contributors
	-Shows license information

### Features
- Automatic parsing of color class
- Uses powershell for random 
- Configure custom statement in statement.txt file
- Configure custom BEST colors in BEST_COLORS.txt file
- Configure custom GOOD colors in GOOD_COLORS.txt file
- Configure custom MARGINAL colors in MARGINAL_COLORS.txt file
- Configure custom SOLID colors in SOLID_COLORS.txt file
- CSV file dump for color class



---
![alt text][statement]

[statement]: https://raw.githubusercontent.com/DavidGeeraerts/CSCE/master/CSCE_Default_Statement_Screenshot.png "Default statement"

---
### Code Of Conduct
* **Be a Good human**
	- Speak the truth (or at least don't lie).
	- Give the benefit of the doubt that 'we' are all moving forward.
	- Listen to the person as though you have something to learn from them.
	- Challenge ideas not the individual.
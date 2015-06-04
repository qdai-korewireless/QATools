
Overview: This program can be used to help Developer or QA to create batch upload file for testing.

General Steps:

	1. Launch Main.bat to start the program

	2. Env picking:

	* Default environment setting is saved in env\default.bat
	* If the default env is different from your testing one, type "n" to pick a diffrent env, and it will replace the default env.
	* Type "y" if the default env is correct.
	* You can add new environment by duplicate one of the txt files in env folder and modify the name and content. 
	* The new env you create will show up when you choose environment.

	3. Carrier picking:

	* A list of carriers will show up that you can choose by typing the number in front of each one.

	4. Task picking:

	* Pick a task by typing the name of a task. E.g. Activate.Sim.File.bat
	* You can use [TAB] to auto-complete the typing.

	5. Run task:
	
	* Once a task is picked, you can follow the instruction of a task to type in different parameters.
	* Once a task is completed, the output file is put at the same folder as Main.bat file.
	* If a output file name already exists, then running the same task again will override that output file with new content.

	6. Continue?:

	* If you like to run different task under same carrier, then type: "y", then menu go back to Task picking (4)
	* Or type "n" to go back to Carrier picking (3)
	* To change env, you need to close the program and launch Main.bat again.



Advanced:

	* New carrier can be added in the carriers folder. You also need to add the new carrier in Main.bat by changing a little code.
	* Each task run a sql script under carriers/%carrier%/scripts.
	* By default all carriers use the same bat file under carriers folder, 
	but you can override the bat file by copy the file (same name) to %carrier% folder, then change the content.
	At run time, the prgram will use the file under %carrier% folder instead of the one under carriers.
	* If a task is only used by a carrier, then you can put it under %carrier% folder with format: %carrier%.Task.Name.bat.
	E.g. att.New.Task.Name.bat
	



# sambaHaskell

<p>To create new users run: </p>

<pre>runghc defineSambaUser.hs</pre>

<p>So you will be presented with the following instruction: </p>

<pre>
################################################################
Instructions: 

Firstly, ensure your smb.conf have this section:
[homes]
   comment = Home Directories
   browseable = yes
   writable = yes
   read only = no
   valid users = %S

----------------------------------------------------------------
To use this program, just enter the names you want to add and the
whole process of adding a new user to the system and then to Samba
will be done for you. Also the passwords will be generated 
automatically

*Note: remember to restart Samba after changes
*Note: remember to add permision to a newSambaUser.bash 
################################################################
</pre>

<p>To discover a password, run: </p>

<pre>runghc discoverUserPassword.hs</pre>

<p>*Note: if you want to create automatically from a username text file,
YOu could do: </p>

 <pre>cat names.txt | runghc defineSambaUser.hs<pre>

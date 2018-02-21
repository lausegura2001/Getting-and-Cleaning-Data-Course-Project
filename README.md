# Getting and Cleaning Data-Course Project

This project is about extracting the data from several files in order to create a clean dataset.
Before starting we have to obtain the extract the folder from : getdata_projectfiles_UCIHAR_Dataset.zip

## Steps 

1. Read the subject_*.txt, X_*.txt and y_*.txt files from the Test and Train folder. Here * means either test or train.
   Save this data into separate variables: **sub_ts, x_ts, y_ts** for test and **sub_tr, x_tr, y_tr** for train. The sub_ has
   the number of subject and the x_ the number of activity and y_ a set of 561 variables.
   Read also the features.txt and activity_labels.txt and save it into **features** and **activities**. These ones have the names of the  varibles in y_ts and y_tr and the labels representing activities respectively.
   
2. Create a matrix with **sub_ts, x_ts, y_ts** where each variable is a column (use cbind). This matrix will be called **test**.
   Do the same with the **_tr** variables and call the matrix **train**.
   
3. Create a matrix by merging the test and train variables in a way that the observations from train matrix are placed below the test matrix. Call it **matrix_total**. (Use rbind)

4. By using grep, extract the **index** of the variable's names (in **feature**) that have 'mean()' and 'std()'. These ones are the variables with the mean and standard deviation. We store the names of these variables in **names_index**.

5. Create a new matrix with the first two columns of **total** and the columns with the index saved in the last step.
   Call this matrix **total_mean_std**. The first column's name is **subject** and the second's is **activity**. The rest of the 
   variables are the mean and standard deviation of different parameters.

6. Now, change the numbers (labels) in the column **activity**  by the name of each activity. We can extract the activities'names from **activities** and set these as new labels in the column **activity**.

7. In order to rename the rest of the variables of the matrix **total_mean_std**,modify the **names_index** to remove '-' and '()'.  Also write everything in lowercase letters. (Use colnames)

8. Finally, from **total_mean_std** create a second, independent tidy data set with the average of each variable for each activity and each subject. (Use recast). Call the final dataset **total_final**.

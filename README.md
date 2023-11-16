# test-helper files for CP3

1. If utilizing Professor Lewis's main file (movie_db.cpp), ensure that in the main function, the 'silent' parameter of **accept_commands(istream &is, bool silent, bool echo)** is set to **true**, and then proceed to compile.
    ```
    int main()
    {
      accept_commands(cin, <strong>true</strong>, false);
      return 0;
    }
    ```
2. Copy the bash file (cp3_tester.h) and the expect file (cp3_subroutine.exp) to the same directory as your executable (e.g., bin directory).
3. cd to the directory of your executable (e.g., bin directory).
4. Execute the following command: 
    **bash cp3_tester.sh ./&lt;executable&gt; &lt;testcase-number&gt;**
5. Refer to the 'EXPECTED OUTPUT DESCRIPTION' output and verify if your output contains the expected result.




**Please let us know if you have any questions or concerns about the test-cases.**

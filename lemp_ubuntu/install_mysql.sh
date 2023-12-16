#!/usr/bin/bash

apt install mysql-server -y

# mysql_secure_installation

# mysql -u root -p 

# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by '@Aila040506';

# UPDATE mysql.user SET authentication_string=PASSWORD('@Aila040506') WHERE USER='root';

# UPDATE mysql.user set authentication_string = PASSWORD('@Aila040506') where urser = 'root' and host = 'localhost';

# UPDATE mysql.user SET authentication_string=PASSWORD(@Aila040506), plugin=mysql_native_password WHERE User='root' AND Host='localhost';

# UPDATE mysql.user SET authentication_string=PASSWORD('@Aila040506') WHERE User='root';

UPDATE mysql.user SET authentication_string = PASSWORD('@Aila040506') WHERE User='root';

SET PASSWORD FOR 'root'@localhost = PASSWORD("@Aila040506");
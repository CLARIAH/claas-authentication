<!DOCTYPE html>
<html lang="nl">
<head>
  <title>OpenID Info</title>
</head>
<body>

<p>OpenID Scope:</p>
<pre>
 "<?php echo getenv('OIDC_SCOPE'); ?>"
</pre>

<p>Requested OpenID claims:</p>
<pre>
 <?php echo getenv('OIDC_CLAIMS'); ?>
</pre>
<p>Delivered OpenID claims:</p>

<?php

echo '<p>';
foreach ($_SERVER as $k => $v) {
  if (strpos($k,'OIDC_CLAIM') !== FALSE) {
    echo $k . ': ' . '<b>' . $v . '</b><br>';
  }
}
echo '</p>';

?>

</body>
</html>

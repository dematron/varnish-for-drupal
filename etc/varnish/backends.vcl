probe healthcheck {
  .request =
    "GET /status.php HTTP/1.1"
    "Host: dev.katereese.com"
    "Connection: close";
  .interval = 5s;
  .timeout = 15s;
  .window = 5;
  .threshold = 1;
  #.expected_response = 200;
}

backend default {
  .host = "dev.katereese.com";
  .port = "80";
  .connect_timeout = 600s;
  .first_byte_timeout = 600s;
  .between_bytes_timeout = 600s;
  .probe = healthcheck;
}

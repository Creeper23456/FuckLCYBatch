<?php
define('statusFile', 'hb42lwpl.txt');

if (isset($_REQUEST['status'])) {
    http_response_code(getStatus());
} elseif (isset($_REQUEST['enable'])) {
    echo setStatus(404);
} elseif (isset($_REQUEST['disable'])) {
    echo setStatus(200);
}

function getStatus()
{
    if (file_exists(statusFile)) {
        $code = (int) file_get_contents(statusFile);
        if ($code < 100 || $code >= 600) {
            $code = 500;
        }
    } else {
        $code = 200;
        setStatus($code);
    }
    return $code;
}

function setStatus($code)
{
    return file_put_contents(statusFile, strval($code));
}

<?php

if ($mode == 'update_vendor_order_status_permission') {
    $order_id = $_REQUEST['order_id'];
    $permission = $_REQUEST['permission'];

    fn_order_statuses_permissions_change_vendor_order_status_permission($order_id, $permission);
}
<?php

/**
 * Updates vendor_can_change_status param
 *
 * @param int    $order_id
 * @param string $permission
 * @return void
 */
function fn_order_statuses_permissions_change_vendor_order_status_permission($order_id, $permission)
{
    db_query("UPDATE ?:orders SET vendor_can_change_status = ?s WHERE order_id = ?i", $permission, $order_id);
}
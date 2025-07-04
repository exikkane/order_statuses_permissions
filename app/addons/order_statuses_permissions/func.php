<?php

use Tygh\Registry;

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

function fn_order_statuses_permissions_get_orders($params, &$fields)
{
    $fields[] = '?:orders.vendor_can_change_status';
}

function fn_order_statuses_permissions_change_order_status_post($order_id, $status_to)
{
    if ($status_to == Registry::get('addons.order_statuses_permissions.paid_order_status')) {
        db_query("UPDATE ?:orders SET paid_order = ?s WHERE order_id = ?i", 'Y', $order_id);
    }
}
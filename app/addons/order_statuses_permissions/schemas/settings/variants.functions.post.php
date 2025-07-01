<?php

defined('BOOTSTRAP') or die('Access denied');

function fn_settings_variants_addons_order_statuses_permissions_shipped_order_status()
{
    return fn_get_order_statuses_list();
}

function fn_settings_variants_addons_order_statuses_permissions_paid_order_status()
{
    return fn_get_order_statuses_list();
}

function fn_get_order_statuses_list()
{
    $order_statuses = fn_get_simple_statuses(STATUSES_ORDER);

    return array_merge(
        ['' => __('none')],
        $order_statuses
    );
}
{if !$runtime.company_id
    || $order_info.vendor_can_change_status == 'Y'
    || $addons.order_statuses_permissions.paid_order_status|default:"P" == $order_info.status
    || $order_info.paid_order == 'Y'}
    {$statuses = []}

    {include file="common/select_popup.tpl"
        type="orders"
        suffix="o"
        id=$order_info.order_id
        status=$order_info.status
        items_status=$order_status_descr
        update_controller="orders"
        notify=true
        notify_department=true
        notify_vendor=$notify_vendor
        status_target_id="content_downloads,order_status_block"
        extra="&return_url=`$extra_status`"
        statuses=$order_statuses
        popup_additional_class="dropleft"
        btn_meta="btn btn-info o-status-`$order_info.status` order-status"|lower
        text_wrap=true
    }

{else}
    {assign var=shipped_status value=$addons.order_statuses_permissions.shipped_order_status|default:"C"}
    {assign var=paid_status value=$addons.order_statuses_permissions.paid_order_status|default:"P"}

    {assign var="filtered_order_status_descr" value=[]}

    {foreach from=$order_status_descr key=key item=item}
        {if $key != $shipped_status and $key != $paid_status}
            {assign var="filtered_order_status_descr" value=$filtered_order_status_descr|@array_merge:[$key => $item]}
        {/if}
    {/foreach}

    {include file="common/select_popup.tpl"
        type="orders"
        suffix="o"
        id=$order_info.order_id
        status=$order_info.status
        items_status=$filtered_order_status_descr
        update_controller="orders"
        notify=true
        notify_department=true
        notify_vendor=$notify_vendor
        status_target_id="content_downloads,order_status_block"
        extra="&return_url=`$extra_status`"
        statuses=$order_statuses
        popup_additional_class="dropleft"
        btn_meta="btn btn-info o-status-`$order_info.status` order-status"|lower
        text_wrap=true
    }

{/if}
{if !$runtime.company_id}
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
    {if $order_info.vendor_can_change_status == 'N'
    && $addons.order_statuses_permissions.paid_order_status|default:"P" != $order_info.status
    }
        {assign var=status_code value=$order_info.status}
        <strong>{$order_status_descr.$status_code}</strong>

    {elseif $order_info.vendor_can_change_status == 'Y'
    || $addons.order_statuses_permissions.paid_order_status|default:"P" == $order_info.status}

        {assign var=shipped_status value=$addons.order_statuses_permissions.shipped_order_status|default:"C"}
        {assign var=current_status value=$order_info.status}

        {$statuses = [
        $shipped_status    => $order_status_descr.$shipped_status,
        $order_info.status => $order_status_descr.$current_status
        ]}

        {if $shipped_status == $order_info.status}
            <strong>{$order_status_descr.$shipped_status}</strong>
        {else}
            {include file="common/select_popup.tpl"
            type="orders"
            suffix="o"
            id=$order_info.order_id
            status=$order_info.status
            items_status=$statuses
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
    {else}
        {assign var=status_code value=$order_info.status}
        <strong>{$order_status_descr.$status_code}</strong>
    {/if}
{/if}
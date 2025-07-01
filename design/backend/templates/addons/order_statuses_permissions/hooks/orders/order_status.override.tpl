{$get_additional_statuses=true}
{$order_status_descr=$smarty.const.STATUSES_ORDER|fn_get_simple_statuses:$get_additional_statuses:true}
{$extra_status=$config.current_url|escape:"url"}
{if "MULTIVENDOR"|fn_allowed_for}
    {$notify_vendor=true}
{else}
    {$notify_vendor=false}
{/if}
{$order_statuses=$smarty.const.STATUSES_ORDER|fn_get_statuses:$statuses:$get_additional_statuses:true}

{include file="addons/order_statuses_permissions/components/order_status_info.tpl" order_info=$order_info}

{if !$runtime.company_id}
    <div class="control-group">
        <label class="control-label"
               for="elm_vendor_can_change_status">{__("vendor_can_change_status")}
            :</label>
        <div class="controls">
            <label class="checkbox">
                {literal}
                <input type="checkbox"
                       name="update_order[vendor_can_change_status]"
                       id="elm_vendor_can_change_status"
                       onclick="$.ceAjax('request', fn_url('update_order_perm.update_vendor_order_status_permission?order_id={/literal}{$order_info.order_id}{literal}&permission=' + (this.checked ? this.value : 'N')), {method: 'POST', cache: false});"
                       value="Y"
                        {/literal}
                        {if $order_info.vendor_can_change_status == 'Y'}checked="checked"{/if}
                />
            </label>
        </div>
    </div>
{/if}
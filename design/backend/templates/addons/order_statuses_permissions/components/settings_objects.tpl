<div class="control-group setting-wide">
    <label for="elm_shipped_order_status"
           class="control-label"
    >
        {__("shipped_status")}
    </label>
    <div class="controls">
        <select name="addon_data[options][{$object}]"
                id="elm_shipped_order_status"
        >
            <option value=""
                    {if !$addons.order_statuses_permissions.$setting_object}selected="selected"{/if}
            >{__("none")}</option>
            <optgroup label="{__("set_status_to")}">
                {foreach $order_statuses as $code => $status}
                    <option value="{$code}"
                            {if $addons.order_statuses_permissions.$setting_object == $code}selected="selected"{/if}
                    >{$status}</option>
                {/foreach}
            </optgroup>
        </select>
    </div>
</div>

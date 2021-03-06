{*-------------------------------------------------------+
| SYSTOPIA - Performance Boost for Activities            |
| Copyright (C) 2017 SYSTOPIA                            |
| Author: M. Wire (mjw@mjwconsult.co.uk)                 |
| http://www.systopia.de/                                |
+--------------------------------------------------------+
| This program is released as free software under the    |
| Affero GPL license. You can redistribute it and/or     |
| modify it under the terms of this license which you    |
| can read by viewing the included agpl.txt or online    |
| at www.gnu.org/licenses/agpl.html. Removal of this     |
| copyright header is strictly prohibited without        |
| written permission from the original author(s).        |
+-------------------------------------------------------*}

<div class="crm-submit-buttons">
  {include file="CRM/common/formButtons.tpl" location="top"}
</div>

{if $action eq 8} {* delete activity *}
  <table class="crm-info-panel">
    <h3><i class="crm-i fa-question-circle" aria-hidden="true"></i>
      {$activityHeader}
    </h3>
    <tr class="crm-activity-form-block-activity_type">
      <td class="label">Type</td>
      <td class="view-value">{$activity.typeName}</td>
    </tr>
    <tr class="crm-activity-form-block-activity_subject">
      <td class="label">Subject</td>
      <td class="view-value">{$activity.subject}</td>
    </tr>
    <tr class="crm-activity-form-block-activity_date_time">
      <td class="label">
        <i class="crm-i fa-calendar" aria-hidden="true"></i>
        Date
      </td>
      <td class="view-value">{$activity.dateTime|crmDate}</td>
    </tr>
    <tr class="crm-activity-form-block-activity_status">
      <td class="label">Status</td>
      <td class="view-value">{$activity.status}</td>
    </tr>
  </table>
{else}
  <table class="crm-info-panel">
    <h3>{$activityHeader}</h3>
    {if $activity.typeDescription}
      <div class="help">Description: {$activity.typeDescription}</div>
    {/if}
    <tr class="crm-activity-form-block-source_contact_id">
      <td class="label">
        <i class="crm-i fa-user" aria-hidden="true"></i>
        Added By
      </td>
      <td class="view-value">
        {counter start=1 assign=count}
        {foreach from=$activity.sourceContacts item=contact}
          {if $contact.id}
            {assign var=contactId value=$contact.id}
            {capture assign=contactViewURL}{crmURL p='civicrm/contact/view' q="reset=1&cid=$contactId"}{/capture}
            <a href="{$contactViewURL}" class="action-item crm-hover-button no-popup">{$contact.name}</a>{if $count lt $activitySourceContacts.count},{/if}
          {/if}
          {counter}
        {/foreach}
      </td>
    </tr>
    <tr class="crm-activity-form-block-assignee_contact_id">
      <td class="label">
        <i class="crm-i fa-user" aria-hidden="true"></i>
        Assigned To
      </td>
      <td class="view-value">
        {counter start=1 assign=count}
        {foreach from=$activity.assigneeContacts item=contact}
          {if $contact.id}
            {assign var=contactId value=$contact.id}
            {capture assign=contactViewURL}{crmURL p='civicrm/contact/view' q="reset=1&cid=$contactId"}{/capture}
            <a href="{$contactViewURL}" class="action-item crm-hover-button no-popup">{$contact.name}</a>{if $count lt $activity.assigneeContacts.count},{/if}
          {/if}
          {counter}
        {/foreach}
      </td>
    </tr>
    <tr class="crm-activity-form-block-target_contact_id">
      <td class="label">
        <i class="crm-i fa-users" aria-hidden="true"></i>
        With
      </td>
      <td class="view-value">
        {if $activity.targetContacts|@count lt $activity.targetContacts.count}
          {$activity.targetContacts.count} contacts
        {else}
          {counter start=1 assign=count}
          {foreach from=$activity.targetContacts item=contact}
            {if $contact.id}
              {assign var=contactId value=$contact.id}
              {capture assign=contactViewURL}{crmURL p='civicrm/contact/view' q="reset=1&cid=$contactId"}{/capture}
              <a href="{$contactViewURL}" class="action-item crm-hover-button no-popup">{$contact.name}</a>{if $count lt $activity.targetContacts.count},{/if}
            {/if}
            {counter}
          {/foreach}
        {/if}
      </td>
    </tr>
    <tr class="crm-activity-form-block-activity_date_time">
      <td class="label">
        <i class="crm-i fa-calendar" aria-hidden="true"></i>
        Date
      </td>
      <td class="view-value">{$activity.dateTime|crmDate}</td>
    </tr>
    <tr class="crm-activity-form-block-activity_status">
      <td class="label">Status</td>
      <td class="view-value">{$activity.status}</td>
    </tr>
    <tr class="crm-activity-form-block-activity_priority">
      <td class="label">Priority</td>
      <td class="view-value">{$activity.priority}</td>
    </tr>
    <tr class="crm-activity-form-block-activity_medium">
      <td class="label">Medium</td>
      <td class="view-value">{if $activity.medium}{$activity.medium}{else}{/if}</td>
    </tr>
    <tr class="crm-activity-form-block-activity_campaign">
      <td class="label">Campaign</td>
      <td class="view-value">
        {if $activity.campaignId}
          {assign var=campaignId value=$activity.campaignId}
          {capture assign=campaignViewURL}{crmURL p="civicrm/a/#/campaign/$campaignId/view" q="reset=1"}{/capture}
          <a href="{$campaignViewURL}" target="_blank" class="action-item crm-hover-button no-popup">{$activity.campaign}</a>
        {/if}
      </td>
    </tr>
    <tr class="crm-activity-form-block-activity_engagementlevel">
      <td class="label">Engagement Index</td>
      <td class="view-value">
        {if $activity.engagementLevelStars}
          {$activity.engagementLevelStars}
        {else}
          {$activity.engagementLevel}
        {/if}
      </td>
    </tr>
    <tr class="crm-activity-form-block-activity_subject">
      <td class="label">Subject</td>
      <td class="view-value">{$activity.subject}</td>
    </tr>
    <tr class="crm-activity-form-block-activity_details">
      <td class="label">
        <i class="crm-i fa-info" aria-hidden="true"></i>
        Details
      </td>
      <td class="view-value">{$activity.details}</td>
    </tr>
    {foreach from=$viewCustomData item=customGroup}
      <tr class="crm-activity-form-block-custom_data">
        <td colspan="2">
          {foreach from=$customGroup item=customFields}
            <div class="crm-accordion-wrapper collapsed">
              <div class="crm-accordion-header">{$customFields.title}</div>
              <div class="crm-accordion-body">
                <table class="crm-info-panel">

                  {foreach from=$customFields.fields item=fields}
                    <tr>
                      <td class="label">{$fields.field_title}</td>
                      <td class="view-value">{$fields.field_value}</td>
                    </tr>
                  {/foreach}
                </table>
              </div>
            </div>
          {/foreach}
        </td>
      </tr>
    {/foreach}
  </table>
{/if}

{if $actionLinks}
  <div class="actionlinks">
    {foreach from=$actionLinks item=links}
      <a href="/{$links.url}?{$links.qs}" class="action-item crm-hover-button no-popup">
        {if $links.icon}{$links.icon}{/if} {$links.name}
      </a>
    {/foreach}
  </div>
{/if}


{* FOOTER *}
<div class="crm-submit-buttons">
  {include file="CRM/common/formButtons.tpl" location="bottom"}
</div>

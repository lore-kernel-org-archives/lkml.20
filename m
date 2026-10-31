Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412010;
	b=Vtq8JyL5Hsru03FsQADVJymqNYGJO7+3ybk20UTvxYO1x4oBxHN+Mv7O/gC3/QlAhDnW
	 Vom1xIHC+o6Ddot5+jkLA32Ve4vvxHvJEJeuh3dAxMKFCwfqOgGZCslAOxWgGra2BwxTH
	 zBK1yXg5hXAeTsXtO6ykZD9g4LlRV0PcRDOru56JpOGFOw2h88wdsXdWo5tg6x70ewWdm
	 gh9+YmaScXSpMAQxgOHN0162cflJrpZonyhD0SCgJ8A24PJglMlwERPnfFpKV/xs584EL
	 Sj9yXgVIK6bUDDhRXCBAetYQXDIEEP9zC8qV4WWILfH6Y3UdbdeUaedg9ZXgpJRrwtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412010;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=zOEe8PLQN4K7qNjqD6ms1qaRAWIhWTuNuui9A9Hljo4=;
	b=zXwvW3X2wE2UqI1sNNgKblFskbDVogr9iCKoIjFW8B+67gDV2tGbbBYpnPFRMvV+Dk8+
	 br0yP8DKcVAX8XItl9NEQ3AWICGlNEPCYgL5ocfhnh/K9XcBndtIe6Vbn3D14evcbviIm
	 fDiJ8aqaphvIoaSM9hwn6E6lfwSrfFfBwC/JY4dloyLRr/Dzt2YLAgpdqA4jOcFgJA0nv
	 pqOaD9adoD2jOfOi8Aq5Wia7XkRkQOc/WvSo8i0dZrJG/YP1Xtlv8xEFcu83MjwnK5/w5
	 6jYKwhHCvHVwsukTzDkoep7BXvXUg8x9zlqX7omLaHknlu9IQIysbN9V+5W51OOOd3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=QDGDFZw4;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A0B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=QDGDFZw4
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zOEe8PLQN4K7qNjqD6ms1qaRAWIhWTuNuui9A9Hljo4=;
	b=QDGDFZw4kA5V0eB7p01VrcimtwRHFyKsvQ4we5c74i6mhN1V7Bv+tuXbloCM17DS+d8pvlMLu
	mved7FVib7+HB/X9o0UB5R4fhwQ3rW7OG4BxU0kO8mMaTcMaTV2lB7sLlQoWcu8tLQdjxtuY1gQ
	A58HX4f6dMFwmp/+q2DMtjo=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jGh4D2NkbzLlZ9;
	Sat, 31 Oct 2026 09:59:56 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7362140586;
	Sat, 31 Oct 2026 10:00:04 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 10:00:03 +0800
Message-ID: <bec33507-f683-4d52-990c-be520a99f6f1@huawei.com>
Date: Sat, 31 Oct 2026 10:00:03 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 RESEND 06/15] fs/resctrl: Unmount resctrl with the CDP
 state it was mounted with
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<gshan@redhat.com>, <catalin.marinas@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-7-ruanjinjie@huawei.com>
 <8f6fdcad-912d-49f6-babe-e428290f0cce@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <8f6fdcad-912d-49f6-babe-e428290f0cce@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/26 23:08, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 20/10/2026 14:42, Jinjie Ruan wrote:
>> From: Zeng Heng <zengheng4@huawei.com>
>>
>> resctrl disables CDP before the control and monitor groups are torn down
>> on unmount. The architecture translates between CLOSID and PARTID using
>> the CDP state, so the RMIDs freed by rmdir_all_sub() and
>> resctrl_fs_teardown() are parsed with the wrong mapping. On arm64 the
>> RMID limbo handler can still be running, and a CLOSID left in the limbo
>> list is re-interpreted with the CDP state of the next mount. Enabling
>> CDP doubles the CLOSID on arm64, which can push the stale value out of
>> range and take an MPAM error interrupt.
>>
>> Disable CDP after the groups have been torn down, so every CLOSID freed
>> on unmount is parsed with the CDP state it was allocated under. Return
>> the RMIDs still in limbo to the free list and stop the worker, so
>> nothing carries over to the next mount.
>>
>> Cc: Tony Luck <tony.luck@intel.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: Dave Martin <Dave.Martin@arm.com>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Babu Moger <babu.moger@amd.com>
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  fs/resctrl/rdtgroup.c | 46 +++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 44 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 5dcbb0a964e8..40821cf07649 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -3145,6 +3145,41 @@ static void resctrl_fs_teardown(void)
>>  	rdtgroup_destroy_root();
>>  }
>>  
>> +/*
>> + * The RMID limbo handler keeps running after unmount. Any CLOSID still in
>> + * limbo would be re-interpreted with the CDP state of the next mount. MPAM
>> + * doubles CLOSID when CDP is enabled, which can push the stale value out of
>> + * range. Force the limbo list back to the free list before the CLOSID state
>> + * is torn down.
> 
> If the limbo list is being emptied then the limbo handler is effectively not being run. This is a
> reduction of functionality of resctrl. We either need a way to keep it running or rebuild the list
> at mount. There was some discussion at
> https://lore.kernel.org/all/20260413085405.1166412-2-zengheng4@huawei.com/

Hi Ben,

Thank you for the reminder, will update the patch based on the
discussion and your new suggestion.

> 
> This is a fs/resctrl patch that doesn't directly relate with the subject of the series and so
> unlikely to get much attention from the resctrl maintainers. If you respin I'd suggest posting this
> separately. I note that Tony Luck has a patch in the same area, [1].

Thank you! I will notice Tony's patch and post next version separately.

> 
> [1] https://lore.kernel.org/lkml/20260928221509.68002-14-tony.luck@intel.com/
> 
> Thanks,
> 
> Ben
> 
>> + */
>> +static void rdt_flush_limbo(void)
>> +{
>> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>> +	struct rdt_l3_mon_domain *d;
>> +
>> +	if (!IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
>> +		return;
>> +
>> +	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
>> +		return;
>> +
>> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +		if (!has_busy_rmid(d))
>> +			continue;
>> +
>> +		/*
>> +		 * The limbo handler acquires rdtgroup_mutex. Release it
>> +		 * here to allow the handler to complete, then reacquire
>> +		 * to maintain lock ordering for __check_limbo().
>> +		 * This matches the pattern used in resctrl_offline_cpu().
>> +		 */
>> +		mutex_unlock(&rdtgroup_mutex);
>> +		cancel_delayed_work_sync(&d->cqm_limbo);
>> +		mutex_lock(&rdtgroup_mutex);
>> +		__check_limbo(d, true);
>> +	}
>> +}
>> +
>>  static void resctrl_unmount(void)
>>  {
>>  	struct rdt_resource *r;
>> @@ -3152,13 +3187,20 @@ static void resctrl_unmount(void)
>>  	cpus_read_lock();
>>  	mutex_lock(&rdtgroup_mutex);
>>  
>> -	rdt_disable_ctx();
>> -
>>  	/* Put everything back to default values. */
>>  	for_each_alloc_capable_rdt_resource(r)
>>  		resctrl_arch_reset_all_ctrls(r);
>>  
>>  	resctrl_fs_teardown();
>> +	rdt_flush_limbo();
>> +
>> +	/*
>> +	 * Clear the CDP state last. free_rmid() translates between CLOSID and
>> +	 * PARTID using the CDP state; clearing it first would make the
>> +	 * translation inconsistent for the RMIDs being torn down.
>> +	 */
>> +	rdt_disable_ctx();
>> +
>>  	if (resctrl_arch_alloc_capable())
>>  		resctrl_arch_disable_alloc();
>>  	if (resctrl_arch_mon_capable())
> 

-- 
Best regards,
Jinjie


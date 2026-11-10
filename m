Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302023;
	b=yUoUha4L2QSk0BKk3bPEfsN6s7gEbYnDC0bY+1TX0rRbbnghURMvvRB/CSpo3gqZUPms
	 oHTa7SnpDY25830cBryxTeor89MQpd5jPJxVfFTQvBnzXwsfjscYSCQgRWzguH+GyxwVm
	 etXV05WWoSFnpRv1fvkkFlO6Nkv+vdYXHlljb3AePLbhMGCtnBUcW4wwu7WdJcDhHxAhd
	 XwEqIRLZbcWbPNa6N7kNFHX0EOGY5vHiVFrXVOdbYi3O5Iur10zmFAZDRybs++LO7sxsH
	 Wy307Wn5uCB6n0JwUrxWOIOBZkiPscRPcbtb1bQ5M+ukeAoMPAeMQP6IN8crQcXFoVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302023;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=w2i+b4t/ywMf13bemNyv2W9qpPa3VJiaWY8jeoYV9pI=;
	b=GAYfByb4TOuN/dNGVnqozAIWuNC1G/QshEOjDnvdbpe1GdXWntfwvD5kat5Qom1ul8cD
	 Dn9C9dEUQO8l5CnQjHmaa0Iq5RJpU02xaebd1hIJX/M0eYzMI4BLagm7+869HqdhpaS0v
	 dFVXbI7cxcL+ey8vtVpxeDodCmFxu8is/RVFNNjxzThvKXl5Jk5RfcSH4luBbGztC7qYD
	 TW1ocNQtygs2YB+VEAVUlThxKJf4NTOaL4SzbSM2aO+bRJtGaNVnpBQJmLaC2JPwWmIJC
	 28hC+k8QEKiuatLAZ2sUjbYZgXu7SxSyNpstkUdh8DK6PPrTw/bbWAbgxjDnxUgPhnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ECIT0D+9;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5608E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5608E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ECIT0D+9
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=w2i+b4t/ywMf13bemNyv2W9qpPa3VJiaWY8jeoYV9pI=;
	b=ECIT0D+9ryma9ChBfInlZhgwjZqOwxdWHlK9BYSV1NgLEqcBeh97DEyMBWOfyIFRvUFdST5wJ
	qYPgyzKpwZb6DIKDYFFPwCpTrYjIHdluv8FNY01mM3Ou/A9aeTh+c07cYgb3t+l1ZFSaVAsSveb
	jNHLmJcTWyKSMoqtmYTKdwM=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jP1CG6VqGzcb1R;
	Tue, 10 Nov 2026 17:12:58 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A759340575;
	Tue, 10 Nov 2026 17:13:36 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 17:13:35 +0800
Message-ID: <205c466f-6ac9-4c72-9463-9926f0697dcb@huawei.com>
Date: Tue, 10 Nov 2026 17:13:35 +0800
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
Subject: Re: [PATCH v4 3/3] fs/resctrl: Unmount resctrl with the CDP state it
 was mounted with
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <jic23@kernel.org>, <ben.horgan@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261105070934.2258613-1-ruanjinjie@huawei.com>
 <20261105070934.2258613-4-ruanjinjie@huawei.com>
 <7163c46a-2abf-42d2-842a-8a43dafecaa3@intel.com>
 <dc148861-35cc-4029-835e-2e93c8b64f05@huawei.com>
 <04f252d5-0dbc-49e2-9e05-8fce4a166648@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <04f252d5-0dbc-49e2-9e05-8fce4a166648@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/10 6:21, Reinette Chatre 写道:
> Hi Jinjie,

Hi Reinette,

> 
> On 11/9/26 3:48 AM, Jinjie Ruan wrote:
>> 在 2026/11/7 6:52, Reinette Chatre 写道:
>>> On 11/4/26 11:09 PM, Jinjie Ruan wrote:
> 
> ...
> 
>>>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>>>> index ae9ddd380515..717c3888c2b5 100644
>>>> --- a/fs/resctrl/monitor.c
>>>> +++ b/fs/resctrl/monitor.c
>>>> @@ -70,6 +70,11 @@ static u32 *closid_num_dirty_rmid;
>>>>   */
>>>>  static unsigned int rmid_limbo_count;
>>>>  
>>>> +/*
>>>> + * @limbo_cdp - The CDP state under which the RMIDs in limbo were freed.
>>>> + */
>>>> +static bool limbo_cdp;
>>>
>>> The variable is described as "The CDP state ..." but its type is a boolean.
>>> What does "true" mean? Could this be renamed limbo_cdp_enabled?
>>>
>>> Looks like this is only set if CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is set,
>>> please mention that in the comments.
>>>
>>>> +
>>>>  /*
>>>>   * @rmid_entry - The entry in the limbo and free lists.
>>>>   */
>>>> @@ -852,6 +857,10 @@ void cqm_handle_limbo(struct work_struct *work)
>>>>  	 */
>>>>  	mutex_lock(&rdtgroup_mutex);
>>>>  
>>>> +	/* Don't read the RMIDs in limbo until a mount sets up the CDP state. */
>>>> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) && !resctrl_mounted)
>>>> +		goto out_unlock;
>>>> +
>>>
>>> Is this IS_ENABLED() check needed? There are several flows managing the limbo handler
>>> yet just cqm_handle_limbo() and resctrl_limbo_resume() use this IS_ENABLED() check to manage
>>> the lifecycle in a unique way that I am concerned will trip people up in the future when
>>> trying to untangle the limbo worker lifecycle.
>>>
>>> I understand that the IS_ENABLED() check is added to support MPAM specifically here but
>>> I think we should aim for as much as possible similar behavior across all architectures.
>>
>> Yes, it is for mpam.
>>
>>> To that end I do not see why limbo handler should not run on MPAM when resctrl fs is unmounted
>>> while on x86 it should. 
>>
>> Is it because the CDP implementation of x86 is different from MPAM, and
>> MPAM is implemented through simulation?
> 
> In x86 the CLOSID and RMID are independent so on x86 the RMID (index) does not change between
> CDP enabled and CDP disabled.
> 
>>> Having the limbo handler only depend on resctrl_mounted here will make the behavior consistent
>>> across architectures while also matching the overflow handler. Keeping these behaviors similar
>>> just makes the code easier to understand and reason about. Having resctrl filesystem provide
>>> consistent flows across all architectures ensures the same flows are always tested.
>>>
>>> Yes, x86 would lose the ability to drain RMIDs across an unmount, but nothing needs these
>>> RMIDs while resctrl is unmounted. This work ensures that the RMIDs are freed shortly
>>> after a mount when they will be needed.
>>
>> I believe this behavior is also universal for x86.
> 
> Right, without resctrl fs mounted there are no user requests for the monitoring data backed
> by any architecture.
> 
> ...
> 
>>>> +				release_limbo_rmids(d);
>>>> +		}
>>>> +	}
>>>> +	limbo_cdp = cdp;
>>>> +
>>>> +	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
>>>> +		return;
>>>
>>> Could this be moved to the top of the function? QOS_L3_OCCUP_EVENT_ID
>>> state cannot change between mounts and this is the event that determines
>>> whether limbo handler runs at all. Moving this check would also eliminate the 
>>> need for the "d->rmid_busy_llc" check above.
>>
>> But limbo_cdp must be updated for next time check.
> 
> limbo_cdp (or limbo_cdp_enabled as per earlier comment) is only valid if
> resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID) *and*

I got it, only QOS_L3_OCCUP_EVENT_ID enabled we can call
add_rmid_to_limbo(), and rmid_busy_llc will not be NULL.

free_rmid()
{
    ...
    if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
       add_rmid_to_limbo(entry);
    ...
}

domain_setup_l3_mon_state()
{
     ...
     if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
         d->rmid_busy_llc = bitmap_zalloc(idx_limit, GFP_KERNEL);
     ...
}


> IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID). Since QOS_L3_OCCUP_EVENT_ID
> state cannot change between mounts there is no need to ever update limbo_cdp
> if QOS_L3_OCCUP_EVENT_ID is disabled, no?

Yes, you are right!

> 
> Reinette

-- 
Best regards,
Jinjie


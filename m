Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793169891;
	b=ZYQ0i/97b/U0GeEARgVa3PwUX1oyx4e2+YsP5f09++yBiqnSdHViuXJfcMXtOnOnSUm4
	 B4EtgzhooaMriit40Ln9Yq5vWLCsn/UXaMwisLuLixefs8+gy6cFcLwtgdalJUD9GpNau
	 kBGKBJN5w9yDflu2Qd3b7Q4cIgRD2ruY6//D7KlD3+kz8aX/Asfi9dzIN84EOJxImjHlP
	 FMH2slFDJb7xsnvmO7fBc+EL7J/f0SuPExn/9oT5TBq7lCyKbHKtwA5I1lr9+6wpm8fZ7
	 K7eNa8+ERLu9S+w4k1DtUf4oTRpAEvddnZtdBUWeOECra8bWtyAOxK0b0C0veHHO/0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793169891;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=FdJVWZb09+OYyjhhyWeS5FTDbdjlwEUq9U5bPnudEVw=;
	b=XG+mROFi6RE7eERe1PMwoyNOncO2AIFcykUuGigxUfiAw38VUzumCu0FH5xAhajzlPrV
	 6BLJGj2QFlyBwez8mowQdx4zVzX+Qw4ELR0Ka2KMvJbqhRxA3Dbr5dSZ8ha3/v6KtgY3J
	 K6ocjAbl8w3bmUxNYZ8BLRwoKLbD4HGavAAmwqWpfCya4tdGNrnasbBG3VaKL+/IcL9dl
	 +BMXovrO1FxSD2ZhFS+sQROqEM3P1bYlPwqh23WoVKU5VOHHwEp7jYOQgyQPWrZyWixil
	 QehQPGfq7bsObFDTgyzVHHMA84YS/WgEyun94TX1Us5ddspYHyKOv0tk9gfXZQLOfWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=lEqyj1xi;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EC1606A31A;
	Wed, 28 Oct 2026 06:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0EC1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=lEqyj1xi
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FdJVWZb09+OYyjhhyWeS5FTDbdjlwEUq9U5bPnudEVw=;
	b=lEqyj1xiMPSQ8KbR+mzZMUPSNEsdYztHAKx4vEfQdUAtMVivw4nq1+UOWMMapudvpnv3gs9Yn
	6WxSjwCany65rbjCF5Pj4W+e0YXf0l54oGHXiw9UO5qbgqTR/fJzscDPNow6iiGsGFDmUFAV2Iw
	1GAyZnXSF9uAgFZZvd5rEgc=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jDyXM07bfz12Lc5;
	Wed, 28 Oct 2026 14:44:51 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D970E202E6;
	Wed, 28 Oct 2026 14:44:45 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 14:44:44 +0800
Message-ID: <93ab2444-5508-4a4b-b906-6f385f824314@huawei.com>
Date: Wed, 28 Oct 2026 14:44:44 +0800
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
Subject: Re: [RFC PATCH 2/7] fs/resctrl: Add the L2 monitor events
To: Ben Horgan <ben.horgan@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <james.morse@arm.com>,
	<reinette.chatre@intel.com>, <fenghuay@nvidia.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
 <20261022084821.4014873-3-ruanjinjie@huawei.com>
 <68fa8cba-cccc-4b4c-9421-5b631f539727@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <68fa8cba-cccc-4b4c-9421-5b631f539727@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/26 19:50, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 22/10/2026 09:48, Jinjie Ruan wrote:
>> Add the L2 cache occupancy (l2c_occupancy) and L2 bandwidth
>> (mbm_core_bytes) monitor events, and route RDT_RESOURCE_L2 through the
>> same per-domain read path as the L3.
>>
>> As ARM MPAM Specification said, MPAM resource monitors are associated
>> with a shared partitionable resource in an MSC, not with a particular
>> cache level: the level comes from firmware's description of the MSC.
>> L2 monitors were only missing a resctrl scope. The events are
>> exposed once an architecture reports the L2 resource
>> mon_capable; x86 never does.
>>
>> Update Documentation/arch/arm64/mpam.rst to mention L2.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  Documentation/arch/arm64/mpam.rst | 23 ++++++++++++++---------
>>  fs/resctrl/monitor.c              |  9 +++++++++
>>  include/linux/resctrl_types.h     | 13 ++++++++++++-
>>  3 files changed, 35 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
>> index 67fe515ed501..f0697dedde03 100644
>> --- a/Documentation/arch/arm64/mpam.rst
>> +++ b/Documentation/arch/arm64/mpam.rst
>> @@ -32,8 +32,9 @@ Because the user interface to MPAM is via resctrl, only MPAM features that are
>>  compatible with resctrl can be exposed to user-space.
>>  
>>  MSC are considered as a group based on the topology. MSC that correspond with
>> -the L3 cache are considered together, it is not possible to mix MSC between L2
>> -and L3 to 'cover' a resctrl schema.
>> +the L3 cache are considered together, as are MSC that correspond with the L2
>> +cache; it is not possible to mix MSC between L2 and L3 to 'cover' a resctrl
>> +schema.
>>  
>>  The supported features are:
>>  
>> @@ -61,9 +62,11 @@ The supported features are:
>>    When the MPAM driver finds multiple groups of MSC it can use for the 'MB'
>>    schema, it prefers the group closest to the L3 cache.
>>  
>> -* Cache Storage Usage (CSU) counters can expose the 'llc_occupancy' provided
>> -  there is at least one CSU monitor on each MSC that makes up the L3 group.
>> -  Exposing CSU counters from other caches or devices is not supported.
>> +* Cache Storage Usage (CSU) counters expose the occupancy of the cache they
>> +  monitor: 'llc_occupancy' for the L3 group and 'l2c_occupancy' for the L2
>> +  group, provided there is at least one CSU monitor on each MSC that makes up
>> +  the group. Exposing CSU counters from other caches or devices is not
>> +  supported.
>>  
>>  * Memory Bandwidth Usage (MBWU) on or after the L3 cache.  resctrl uses the
>>    L3 cache-id to identify where the memory bandwidth is measured. For this
>> @@ -82,10 +85,12 @@ The supported features are:
>>    have a corresponding L3 cache. 'mbm_local_bytes' is not exposed as MPAM
>>    cannot distinguish local traffic from global traffic.
>>  
>> -  All these restrictions based on L3 cache are due to resctrl, currently, only
>> -  supporting monitoring at the L3 scope. It is expected that going forward more
>> -  MBWU monitors can be exposed to the user after support for more monitoring
>> -  scopes is added to resctrl.
>> +  MBWU monitors on an L2 MSC expose the bandwidth the cache sees as the
>> +  'mbm_core_bytes' event on the L2 resource.
>> +
>> +  These restrictions are due to resctrl only supporting monitoring at the L2
>> +  and L3 cache scopes. MBWU monitors on caches at other levels, or on devices,
>> +  are not exposed.
>>  
>>  Reporting Bugs
>>  ==============
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index f9f4d4486c1b..ee296c27c6e8 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -543,6 +543,13 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>>  			return __mon_event_count_one_domain(rdtgrp, rr);
>>  		else
>>  			return __l3_mon_event_count_sum(rdtgrp, rr);
>> +	case RDT_RESOURCE_L2:
>> +		WARN_ON_ONCE(rr->evt->any_cpu);
>> +		if (WARN_ON_ONCE(!rr->hdr)) {
>> +			rr->err = -EINVAL;
>> +			return -EINVAL;
>> +		}
>> +		return __mon_event_count_one_domain(rdtgrp, rr);
>>  	case RDT_RESOURCE_PERF_PKG: {
>>  		u64 tval = 0;
>>  
>> @@ -1032,6 +1039,8 @@ struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
>>  	MON_EVENT(QOS_L3_OCCUP_EVENT_ID,		"llc_occupancy",	RDT_RESOURCE_L3,	false),
>>  	MON_EVENT(QOS_L3_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	RDT_RESOURCE_L3,	false),
>>  	MON_EVENT(QOS_L3_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	RDT_RESOURCE_L3,	false),
>> +	MON_EVENT(QOS_L2_OCCUP_EVENT_ID,		"l2c_occupancy",	RDT_RESOURCE_L2,	false),
>> +	MON_EVENT(QOS_L2_MBM_CORE_EVENT_ID,		"mbm_core_bytes",	RDT_RESOURCE_L2,	false),
>>  	MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		RDT_RESOURCE_PERF_PKG,	true),
>>  	MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		RDT_RESOURCE_PERF_PKG,	true),
>>  	MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	RDT_RESOURCE_PERF_PKG,	false),
>> diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
>> index a5f56faa18d2..f31b8f2ccb8b 100644
>> --- a/include/linux/resctrl_types.h
>> +++ b/include/linux/resctrl_types.h
>> @@ -37,7 +37,14 @@
>>  /* Number of memory transactions that an MBM event can be configured with */
>>  #define NUM_MBM_TRANSACTIONS		7
>>  
>> -/* Event IDs */
>> +/*
>> + * Monitor Event IDs, representative a variety of monitoring events:
>> + * QOS_L3_OCCUP_EVENT_ID:     L3 Cache Occupancy statistics event
>> + * QOS_L3_MBM_TOTAL_EVENT_ID: Global Memory Bandwidth statistics event
>> + * QOS_L3_MBM_LOCAL_EVENT_ID: L3 Cache Bandwidth statistics event
>> + * QOS_L2_OCCUP_EVENT_ID:     L2 Cache Occupancy statistics event
>> + * QOS_L2_MBM_CORE_EVENT_ID:  L2 Cache Bandwidth statistics event
>> + */
>>  enum resctrl_event_id {
>>  	/* Must match value of first event below */
>>  	QOS_FIRST_EVENT			= 0x01,
>> @@ -50,6 +57,10 @@ enum resctrl_event_id {
>>  	QOS_L3_MBM_TOTAL_EVENT_ID	= 0x02,
>>  	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
>>  
>> +	/* ARM MPAM L2 Events */
>> +	QOS_L2_OCCUP_EVENT_ID,
>> +	QOS_L2_MBM_CORE_EVENT_ID,
> 
> These are essentially, L2 versions of L3 events. Does it not make sense to generalize the existing
> events to apply in different scopes?

Hi Ben,

Generalizing the existing events to be compatible with both L2 and L3
would result in cleaner code and better extensibility.

I will have a try, thanks.

> 
> Thanks,
> 
> Ben
> 
>> +
>>  	/* Intel Telemetry Events */
>>  	PMT_EVENT_ENERGY,
>>  	PMT_EVENT_ACTIVITY,
> 

-- 
Best regards,
Jinjie


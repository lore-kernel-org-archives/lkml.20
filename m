Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922048;
	b=rvSD9w6ecRgrP+pPBMwMbJUj0xs5R9r7cpht/NL57Bm1qUgxBW8KiOVNotPbRfEUO3mE
	 W8mrtMq6eADZfoRW/h6+vjVySWyz3czCcu7H74SzFSstKEAT2DHYrb1fh4ZbpXLb3N6nI
	 rjx7ls8N+kKMIQf+mI/dqJBCp/W0kvabiGanDbBZOnbmn6FBxiKwIkTtTDogAJqNvW3S9
	 5FqQMoTGWsJvaUnDNuqb01onPgfVQRXBQ+G/FFAPt5a07TI3935js7L04u20kpNo4WBkT
	 1zhSmI126uXtwM+svWAHmSn1f0DtKUzqj4UiOcTJrf0nOMKqfCBzF9JswluhsLS/k8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922048;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gt1mTJTEY2NMKUZ1l6pQpHIepE774iTNz9OI1rt36h4=;
	b=qk29VA9OnTfADpr8KjQnP9PUGLaSOMgovpLINKeS3po6yTF9aLomwrtIxvesMEdyWxQl
	 xygKdneXjBSHxO0+OHPVdggw1j8r2X/l5qtAYHoueFQfAYm+z3/o2NH1G6peNgA7vzF/k
	 KyKiRHohum4xqyncNLUIYx9VZE0yLDoGSWRDYKsgQamGELPiXMaA41eaEV0IMRwdE5/BP
	 PwJB2mZjRRKGnzuNY7ELL/lxziwsTPbHc+ZVLeTpjWvC6xVt8Dtth+YLjXLN3pSxNw7Rn
	 QoFN3csyqL8KDTE0JKknA3ExkN9Ae4o8Eb/E4oOV6aZigbG5+WJkPeq2bW3gCk0GTkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eSZU9NL5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FD0606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FD0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eSZU9NL5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 528DD1476;
	Tue, 17 Nov 2026 05:27:24 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.17.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC0883F632;
	Tue, 17 Nov 2026 05:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794922047; bh=7nO1uAcvh413N3I9pDaQgA01zn6h0WpCTuD9ZsZDS3A=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=eSZU9NL5LRMtvMbKhEVutMTktIMoe5ifgfAO+t+r58IGrhW/XFYCi5k9xJU/ykzD3
	 jE3RM6323YfDY5TGKdGyfmmD6YyoDq0hAMuTScGRr3l2UcDAUDWPowePezCe3Ygkmj
	 75+74eTANy6m/Qpco9L57lmxdgEu+2RQJw3TCz/Q=
Message-ID: <9c53a95f-3557-4a6c-906a-3a8540ec7cc2@arm.com>
Date: Tue, 17 Nov 2026 13:27:23 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v2 1/2] arm_mpam: resctrl: Use the domain's counter ID
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, tony.luck@intel.com,
 Dave.Martin@arm.com, babu.moger@amd.com, will@kernel.org, jic23@kernel.org,
 gshan@redhat.com, bp@alien8.de, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261113083506.4129060-1-ruanjinjie@huawei.com>
 <20261113083506.4129060-2-ruanjinjie@huawei.com>
 <a7dc44ee-cf2c-4e2a-9953-4f8ffeffda60@arm.com>
 <f5cc83eb-7c67-4db0-add4-08e893640f92@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <f5cc83eb-7c67-4db0-add4-08e893640f92@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jinjie,

On 17/11/2026 11:48, Jinjie Ruan wrote:
> Hi Ben,
> 
> Thanks for the review.
> 
> 在 2026/11/17 19:27, Ben Horgan 写道:
>> Hi Jinjie,
>>
>> On 13/11/2026 08:35, tizi4590 wrote:
>>> From: Jinjie Ruan <ruanjinjie@huawei.com>
>>>
>>> resctrl assigns MBM counters per domain: mbm_L3_assignments takes a
>>> domain ID, a group can have a counter in one domain and none in
>>> another, and resctrl_arch_cntr_read() and resctrl_arch_reset_cntr()
>>> are given the counter to use.
>>>
>>> The driver ignores that counter and looks the monitor up in
>>> mbwu_idx_to_mon[], indexed by CLOSID and RMID.
>>> resctrl_arch_config_cntr() fills that array without looking at the
>>> domain, so each group has one monitor for the whole resource.
>>> Whichever assignment is written last selects the monitor the group
>>> reads in every domain.
>>
>> For me, this scenario where we read the wrong counter to be the most
>> serious bug in the MPAM driver I currently know about. Thanks for
>> addressing it.
> 
> It is a great honor to be able to participate in solving this issue.
> 
>>
>>>
>>> For example, with the counter ID each group uses for mbm_total_bytes
>>> on each domain and "_" for none:
>>>
>>>                                 domain 0         domain 1
>>>   mount, mkdir g1               default=0 g1=1   default=0 g1=1
>>>   unassign both on domain 1     default=0 g1=1   default=_ g1=_
>>>   assign g1 on domain 1         default=0 g1=1   default=_ g1=0
>>>
>>> g1 is assigned the lowest free counter on domain 1, counter 0. That
>>> assignment is the last one written for g1, so it selects the monitor
>>> g1 reads in every domain. On domain 0, g1 uses counter 1, but reads
>>> the monitor of counter 0:
>>>
>>>                       counter whose monitor is read on domain 0
>>>                       default      g1
>>>   expected            0            1
>>>   actual              0            0
>>>
>>> That is the default group's monitor.
>>>
>>> Translate the counter ID with assigned_counters[], which maps a counter
>>> ID to a monitor of the class and is valid in every domain, 
>>
>> Ok, sounds reasonable.
>>
>> and drop
>>> mbwu_idx_to_mon[] with the lookups in __read_mon() and __reset_mon().
> 
> Will drop this code description.
> 
>>
>> mbwu_idx_to_mon[] does become unused but if we want to ever support the
>> default mbm_assign_mode then it may become used. A little more on this
>> below but this can be considered separately from the bug fix.
>>
>>> With nothing left to record, resctrl_arch_config_cntr() only resets the
>>> monitors of a counter when it is assigned.
>>
>> Isn't this a separate optimization?
> 
> Not really, just a description of the current state after the fix
> (removing mbwu_idx_to_mon())

I was referring to changing the actual modification, changing the reset
in resctrl_arch_config_cntr(), to only happen in the assign case. Which
seems reasonable but not directly addressing the bug in question.

Aside: Using '()' after an indentifier is generally only used for
functions and function-like macros.

> 
>>
>>>
>>> Nothing consumes USE_PRE_ALLOCATED, the marker that triggered those
>>> lookups, once they are gone. resctrl only allocates a monitor context
>>> for an MBM event when resctrl_arch_mbm_cntr_assign_enabled() reports
>>> false, and this driver always reports true for the L3, so the MBM
>>> events are always read as assigned counters. Remove the marker, and
>>> the MBM cases of resctrl_arch_mon_ctx_alloc_no_wait() that returned it.
>>
>> True but this is a separate, benign, issue with the code.
>> resctrl_arch_mon_ctx_alloc() is only called for mbm counters when
>> mbm_assign_mode is default rather than mbm_event. In MPAM, we currently
>> only support the mbm_event mode, assigning counters. Crossing threads,
>> but you had an rfc for supporting the software controller on MPAM wher
>> using the default mbm_assign_mode can be considered. Regardless, please
>> can you keep the changes in this patch only to those addressing the
>> particular bug and other changes can be considered as separate patches.
>>
>>>
>>> Fixes: a5ff6ef2d73e ("arm_mpam: resctrl: Add resctrl_arch_cntr_read() & resctrl_arch_reset_cntr()")
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> Cc: <stable@vger.kernel.org>
>>> ---
>>>  drivers/resctrl/mpam_internal.h |  15 ---
>>>  drivers/resctrl/mpam_resctrl.c  | 195 ++++++++++++--------------------
>>>  2 files changed, 71 insertions(+), 139 deletions(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>>> index 1f86cc158100..e1348d958d05 100644
>>> --- a/drivers/resctrl/mpam_internal.h
>>> +++ b/drivers/resctrl/mpam_internal.h
>>> @@ -30,14 +30,6 @@ struct platform_device;
>>>  #define PACKED_FOR_KUNIT
>>>  #endif
>>>  
>>> -/*
>>> - * This 'mon' values must not alias an actual monitor, so must be larger than
>>> - * U16_MAX, but not be confused with an errno value, so smaller than
>>> - * (u32)-SZ_4K.
>>> - * USE_PRE_ALLOCATED is used to avoid confusion with an actual monitor.
>>> - */
>>> -#define USE_PRE_ALLOCATED	(U16_MAX + 1)
>>> -
>>>  static inline bool mpam_is_enabled(void)
>>>  {
>>>  	return static_branch_likely(&mpam_enabled);
>>> @@ -309,10 +301,6 @@ enum mon_filter_options {
>>>  };
>>>  
>>>  struct mon_cfg {
>>> -	/*
>>> -	 * mon must be large enough to hold out of range values like
>>> -	 * USE_PRE_ALLOCATED
>>> -	 */
>>>  	u32			mon;
>>>  	u8			pmg;
>>>  	bool			match_pmg;
>>> @@ -455,9 +443,6 @@ struct mpam_resctrl_res {
>>>  struct mpam_resctrl_mon {
>>>  	struct mpam_class	*class;
>>>  
>>> -	/* Array of allocated MBWU monitors, indexed by (closid, rmid). */
>>> -	int			*mbwu_idx_to_mon;
>>> -
>>>  	/* Array of assigned MBWU monitors, indexed by resctrl's cntr_id. */
>>>  	int			*assigned_counters;
>>>  };
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>>> index b28c5c04a87c..05c1bf97c43d 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -397,20 +397,13 @@ static int resctrl_arch_mon_ctx_alloc_no_wait(enum resctrl_event_id evtid)
>>>  {
>>>  	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
>>>  
>>> -	if (!mpam_is_enabled())
>>> -		return -EINVAL;
>>> -
>>> -	if (!mon->class)
>>> +	if (!mpam_is_enabled() || !mon->class)
>>>  		return -EINVAL;
>>
>> I don't see any reason for this refactoring.
> 
> 
> Here, the same error return is combined just for cleanup.

Stylistically, I'm ok with how it was before.

> 
>>
>>>  
>>> -	switch (evtid) {
>>> -	case QOS_L3_OCCUP_EVENT_ID:
>>> +	if (evtid == QOS_L3_OCCUP_EVENT_ID) {
>>>  		/* With CDP, one monitor gets used for both code/data reads */
>>>  		return mpam_alloc_csu_mon(mon->class);
>>> -	case QOS_L3_MBM_LOCAL_EVENT_ID:
>>> -	case QOS_L3_MBM_TOTAL_EVENT_ID:
>>> -		return USE_PRE_ALLOCATED;
>>> -	default:
>>> +	} else {
>>>  		return -EOPNOTSUPP;
>>>  	}
>>>  }
>>> @@ -464,9 +457,15 @@ void resctrl_arch_mon_ctx_free(struct rdt_resource *r,
>>>  	resctrl_arch_mon_ctx_free_no_wait(evtid, mon_idx);
>>>  }
>>>  
>>> -static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
>>> -		      enum mpam_device_features mon_type,
>>> -		      int mon_idx,
>>> +/* The monitor resctrl's counter @cntr_id uses for @cdp_type. */
>>> +static int mon_for_cntr(struct mpam_resctrl_mon *mon, int cntr_id,
>>> +			enum resctrl_conf_type cdp_type)
>>> +{
>>> +	return mon->assigned_counters[resctrl_get_config_index(cntr_id, cdp_type)];
>>> +}
>>> +
>>> +static int __read_mon(struct mpam_component *mon_comp,
>>> +		      enum mpam_device_features mon_type, int mon_idx,
>>>  		      enum resctrl_conf_type cdp_type, u32 closid, u32 rmid, u64 *val)
>>>  {
>>>  	struct mon_cfg cfg;
>>> @@ -477,14 +476,6 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
>>>  	/* Shift closid to account for CDP */
>>>  	closid = resctrl_get_config_index(closid, cdp_type);
>>>  
>>> -	if (mon_idx == USE_PRE_ALLOCATED) {
>>> -		int mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
>>> -
>>> -		mon_idx = mon->mbwu_idx_to_mon[mbwu_idx];
>>> -		if (mon_idx == -1)
>>> -			return -ENOENT;
>>> -	}
>>> -
>>>  	if (irqs_disabled()) {
>>>  		/* Check if we can access this domain without an IPI */
>>>  		return -EIO;
>>> @@ -500,32 +491,6 @@ static int __read_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_c
>>>  	return mpam_msmon_read(mon_comp, &cfg, mon_type, val);
>>>  }
>>>  
>>> -static int read_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
>>> -			     enum mpam_device_features mon_type,
>>> -			     int mon_idx, u32 closid, u32 rmid, u64 *val)
>>> -{
>>> -	if (cdp_enabled) {
>>> -		u64 code_val = 0, data_val = 0;
>>> -		int err;
>>> -
>>> -		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
>>> -				 CDP_CODE, closid, rmid, &code_val);
>>> -		if (err)
>>> -			return err;
>>> -
>>> -		err = __read_mon(mon, mon_comp, mon_type, mon_idx,
>>> -				 CDP_DATA, closid, rmid, &data_val);
>>> -		if (err)
>>> -			return err;
>>> -
>>> -		*val = code_val + data_val;
>>> -		return 0;
>>> -	}
>>> -
>>> -	return __read_mon(mon, mon_comp, mon_type, mon_idx,
>>> -			  CDP_NONE, closid, rmid, val);
>>> -}
>>> -
>>>  /* MBWU when not in ABMC mode (not supported), and CSU counters. */
>>>  int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
>>>  			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
>>> @@ -553,13 +518,31 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
>>>  
>>>  	mon_type = mpam_feat_msmon_csu;
>>>  
>>> -	return read_mon_cdp_safe(mon, mon_comp, mon_type, mon_idx,
>>> -				 closid, rmid, val);
>>> +	if (cdp_enabled) {
>>> +		u64 code_val = 0, data_val = 0;
>>> +		int err;
>>> +
>>> +		err = __read_mon(mon_comp, mon_type, mon_idx,
>>> +				 CDP_CODE, closid, rmid, &code_val);
>>> +		if (err)
>>> +			return err;
>>> +
>>> +		err = __read_mon(mon_comp, mon_type, mon_idx,
>>> +				 CDP_DATA, closid, rmid, &data_val);
>>> +		if (err)
>>> +			return err;
>>> +
>>> +		*val = code_val + data_val;
>>> +		return 0;
>>> +	}
>>> +
>>> +	return __read_mon(mon_comp, mon_type, mon_idx,
>>> +			  CDP_NONE, closid, rmid, val);
>>
>>
>> What am I missing? Aren't you just copying the contents of
>> read_mon_cdp_safe()?
> 
> After this patch, read_mon_cdp_safe no longer has a second caller, so
> remove it.

Yes, but this is cleanup. Mixing cleanup with functional changes,
particularly fixes, makes it harder for me to reason about the
correctness of the code. Please could you pare down this fix to just the
functional changes needed to fix the particular bug.

Thanks,

Ben

> 
>>
>> Thanks,
>>
>> Ben
>>
>>>  }
>>>  
>>>  /* MBWU counters when in ABMC mode */
>>>  int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
>>> -			   u32 closid, u32 rmid, int mon_idx,
>>> +			   u32 closid, u32 rmid, int cntr_id,
>>>  			   enum resctrl_event_id eventid, u64 *val)
>>>  {
>>>  	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[eventid];
>>> @@ -575,43 +558,38 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
>>>  	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
>>>  	mon_comp = l3_dom->mon_comp[eventid];
>>>  
>>> -	return read_mon_cdp_safe(mon, mon_comp, mpam_feat_msmon_mbwu,
>>> -				 USE_PRE_ALLOCATED, closid, rmid, val);
>>> -}
>>> -
>>> -static void __reset_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
>>> -			int mon_idx,
>>> -			enum resctrl_conf_type cdp_type, u32 closid, u32 rmid)
>>> -{
>>> -	struct mon_cfg cfg = { };
>>> -
>>> -	if (!mpam_is_enabled())
>>> -		return;
>>> +	if (cdp_enabled) {
>>> +		u64 code_val = 0, data_val = 0;
>>> +		int err;
>>>  
>>> -	/* Shift closid to account for CDP */
>>> -	closid = resctrl_get_config_index(closid, cdp_type);
>>> +		err = __read_mon(mon_comp, mpam_feat_msmon_mbwu,
>>> +				 mon_for_cntr(mon, cntr_id, CDP_CODE),
>>> +				 CDP_CODE, closid, rmid, &code_val);
>>> +		if (err)
>>> +			return err;
>>>  
>>> -	if (mon_idx == USE_PRE_ALLOCATED) {
>>> -		int mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
>>> +		err = __read_mon(mon_comp, mpam_feat_msmon_mbwu,
>>> +				 mon_for_cntr(mon, cntr_id, CDP_DATA),
>>> +				 CDP_DATA, closid, rmid, &data_val);
>>> +		if (err)
>>> +			return err;
>>>  
>>> -		mon_idx = mon->mbwu_idx_to_mon[mbwu_idx];
>>> +		*val = code_val + data_val;
>>> +		return 0;
>>>  	}
>>>  
>>> -	if (mon_idx == -1)
>>> -		return;
>>> -	cfg.mon = mon_idx;
>>> -	mpam_msmon_reset_mbwu(mon_comp, &cfg);
>>> +	return __read_mon(mon_comp, mpam_feat_msmon_mbwu,
>>> +			  mon_for_cntr(mon, cntr_id, CDP_NONE),
>>> +			  CDP_NONE, closid, rmid, val);
>>>  }
>>>  
>>> -static void reset_mon_cdp_safe(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
>>> -			       int mon_idx, u32 closid, u32 rmid)
>>> +/* Reset the monitor resctrl's counter @cntr_id uses for @cdp_type. */
>>> +static void __reset_mon(struct mpam_resctrl_mon *mon, struct mpam_component *mon_comp,
>>> +			int cntr_id, enum resctrl_conf_type cdp_type)
>>>  {
>>> -	if (cdp_enabled) {
>>> -		__reset_mon(mon, mon_comp, mon_idx, CDP_CODE, closid, rmid);
>>> -		__reset_mon(mon, mon_comp, mon_idx, CDP_DATA, closid, rmid);
>>> -	} else {
>>> -		__reset_mon(mon, mon_comp, mon_idx, CDP_NONE, closid, rmid);
>>> -	}
>>> +	struct mon_cfg cfg = { .mon = mon_for_cntr(mon, cntr_id, cdp_type) };
>>> +
>>> +	mpam_msmon_reset_mbwu(mon_comp, &cfg);
>>>  }
>>>  
>>>  /* Reset an assigned counter */
>>> @@ -632,7 +610,12 @@ void resctrl_arch_reset_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d
>>>  	l3_dom = container_of(d, struct mpam_resctrl_dom, resctrl_mon_dom);
>>>  	mon_comp = l3_dom->mon_comp[eventid];
>>>  
>>> -	reset_mon_cdp_safe(mon, mon_comp, USE_PRE_ALLOCATED, closid, rmid);
>>> +	if (cdp_enabled) {
>>> +		__reset_mon(mon, mon_comp, cntr_id, CDP_CODE);
>>> +		__reset_mon(mon, mon_comp, cntr_id, CDP_DATA);
>>> +	} else {
>>> +		__reset_mon(mon, mon_comp, cntr_id, CDP_NONE);
>>> +	}
>>>  }
>>>  
>>>  /*
>>> @@ -1170,22 +1153,6 @@ static void mpam_resctrl_pick_counters(void)
>>>  	}
>>>  }
>>>  
>>> -static void __config_cntr(struct mpam_resctrl_mon *mon, u32 cntr_id,
>>> -			  enum resctrl_conf_type cdp_type, u32 closid, u32 rmid,
>>> -			  bool assign)
>>> -{
>>> -	/* Same CDP index remap as closid; maps cntr_id to assigned_counters[]. */
>>> -	u32 mbwu_idx, mon_idx = resctrl_get_config_index(cntr_id, cdp_type);
>>> -
>>> -	closid = resctrl_get_config_index(closid, cdp_type);
>>> -	mbwu_idx = resctrl_arch_rmid_idx_encode(closid, rmid);
>>> -
>>> -	if (assign)
>>> -		mon->mbwu_idx_to_mon[mbwu_idx] = mon->assigned_counters[mon_idx];
>>> -	else
>>> -		mon->mbwu_idx_to_mon[mbwu_idx] = -1;
>>> -}
>>> -
>>>  void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *d,
>>>  			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
>>>  			      u32 cntr_id, bool assign)
>>> @@ -1197,19 +1164,13 @@ void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_l3_mon_domain *
>>>  		return;
>>>  	}
>>>  
>>> -	if (!mon->mbwu_idx_to_mon || !mon->assigned_counters) {
>>> -		pr_debug("monitor arrays not allocated\n");
>>> +	if (!mon->assigned_counters) {
>>> +		pr_debug("monitor array not allocated\n");
>>>  		return;
>>>  	}
>>>  
>>> -	if (cdp_enabled) {
>>> -		__config_cntr(mon, cntr_id, CDP_CODE, closid, rmid, assign);
>>> -		__config_cntr(mon, cntr_id, CDP_DATA, closid, rmid, assign);
>>> -	} else {
>>> -		__config_cntr(mon, cntr_id, CDP_NONE, closid, rmid, assign);
>>> -	}
>>> -
>>> -	resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, QOS_L3_MBM_TOTAL_EVENT_ID);
>>> +	if (assign)
>>> +		resctrl_arch_reset_cntr(r, d, closid, rmid, cntr_id, evtid);
>>>  }
>>>  
>>>  static int mpam_resctrl_control_init(struct mpam_resctrl_res *res)
>>> @@ -1296,25 +1257,16 @@ static int mpam_resctrl_pick_domain_id(int cpu, struct mpam_component *comp)
>>>  static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)
>>>  {
>>>  	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
>>> -	size_t num_rmid = resctrl_arch_system_num_rmid_idx();
>>>  	struct rdt_resource *l3 = &res->resctrl_res;
>>>  	struct mpam_class *class = mon->class;
>>>  	u16 num_mbwu_mon;
>>>  	int *cntrs;
>>>  
>>> -	int *rmid_array __free(kvfree) = kvmalloc_objs(*rmid_array, num_rmid);
>>> -	if (!rmid_array) {
>>> -		pr_debug("Failed to allocate RMID array\n");
>>> -		return -ENOMEM;
>>> -	}
>>> -	memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));
>>> -
>>>  	num_mbwu_mon = class->props.num_mbwu_mon;
>>>  	cntrs = __alloc_mbwu_array(mon->class, num_mbwu_mon);
>>>  	if (IS_ERR(cntrs))
>>>  		return PTR_ERR(cntrs);
>>>  	mon->assigned_counters = cntrs;
>>> -	mon->mbwu_idx_to_mon = no_free_ptr(rmid_array);
>>>  
>>>  	l3->mon.mbm_cntr_assignable = true;
>>>  	l3->mon.mbm_assign_on_mkdir = true;
>>> @@ -1943,17 +1895,12 @@ static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, struct mpam_
>>>  {
>>>  	u32 num_mbwu_mon = class->props.num_mbwu_mon;
>>>  
>>> -	if (!mon->mbwu_idx_to_mon)
>>> +	if (!mon->assigned_counters)
>>>  		return;
>>>  
>>> -	if (mon->assigned_counters) {
>>> -		__free_mbwu_mon(class, mon->assigned_counters, num_mbwu_mon);
>>> -		kvfree(mon->assigned_counters);
>>> -		mon->assigned_counters = NULL;
>>> -	}
>>> -
>>> -	kvfree(mon->mbwu_idx_to_mon);
>>> -	mon->mbwu_idx_to_mon = NULL;
>>> +	__free_mbwu_mon(class, mon->assigned_counters, num_mbwu_mon);
>>> +	kvfree(mon->assigned_counters);
>>> +	mon->assigned_counters = NULL;
>>>  }
>>>  
>>>  void mpam_resctrl_teardown_class(struct mpam_class *class)
>>
> 


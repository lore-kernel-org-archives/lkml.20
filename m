Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348472;
	b=NiCHFTYEdCqnnDGQ+EdDIAcwqXmJi1LwO7uRleHDL5OgpgVgRW8WPstQICtsXFddPQQ9
	 PS3JMwFSBWaeNYw2Lqejj+HbKBaM2OOMABKQuYyCV8wfs53LsxIdFZcsKXfx2a/fW84h4
	 9e252sB+cDwOf5W67l1vhqDFDEII1eX92D1d7Sl6pBB30GUVrQgQnLoa+uqC89gmQaBdK
	 ipqCrTPS3j3zVM7UnxLk7lE1GtDbSYsUCh5MBc43aRjGofiCy2OlMAuGouJdOZEFDfopc
	 CbA4yU5MpH1wSjn77XT+dr3hAOlO5es9aIkqnrQK/zWnT4ek5fnzkbG0Agy1dAurfYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348472;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=fmEat90F9teQQy3ms7V3lZGMVmPXQNN72q1R3RZ1Clw=;
	b=OfMKBnw5e+mgx5XBRF3jxJZ73sv7i7NeinRAAadqdxj+puHpF4VV8uDaG3p7mJIf8zYp
	 KQhtUg7loMMbHEMAk4Hkpmpu13gHRFMzC1Ht1QozawbfL785o4+SY9FVzMlOhKn0Tfl1B
	 O39Kb3KRVaC8tKm6HJ5iwlZ23vREYkilFv5DyymVQqC7XDSKo7EKiVyjItpKw58qtNmIk
	 wZvEJF52uKU2W0KwVgaBO+4Z8LeCLQrvAkOHCNCgQk+CwXHnMlHkywEnJowtdngn3fw+X
	 eu3uZGHcqIyKR9ainkLMGncD07mAZz8SxBHBprOcDwdA297wyZpwSO+ChFul2fVWhjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LwJTH0Qt;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3837B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3837B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=LwJTH0Qt
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fmEat90F9teQQy3ms7V3lZGMVmPXQNN72q1R3RZ1Clw=;
	b=LwJTH0Qt5i/Dob1IWHWovwgsJGEA5P4hExqGywe1PSsqr68fGaBYHQG1HKyFA8F3S82jgae66
	cV1HUo8E0CmB5P0WXQ7BZeX5YLMXvI5GXeKq9RV9dXTWPW5OziQA3k3vIUvawrKkA4TsezCfYzI
	XEJ219VJQkN/HVu8aqePINw=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jGDZR75G4zRhQk;
	Fri, 30 Oct 2026 16:21:03 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 368D340561;
	Fri, 30 Oct 2026 16:21:07 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 16:21:06 +0800
Message-ID: <e8f57912-b1e5-4434-a1b7-98a4fde9e540@huawei.com>
Date: Fri, 30 Oct 2026 16:21:06 +0800
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
Subject: Re: [PATCH 2/2] fs/resctrl: Skip monitor context allocation when
 force-freeing RMIDs
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261029081513.924019-1-ruanjinjie@huawei.com>
 <20261029081513.924019-3-ruanjinjie@huawei.com>
 <e47f73ac-311c-4a6d-a283-aed675b95b6b@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <e47f73ac-311c-4a6d-a283-aed675b95b6b@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/30 2:15, Reinette Chatre 写道:
> Hi Jinjie,
> 
> There is no "force-freeing" of RMIDs. How about
> 	fs/resctrl: Do not allocate a monitor context when releasing limbo RMIDs
> 
> On 10/29/26 1:15 AM, Jinjie Ruan wrote:
>> __check_limbo() allocates the architecture monitor context before the
>> scan loop, even when the domain is going offline and the RMIDs will
>> be freed without reading their occupancy. So if the allocation fails,
>> the offline path returns early and leaves the busy RMIDs in limbo
>> which will be leaked instead of being released.
> 
> (please separate the context, problem, and solution descriptions).

OK.

> 
> "will be leaked" is a bit vague to gain confidence that there is an issue here.
> Compare with, for example, "The caller goes on to destroy the domain's
> monitoring state, freeing the bitmap that records which RMIDs are busy,
> so nothing can clear those bits afterwards and the busy counts never reach zero."
> 
> I think that there is an argument for this change even in the successful
> allocation path. If I understand correctly MPAM's resctrl_arch_mon_ctx_alloc()
> may need to block as it waits for a monitor? This would cause the CPU-offline
> path to block on a counter that will never be read.

I agree.

> 
>>
>> Split out release_limbo_rmids() for the offline path, which doesn't need
>> the monitor context.
> 
> Considering the shape of this fix and the "Fixes:" tag I think it may be
> worth a mention that this is not a revert of the indicated commit. This change
> maintains the intent of the original fix that avoids reading a counter in the
> offline path.

I agree.

> 
>>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Fixes: fc16126cc11d ("x86,fs/resctrl: Prevent out-of-bounds access while offlining CPU when SNC enabled")
> 
> The changelog is missing a clear description of the impact of this issue.
> Nowhere does it mention that this only impacts MPAM and how likely this issue is. 

Will add the description.

> 
> This is important because this "Fixes:" commit has a "Cc: <stable@kernel.org>" so
> we need to help maintainers determine the impact of this issue to 
> guide where, if at all, it needs to be backported.

Thank you for the reminder.

> 
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  fs/resctrl/internal.h |  3 +-
>>  fs/resctrl/monitor.c  | 69 ++++++++++++++++++++++++++++---------------
>>  fs/resctrl/rdtgroup.c |  2 +-
>>  3 files changed, 48 insertions(+), 26 deletions(-)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index e62a277dee85..a1837679b27a 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -405,7 +405,8 @@ void cqm_handle_limbo(struct work_struct *work);
>>  
>>  bool has_busy_rmid(struct rdt_l3_mon_domain *d);
>>  
>> -void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free);
>> +void __check_limbo(struct rdt_l3_mon_domain *d);
> 
> Looks like __check_limbo() can be static now?
> 
>> +void release_limbo_rmids(struct rdt_l3_mon_domain *d);
>>  
>>  void resctrl_file_fflags_init(const char *config, unsigned long fflags);
>>  
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index b8f4e1ff4083..020140b794a7 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -124,13 +124,36 @@ static void limbo_release_entry(struct rmid_entry *entry)
>>  		closid_num_dirty_rmid[entry->closid]--;
>>  }
>>  
>> +/*
>> + * Release the busy RMIDs of a domain that is going offline. Their occupancy
>> + * can't be read any more, so they are freed without being checked.
> 
> Please document the function self, not the caller. Considering the comments in
> resctrl_offline_mon_domain() the caller already does a good job at this.

OK.

> 
> The "Their occupancy can't be read any more" also does not look right. I think
> this claim is based on x86's cpumask_empty() guard in resctrl_arch_rmid_read(), for
> x86 that does not actually mean that the occupancy cannot be read anymore, just that
> the CPU may already been removed from the domain at that point. This is really
> a platform specific detail that resctrl fs cannot assume.
> 
> How about something like:
> 
> 	/*
> 	 * Release the RMIDs that are marked as busy for this domain without
> 	 * checking their LLC occupancy. Cache lines may still be tagged with
> 	 * these RMIDs and will be accounted to the next user of each RMID.
> 	 */
> 
> I think such comment pairs well with the comment in the caller - it documents
> the consequence that the caller documents it is willing to take.
> 
>> + */
>> +void release_limbo_rmids(struct rdt_l3_mon_domain *d)
>> +{
>> +	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
>> +	struct rmid_entry *entry;
>> +	u32 idx, cur_idx = 1;
>> +
>> +	for (;;) {
>> +		idx = find_next_bit(d->rmid_busy_llc, idx_limit, cur_idx);
>> +		if (idx >= idx_limit)
>> +			break;
>> +
>> +		entry = __rmid_entry(idx);
>> +		clear_bit(idx, d->rmid_busy_llc);
>> +		if (!--entry->busy)
>> +			limbo_release_entry(entry);
>> +		cur_idx = idx + 1;
>> +	}
>> +}
>> +
>>  /*
>>   * Check the RMIDs that are marked as busy for this domain. If the
>>   * reported LLC occupancy is below the threshold clear the busy bit and
>>   * decrement the count. If the busy count gets to zero on an RMID, we
>>   * free the RMID
>>   */
>> -void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
>> +void __check_limbo(struct rdt_l3_mon_domain *d)
> 
> Now __check_limbO() can be static?

Yes

> 
>>  {
>>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>>  	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
>> @@ -161,30 +184,28 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
>>  			break;
> 
> To be true to the fix I think the rmid_dirty initializer added by fc16126cc11d
> can also be removed?
> 	"bool rmid_dirty = true;" -> "bool rmid_dirty;"
Yes

> 
>>  
>>  		entry = __rmid_entry(idx);
>> -		if (!force_free) {
>> -			if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
>> -						   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
>> -						   arch_priv, &val, arch_mon_ctx)) {
>> -				rmid_dirty = true;
>> -			} else {
>> -				rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
>> -
>> -				/*
>> -				 * x86's CLOSID and RMID are independent numbers,
>> -				 * so the entry's CLOSID is an empty CLOSID
>> -				 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
>> -				 * (PMG) extends the CLOSID (PARTID) space with
>> -				 * bits that aren't used to select the configuration.
>> -				 * It is thus necessary to track both CLOSID and
>> -				 * RMID because there may be dependencies between
>> -				 * them on some architectures.
>> -				 */
>> -				trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
>> -							      d->hdr.id, val);
>> -			}
>> +		if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
>> +					   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
>> +					   arch_priv, &val, arch_mon_ctx)) {
>> +			rmid_dirty = true;
>> +		} else {
>> +			rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
>> +
>> +			/*
>> +			 * x86's CLOSID and RMID are independent numbers,
>> +			 * so the entry's CLOSID is an empty CLOSID
>> +			 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
>> +			 * (PMG) extends the CLOSID (PARTID) space with
>> +			 * bits that aren't used to select the configuration.
>> +			 * It is thus necessary to track both CLOSID and
>> +			 * RMID because there may be dependencies between
>> +			 * them on some architectures.
>> +			 */
>> +			trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
>> +						      d->hdr.id, val);
>>  		}
>>  
>> -		if (force_free || !rmid_dirty) {
>> +		if (!rmid_dirty) {
>>  			clear_bit(idx, d->rmid_busy_llc);
>>  			if (!--entry->busy)
>>  				limbo_release_entry(entry);
>> @@ -843,7 +864,7 @@ void cqm_handle_limbo(struct work_struct *work)
>>  	if (cpumask_empty(&d->hdr.cpu_mask))
>>  		goto out_unlock;
>>  
>> -	__check_limbo(d, false);
>> +	__check_limbo(d);
>>  
>>  	if (has_busy_rmid(d)) {
>>  		d->cqm_work_cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 57ab090072c2..5d0351453c2f 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -4590,7 +4590,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
>>  		 * the RMID as busy creates RMID leaks if the
>>  		 * package never comes back.
>>  		 */
>> -		__check_limbo(d, true);
>> +		release_limbo_rmids(d);
>>  	}
>>  
>>  	domain_destroy_l3_mon_state(d);
> 
> Thank you very much.
> 
> Reinette

-- 
Best regards,
Jinjie


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793073399;
	b=o6yTchDkGUiRx4sODI6jj0ohwOZoIxt1px1UMCOTBGKunrSxCdd46wQEwanH5XbSqrrT
	 fk1CigQc6Yy2eTfvhG5XqBjP44k5AUVQoj1nG+fHgdlPT7BoLl+q6wyafkuj6izsZmfXI
	 VoNRS//u1uVIql8tCIQUkHXA32y659DD41LPQabsisXhXsqhdOlJZuid89UDr+EpawwVU
	 dj3HKHZ589EClW7tMIOgLDDiAR/nCTVSXq/yVnAN2Xe2YA7//7Kzb1/5X3TsnmiFk47GL
	 ewU9+NYpOzGt1Cw4i2GzZ8T9j4uxwcJdkpRzJ3PgES+mRzzMwH5wIcpehiBjG+OfIZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793073399;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=JhyUKgbX8eyflV1MsTEVrJUGBPCjnuZKOPzjCZz0Nx8=;
	b=5IKJxQLS2AQq6rmLjtVdyN2F122WGAJF/qcMv6jyeXY3AOUUqsE2rkgjhgzcWAxJorfL
	 SbJoCqbTPBiJ/5R2s4tHjSn/y7TudxKdzP7b/JwrnW/tEhqp8gAbQTMCFfAota7+kWMNt
	 uorGVUe7bX9grFaqcp3d76VpSx+9K9lJDV+ozjhUr9XNOi6M/Nbk+180bFVrx7VWsssaH
	 GkDlNdYAySjtqcxX6qxKiaud7EV7ooMknTmC97mASf9eDcLh5dRf0nddZnzy/Uvourh8U
	 b++G2h8BihFq+XVSPpos1whl2Gwup0+eaSG9F3d+w+tcDvp9CP1KQXLzTjQ9jd6k/eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=sxPTMcng;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7990606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7990606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=sxPTMcng
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JhyUKgbX8eyflV1MsTEVrJUGBPCjnuZKOPzjCZz0Nx8=;
	b=sxPTMcngV50eCjRDE/FytOo7f3JbRX3ifMfnw3ccDcLQDEo1kJZ/hjLfP9ZvgOvru7aosVlLU
	qssC0p1K1VJrT6+1DSH+nT1UHkHRZxfvWToK9zz7InIVcEcOkVWZPdRMWPFw95hOAtOdkcnLRLA
	+NYMdMiTxbfoZgI7+SbV0iQ=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jDGrL19K1z1T4f1;
	Tue, 27 Oct 2026 11:56:18 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 17BF24056D;
	Tue, 27 Oct 2026 11:56:26 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 11:56:25 +0800
Message-ID: <8e2d54d8-b5d4-42cd-9a06-906f1a610bed@huawei.com>
Date: Tue, 27 Oct 2026 11:56:24 +0800
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
Subject: Re: [PATCH v9 2/9] fs/resctrl: Add resctrl_arch_rmid_idx_match()
 helper
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261012082337.822258-1-ruanjinjie@huawei.com>
 <20261012082337.822258-3-ruanjinjie@huawei.com>
 <4a20a2c8-579f-4234-a03a-079a0225e2b9@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <4a20a2c8-579f-4234-a03a-079a0225e2b9@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/26 20:12, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 12/10/2026 09:23, Jinjie Ruan wrote:
>> The current RMID allocator assumes that RMID and CLOSID are entirely
>> independent or follow a rigid 2D encoding. This prevents architectures
>> where an RMID is bound to a specific CLOSID from properly filtering
>> free RMIDs.
> 
> Is this patch required for the PARTID narrowing usage in this series? The static mapping is still a
> 2D encoding.

Hi ben,

Yes. Patch 7 needs it:

    u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
    {
            if (resctrl_using_extra_partids)
                    return rmid;    /* closid is gone */

            return closid * (mpam_pmg_max + 1) + rmid;
    }

With that, the old check below compares itr->rmid with itr->rmid, so it
always matches.

   itr_idx = resctrl_arch_rmid_idx_encode(itr->closid, itr->rmid);
   cmp_idx = resctrl_arch_rmid_idx_encode(closid, itr->rmid);
   if (itr_idx == cmp_idx)
       return itr;

So the allocator can then return an RMID from another CLOSID. For narrow
partid mode the task PARTID comes from the RMID as below, so the group
would use the wrong PARTID and read wrong counters. Patch 9 turns this on.

That is, after narrow PARTID is introduced, the allocated RMID needs to
correspond to the group.

    static u16 resctrl_rmid_to_partid(u32 rmid)
    {
      	return rmid / (mpam_pmg_max + 1);
     }

Thanks,
Jinjie

> 
> Thanks,
> 
> Ben
> 
>>
>> Introduce resctrl_arch_rmid_idx_match() to allow architectures to define
>> their own compatibility rules between a target CLOSID and an allocated
>> RMID's CLOSID.
>>
>> No functional change.
> 
> 
> 
>>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: Dave Martin <Dave.Martin@arm.com>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Babu Moger <babu.moger@amd.com>
>> Cc: Thomas Gleixner <tglx@kernel.org>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: Borislav Petkov <bp@alien8.de>
>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>> Cc: Ben Horgan <ben.horgan@arm.com>
>> Cc: Fenghua Yu <fenghuay@nvidia.com>
>> Suggested-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/x86/include/asm/resctrl.h |  6 ++++++
>>  drivers/resctrl/mpam_resctrl.c |  6 ++++++
>>  fs/resctrl/monitor.c           | 13 +++----------
>>  include/linux/arm_mpam.h       |  1 +
>>  4 files changed, 16 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
>> index 8f6edcdcfd87..7bb297a0ab6e 100644
>> --- a/arch/x86/include/asm/resctrl.h
>> +++ b/arch/x86/include/asm/resctrl.h
>> @@ -181,6 +181,12 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
>>  	return rmid;
>>  }
>>  
>> +/* x86 RMIDs are independent; any RMID can be used with any CLOSID. */
>> +static inline bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid)
>> +{
>> +	return true;
>> +}
>> +
>>  /* x86 can always read an rmid, nothing needs allocating */
>>  struct rdt_resource;
>>  static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 9d223057953a..385c745787f2 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -279,6 +279,12 @@ u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
>>  	return closid * (mpam_pmg_max + 1) + rmid;
>>  }
>>  
>> +/* Check if the RMID's associated closid matches the target CLOSID. */
>> +bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid)
>> +{
>> +	return closid == rmid_closid;
>> +}
>> +
>>  void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
>>  {
>>  	*closid = idx / (mpam_pmg_max + 1);
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 73413cb128ea..39908f67dea4 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -205,23 +205,16 @@ bool has_busy_rmid(struct rdt_l3_mon_domain *d)
>>  static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>>  {
>>  	struct rmid_entry *itr;
>> -	u32 itr_idx, cmp_idx;
>>  
>>  	if (list_empty(&rmid_free_lru))
>>  		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
>>  
>>  	list_for_each_entry(itr, &rmid_free_lru, list) {
>>  		/*
>> -		 * Get the index of this free RMID, and the index it would need
>> -		 * to be if it were used with this CLOSID.
>> -		 * If the CLOSID is irrelevant on this architecture, the two
>> -		 * index values are always the same on every entry and thus the
>> -		 * very first entry will be returned.
>> +		 * Check if the free RMID matches the target CLOSID.
>> +		 * Architecture-specific rules apply.
>>  		 */
>> -		itr_idx = resctrl_arch_rmid_idx_encode(itr->closid, itr->rmid);
>> -		cmp_idx = resctrl_arch_rmid_idx_encode(closid, itr->rmid);
>> -
>> -		if (itr_idx == cmp_idx)
>> +		if (resctrl_arch_rmid_idx_match(closid, itr->closid))
>>  			return itr;
>>  	}
>>  
>> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
>> index f92a36187a52..0bc8049a3733 100644
>> --- a/include/linux/arm_mpam.h
>> +++ b/include/linux/arm_mpam.h
>> @@ -60,6 +60,7 @@ void resctrl_arch_sched_in(struct task_struct *tsk);
>>  bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
>>  bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
>>  u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
>> +bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid);
>>  void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
>>  u32 resctrl_arch_system_num_rmid_idx(void);
>>  
> 

-- 
Best regards,
Jinjie


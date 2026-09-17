Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9ABA4973BA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661719; cv=none; b=K8bTWgYV6yDMghK1xGwAFRWuGZ2sUZxQWLpojrLGJ+QEOp61bYXPQWCgHmq2YGOiPkNaoLvSDN3bB4VzvVk9En+lGLxE+Kyygoa/gw+ym5+nKDT0WTaH130k08zMCRsWcAVvkmgQIBFy+Ah0KVB3V3YRSRZiEHOzS+RPOOSlrCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661719; c=relaxed/simple;
	bh=SpCbZ9c6DdwmsHuAD+Fb2mNA4COJFwMpCm2Pu3+tNug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qe/LoPbwm/nDNGl6EjTpt9BfVQwUzlMYDneKHJkI2ehk3Gw4wUdYUHG9VjBG0XHJIOUrOVZ1wVpY6vhXedkOpkHZHDdSdi3MPDuUN5tBQ+fTI64pvayasE1i3ErOtvT+8qR8ygwQ3v0uOxPkPw3yePmVdrjQKzzIDrc+3g1SFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qboHDqfh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qboHDqfh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C81EB143D;
	Thu, 17 Sep 2026 09:15:10 -0700 (PDT)
Received: from [10.2.212.8] (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1777F3F86F;
	Thu, 17 Sep 2026 09:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789661714; bh=SpCbZ9c6DdwmsHuAD+Fb2mNA4COJFwMpCm2Pu3+tNug=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qboHDqfhdV43p1IP8Zkqy/Eusv3HWvao9FI7h81f7/RTt6yNBrSyI01Zion5mJ66c
	 msko3rQA1v/nCxDZTkSA+yGxXVGyJ7DDeamZPKLGeBg8PFYZ92LZeIXowT1Qeltk9A
	 jDceihAq5kPbDMnPKZX/7hGDZE25dnzACBBphWfc=
Message-ID: <0bb072be-71d6-43b9-a258-aa745711012b@arm.com>
Date: Thu, 17 Sep 2026 17:15:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/resctrl: Allocate rmid_ptrs[] using kvzalloc_objs()
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: tony.luck@intel.com, x86@kernel.org, Dave.Martin@arm.com,
 james.morse@arm.com, babu.moger@amd.com, fenghuay@nvidia.com, bp@alien8.de,
 linux-kernel@vger.kernel.org
References: <20260911160608.1091121-1-ben.horgan@arm.com>
 <980ca6b6-fc5b-441b-8025-755e2f6d51a9@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <980ca6b6-fc5b-441b-8025-755e2f6d51a9@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 16/09/2026 17:52, Reinette Chatre wrote:
> Hi Ben,
> 
> On 9/11/26 9:06 AM, Ben Horgan wrote:
>> On an MPAM system the number of entries in rmid_ptrs[] is the number of PARTIDs
>> multiplied by the number of PMGs. The maximum possible number of PARTIDs is
>> 0x10000 and the maximum number of PMGs is 0x100. On a system pushing the limits
>> of the MPAM specification this can be large enough to consistently fail the
>> kzalloc_objs() allocation and hence fail to mount the resctrl filesystem.
>>
>> Switch to allocating rmid_ptrs[] using kvzalloc_objs() so that large allocations
>> fall back to vmalloc().
>>
>> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> Reviewed-by: Tony Luck <tony.luck@intel.com>
>> ---
>> I found this by testing the extremes of a software model and don't expect this
>> to effect real systems.
>> ---
>>  fs/resctrl/monitor.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 73413cb128ea..2d7df60973d1 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -979,7 +979,7 @@ int setup_rmid_lru_list(void)
>>  		return 0;
>>  
>>  	idx_limit = resctrl_arch_system_num_rmid_idx();
>> -	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
>> +	rmid_ptrs = kvzalloc_objs(struct rmid_entry, idx_limit);
>>  	if (!rmid_ptrs)
>>  		return -ENOMEM;
>>  
> 
> resctrl_arch_system_num_rmid_idx() that guides the rmid_ptrs[] allocation is
> also used to size the L3 monitoring state rdt_l3_mon_domain::rmid_busy_llc[]
> and rdt_l3_mon_domain::mbm_states[]. Each RMID is expected to have associated
> states in these structures so to fully support this their allocation needs
> to change also? 

At least, rdt_l3_mon_domain::mbm_states[] should use kvcalloc. I realise that I didn't hit this on
the model I was using to test this didn't have memory bandwidth monitors.

For, rdt_l3_mon_domain::rmid_busy_llc[] the allocation will have succeeded on a model as there are
cache occupancy counters. The allocation here is smaller than the others as it allocates a bit per
RMID rather than multiple bytes per RMID like the other two allocations. This gives a limit here of
0x100 * 0x10000 / 0x8 = 0x200000 bytes, 2MB. My view here would be that, although this is quite big,
it's not standing in the way of testing on a model and physical systems even approaching this size
are not likely to ever be built and so doesn't justify either open coding the bitmap allocation and
freeing or creating a new bitmap allocator. Does that make sense?

> I did a quick check and there does not seem to be a
> vmalloc variant for bitmap allocation though so that may need to be
> customized or created.

Yeah, I don't see one either.

Thanks,

Ben>
> Reinette
> 
> 
> 


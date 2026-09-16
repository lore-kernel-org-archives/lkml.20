Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43F6347FCD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570776; cv=none; b=u736vkJyGgLaOB5qzgcPDvvuwOO01oyq3ntiEfuvl2MDQIOHKbOOASx4nGDj9/Rzcqpzrci92Wpi3xEg5TT9amP2GxPbZNX5hrirnZRxVIQ8VYwZxWCWzKuFQfW+xh9l50VjNF2orVBuUwYmbLlTA2/hsF7lNzlhN85spsxKzsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570776; c=relaxed/simple;
	bh=gdiAq7W2RiooAAYYrX9jy5tLi+pRLzukmFQakocw9j4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uadRtGWRm3GtTwg0L+VAXVw4exWPGsJkjDb5TxejwZjEJu9JLIgAvW4Ty9oydu2mGG/YPXki47hu3hOi04slf4TyktMDJXN+8x291gHgE2cV7o5Q/R5MQxsxhfK9sqYyR4sr5EiAIJ8df+LmPlqXXwnh6Rvnuk1GRJ/g9t530yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tRV2QeLs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tRV2QeLs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FAC01516;
	Wed, 16 Sep 2026 07:59:29 -0700 (PDT)
Received: from [10.2.212.8] (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69FE3F7B4;
	Wed, 16 Sep 2026 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789570772; bh=gdiAq7W2RiooAAYYrX9jy5tLi+pRLzukmFQakocw9j4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tRV2QeLsvP/HNcvwjbrB2SWTGZA/2PriicTdL/wlrw56ul7hEF+KtStM0SLTLYzzL
	 9a8cAXByTJ6kzMbSTe/EOe8Jm4x+zhOv7N50abVLITn6RzId1bB5US3fE3AntzBZgI
	 KSnm6IW2ift1VKmdYNE1VGr8BvnoYK6tUEqnOSU0=
Message-ID: <1f0a6421-109b-4578-910a-584bd80387ad@arm.com>
Date: Wed, 16 Sep 2026 15:59:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Andre Przywara <andre.przywara@arm.com>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
 <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
 <4f35abf6-6dac-4c60-9ece-c1af02a98c9c@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <4f35abf6-6dac-4c60-9ece-c1af02a98c9c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

On 16/09/2026 14:34, Andre Przywara wrote:
> Hi,
> 
> On 9/16/26 11:49, Ben Horgan wrote:
>> Hi Andre,
>>
>> On 07/09/2026 13:59, Ben Horgan wrote:
>>> Hi Andre,
>>>
>>> On 02/09/2026 15:37, Andre Przywara wrote:
>>>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>>>> error value.
>>>>
>>>> Check the returned value for this error condition, before passing the
>>>> value on to other code, which would hide the negative number in some high
>>>> value in the unsigned type.
>>>>
>>>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>>
>>> This looks good to me. Out of interest what led you to find this?
>>>
>>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
>>
>> I seem to have been a bit hasty here.
>>
>> Sashiko points out at [1] that 0xFFFFFFFF is the only value we were previously considering invalid
>> and that the value coming from dt or acpi can provid other valid values that would after this patch
>> be considered invalid.
> 
> Fair, and I can easily change the check to only check explicitly for -1.
> 
> But this is somewhat broken already, right? I mean the return type for the existing
> get_cpu_cacheinfo_id() has always been "int". It looks like this comes from the x86 world, where the
> cache IDs never get that large? I can have a deeper look, but my gut feeling is that this is

The cache_id being in the PPTT table is a fairly new addition introduced for PPTT table version 3
and introduced to drivers/acpi/pptt.c as part of the preparations for the MPAM driver at the end of
2025. At this point, it seems I neglected to consider any potential effect on
get_cpu_cacheinfo_id(). The pptt cacheid takes any u32 value apart from 0. I haven't joined all the
dots but I expect there might be some tidying up needed in this area.

> practically irrelevant, since we barely see Aff3 at all, not to mention high values of it.

Does Aff3 effect the cache id on acpi systems?

Thanks,

Ben>
> Cheers,
> Andre
> 
>>
>> [1] https://sashiko.dev/#/patchset/20260902143757.3469690-1-andre.przywara%40arm.com
>>
>> Thanks,
>>
>> Ben>
>>> Thanks,
>>>
>>> Ben
>>>
>>>> ---
>>>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>>>> index 9d223057953ab..a5e661eff86d7 100644
>>>> --- a/drivers/resctrl/mpam_resctrl.c
>>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>>>   /* Find the L3 cache that has affinity with this CPU */
>>>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>>>>   {
>>>> -    u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>>> +    int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>>> +
>>>> +    if (cache_id < 0)
>>>> +        return -ENOENT;
>>>>         lockdep_assert_cpus_held();
>>>>   
>>>
>>>
>>
> 


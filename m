Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915985;
	b=KzZOy4ysGyHNqsYhA8ptqlYK/FhxLasoYFLCIjGjBdPDCb8Mmj+Qfzk++2G42wuh9EbH
	 GKbrF4Fg20UkwhwEeeJQI4c2azISj8JEOXYir84CGp3xhrZuCSISz9/8TNKR07mhPDjEH
	 QjaaDpbtxwLrFsbXVNfGREKf/BEKtsJ1r9VH5IpAzRqMsoaJrtjGpnS7KqqXgGcq/XOrb
	 I9hPiEtAyaR5vOIUE2halqqMfSQmN9xNORPcRFIfF7OVw7S1L43V50qccLLIJr2q/YEyb
	 kQ4s/mE031UqnaKAuTXKCXPAxdzZMZjYJE5PJjcdz0DuGCVKiLZ2fW938BZLpQmOSlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915985;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=OXJNha1bJGx3PGZn1ib0OfACTrDka5jhorLYCQ6nPY4=;
	b=wN+fs+3YIBJO2j5xHCNjshc35WecKMDrMBi8P59pM4v7WZydJProfn4ng+NRASkscQp7
	 NB1qAY7f0TBLldmXd2AQuGO9Mm4I+BcwViG8Mbb88iG9vw/oCagfjmyXu3kuTYLSsWAkX
	 /G2cbo7BFHp/FPmYSwxhaOrpSwPYI4YyQZViq7nQ92QAR/q56FxIv3tJxrXmzVjlHH8bd
	 wOfiAi0UvtS06E177JVy24oNmCu3Xavg9wp1DG6kYikFwKdzyv0/osM1mo9/DnhO/a1HZ
	 h4JeFbTfwJoEXoK41qXLKDM35CVoiFahwEQubm5vpRv6Ma9HKJzOIMvixFtYc55rzfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TZNn+gei;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A83606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A83606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TZNn+gei
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A1DF1476;
	Tue, 17 Nov 2026 03:46:21 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.17.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 444723F763;
	Tue, 17 Nov 2026 03:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794915984; bh=DZVhaNUhaosLlDsHwEQdfcVRe6A1IplZ/CstRw26ggg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=TZNn+gei2avJAJl9ZjB8q0V4knYH1OvYVvh3+mFDatHhB38iHF34JIh9mZVg6Avmp
	 C7lQy7eTz/CwH6gsp0hxQfOnO5t20BQeo4Lp5XaImpNk43fFwiYFGEmlWAUKMsi7Qb
	 4ulRE5SZ7yM16gOj1Eyi9y7tIvhmOVdOzn+SnB5E=
Message-ID: <552e2119-f08c-4ec9-8c90-4be012a2d690@arm.com>
Date: Tue, 17 Nov 2026 11:46:20 +0000
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
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Only enable CDP on a resource
 that supports it
To: Jinjie Ruan <ruanjinjie@huawei.com>, Gavin Shan <gshan@redhat.com>,
 james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 zengheng4@huawei.com, tan.shaopeng@jp.fujitsu.com, jic23@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-3-ruanjinjie@huawei.com>
 <a783b375-7c27-4c91-b40e-7e615d33bc5b@redhat.com>
 <b1fd5fa8-bf03-4575-bc05-540a288b609d@huawei.com>
 <ce03205e-6405-4269-a061-266ef6d67e1d@arm.com>
 <f26828e6-e640-498f-81dc-d568f7cc50c7@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <f26828e6-e640-498f-81dc-d568f7cc50c7@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jinjie,

On 17/11/2026 11:41, Jinjie Ruan wrote:
> 
> 
> 在 2026/11/17 18:35, Ben Horgan 写道:
>> Hi Gavin, Jinjie,
> 
> Hi Ben,
> 
>>
>> On 17/11/2026 03:31, Jinjie Ruan wrote:
>>> Hi Gavin,
>>>
>>> 在 2026/11/13 7:42, Gavin Shan 写道:
>>>> On 11/11/26 6:13 PM, Jinjie Ruan wrote:
>>>>> resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
>>>>> requested, even one that has no MPAM cache controls. Mounting resctrl
>>>>> with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
>>>>> the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
>>>>> its CLOSID count at the number of PARTIDs. Control groups in the upper
>>>>> half then map to PARTIDs beyond mpam_partid_max, which index past the
>>>>> configuration and monitor arrays and program out of range PARTIDs into
>>>>> the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
>>>>> 2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
>>>>> disabled.
>>>>>
>>>>> Do not enable CDP when a resource cannot allocate or is not CDP capable,
>>>>> as x86 does, so the mount fails instead. Only the enable path is checked,
>>>>> since unmount disables CDP on both cache levels to restore the MBA
>>>>> control.
>>>>>
>>>>> A system where only MBA can allocate, or that only has monitors, now
>>>>> fails a mount with CDP as well: CDP hides the MBA control because
>>>>> mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.
>>>>>
>>>>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>>>>> Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-
>>>>> aa2c-3c90fab5853d
>>>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>>> Cc: <stable@vger.kernel.org> # 7.1+
>>>>> ---
>>>>>   drivers/resctrl/mpam_resctrl.c | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>>>>> mpam_resctrl.c
>>>>> index 573617ba09df..afa3c084c475 100644
>>>>> --- a/drivers/resctrl/mpam_resctrl.c
>>>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>>>> @@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum
>>>>> resctrl_res_level rid, bool enable)
>>>>>       if (enable && mpam_partid_max < 1)
>>>>>           return -EINVAL;
>>>>>   +    if (enable && (!
>>>>> mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
>>>>> +               !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
>>>>> +        return -EINVAL;
>>>>> +
>>>>
>>>> x86 only checks 'cdp_capable', so this check isn't exactly same as to
>>>> what's
>>>> done on x86, as claimed in the commit log?
>>>
>>> Sorry, the commit message is somewhat misleading and need updated.
>>>
>>> In my opinion, CDP is a feature related to resource allocation, and it
>>> is always reasonable to check alloc_capable.
>>
>> Hmm, I know the patch came from my suggestion but I think the reason
>> that x86 only checks cdp_capable is that alloc_capable is that the
>> alloc_capable flag is also used to indicate that the resource is fully
>> setup and can be used.
> 
> Thank you for your explanation.
> 
>>
>> In resctrl_arch_set_cdp_enabled() we manipulate alloc_capable for
>> re-enabling the MBA resource and the added !alloc_capable check would
> 
> I think you mean the following code:
> 
>         if (cdp_enabled &&
> !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
> 
> mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = false;
> 
>         if (mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled &&
>             mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
> 
> mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
> 
> 
>> mean that we'd never be able to do that manipulation. resctrl doesn't
> 
> Does you mean that we enable CDP for L2 or L3, but not for MBA, which
> causes aclloc_capable to be cleared to hide MBA. Then, when we try to
> enable CDP for MBA, it gets intercepted by this newly added
> alloc_capable() check, resulting in the enabling process failing?

Yes

> 
> Sounds we should remove the alloc_capable().

If you mean the check for !alloc_capable, that this patch adds, then I
agree.

Thanks,

Ben

> 
>> call resctrl_arch_set_cdp_enabled() for the MBA resource but to be more
>> resilient the MPAM interface allows it.
> 
> Yes.
> 
>>
>> In the future, once we start adding more controls for resources we'll
>> have to be careful to do the cdp enabling and hiding of features at the
>> control level rather than the feature level.
> 
> I agree, in the future there will more control such as
> MBW_MAX、MBW_MIN、INTPRI、CMAX etc.
> 
>>
>> Thanks,
>>
>> Ben
>>
>>>
>>> Best regards,
>>> Jinjie
>>>
>>>>
>>>> int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
>>>> {
>>>>         struct rdt_hw_resource *hw_res = &rdt_resources_all[l];
>>>>
>>>>         if (!hw_res->r_resctrl.cdp_capable)
>>>>                 return -EINVAL;
>>>>
>>>>         :
>>>> }
>>>>
>>>>
>>>>>       /*
>>>>>        * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>>>>        * false on error and unmount.
>>>>
>>>> Thanks,
>>>> Gavin
>>>
>>
> 


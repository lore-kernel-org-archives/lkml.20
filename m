Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917185;
	b=CdebYDmxV4m7nzjmwcuZd09F0bS3ejFNTRt6wzBnNzksHS+7/cETcg1R0Z0mmSyKR65T
	 NQooWgXYkBbuMZWjn/wnXBaIY4tmjh7ENnp1DGhPnvNZAKhzoQOIi94w8cuELTvZNd/MG
	 iHcagAhXTqAYH2NFA3A3bugIcy4ro+TogSCTLfFOEIA971WZXWW1GgG+SyHeI2zDEQzIn
	 4EHAiAa+/BKwhjhLH4P/5A4QBrZScqaaO7N6hSFjyJWpL4lny0n8faemXoMND8jvxNdMN
	 UB0iLCBdyovcPLDgdLzjyCZ701OP+oG6ax1vEAQRrkjlKAYtCT5ZvIc5MiIAvY8D3gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917185;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=ezCv02AV+SxphL6JyP0juEoNENidSv9/iDZpEW3jODQ=;
	b=rP5pcsW2/MCqq95GbfCnEwEMXWuAqunufk7I1mMpYrHnmHXJOaEUXLmoaDXoCF+TXB69
	 pnPRIQRFSJNPUCEjhcIfyxokv8y2yQxgOlyXMP4+JfCegfjQed29YiRJGgJkfzmhgE7vt
	 j01tXdTdPXDrqXAm+cl1iw8EuFL4MshERQoiPtLDKe7Fe0o7DWlbmkkASk7jPeKuCzCdj
	 cjVvCKAA6B9P7VAYvXZfCuuPmlH2o4qOcixPLffRtMOpyb6qGnYawYFYChYqFkzOSlcTp
	 +WoPZXKOoXv+DEhfZjOIqXN1VTkvTxyU6eQxFXijGppkuME8R67DU90OwSCyRTxBp+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KgC550Oy;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443B7606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 443B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KgC550Oy
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ezCv02AV+SxphL6JyP0juEoNENidSv9/iDZpEW3jODQ=;
	b=KgC550OytW3A9NYWQ0vc1uMq3BoqDHhBnJKPjghKMaaHbzBiO+QqDY8fqpljOvIemmkS9X9sh
	xBY7pnsrGS2SiH45CZE4vDhuhXKVZZJTeAMzmKAxhHmcj/qMxkVJpB90Oortw5L2oZUmqny1bDU
	SeoBGJcDv5L7PhlZ6iPp7fI=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jTNjG1Nmfz1T4HC;
	Tue, 17 Nov 2026 20:05:38 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 953AF40561;
	Tue, 17 Nov 2026 20:06:16 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 20:06:15 +0800
Message-ID: <93a4ab7e-d016-42fb-a00b-1ed9ed75ae8d@huawei.com>
Date: Tue, 17 Nov 2026 20:06:09 +0800
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
Subject: Re: [PATCH v4 2/3] arm_mpam: resctrl: Only enable CDP on a resource
 that supports it
To: Ben Horgan <ben.horgan@arm.com>, Gavin Shan <gshan@redhat.com>,
	<james.morse@arm.com>, <reinette.chatre@intel.com>, <fenghuay@nvidia.com>,
	<zengheng4@huawei.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-3-ruanjinjie@huawei.com>
 <a783b375-7c27-4c91-b40e-7e615d33bc5b@redhat.com>
 <b1fd5fa8-bf03-4575-bc05-540a288b609d@huawei.com>
 <ce03205e-6405-4269-a061-266ef6d67e1d@arm.com>
 <f26828e6-e640-498f-81dc-d568f7cc50c7@huawei.com>
 <552e2119-f08c-4ec9-8c90-4be012a2d690@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <552e2119-f08c-4ec9-8c90-4be012a2d690@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/17 19:46, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 17/11/2026 11:41, Jinjie Ruan wrote:
>>
>>
>> 在 2026/11/17 18:35, Ben Horgan 写道:
>>> Hi Gavin, Jinjie,
>>
>> Hi Ben,
>>
>>>
>>> On 17/11/2026 03:31, Jinjie Ruan wrote:
>>>> Hi Gavin,
>>>>
>>>> 在 2026/11/13 7:42, Gavin Shan 写道:
>>>>> On 11/11/26 6:13 PM, Jinjie Ruan wrote:
>>>>>> resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
>>>>>> requested, even one that has no MPAM cache controls. Mounting resctrl
>>>>>> with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
>>>>>> the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
>>>>>> its CLOSID count at the number of PARTIDs. Control groups in the upper
>>>>>> half then map to PARTIDs beyond mpam_partid_max, which index past the
>>>>>> configuration and monitor arrays and program out of range PARTIDs into
>>>>>> the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
>>>>>> 2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
>>>>>> disabled.
>>>>>>
>>>>>> Do not enable CDP when a resource cannot allocate or is not CDP capable,
>>>>>> as x86 does, so the mount fails instead. Only the enable path is checked,
>>>>>> since unmount disables CDP on both cache levels to restore the MBA
>>>>>> control.
>>>>>>
>>>>>> A system where only MBA can allocate, or that only has monitors, now
>>>>>> fails a mount with CDP as well: CDP hides the MBA control because
>>>>>> mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.
>>>>>>
>>>>>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>>>>>> Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-
>>>>>> aa2c-3c90fab5853d
>>>>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>>>> Cc: <stable@vger.kernel.org> # 7.1+
>>>>>> ---
>>>>>>   drivers/resctrl/mpam_resctrl.c | 4 ++++
>>>>>>   1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>>>>>> mpam_resctrl.c
>>>>>> index 573617ba09df..afa3c084c475 100644
>>>>>> --- a/drivers/resctrl/mpam_resctrl.c
>>>>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>>>>> @@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum
>>>>>> resctrl_res_level rid, bool enable)
>>>>>>       if (enable && mpam_partid_max < 1)
>>>>>>           return -EINVAL;
>>>>>>   +    if (enable && (!
>>>>>> mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
>>>>>> +               !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
>>>>>> +        return -EINVAL;
>>>>>> +
>>>>>
>>>>> x86 only checks 'cdp_capable', so this check isn't exactly same as to
>>>>> what's
>>>>> done on x86, as claimed in the commit log?
>>>>
>>>> Sorry, the commit message is somewhat misleading and need updated.
>>>>
>>>> In my opinion, CDP is a feature related to resource allocation, and it
>>>> is always reasonable to check alloc_capable.
>>>
>>> Hmm, I know the patch came from my suggestion but I think the reason
>>> that x86 only checks cdp_capable is that alloc_capable is that the
>>> alloc_capable flag is also used to indicate that the resource is fully
>>> setup and can be used.
>>
>> Thank you for your explanation.
>>
>>>
>>> In resctrl_arch_set_cdp_enabled() we manipulate alloc_capable for
>>> re-enabling the MBA resource and the added !alloc_capable check would
>>
>> I think you mean the following code:
>>
>>         if (cdp_enabled &&
>> !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
>>
>> mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = false;
>>
>>         if (mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled &&
>>             mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
>>
>> mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>>
>>
>>> mean that we'd never be able to do that manipulation. resctrl doesn't
>>
>> Does you mean that we enable CDP for L2 or L3, but not for MBA, which
>> causes aclloc_capable to be cleared to hide MBA. Then, when we try to
>> enable CDP for MBA, it gets intercepted by this newly added
>> alloc_capable() check, resulting in the enabling process failing?
> 
> Yes
> 
>>
>> Sounds we should remove the alloc_capable().
> 
> If you mean the check for !alloc_capable, that this patch adds, then I
> agree.

Yes. That's exactly what it means, and it will fix this problem.

> 
> Thanks,
> 
> Ben
> 
>>
>>> call resctrl_arch_set_cdp_enabled() for the MBA resource but to be more
>>> resilient the MPAM interface allows it.
>>
>> Yes.
>>
>>>
>>> In the future, once we start adding more controls for resources we'll
>>> have to be careful to do the cdp enabling and hiding of features at the
>>> control level rather than the feature level.
>>
>> I agree, in the future there will more control such as
>> MBW_MAX、MBW_MIN、INTPRI、CMAX etc.
>>
>>>
>>> Thanks,
>>>
>>> Ben
>>>
>>>>
>>>> Best regards,
>>>> Jinjie
>>>>
>>>>>
>>>>> int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
>>>>> {
>>>>>         struct rdt_hw_resource *hw_res = &rdt_resources_all[l];
>>>>>
>>>>>         if (!hw_res->r_resctrl.cdp_capable)
>>>>>                 return -EINVAL;
>>>>>
>>>>>         :
>>>>> }
>>>>>
>>>>>
>>>>>>       /*
>>>>>>        * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>>>>>        * false on error and unmount.
>>>>>
>>>>> Thanks,
>>>>> Gavin
>>>>
>>>
>>
> 


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413488;
	b=unDsgAVjnF3pTk4xYvOtr6yeUf3Vih+S/tlDXT+juqRoJkCNTFkwzCgCOYvfGPGv/3dC
	 yK+yqe3QrN3rzyzzujeGID9SENHRW/x6r385RP2hEzhLTVozVCq0b+eToAnzuYgkQUQEK
	 QQOTMYaPaLWIs2E1VzpCpV8dbi1rPxjQmBjsyGdgOt/yLyKAJdu4LFXwOb2DW0YxrktYE
	 dAU2moUlOO41IAB1rPWHWN4W/9+/pzwqKzJiSAXnFCYgiUwrso3H8pLoE3hfsU0oMjB5L
	 Z0tibqR++PJXAtN1mUc1mk0+FzqYLr/JfmeECqQEb+LzYPWMtE/j/PQdmbUNOvc8YsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413488;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=nB4pM2ZJXpnwRA8pYcn66mc+0T+eg4LR6jSzacwN0sA=;
	b=O6qyplmw4XP5Stk9c9Mv2cAISMWHwmxM7wNgech4G8sjV0ptfJyF5u8j/GnFLhF943yG
	 7HJO6sN2KaHbLJITsNU3kku4AwoE+Mzd+FvXz/AmsKyCB6gGZPvGFTfaXqv0YecCsUmf8
	 Ifym+DBqIwBTe9wzVA8dj7USuifolF1GuStzX787VvmIoebFPyWslLlQn+XjCaHrVPS5p
	 B1kfqLw1wo+95/cVvtCDmEweFvTb9DxlH2V2TNcv3OMGIdIboGqShgRN3gTHe9DlpSxzz
	 aWRy0SmYkhceNS3TvG4XiKmzST8+xPK60BLTDu6Fmxk7JVaFaIPpvJVQprNt68POMfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=raUpYOFg;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAD1606A31A;
	Sat, 31 Oct 2026 02:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEAD1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=raUpYOFg
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nB4pM2ZJXpnwRA8pYcn66mc+0T+eg4LR6jSzacwN0sA=;
	b=raUpYOFgQh9voYZCcg/OdijcaqglHGfZZNxTVqJS0LCtBGqRCcsPX7o9pBhQCMBGH31u4wfgw
	Qjfi6WZmlQEhgM12bST5N2B2vkEcfU3HyItBP3p/jVOytsN7ALvwk7SZvmfNA7YywyBpTgjsnuY
	HzdvuTsz24yzs1NokF/AV48=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jGhcR0LV4zcZyQ;
	Sat, 31 Oct 2026 10:24:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DCCDF40538;
	Sat, 31 Oct 2026 10:24:41 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 10:24:40 +0800
Message-ID: <04b19a8f-72aa-4342-b5ec-a0bf8417b276@huawei.com>
Date: Sat, 31 Oct 2026 10:24:40 +0800
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
Subject: Re: [RFC PATCH v2 01/19] arm_mpam: resctrl: Leave CDP off when there
 are too few PARTIDs
To: Ben Horgan <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<james.morse@arm.com>, <fenghuay@nvidia.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <gshan@redhat.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <20261029123611.1108424-2-ruanjinjie@huawei.com>
 <bea9392d-a9d1-4683-ba2c-41139a1dca9d@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <bea9392d-a9d1-4683-ba2c-41139a1dca9d@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/31 0:38, Ben Horgan 写道:
> Hi Jinjie,
> 
> Thanks for this fix!
> 
> On 29/10/2026 12:35, Jinjie Ruan wrote:
>> Enabling CDP needs a second PARTID for the reserved closid.
> 
> I'm not sure what a 'reserved closid' is here but you could just say:

Hi Ben,


This means there are two copies: one for data and one for code.

> 
> Enabling CDP requires at least 2 PARTIDs.

OK.

> 
>> If firmware
>> reports too few PARTIDs, resctrl_arch_set_cdp_enabled() returns -EINVAL,
> 
> Not all systems are firmware backed. This can be:
> 
> If there are too few PARTIDs, ... .

Thank you! I will fix it.

> 
>> but only after it has recorded CDP as enabled, halved the monitor count
>> and turned off the mbw_max MBA control. 
> 
> 
>> resctrl then reports an error
>> and believes CDP is off, which leaves the two sides out of step and the
>> halved monitor count and the missing MBA control are not undone.
> 
> I think the 'reports an error part' can be dropped leaving 'resctrl then believes CDP is off...' as
> exactly what resctrl does is not important here.

Will update it.

> 
>>
>> Check the PARTID limit, and work out the CDP PARTIDs, before anything is
> 
> Why work out the CDP PARTIDs so early if they aren't going to be used?

Modified them together as a whole.

> 
>> changed so a failed enable has no effect.
>>
>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 20 ++++++++++++--------
>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 5468367776e2..886f0595d364 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -210,6 +210,18 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>  	if (enable)
>>  		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
>>  
>> +	/*
>> +	 * Check this before changing any state: if CDP can't be enabled the
>> +	 * caller must see CDP left off.
>> +	 */
> 
> I don't think this comment is needed. Failing early rather than failing late after some side effects
> have happened is clearly better.

Will delete it.

> 
>> +	if (enable) {
>> +		if (mpam_partid_max < 1)
>> +			return -EINVAL;
>> +
>> +		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
>> +		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
> 
> The partid_d/partid_i determination can stay below so it's close to the user.

Will put it back in its original place.

> 
> I think we can just have the check here:
> 
> if (enable && mpam_partid_max < 1)
>   	return -EINVAL;

That is fine.

> 
> Thanks,
> 
> Ben
> 
>> +	}
>> +
>>  	/*
>>  	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>  	 * false on error and unmount.
>> @@ -238,14 +250,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>  	if (!cdp_enabled && mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
>>  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>>  
>> -	if (enable) {
>> -		if (mpam_partid_max < 1)
>> -			return -EINVAL;
>> -
>> -		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
>> -		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
>> -	}
>> -
>>  	mpam_set_task_partid_pmg(current, partid_d, partid_i, 0, 0);
>>  	WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));
>>  
> 

-- 
Best regards,
Jinjie


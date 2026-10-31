Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793409823;
	b=pTpmNiWqZA0G2HHhgy2BrUHBqdivlL5Dr9H3XxzIf11MU5DuwjMeCTTVrjRLnbPdWtmR
	 JC5N/Ee2qGkcPfBTrMIamzYyvG5W90VjvMi1PiOxiFZPEiP89D6bi/9vqyjJjwibJYf/t
	 ITPniqIRpqw0sKoUQHgWeMAlSFXE/wYqytOWuSmHEZvLFjX/GW5rCISKETdB8AIo9ETWX
	 EfuK/WrKTWCNlbmBbIgS1FN3YBp9TiS2n6LzvGuAbPqPk2+dlawKA0sgsvlxBBYB4VXEh
	 Snm/ttcH8S4x9WTJmxfvfdXy7ZP1lQz9/vxWOzjJXpKC94sKSu34X7/tm7sQ7Z0uJgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793409823;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=/djHoVRSu8RS6DtnCiM+mYZz89TH0aYl6ButQAaM0Sk=;
	b=1mKXEZUrVsURLrec3phVE22HwED7GIGq7MzSogN5zoPEAubGVH+jKUUjV+pHyODSyZuD
	 SCPAJI7B6SVJlZcVTS/iGvEC2lGfO7KfvWj9XPSCfzz+TQIeKVqZDyuETYu1+PsqJhNQN
	 wVg9PTncjPLxO4jIHIL7EDLKf9ZtU1P+c8ahKM0vCabnLgg1c75OthRlxzc7OXdtvW2uu
	 U2mgAz/8L9TiCFJpxY0Ov4k+q0iicuPjZ9sJJZOkv8E8cikUuVNMmANF9v9EeO6fped56
	 qMlNAbh1yeCtFwtneu3RE3H+E450DfwUEtgvi768wMCePVilGOKBnYCaCnTlh5PLYug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F76606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33F76606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/djHoVRSu8RS6DtnCiM+mYZz89TH0aYl6ButQAaM0Sk=;
	b=KaajHLldyIp//h8hgNcWbRjuvnaPu9NU7xroCnhAHv5Y6IHpXKQj5MHAhFJIvtYDdexHrHDTV
	X/lStQJK1nuLHQ7Qdq9c8WJZXYgBrnDTioPNFDQfRt+fE/TbwnX7YO/Qqew85cDot6S8k4BzjBB
	JYcwaRE8bDH7Cnp1mpf99YQ=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jGgGF70qKznTXn;
	Sat, 31 Oct 2026 09:23:33 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 54D0540572;
	Sat, 31 Oct 2026 09:23:35 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 09:23:34 +0800
Message-ID: <96a7b9ca-a5da-449e-b4d7-c34299692012@huawei.com>
Date: Sat, 31 Oct 2026 09:23:33 +0800
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
Subject: Re: [PATCH v10 RESEND 05/15] arm_mpam: Don't stall MPAM enable when
 an MSC fails to probe
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<gshan@redhat.com>, <catalin.marinas@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-6-ruanjinjie@huawei.com>
 <c0fe8907-81e2-4bde-a5a4-193209946583@arm.com>
 <feb50fb6-b165-4fd2-95d9-c67cf3412ff8@huawei.com>
 <9c14a9c8-0ab6-4160-95e9-4242cfaa2a4b@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <9c14a9c8-0ab6-4160-95e9-4242cfaa2a4b@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/30 23:29, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 27/10/2026 01:47, Jinjie Ruan wrote:
>>
>>
>> 在 2026/10/26 22:49, Ben Horgan 写道:
>>> Hi Jinjie,
>>>
>>>
>>>
>>> On 20/10/2026 14:42, Jinjie Ruan wrote:
>>>> mpam_msc_drv_probe() registers the discovery cpuhp callbacks only when
>>>> the number of successfully probed MSCs reaches fw_num_msc. Every failure
>>>> path returns before the counter is incremented, and a failed probe is
>>>> final - the driver core does not retry. One failing MSC therefore leaves
>>>> the counter below fw_num_msc forever: the discovery callbacks are never
>>>> registered, mpam_enable() is never scheduled, and MPAM stays dead
>>>> system-wide - the resctrl filesystem is never registered, and no error
>>>> message hints at the cause.
>>>>
>>>> An MSC can legitimately fail to probe on an otherwise working system:
>>>> firmware may describe MSCs that are not accessible from any possible
>>>> CPU, e.g. when the possible CPUs are restricted with nr_cpus=. The MSCs
>>>> of the clipped CPUs then fail with "MSC is not accessible from any
>>>> CPU!", or their cache resources become unresolvable from PPTT.
>>>
>>> As the MPAM resources are system wide we need to query the support from each of the MSC to know what
>>> resources will end up. I do appreciate that if you have full control of your system then you can
>>> know this in advance but then you can also adjust your acpi tables to mark the non-accessible MSC as
>>> disabled. As such, I don't think changes such as this should be in the driver. Here is a previous
>>> explanation for a similar patch [1]
>>
>> Hi Ben,
>>
>> Does this mean that "nr_cpus=" and the MPAM enabling are mutually exclusive?
>>
>> I was previously doing experiments related to MB nodes and ran into a
>> failure of topology_matches_l3(). I therefore tried to reduce the number
>> of system CPUs from two clusters to one cluster using "nr_cpus=", but as
>> a result I ran into this problem, which prevented MPAM from being
>> enabled properly.
> 
> Yes, unfortunately this is expected behaviour.

Hi Ben,

Thanks for the explanation.

Perhaps we could add a comment in mpam_msc_drv_probe(), or clarify this
somewhere in the documentation—otherwise it can be quite confusing.

Thanks,
Jinjie

> 
> Thanks,
> 
> Ben
> 
>>
>>>
>>> Thanks,
>>>
>>> Ben
>>>
>>> [1] https://lore.kernel.org/lkml/59c21340-4e3d-4c48-9d9f-c0f78a023bac@arm.com/
>>>
>>>>
>>>> Count every completed probe, successful or not. Failed MSCs are not on
>>>> mpam_all_msc (either never added, or removed by mpam_msc_drv_remove()),
>>>> so the discovery path skips them naturally, and MPAM is enabled for the
>>>> surviving devices.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Cc: Ben Horgan <ben.horgan@arm.com>
>>>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>>>> Cc: Fenghua Yu <fenghuay@nvidia.com>
>>>> Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>> Fixes: f04046f2577a5 ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>> ---
>>>>  drivers/resctrl/mpam_devices.c | 26 ++++++++++++++++++--------
>>>>  1 file changed, 18 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>>> index 61cbc75625fa..a44d66a5733d 100644
>>>> --- a/drivers/resctrl/mpam_devices.c
>>>> +++ b/drivers/resctrl/mpam_devices.c
>>>> @@ -2120,21 +2120,31 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
>>>>  	msc = do_mpam_msc_drv_probe(pdev);
>>>>  	mutex_unlock(&mpam_list_lock);
>>>>  
>>>> -	if (IS_ERR(msc))
>>>> -		return PTR_ERR(msc);
>>>> +	if (IS_ERR(msc)) {
>>>> +		err = PTR_ERR(msc);
>>>> +		goto out;
>>>> +	}
>>>>  
>>>>  	/* Create RIS entries described by firmware */
>>>>  	err = acpi_mpam_parse_resources(msc, plat_data);
>>>> -	if (err) {
>>>> +	if (err)
>>>>  		mpam_msc_drv_remove(pdev);
>>>> -		return err;
>>>> -	}
>>>> -
>>>> -	if (atomic_add_return(1, &mpam_num_msc) == fw_num_msc)
>>>> +out:
>>>> +	/*
>>>> +	 * A failed MSC must not prevent MPAM being enabled for the
>>>> +	 * surviving devices. Firmware may describe MSCs that are not
>>>> +	 * accessible from any possible CPU, e.g. when the possible CPUs
>>>> +	 * were restricted by nr_cpus=. The failed device is not
>>>> +	 * re-probed, so count it here too: otherwise the counter never
>>>> +	 * reaches fw_num_msc, the discovery cpuhp callbacks are never
>>>> +	 * registered and mpam_enable() is never scheduled - MPAM stays
>>>> +	 * dead system-wide, without any error message.
>>>> +	 */
>>>> +	if (atomic_inc_return(&mpam_num_msc) == fw_num_msc)
>>>>  		mpam_register_cpuhp_callbacks(mpam_discovery_cpu_online, NULL,
>>>>  					      "mpam:drv_probe");
>>>>  
>>>> -	return 0;
>>>> +	return err;
>>>>  }
>>>>  
>>>>  static struct platform_driver mpam_msc_driver = {
>>>
>>
> 

-- 
Best regards,
Jinjie


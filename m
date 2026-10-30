Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374200;
	b=zKI3t58UBNm9NLdO7Vu+PNDdVaDmxFGgFoF9e9D2zJIVrBbeqVK0FZ9dnTvaOxUElqU2
	 fxuNcHX96kXECXhVzROQmj81u2Ug8wAOZwa6Ee0J3IGBVUaMw/dyl8o7NC85K5Bmxsp5B
	 Kv6sFvGCvMIKsHcYyaxeJLp+itDnkNdjTzCGFBArotnrh4TvFyuXQto0ZR8GJ0gIRguRb
	 pTSaLrpg7LFZ8MR6SzPaBHRse01Jtl1TQK07g8gMNQrpyrKi8Ux+QvVI6sU3GxbAAETdX
	 k4//0T1qnLIwKR4UPHPmV7cPb7Q2LvyVPUjJUWUuIf50dlAmIh5E7e9NH0Hdjnyesjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374200;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=SmNINiBiIGsA9lhj2zMVa0yBF/3dvdz6LFh4eij9kaA=;
	b=hEI4SnJkxEVwNwSYdFj0Ocb37AiXsWqSsd9AHK9lr0hTL5K+FQLc5TKn+QZXmWBbTj4c
	 vurUQFXFBYt6Zi2A65kGgM9Jkyf/qxtWvt+g/RGS69A1uoNWIoF+PQ/9mJm0sBd1oDhc+
	 +Fj0CuHDNRWSxkhA5oLYOwxM9OVybiKAytrq1d1f8Kd4qTlw5bN9cAc8O2H49pdHbt0gR
	 Oh5u86U/8iz98XxV5HjlP/sZ3eqyzW49n+AR32ndO+5WfB+b1ALsoVPaapEyaPLH9yrPn
	 +lNepwUlGRXaFWMwSwYIESEHXNQW45yNX9xA9lYlulNWo453mrNzv5OnSf4OMH3KJ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mntaebq5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB250606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB250606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mntaebq5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EB901682;
	Fri, 30 Oct 2026 08:29:55 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BBFD3F59E;
	Fri, 30 Oct 2026 08:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793374198; bh=mtJeZulPzz2Bupa9R2shs6RPCH/BGeFAS5AjnanhRHs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=mntaebq5YerpcjQlkpkbizZEVtnWxF67Y7wLjkh+exS/SWOKwrlLGT5ObQ3e6wath
	 OHqP5cKbs5HJ8fht0OzQibny4lmohm+wXyR9/WNCfeh8aFxs6okdIUwLiHp8risqsq
	 U80aVFsYgGILQ5U+aVZ/4luGL0KWV5PkCqlMz/Zk=
Message-ID: <9c14a9c8-0ab6-4160-95e9-4242cfaa2a4b@arm.com>
Date: Fri, 30 Oct 2026 15:29:54 +0000
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
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, zengheng4@huawei.com, jic23@kernel.org,
 gshan@redhat.com, catalin.marinas@arm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-6-ruanjinjie@huawei.com>
 <c0fe8907-81e2-4bde-a5a4-193209946583@arm.com>
 <feb50fb6-b165-4fd2-95d9-c67cf3412ff8@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <feb50fb6-b165-4fd2-95d9-c67cf3412ff8@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jinjie,

On 27/10/2026 01:47, Jinjie Ruan wrote:
> 
> 
> 在 2026/10/26 22:49, Ben Horgan 写道:
>> Hi Jinjie,
>>
>>
>>
>> On 20/10/2026 14:42, Jinjie Ruan wrote:
>>> mpam_msc_drv_probe() registers the discovery cpuhp callbacks only when
>>> the number of successfully probed MSCs reaches fw_num_msc. Every failure
>>> path returns before the counter is incremented, and a failed probe is
>>> final - the driver core does not retry. One failing MSC therefore leaves
>>> the counter below fw_num_msc forever: the discovery callbacks are never
>>> registered, mpam_enable() is never scheduled, and MPAM stays dead
>>> system-wide - the resctrl filesystem is never registered, and no error
>>> message hints at the cause.
>>>
>>> An MSC can legitimately fail to probe on an otherwise working system:
>>> firmware may describe MSCs that are not accessible from any possible
>>> CPU, e.g. when the possible CPUs are restricted with nr_cpus=. The MSCs
>>> of the clipped CPUs then fail with "MSC is not accessible from any
>>> CPU!", or their cache resources become unresolvable from PPTT.
>>
>> As the MPAM resources are system wide we need to query the support from each of the MSC to know what
>> resources will end up. I do appreciate that if you have full control of your system then you can
>> know this in advance but then you can also adjust your acpi tables to mark the non-accessible MSC as
>> disabled. As such, I don't think changes such as this should be in the driver. Here is a previous
>> explanation for a similar patch [1]
> 
> Hi Ben,
> 
> Does this mean that "nr_cpus=" and the MPAM enabling are mutually exclusive?
> 
> I was previously doing experiments related to MB nodes and ran into a
> failure of topology_matches_l3(). I therefore tried to reduce the number
> of system CPUs from two clusters to one cluster using "nr_cpus=", but as
> a result I ran into this problem, which prevented MPAM from being
> enabled properly.

Yes, unfortunately this is expected behaviour.

Thanks,

Ben

> 
>>
>> Thanks,
>>
>> Ben
>>
>> [1] https://lore.kernel.org/lkml/59c21340-4e3d-4c48-9d9f-c0f78a023bac@arm.com/
>>
>>>
>>> Count every completed probe, successful or not. Failed MSCs are not on
>>> mpam_all_msc (either never added, or removed by mpam_msc_drv_remove()),
>>> so the discovery path skips them naturally, and MPAM is enabled for the
>>> surviving devices.
>>>
>>> Cc: stable@vger.kernel.org
>>> Cc: Ben Horgan <ben.horgan@arm.com>
>>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>>> Cc: Fenghua Yu <fenghuay@nvidia.com>
>>> Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Fixes: f04046f2577a5 ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>>  drivers/resctrl/mpam_devices.c | 26 ++++++++++++++++++--------
>>>  1 file changed, 18 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 61cbc75625fa..a44d66a5733d 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -2120,21 +2120,31 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
>>>  	msc = do_mpam_msc_drv_probe(pdev);
>>>  	mutex_unlock(&mpam_list_lock);
>>>  
>>> -	if (IS_ERR(msc))
>>> -		return PTR_ERR(msc);
>>> +	if (IS_ERR(msc)) {
>>> +		err = PTR_ERR(msc);
>>> +		goto out;
>>> +	}
>>>  
>>>  	/* Create RIS entries described by firmware */
>>>  	err = acpi_mpam_parse_resources(msc, plat_data);
>>> -	if (err) {
>>> +	if (err)
>>>  		mpam_msc_drv_remove(pdev);
>>> -		return err;
>>> -	}
>>> -
>>> -	if (atomic_add_return(1, &mpam_num_msc) == fw_num_msc)
>>> +out:
>>> +	/*
>>> +	 * A failed MSC must not prevent MPAM being enabled for the
>>> +	 * surviving devices. Firmware may describe MSCs that are not
>>> +	 * accessible from any possible CPU, e.g. when the possible CPUs
>>> +	 * were restricted by nr_cpus=. The failed device is not
>>> +	 * re-probed, so count it here too: otherwise the counter never
>>> +	 * reaches fw_num_msc, the discovery cpuhp callbacks are never
>>> +	 * registered and mpam_enable() is never scheduled - MPAM stays
>>> +	 * dead system-wide, without any error message.
>>> +	 */
>>> +	if (atomic_inc_return(&mpam_num_msc) == fw_num_msc)
>>>  		mpam_register_cpuhp_callbacks(mpam_discovery_cpu_online, NULL,
>>>  					      "mpam:drv_probe");
>>>  
>>> -	return 0;
>>> +	return err;
>>>  }
>>>  
>>>  static struct platform_driver mpam_msc_driver = {
>>
> 


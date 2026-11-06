Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964854;
	b=PxEMeqvFUfempPJIjswh9PYwLACUZHrokU4nX5Tu215LV48MvHbUh0lmdJABsC8MUmNW
	 snQXhxMI0cHyU5cAYMbtQ9ty1ZIo4g1vczYZ0JZbhABYgZbYiiZIqq29xVh3tvbLH/pgk
	 NusCGgTxUgF5S7T3VwXu/r3J5H31DZH3xPoAmh+fYdPq5ExoRDIeeLEPHci2ch1ULoOzS
	 TT/qQoj46wVKwJnNEJwqhBSz/fqg7igPGToupY1eBl/kFi2Uiurs0nxBs/LhywQjDjRxs
	 7WN8GV0Eb3p8Y53wEUUN3E8chRFEOYjhlwRKXf8QJaW+/SiYcU1gCWpVU3RWNdabDfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964854;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=m4lF2/XuKMfflorAS4FpKA2jURN3iNgNsii92DPWyV4=;
	b=29SwWnTHrHMfZG6SEzKmTOHS6fZINmF+5awpvezKyeZuk8q4p3Kt+Z5+CD9vv9JDxdGx
	 f9y0knUmLjGA0qRWXmCQO/WHY1u4K21yKRZLjb3aWltbSs2gllPUkWix+d3SibkDjIz7k
	 kRhsnowXLdjSUNQQARNrCTObixBW2MDtPDnh1NxBj/K5Z78/COOj95nShzAjSZSvZ7ndu
	 11tzOSfryGt+cY8sxgO0cYJ1svWwUO8vhALlkVQotm0heCwQRfk49VeW9BeO9yWWDkNxr
	 mgD3MUwiRxXw7bGiecA7R2s6ADUT8wb912A+Ipf7kZwCB1wlgCH0E1VGNAMohBm5obw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GAhCsZSy;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D94606DA6F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D94606DA6F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GAhCsZSy
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 151CB1650;
	Fri,  6 Nov 2026 03:34:09 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D37123F628;
	Fri,  6 Nov 2026 03:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793964852; bh=UHA5Gw+4nGvemIa8Jm4k3hEWeaWcD8r7XN1xBzWLsoU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=GAhCsZSyX16VyZmLm9E+aAHhAEzixi2JQzeXsPLTYJPXqWK0nXkqIewDyR12LOUyQ
	 rIFP8DTWaR1yrLrhgFiuYmBFz7NYWsOQV+dX83DksixEnBqhu2q+xVWnMR0/wCH/Mo
	 rWpPaKTyVbBAG5IuHRtDhyDojgPGan1KKe+JOufs=
Message-ID: <fd20a317-1f3c-43bf-b629-587877cf9503@arm.com>
Date: Fri, 6 Nov 2026 11:34:09 +0000
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
Subject: Re: [PATCH] arm_mpam: resctrl: Leave CDP off when there are too few
 PARTIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, tan.shaopeng@jp.fujitsu.com,
 jic23@kernel.org, zengheng4@huawei.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031025257.1540228-1-ruanjinjie@huawei.com>
 <750c9d05-94f8-4936-a824-5ccbed1d13ed@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <750c9d05-94f8-4936-a824-5ccbed1d13ed@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jinjie,

On 06/11/2026 08:35, Jinjie Ruan wrote:
> Hi Ben,
> 
> Is this modification okay?

Yes it's ok but there is more we can do here. Sashiko has raised a bug that points out we don't take
into account whether or not a resource is cdp_capable or not [1].

This leads to an additional check along the lines of:

if (enable && (!the_res.alloc_capable || !the_res.cdp_capable))
    return -EINVAL;

On a process note, it would helpful to me for reviewing and later on when collecting the patches
together if you could put related patches together in a series. In the case of this patch it it is
solving a cdp related problem, as is your patch "arm_mpam: resctrl: Limit num_rmids to the CLOSIDs
in use". fs/resctrl patches though should be kept separately unless there is a particular reason why
they should be in a series with MPAM patches, e.g. new resctrl_arch_ helpers and such like.

[1] https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-aa2c-3c90fab5853d

Thanks,

Ben

> 
> 在 2026/10/31 10:52, Jinjie Ruan 写道:
>> Enabling CDP requires at least 2 PARTIDs. If there are too few PARTIDs,
>> resctrl_arch_set_cdp_enabled() returns -EINVAL, but only after it has
>> recorded CDP as enabled, halved the monitor count and turned off the
>> mbw_max MBA control. resctrl then believes CDP is off, which leaves the
>> two sides out of step and the halved monitor count and the missing MBA
>> control are not undone.
>>
>> Check the PARTID limit before anything is changed so a failed enable has
>> no effect.
>>
>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> RFC v2 -> v1:
>> - Check mpam_partid_max ahead and The partid_d/partid_i determination
>>   remains in place.
>> - Update the commit message as Ben suggested.
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 5468367776e2..aa3b3a093857 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -210,6 +210,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>  	if (enable)
>>  		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
>>  
>> +	if (enable && mpam_partid_max < 1)
>> +		return -EINVAL;
>> +
>>  	/*
>>  	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>  	 * false on error and unmount.
>> @@ -239,9 +242,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>>  
>>  	if (enable) {
>> -		if (mpam_partid_max < 1)
>> -			return -EINVAL;
>> -
>>  		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
>>  		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
>>  	}
> 


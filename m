Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911756;
	b=fymxLyrOmPPrqybRudiLz2PRdoFq0h2+n44/JbgHbc+EHLL7i12H3yIX2sWsohyYhUUl
	 kqYDDC/5fBloIWIEtZywAQBt+TQpEK8DsLlC8A3db/ntupA+H7fJnQbAD5VTi2DFPMo2n
	 Euhm1Z81MF661ClN1AeT4hXVPoC8ejHlFZEOksfVEIzbrHnrZUxKxodNkmD974yqezK/6
	 lxKKweWstC0maA3wQmybvSzEKqv/iMjSSlABrG/PTyJ55DyZp5m4fY8L9KVtoE8leZ1CG
	 OdJZ3GbAFu0W5wxVBKonM4LwXmcrcbSvzeUoqhZa5s23I9S2VWTUdr7vrqL3DUC4bNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911756;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CUBa3JrKm9epugz/h6AhQXjaE++SEn+EIH8O82h1Ucg=;
	b=sU7MN8CkG4WYL11DDA7u79kygAgkukY+TfSUgzEcYaf/y4e/o++evSkHWHsPu8OtWrsC
	 WOAjs8wbyFF+/FDrkts3zwRB6Wy38KPXgB9d+8YBWJGwJ7luBvdE7bJg6E/Q1t0GkV9Jd
	 iKCAFX1nD5O2m9FRj1MMZcdz3l8lqQtHTAzyUOiuAVixTzajGu7Ws01biHn1pT+J7jFaz
	 MEwAK1OBqDNDRknNDk2rYm9DAHz8JytPLuYfa9L8LnX+Gjfdwgv8xe0/PxmvqAKE1o9On
	 PYbkK3AEd+g39oMkFLvDQQqJFDYOlpJXkKFM0GtcV9F+wRmtAZuqbrZ4MQoeK5CxvIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=swNs1Ok3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807E6606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807E6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=swNs1Ok3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 845C41476;
	Tue, 17 Nov 2026 02:35:51 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.17.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E69C3F763;
	Tue, 17 Nov 2026 02:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794911754; bh=sGpkum0bjez5dkPBVcc56aaH2V4M3Z/8iWCyxbdcqTc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=swNs1Ok3HM52gv4LK+pUD5QC0FAfKmdNAXJPkgcOotFJ2MjQfYfidCUeXHthlXj9L
	 faVlRdxjzI5TEMMx9DTxa7TGMEPRRyFK2b8E5qjm5J1xTzmqhWpF+cozMhgov7uN0F
	 3h3lykE2a3pQ0gElfqlX9VKEhH+kSYZRFZnrPGDk=
Message-ID: <ce03205e-6405-4269-a061-266ef6d67e1d@arm.com>
Date: Tue, 17 Nov 2026 10:35:50 +0000
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
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <b1fd5fa8-bf03-4575-bc05-540a288b609d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gavin, Jinjie,

On 17/11/2026 03:31, Jinjie Ruan wrote:
> Hi Gavin,
> 
> 在 2026/11/13 7:42, Gavin Shan 写道:
>> On 11/11/26 6:13 PM, Jinjie Ruan wrote:
>>> resctrl_arch_set_cdp_enabled() enables CDP for any cache level that is
>>> requested, even one that has no MPAM cache controls. Mounting resctrl
>>> with -o cdpl2 when only L3 can allocate still turns CDP emulation on for
>>> the whole system, so every CLOSID takes two PARTIDs while resctrl keeps
>>> its CLOSID count at the number of PARTIDs. Control groups in the upper
>>> half then map to PARTIDs beyond mpam_partid_max, which index past the
>>> configuration and monitor arrays and program out of range PARTIDs into
>>> the MSCs. On QEMU with 5 PARTIDs the first monitor read after creating
>>> 2 control groups raises MSMONCFG_ID_RANGE for PARTID 5, and MPAM is
>>> disabled.
>>>
>>> Do not enable CDP when a resource cannot allocate or is not CDP capable,
>>> as x86 does, so the mount fails instead. Only the enable path is checked,
>>> since unmount disables CDP on both cache levels to restore the MBA
>>> control.
>>>
>>> A system where only MBA can allocate, or that only has monitors, now
>>> fails a mount with CDP as well: CDP hides the MBA control because
>>> mbw_max is a per-PARTID maximum, leaving nothing for CDP to apply to.
>>>
>>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>>> Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-
>>> aa2c-3c90fab5853d
>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> Cc: <stable@vger.kernel.org> # 7.1+
>>> ---
>>>   drivers/resctrl/mpam_resctrl.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>>> mpam_resctrl.c
>>> index 573617ba09df..afa3c084c475 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -222,6 +222,10 @@ int resctrl_arch_set_cdp_enabled(enum
>>> resctrl_res_level rid, bool enable)
>>>       if (enable && mpam_partid_max < 1)
>>>           return -EINVAL;
>>>   +    if (enable && (!
>>> mpam_resctrl_controls[rid].resctrl_res.alloc_capable ||
>>> +               !mpam_resctrl_controls[rid].resctrl_res.cdp_capable))
>>> +        return -EINVAL;
>>> +
>>
>> x86 only checks 'cdp_capable', so this check isn't exactly same as to
>> what's
>> done on x86, as claimed in the commit log?
> 
> Sorry, the commit message is somewhat misleading and need updated.
> 
> In my opinion, CDP is a feature related to resource allocation, and it
> is always reasonable to check alloc_capable.

Hmm, I know the patch came from my suggestion but I think the reason
that x86 only checks cdp_capable is that alloc_capable is that the
alloc_capable flag is also used to indicate that the resource is fully
setup and can be used.

In resctrl_arch_set_cdp_enabled() we manipulate alloc_capable for
re-enabling the MBA resource and the added !alloc_capable check would
mean that we'd never be able to do that manipulation. resctrl doesn't
call resctrl_arch_set_cdp_enabled() for the MBA resource but to be more
resilient the MPAM interface allows it.

In the future, once we start adding more controls for resources we'll
have to be careful to do the cdp enabling and hiding of features at the
control level rather than the feature level.

Thanks,

Ben

> 
> Best regards,
> Jinjie
> 
>>
>> int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
>> {
>>         struct rdt_hw_resource *hw_res = &rdt_resources_all[l];
>>
>>         if (!hw_res->r_resctrl.cdp_capable)
>>                 return -EINVAL;
>>
>>         :
>> }
>>
>>
>>>       /*
>>>        * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>>        * false on error and unmount.
>>
>> Thanks,
>> Gavin
> 


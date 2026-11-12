Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479605;
	b=VQLzBoEvP4Oo4MKCFBSO0qXA0Z3wsMpCk6Zirg0aN7mzdIa5UnRkJ+OEdkh6H107S1IP
	 0GkMYwgH2KXG4LbAKctrzB/8VeGX+L/QtXDMlYgA9fcg2KWzxaNIAolM3K+7SUuk1IC4E
	 hka0G38P9eylf5YZhZEDKDNLfh/NQWH5xhrPSHxHRlKN/LOvXWF9nkYcSUlAPH9a3cbYm
	 ksqbrJa6VcMwQat5iJBBtjsDmhJ4O0F4W7KUVmgTXGrIrsv6sN4B3JH5p2b64vEnCqBOk
	 0In4VtvJdBaO2tz8Ily7bly1xWHZye7SE8q4kmUDD0G6U30wd9tJHIirCerNhTWBmzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479605;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bUP3NtMygj44XOC9NIS0tz33TI6f+ov6Dat/ckuHzGw=;
	b=sL9MW4bOo6muWe5VIQW4sQ8+UnINEN8h1/QRcAZDCuTqAd718zdTOFN3C+0t+rMRKzEA
	 JJC3eoEXHogRTM9yZ4lg33MkIsrDRR0R023cG+8dxfywFuY5yooSUIVBhK3JyqjSVWkeT
	 63lwqxySq3YVQt6f+nrQd2qpWYBF5dwQyJN5KsBVbww0UZgPEMuYWKAdLf2tjYtG67WEy
	 RoRu87rgHWBtYp/sdn8uaf7h5PmJCNNaQRZE4J9FjL0UioKE+ag79XT/zOh21Ar6VWPJC
	 GWblAeSkcrUV+3mwD8YWEFbBwyRhR9fLcYpxcYkEbNZZL0+PSMz9+zhPGuSe+jKkNEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lybmBeWp;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83415606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83415606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lybmBeWp
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D4FB153B;
	Thu, 12 Nov 2026 02:33:20 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.14.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9E6D3F673;
	Thu, 12 Nov 2026 02:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794479603; bh=rHpte5JUHErycSmpZgoWPKziiNyMTSiJNyaOEd0FNZE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=lybmBeWpD5Cs4KIWrf2IXqDog8y7zyiMqMcD7tCwYrrXCUeI7YiELTfzyZdOs6j+P
	 1wo0yJPYQHKueylGSsFlVAI+Jcn56O/017JSIsd3BS0PXfrWzZCB101VuHRIi6SbBx
	 q45FBU2JQZrjcW/dDaWq4UwFmF3busLwl2JDUlLA=
Message-ID: <e96561c9-2c25-4bd6-b57d-2355cb850906@arm.com>
Date: Thu, 12 Nov 2026 10:33:20 +0000
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
Subject: Re: [PATCH] fs/resctrl: Report why a schemata write failed
To: Reinette Chatre <reinette.chatre@intel.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 tglx@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20261104102304.703535-1-ruanjinjie@huawei.com>
 <0bece210-cd99-4f4c-83cc-c58b59b7ebec@intel.com>
 <5e6fc827-d5ca-4e72-ab8b-3ad63d530c19@huawei.com>
 <0a2b0685-ed32-4e7a-b724-1b5be075ca19@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <0a2b0685-ed32-4e7a-b724-1b5be075ca19@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jinjie, Reinette,

On 05/11/2026 15:58, Reinette Chatre wrote:
> Hi Jinjie,
> 
> On 11/5/26 12:32 AM, Jinjie Ruan wrote:
>> 在 2026/11/5 3:18, Reinette Chatre 写道:
>>> On 11/4/26 2:23 AM, Jinjie Ruan wrote:
> ...
> 
>>>> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
>>>> index cafebdff70dc..cfb59cbc4135 100644
>>>> --- a/fs/resctrl/ctrlmondata.c
>>>> +++ b/fs/resctrl/ctrlmondata.c
>>>> @@ -367,8 +367,11 @@ ssize_t rdtgroup_schemata_write(struct kernfs_open_file *of,
>>>>  			continue;
>>>>  
>>>>  		ret = resctrl_arch_update_domains(r, rdtgrp->closid);
>>>> -		if (ret)
>>>> +		if (ret) {
>>>> +			rdt_last_cmd_printf("%s: failed to update the domains: %pe\n",
>>>> +					    r->name, ERR_PTR(ret));
>>>
>>> Please instead display the schema name (s->name) to user space as that is the name
>>> that the user use to interact with the schemata file. 
>>> Is it necessary to print error code again? This is the same error returned to
>>> user space, no?
>>>
>>> I do not know what resctrl fs can claim here about hardware state - could such
>>> a write then partially succeed on MPAM side? If so, best fs can display may be
>>> something like "failed to update all domains". If so, could user space follow this
>>> with a read of schemata file to see which domains failed? User may want to retry
>>> in such scenario ... but back to earlier question, this sounds like a permanent
>>> failure (until CPUs are back online) when attempting to make domain configuration
>>> changes that does not sound right here.
>>
>> There are some cases not permanent:
>>
>> - PCC/MPAM-Fb MSC returns -EIO in case of protocol errors or timeouts
>> （mpam_fb_send_request() or smp_call_on_cpu()）;
>>
>> - -EINVAL when the calculated PARTID is out of bounds
>> (resctrl_arch_update_one()).
>>
>> Both will roll back and retry after the cause is resolved will succeed.
> 
> Could you please provide more detail about the above "roll back and retry"? 
> 
> I am trying to view this from user space side. The "PARTID is out of bounds"
> sounds like a bug in the "should never happen" category. I am not familiar
> with everything that can fall into the "protocol errors or timeouts"  bucket.
> Would it be worthwhile for user to try again when these are encountered?
> Could "-EBUSY" be more appropriate to help user know when it is worthwhile
> to retry? If it is not possible to retry, does that mean a permanent failure
> for which the domain should rather be removed to prevent user from encountering
> the same issue over and over?

Any MPAM-Fb error is considered unrecoverable and triggers a disable of
MPAM. (The same response as to an MPAM error interrupt.) This in turn
disables resctrl on that system. Errors are still reported to resctrl so
that the user doesn't see success for an action even if any subsequent
action will fail. This policy may be revisited, in the future, if we
encounter systems where there are recoverable MPAM-Fb errors that are
actually seen to happen. The first line of defense would be a retry
within the MPAM driver and then if that is insufficent reporting a
timeout to the user.

As it stands I don't think the user will have time after a MPAM-Fb
failure to read the last_cmd_status before the resctrl filesystem is
torn down.

Thanks,

Ben

> 
>>
>> I verified these error cases using fault inject for mpam_touch_msc().
>>
> Thank you very much for all this testing.
> 
> Reinette
> 
> 


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707643;
	b=ZwrvyiDmJwx4tvu+rgugcPoosViH8ii0EylSiVs+Wb6Ph2oTlxXqgZhhSnGKsSqrPUpo
	 EKDpRJ8W/kqszRJIDsjpQbc+fw8gdOvlRqclKZaGplIgP/7rdlPihvAjWo3v0t6lV9FLQ
	 2pEgZ94sNFrGWYRsD6k+EqcbdxPWrDPPDyAhS0am6j6PmjGPQ14/sMV4ZUPbkXPgBCZuf
	 begI4aTEqQCUgYG7iRWRUmEWVvfGg4UAo13/hIuwNJj8dINkKj3SpeaxdOYsKOYK3bKF0
	 kJsuF/CRYOYXo83C51EZu3Gp4l0Ag0GG3I7GkqexD5Nmv4Brb6pBKEpOGytYroYfHCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707643;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=K8uqNkscU2FaIG6RYZND7pIcUqrKGFhzzR5p/SFA9v8=;
	b=LR9cI+zPRiydPvWlem4i6Rc4zo2pyBRR9+mfp+n8lJrCBf3Sby9dEFTL2wP4b76PjeL0
	 m2ys8xDVGeyguuuCV96BU+FtaQa59U7J/XgpI/0hThOC+6L02joaD3KBSSkBA5EC/eJC4
	 YERrBbTHUQw7PkZtADjvXdLZHPfBYDoQUkD4DEhLOMSRWSak0qJA1juxPepZqm2epXiqB
	 KaQ/WtrCw9EPEKKmibdJTJNLMvIXhFKOEsVcOXmcQdzWVYj77fjawdBFDWWsIAXySc3Vk
	 ++kV2mLB1Kybo2DS6Kq2aZrQOdQtE/kUZVlh+Op9kMTpU2sFgK70Iw/+e/9C9U3pVZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q0eV2EAe;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36DA606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F36DA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q0eV2EAe
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F1771576;
	Tue,  3 Nov 2026 04:07:19 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E9A73F628;
	Tue,  3 Nov 2026 04:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793707642; bh=hK3MN8TjrLMaZdqoM0PJM7e6NcVLgSyCjM0vuw9G/qQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Q0eV2EAeRupgMHORXMSxr3KrXESrjGCpzcUjICXBElHUz/1yufnig1vswQRSuIN6u
	 quxTZMg7oD77u9fQYRzIKIedoKjhaCqnnzukj7Ygqa93NnetNuM93mBVE0jAoJ+dZO
	 qjatw0lYOrLm+OJuL3ydYTzabuIU8xO3m16apqI8=
Message-ID: <a9cb3133-34b0-4e96-aeb2-9c56851ae419@arm.com>
Date: Tue, 3 Nov 2026 12:07:18 +0000
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
Subject: Re: [PATCH] fs/resctrl: Fix CLOSID propagation when reparenting
 monitor groups
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, peternewman@google.com, bp@alien8.de, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261031101052.1692230-1-ruanjinjie@huawei.com>
 <3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com>
 <e2ed5936-205a-4976-8bf1-5fde2621cd55@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <e2ed5936-205a-4976-8bf1-5fde2621cd55@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jinjie,

On 03/11/2026 03:34, Jinjie Ruan wrote:
> 
> 
> 在 2026/11/2 22:46, Ben Horgan 写道:
>> Hi Jinjie,
>>
>> On 31/10/2026 10:10, Jinjie Ruan wrote:
>>> Renaming a monitor group to move it below a different control group
>>> changes the CLOSID of every task in that monitor group. mongrp_reparent()
>>> updates rdtgrp->mon.parent and rdtgrp->closid before calling
>>> rdt_move_group_tasks() to propagate the new CLOSID to the tasks.
>>>
>>> rdt_move_group_tasks() uses its first argument to identify the tasks to
>>> move. For a monitor group this is is_rmid_match(), which on MPAM compares
>>> both the PARTID and the PMG of the task with the parent control group's
>>> CLOSID and the monitor group's RMID. After rdtgrp->mon.parent and
>>> rdtgrp->closid have been updated, the match uses the new CLOSID, so no
>>> task in the monitor group matches and none is moved. The tasks keep the
>>> old PARTID and continue to use the old control group's allocation.
>>
>> Ah, that's pretty broken.
> 
> Hi Ben,
> 
> You are right! I found several issues about this with mpam.
> 
>>
>> I was previously under the impression that moving monitor groups on MPAM systems was not permitted
>> as the monitor bandwidth counters are required to be always running and so would glitch when moved.
> 
> Got it. Then this operation should indeed be forbidden. Unfortunately,
> in practice it hasn't been forbidden yet.
> 
>> Peter Newman posted a patch in 2024 which added this restriction [1] but it didn't reach upstream.
>> As, the moving of monitor groups is already broken for MPAM systems I think it would be ok to forbid
>> them.
> 
> Should I pick it up and rebased on v7.4-rc1 and send out it again?

That makes sense to me. So, yes please.

Thanks,

Ben

> 
>>
>> [1] https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
>>
>> Thanks,
>>
>> Ben
>>
>>>
>>> x86 matches on the RMID alone, so it is unaffected. Now only arm64 mpam
>>> affected.
>>>
>>> Save the monitor group state before it is modified and use the saved state
>>> as the source of the task move. The updated group remains the destination,
>>> so matching tasks are moved to the new CLOSID and RMID.
>>>
>>> Fixes: 8da2b938eb7e ("x86/resctrl: Implement rename op for mon groups")
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> Cc: stable@vger.kernel.org # 7.1.x
>>> ---
>>>  fs/resctrl/rdtgroup.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>>> index 57ab090072c2..33b23b59a6de 100644
>>> --- a/fs/resctrl/rdtgroup.c
>>> +++ b/fs/resctrl/rdtgroup.c
>>> @@ -4322,6 +4322,7 @@ static void mongrp_reparent(struct rdtgroup *rdtgrp,
>>>  			    cpumask_var_t cpus)
>>>  {
>>>  	struct rdtgroup *prdtgrp = rdtgrp->mon.parent;
>>> +	struct rdtgroup old_rdtgrp = *rdtgrp;
>>>  
>>>  	WARN_ON(rdtgrp->type != RDTMON_GROUP);
>>>  	WARN_ON(new_prdtgrp->type != RDTCTRL_GROUP);
>>> @@ -4338,7 +4339,7 @@ static void mongrp_reparent(struct rdtgroup *rdtgrp,
>>>  	rdtgrp->closid = new_prdtgrp->closid;
>>>  
>>>  	/* Propagate updated closid to all tasks in this group. */
>>> -	rdt_move_group_tasks(rdtgrp, rdtgrp, cpus);
>>> +	rdt_move_group_tasks(&old_rdtgrp, rdtgrp, cpus);
>>>  
>>>  	update_closid_rmid(cpus, NULL);
>>>  }
>>
> 


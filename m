Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316344;
	b=CLxMcT0wgHjAjBoiQD4D1ozuVFBszniO0o0VccIJs9awKefrusYOp7XbqIdpBre/CTaM
	 Ohx/dD7mnlnbpg8LsQ5sRkO8rpyqyH7GXyrCI1n8TAg1KbDDS3tTtBh8Mbo0hRT09k/Iw
	 7D9dH1i3TwC6KZYrdnk/PqR8wyU+Sp48jf06KeiK1jEoUALOa3SRiMF2oJBqXlU3sCM+Y
	 vh6OM1UIlGWm7dNRcMgckkQDt+xGQBb/lUlfoCA8llucMA7unhA1JsTqH9zuwSlkOd0ia
	 Z9qbie/rEHiwfsIMGGPg2JYbhmLfbBtdDXA9j6ZytX6lzwcBQUuiurZ2EPV982E+qFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316344;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=S2nIw72/QWiJcD7z728q9oZI514NbA30jujduMfr80o=;
	b=c/pI6YeT/9tnHoQGaVuLDBbBLRJJ3n+5ijzhuUnjbridZmtgR1rbZRAibEgb5hBTBJss
	 HClqIFoBr1/cacBcnF6Tx41OFnvtb+gNMYgHkR1XgkWKmT7pElRMNKJvaI9eIKFUWzwnP
	 eYjmg/8KavcI26KzZ0BAtfUWLYL4k8GBeZHsbVJoFql0VrmFS9Fm4EMsDrFZGjPAh1dnt
	 LXJUkRHGCWGYwErOJ5zTZCywDt4Oh9ctFoNDiiVeDFOPp1qp4EctOtQngm1bNCbkW8WGp
	 we8QJgLRDHjLmpYa7CEXedPUW0oqVrCHbNy4g8lwivVM4v1UfovkNtSOIvvZweAy+vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="Y0/ih938";
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6CD606B6DE;
	Tue, 10 Nov 2026 13:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A6CD606B6DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Y0/ih938
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=S2nIw72/QWiJcD7z728q9oZI514NbA30jujduMfr80o=;
	b=Y0/ih938SBhWdy8NR5Dsd4/4u1sxJ4uY1ua38n9xF7DKPyhjG8dk1bPFmRBH4dmKPDrLWScyM
	visal89sw93DF0TrBZEOizRnv413SjR+hXqoy1J05Wr6YSdSpc8FD5Kmyzsfno5Czk5CfPSV9IZ
	9bkKiggwBlRZ5h+yFLG78Po=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jP6W36VDCz1cyRv;
	Tue, 10 Nov 2026 21:11:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DBECE4055B;
	Tue, 10 Nov 2026 21:12:14 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:12:14 +0800
Message-ID: <24a3bf90-48bc-4594-a242-a8f72f05edee@huawei.com>
Date: Tue, 10 Nov 2026 21:12:13 +0800
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
Subject: Re: [PATCH v2] fs/resctrl: Disallow monitor group rename when the
 RMID changes
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<zengheng4@huawei.com>, <ben.horgan@arm.com>, <gshan@redhat.com>,
	<jic23@kernel.org>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20261105123524.2282090-1-ruanjinjie@huawei.com>
 <f7eb6666-049f-4739-966f-b4ba275c72df@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <f7eb6666-049f-4739-966f-b4ba275c72df@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/10 3:22, Reinette Chatre 写道:
> Hi Jinjie,

Hi Reinette，

> 
> Thank you very much for picking this fix up.
> 
> For the subject, since the RMID actually never changes, could it instead be:
> 	fs/resctrl: Disallow monitor group rename when the RMID index changes
> 
> On 11/5/26 4:35 AM, Jinjie Ruan wrote:
>> From: Peter Newman <peternewman@google.com>
>>
>> A monitor group can be renamed into the mon_groups directory of another
> 
> "renamed" -> "moved"?

Ok.

> 
> (Since this patch would still support rename of MPAM monitor groups.)

Right!

> 
>> control group to move its tasks to that control group's allocation
>> while keeping their monitoring data. Where the RMID is only meaningful
>> together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
>> extends the PARTID, this move does not work. The rename succeeds, but:
>>
>> - The group's monitoring data is reset. Its counters are identified by
>>   the CLOSID and RMID together, so after the move the group reads the
>>   counters of the new CLOSID instead of the ones its tasks used.
> 
> Does this not also mean that the the monitor group is assigned an RMID
> index that is never allocated to it? Sounds like this would cause issues
> when the monitor group is removed and resctrl tries to free that RMID.

Yes, will mention it.

> 
>>
>> - The tasks are not moved. mongrp_reparent() sets the new parent and
>>   CLOSID of the group before rdt_move_group_tasks() looks for the tasks
>>   to update, and the search then matches on the new CLOSID, which none
>>   of the tasks carries yet. The tasks keep the old CLOSID and the old
>>   control group's allocation, and the group does not count them.
>>
>> The move has never worked on these systems, so rejecting it does not
>> take away behavior that an existing user can rely on.
> 
> Could this snippet please instead motivate why the issues with monitor
> group move are not/cannot be fixed to help explain why this reject
> is needed instead?

Sure.

> 
>>
>> Reject the move with -EOPNOTSUPP when it changes the RMID index of the
>> group, and document the restriction in resctrl.rst. Where the RMID does
>> not depend on the CLOSID, such as on x86, the move keeps the same index
>> and is still allowed.
> 
> 
>>
>> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
>> Signed-off-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.1.x
> 
> Looks like 3e9b35823aab was added in 7.1 so the range is not needed?
> 
>> Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
>> Link: https://lore.kernel.org/lkml/20261031101052.1692230-1-ruanjinjie@huawei.com/
> 
> The changelog contains no references to these Link: entries? What are they for?
> Looks like first is an earlier version of the patch so does not look to be needed
> as part of permanent changelog related to this patch?

Will remove it. Thank you!

> 
> Please see: "Ordering of commit tags" in Documentation/process/maintainer-tip.rst
> on how changelog can refer to Link: tags.
> 
> The second Link: seems to be pointing to the decision that this user space request
> needs to be rejected instead of fixed. Looks like the relevant message is
> 
> 	https://lore.kernel.org/lkml/3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com/
> 
> you could use similar language as recent commit 
> 	7782a6a8dfc0 ("x86,fs/resctrl: Keep mbm_assign_mode in default mode at boot")
> 
> That points to the decision in a "Link:" tag and then uses text in changelog like:
> 	"... as decided in the thread at the Link tag." 

OK

> 
> Above is not actually what Documentation/process/maintainer-tip.rst documents but it
> is what x86 maintainer changed it to after the original commit followed
> Documentation/process/maintainer-tip.rst, so I guess either may be ok.
> 
> 
>> ---
> 
> 
>> ---
>>  Documentation/filesystems/resctrl.rst |  7 ++++---
>>  fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
>>  2 files changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index b52795e03303..9ae34aace0ff 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -552,9 +552,10 @@ will automatically remove all MON groups below it.
>>  Moving MON group directories to a new parent CTRL_MON group is supported
>>  for the purpose of changing the resource allocations of a MON group
>>  without impacting its monitoring data or assigned tasks. This operation
>> -is not allowed for MON groups which monitor CPUs. No other move
>> -operation is currently allowed other than simply renaming a CTRL_MON or
>> -MON group.
>> +is not allowed for MON groups which monitor CPUs, and fails with
>> +-EOPNOTSUPP on systems where the RMID depends on the CLOSID. No other
>> +move operation is currently allowed other than simply renaming a
>> +CTRL_MON or MON group.
> 
> merging the discussion in 
>  https://lore.kernel.org/lkml/113c13ba-e1de-44b1-9a6f-4bd94ecbd71e@arm.com/
> 
> To avoid user needing to understand the RMID dependency, how about:
> 
> ---8<---
> @@ -566,10 +566,10 @@ will automatically remove all MON groups below it.
>  
>  Moving MON group directories to a new parent CTRL_MON group is supported
>  for the purpose of changing the resource allocations of a MON group
> -without impacting its monitoring data or assigned tasks. This operation
> -is not allowed for MON groups which monitor CPUs. No other move
> -operation is currently allowed other than simply renaming a CTRL_MON or
> -MON group.
> +without impacting its monitoring data or assigned tasks. This operation is
> +not allowed for MON groups which monitor CPUs, or when the monitoring data
> +or assigned tasks would be impacted. No other move operation is currently
> +allowed other than simply renaming a CTRL_MON or MON group.

Will update it.

>  
>  All groups contain the following files:
> ---8<---
> 
>>  
>>  All groups contain the following files:
>>  
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index e6b64a5c9302..3c002b711024 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -4398,6 +4398,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
>>  		goto out;
>>  	}
>>  
>> +	/*
>> +	 * Moving the group changes the CLOSID. Where the RMID is only
>> +	 * meaningful together with the CLOSID, the RMID index changes and the
>> +	 * monitor state cannot follow the move.
>> +	 */
>> +	if (rdtgrp->mon.parent != new_prdtgrp && resctrl_arch_mon_capable() &&
> 
> The above two checks look unnecessary:
> 	"rdtgrp->mon.parent != new_prdtgrp" - this check is used to ensure that
> 	these systems can still just rename existing monitor groups. In this scenario
> 	the CLOSID will be compared against itself and the two encode() calls will
> 	return the same index, no?

Yes, the resctrl_arch_rmid_idx_encode() will equal, this is redundant。

> 
> 	"resctrl_arch_mon_capable()" - earlier in function the source is required
> 	to be a MON group, which can only be possible if the system supports
> 	monitoring.

Got it.

> 
>> +	    resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
>> +	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
>> +		rdt_last_cmd_puts("Changing parent control group not supported\n");
> 
> Could this use same terminology as resctrl.rst to help user match documented
> behavior with the error message? For example,
> 
> 		"Moving a MON group to a new CTRL_MON group is not supported\n"

Sure.

> 		
> 
>> +		ret = -EOPNOTSUPP;
>> +		goto out;
>> +	}
>> +
>>  	/*
>>  	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
>>  	 * current parent CTRL_MON group and therefore cannot be assigned to
> 
> Reinette

-- 
Best regards,
Jinjie


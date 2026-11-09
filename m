Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222190;
	b=zre2nD++n72TWu8BBK3/sPkDAgZOldcojVBhU5JodFnh4szeb3V/fp0mRLhTeQpANXjg
	 7b03m6JRxoA8iout9he3Vy2GTY+Jm0/2MriJVJBidxElSA73odTW8VuAx/Jdrb40QxJVd
	 eD10hzxbDzf3Px6OnmJ7qUK+E8Qu9Kccff4J/eOFodmVSD13zrvxnWVnCFwgxiUaItgPq
	 II8swfGxLPAt3OnXHMDwm/EsYm0o4zkjQzQ7smmICp7HtStb40z9FGd+lpC+ex9bsS+7t
	 yNKgzSMIPtWK2PIdhgbWQ6ALkeNyd2nWGsGybHw6AgpFJNZL01PeAUvh/qWgb/3k/Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222190;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:References:Content-Language:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=z/0NjuDmz+HW/b7ZSsAHiNMWV8UJO3jkixtqS+LF+DU=;
	b=yvvgTnvpwbs9LmYOTtuQLuKCJvHBei9jk7XnlNY//45gjU7KVd74fegKL4NzE0S7WqLW
	 RPOmLeHpWotDa9TL1PU1rqBQH4o3ImId48l8WMH3gP5HLRWuU5lN5ymoOLcuivXp35CIc
	 Hb9YsuKwvIUPgcWO2ffnC+TSypmox8ncD++Cj5Pl2ziYg7BiZ6ScAQfRdSOaoBWDldrbg
	 v5JEvPWcm1gbM7kIe8NqIAE65v7BDsrvn3qCtaLb94WuOvQv14VIH0bFVSgVdbWbPn30X
	 oNGHuShhsc6RoAANZbNAuBLpxmxUX88w18UWeI7SOsMXWAigSxa7ztAAkwY+0RdDlRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=arjdLLnW;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6EF606A322;
	Mon,  9 Nov 2026 11:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED6EF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=arjdLLnW
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3455B1576;
	Mon,  9 Nov 2026 03:03:06 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C42943F85F;
	Mon,  9 Nov 2026 03:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794222189; bh=q3w+NPDzExIZERQJQiZcKIt/3X7AuJwS+XELtH0Oj7I=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=arjdLLnWnyUTVRAfnxVnGKGFpyQEAHMWhRO5ID3PAzT0WZHVvlFDjsN2lgJLischT
	 1FfN4jLXptrCabTy9p9adM0lVPz9RbzzkL1FkxZCwO5JwvC1OCyS5LyXfUVnRT40jK
	 86TRdS19u0yLw0gTkja0QyB+hJowoOp8+qEbJLWE=
Message-ID: <599b7b91-f6c8-4a8e-87a0-c023f3fd58ed@arm.com>
Date: Mon, 9 Nov 2026 11:03:04 +0000
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
Subject: Re: [PATCH v2] fs/resctrl: Disallow monitor group rename when the
 RMID changes
From: Ben Horgan <ben.horgan@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, zengheng4@huawei.com, gshan@redhat.com,
 jic23@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20261105123524.2282090-1-ruanjinjie@huawei.com>
 <7a8d6a15-5a10-4035-b825-4436cba537ee@arm.com>
Content-Language: en-US
In-Reply-To: <7a8d6a15-5a10-4035-b825-4436cba537ee@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 09/11/2026 10:52, Ben Horgan wrote:
> Hi Jinjie,
> 
> On 05/11/2026 12:35, Jinjie Ruan wrote:
>> From: Peter Newman <peternewman@google.com>
>>
>> A monitor group can be renamed into the mon_groups directory of another
>> control group to move its tasks to that control group's allocation
>> while keeping their monitoring data. Where the RMID is only meaningful
>> together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
>> extends the PARTID, this move does not work. The rename succeeds, but:
>>
>> - The group's monitoring data is reset. Its counters are identified by
>>   the CLOSID and RMID together, so after the move the group reads the
>>   counters of the new CLOSID instead of the ones its tasks used.
>>
>> - The tasks are not moved. mongrp_reparent() sets the new parent and
>>   CLOSID of the group before rdt_move_group_tasks() looks for the tasks
>>   to update, and the search then matches on the new CLOSID, which none
>>   of the tasks carries yet. The tasks keep the old CLOSID and the old
>>   control group's allocation, and the group does not count them.
>>
>> The move has never worked on these systems, so rejecting it does not
>> take away behavior that an existing user can rely on.
>>
>> Reject the move with -EOPNOTSUPP when it changes the RMID index of the
>> group, and document the restriction in resctrl.rst. Where the RMID does
>> not depend on the CLOSID, such as on x86, the move keeps the same index
>> and is still allowed.
>>
>> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
>> Signed-off-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.1.x
>> Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
>> Link: https://lore.kernel.org/lkml/20261031101052.1692230-1-ruanjinjie@huawei.com/
>> ---
>> v2:
>> - Drop the Suggested-by tag.
>> - Describe the systems by whether the RMID depends on the CLOSID rather
>>   than by MPAM, in both the changelog and resctrl.rst.
>> - Explain that moving a monitor group is already broken on these systems
>>   because the tasks are not moved, so no existing user relies on it.
>> - v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
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
> A user may not readily know whether RMID depends on CLOSID. To document
> this properly we need something specific we can point the user too.
> Perhaps this can be a file in the info directory specifying whether the
> move is possible or not, info/moveable_mon_group, as we discussed in v1.
> I suggest a precursor patch adding this file, followed by this patch
> which can then refer to the file.

On the other hand, that does add an extra dependency for any backporting
of this fix.

Thanks,

Ben

> 
> Thanks,
> 
> Ben
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
>> +	    resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
>> +	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
>> +		rdt_last_cmd_puts("Changing parent control group not supported\n");
>> +		ret = -EOPNOTSUPP;
>> +		goto out;
>> +	}
>> +
>>  	/*
>>  	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
>>  	 * current parent CTRL_MON group and therefore cannot be assigned to
> 


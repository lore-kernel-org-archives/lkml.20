Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228541;
	b=jTBC11pGulZmGBXALwOoDW0zSgIUih22pi/N3Cvx7EaajQiFYwvCOQ9eQVr5tfIGPg5x
	 4ZI6A47k9l9ARzg36DnR0MnyzG561DwCiPJl7D08ND5yrA4X2xUAAIMnUWYbdJaSUdIHX
	 yLXosp4dzcKtN4LdPHINfRqS7/gNrvoUJCaQcXOgqz1xuusdn3NLjjVfYdSSh4eVUvoC/
	 mhXoSOG74igr0alwhXf7gTQyFK2O2Asg8+7/XPVXT/Ito5A3xDCdIHbBXD0kSic/hiEph
	 KLoQULA/xnZUxqGyWuMf7Nl5Xpl7yZpIdq66Zzb1QeeVlRE/1zTXYo/9SCJBh8wMY3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228541;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=+5Sr3eRHpL/Vy+lNmmnXbTcTwXcKI3UmLCqjvPu63ZI=;
	b=Ncp4Hhv9inw1XIJ63m7o4P5kVmE4DeqhS9ht0mh8ybpB+5TYLlXkwxi9iQZI1MRH5vqC
	 cD/092SQI0ZdMS66PfCv9NzsF+Sk6a7Pf7C36oBq+8fadY0Lx7LpGLQmEYai2gCnntI2x
	 p6r/E1dPj8m2RImrPtmfJSV0KexirUobWfGq/fCfuyqbTXDOqIv870G84EFzEUU5Mee/m
	 BOHf8IDCy+lN52vVBgAPvB2HHHdQFJNsGfE/HfwxMxLUpN7UQ73F/L1fUz1ms6yZLz8lc
	 T0jU4W1inUEPdSelLgPmEopiY5Qlvx5BrJLBZljHm3/SlZTmzYF3j3wXK3o1HLx4NMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=P8zrwsDm;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E73606D830;
	Mon,  9 Nov 2026 12:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E73606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=P8zrwsDm
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+5Sr3eRHpL/Vy+lNmmnXbTcTwXcKI3UmLCqjvPu63ZI=;
	b=P8zrwsDmUg7aim6xK5jdMRfkcUfwudj89DPN1ZF0iJR5kH/si70DdPU5jxUL5/fttVBKB3h57
	IBxsGzV3gY7NYklo+0ffRNovwcXdaFZcLwCeIF3z5tP1Dtbbp1cGgXb/TcRbnTglF4fXc4l0buU
	uiJZQkj6rEtFEWPWh2FTK1c=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jNV2d4LwVzmV7p;
	Mon,  9 Nov 2026 20:48:41 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 86DA34048B;
	Mon,  9 Nov 2026 20:48:55 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 20:48:54 +0800
Message-ID: <cd85a946-44f4-4d17-a479-8eb51e39e1cb@huawei.com>
Date: Mon, 9 Nov 2026 20:48:54 +0800
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
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<jic23@kernel.org>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20261105123524.2282090-1-ruanjinjie@huawei.com>
 <7a8d6a15-5a10-4035-b825-4436cba537ee@arm.com>
 <599b7b91-f6c8-4a8e-87a0-c023f3fd58ed@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <599b7b91-f6c8-4a8e-87a0-c023f3fd58ed@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/9 19:03, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 09/11/2026 10:52, Ben Horgan wrote:
>> Hi Jinjie,
>>
>> On 05/11/2026 12:35, Jinjie Ruan wrote:
>>> From: Peter Newman <peternewman@google.com>
>>>
>>> A monitor group can be renamed into the mon_groups directory of another
>>> control group to move its tasks to that control group's allocation
>>> while keeping their monitoring data. Where the RMID is only meaningful
>>> together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
>>> extends the PARTID, this move does not work. The rename succeeds, but:
>>>
>>> - The group's monitoring data is reset. Its counters are identified by
>>>   the CLOSID and RMID together, so after the move the group reads the
>>>   counters of the new CLOSID instead of the ones its tasks used.
>>>
>>> - The tasks are not moved. mongrp_reparent() sets the new parent and
>>>   CLOSID of the group before rdt_move_group_tasks() looks for the tasks
>>>   to update, and the search then matches on the new CLOSID, which none
>>>   of the tasks carries yet. The tasks keep the old CLOSID and the old
>>>   control group's allocation, and the group does not count them.
>>>
>>> The move has never worked on these systems, so rejecting it does not
>>> take away behavior that an existing user can rely on.
>>>
>>> Reject the move with -EOPNOTSUPP when it changes the RMID index of the
>>> group, and document the restriction in resctrl.rst. Where the RMID does
>>> not depend on the CLOSID, such as on x86, the move keeps the same index
>>> and is still allowed.
>>>
>>> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
>>> Signed-off-by: Peter Newman <peternewman@google.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> Cc: <stable@vger.kernel.org> # 7.1.x
>>> Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
>>> Link: https://lore.kernel.org/lkml/20261031101052.1692230-1-ruanjinjie@huawei.com/
>>> ---
>>> v2:
>>> - Drop the Suggested-by tag.
>>> - Describe the systems by whether the RMID depends on the CLOSID rather
>>>   than by MPAM, in both the changelog and resctrl.rst.
>>> - Explain that moving a monitor group is already broken on these systems
>>>   because the tasks are not moved, so no existing user relies on it.
>>> - v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
>>> ---
>>>  Documentation/filesystems/resctrl.rst |  7 ++++---
>>>  fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
>>>  2 files changed, 17 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>>> index b52795e03303..9ae34aace0ff 100644
>>> --- a/Documentation/filesystems/resctrl.rst
>>> +++ b/Documentation/filesystems/resctrl.rst
>>> @@ -552,9 +552,10 @@ will automatically remove all MON groups below it.
>>>  Moving MON group directories to a new parent CTRL_MON group is supported
>>>  for the purpose of changing the resource allocations of a MON group
>>>  without impacting its monitoring data or assigned tasks. This operation
>>> -is not allowed for MON groups which monitor CPUs. No other move
>>> -operation is currently allowed other than simply renaming a CTRL_MON or
>>> -MON group.
>>> +is not allowed for MON groups which monitor CPUs, and fails with
>>> +-EOPNOTSUPP on systems where the RMID depends on the CLOSID. No other
>>> +move operation is currently allowed other than simply renaming a
>>> +CTRL_MON or MON group.
>>
>> A user may not readily know whether RMID depends on CLOSID. To document
>> this properly we need something specific we can point the user too.
>> Perhaps this can be a file in the info directory specifying whether the
>> move is possible or not, info/moveable_mon_group, as we discussed in v1.
>> I suggest a precursor patch adding this file, followed by this patch
>> which can then refer to the file.
> 
> On the other hand, that does add an extra dependency for any backporting
> of this fix.

Yes, this "info/moveable_mon_group"  needs to be integrated as a pre-patch.

> 
> Thanks,
> 
> Ben
> 
>>
>> Thanks,
>>
>> Ben
>>
>>>  
>>>  All groups contain the following files:
>>>  
>>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>>> index e6b64a5c9302..3c002b711024 100644
>>> --- a/fs/resctrl/rdtgroup.c
>>> +++ b/fs/resctrl/rdtgroup.c
>>> @@ -4398,6 +4398,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
>>>  		goto out;
>>>  	}
>>>  
>>> +	/*
>>> +	 * Moving the group changes the CLOSID. Where the RMID is only
>>> +	 * meaningful together with the CLOSID, the RMID index changes and the
>>> +	 * monitor state cannot follow the move.
>>> +	 */
>>> +	if (rdtgrp->mon.parent != new_prdtgrp && resctrl_arch_mon_capable() &&
>>> +	    resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
>>> +	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
>>> +		rdt_last_cmd_puts("Changing parent control group not supported\n");
>>> +		ret = -EOPNOTSUPP;
>>> +		goto out;
>>> +	}
>>> +
>>>  	/*
>>>  	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
>>>  	 * current parent CTRL_MON group and therefore cannot be assigned to
>>
> 

-- 
Best regards,
Jinjie


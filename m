Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246455;
	b=z1Xoius6eWPYdAmBuv1zMyvlkYYGWqdnru9PDVuZaOSoDxFrxAVgxG26Nfo2GFyPBON+
	 lRIFSWX1wtgu89fV6AC9gvClqXOM6+lx2LI/+cVpVNmz0t69C411bo3m9+igEsAVC1kl1
	 Qx4t0HAl8OOrXPZT9OYB9YlO7BOjuuyCCLkMhkj5xocPAOZBhHibkpjSzCZ1JTFYnF8Fs
	 ux+2TOJjTdSJ8M0tDz9+rTkbJjWB5uGtoo/FjjDv92bPtPXyg5o1gUbLuYjXkB9gTOlhI
	 CZG7Qfh9VemKqZ5+w0Ldmrc1kH5/dZWKrnjTvxA6wX5wif1lhJ+WUePYTTUwSBQOQbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246455;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wvKaLAGgxH7KQDay43gq60VkJVcyf0ECMC+osl+zl1s=;
	b=ucJYaYUwDtZ+JNcdBa6ZIWLJdhhgZJtQGQttxfCWh0ZfIACvMQ/aDWsIyjRl4xXlp1g9
	 wyp2973kf5vY+ezydkJL+3uoglVxMFzOAhIWyI7E7LgxfXY3JJWUkNRSYlakzZcC6RAsh
	 ZllGqsV2zesjGjrr49hwz6ns3z8w9nmlkReCRlcPOh/6/XEl2SfsuUxJmw3PbBaEpLZRx
	 yInJaLI4/OhWd41jEmDJAdn6h/qSWaBqi/vIp0KSDwY6Nz09+XuhcOQcKAzpha+K3/RwX
	 Z39DIi2RK1ZeVbbThxYCmM+T7vNO0r+xAF32riOj/4Yl0ktr/+dlHcNhyVps7Cf2JRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NMvtKSgL;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222B6606A321;
	Mon,  9 Nov 2026 17:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 222B6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NMvtKSgL
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38E301476;
	Mon,  9 Nov 2026 09:47:30 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4C2C3F673;
	Mon,  9 Nov 2026 09:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794246453; bh=eQYVY0oJupM2DLprEgQdN9KgsiLbiCdox26A39km8nU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NMvtKSgL1l8EwAAOW7tRcdmxYQllUK4CNqRveNVFFhckdTqAUUTcyMQZXuBHE7xtR
	 KitUGHEz7iecFY58lMC1mlPHFSNt0whYZ5Gmc0tQp/UFeKM7OfARtugRH09NfJc4uh
	 fa50jJfnGjlb0l7lvNLMYb9ODa+CaRKuNgXqOkyQ=
Message-ID: <113c13ba-e1de-44b1-9a6f-4bd94ecbd71e@arm.com>
Date: Mon, 9 Nov 2026 17:47:29 +0000
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
To: Reinette Chatre <reinette.chatre@intel.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 zengheng4@huawei.com, gshan@redhat.com, jic23@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261105123524.2282090-1-ruanjinjie@huawei.com>
 <7a8d6a15-5a10-4035-b825-4436cba537ee@arm.com>
 <599b7b91-f6c8-4a8e-87a0-c023f3fd58ed@arm.com>
 <6c5d88a9-f86b-4255-82cc-bee70c2d7736@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <6c5d88a9-f86b-4255-82cc-bee70c2d7736@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 09/11/2026 17:40, Reinette Chatre wrote:
> Hi Ben,
> 
> On 11/9/26 3:03 AM, Ben Horgan wrote:
>> On 09/11/2026 10:52, Ben Horgan wrote:
>>> On 05/11/2026 12:35, Jinjie Ruan wrote:
>>>> From: Peter Newman <peternewman@google.com>
>>>>
>>>> A monitor group can be renamed into the mon_groups directory of another
>>>> control group to move its tasks to that control group's allocation
>>>> while keeping their monitoring data. Where the RMID is only meaningful
>>>> together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
>>>> extends the PARTID, this move does not work. The rename succeeds, but:
>>>>
>>>> - The group's monitoring data is reset. Its counters are identified by
>>>>   the CLOSID and RMID together, so after the move the group reads the
>>>>   counters of the new CLOSID instead of the ones its tasks used.
>>>>
>>>> - The tasks are not moved. mongrp_reparent() sets the new parent and
>>>>   CLOSID of the group before rdt_move_group_tasks() looks for the tasks
>>>>   to update, and the search then matches on the new CLOSID, which none
>>>>   of the tasks carries yet. The tasks keep the old CLOSID and the old
>>>>   control group's allocation, and the group does not count them.
>>>>
>>>> The move has never worked on these systems, so rejecting it does not
>>>> take away behavior that an existing user can rely on.
>>>>
>>>> Reject the move with -EOPNOTSUPP when it changes the RMID index of the
>>>> group, and document the restriction in resctrl.rst. Where the RMID does
>>>> not depend on the CLOSID, such as on x86, the move keeps the same index
>>>> and is still allowed.
>>>>
>>>> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
>>>> Signed-off-by: Peter Newman <peternewman@google.com>
>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>> Cc: <stable@vger.kernel.org> # 7.1.x
>>>> Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
>>>> Link: https://lore.kernel.org/lkml/20261031101052.1692230-1-ruanjinjie@huawei.com/
>>>> ---
>>>> v2:
>>>> - Drop the Suggested-by tag.
>>>> - Describe the systems by whether the RMID depends on the CLOSID rather
>>>>   than by MPAM, in both the changelog and resctrl.rst.
>>>> - Explain that moving a monitor group is already broken on these systems
>>>>   because the tasks are not moved, so no existing user relies on it.
>>>> - v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
>>>> ---
>>>>  Documentation/filesystems/resctrl.rst |  7 ++++---
>>>>  fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
>>>>  2 files changed, 17 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>>>> index b52795e03303..9ae34aace0ff 100644
>>>> --- a/Documentation/filesystems/resctrl.rst
>>>> +++ b/Documentation/filesystems/resctrl.rst
>>>> @@ -552,9 +552,10 @@ will automatically remove all MON groups below it.
>>>>  Moving MON group directories to a new parent CTRL_MON group is supported
>>>>  for the purpose of changing the resource allocations of a MON group
>>>>  without impacting its monitoring data or assigned tasks. This operation
>>>> -is not allowed for MON groups which monitor CPUs. No other move
>>>> -operation is currently allowed other than simply renaming a CTRL_MON or
>>>> -MON group.
>>>> +is not allowed for MON groups which monitor CPUs, and fails with
>>>> +-EOPNOTSUPP on systems where the RMID depends on the CLOSID. No other
>>>> +move operation is currently allowed other than simply renaming a
>>>> +CTRL_MON or MON group.
>>>
>>> A user may not readily know whether RMID depends on CLOSID. To document
>>> this properly we need something specific we can point the user too.
>>> Perhaps this can be a file in the info directory specifying whether the
>>> move is possible or not, info/moveable_mon_group, as we discussed in v1.
>>> I suggest a precursor patch adding this file, followed by this patch
>>> which can then refer to the file.
>>
>> On the other hand, that does add an extra dependency for any backporting
>> of this fix.
> Does this fix really depend on a new user interface? 
> 
> I understand this is helpful to user space and this can be added, but I do
> not see how this fix requires it.

Not strictly, no. Up to a point the documentation does but we could go
back to the documentation in v1 which mentions MPAM for the fix and
then, as a new feature, add the new interface on top of that. The
documentation can then be updated to mention the new interface only at
the time the new interface is added.

Thanks,

Ben

> 
> Reinette
> 
> 


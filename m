Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221549;
	b=eYSQMq8WM+CCvVFKnkVFHjwSYBRh3E+iQBwwSizbR9KerlmwDR025QdIm4KzaQ3GRbZL
	 hH73EhnK01trh9rdcLfHPZvKmytj4he+7QEdwwr3majVDuIHadJ/rlbQ9VDe3kWZfej99
	 3LcutQwA5GZ/Xuat5oafqe2Ke03TXXl7gq7A5i5MND5/6GkgFET5Oe/XyBWT9ciIa/3ZV
	 g6wSP7Td4D2JD2nJJ89smDn3R7a26klvV2TpVMKCE34zGE/pczTcFiu4P5LXBOi/RtGn4
	 L0JdXWxh4qgvWWm/EiixYGJEuZomXLVa3KbruHDhplELIc1NjdEmIzr1Vh6VhKKHaRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221549;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UxA+Ma786bUcz69UgECYfkbzSxht8/ziVCDZhsC0ABw=;
	b=DbehCN/nzJXn4AUZThJ1HP90mTWUT5T5EhnL4G53NTZMjUY/ByNbvIroDNpLYlicVr7G
	 cigrO3IxSWUhWs8ZDt9Bed5fHDoBJZOifedZrrTsBUTrhwOjeQUs1vlW8pk36cA4T6wBG
	 nOKJB+3Kc1bqNLV8nwnxjKhbUTt9h7l/H7cbdJBydoLdflVeZG3FX28kyt/WvdvFwKqQ+
	 v2sRKGTOzsMGzmAHZDdzoyviHkrdHCAa95Bw1XYTvmVeHGKpQFsAwr7H6ee7o/wu6HEBf
	 lqNFkDkvnPG4hw11aRvfxMhFoATE+mw31qG+LR6y2xwZGvhELmij9cW8kG3xcgnBxuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Rklr+Ur5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADA0606A31C;
	Mon,  9 Nov 2026 10:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ADA0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Rklr+Ur5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 907EE1576;
	Mon,  9 Nov 2026 02:52:24 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2CD83F632;
	Mon,  9 Nov 2026 02:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794221547; bh=34mglxqPLyxtLt/qr/d0nfS1stLvkhiOWpjKoz/yJEU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Rklr+Ur5UCmm5rK8HHf3Ge2Aq08PCNTBv6iQja3JpdfngO9dyUS24Xg2Zp2MG6UIV
	 SfziesRXnsev/c3CaHOQMDugvkwWdSwJdhOGLKorRg8/5bAMfvC8GhvwvzklbnLFVC
	 moNOU3iLBqzpvc6k8q6P9Z1mn5UXiTwrBQRRD22I=
Message-ID: <7a8d6a15-5a10-4035-b825-4436cba537ee@arm.com>
Date: Mon, 9 Nov 2026 10:52:22 +0000
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
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, zengheng4@huawei.com, gshan@redhat.com,
 jic23@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20261105123524.2282090-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261105123524.2282090-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 05/11/2026 12:35, Jinjie Ruan wrote:
> From: Peter Newman <peternewman@google.com>
> 
> A monitor group can be renamed into the mon_groups directory of another
> control group to move its tasks to that control group's allocation
> while keeping their monitoring data. Where the RMID is only meaningful
> together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
> extends the PARTID, this move does not work. The rename succeeds, but:
> 
> - The group's monitoring data is reset. Its counters are identified by
>   the CLOSID and RMID together, so after the move the group reads the
>   counters of the new CLOSID instead of the ones its tasks used.
> 
> - The tasks are not moved. mongrp_reparent() sets the new parent and
>   CLOSID of the group before rdt_move_group_tasks() looks for the tasks
>   to update, and the search then matches on the new CLOSID, which none
>   of the tasks carries yet. The tasks keep the old CLOSID and the old
>   control group's allocation, and the group does not count them.
> 
> The move has never worked on these systems, so rejecting it does not
> take away behavior that an existing user can rely on.
> 
> Reject the move with -EOPNOTSUPP when it changes the RMID index of the
> group, and document the restriction in resctrl.rst. Where the RMID does
> not depend on the CLOSID, such as on x86, the move keeps the same index
> and is still allowed.
> 
> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
> Signed-off-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
> Link: https://lore.kernel.org/lkml/20261031101052.1692230-1-ruanjinjie@huawei.com/
> ---
> v2:
> - Drop the Suggested-by tag.
> - Describe the systems by whether the RMID depends on the CLOSID rather
>   than by MPAM, in both the changelog and resctrl.rst.
> - Explain that moving a monitor group is already broken on these systems
>   because the tasks are not moved, so no existing user relies on it.
> - v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
> ---
>  Documentation/filesystems/resctrl.rst |  7 ++++---
>  fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index b52795e03303..9ae34aace0ff 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -552,9 +552,10 @@ will automatically remove all MON groups below it.
>  Moving MON group directories to a new parent CTRL_MON group is supported
>  for the purpose of changing the resource allocations of a MON group
>  without impacting its monitoring data or assigned tasks. This operation
> -is not allowed for MON groups which monitor CPUs. No other move
> -operation is currently allowed other than simply renaming a CTRL_MON or
> -MON group.
> +is not allowed for MON groups which monitor CPUs, and fails with
> +-EOPNOTSUPP on systems where the RMID depends on the CLOSID. No other
> +move operation is currently allowed other than simply renaming a
> +CTRL_MON or MON group.

A user may not readily know whether RMID depends on CLOSID. To document
this properly we need something specific we can point the user too.
Perhaps this can be a file in the info directory specifying whether the
move is possible or not, info/moveable_mon_group, as we discussed in v1.
I suggest a precursor patch adding this file, followed by this patch
which can then refer to the file.

Thanks,

Ben

>  
>  All groups contain the following files:
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index e6b64a5c9302..3c002b711024 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4398,6 +4398,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
>  		goto out;
>  	}
>  
> +	/*
> +	 * Moving the group changes the CLOSID. Where the RMID is only
> +	 * meaningful together with the CLOSID, the RMID index changes and the
> +	 * monitor state cannot follow the move.
> +	 */
> +	if (rdtgrp->mon.parent != new_prdtgrp && resctrl_arch_mon_capable() &&
> +	    resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
> +	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
> +		rdt_last_cmd_puts("Changing parent control group not supported\n");
> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
> +
>  	/*
>  	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
>  	 * current parent CTRL_MON group and therefore cannot be assigned to


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630819;
	b=J2oQuxFwsfu+jcv+CmXesaU7czWGMLuToLwvGlAGUJyzz5zZCV/ZS3evu6MpuMExsOaM
	 45vbFobRQPAJEkSJTVPDV9XAWnrOn+pQ5D4nELt34YpOmn/kufZBjYHeYmPpN0YixLRAk
	 SewE+wPHm5bwX8aYpIjBaWhk135I7kJQ8BBSA3+TQRHl6Anvc+murzM/Lh1abgM6TjBMi
	 8/oZCyLlTjq7P8BBOT7A4L6gVVHxhuXCBcp9ys9BwB/t/rYPzHJlpR+4nM6rkirtAb6pM
	 b6tjOABegfbPdtliMkADHcF0VvnESYUQHm0Fo/cg7zwDy2uOSvaggY+buVNZFKRsvhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630819;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+xsu/Vh3JnhGiqW5PyBf4LPX+4h8S0dUQq2MPKZycvM=;
	b=AOgruCM+dwTHwnpgRoLjvUDSHJMhOOsSB8tzRu1YH+wOZ4T2HLO3aKPZlTZ8RI6SnVPk
	 YOT4pzqKlRckq/0HcjjGViuY2u5c6FHWIUX9De2DeYylO7OZDJMqok0Q9kQVW1498XD+K
	 79OAyvMn5MLFoLscPUCIWM+LlCJSTqbZi7So055nEO1NI+oPNB5DUpYLAnXKaaFd0Plto
	 D2+0W/Z7PbFj51UrJaeV5I7M2X75UcDM/mIWnMYjvhJ0O1iAD09urBc/P3xGdbv3FR21O
	 dNnSpO53uW69z77VriFDnez8VkKIX/Ln4oiPoHcGtbEZLkXxBk3+2mQZR1ppEj5kKnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gDekP4SP;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8645C6070DA4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8645C6070DA4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gDekP4SP
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A73BF1576;
	Mon,  2 Nov 2026 06:46:54 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 564B13F59E;
	Mon,  2 Nov 2026 06:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793630817; bh=Rb6oK4WuZf1PEMfClwa9NCD+3U/D8ezKArVIkPqmTZw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gDekP4SP/0FBvvg0C5bKc/psaf3voROQ9YPm47ytg8dLEVV2ZSk/3pHL34vZ0zk/w
	 ktwXgfSHI2FLBGI+u9Sg1MW3Twx/sYNi7HFP84IF+8X9TD/kwD1R6Tx7YaRYWtqjfb
	 oJg+iCmhv/orFSJrtTHZ4hQhz5SvQVPUdNL85Yh0=
Message-ID: <3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com>
Date: Mon, 2 Nov 2026 14:46:54 +0000
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
Subject: Re: [PATCH] fs/resctrl: Fix CLOSID propagation when reparenting
 monitor groups
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, peternewman@google.com, bp@alien8.de, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <20261031101052.1692230-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261031101052.1692230-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 31/10/2026 10:10, Jinjie Ruan wrote:
> Renaming a monitor group to move it below a different control group
> changes the CLOSID of every task in that monitor group. mongrp_reparent()
> updates rdtgrp->mon.parent and rdtgrp->closid before calling
> rdt_move_group_tasks() to propagate the new CLOSID to the tasks.
> 
> rdt_move_group_tasks() uses its first argument to identify the tasks to
> move. For a monitor group this is is_rmid_match(), which on MPAM compares
> both the PARTID and the PMG of the task with the parent control group's
> CLOSID and the monitor group's RMID. After rdtgrp->mon.parent and
> rdtgrp->closid have been updated, the match uses the new CLOSID, so no
> task in the monitor group matches and none is moved. The tasks keep the
> old PARTID and continue to use the old control group's allocation.

Ah, that's pretty broken.

I was previously under the impression that moving monitor groups on MPAM systems was not permitted
as the monitor bandwidth counters are required to be always running and so would glitch when moved.
Peter Newman posted a patch in 2024 which added this restriction [1] but it didn't reach upstream.
As, the moving of monitor groups is already broken for MPAM systems I think it would be ok to forbid
them.

[1] https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/

Thanks,

Ben

> 
> x86 matches on the RMID alone, so it is unaffected. Now only arm64 mpam
> affected.
> 
> Save the monitor group state before it is modified and use the saved state
> as the source of the task move. The updated group remains the destination,
> so matching tasks are moved to the new CLOSID and RMID.
> 
> Fixes: 8da2b938eb7e ("x86/resctrl: Implement rename op for mon groups")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: stable@vger.kernel.org # 7.1.x
> ---
>  fs/resctrl/rdtgroup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 57ab090072c2..33b23b59a6de 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4322,6 +4322,7 @@ static void mongrp_reparent(struct rdtgroup *rdtgrp,
>  			    cpumask_var_t cpus)
>  {
>  	struct rdtgroup *prdtgrp = rdtgrp->mon.parent;
> +	struct rdtgroup old_rdtgrp = *rdtgrp;
>  
>  	WARN_ON(rdtgrp->type != RDTMON_GROUP);
>  	WARN_ON(new_prdtgrp->type != RDTCTRL_GROUP);
> @@ -4338,7 +4339,7 @@ static void mongrp_reparent(struct rdtgroup *rdtgrp,
>  	rdtgrp->closid = new_prdtgrp->closid;
>  
>  	/* Propagate updated closid to all tasks in this group. */
> -	rdt_move_group_tasks(rdtgrp, rdtgrp, cpus);
> +	rdt_move_group_tasks(&old_rdtgrp, rdtgrp, cpus);
>  
>  	update_closid_rmid(cpus, NULL);
>  }


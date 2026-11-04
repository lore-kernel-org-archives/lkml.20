Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803000;
	b=VPidVqqew9GtYvNDFgUzwz6pmYrn27x0NUECKVhvSRO3mfsgJAwWPH+MvbwLpWAjV4BB
	 EflJqv1ES/To6sWzdrhP/SXhVFnhrHzDtuzUXm/9hnlgDOP0dZndUx8PgnAKh0aM8nZ2r
	 gbw1qUjXfzsiRSJP7kwRk3cArwmw8qg5WEFwOyt0QpMtLINilykCZYHT6qfZVf+D+rX2Z
	 tFatcnLpLydMfU+3lop1/soRJcPLr5hVAEmco8zibwnQmmXrS9uuzVmoSM5HWtGWRtENJ
	 +A0iUPcKFBNfRdaPNAU+S6xPkIoRUQ4Zfgi7SXRyjfzdLGJdmX3xvvSttU9WVLC1aDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803000;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NV6GdVcifFJdTLFsDjb/Tv4GQa1WE3ukrxwK3f0KC6A=;
	b=KN3z+pgl0gUHe4tMS0kQffS12wm2EHU2phY03sKtEu60wFvAO28p62h16H7qVE85By13
	 Ljte6y69iu/0wLCKgEkNrbsOQ7hRz5Ea9PSarII4ASQBFlMiAd44NxxpdZUC5ZVyrXDcf
	 xbwXX4J7q19UlRNw9Km7PQ2z5QS0fLaRd4TuRgl3hb4GqD+90wJrPzAe9pNsMpHbRdjS2
	 S5skf//WZfVcRRy0gti/bUfU9un4+dPlR6L+CEpgAVKU01iHGZGQQET+G6gG+FZs4K5M3
	 ArzqG7UpS1nuFKbk87Iku6v2TkczhcNYMdYI4s1QrEmpakg5LIU8CyRo+++Z95Ie4/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=f0cJSAYX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34C6606A32C;
	Wed,  4 Nov 2026 14:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B34C6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=f0cJSAYX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6C2C1CE0;
	Wed,  4 Nov 2026 06:36:35 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 078B33F673;
	Wed,  4 Nov 2026 06:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793802999; bh=Uuty6DRadg0p1LT6jLDYK+PxxHys/sQ0bh39v1+iElc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=f0cJSAYX5hfTetQPOg1aCodBvYb2ynPX5zQ+7IdhE6zviBkE8FapnPJ1H5k79fMLt
	 h/RJpUGMYmAG2IZuy4bfrKbM67miEg+TbmuRucEbNVhbm5eAL6jBqelvzunhbofUsS
	 dKYx2GrAtKhuGGkWD4DWrD7EHdNV2Es826UJPFU8=
Message-ID: <88c180d8-156d-400d-8537-5fd79b7ad10b@arm.com>
Date: Wed, 4 Nov 2026 14:36:35 +0000
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
Subject: Re: [PATCH] fs/resctrl: Disallow monitor group rename when the RMID
 changes
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, jic23@kernel.org, tan.shaopeng@jp.fujitsu.com,
 gshan@redhat.com, zengheng4@huawei.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261104101913.586595-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261104101913.586595-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 04/11/2026 10:19, Jinjie Ruan wrote:
> From: Peter Newman <peternewman@google.com>
> 
> Renaming a monitor group to move it below a different control group
> changes the CLOSID of its tasks. Where the RMID only has meaning
> together with the CLOSID, the RMID index changes as well: on arm64 MPAM
> the RMID is a PMG that extends the PARTID, so the group's counters
> belong to the old PARTID and cannot follow the move. The monitor data
> would be reset and would then report the new PARTID's traffic.
> 
> Check that the RMID index is unchanged before moving the group and
> reject the rename with -EOPNOTSUPP otherwise. Only MPAM systems are
> affected; architectures where the RMID is independent of the CLOSID,
> such as x86, keep the same index and still allow the move. Document
> the restriction in resctrl.rst.
> 
> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
> Suggested-by: Ben Horgan <ben.horgan@arm.com>

Perhaps stretching the meaning of a 'Suggested-by' tag as I only suggested the repost of Peter's patch.

It is probably worth pointing out that the moving of monitor groups is existingly broken other than
just the resetting of mbm_total_bytes counters and so the current behaviour isn't something that an
existing user could be relying on. As you already point out in [1]

[1] https://lore.kernel.org/lkml/20261031101052.1692230-1-ruanjinjie@huawei.com/

Thanks,

Ben

> Signed-off-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
> ---
>  Documentation/filesystems/resctrl.rst |  7 ++++---
>  fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index b52795e03303..5f21ab20030a 100644
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
> +-EOPNOTSUPP on systems where the RMID depends on the CLOSID, such as
> +arm64 MPAM. No other move operation is currently allowed other than
> +simply renaming a CTRL_MON or MON group.
>  
>  All groups contain the following files:
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 9290a346386e..358f2dc8301d 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4405,6 +4405,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
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


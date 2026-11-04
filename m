Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802119;
	b=PYVzIVCvNrSGOafGJpYBUc4rCO69JLR8cw72A3pngmOe3+Zpb9DG0MD+nTrhzfapuZjb
	 WmLnps3y2fQ2C6i/WxC8VDrIuWxwKw9KlnNttrg6HLFc+25JWw2AyK0PGoYaD9e6gBF5S
	 7ZwsdSu3iZU0c+vEaW3JpHySyvwlmrUu1tGgXMV6k856z5lu8M/sw1bCuF8SRxIYcuc00
	 2UkwRXpsXrACGaGT8KaVvDFSXVT9Bc2nQ2g4xmxSMtdtBFsAPeYIYd79o0s0b/Er14u2P
	 NwQAmCBQPdQhSYt1Brtu9yRqYE2Fsqgtb3wpz9KGInUznvAM3dNcuk2jpeVpYx47Fzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802119;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=RCZFKzJ5FU5wXI/AAra2JtvLPo4fWmIXc6OYvhxEbRA=;
	b=rhKcrcM/5GEUeuaHoHIBtaDF66iAiLltAhMIqcwtXWCrHZgZ7KE6eo2liWiPPXltuq35
	 fGNJXKnq8n1IwbYKrauSOhocEUnA4VZrkLmAM2zWHIITkJk1gkxhlbpqH9bUveTOXdQBc
	 Mh3AqrsrpFI6XFvmnCPNGaTH8vJOOmoceNN2Ggwr1WHK01bAWYyZGytR/TnZKD+4f32dz
	 G/Pz4YmnXY/Df/ase5XO+e02gyC5KRm1bqQqtyZYy7wayMaCq32zFGO12/WN9g7QMdmRf
	 VqHc1DQuMQy94XFZTglrhXmP2I1Dspcbtif6cgVEU9qfKDNADnqljASeVbc1M6oxGww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Upjdc+mS;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDF3606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DDF3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Upjdc+mS
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EBF81D34;
	Wed,  4 Nov 2026 06:21:54 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EEDF3F628;
	Wed,  4 Nov 2026 06:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793802117; bh=Hr/3oRpndyHDDyfM5E1feoKXxm11nbcgryaiMGXfRuU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Upjdc+mSRyCDC1OhOnE9Tr4U/cVmnaynLs1JILZLzeDfb+EfrE8RV5OpM0GBVORLF
	 2ekeZ+3vWpR/iaaiTrnWkaBFcNE954J5mpER0aYHp+zpviOV4OmWsOBU9kLsRzSOHq
	 ye2u2uRIzJX5MkADh8ctHN26f2PEF0kh7wABHWvI=
Message-ID: <45efa783-21b4-4f67-a0fd-c6772d5cb038@arm.com>
Date: Wed, 4 Nov 2026 14:21:54 +0000
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
Subject: Re: [PATCH] arm_mpam: Round the CDP RMID count down to whole CLOSIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, zengheng4@huawei.com,
 gshan@redhat.com, jic23@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104101622.563280-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261104101622.563280-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

For patches touching the glue between MPAM and resctrl, essentially mpam_resctrl.c, the prefix used
is 'arm_mpam: resctrl' rather than just 'arm_mpam'.

On 04/11/2026 10:16, Jinjie Ruan wrote:
> resctrl_arch_set_cdp_enabled() halves the whole RMID index space, while
> the resctrl core halves the CLOSID count: schemata_list_add() divides a
> CDP resource's schema by two, and closid_init() takes the smallest
> across the schemata.
> 
> When the PMG count and the CLOSID count are both odd, halving the
> product counts RMIDs that belong to a CLOSID resctrl never allocates.
> With 3 PMGs and 5 CLOSIDs MPAM reports 7 RMIDs, but the 2 CLOSIDs that
> resctrl has times 3 PMGs only allow 6. The count is visible in
> /sys/fs/resctrl/info/L3_MON/num_rmids, so userspace reads a value that
> includes RMIDs no CLOSID can use; 

Good spot.

It occurs to me that 'num_rmids' is also too high on a monitor only system too as there is only one
PARTID that can be used.  Can you see a clean way to fix this in one go?

Thanks,

Ben

RMID allocation itself is bounded by
> the free list.
> 
> Derive the number of RMID groups from the index space and halve that, so
> the count follows resctrl_arch_system_num_rmid_idx().
> 
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Fenghua Yu <fenghuay@nvidia.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5468367776e2..d3f957162b68 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -217,10 +217,16 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  	cdp_enabled = enable;
>  	mpam_resctrl_controls[rid].cdp_enabled = enable;
>  
> -	if (enable)
> -		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
> -	else
> +	if (enable) {
> +		u32 num_group;
> +
> +		/* Halve the number of RMID groups, keeping whole PMG rows. */
> +		num_group = resctrl_arch_system_num_rmid_idx() /
> +			    (mpam_pmg_max + 1);
> +		l3->mon.num_rmid = (mpam_pmg_max + 1) * (num_group / 2);
> +	} else {
>  		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
> +	}
>  
>  	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
>  	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)


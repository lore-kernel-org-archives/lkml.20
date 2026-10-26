Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016753;
	b=2tS6Waiizg0ayYOxifkNP635ZxW8fSls0s6qBJGTJ9qVMred1qTSZ+61fLLCgovyFuGF
	 NdvNF0GM+M4HVqFT9UcQiXwmhbbMFpqzFzcNoNGknlyRJW07RG5U2zyyr/c7cOAPsKO/C
	 7QBA0/bSs+C8V6y8bQNXbDZEYcwLBOzdNA0znIyKvJDlly2mYDEymJlmpF2NQrsODMJ2C
	 p667jg49fwrCUX6BQc1iJqxBCildDKwVeBFr3QbUjhjA2vHwZLZN5PuZPSLSMHZxVkNNN
	 oWJ3aiiMhJCCotug9oMhG2dac1UGhN0sowTzbcGtotezuPd+nGFENpNyxDD65FVenUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016753;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EzTl/Iwzub8g+OSp476+y0U6G7ZfkqfC1mYo2gEuXZM=;
	b=o7/DHHRfKlkaBIle6AeKV4ZbBVNSxMJqnJnf5xcZnS7uy6VR0Lte4rQ51Cncugl3k6ed
	 hJKGc6J16XZl9BwjqeFVJQ7jOIDCLxRxqgKLPngu7f3GLWCpiua3twGEqR+wv0DR7RBqL
	 dPce6VNjL38bQ5YKGqMZrnWfu/Wh6AT5wR8eVE4xdpOfuKVSMIYj9aJwR5gXczNDCgzR0
	 xoVI7dtNqX3R3Y+9dvscNyV/NfBOpGo8PWL4/tOhYjQpuix1VLbXr39TRqz8bTlf4ufbp
	 9kA3BMZ9vhEBPH+Msu1Nq9h17DUFeDKj5EVU5haRNqPMGVXfgmFxOJw3As1ABW8CKCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kxlp3InA;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA61606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA61606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kxlp3InA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98CE725DF;
	Mon, 26 Oct 2026 05:12:28 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19DCA3F7B4;
	Mon, 26 Oct 2026 05:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793016751; bh=dtCopbSEnM/TXx3YrtqlcHEwy51qAVoDD0psDCQxxXY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kxlp3InAIzByvKtGQnuVKuFbF8S7k/TohS5Sc/lHL0Mpr+AVSzt/Sz/vuRrOTRMt3
	 9nK2hr+rOEbyAoVLV2ZVC8V6ftd1FVpnuglvPsHcwQkKFx3KQ7W7Q5YAES8jorQO+3
	 LGth6ZqmS7W5gEmOWdh6kOibfswh2JXA7O4Ean78=
Message-ID: <4a20a2c8-579f-4234-a03a-079a0225e2b9@arm.com>
Date: Mon, 26 Oct 2026 12:12:28 +0000
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
Subject: Re: [PATCH v9 2/9] fs/resctrl: Add resctrl_arch_rmid_idx_match()
 helper
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 x86@kernel.org, linux-kernel@vger.kernel.org
References: <20261012082337.822258-1-ruanjinjie@huawei.com>
 <20261012082337.822258-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261012082337.822258-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 12/10/2026 09:23, Jinjie Ruan wrote:
> The current RMID allocator assumes that RMID and CLOSID are entirely
> independent or follow a rigid 2D encoding. This prevents architectures
> where an RMID is bound to a specific CLOSID from properly filtering
> free RMIDs.

Is this patch required for the PARTID narrowing usage in this series? The static mapping is still a
2D encoding.

Thanks,

Ben

> 
> Introduce resctrl_arch_rmid_idx_match() to allow architectures to define
> their own compatibility rules between a target CLOSID and an allocated
> RMID's CLOSID.
> 
> No functional change.



> 
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Dave Martin <Dave.Martin@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Fenghua Yu <fenghuay@nvidia.com>
> Suggested-by: James Morse <james.morse@arm.com>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/x86/include/asm/resctrl.h |  6 ++++++
>  drivers/resctrl/mpam_resctrl.c |  6 ++++++
>  fs/resctrl/monitor.c           | 13 +++----------
>  include/linux/arm_mpam.h       |  1 +
>  4 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
> index 8f6edcdcfd87..7bb297a0ab6e 100644
> --- a/arch/x86/include/asm/resctrl.h
> +++ b/arch/x86/include/asm/resctrl.h
> @@ -181,6 +181,12 @@ static inline u32 resctrl_arch_rmid_idx_encode(u32 ignored, u32 rmid)
>  	return rmid;
>  }
>  
> +/* x86 RMIDs are independent; any RMID can be used with any CLOSID. */
> +static inline bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid)
> +{
> +	return true;
> +}
> +
>  /* x86 can always read an rmid, nothing needs allocating */
>  struct rdt_resource;
>  static inline void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r,
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953a..385c745787f2 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -279,6 +279,12 @@ u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
>  	return closid * (mpam_pmg_max + 1) + rmid;
>  }
>  
> +/* Check if the RMID's associated closid matches the target CLOSID. */
> +bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid)
> +{
> +	return closid == rmid_closid;
> +}
> +
>  void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid)
>  {
>  	*closid = idx / (mpam_pmg_max + 1);
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 73413cb128ea..39908f67dea4 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -205,23 +205,16 @@ bool has_busy_rmid(struct rdt_l3_mon_domain *d)
>  static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>  {
>  	struct rmid_entry *itr;
> -	u32 itr_idx, cmp_idx;
>  
>  	if (list_empty(&rmid_free_lru))
>  		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);
>  
>  	list_for_each_entry(itr, &rmid_free_lru, list) {
>  		/*
> -		 * Get the index of this free RMID, and the index it would need
> -		 * to be if it were used with this CLOSID.
> -		 * If the CLOSID is irrelevant on this architecture, the two
> -		 * index values are always the same on every entry and thus the
> -		 * very first entry will be returned.
> +		 * Check if the free RMID matches the target CLOSID.
> +		 * Architecture-specific rules apply.
>  		 */
> -		itr_idx = resctrl_arch_rmid_idx_encode(itr->closid, itr->rmid);
> -		cmp_idx = resctrl_arch_rmid_idx_encode(closid, itr->rmid);
> -
> -		if (itr_idx == cmp_idx)
> +		if (resctrl_arch_rmid_idx_match(closid, itr->closid))
>  			return itr;
>  	}
>  
> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
> index f92a36187a52..0bc8049a3733 100644
> --- a/include/linux/arm_mpam.h
> +++ b/include/linux/arm_mpam.h
> @@ -60,6 +60,7 @@ void resctrl_arch_sched_in(struct task_struct *tsk);
>  bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
>  bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
>  u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
> +bool resctrl_arch_rmid_idx_match(u32 closid, u32 rmid_closid);
>  void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
>  u32 resctrl_arch_system_num_rmid_idx(void);
>  


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887963;
	b=dN8rVaI0G5i3AKEZ2R+Lo3C5X5UNK7OC6k5yY+lJaD6v0O3SihtGfaVyqF/KMQt1thRr
	 amkRtTp+0Kq2B6k18y8GIoE2UAxwcECviGwZDGUsnejzpTNe6Nue1LrsadGnA1GGh4WDb
	 0gP9tpznfKS132kjHkWJ++zrqn9FB3SlmiwRDgHv9ofwoc5ExMknhXIiG0UJ/C+YRXZnl
	 KtVfitIWwemMwT1DLNNIKg+Cn/6gOn7/f7vsxhkDk9BlDVxDw/58C97EQ9cJbPDidg5WV
	 OUE2vPicf+U3CvDnnR3nZtq9NNJ/qxmRa/fqdTe/Djo371YEyNBH9NJ56jzBBTiHI/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887963;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=QZS6sDYWGRUn7zjDgPJZkQJIObyWy22cKBGFN8aMRqU=;
	b=wlood19hQ3OqF19FWocwxVGETj6DSE29xfcmrbBef2F45vm5Y7hch2MzEV8AH3jsdqh1
	 laWCKiAeJAUxg7nGnb5vb2aHv6zsRM6tUHYmxkI3saLMD7rRjRa4hZjJ1cdP4iyOKSH6W
	 b0nQEL/u5wKLzH50FhdgNtAL//2OvbQyCrFnoRrgedc9O4WgL+/lYdiDkELgJSJElpHCA
	 tkYrIQGNASFIa5t1BsF2Xs+oPEFERkbt3QxIk1D0D2Jx0UwfXOqgSaenuEFa2x7+6Q5RH
	 J+9vHt0db/YKG/KKReRYiFtGFNWfzUNCtp2nYzG3LcKHErHN+Bf3mAr8zvGS3PvoirA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TGIpi0Pg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F16606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F16606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TGIpi0Pg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E89871650;
	Thu,  5 Nov 2026 06:12:38 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C08E73F673;
	Thu,  5 Nov 2026 06:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793887962; bh=7IV3GnazZQUXVEnb2lbkppwOqoF/LZfMHwSTUnUOzGM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=TGIpi0Pgs8wyFZwHLYydEax/pX6Ke1ifMuQ1VIT5FvsMnein1yhBtLXupf8L9ox7N
	 mCpCDxvY/+oLTVgNQQr67ZHboVWzYfG25mtidbVknV7+MqB/IOzkgD55dupgH84se1
	 eBOjp5KGha0iUkrnrbT+CiKkgMKQQtzmuDo8LEOs=
Message-ID: <676991f4-6ddd-4cd0-a3f5-880cef369f62@arm.com>
Date: Thu, 5 Nov 2026 14:12:38 +0000
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
Subject: Re: [PATCH v2] arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in
 use
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 jic23@kernel.org, zengheng4@huawei.com, gshan@redhat.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261105123304.2281987-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261105123304.2281987-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

For patches that touch mpam and fs/resctrl the conventional prefix, as I understand it, should be
arm,fs/resctrl: and if it also touches the x86 rdt code it should then be arm,x86,fs/resctrl:.
Although, if possible please try and make separate patches for each.


On 05/11/2026 12:33, Jinjie Ruan wrote:
> On MPAM an RMID is a PMG within a PARTID, so resctrl can only allocate
> the PMGs of the CLOSIDs it uses. info/L3_MON/num_rmids is instead set
> to the whole PARTID and PMG space when the monitors are initialised,
> and halved when CDP is enabled. It reports more RMIDs than resctrl can
> allocate in two cases:
> 
> - With CDP each CLOSID takes two PARTIDs, and resctrl halves the
>   CLOSID count rounding down, while MPAM halves the whole RMID space.
>   With 5 PARTIDs and 2 PMGs resctrl has 2 CLOSIDs and 4 RMIDs, but
>   num_rmids reads 5. The count is too high whenever the number of
>   PARTIDs is odd and there is more than one PMG.
> 
> - On a monitor-only system there are no control groups and resctrl
>   only uses the default CLOSID, but num_rmids still covers every
>   PARTID. With 5 PARTIDs and 2 PMGs it reads 10 while only 2 RMIDs
>   can be allocated.
> 
> RMID allocation is limited to the CLOSIDs in use, so only the value
> reported to userspace is too high. Creating as many monitor groups as
> num_rmids allows fails with -ENOSPC before that number is reached.
> 
> Let resctrl tell the architecture how many CLOSIDs it uses on every
> mount. Add resctrl_arch_set_mon_rmid_count(), called after closid_init()

Is it really necessary for resctrl to tell the MPAM driver the number of CLOSIDs? Is there any case
where the MPAM driver doesn't just know how many CLOSIDs there will be?

Thanks,

Ben


> and before the info files are created, and have MPAM report
> (pmg_max + 1) RMIDs for each CLOSID. The CLOSID count already accounts
> for CDP, as schemata_list_add() halves it when CDP is enabled, so drop
> the halving in resctrl_arch_set_cdp_enabled(). A monitor-only system
> passes 1 for the default CLOSID. On x86 the RMIDs do not depend on the
> CLOSIDs and the hook does nothing.
> 
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Fenghua Yu <fenghuay@nvidia.com>
> ---
> v2:
> - Use the "arm_mpam: resctrl:" prefix.
> - Also fix num_rmids on monitor-only systems, as Ben suggested: add
>   resctrl_arch_set_mon_rmid_count() so resctrl reports the number of
>   CLOSIDs it uses, and remove the CDP-only rounding.
> - Retitle from "arm_mpam: Round the CDP RMID count down to whole CLOSIDs".
> - v1: https://lore.kernel.org/all/20261104101622.563280-1-ruanjinjie@huawei.com/
> ---
>  arch/x86/include/asm/resctrl.h |  3 +++
>  drivers/resctrl/mpam_resctrl.c | 18 ++++++++++++------
>  fs/resctrl/rdtgroup.c          |  2 ++
>  include/linux/resctrl.h        |  1 +
>  4 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
> index 8f6edcdcfd87..50165027b92d 100644
> --- a/arch/x86/include/asm/resctrl.h
> +++ b/arch/x86/include/asm/resctrl.h
> @@ -164,6 +164,9 @@ static inline bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 ignored,
>  	return READ_ONCE(tsk->rmid) == rmid;
>  }
>  
> +/* RMIDs are independent of CLOSIDs on x86. */
> +static inline void resctrl_arch_set_mon_rmid_count(u32 num_closid) { }
> +
>  static inline void resctrl_arch_sched_in(struct task_struct *tsk)
>  {
>  	if (static_branch_likely(&rdt_enable_key))
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5468367776e2..cca9568bab70 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -217,11 +217,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  	cdp_enabled = enable;
>  	mpam_resctrl_controls[rid].cdp_enabled = enable;
>  
> -	if (enable)
> -		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
> -	else
> -		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
> -
>  	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
>  	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
>  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = false;
> @@ -279,6 +274,16 @@ u32 resctrl_arch_system_num_rmid_idx(void)
>  	return (mpam_pmg_max + 1) * (mpam_partid_max + 1);
>  }
>  
> +void resctrl_arch_set_mon_rmid_count(u32 num_closid)
> +{
> +	struct rdt_resource *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res;
> +
> +	if (!l3->mon_capable)
> +		return;
> +
> +	l3->mon.num_rmid = (mpam_pmg_max + 1) * num_closid;
> +}
> +
>  u32 resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid)
>  {
>  	return closid * (mpam_pmg_max + 1) + rmid;
> @@ -1350,7 +1355,8 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>  	 * each control group. Hence, advertise the whole rmid_idx space even
>  	 * though each control group has its own pmg/rmid space. Unfortunately,
>  	 * this does mean userspace needs to know the architecture to correctly
> -	 * interpret this value.
> +	 * interpret this value. resctrl_arch_set_mon_rmid_count() replaces it
> +	 * with the RMIDs of the CLOSIDs in use when resctrl is mounted.
>  	 */
>  	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 106e78fb1f1d..2335dd7054ca 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -3214,6 +3214,8 @@ static int rdt_get_tree(struct fs_context *fc)
>  	if (ret)
>  		goto out_schemata_free;
>  
> +	resctrl_arch_set_mon_rmid_count(closids_supported() ?: 1);
> +
>  	if (resctrl_arch_mon_capable())
>  		flags |= RFTYPE_MON;
>  
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 10dfdca7f4bf..4a78f2e60bdf 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -417,6 +417,7 @@ static inline u32 resctrl_get_default_ctrl(struct rdt_resource *r)
>  /* The number of closid supported by this resource regardless of CDP */
>  u32 resctrl_arch_get_num_closid(struct rdt_resource *r);
>  u32 resctrl_arch_system_num_rmid_idx(void);
> +void resctrl_arch_set_mon_rmid_count(u32 num_closid);
>  int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
>  
>  bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,


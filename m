Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962904;
	b=wvqczitmVV2Gbm777ugUILHMDzYlOVCFkfCKBzCoPR6C/PJc8yvBs+ob6svFjOMclZI6
	 FtZDJcbHslQVgfxH6wCN3XirpMvhX+TBcrYoQa+OGAEEYvhpbD4F31V8RSQd6fPUQKXQ0
	 OPOLP8eVQXMsEgPjfj4kC8hcIT/iYfGWfM3IpD0oBYaQHyX8J+Di2FKbqUhT6mFxCTgiB
	 goMJc+bCDZFzdmDdJCIvDtpz9pZ01njbVxRrnQ7wBjN3V5i5/hjlD3rKoPFhVnW7LxBIp
	 5BZ4zvE6/GWLI3/cUbfqNdSP23YyjXqxWM1ebXBhVkIm1AklObZrIl+aCwFiqKPobZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962904;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZIHJgBIecluMYLROh71YXq+HCih/5D9ly7hK71I8Bb4=;
	b=k3AyCsNA9boCESnk5fMPDRoiTk99XN55Y3loMOoevZ6G4MsVmupY4fbi5TSLA8BdRpiS
	 IaWRmjKbgbvhCylH+JVa5u6Y5d4+MMJn8wPsiM1qpJ8YALBRvXH+id4MgJcLe8RB+rf9h
	 QSsKjaGA6PISDuUoqv9kHyUV2emSp9+kv5kaZLonF0xgPveNhMl0+iuIcGUnuA/rw6KBN
	 ME1XBCfub6foa3m9j617vgQXF+g0YT7xAJyK4xrT3PHaoPHcmiliCpy8WCcdf5Ox/uyZH
	 cVkumHXxN85jsC8ddv2L58ovbrx7Tbl4jsf0VbMkuTz6fzQlPiaP4RWhGjuY5+JWagg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=J8N5T5xe;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5569606A335
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5569606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=J8N5T5xe
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD1AF1476;
	Fri,  6 Nov 2026 03:01:39 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5C4B3F673;
	Fri,  6 Nov 2026 03:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793962903; bh=tuFbUaRK+W1wBzd5BZD3FUKT3qSXzJlu2M6LMGLUW8U=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=J8N5T5xe0WmE3JnueQsHlPV8nwzp8UA3pm5KFuiPkGTGALZ2nXy3Nqzla5vZVZySP
	 hK8ywbnVYFdQLEDgfaOPtw+r84YwAglMzJwl4sDpTysEuUyv7KrF8Wrrpn3YT2Qk8w
	 68/nUODgpukEWrpd/ejDVu9hZ2MkuCbSNjcoRmTo=
Message-ID: <28cbd086-af52-47c4-9e71-6957ab8caf76@arm.com>
Date: Fri, 6 Nov 2026 11:01:40 +0000
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
Subject: Re: [PATCH v3] arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in
 use
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, gshan@redhat.com,
 jic23@kernel.org, zengheng4@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106081923.2333070-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261106081923.2333070-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 06/11/2026 08:19, Jinjie Ruan wrote:
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
> Work out the number of CLOSIDs with the rules resctrl applies when it
> is mounted: schemata_list_add() halves a resource's CLOSID count
> while CDP is enabled on it, rounding down, closid_init() takes the
> smallest across the resources, and a monitor-only system has only the
> default CLOSID. Report (pmg_max + 1) RMIDs for each of those CLOSIDs,
> counting at monitor initialisation and from
> resctrl_arch_set_cdp_enabled(), which resctrl calls whenever a mount
> or unmount enables or disables CDP.
> 
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Fenghua Yu <fenghuay@nvidia.com>
> ---
> v3:
> - Drop resctrl_arch_set_mon_rmid_count() and count the CLOSIDs in the
>   MPAM driver instead, as Ben suggested.
> - v2: https://lore.kernel.org/all/20261105123304.2281987-1-ruanjinjie@huawei.com/
> v2:
> - Also fix num_rmids on monitor-only systems, as Ben suggested.
> - Retitle from "arm_mpam: Round the CDP RMID count down to whole CLOSIDs".
> - v1: https://lore.kernel.org/all/20261104101622.563280-1-ruanjinjie@huawei.com/
> ---
>  drivers/resctrl/mpam_resctrl.c | 45 +++++++++++++++++++++++-----------
>  1 file changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 5468367776e2..6859849f299b 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -191,6 +191,34 @@ static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
>  	 */
>  }
>  
> +/* The RMID count follows the CLOSIDs resctrl uses. */
> +static void mpam_resctrl_set_num_rmid(void)
> +{
> +	struct mpam_resctrl_res *res = &mpam_resctrl_controls[RDT_RESOURCE_L3];
> +	struct rdt_resource *l3 = &res->resctrl_res;
> +	enum resctrl_res_level rid;
> +	u32 num_closid = UINT_MAX;
> +
> +	for_each_mpam_resctrl_control(res, rid) {
> +		u32 res_num_closid;
> +
> +		if (!res->resctrl_res.alloc_capable)
> +			continue;
> +
> +		res_num_closid = mpam_partid_max + 1;
> +		if (res->cdp_enabled)
> +			res_num_closid /= 2;
> +
> +		num_closid = min(num_closid, res_num_closid);
> +	}

There are global variables mpam_partid_max, cdp_enabled and a helper resctrl_arch_alloc_capable().
Using these should make this simpler.

> +
> +	/* Monitor-only systems have only the default CLOSID. */
> +	if (num_closid == UINT_MAX)
> +		num_closid = 1;
> +
> +	l3->mon.num_rmid = (mpam_pmg_max + 1) * num_closid;
> +}
> +
>  int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  {
>  	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
> @@ -217,11 +245,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
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
> @@ -238,6 +261,8 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>  	if (!cdp_enabled && mpam_resctrl_controls[RDT_RESOURCE_MBA].class)
>  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>  
> +	mpam_resctrl_set_num_rmid();
> +

Why move the location of where num_rmid is set?

Thanks,

Ben

>  	if (enable) {
>  		if (mpam_partid_max < 1)
>  			return -EINVAL;
> @@ -1344,15 +1369,7 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
>  	l3->name = "L3";
>  	l3->mon_scope = RESCTRL_L3_CACHE;
>  
> -	/*
> -	 * num-rmid is the upper bound for the number of monitoring groups that
> -	 * can exist simultaneously, including the default monitoring group for
> -	 * each control group. Hence, advertise the whole rmid_idx space even
> -	 * though each control group has its own pmg/rmid space. Unfortunately,
> -	 * this does mean userspace needs to know the architecture to correctly
> -	 * interpret this value.
> -	 */
> -	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
> +	mpam_resctrl_set_num_rmid();
>  
>  	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
>  		int err;


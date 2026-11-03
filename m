Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738287;
	b=YrWScD7XK5t8iXgdSYgNhNOIXDIypNO5p8id5gexChUs1/zck0jNzw6pLnoZTgE6VROc
	 7vxhGQLuKZYM1TP68P4UhU23/HVgpo44BuWjmGbRnykjU+F3YwQgNtSjrpDcfnj39Uur8
	 eJXAw5vjMT7OnJ2xH9pKZHcVqenMRHtl9cvo1OGOGT+ApOnRg9y96tzAuh4EoOIh16Tm8
	 yGrxA23GrOzI5WJfMD7piUlebclZpMpPxiQDxNV99F5fWU9eDz7JlrbkvFOiOk7H4hyYi
	 tkvw4ngRIVBZFPQSrstZVeEh7mZo2eVx1g2+aGFsn67QoE7YX+T7BAYSRlMzNLYJddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738287;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=nwLsgWQzs9PIzdrqPDZrJU4oaof/dYF8/gdR+f91oDQ=;
	b=SrmLf5wfPCLcm0KRXstME8tCyAh4D9sUI1vDBWcehWhpMF0Nn8EOEKfB9cD4n4Dx0YVH
	 rBYOXzEFvvdZ3bBsjFJ2AiIKJmePH3ZjI7R83mS1tNKdtBOVhSPMUGX4vd0YehEbmirqo
	 8O8QkqBGBEjMQjVXUFRh3el1I22a5h/55Q+mHXIFSIjChu0Tkzjs6JLpZoNl8VgJa7uOg
	 +0pTl3qd8lQSCE4lG2SoklsRZlwIUIphRvVTDq0Z6ImH/li2ugSTCecuHviFBxk+WWGLF
	 EEnXqOS1G1Bk1rCXgkyN3nuQjoAnL+w9pblVvxB+H0Nn6nGJeWIPv/RhGEPgOI0aOUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pRw59Loc;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74222606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74222606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pRw59Loc
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A38FC1595;
	Tue,  3 Nov 2026 12:38:02 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A1273F628;
	Tue,  3 Nov 2026 12:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793738285; bh=v4f+ZcTwmhMVQW+hkqo9/0fxzyYeCSw0/Vypzw4+700=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pRw59Loc352clEtwVfFAdvHVo0Q2d5FrA0C2fo46uygA3nATPYsep4ecewRYnqTjh
	 LiHB5R+MzRP/3WzOnI3j05VKTNio0ST83cBp6EZZHje9RoixZUn4KPVDOD3tbEYFw9
	 OB05uuwxx+8JOhco0vsG+Me8fp1jFigiew7HoVA8=
Message-ID: <39e86f89-1d7f-481e-a066-a273bf41f5d8@arm.com>
Date: Tue, 3 Nov 2026 20:38:01 +0000
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
Subject: Re: [PATCH v9 06/12] x86,fs/resctrl: Move
 resctrl_arch_round_mon_val() out of line
To: Chen Yu <yu.c.chen@intel.com>, tony.luck@intel.com,
 reinette.chatre@intel.com
Cc: tglx@kernel.org, bp@alien8.de, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 babu.moger@amd.com, hongyu.ning@intel.com, chen.yu@linux.dev,
 x86@kernel.org, linux-kernel@vger.kernel.org
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <e3d614c6c6d9cbcb92e5dcc975cafae4bfb059a6.1791933001.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <e3d614c6c6d9cbcb92e5dcc975cafae4bfb059a6.1791933001.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Chen,

On 14/10/2026 03:59, Chen Yu wrote:
> resctrl_arch_round_mon_val() is an inline function in the architecture
> header. It is only called during resctrl initialization and when user space
> writes "max_threshold_occupancy", neither of which is a hot path that
> benefits from inlining.
> 
> Upcoming ERDT support needs resctrl_arch_round_mon_val() to consult
> ERDT-specific state. Keeping it inline would force ERDT prototypes into the
> architecture header, fragmenting the ERDT code across files.
> 
> Move resctrl_arch_round_mon_val() into monitor.c and declare it in
> include/linux/resctrl.h alongside the other resctrl_arch_*() calls. Move the
> MPAM stub from arm_mpam.h into mpam_resctrl.c accordingly.

For the MPAM part:

Acked-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben


> 
> No functional change.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> ---
> Changes since v8:
> - New patch. v8 added erdt_get_scale() and erdt_cpu_has() prototypes to
>   asm/resctrl.h only to keep resctrl_arch_round_mon_val() inline, which
>   fragmented the ERDT code. Move the function out of line instead so the
>   ERDT prototypes can stay in the resctrl internal header.
>   (Reinette Chatre)
> 
>  arch/x86/include/asm/resctrl.h        | 9 ---------
>  arch/x86/kernel/cpu/resctrl/monitor.c | 9 +++++++++
>  drivers/resctrl/mpam_resctrl.c        | 5 +++++
>  include/linux/arm_mpam.h              | 5 -----
>  include/linux/resctrl.h               | 1 +
>  5 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
> index 8f6edcdcfd87..738de74235bd 100644
> --- a/arch/x86/include/asm/resctrl.h
> +++ b/arch/x86/include/asm/resctrl.h
> @@ -130,15 +130,6 @@ static inline void __resctrl_sched_in(struct task_struct *tsk)
>  	}
>  }
>  
> -static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
> -{
> -	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
> -
> -	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
> -	val /= scale;
> -	return val * scale;
> -}
> -
>  static inline void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid,
>  							    u32 rmid)
>  {
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 6e46f10d8640..e42ee2769a39 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -421,6 +421,15 @@ __init void resctrl_arch_update_snc(void)
>  	snc_nodes_per_l3_cache = snc_get_config();
>  }
>  
> +unsigned int resctrl_arch_round_mon_val(unsigned int val)
> +{
> +	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
> +
> +	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
> +	val /= scale;
> +	return val * scale;
> +}
> +
>  int __init rdt_get_l3_mon_config(struct rdt_resource *r)
>  {
>  	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953a..5799c6bd4f98 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -143,6 +143,11 @@ void resctrl_arch_pre_mount(void)
>  {
>  }
>  
> +unsigned int resctrl_arch_round_mon_val(unsigned int val)
> +{
> +	return val;
> +}
> +
>  bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level rid)
>  {
>  	return mpam_resctrl_controls[rid].cdp_enabled;
> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
> index f92a36187a52..4c639e9c8e5b 100644
> --- a/include/linux/arm_mpam.h
> +++ b/include/linux/arm_mpam.h
> @@ -76,11 +76,6 @@ static inline void resctrl_arch_disable_mon(void) { }
>  static inline void resctrl_arch_enable_alloc(void) { }
>  static inline void resctrl_arch_disable_alloc(void) { }
>  
> -static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
> -{
> -	return val;
> -}
> -
>  /**
>   * mpam_register_requestor() - Register a requestor with the MPAM driver
>   * @partid_max:		The maximum PARTID value the requestor can generate.
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index dd09c2ce9a0f..c99561b19e7a 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -418,6 +418,7 @@ static inline u32 resctrl_get_default_ctrl(struct rdt_resource *r)
>  u32 resctrl_arch_get_num_closid(struct rdt_resource *r);
>  u32 resctrl_arch_system_num_rmid_idx(void);
>  int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid);
> +unsigned int resctrl_arch_round_mon_val(unsigned int val);
>  
>  bool resctrl_enable_mon_event(enum resctrl_event_id eventid, bool any_cpu,
>  			      unsigned int binary_bits, void *arch_priv);


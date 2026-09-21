Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB72472F87
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987763; cv=none; b=CrCn2q7eP6ylLfzjuY8dUnP4WZwZH8BcYTpwk8V/pnzsasei+odx4v1M7thragb9JXoUCpDYWjR7UVWPiYuzbL6epQWUGeyz7F/NdOu66HIwxFepYvabX4jw4xrbVo1b4DH+KejYQf1Pb0n+Jwf3XfLp4cg/SRzDxZCGeu7rR2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987763; c=relaxed/simple;
	bh=9o7yTLhz9SzHyUjPBzbtEcHgMvRczVEN9qxmMA9yeaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L8XKXd7vczzSkwj/4o39Bs0J+I5qMLr7/ebfytILrulEHnKiK2DywY+IcHz/3n8eSZyqLa9zAi78QznaWMwfCi4kXYteFYZJXzWn+hc+Dz8ugpPKajRpzORH+givJ7S2c5Ee7B3id18yXehxaLvXlHPKrEVlY56vTH3zz39ojIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Z8jfxHVc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Z8jfxHVc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACC191570;
	Mon, 21 Sep 2026 03:49:17 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F5943F86C;
	Mon, 21 Sep 2026 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789987761; bh=9o7yTLhz9SzHyUjPBzbtEcHgMvRczVEN9qxmMA9yeaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z8jfxHVc82UEC8sKQBeszp1LlJdDtPgx3JXoLf+y07rNFka9T7su2TcJWnfqAAbOU
	 ItZGost0xgs4dssYCw6BEqNWxRAGNJMUAmtIKASYyOZI3nm30vIVLyLsjpCT7mgZ9G
	 2Mfay7mD8Vmqj/fjOaWOaR1JAseMcKqpzezCY87w=
Message-ID: <49328ae0-19bf-4090-bc1e-c71ad4506b61@arm.com>
Date: Mon, 21 Sep 2026 11:49:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm_mpam: Use an atomic counter to schedule
 mpam_enable_once()
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, reinette.chatre@intel.com,
 fenghuay@nvidia.com
References: <20260915031809.4073512-1-leeonion.muyu@gmail.com>
 <20260915115646.54113-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260915115646.54113-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 15/09/2026 12:56, Ping Li wrote:
> mpam_discovery_cpu_online() scheduled mpam_enable() after each MSC
> probe, and mpam_enable() walked the whole MSC list taking each probe
> lock in turn to check if all the MSCs had been probed.
> 
> Count the MSCs that have had their hardware probed with
> mpam_num_msc_probed, and schedule mpam_enable_once() directly when the
> count reaches fw_num_msc, the number of MSCs reported by firmware.
> MSCs that were already probed no longer cause work to be scheduled.
> 
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
> Changes in v4:
> - Use guard(mutex) for the probe lock and continue/break to flatten
>   the nesting, per review feedback.
> - Compare the probed count against fw_num_msc instead of
>   mpam_num_msc, which is more robust against unbind/bind incrementing
>   mpam_num_msc past fw_num_msc.
> - Remove the stale comment for the removed mpam_enable() declaration.
> 
>  drivers/resctrl/mpam_devices.c  | 57 ++++++++++-----------------------
>  drivers/resctrl/mpam_internal.h |  2 --
>  2 files changed, 17 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 2f09f4b78bd3..adfb734755e6 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -49,12 +49,20 @@ static LIST_HEAD(mpam_all_msc);
>  
>  struct srcu_struct mpam_srcu;
>  
> +/* Number of MSCs reported by firmware */
> +static int fw_num_msc;
> +
>  /*
>   * Number of MSCs that have been probed. Once all MSCs have been probed MPAM
>   * can be enabled.
>   */
>  static atomic_t mpam_num_msc;
>  
> +/* Number of MSCs that have had their hardware probed */
> +static atomic_t mpam_num_msc_probed;
> +
> +static void mpam_enable_once(struct work_struct *work);
> +
>  static int mpam_cpuhp_state;
>  static DEFINE_MUTEX(mpam_cpuhp_state_lock);
>  
> @@ -72,7 +80,7 @@ static DEFINE_SPINLOCK(partid_max_lock);
>   * scheduled via this work_struct. If access to an MSC depends on a CPU that
>   * was not brought online at boot, this can happen surprisingly late.
>   */
> -static DECLARE_WORK(mpam_enable_work, &mpam_enable);
> +static DECLARE_WORK(mpam_enable_work, &mpam_enable_once);
>  
>  /*
>   * All mpam error interrupts indicate a software bug. On receipt, disable the
> @@ -1854,7 +1862,6 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>  {
>  	int err = 0;
>  	struct mpam_msc *msc;
> -	bool new_device_probed = false;
>  
>  	if (mpam_is_enabled())
>  		return 0;
> @@ -1865,18 +1872,18 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>  		if (!cpumask_test_cpu(cpu, &msc->accessibility))
>  			continue;
>  
> -		mutex_lock(&msc->probe_lock);
> -		if (!msc->probed)
> -			err = mpam_msc_hw_probe(msc);
> -		mutex_unlock(&msc->probe_lock);
> +		guard(mutex)(&msc->probe_lock);
> +		if (msc->probed)
> +			continue;
>  
> +		err = mpam_msc_hw_probe(msc);
>  		if (err)
>  			break;

Can we schedule the mpam_broken_work here to avoid having the same if condition twice?

Thanks,

Ben

> -		new_device_probed = true;
> +
> +		if (atomic_add_return(1, &mpam_num_msc_probed) == fw_num_msc)
> +			schedule_work(&mpam_enable_work);
>  	}
>  
> -	if (new_device_probed && !err)
> -		schedule_work(&mpam_enable_work);
>  	if (err) {
>  		mpam_disable_reason = "error during probing";
>  		schedule_work(&mpam_broken_work);
> @@ -2106,8 +2113,6 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  	return msc;
>  }
>  
> -static int fw_num_msc;
> -
>  static int mpam_msc_drv_probe(struct platform_device *pdev)
>  {
>  	int err;
> @@ -2713,7 +2718,7 @@ static int mpam_allocate_config(void)
>  	return 0;
>  }
>  
> -static void mpam_enable_once(void)
> +static void mpam_enable_once(struct work_struct *work)
>  {
>  	int err;
>  
> @@ -2867,34 +2872,6 @@ void mpam_disable(struct work_struct *ignored)
>  	pr_err_once("MPAM disabled due to %s\n", mpam_disable_reason);
>  }
>  
> -/*
> - * Enable mpam once all devices have been probed.
> - * Scheduled by mpam_discovery_cpu_online() once all devices have been created.
> - * Also scheduled when new devices are probed when new CPUs come online.
> - */
> -void mpam_enable(struct work_struct *work)
> -{
> -	static atomic_t once;
> -	struct mpam_msc *msc;
> -	bool all_devices_probed = true;
> -
> -	/* Have we probed all the hw devices? */
> -	guard(srcu)(&mpam_srcu);
> -	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
> -				 srcu_read_lock_held(&mpam_srcu)) {
> -		mutex_lock(&msc->probe_lock);
> -		if (!msc->probed)
> -			all_devices_probed = false;
> -		mutex_unlock(&msc->probe_lock);
> -
> -		if (!all_devices_probed)
> -			break;
> -	}
> -
> -	if (all_devices_probed && !atomic_fetch_inc(&once))
> -		mpam_enable_once();
> -}
> -
>  #define maybe_update_config(cfg, feature, newcfg, member, changes) do { \
>  	if (mpam_has_feature(feature, newcfg) &&			\
>  	    (newcfg)->member != (cfg)->member) {			\
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 04d1a59f02af..085f086e2b2d 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -452,8 +452,6 @@ extern struct list_head mpam_classes;
>  extern u16 mpam_partid_max;
>  extern u8 mpam_pmg_max;
>  
> -/* Scheduled work callback to enable mpam once all MSC have been probed */
> -void mpam_enable(struct work_struct *work);
>  void mpam_disable(struct work_struct *work);
>  
>  /* Reset all the RIS in a class under cpus_read_lock() */


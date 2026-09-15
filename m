Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E459F217723
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465707; cv=none; b=FwWH8fbwZgHSMgMlpr5yF3IroJJbNihg/0vD8URxoSE1BpVT5pMnds0yXikCa5XLBoy3w0E9Gza7Cqvyecg2scZJQi8OsHug3IpWI/T9+BCL+/7TWtcB6Wb1+qDCTihP6fKYRderoaCtkrQJnuDhroDEVLQlL5k+ne8SY7R8fZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465707; c=relaxed/simple;
	bh=nNUZwWZTjfC4pbKSyfiSUBNW2K4fvTlpDNJxgeBCviU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StakPdx2k7ia1C8rJRTBhx2/mHadjSXMcv843y+ZNCKsrXlETg56n6N/XqMBvSuWU1Hp33O89c+jvGdvPKgTTp6vMvvgxKTs5owBV3AfAe3uujXngv71S55gd6r0DStVqkOTJ9Ti1zDKFVSZzeI807F7S1KCry/rc+21wKYOL1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KlbAETCK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KlbAETCK"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8FE7169C;
	Tue, 15 Sep 2026 02:48:20 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8035F3F86F;
	Tue, 15 Sep 2026 02:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789465704; bh=nNUZwWZTjfC4pbKSyfiSUBNW2K4fvTlpDNJxgeBCviU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KlbAETCK49u7Uhsvu27653ZiA2SYi5l4cJPJuBjC4qkCOOosquhl6jn+/kb33OIFr
	 8h7iTLUVyOr3nZ1BlcWvULVeO8Ks7Es/nM69kexTRXbkOgVj/RFaz+7F+8/c50eaZX
	 QZrUsvnt4cn4zOu7P5GyfX2PE4rPLrWFSk8XPBgU=
Message-ID: <1cba4015-cd0f-4f35-8feb-65bf6b027039@arm.com>
Date: Tue, 15 Sep 2026 10:48:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm_mpam: Use an atomic counter to schedule
 mpam_enable_once()
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, reinette.chatre@intel.com,
 fenghuay@nvidia.com
References: <20260908024846.2063161-1-ping.li@horizon.auto>
 <20260915031809.4073512-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260915031809.4073512-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ping,

On 15/09/2026 04:18, Ping Li wrote:
> mpam_discovery_cpu_online() scheduled mpam_enable() after each MSC
> probe, and mpam_enable() walked the whole MSC list taking each probe
> lock in turn to check if all the MSCs had been probed.
> 
> Count the MSCs that have had their hardware probed with
> mpam_num_msc_probed, and schedule mpam_enable_once() directly when the
> count reaches mpam_num_msc, the number of MSCs the driver discovered.
> MSCs that were already probed no longer cause work to be scheduled.
> 
> Suggested-by: Ben Horgan <ben.horgan@arm.com>

Thanks for implementing the suggestion :)

> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
> ---
> Changes in v3:
> - Rework per review feedback: instead of scheduling mpam_enable() after
>   each probe and walking the MSC list to check whether all MSCs have
>   been probed, count the probed MSCs and schedule mpam_enable_once()
>   directly when the last one is probed.
> 
>  drivers/resctrl/mpam_devices.c  | 47 +++++++++------------------------
>  drivers/resctrl/mpam_internal.h |  1 -
>  2 files changed, 12 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 2f09f4b78bd3..c6000bc2157a 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -55,6 +55,11 @@ struct srcu_struct mpam_srcu;
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
> @@ -72,7 +77,7 @@ static DEFINE_SPINLOCK(partid_max_lock);
>   * scheduled via this work_struct. If access to an MSC depends on a CPU that
>   * was not brought online at boot, this can happen surprisingly late.
>   */
> -static DECLARE_WORK(mpam_enable_work, &mpam_enable);
> +static DECLARE_WORK(mpam_enable_work, &mpam_enable_once);
>  
>  /*
>   * All mpam error interrupts indicate a software bug. On receipt, disable the
> @@ -1854,7 +1859,6 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>  {
>  	int err = 0;
>  	struct mpam_msc *msc;
> -	bool new_device_probed = false;
>  
>  	if (mpam_is_enabled())
>  		return 0;
> @@ -1866,17 +1870,18 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>  			continue;
>  
>  		mutex_lock(&msc->probe_lock);

If we switch to use guard(mutex)(&msc->probe_lock) then we can get rid of the nested ifs.
This allows us to...

> -		if (!msc->probed)
... 'continue' if already probed

> +		if (!msc->probed) {
>  			err = mpam_msc_hw_probe(msc);
... return early on error

> +			if (!err && atomic_add_return(1, &mpam_num_msc_probed) ==
> +			    atomic_read(&mpam_num_msc))

... and remove the !err from this check.

Instead of mpam_num_msc check against fw_num_msc so that we don't need to take into account extra
calls to mpam_msc_drv_probe() due to unbind/bind potentially incrementing mpam_num_msc past
fw_num_msc. As we disable bind/unbind by setting 'suppress_bind_attrs' this can't actually occur but
I think using fw_num_msc is more robust.

> +				schedule_work(&mpam_enable_work);
> +		}
>  		mutex_unlock(&msc->probe_lock);
>  
>  		if (err)
>  			break;
> -		new_device_probed = true;
>  	}
>  
> -	if (new_device_probed && !err)
> -		schedule_work(&mpam_enable_work);
>  	if (err) {
>  		mpam_disable_reason = "error during probing";
>  		schedule_work(&mpam_broken_work);
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
> index 04d1a59f02af..72bf296c846e 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -453,7 +453,6 @@ extern u16 mpam_partid_max;
>  extern u8 mpam_pmg_max;
>  
>  /* Scheduled work callback to enable mpam once all MSC have been probed */

This comment should be removed along with the declaration.

Thanks,

Ben

> -void mpam_enable(struct work_struct *work);
>  void mpam_disable(struct work_struct *work);
>  
>  /* Reset all the RIS in a class under cpus_read_lock() */


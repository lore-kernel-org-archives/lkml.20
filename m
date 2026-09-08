Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262FC3A5E71
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854014; cv=none; b=H0r5dZJB1jX8MzgBjDYcbF73MVQhO4QwR1HZpXAmv3CaBhABWDcxnrROVLFgqA6wjJObTv34DvemBzZkIXJ2M4ojNrMvgYkD5PVX8rMghYYCgVvxQdhQpZVZAqVuXDbzZ60k2eTncOEs0eaPRbzm6VdU826Efqn0YwhaC8e1dmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854014; c=relaxed/simple;
	bh=hcpVV2fsjFJ9iVxy/n/1+HmsN3SKPeS9RFLwHncS4MQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VrwoOLzWXEPj+DGs0w7ELBqQ4twts+fZtbe2X9AVebN3np7oXQB2vvkBl1LuoWMOCQDbcsuWMoS0M4ax/Kl71mlSvkecjuIRPR7+2j7SWP5i7Krm7z7Eh+6jXufp8FoGvrDBCBD6cGm74sPhmg3VRuZnhQh3J0UEwcBlHl5e1Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rdphmNXi; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="rdphmNXi"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LLp5MpbKRZcQy5kIiW+rVCn3SKCXVFaiVdq9xrOItaA=;
	b=rdphmNXi90D+3lsmnxg58VtVlzJJcX0L0ASUSawkWkwzeDG5yQnArgfm7LgVpGovSzwOMEi3D
	k90h4SKzB3LyZjpuhuwyoguBh2Ym6Ur8jNJHSQqSw77k9wBogpsPrLf5bnjB6Lcw1r5oWri5qPl
	E9tkMKFZiIZT74wxSNj8bgU=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hfG9n6Bm0zcb3H;
	Tue,  8 Sep 2026 15:42:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 65D4640561;
	Tue,  8 Sep 2026 15:53:18 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 15:53:17 +0800
Message-ID: <01fefdd7-f007-4ac8-93f0-5267dddae451@huawei.com>
Date: Tue, 8 Sep 2026 15:53:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/19] arm64: smp: Tidy up cpuinfo init and cpufeature
 updates
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-7-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-7-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> Populating the 'cpuinfo_arm64' structure during CPU bringup and
> subsequently checking/updating cpufeature structures is slightly
> convoluted and differs unnecessarily between the boot CPU and secondary
> CPUs.
> 
> Rework the code so that cpuinfo_store_cpu() is used to populate the
> 'cpuinfo_arm64' structure for each CPU, with secondary CPUs then calling
> update_cpu_features() to update the global view of the available
> features. This allows us to internalise the 'boot_cpu_data' in
> cpufeature.c and paves the way for parallelising the ID register probing
> during bring-up of secondary CPUs.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/cpu.h   |  7 +++----
>  arch/arm64/kernel/cpufeature.c | 21 +++++++++++++++++----
>  arch/arm64/kernel/cpuinfo.c    | 11 -----------
>  arch/arm64/kernel/smp.c        |  3 ++-
>  4 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
> index 3c008821219c..733178520c45 100644
> --- a/arch/arm64/include/asm/cpu.h
> +++ b/arch/arm64/include/asm/cpu.h
> @@ -73,11 +73,10 @@ struct cpuinfo_arm64 {
>  DECLARE_PER_CPU(struct cpuinfo_arm64, cpu_data);
>  
>  void cpuinfo_store_cpu(void);
> -void __init cpuinfo_store_boot_cpu(void);
>  
> -void __init init_cpu_features(struct cpuinfo_arm64 *info);
> -void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
> -				 struct cpuinfo_arm64 *boot);
> +void __init init_cpu_features(void);

init_cpu_features() now only used in cpufeature.c, we can remove this
declaration and make it static in cpufeature.c.

> +void update_cpu_features(int cpu);
> +
>  bool gmid_el1_accessible(const struct cpuinfo_arm64 *info);
>  
>  #endif /* __ASM_CPU_H */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 32102c3912fa..33279a264145 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -117,6 +117,7 @@ EXPORT_SYMBOL(system_cpucaps);
>  static struct arm64_cpu_capabilities const __ro_after_init *cpucap_ptrs[ARM64_NCAPS];
>  
>  DECLARE_BITMAP(boot_cpucaps, ARM64_NCAPS);
> +static struct cpuinfo_arm64 boot_cpu_data;
>  
>  /*
>   * arm64_use_ng_mappings must be placed in the .data section, otherwise it
> @@ -1205,11 +1206,19 @@ bool gmid_el1_accessible(const struct cpuinfo_arm64 *info)
>  	return mte >= ID_AA64PFR1_EL1_MTE_MTE2;
>  }
>  
> -void __init init_cpu_features(struct cpuinfo_arm64 *info)
> +void __init init_cpu_features(void)
>  {

Maybe rename to init_boot_cpu_features() ?


Otherwise LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
> +
>  	/* Before we start using the tables, make sure it is sorted */
>  	sort_ftr_regs();
>  
> +	/*
> +	 * We keep a copy of the boot CPU registers so that physical hotplug
> +	 * of CPU 0 can still be properly checked.
> +	 */
> +	boot_cpu_data = *info;
> +
>  	init_cpu_ftr_reg(SYS_CTR_EL0, info->reg_ctr);
>  	init_cpu_ftr_reg(SYS_DCZID_EL0, info->reg_dczid);
>  	init_cpu_ftr_reg(SYS_CNTFRQ_EL0, info->reg_cntfrq);
> @@ -1404,12 +1413,14 @@ static int update_32bit_cpu_features(int cpu, struct cpuinfo_32bit *info,
>   * non-boot CPU. Also performs SANITY checks to make sure that there
>   * aren't any insane variations from that of the boot CPU.
>   */
> -void update_cpu_features(int cpu,
> -			 struct cpuinfo_arm64 *info,
> -			 struct cpuinfo_arm64 *boot)
> +void update_cpu_features(int cpu)
>  {
> +	struct cpuinfo_arm64 *boot, *info;
>  	int taint = 0;
>  
> +	boot = &boot_cpu_data;
> +	info = per_cpu_ptr(&cpu_data, cpu);
> +
>  	/*
>  	 * The kernel can handle differing I-cache policies, but otherwise
>  	 * caches should look identical. Userspace JITs will make use of
> @@ -3978,6 +3989,8 @@ static void __init setup_boot_cpu_capabilities(void)
>  
>  void __init setup_boot_cpu_features(void)
>  {
> +	init_cpu_features();
> +
>  	/*
>  	 * Initialize the indirect array of CPU capabilities pointers before we
>  	 * handle the boot CPU.
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 45c63f3d75c5..b423301a13cc 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -31,7 +31,6 @@
>   * values depending on configuration at or after reset.
>   */
>  DEFINE_PER_CPU(struct cpuinfo_arm64, cpu_data);
> -static struct cpuinfo_arm64 boot_cpu_data;
>  
>  static inline const char *icache_policy_str(int l1ip)
>  {
> @@ -531,14 +530,4 @@ void cpuinfo_store_cpu(void)
>  {
>  	struct cpuinfo_arm64 *info = this_cpu_ptr(&cpu_data);
>  	__cpuinfo_store_cpu(info);
> -	update_cpu_features(smp_processor_id(), info, &boot_cpu_data);
> -}
> -
> -void __init cpuinfo_store_boot_cpu(void)
> -{
> -	struct cpuinfo_arm64 *info = &per_cpu(cpu_data, 0);
> -	__cpuinfo_store_cpu(info);
> -
> -	boot_cpu_data = *info;
> -	init_cpu_features(&boot_cpu_data);
>  }
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index ff045080ca1b..f4cabf9e19e6 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -235,6 +235,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	 * Log the CPU info before it is marked online and might get read.
>  	 */
>  	cpuinfo_store_cpu();
> +	update_cpu_features(cpu);
>  	store_cpu_topology(cpu);
>  
>  	/*
> @@ -455,7 +456,7 @@ void __init smp_prepare_boot_cpu(void)
>  	 */
>  	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
>  
> -	cpuinfo_store_boot_cpu();
> +	cpuinfo_store_cpu();
>  	setup_boot_cpu_features();
>  
>  	/* Conditionally switch to GIC PMR for interrupt masking */


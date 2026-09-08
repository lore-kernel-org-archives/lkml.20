Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAA851476B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867360; cv=none; b=r4TS7jxiVN0TXe+iz8RsOjcuMqnnhhmHbYUq2dad6h0JVVck4trqlvk0siYqkXhe8mvyJNsZsGMAurZHtDeVpdiSimGhM0HCdxXBcxz63M5eKdKnI3jtMhMSPXDDGARnGAa+ZRP2yr2V+xTRgq3o7IA/12xKm3TieKOEifPyiyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867360; c=relaxed/simple;
	bh=IBHWvARfOwBInFcGHh1VbpTA1VN0yCgxQc7blVi7oaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iBsiaUriSzauSlcWftxiiN0LgPnWVmNvb/jE9GU62UUsU57ThY6OJaFQpmYa5ISSzy7v5plvW6pqR+9D2HoL6VQT8F7L8n/oS+aLJIwzXeP9Om+UY5oGUUKpWNI+F83aPfsXULDaB6Zt18SQ/LR/jC5bsXB0DWXlx7k2pJbfV2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=RnEFyQj2; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="RnEFyQj2"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Lxu+jtNFToYdLxTytr/I9mfTRhn0vf5PcvRLft8Q8pg=;
	b=RnEFyQj2evgRv1emXPf5fVmna1/HIRR+oFNx9asjTCtn+sTc3YgEfJBaiviv5hGFOXmDEgnVr
	MmDt1Pq4YuNW7CKPxiuDHQsFQPr64iJO15DNyqvV3cEpTiw2C9qcwrqRH7xhrg4UsRh0Zq1mCmR
	c4dE4c9w1oSw6RBbDnudEMc=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hfM6V6rFPzcb3G;
	Tue,  8 Sep 2026 19:24:50 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CA83A40561;
	Tue,  8 Sep 2026 19:35:47 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 19:35:47 +0800
Message-ID: <2f75098e-bc2c-4692-8325-809983042a9d@huawei.com>
Date: Tue, 8 Sep 2026 19:35:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/19] arm64: smp: Use generic HOTPLUG_SPLIT_STARTUP
 machinery for CPU onlining
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-12-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-12-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> In preparation for enabling parallel bringup of secondary CPUs on arm64,
> take the baby step of moving from HOTPLUG_CORE_SYNC_FULL to
> HOTPLUG_SPLIT_STARTUP.
> 
> Rework the cpu_die_early() path to use a private cpumask, otherwise
> clearing the incoming CPU from the present mask in the 'kick' stage will
> prevent the hotplug stage machine from progressing and
> arch_cpuhp_cleanup_kick_cpu() will not be called.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/Kconfig           | 2 +-
>  arch/arm64/include/asm/smp.h | 1 +
>  arch/arm64/kernel/smp.c      | 9 +++++----
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 89d1f0f2269c..fd8cf792b7fd 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -230,7 +230,7 @@ config ARM64
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
> -	select HOTPLUG_CORE_SYNC_FULL
> +	select HOTPLUG_SPLIT_STARTUP
>  	select HOTPLUG_SMT if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index fe343c30d620..7b986a6a765b 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -89,6 +89,7 @@ asmlinkage void secondary_start_kernel(void);
>  struct secondary_data {
>  	struct task_struct *task;
>  	long status;
> +	cpumask_t cpu_died_early_mask;
>  };
>  
>  extern struct secondary_data secondary_data;
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 00362ed6e1ab..c5e9d5d5e003 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -62,7 +62,7 @@
>   * so we need some other way of telling a new secondary core
>   * where to place its SVC stack
>   */
> -struct secondary_data secondary_data;
> +struct secondary_data secondary_data = {};
>  /* Number of CPUs which aren't online, but looping in kernel text. */
>  static int cpus_stuck_in_kernel;
>  
> @@ -108,7 +108,7 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
>  	return -EOPNOTSUPP;
>  }
>  
> -int __cpu_up(unsigned int cpu, struct task_struct *idle)
> +int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *idle)
>  {
>  	int ret;
>  
> @@ -146,6 +146,8 @@ void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
>  		cpus_stuck_in_kernel++;
>  		break;
>  	case CPU_KILL_ME:
> +		if (cpumask_test_cpu(cpu, &secondary_data.cpu_died_early_mask))
> +			set_cpu_present(cpu, false);

Should we set_cpu_present(cpu, false) in CPU_STUCK_IN_KERNEL case, as we
do not update to CPU_KILL_ME but CPU_STUCK_IN_KERNEL if
CONFIG_HOTPLUG_CPU is not enabled.

>  		if (!op_cpu_kill(cpu)) {
>  			pr_crit("CPU%u: died during early boot\n", cpu);
>  			break;
> @@ -406,8 +408,7 @@ void __noreturn cpu_die_early(void)
>  
>  	pr_crit("CPU%d: will not boot\n", cpu);
>  
> -	/* Mark this CPU absent */
> -	set_cpu_present(cpu, 0);
> +	cpumask_set_cpu(cpu, &secondary_data.cpu_died_early_mask);
>  
>  	if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
>  		update_cpu_boot_status(CPU_KILL_ME);


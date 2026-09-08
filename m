Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49425396597
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858071; cv=none; b=GSiDsQHJJvwVsk+m3ffR0OQThzh316aAmRzTujDeTJ39BH+N507yGPdPsK0kv7kOdzVpKJAA3B5htcC6x1A1Wri/K/JKa/jEYXRyrpv5MIt2/3jOI4Tg1VOlBeqRgyV2zaD5P2ilOQvtrtEJLjgkNTrTF9j42mLHagu/W7UtS+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858071; c=relaxed/simple;
	bh=/gp4VHmXhaDdM8iEK4ZRmOsgoFV+hd5D5PLmgTYvckk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MDHLYaIX/FvzRSgkq6+13lBz0+mOfU798NbkvayH0vlcscTICAiaPtfA9gV5hZzL9lBZryzhomvCaNDLGtwx7eQu/fJhyZzfZM9XaRUgvP9RtHtpdyUVcFD5JRQEQOR8ME+3F2aHp8O9Zb0k6K+wQg75rbQ4iy2kKQiWAWW9YvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Bi42GNvf; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Bi42GNvf"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8oV5ye1wgWjHNd8tXu58PgTkZM2DHpGDoyc6w2RJVgo=;
	b=Bi42GNvfGmpW9FSu3mshrdNpZpnDhVG9tNARiG2dNch48diDG04bYgVFUK/u/5lk1LvZYZJeA
	WlWN1ZQo/NqoSIivdLTrfiBbF6MXzohJdbUkaAZAJ2x/ktqZYC8q9RxALGt6T02y4Q78mjzEe0C
	fJCsq1jWGdepbc9gEwc4Z2E=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hfHgx0nHkzcb3G;
	Tue,  8 Sep 2026 16:50:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BBEAF4057D;
	Tue,  8 Sep 2026 17:01:01 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 17:01:01 +0800
Message-ID: <a6694c1a-6437-4173-97a0-f3c892707d7f@huawei.com>
Date: Tue, 8 Sep 2026 17:01:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] arm64: smp: Use generic HOTPLUG_CORE_SYNC_FULL
 machinery for CPU onlining
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-11-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-11-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> Select HOTPLUG_CORE_SYNC_FULL on arm64 to replace the 'cpu_running'
> completion with the generic code for synchronising with secondary CPUs
> during boot.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/Kconfig           |  2 +-
>  arch/arm64/include/asm/smp.h |  1 -
>  arch/arm64/kernel/smp.c      | 39 +++++++++++++++++-------------------
>  3 files changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5a51b0ef944..89d1f0f2269c 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -230,7 +230,7 @@ config ARM64
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
> -	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
> +	select HOTPLUG_CORE_SYNC_FULL
>  	select HOTPLUG_SMT if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index 10ea4f543069..fe343c30d620 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -12,7 +12,6 @@
>  #define CPU_BOOT_STATUS_MASK		((UL(1) << CPU_STUCK_REASON_SHIFT) - 1)
>  
>  #define CPU_MMU_OFF			(-1)
> -#define CPU_BOOT_SUCCESS		(0)
>  /* The cpu invoked ops->cpu_die, synchronise it with cpu_kill */
>  #define CPU_KILL_ME			(1)
>  /* The cpu couldn't die gracefully and is looping in the kernel */
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index ff68640d0c0b..00362ed6e1ab 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -108,12 +108,9 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
>  	return -EOPNOTSUPP;
>  }
>  
> -static DECLARE_COMPLETION(cpu_running);
> -
>  int __cpu_up(unsigned int cpu, struct task_struct *idle)
>  {
>  	int ret;
> -	long status;
>  
>  	/*
>  	 * We need to tell the secondary core where to find its stack and the
> @@ -124,27 +121,24 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
>  
>  	/* Now bring the CPU into our world */
>  	ret = boot_secondary(cpu, idle);
> -	if (ret) {
> -		if (ret != -EPERM)
> -			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
> -		return ret;
> -	}
> +	if (ret && ret != -EPERM)
> +		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
> +	return ret;
> +}
>  
> -	/*
> -	 * CPU was successfully started, wait for it to come online or
> -	 * time out.
> -	 */
> -	wait_for_completion_timeout(&cpu_running,
> -				    msecs_to_jiffies(5000));
> -	if (cpu_online(cpu))
> -		return 0;
> +void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
> +{
> +	long status;
> +
> +	if (is_alive)
> +		return;
>  
> -	pr_crit("CPU%u: failed to come online\n", cpu);
>  	secondary_data.task = NULL;
>  	status = READ_ONCE(secondary_data.status);
>  	if (status == CPU_MMU_OFF)
>  		status = READ_ONCE(__early_cpu_boot_status);
>  
> +	/* A CPU has failed to boot. Try to figure out what happened. */
>  	switch (status & CPU_BOOT_STATUS_MASK) {
>  	default:
>  		pr_err("CPU%u: failed in unknown state : 0x%lx\n",
> @@ -171,8 +165,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
>  	case CPU_PANIC_KERNEL:
>  		panic("CPU%u detected unsupported configuration\n", cpu);
>  	}
> -
> -	return -EIO;
>  }
>  
>  static void init_gic_priority_masking(void)
> @@ -234,6 +226,13 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	 * Log the CPU info before it is marked online and might get read.
>  	 */
>  	cpuinfo_store_cpu();
> +
> +	/*
> +	 * Synchronise with the core bringing us online so that it knows
> +	 * we made it into the kernel. We're still not 'online'.
> +	 */
> +	cpuhp_ap_sync_alive();
> +
>  	update_cpu_features(cpu);
>  	store_cpu_topology(cpu);
>  
> @@ -255,9 +254,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	pr_info("CPU%u: Booted secondary processor 0x%010lx [0x%08x]\n",
>  					 cpu, (unsigned long)mpidr,
>  					 read_cpuid_id());
> -	update_cpu_boot_status(CPU_BOOT_SUCCESS);
>  	set_cpu_online(cpu, true);
> -	complete(&cpu_running);

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  	/*
>  	 * Secondary CPUs enter the kernel with all DAIF exceptions masked.


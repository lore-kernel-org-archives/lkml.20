Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E55357D11
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788840016; cv=none; b=ZkZbahQ1BjAEwdrzD7PqU4tuge33r3WeTLaw5Zq52OMhiz5zw2WT0ZD8ZXX0DaHR4tBLtvI52XG772hxGOdWiwl4KMNWJXDM6e1zJuEpigSmjQp3G4SzaDsGsis21HsbSqDN64CiQzIF1zAUlWDEJjz2WDD/TQf9IYyockZf6kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788840016; c=relaxed/simple;
	bh=w6yrpgyhzNmRI5aodd17/jcO/g8HDH/eJ92xh97skGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IbF+vHCVqdH+x6I2QVOkvCHtHw7n369lrwNaemhJpzU1NkWuCXhHvx6AvZYduFSWzlrfcdRTQ5554OphtnxKdekldohnS4/DGW4VKYzjXpcwzLwzjQ6RYEwsvHHMWcRrEp0HhT6FFpcpGQOuBxhexBJmQytMgKfBpEjblqbleU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=mchR9rE2; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="mchR9rE2"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=d1UTSXGSQkkvgkrqYy9bvZK/+3gHrgJ5ygCju4XwVTg=;
	b=mchR9rE2nyqD1cIlEWA9dMP6ivzol7DreZVvnwQZqpOLftIlidfw9ttxQTJoMno9RoWwG+xI2
	pv0uE7+l2byS8sk7aSoLqYNRT4ztah/riAGlbDZ4qEBxK2C76J7ZrybIKd5ZsmC72N7+yT7mspj
	S6YnIBW1dSuGNVbfrgoX3Dg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hf90g6P19z1prM0;
	Tue,  8 Sep 2026 11:49:07 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 0E41440537;
	Tue,  8 Sep 2026 12:00:03 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 12:00:02 +0800
Message-ID: <90935a12-a728-4c73-a538-06752b783210@huawei.com>
Date: Tue, 8 Sep 2026 12:00:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] cpu/hotplug: Avoid busy-polling on archs where
 cpu_relax() is a no-op
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-4-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-4-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> On some architectures (such as arm64), cpu_relax() is effectively a NOP
> and so isn't particularly efficient when used in a tight polling loop

Yes, a "yield" instruction in aarch64 is essentially a nop, with no
power optimization effect.

However, x86 "PAUSE" provides power optimization benefits.

> such as the CPU state synchronisation in cpuhp_wait_for_sync_state().
> 
> Once an incoming CPU has reached the SYNC_STATE_ALIVE state, we know
> that it is executing within the kernel and so we can use the more
> efficient polling mechanism provided by the atomic_cond_read* API.

Right! Once the secondary CPU state transitions to SYNC_STATE_ALIVE, it
is already executing kernel C code.

> 
> Extend the generic implementation of arch_cpuhp_sync_state_poll() to
> take the state details as additional parameters and polling using
> atomic_cond_read_relaxed() instead of cpu_relax() once we have reached
> the alive state. No change on x86.

Right! x86 still use cpu_relax() for atomic_cond_read_relaxed().

And we can aslo mention that this also allow RISC-V to leverage the
Zawrs extension for low-power stalling instead of busy-wasting cycles
with cpu_relax().

> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/x86/kernel/smpboot.c  |  2 +-
>  include/linux/cpuhotplug.h |  2 +-
>  kernel/cpu.c               | 13 +++++++++----
>  3 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index ba01a9e919b7..362f85cbdbaf 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -1138,7 +1138,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
>  		pr_info("CPU %u is now offline\n", cpu);
>  }
>  
> -void arch_cpuhp_sync_state_poll(void)
> +void arch_cpuhp_sync_state_poll(atomic_t *st, int old)
>  {
>  	if (smp_ops.poll_sync_state)
>  		smp_ops.poll_sync_state();
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index feb32949aeea..bbcee650155f 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -509,7 +509,7 @@ static inline void cpuhp_online_idle(enum cpuhp_state state) { }
>  struct task_struct;
>  
>  void cpuhp_ap_sync_alive(void);
> -void arch_cpuhp_sync_state_poll(void);
> +void arch_cpuhp_sync_state_poll(atomic_t *st, int old);
>  void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
>  int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
>  bool arch_cpuhp_init_parallel_bringup(void);
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 97a9bfe4edad..d9fe204f02cb 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -303,7 +303,13 @@ static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
>  	(void)atomic_xchg(st, state);
>  }
>  
> -void __weak arch_cpuhp_sync_state_poll(void) { cpu_relax(); }
> +void __weak arch_cpuhp_sync_state_poll(atomic_t *st, int old)
> +{
> +	if (old < SYNC_STATE_ALIVE)
> +		cpu_relax();
> +	else
> +		atomic_cond_read_relaxed(st, VAL != old);
> +}

With atomic_cond_read_relaxed(), we can use WFE to improve the power for
arm64.

>  
>  static bool cpuhp_wait_for_sync_state(unsigned int cpu, enum cpuhp_sync_state state,
>  				      enum cpuhp_sync_state next_state)
> @@ -328,7 +334,7 @@ static bool cpuhp_wait_for_sync_state(unsigned int cpu, enum cpuhp_sync_state st
>  			return false;
>  		} else if (now - start < NSEC_PER_MSEC) {
>  			/* Poll for one millisecond */
> -			arch_cpuhp_sync_state_poll();
> +			arch_cpuhp_sync_state_poll(st, sync);
>  		} else {
>  			usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);
>  		}
> @@ -395,8 +401,7 @@ void cpuhp_ap_sync_alive(void)
>  	cpuhp_ap_update_sync_state(SYNC_STATE_ALIVE);
>  
>  	/* Wait for the control CPU to release it. */
> -	while (atomic_read(st) != SYNC_STATE_SHOULD_ONLINE)
> -		cpu_relax();
> +	atomic_cond_read_acquire(st, VAL == SYNC_STATE_SHOULD_ONLINE);

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  }
>  
>  static bool cpuhp_can_boot_ap(unsigned int cpu)


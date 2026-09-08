Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E2B339366
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788840365; cv=none; b=ncTxH1piWDCmrdN2vjccgXf4cMirv7GucYtwr/DbzatwN7iZzsvltKspu2dsNBCx33kerEBuBNtRnvyDoknT25L0d2oirOwtjY622QzIjvsL+j24gHQpFVzqgC2JZYWHoeE74uhv4evsYJ/tH3VlpO/J83Sjpd5ZgPcL2WyvQas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788840365; c=relaxed/simple;
	bh=BzkrVY7N0f0jJ21ZghRjZSDuCU7xjBj4oxcDXztZhhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SzluIVFZl4dhphFdd5JPwmFI321dWJkB7Bqz/Vd5vXxStt4ttoevkALzV3g96UHzuoc4azYJJv738XD4gLNZnBbTU1OhMJFKC+Eys2EKD1K+gpbD7wlpH/6qebtUtH6kjOiBorwaSKzN+ZVuebE3Y1ULltXFr4HETXgXypNcaO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=hNLv1gqR; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="hNLv1gqR"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RHZmdRFzTl+eWGNSymg/i0mRh+qaGDd59ai74OQ/f7g=;
	b=hNLv1gqR4ySbxtZFK2kHkYHbQ7MA9wC8uh+FwXQJb5Ho94gzc60Z7MlSETqQaB59+gEKzjhG6
	DxzZLFMU43TTIZTyltzBCHjtIJuMNcziXRo2v2tPwKC6exJf51siZ0K0Bfqfc8NBUsgGGRN8QBY
	zlkWKhKlBd0sS2C0syP+oB4=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hf97P0cn8z1K9BV;
	Tue,  8 Sep 2026 11:54:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CB43F4048B;
	Tue,  8 Sep 2026 12:05:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 12:05:50 +0800
Message-ID: <fa7f041f-5e30-4591-93bd-d8df3942e0ac@huawei.com>
Date: Tue, 8 Sep 2026 12:05:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/19] cpu/hotplug: Propagate bring-up status to
 arch_cpuhp_cleanup_kick_cpu()
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-5-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-5-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> In preparation for enabling the generic CPU hotplug machinery on arm64,
> which has architecture-specific handling of early bringup failures,
> extend arch_cpuhp_cleanup_kick_cpu() to take an additional argument
> indicating whether or not the target AP reached the alive state.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/x86/kernel/smpboot.c  | 4 ++--
>  include/linux/cpuhotplug.h | 2 +-
>  kernel/cpu.c               | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 362f85cbdbaf..ce4e8fba5fed 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -1074,7 +1074,7 @@ static int do_boot_cpu(u32 apicid, unsigned int cpu, struct task_struct *idle)
>  
>  	/* If the wakeup mechanism failed, cleanup the warm reset vector */
>  	if (ret)
> -		arch_cpuhp_cleanup_kick_cpu(cpu);
> +		arch_cpuhp_cleanup_kick_cpu(cpu, false);
>  	return ret;
>  }
>  
> @@ -1122,7 +1122,7 @@ int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
>  	return smp_ops.kick_ap_alive(cpu, tidle);
>  }
>  
> -void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu)
> +void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
>  {
>  	/* Cleanup possible dangling ends... */
>  	if (smp_ops.kick_ap_alive == native_kick_ap && x86_platform.legacy.warm_reset)
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index bbcee650155f..83ef0c4d8bbe 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -510,7 +510,7 @@ struct task_struct;
>  
>  void cpuhp_ap_sync_alive(void);
>  void arch_cpuhp_sync_state_poll(atomic_t *st, int old);
> -void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
> +void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive);
>  int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
>  bool arch_cpuhp_init_parallel_bringup(void);
>  
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index d9fe204f02cb..595258e2b6cc 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -432,7 +432,7 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
>  	return true;
>  }
>  
> -void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu) { }
> +void __weak arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive) { }
>  
>  /*
>   * Early CPU bringup synchronization point. Cannot use cpuhp_state::done_up
> @@ -451,7 +451,7 @@ static int cpuhp_bp_sync_alive(unsigned int cpu)
>  	}
>  
>  	/* Let the architecture cleanup the kick alive mechanics. */
> -	arch_cpuhp_cleanup_kick_cpu(cpu);
> +	arch_cpuhp_cleanup_kick_cpu(cpu, !ret);

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	return ret;
>  }
>  #else /* CONFIG_HOTPLUG_CORE_SYNC_FULL */


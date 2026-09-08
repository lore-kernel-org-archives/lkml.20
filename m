Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0166553A8B8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869590; cv=none; b=mtxUnQUWz9zNL/Vo/wkvf61FcaCvhImO25MKALN0fb82wHTRugKmuI+2+i5hUV55U4edQLD+fyuPid2PhYYY2zcHwld2tUkfPU0SJcHuKHgsdVLE98pHmIRWUYNnxXTdS0G2gi5JEnPQnnwjbYdt1jTNocAvkf/fP+eCcQd08QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869590; c=relaxed/simple;
	bh=daadWhFSsdVbHrLx9b6Z+z6YU0qIv5+EDXRbvdD+M5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L2jM5icTdb468n+P8j+weh0AcvyjKCV4Bs8S1L2ZyA0Bo425G/LqFLnSdOb8AJmHuOq6Zbb4NM5iGI6qAuK4AKb/Iftrv68tG7Twm57/FVGEOpxJ9GRDrwcNMHfWWpXmH1oH0/goVxDhw8juZXv/tN9BywZj44v4F7EUjjtCmmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=kWq7kgIr; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="kWq7kgIr"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fIQFzoGrrfMp+IhfdYgiVZw4QZCQekcJOCoJnKfBZ+E=;
	b=kWq7kgIrm2MjS2NeXrwj+UR1XlB/PDkiehPNbxkQXrQCMDeisKF7IQkPTzylT7VtxFiUBCKgr
	A8Z8YO9fmSkB43NoklAEO5bV0c5o1xKe+7ThrKau/eeBZnv9NY78F9uiM7aDfGiVlnnwuzEfM4P
	obWXMt5q2bgqdl3EO4M84I4=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hfMxL4gLhzmV8f;
	Tue,  8 Sep 2026 20:01:58 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 98C344048B;
	Tue,  8 Sep 2026 20:12:52 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 20:12:51 +0800
Message-ID: <3f18b449-390a-4611-8bcd-a3b60e37056d@huawei.com>
Date: Tue, 8 Sep 2026 20:12:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] arm64: cpu_ops: Expose optional argument to target
 cpu in ->cpu_boot()
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-17-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-17-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> Some backend implementations of 'struct cpu_ops', notably PSCI v0.2+,
> allow an optional argument to be passed in register X0 to the target
> CPU during boot.
> 
> Expose this functionality by extending the ->cpu_boot() CPU operation
> to take an additional argument which is ignored unless the new optional
> ->cpu_boot_has_arg() callback is present and returns 'true'. For now,
> we continue to pass zero.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/cpu_ops.h          |  6 +++++-
>  arch/arm64/kernel/acpi_parking_protocol.c |  3 ++-
>  arch/arm64/kernel/psci.c                  | 11 +++++++++--
>  arch/arm64/kernel/smp.c                   |  2 +-
>  arch/arm64/kernel/smp_spin_table.c        |  2 +-
>  5 files changed, 18 insertions(+), 6 deletions(-)

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> diff --git a/arch/arm64/include/asm/cpu_ops.h b/arch/arm64/include/asm/cpu_ops.h
> index cd298a8710d8..e7662a1879d9 100644
> --- a/arch/arm64/include/asm/cpu_ops.h
> +++ b/arch/arm64/include/asm/cpu_ops.h
> @@ -21,6 +21,9 @@
>   *		mechanism for doing so, tests whether it is possible to boot
>   *		the given CPU.
>   * @cpu_boot:	Boots a cpu into the kernel.
> + * @cpu_boot_has_arg: Optionally determines whether @cpu_boot passes its
> + *		      (non-zero) second argument to the booting CPU in
> + *		      register x0.
>   * @cpu_postboot: Optionally, perform any post-boot cleanup or necessary
>   *		synchronisation. Called from the cpu being booted.
>   * @cpu_can_disable: Determines whether a CPU can be disabled based on
> @@ -36,7 +39,8 @@ struct cpu_operations {
>  	const char	*name;
>  	int		(*cpu_init)(unsigned int);
>  	int		(*cpu_prepare)(unsigned int);
> -	int		(*cpu_boot)(unsigned int);
> +	int		(*cpu_boot)(unsigned int, unsigned long);
> +	bool		(*cpu_boot_has_arg)(void);
>  	void		(*cpu_postboot)(void);
>  #ifdef CONFIG_HOTPLUG_CPU
>  	bool		(*cpu_can_disable)(unsigned int cpu);
> diff --git a/arch/arm64/kernel/acpi_parking_protocol.c b/arch/arm64/kernel/acpi_parking_protocol.c
> index e1be29e608b7..24ebde1241bf 100644
> --- a/arch/arm64/kernel/acpi_parking_protocol.c
> +++ b/arch/arm64/kernel/acpi_parking_protocol.c
> @@ -56,7 +56,8 @@ static int acpi_parking_protocol_cpu_prepare(unsigned int cpu)
>  	return 0;
>  }
>  
> -static int acpi_parking_protocol_cpu_boot(unsigned int cpu)
> +static int acpi_parking_protocol_cpu_boot(unsigned int cpu,
> +					  unsigned long ignored)
>  {
>  	struct cpu_mailbox_entry *cpu_entry = &cpu_mailbox_entries[cpu];
>  	struct parking_protocol_mailbox __iomem *mailbox;
> diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
> index 6b25a12ed143..3ba4fa14b9e3 100644
> --- a/arch/arm64/kernel/psci.c
> +++ b/arch/arm64/kernel/psci.c
> @@ -36,16 +36,22 @@ static int __init cpu_psci_cpu_prepare(unsigned int cpu)
>  	return 0;
>  }
>  
> -static int cpu_psci_cpu_boot(unsigned int cpu)
> +static int cpu_psci_cpu_boot(unsigned int cpu, unsigned long context)
>  {
>  	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
> -	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry, 0);
> +	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry,
> +				  context);
>  	if (err && err != -EPERM)
>  		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
>  
>  	return err;
>  }
>  
> +static bool cpu_psci_cpu_boot_has_context(void)
> +{
> +	return psci_ops.get_version() >= PSCI_VERSION(0, 2);
> +}
> +
>  #ifdef CONFIG_HOTPLUG_CPU
>  static bool cpu_psci_cpu_can_disable(unsigned int cpu)
>  {
> @@ -114,6 +120,7 @@ const struct cpu_operations cpu_psci_ops = {
>  	.cpu_init	= cpu_psci_cpu_init,
>  	.cpu_prepare	= cpu_psci_cpu_prepare,
>  	.cpu_boot	= cpu_psci_cpu_boot,
> +	.cpu_boot_has_arg = cpu_psci_cpu_boot_has_context,
>  #ifdef CONFIG_HOTPLUG_CPU
>  	.cpu_can_disable = cpu_psci_cpu_can_disable,
>  	.cpu_disable	= cpu_psci_cpu_disable,
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 2e98a92eb764..b57f8f752f78 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -103,7 +103,7 @@ static int boot_secondary(unsigned int cpu, struct task_struct *idle)
>  	const struct cpu_operations *ops = get_secondary_cpu_ops();
>  
>  	if (ops->cpu_boot)
> -		return ops->cpu_boot(cpu);
> +		return ops->cpu_boot(cpu, 0);
>  
>  	return -EOPNOTSUPP;
>  }
> diff --git a/arch/arm64/kernel/smp_spin_table.c b/arch/arm64/kernel/smp_spin_table.c
> index 49029eace3ad..a5e6f444c25f 100644
> --- a/arch/arm64/kernel/smp_spin_table.c
> +++ b/arch/arm64/kernel/smp_spin_table.c
> @@ -104,7 +104,7 @@ static int smp_spin_table_cpu_prepare(unsigned int cpu)
>  	return 0;
>  }
>  
> -static int smp_spin_table_cpu_boot(unsigned int cpu)
> +static int smp_spin_table_cpu_boot(unsigned int cpu, unsigned long ignored)
>  {
>  	/*
>  	 * Update the pen release flag.


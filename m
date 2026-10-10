Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FADF33438F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600589; cv=none; b=AXiPZ8nQXTsVFZfdf7/R+R+ZZRDLs7DSF4V/ICUZKuqlpAvKdagY5m1JQvg3NQ4GFrpZPcXkdw6hiXyMArr5CQkA/xqNeQRi82mj0mhph55OiPB4rIvRuGE34amJVAYakAqHnllDQ7Rkg5QvM89wDljAhPWOH/lLNdZPb9qYgAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600589; c=relaxed/simple;
	bh=j5VNKLfNK6vktpwLAUhb0HY7dOURyQYpGBQOhK5OwjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JbINTYM1BdD6250SMil1cGHpt3dAO84UtMroc0gmp+lmiH1WvG4WwK+Z4t95YqWAT+gpOmomOgnDHNi4I71lBpTQ7a4WMtJlPwBo0YHtPkwN0nZe77TkZXpOwJAxzEFfJ6gjlid2RB/JjTLIvZ2M0XRcdLhpVXBMlZkIswimAfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=D3mXrfC+; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="D3mXrfC+"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VeVooY1BF4c0BpixgBp6X7gNCFTO8VvE12rUCObKIh4=;
	b=D3mXrfC+Fc4CB4Yo3EcK9GJ6poDIy695WU9/R//ot6IbyJkNXnjf9N6r8HQpmTGnGr6nw0g27
	aI+MIyvYoV6LK6y4qznx9uxttRl/MS/KfK5wwYYVMsk1RUDkhd293ZJTRKUuBBWIctcYO2+FKBN
	aEDW1VsGjk6bRso3TCRWpBo=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4j1nv212CpzLlSh;
	Sat, 10 Oct 2026 10:37:18 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D3C894057A;
	Sat, 10 Oct 2026 10:49:33 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 10 Oct
 2026 10:49:33 +0800
Message-ID: <a9b77612-3b81-4491-ae57-baee0400540a@huawei.com>
Date: Sat, 10 Oct 2026 10:49:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/23] arm64: cpufeature: Check arm64_ftr_regs[] before
 the first store
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ben
 Horgan <ben.horgan@arm.com>, =?UTF-8?Q?=C8=98tefania_Ion?=
	<stefion@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Pankaj Patil
	<pankaj.patil@oss.qualcomm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tarun
 Sahu <tarunsahu@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
 <20261009100738.31288-6-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261009100738.31288-6-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/9 18:07, Will Deacon 写道:
> From: Fuad Tabba <fuad.tabba@linux.dev>
> 
> sort_ftr_regs() sorts nothing. It checks that arm64_ftr_regs[] is in
> sys_id order, which the binary search in get_arm64_ftr_reg() relies on,
> and that no register's fields overlap. It runs at the top of

It also checks whether the register field extends beyond 64 bits

> init_cpu_features(), after the boot CPU's __cpuinfo_store_cpu(). A
> subsequent patch makes __cpuinfo_store_cpu() look registers up in the
> table.
> 
> Rename it validate_ftr_regs() and call it from smp_prepare_boot_cpu(),
> ahead of cpuinfo_store_boot_cpu().
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/cpu.h   | 1 +
>  arch/arm64/kernel/cpufeature.c | 5 +----
>  arch/arm64/kernel/smp.c        | 2 ++
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
> index 3c008821219c..f332fbd8e46d 100644
> --- a/arch/arm64/include/asm/cpu.h
> +++ b/arch/arm64/include/asm/cpu.h
> @@ -75,6 +75,7 @@ DECLARE_PER_CPU(struct cpuinfo_arm64, cpu_data);
>  void cpuinfo_store_cpu(void);
>  void __init cpuinfo_store_boot_cpu(void);
>  
> +void __init validate_ftr_regs(void);
>  void __init init_cpu_features(struct cpuinfo_arm64 *info);
>  void update_cpu_features(int cpu, struct cpuinfo_arm64 *info,
>  				 struct cpuinfo_arm64 *boot);
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 32102c3912fa..727e1665c987 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -962,7 +962,7 @@ s64 arm64_ftr_safe_value(const struct arm64_ftr_bits *ftrp, s64 new,
>  	return ret;
>  }
>  
> -static void __init sort_ftr_regs(void)
> +void __init validate_ftr_regs(void)
>  {
>  	unsigned int i;
>  
> @@ -1207,9 +1207,6 @@ bool gmid_el1_accessible(const struct cpuinfo_arm64 *info)
>  
>  void __init init_cpu_features(struct cpuinfo_arm64 *info)
>  {
> -	/* Before we start using the tables, make sure it is sorted */
> -	sort_ftr_regs();
> -
>  	init_cpu_ftr_reg(SYS_CTR_EL0, info->reg_ctr);
>  	init_cpu_ftr_reg(SYS_DCZID_EL0, info->reg_dczid);
>  	init_cpu_ftr_reg(SYS_CNTFRQ_EL0, info->reg_cntfrq);
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index a61dc3016a11..eac217b9ebf1 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -455,6 +455,8 @@ void __init smp_prepare_boot_cpu(void)
>  	 */
>  	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
>  
> +	/* Check arm64_ftr_regs[] before anything looks registers up in it. */
> +	validate_ftr_regs();

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	cpuinfo_store_boot_cpu();
>  	setup_boot_cpu_features();
>  

-- 
Best regards,
Jinjie


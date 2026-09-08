Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270DF4AE12B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867145; cv=none; b=ZWzlo36Fd0pIwalycp/38WwSETHQq2eHmRvge9PEzX94mVJnrmjtA1VRgwe7nRfLOzvqQOB8upSUWgJjI7xHfigprQRMkNcje8acqQ5eD71v6LcDBe4QnfX/VCLqTXXcaFc2FvbCLdCMTzCKSXYlvGDifSugs3UXxEDoHDIk3kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867145; c=relaxed/simple;
	bh=vskJrLiw0ReGp0xBFPxK1JbkHTI4tmjCuy9ROCIz5WQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OygO+pqXnbQBiXuIAMAY/2RsQTUQiEFz/eRITXpn2A5lhoL9E6SyADg80eUR20TnBNMZeapkUei566Ln7KjDIba+/agdK/uszBu2W/4JYz3Olxb99MZaiDTGFmWFGa5kRlxOab+PNE2C4UDcLqQ3Dk8KOT6K5RyYAEZnSAPnOV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ApyhTskm; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ApyhTskm"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=i4Xz0mp9rb3bxPkNxDow+JBbZkBtvVDwN9ZMjpiwOik=;
	b=ApyhTskmP38fVZbWCC5h7WJFp4aUqBZ7sKVyCYG7ueQyCYnwKHrlLziQe4+udmgtKGaBgT9Dc
	wWHlgHL537zoDQ4rjU7gOaGKvMO2hc+M9VGpN2vLPFvdvaMFRQk3qyTh6lWMmSC19kR1Y7TTFcs
	JEkIg1WngKb0+NYqDSz3djI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hfM2H627bzcb3G;
	Tue,  8 Sep 2026 19:21:11 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B01B040537;
	Tue,  8 Sep 2026 19:32:08 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 19:32:08 +0800
Message-ID: <ed47c328-6906-4bad-9a0e-a01f067dc812@huawei.com>
Date: Tue, 8 Sep 2026 19:32:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] arm64: cpu_ops: Make 'cpu_operations' pointer
 global instead of per-cpu
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-13-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-13-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> 'cpu_ops' is an NR_CPUS-length array of 'cpu_operations' pointers, which
> theoretically allows for different CPUs to have different bringup and
> hotplug backends.
> 
> In reality, this complexity exists only to deal with the case where CPU0
> is not hotpluggable, so replace the array with a single, global pointer
> and record separately whether or not they apply to the boot CPU. Update
> the logic in init_cpu_ops() to enforce that only a single set of
> 'cpu_ops' is required.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/cpu_ops.c | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpu_ops.c b/arch/arm64/kernel/cpu_ops.c
> index e133011f64b5..eacfb88a0c0c 100644
> --- a/arch/arm64/kernel/cpu_ops.c
> +++ b/arch/arm64/kernel/cpu_ops.c
> @@ -20,7 +20,8 @@ extern const struct cpu_operations acpi_parking_protocol_ops;
>  #endif
>  extern const struct cpu_operations cpu_psci_ops;
>  
> -static const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
> +static const struct cpu_operations *cpu_ops __ro_after_init;
> +static bool boot_cpu_has_enable_method __ro_after_init;
>  
>  static const struct cpu_operations *const dt_supported_cpu_ops[] __initconst = {
>  	&smp_spin_table_ops,
> @@ -40,6 +41,9 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
>  {
>  	const struct cpu_operations *const *ops;
>  
> +	if (!name)
> +		return NULL;
> +
>  	ops = acpi_disabled ? dt_supported_cpu_ops : acpi_supported_cpu_ops;
>  
>  	while (*ops) {
> @@ -49,6 +53,7 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
>  		ops++;
>  	}
>  
> +	pr_warn("Unsupported enable-method: %s\n", name);
>  	return NULL;
>  }
>  
> @@ -94,25 +99,31 @@ static const char *__init cpu_read_enable_method(int cpu)
>  	return enable_method;
>  }
>  /*
> - * Read a cpu's enable method and record it in cpu_ops.
> + * Read a cpu's enable method and update/check cpu_ops.
>   */
>  int __init init_cpu_ops(int cpu)
>  {
>  	const char *enable_method = cpu_read_enable_method(cpu);
> +	const struct cpu_operations *ops = cpu_get_ops(enable_method);
>  
> -	if (!enable_method)
> +	if (!ops)
>  		return -ENODEV;
>  
> -	cpu_ops[cpu] = cpu_get_ops(enable_method);
> -	if (!cpu_ops[cpu]) {
> -		pr_warn("Unsupported enable-method: %s\n", enable_method);
> -		return -EOPNOTSUPP;
> -	}
> +	if (!cpu_ops)
> +		cpu_ops = ops;
> +	else if (cpu_ops != ops)
> +		return -EBUSY;

Should we return the original error code of init_cpu_ops() in
smp_cpu_setup()?

 487 static int __init smp_cpu_setup(int cpu)
 488 {
 489 >-------const struct cpu_operations *ops;
 490
 491 >-------if (init_cpu_ops(cpu))
 492 >------->-------return -ENODEV;
 493
 494 >-------ops = get_cpu_ops(cpu);
 495 >-------if (ops->cpu_init(cpu))
 496 >------->-------return -ENODEV;


Otherwise LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> +
> +	if (cpu == 0)
> +		boot_cpu_has_enable_method = true;
>  
>  	return 0;
>  }
>  
>  const struct cpu_operations *get_cpu_ops(int cpu)
>  {
> -	return cpu_ops[cpu];
> +	if (cpu || boot_cpu_has_enable_method)
> +		return cpu_ops;
> +
> +	return NULL;

>  }


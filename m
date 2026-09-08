Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E21C52FE2F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868608; cv=none; b=gJdUW2wyORPcCifT5QUqG2SmOyUorVXrqc33kMPqBb05mu5DYtPLDRtxuEOq+z87Ims/VorjKJe42T1T9lx8i9SxG1M0oNY9Cu62KWO/RnzupXTIhOWcI2OBy4I6B7mxJ6lDx2RHKOZZ9IDg+NCTQUHrYk//tcuwsbJQ2PMGImw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868608; c=relaxed/simple;
	bh=uPLSf82zbBlygFL3HL3vP2GeWXlVCMLrTfSQGiyNrOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nERkmZ1lLGeRVefKV+3rCr/YPlzm5vxFQiWl8ILO/aTw7ClPlg58OnDXe2jktixeJv506Coa7adNrFMqm2VY7NpWnnLyR7rZAacQzMYNGfKOKl0nAwWdaBw/HerPn1p7l3Bpydz/x4WewrDeOfdAkAeRqTK8DyUYBRU0u7z2JK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Tu69EZne; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Tu69EZne"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+j/MnMfgl5YfKGf8KV9trVnwU4KSAH6tcUBXA36ZRyg=;
	b=Tu69EZneji2bZO3n1COp941uNwvSjyaroq6xQgPPlxu4aI/h3e7PU+DNWuYKY6KSBkwcofBqb
	y7z6uObYITH1mvO8Xp4YDvEM3uJHPg4/uGzhjQKjiJT3MWOdQ/WyE2e8JkwawBn9SFcTnIBBSxj
	p3clmNr4SYM29rRAvijtrQg=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hfMZJ2HwFz12LHf;
	Tue,  8 Sep 2026 19:45:28 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 15F1E40538;
	Tue,  8 Sep 2026 19:56:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 19:56:40 +0800
Message-ID: <1e5fc39a-4e32-44e4-b3d0-33504bcec6e0@huawei.com>
Date: Tue, 8 Sep 2026 19:56:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/19] arm64: cpu_ops: Introduce get_secondary_cpu_ops()
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-14-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-14-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> Introduce get_secondary_cpu_ops() to retrieve a pointer to the
> 'cpu_operations' structure for the non-boot CPUs and use it instead of
> get_cpu_ops() where we are dealing with secondary CPUs.
> 
> This is a pre-requisite for enabling parallel CPU bring-up.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/cpu_ops.h |  1 +
>  arch/arm64/kernel/cpu_ops.c      |  5 +++++
>  arch/arm64/kernel/smp.c          | 19 +++++++------------
>  3 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpu_ops.h b/arch/arm64/include/asm/cpu_ops.h
> index a444c8915e88..cd298a8710d8 100644
> --- a/arch/arm64/include/asm/cpu_ops.h
> +++ b/arch/arm64/include/asm/cpu_ops.h
> @@ -48,6 +48,7 @@ struct cpu_operations {
>  
>  int __init init_cpu_ops(int cpu);
>  extern const struct cpu_operations *get_cpu_ops(int cpu);
> +extern const struct cpu_operations *get_secondary_cpu_ops(void);
>  
>  static inline void __init init_bootcpu_ops(void)
>  {
> diff --git a/arch/arm64/kernel/cpu_ops.c b/arch/arm64/kernel/cpu_ops.c
> index eacfb88a0c0c..7d183ca31dc8 100644
> --- a/arch/arm64/kernel/cpu_ops.c
> +++ b/arch/arm64/kernel/cpu_ops.c
> @@ -127,3 +127,8 @@ const struct cpu_operations *get_cpu_ops(int cpu)
>  
>  	return NULL;
>  }
> +
> +const struct cpu_operations *get_secondary_cpu_ops(void)
> +{
> +	return cpu_ops;
> +}
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index c5e9d5d5e003..2e98a92eb764 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -100,7 +100,7 @@ static inline int op_cpu_kill(unsigned int cpu)
>   */
>  static int boot_secondary(unsigned int cpu, struct task_struct *idle)
>  {
> -	const struct cpu_operations *ops = get_cpu_ops(cpu);
> +	const struct cpu_operations *ops = get_secondary_cpu_ops();
>  
>  	if (ops->cpu_boot)
>  		return ops->cpu_boot(cpu);
> @@ -220,7 +220,7 @@ asmlinkage notrace void secondary_start_kernel(void)
>  	 */
>  	check_local_cpu_capabilities();
>  
> -	ops = get_cpu_ops(cpu);
> +	ops = get_secondary_cpu_ops();
>  	if (ops->cpu_postboot)
>  		ops->cpu_postboot();
>  
> @@ -327,7 +327,7 @@ int __cpu_disable(void)
>  
>  static int op_cpu_kill(unsigned int cpu)
>  {
> -	const struct cpu_operations *ops = get_cpu_ops(cpu);
> +	const struct cpu_operations *ops = get_secondary_cpu_ops();
>  
>  	/*
>  	 * If we have no means of synchronising with the dying CPU, then assume
> @@ -368,7 +368,7 @@ void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
>  void __noreturn cpu_die(void)
>  {
>  	unsigned int cpu = smp_processor_id();
> -	const struct cpu_operations *ops = get_cpu_ops(cpu);
> +	const struct cpu_operations *ops = get_secondary_cpu_ops();
>  
>  	idle_task_exit();
>  
> @@ -492,7 +492,7 @@ static int __init smp_cpu_setup(int cpu)
>  	if (init_cpu_ops(cpu))
>  		return -ENODEV;
>  
> -	ops = get_cpu_ops(cpu);
> +	ops = get_secondary_cpu_ops();
>  	if (ops->cpu_init(cpu))
>  		return -ENODEV;
>  
> @@ -776,7 +776,7 @@ void __init smp_init_cpus(void)
>  
>  void __init smp_prepare_cpus(unsigned int max_cpus)
>  {
> -	const struct cpu_operations *ops;
> +	const struct cpu_operations *ops = get_secondary_cpu_ops();
>  	unsigned int cpu;
>  	int err;
>  
> @@ -802,10 +802,6 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  		if (cpu == 0)
>  			continue;
>  
> -		ops = get_cpu_ops(cpu);
> -		if (!ops)
> -			continue;
> -

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  		err = ops->cpu_prepare(cpu);
>  		if (err)
>  			continue;
> @@ -1341,8 +1337,7 @@ bool smp_crash_stop_failed(void)
>  static bool have_cpu_die(void)
>  {
>  #ifdef CONFIG_HOTPLUG_CPU
> -	int any_cpu = raw_smp_processor_id();
> -	const struct cpu_operations *ops = get_cpu_ops(any_cpu);
> +	const struct cpu_operations *ops = get_secondary_cpu_ops();
>  
>  	if (ops && ops->cpu_die)
>  		return true;


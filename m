Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C523812ED
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852936; cv=none; b=dcrJiAk4gLiTDqclOFfysigT3Wr3Ge4+Wwv/xlteXc52jYNbQHeCSosyiJtN6En0+nL/Hvv+M50wZq+zhtVsqlobTf4lvYRVvV+b7WxpmvQ3SSQMVi7eGsm+bDVFVPRgcOVY6YhkElfpQJyXY2fIdiDOQKFyJ096VJQ8/UX5hwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852936; c=relaxed/simple;
	bh=zdubuZY2S/pw0WxO3gJ6b6swifSKL22SqKvBQgdrjCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fh6Poi9owAZHJg53MGwBo4mC6MlHw6hfS276erOH0yZVxMs1tFLCJdaOELmhE7pPJ0GIJ1sQXbOy/ewXb2Iv73gffZAR+5om/8BWaRfrUiOMptYPOa5hqNFD3+spEuUmEMZDdWwE/VaekablwusosuzzLPJV101CyoC7u8C71Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=r49i6fTW; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="r49i6fTW"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xUieaY6CyZIkKzDEK46ImoDWCyB+ASDnm0IUxLv65GM=;
	b=r49i6fTWYp2ORiSYHCDJjBfP7WhUVxj17ju5MGiMdkbF8zq1rqufJkZQpLFI2InZ2Cke1fj4g
	AFLAcTWsybZtU+QBLdDscqgfvzdY1WyCMGbJl3icP5lsfey+hjQrA6S6xg15ENcm0n1dI64Mjvs
	bvO9f/x+v6d4khrHXSPpHOQ=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hfFnH2rl7z1cyPY;
	Tue,  8 Sep 2026 15:24:35 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 670F040588;
	Tue,  8 Sep 2026 15:35:28 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemk200008.china.huawei.com (7.202.194.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 8 Sep 2026 15:35:27 +0800
Message-ID: <f7567703-9718-416d-99f6-9364b54d935c@huawei.com>
Date: Tue, 8 Sep 2026 15:35:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/19] arm64: smp: Tidy up smp_prepare_cpus()
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Borislav Petkov <bp@alien8.de>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra <peterz@infradead.org>, Marc
 Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-6-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260907164024.17164-6-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/8 0:40, Will Deacon 写道:
> smp_prepare_cpus() is always run on the boot CPU (i.e. CPU 0) but goes
> to great lengths to support running on a CPU where smp_processor_id()

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> is non-zero.
> 
> Clean up the code a little by hardcoding zero for the boot CPU ID.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/smp.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index a61dc3016a11..ff045080ca1b 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -779,16 +779,14 @@ void __init smp_init_cpus(void)
>  void __init smp_prepare_cpus(unsigned int max_cpus)
>  {
>  	const struct cpu_operations *ops;
> -	int err;
>  	unsigned int cpu;
> -	unsigned int this_cpu;
> +	int err;
>  
>  	init_cpu_topology();
>  
> -	this_cpu = smp_processor_id();
> -	store_cpu_topology(this_cpu);
> -	numa_store_cpu_info(this_cpu);
> -	numa_add_cpu(this_cpu);
> +	store_cpu_topology(0);
> +	numa_store_cpu_info(0);
> +	numa_add_cpu(0);
>  
>  	/*
>  	 * If UP is mandated by "nosmp" (which implies "maxcpus=0"), don't set
> @@ -803,8 +801,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	 * secondaries from the bootloader.
>  	 */
>  	for_each_possible_cpu(cpu) {
> -
> -		if (cpu == smp_processor_id())
> +		if (cpu == 0)
>  			continue;
>  
>  		ops = get_cpu_ops(cpu);


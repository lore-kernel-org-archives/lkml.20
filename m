Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1786C3D2FF7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856632; cv=none; b=lbh+be9Bb8atUr2HKRfThewm5dr2CVSDaAUCxSHyXl2zyrzfHQxY2UjW6yPePNx9mwJCyfAZAEoOcIQkTDHyy0T2z/s0Z53cEcP+314BCBSvdHaiPvbeoedjSc5xr+vdklWYScrxKsRQ4aDFLupyd89ZQeMG8sCRZLOg3x+IK2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856632; c=relaxed/simple;
	bh=GfzGR1fGsN/V0+j7gvKYifuzwingsnYuNC+55v70W3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lBB2Det7rlDJg51615PWvs25Mw1BbjiyB5WvjDvUbD3blDDNeLeiLckO2/qPaj7ncQb3Fz6uXzO9NFnuAoMelfKGBzd7XqBclYFnVK9QtXn+jU4GjZb7KtRI1JUuUm5AbRnv5QYzgx1f/GBhLUtoBAEBejBYPtxTdCGq/OuTAPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=s9N4aedE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="s9N4aedE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71119143D;
	Thu,  1 Oct 2026 05:10:13 -0700 (PDT)
Received: from [10.0.153.43] (e121487-lin.cambridge.arm.com [10.0.153.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 184C23F85F;
	Thu,  1 Oct 2026 05:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790856616; bh=GfzGR1fGsN/V0+j7gvKYifuzwingsnYuNC+55v70W3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s9N4aedEESWfJQKMgJKYh1Qf9QTqNzfpKMcexbyKaFnIc7ItcimsgjuAz1MB5JZGl
	 EPHqSxyYU3ZvSwEfbN6O0QLwE2jySodrKKWQAK03fBHcBAwn3b+DegcZ4lcI13xMTC
	 79ZIzB+ACZqABxYBZIF48V4ozRurrc1t714p4bKg=
Message-ID: <ce0a72a9-ea08-4899-b282-ea39b195a161@arm.com>
Date: Thu, 1 Oct 2026 13:10:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: errata: Factor out broken AMU const counter
 cap
To: Beata Michalska <beata.michalska@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
 James.Morse@arm.com, xuewen.yan94@gmail.com, seanwang1@lenovo.com,
 linux-kernel@vger.kernel.org
References: <20261001090050.3849551-1-beata.michalska@arm.com>
 <20261001090050.3849551-2-beata.michalska@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261001090050.3849551-2-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/26 10:00, Beata Michalska wrote:
> Move the workaround from the erratum 2457168-specific cpucap to a generic
> broken AMU constant-counter one. This keeps the existing Cortex-A510
> handling unchanged while allowing other errata with similar AMU constant
> counter issue to share the capability bit and call sites.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  arch/arm64/Kconfig             |  8 ++++++++
>  arch/arm64/kernel/cpu_errata.c | 20 ++++++++++++++------
>  arch/arm64/kernel/cpufeature.c |  2 +-
>  arch/arm64/kernel/topology.c   |  7 ++++---
>  arch/arm64/tools/cpucaps       |  2 +-
>  5 files changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5a51b0ef9440..3b6c052d46a18 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1040,9 +1040,17 @@ config ARM64_ERRATUM_1902691
>  
>  	  If unsure, say Y.
>  
> +config ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> +	bool
> +	# Targeting errata affecting AMEVCNTR01, the AMU constant counter.
> +	# On affected CPUs the counter may not increment at the expected rate,
> +	# making it unreliable. As a result, AMU users should treat it as
> +	# unavailable rather than relying on misleading counter values.
> +
>  config ARM64_ERRATUM_2457168
>  	bool "Cortex-A510: 2457168: workaround for AMEVCNTR01 incrementing incorrectly"
>  	depends on ARM64_AMU_EXTN
> +	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
>  	default y
>  	help
>  	  This option adds the workaround for ARM Cortex-A510 erratum 2457168.
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 5db8f0619e4bc..8ce559ac073c7 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -381,6 +381,16 @@ static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
>  };
>  #endif
>  
> +#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> +static const struct midr_range workaround_amu_constcnt_list[] = {
> +#ifdef CONFIG_ARM64_ERRATUM_2457168
> +	/* Cortex-A510 r0p0-r1p1 */
> +	MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1),
> +#endif
> +	{}
> +};
> +#endif /* CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT */
> +
>  #ifdef CONFIG_CAVIUM_ERRATUM_23154
>  static const struct midr_range cavium_erratum_23154_cpus[] = {
>  	MIDR_ALL_VERSIONS(MIDR_THUNDERX),
> @@ -916,14 +926,12 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  		ERRATA_MIDR_REV_RANGE(MIDR_CORTEX_A510, 0, 0, 2)
>  	},
>  #endif
> -#ifdef CONFIG_ARM64_ERRATUM_2457168
> +#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
>  	{
> -		.desc = "ARM erratum 2457168",
> -		.capability = ARM64_WORKAROUND_2457168,
> +		.desc = "Broken AMU AMEVCNTR01 (const counter)",
> +		.capability = ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT,
>  		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
> -
> -		/* Cortex-A510 r0p0-r1p1 */
> -		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
> +		CAP_MIDR_RANGE_LIST(workaround_amu_constcnt_list)
>  	},
>  #endif
>  #ifdef CONFIG_ARM64_ERRATUM_2038923
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 17b83a2518a8f..1569f84214763 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2064,7 +2064,7 @@ static void cpu_amu_enable(struct arm64_cpu_capabilities const *cap)
>  		cpumask_set_cpu(smp_processor_id(), &amu_cpus);
>  
>  		/* 0 reference values signal broken/disabled counters */
> -		if (!this_cpu_has_cap(ARM64_WORKAROUND_2457168))
> +		if (!this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT))
>  			update_freq_counters_refs();
>  	}
>  }
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f1..64588554e7f76 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -402,7 +402,7 @@ static void cpu_read_constcnt(void *val)
>  	 * the counter is disabled. A return value of 0 at counter read is
>  	 * properly handled as an error case by the users of the counter.
>  	 */
> -	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_2457168) ?
> +	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
>  		      0UL : read_constcnt();
>  }
>  
> @@ -463,8 +463,9 @@ static void amu_read_core_const_ctrs(void *val)
>  
>  	/*
>  	 * cpu_read_constcnt() incurs slight latency due to the
> -	 * ARM64_WORKAROUND_2457168 check. Read it first to minimize
> -	 * the sampling skew between the const and core counters.
> +	 * ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT check.
> +	 * Read it first to minimize the sampling skew between the const
> +	 * and core counters.
>  	 */
>  	cpu_read_constcnt(&ctrs->constcnt);
>  	cpu_read_corecnt(&ctrs->corecnt);
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 2775ba3359cfe..58b6c084f9f25 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -105,7 +105,6 @@ WORKAROUND_1902691
>  WORKAROUND_2038923
>  WORKAROUND_2064142
>  WORKAROUND_2077057
> -WORKAROUND_2457168
>  WORKAROUND_2645198
>  WORKAROUND_2658417
>  WORKAROUND_4193714
> @@ -132,3 +131,4 @@ WORKAROUND_REPEAT_TLBI_SYNC
>  WORKAROUND_SPECULATIVE_AT
>  WORKAROUND_SPECULATIVE_SSBS
>  WORKAROUND_SPECULATIVE_UNPRIV_LOAD
> +WORKAROUND_BROKEN_AMU_CONSTCNT
> -- 2.43.0
> 

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

Thanks
Vladimir

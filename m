Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59A7486E6A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856775; cv=none; b=ofYldji7zeUyjcqyCL5UMUMKkViJEgXEbIdL7WtmlDntyk7j4B1RVc4J2pPz71ZJiQJT/m02BisDUB0PUDA1JIe/vWIa782z59HKfm2JmvFYrk70A793gMIYasWt47NckBJpprszD1KEP9Gc5PL17d+9D1DdZTfX7B/Ws5cv4vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856775; c=relaxed/simple;
	bh=lIRzzkK1k4nk3ikZ7PiqNu7IU4+fhqAmi6tUa1OnN9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaSZbbkkSqkeMRD/aib82+Oi0ftpjrAFl3VAkszZRzyTyqkdcDg1Hr1jMjJO4RbpnQQO+wSX7DCcKC+Ag83u7ITjrBCsPyAd5wfyuOYy1/gopTHfjEWev8KKaGNvF3IcYggLxE5W1cbr4COA0AF25YYiy7eiTV5nuxdR6sbMgb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bjKNRXn7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bjKNRXn7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8084497;
	Thu,  1 Oct 2026 05:12:44 -0700 (PDT)
Received: from [10.0.153.43] (e121487-lin.cambridge.arm.com [10.0.153.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBCB73F85F;
	Thu,  1 Oct 2026 05:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790856768; bh=lIRzzkK1k4nk3ikZ7PiqNu7IU4+fhqAmi6tUa1OnN9k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bjKNRXn7yo/UqNgFkcF3IY3sku/lgQnv7xJJVzYk+46XnA4wAlk5OdTu9PnKXdeYN
	 vXViWtLWHi30C7LI2m58Qt5PdpIFSYBfaLSQI6o7rzhaHMCZdjFvwPaNturdSmpsO2
	 Uevn/9QA66598RIWWXygq335bWJ2XEVjQu+dqSTE=
Message-ID: <1575b9c1-872f-4c09-89d7-8b2bd284e770@arm.com>
Date: Thu, 1 Oct 2026 13:12:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: errata: Add Cortex-A725 erratum 3821522
 workaround
To: Beata Michalska <beata.michalska@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
 James.Morse@arm.com, xuewen.yan94@gmail.com, seanwang1@lenovo.com,
 linux-kernel@vger.kernel.org
References: <20261001090050.3849551-1-beata.michalska@arm.com>
 <20261001090050.3849551-3-beata.michalska@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261001090050.3849551-3-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/26 10:00, Beata Michalska wrote:
> Cortex-A725 erratum 3821522 affects the CNT_CYCLES event, which can
> incur a significant increment error when a CPU enters and subsequently
> exits WFE or WFI, and may no longer track the system counter
> frequency.
> 
> The AMEVCNTR01_EL0 counter is used as the AMU constant counter for
> frequency invariance and CPPC FFH feedback counters. Wire the affected
> Cortex-A725 range into the shared broken AMU constant-counter capability
> so the affected counter is treated as unavailable by returning zero in
> the AMU counter paths. This prevents the broken counter from being used
> as a reference source.
> 
> The erratum can also affect PMUv3 users of the CNT_CYCLES event,
> but this workaround intentionally does not change PMU event handling.
> Hiding or rejecting the PMU event from the erratum code would change
> the perf-visible PMU event interface, including raw event selection,
> and would need a separate PMU-specific approach rather than being
> folded into the AMU reference-counter workaround.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 22 +++++++++++++++++++++
>  arch/arm64/kernel/cpu_errata.c              |  4 ++++
>  arch/arm64/kernel/topology.c                |  9 +++++----
>  4 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index ac3248b9f2f3b..99a1eb4b833dd 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -174,6 +174,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Cortex-A725     | #3456106        | ARM64_ERRATUM_3194386       |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| ARM            | Cortex-A725     | #3821522        | ARM64_ERRATUM_3821522       |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Cortex-X1       | #1502854        | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Cortex-X1       | #3324344        | ARM64_ERRATUM_3194386       |
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 3b6c052d46a18..cab741a695f52 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1081,6 +1081,28 @@ config ARM64_ERRATUM_2645198
>  
>  	  If unsure, say Y.
>  
> +config ARM64_ERRATUM_3821522
> +	bool "Cortex-A725: 3821522: workaround for possible CNT_CYCLES increment error due to WFE/WFI"
> +	depends on ARM64_AMU_EXTN
> +	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> +	default y
> +	help
> +	  This option adds the workaround for ARM Cortex-A725 erratum 3821522.
> +
> +	  On affected A725 cores, the CNT_CYCLES event may incur a significant
> +	  increment error when entering and subsequently exiting WFx.
> +	  As a result, the CNT_CYCLES may diverge from the system counter
> +	  frequency at which it is expected to increment.
> +	  This renders the AMU counter AMEVCNTR01, that implements CNT_CYCLES,
> +	  being unreliable and unsuitable for use.
> +
> +	  Since there is no hardware workaround, reads of the affected CNT_CYCLES
> +	  counter return 0 in the relevant paths. This causes users of the counter
> +	  to treat it as unavailable and is functionally equivalent to firmware
> +	  disabling the affected counter.
> +
> +	  If unsure, say Y.
> +
>  config ARM64_WORKAROUND_SPECULATIVE_UNPRIV_LOAD
>  	bool
>  
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 8ce559ac073c7..40c14e8600ae0 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -386,6 +386,10 @@ static const struct midr_range workaround_amu_constcnt_list[] = {
>  #ifdef CONFIG_ARM64_ERRATUM_2457168
>  	/* Cortex-A510 r0p0-r1p1 */
>  	MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1),
> +#endif
> +#ifdef CONFIG_ARM64_ERRATUM_3821522
> +	/* Cortex-A725 r0p0 - r0p2 */
> +	MIDR_RANGE(MIDR_CORTEX_A725, 0, 0, 0, 2),
>  #endif
>  	{}
>  };
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 64588554e7f76..f1bdb49d5d92e 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -397,10 +397,11 @@ static void cpu_read_corecnt(void *val)
>  static void cpu_read_constcnt(void *val)
>  {
>  	/*
> -	 * Return 0 if the current CPU is affected by erratum 2457168. A value
> -	 * of 0 is also returned if the current CPU does not support AMUs or if
> -	 * the counter is disabled. A return value of 0 at counter read is
> -	 * properly handled as an error case by the users of the counter.
> +	 * Return 0 if the current CPU is affected by a HW erratum.
> +	 * A value of 0 is also returned if the current CPU does not
> +	 * support AMUs or if the counter is disabled. A return
> +	 * value of 0 at counter read is properly handled as an error
> +	 * case by the users of the counter.
>  	 */
>  	*(u64 *)val = this_cpu_has_cap(ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT) ?
>  		      0UL : read_constcnt();
> -- 2.43.0
> 

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

Thanks
Vladimir

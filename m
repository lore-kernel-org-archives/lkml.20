Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD7037A820
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690163; cv=none; b=gQgjT/Nso/6R0/IZghCwfeuEu0QFHrT/IXpy/nugONR4+hBOd0jtp5Upgu/CbFhHf1VTDXwkpAH7Zt2W6QHd+82bB5z1qQC67ok5yRm493e7jtCos3zOUEU93i2R2AfmDvYOyN2+WuPh0fIeCSlAi6NONCX6V4QrdIzjkH8f8YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690163; c=relaxed/simple;
	bh=m19B67tO6yA36DYUEW/3W38fHYK7u9VkS9Qn+xT2Cjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLaqXL2LP1BkD9cHb9qT62i1mjuqPLnfxgv71JkCycuG9tnWD9Z1e3n8z2tVYq3PiB7voz0yzSHVmq2Lv70xMB5mbt7c0UAlKxFZLGpuQ3pd1PK/whlFXBwKRo/0FL3FNvCL/gWCiWUPCFcI5436FleW8P15D+ldqfGVDzSZHKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=D3dCr0pv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="D3dCr0pv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90D4D1476;
	Tue, 29 Sep 2026 06:55:57 -0700 (PDT)
Received: from [10.0.153.43] (e121487-lin.cambridge.arm.com [10.0.153.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C9833F85F;
	Tue, 29 Sep 2026 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790690161; bh=m19B67tO6yA36DYUEW/3W38fHYK7u9VkS9Qn+xT2Cjg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D3dCr0pvlRcVbfNihRuMchu/3XaIn8876ItpJktMauXeVWiJoVYk97kIAeGRtuZHC
	 Un19rkp4+rtvXrHyGcDuaCFCuwwKQL3n3AA+RlvDY0ifHcKwQy9yO5+V+S6F0U1mBr
	 cBA9Z4+F0vMFQZpl8hS+2xCsh4Ll09Nq0AImkmYs=
Message-ID: <491d09a3-cfaf-45d5-9715-459e89180068@arm.com>
Date: Tue, 29 Sep 2026 14:55:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Add Cortex-A725 erratum 3821522
 workaround
To: Beata Michalska <beata.michalska@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
 James.Morse@arm.com, xuewen.yan94@gmail.com, seanwang1@lenovo.com,
 linux-kernel@vger.kernel.org
References: <20260929134055.3241587-1-beata.michalska@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260929134055.3241587-1-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Beata,

On 9/29/26 14:40, Beata Michalska wrote:
> Cortex-A725 erratum 3821522 affects the CNT_CYCLES event, which can
> incur a significant increment error when a CPU enters and subsequently
> exits WFE or WFI, and may no longer track the system counter frequency.
> 
> The AMEVCNTR01_EL0 counter is being used as the AMU constant counter for
> frequency invariance and CPPC FFH feedback counters. Treat the affected
> AMU counter as unavailable by returning zero in the AMU counter paths,
> matching the existing convention used when the counter is disabled or
> unusable. This prevents the broken counter from being used as a reference
> source.
> 
> The erratum can also affect PMUv3 users of the CNT_CYCLES event, but this
> workaround intentionally does not change PMU event handling. Hiding or
> rejecting the PMU event from the erratum code would change the perf-visible
> PMU event interface, including raw event selection, and would need
> separate PMU specific approach rather than being folded into the AMU
> reference-counter workaround.
> 
> This also folds the per-erratum workarounds for ARM errata 2457168 and
> 3821522 into a single AMU constant-counter capability, as both require
> treating AMEVCNTR01 as unreliable and unavailable.
> 

Can we please split this in two patches:

1. Factor out ARM64_WORKAROUND_2457168 into generic ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
2. Wire up Cortex-A725 erratum 3821522

> CC: <stable@vger.kernel.org>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
>  arch/arm64/include/asm/cpucaps.h            |  3 ++-
>  arch/arm64/kernel/cpu_errata.c              | 29 +++++++++++++++-----
>  arch/arm64/kernel/cpufeature.c              |  2 +-
>  arch/arm64/kernel/topology.c                | 16 ++++++-----
>  arch/arm64/tools/cpucaps                    |  2 +-
>  7 files changed, 68 insertions(+), 16 deletions(-)
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
> index b5a51b0ef9440..cab741a695f52 100644
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
> @@ -1073,6 +1081,28 @@ config ARM64_ERRATUM_2645198
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
> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> index 76350b38f0d7a..120c5dc3c11d7 100644
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@ -75,8 +75,9 @@ cpucap_is_possible(const unsigned int cap)
>  		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
>  	case ARM64_HAS_LSUI:
>  		return IS_ENABLED(CONFIG_ARM64_LSUI);
> +	case ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT:
> +		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT);

Hmm, ARM64_WORKAROUND_2457168 has not been present here, so seeing
ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT here is not quite expected...

>  	}
> -

Nitpick: unrelated change?

Thanks
Vladimir

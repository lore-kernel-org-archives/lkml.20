Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511094718FC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760094; cv=none; b=LhBncmxRUelP2f3QB6+DpGJg01yuYTSzg3SFI4x8YO9SSxecuqPjqU6rY7xP4IjJR668xR5PHiFzIyNWhiBJww5j7Yb4DMWCsg6tAfOC/V3KZ/GRIxponzFVZIgR7+EWifftfLPijmsGw12lCq3I0a4bZF2an786TNkWAxw9gPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760094; c=relaxed/simple;
	bh=d6yTqXDZhOEz9we6cNXyP24VemZKfMv7POyGBNQlwcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gnnv6UuW0kLV0+tJLk8SLE4vSejNR+HTmVAL5gh2oTxXOISwB9z6ZNoMk2pxZi8YPZPsyWJlDpyHlgVSc+bAkJjNuRGf8sAySoTq3Din/su/lAfsj5lck5kk8c2Wsm28R78sjmrjWumgqsXW2UOssE2WPR8+j83MvbmzsjTCmD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=h+8QFzM4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="h+8QFzM4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3E71497;
	Wed, 30 Sep 2026 02:21:28 -0700 (PDT)
Received: from [10.0.153.43] (e121487-lin.cambridge.arm.com [10.0.153.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5616B3F86F;
	Wed, 30 Sep 2026 02:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790760092; bh=d6yTqXDZhOEz9we6cNXyP24VemZKfMv7POyGBNQlwcU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h+8QFzM4w9gi3u5t96OSpY/61lM5sCrDK/0CqPPDpsloZD1GtWO3wWQqUXQy6GZ5r
	 AAABp5Dyd8JeAVyNAfiBU+2CRKL0Gg8f+yygzdQZu8lVwQ6TQMMlLmo4VSQ605dGVk
	 Ii2Pte+7c23bDahQcInPeIbJ3JkxB7LKj6BTzC/M=
Message-ID: <0dc8a173-2d8f-4a05-9624-6d95c2fdb622@arm.com>
Date: Wed, 30 Sep 2026 10:21:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: errata: Factor out broken AMU const counter
 cap
To: Beata Michalska <beata.michalska@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
 James.Morse@arm.com, xuewen.yan94@gmail.com, seanwang1@lenovo.com,
 linux-kernel@vger.kernel.org
References: <20260929154325.3416271-1-beata.michalska@arm.com>
 <20260929154325.3416271-2-beata.michalska@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260929154325.3416271-2-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Beata,

On 9/29/26 16:42, Beata Michalska wrote:
> Move the workaround from the erratum 2457168-specific cpucap to a generic
> broken AMU constant-counter one. This keeps the existing Cortex-A510
> handling unchanged while allowing other errata with similar AMU constant
> counter issue to share the capability bit and call sites.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  arch/arm64/Kconfig             |  8 ++++++++
>  arch/arm64/kernel/cpu_errata.c | 23 +++++++++++++++++------
>  arch/arm64/kernel/cpufeature.c |  2 +-
>  arch/arm64/kernel/topology.c   |  7 ++++---
>  arch/arm64/tools/cpucaps       |  2 +-
>  5 files changed, 31 insertions(+), 11 deletions(-)
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
> index 5db8f0619e4bc..f18683e56184b 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -381,6 +381,18 @@ static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
>  };
>  #endif
>  
> +#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> +static const struct arm64_cpu_capabilities arm64_repeat_amu_constcnt_list[] = {
                                                    ^^^^^^
                                           There is nothing to repeat :)

> +#ifdef CONFIG_ARM64_ERRATUM_2457168
> +	{
> +		/* Cortex-A510 r0p0-r1p1 */
> +		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
> +	},
> +#endif
> +	{}
> +};
> +#endif /* CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT */
> +
>  #ifdef CONFIG_CAVIUM_ERRATUM_23154
>  static const struct midr_range cavium_erratum_23154_cpus[] = {
>  	MIDR_ALL_VERSIONS(MIDR_THUNDERX),
> @@ -916,14 +928,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
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

I think it should be

                CAP_MIDR_RANGE_LIST(amu_broken_constcnt_cpus)

where amu_broken_constcnt_cpus is

static const struct midr_range amu_broken_constcnt_cpus[] = {
#ifdef CONFIG_ARM64_ERRATUM_2457168
       /* Cortex-A510 r0p0-r1p1 */
       MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1),
#endif
       {}
};

so in the next patch you would add new entry

#ifdef CONFIG_ARM64_ERRATUM_3821522
       /* Cortex-A725 r0p0 - r0p2 */
       MIDR_RANGE(MIDR_CORTEX_A725, 0, 0, 0, 2),
#endif


Cheers
Vladimir


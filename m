Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143434AB1BB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844651; cv=none; b=QuNeI7wLKwrrqKl53iykDZmZ5NTIGDhjZpQ+XBpClUFLYAXDQDYB56H7gsIHUep0IdD3tmPoD1AijscU3SEybdULWIQnfpfXfBEUlNbmcR+Iz3ca2K5tiTjy0fVXEjk0ctpbgbP7o32+UYCETn1wZgKd6LrfzMge6ZfdSKpctQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844651; c=relaxed/simple;
	bh=2kY249iXK1XN+Jzjq1WLtXqjbaLI/K1j1QQJaBsCd30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKAb2uFKwLqsvUTmvZOXSWhifcPVV5KQtlbixbmKm0L14rK+xvFTlmIyrY4lRJAlM8Tkxd4smSasUxSYa8tqIoa1X5VGEUaj5yTmMkkM9sC5rw8okR4VYYUInR13+5rLqnyuqTC03VEB93/Yt2sw43HNrIz2GRFtIYUhFjgbY58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mPIkQhDY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mPIkQhDY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1712143D;
	Thu,  1 Oct 2026 01:50:45 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24C843F85F;
	Thu,  1 Oct 2026 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790844649; bh=2kY249iXK1XN+Jzjq1WLtXqjbaLI/K1j1QQJaBsCd30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mPIkQhDY1Ob6l+HM5YeoQ/kvYHLCPf55eGtkqabmyP5H8Cv7at7+ZtLBnZfwWHORs
	 GsgRNDQODM4ceParSgw1N/9Brx8nvydEWGeKuJoFPSLuecz74uDBvYepaBq1USulMh
	 1BW7kKcuYpvRv/zOADhVcE/iSXy+9rdJmpop6CFU=
Date: Thu, 1 Oct 2026 10:50:44 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, suzuki.poulose@arm.com, James.Morse@arm.com,
	xuewen.yan94@gmail.com, seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: errata: Factor out broken AMU const
 counter cap
Message-ID: <ar4e5A5tytSaTWg5@arm.com>
References: <20260929154325.3416271-1-beata.michalska@arm.com>
 <20260929154325.3416271-2-beata.michalska@arm.com>
 <0dc8a173-2d8f-4a05-9624-6d95c2fdb622@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dc8a173-2d8f-4a05-9624-6d95c2fdb622@arm.com>

On Wed, Sep 30, 2026 at 10:21:28AM +0100, Vladimir Murzin wrote:
> Hi Beata,
Hi Vladimir,
> 
> On 9/29/26 16:42, Beata Michalska wrote:
> > Move the workaround from the erratum 2457168-specific cpucap to a generic
> > broken AMU constant-counter one. This keeps the existing Cortex-A510
> > handling unchanged while allowing other errata with similar AMU constant
> > counter issue to share the capability bit and call sites.
> > 
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >  arch/arm64/Kconfig             |  8 ++++++++
> >  arch/arm64/kernel/cpu_errata.c | 23 +++++++++++++++++------
> >  arch/arm64/kernel/cpufeature.c |  2 +-
> >  arch/arm64/kernel/topology.c   |  7 ++++---
> >  arch/arm64/tools/cpucaps       |  2 +-
> >  5 files changed, 31 insertions(+), 11 deletions(-)
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index b5a51b0ef9440..3b6c052d46a18 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1040,9 +1040,17 @@ config ARM64_ERRATUM_1902691
> >  
> >  	  If unsure, say Y.
> >  
> > +config ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> > +	bool
> > +	# Targeting errata affecting AMEVCNTR01, the AMU constant counter.
> > +	# On affected CPUs the counter may not increment at the expected rate,
> > +	# making it unreliable. As a result, AMU users should treat it as
> > +	# unavailable rather than relying on misleading counter values.
> > +
> >  config ARM64_ERRATUM_2457168
> >  	bool "Cortex-A510: 2457168: workaround for AMEVCNTR01 incrementing incorrectly"
> >  	depends on ARM64_AMU_EXTN
> > +	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> >  	default y
> >  	help
> >  	  This option adds the workaround for ARM Cortex-A510 erratum 2457168.
> > diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> > index 5db8f0619e4bc..f18683e56184b 100644
> > --- a/arch/arm64/kernel/cpu_errata.c
> > +++ b/arch/arm64/kernel/cpu_errata.c
> > @@ -381,6 +381,18 @@ static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
> >  };
> >  #endif
> >  
> > +#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> > +static const struct arm64_cpu_capabilities arm64_repeat_amu_constcnt_list[] = {
>                                                     ^^^^^^
>                                            There is nothing to repeat :)
> 
> > +#ifdef CONFIG_ARM64_ERRATUM_2457168
> > +	{
> > +		/* Cortex-A510 r0p0-r1p1 */
> > +		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
> > +	},
> > +#endif
> > +	{}
> > +};
> > +#endif /* CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT */
> > +
> >  #ifdef CONFIG_CAVIUM_ERRATUM_23154
> >  static const struct midr_range cavium_erratum_23154_cpus[] = {
> >  	MIDR_ALL_VERSIONS(MIDR_THUNDERX),
> > @@ -916,14 +928,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
> >  		ERRATA_MIDR_REV_RANGE(MIDR_CORTEX_A510, 0, 0, 2)
> >  	},
> >  #endif
> > -#ifdef CONFIG_ARM64_ERRATUM_2457168
> > +#ifdef CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> >  	{
> > -		.desc = "ARM erratum 2457168",
> > -		.capability = ARM64_WORKAROUND_2457168,
> > +		.desc = "Broken AMU AMEVCNTR01 (const counter)",
> > +		.capability = ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT,
> >  		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
> > -
> > -		/* Cortex-A510 r0p0-r1p1 */
> > -		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
> 
> I think it should be
> 
>                 CAP_MIDR_RANGE_LIST(amu_broken_constcnt_cpus)
True, that's more appropriate here.
Thanks

---
BR
Beata
> 
> where amu_broken_constcnt_cpus is
> 
> static const struct midr_range amu_broken_constcnt_cpus[] = {
> #ifdef CONFIG_ARM64_ERRATUM_2457168
>        /* Cortex-A510 r0p0-r1p1 */
>        MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1),
> #endif
>        {}
> };
> 
> so in the next patch you would add new entry
> 
> #ifdef CONFIG_ARM64_ERRATUM_3821522
>        /* Cortex-A725 r0p0 - r0p2 */
>        MIDR_RANGE(MIDR_CORTEX_A725, 0, 0, 0, 2),
> #endif
> 
> 
> Cheers
> Vladimir
> 

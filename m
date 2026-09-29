Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB815282F0A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690998; cv=none; b=ibcrTJGp4v2htOhLsvnLuNspp8SpcS//pb2KmrBMNapzXPZyz+pNBa/UEAy+Mf5WCWls5KDqSEmY2WLU7tisgk9GfXFjWjJf/UrJBkqV7lFdhsK1DI3fgiReqyNai99iwb+tSeGN6YoxiXrxSey+6Ufa99U/o6PeaRCUcyrVdHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690998; c=relaxed/simple;
	bh=drjAjLIf0FiNjXb30u1fBy6oMHBuPaNbZ6+6LguMfEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3OTvYJ/SC8hwoAl4NQF92MIqYulJW9I5WriLw3GXrgCbpmOWqw7dB78Ko9ZWio9egnZ0mBKFg4Aqg8d3aEVFDVs5weRAY1vW2wV8goK12V33usavrr/kgG7pgQl8b4xdovMKAe5Kz8DbTR+HcPQigq2y4+TiQ69vsAdwPt3RJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Q1A79Yev; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Q1A79Yev"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B710C152B;
	Tue, 29 Sep 2026 07:09:52 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 122183F86F;
	Tue, 29 Sep 2026 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790690996; bh=drjAjLIf0FiNjXb30u1fBy6oMHBuPaNbZ6+6LguMfEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1A79Yev43HvgLhsasL5CE3UA2ZZebu7AhW0HmQxZh77T5S/AX48u8EipgJqa2ntG
	 jUT+j65NR85Fl/c5U4vti8w404B0nAF+O2Zx+6yCHl38iZ5eXZb3WHoVKJVFhQ2JGJ
	 N5dGYi7EjKCuj14UfdM/aZtzVe09z5XgLkAtYIM8=
Date: Tue, 29 Sep 2026 16:09:50 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, suzuki.poulose@arm.com, James.Morse@arm.com,
	xuewen.yan94@gmail.com, seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: errata: Add Cortex-A725 erratum 3821522
 workaround
Message-ID: <arvGrikAp8focp2Y@arm.com>
References: <20260929134055.3241587-1-beata.michalska@arm.com>
 <491d09a3-cfaf-45d5-9715-459e89180068@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <491d09a3-cfaf-45d5-9715-459e89180068@arm.com>

Hi,
On Tue, Sep 29, 2026 at 02:55:56PM +0100, Vladimir Murzin wrote:
> Hi Beata,
> 
> On 9/29/26 14:40, Beata Michalska wrote:
> > Cortex-A725 erratum 3821522 affects the CNT_CYCLES event, which can
> > incur a significant increment error when a CPU enters and subsequently
> > exits WFE or WFI, and may no longer track the system counter frequency.
> > 
> > The AMEVCNTR01_EL0 counter is being used as the AMU constant counter for
> > frequency invariance and CPPC FFH feedback counters. Treat the affected
> > AMU counter as unavailable by returning zero in the AMU counter paths,
> > matching the existing convention used when the counter is disabled or
> > unusable. This prevents the broken counter from being used as a reference
> > source.
> > 
> > The erratum can also affect PMUv3 users of the CNT_CYCLES event, but this
> > workaround intentionally does not change PMU event handling. Hiding or
> > rejecting the PMU event from the erratum code would change the perf-visible
> > PMU event interface, including raw event selection, and would need
> > separate PMU specific approach rather than being folded into the AMU
> > reference-counter workaround.
> > 
> > This also folds the per-erratum workarounds for ARM errata 2457168 and
> > 3821522 into a single AMU constant-counter capability, as both require
> > treating AMEVCNTR01 as unreliable and unavailable.
> > 
> 
> Can we please split this in two patches:
> 
> 1. Factor out ARM64_WORKAROUND_2457168 into generic ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> 2. Wire up Cortex-A725 erratum 3821522
Sure,
> 
> > CC: <stable@vger.kernel.org>
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >  Documentation/arch/arm64/silicon-errata.rst |  2 ++
> >  arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
> >  arch/arm64/include/asm/cpucaps.h            |  3 ++-
> >  arch/arm64/kernel/cpu_errata.c              | 29 +++++++++++++++-----
> >  arch/arm64/kernel/cpufeature.c              |  2 +-
> >  arch/arm64/kernel/topology.c                | 16 ++++++-----
> >  arch/arm64/tools/cpucaps                    |  2 +-
> >  7 files changed, 68 insertions(+), 16 deletions(-)
> > 
> > diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> > index ac3248b9f2f3b..99a1eb4b833dd 100644
> > --- a/Documentation/arch/arm64/silicon-errata.rst
> > +++ b/Documentation/arch/arm64/silicon-errata.rst
> > @@ -174,6 +174,8 @@ stable kernels.
> >  +----------------+-----------------+-----------------+-----------------------------+
> >  | ARM            | Cortex-A725     | #3456106        | ARM64_ERRATUM_3194386       |
> >  +----------------+-----------------+-----------------+-----------------------------+
> > +| ARM            | Cortex-A725     | #3821522        | ARM64_ERRATUM_3821522       |
> > ++----------------+-----------------+-----------------+-----------------------------+
> >  | ARM            | Cortex-X1       | #1502854        | N/A                         |
> >  +----------------+-----------------+-----------------+-----------------------------+
> >  | ARM            | Cortex-X1       | #3324344        | ARM64_ERRATUM_3194386       |
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index b5a51b0ef9440..cab741a695f52 100644
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
> > @@ -1073,6 +1081,28 @@ config ARM64_ERRATUM_2645198
> >  
> >  	  If unsure, say Y.
> >  
> > +config ARM64_ERRATUM_3821522
> > +	bool "Cortex-A725: 3821522: workaround for possible CNT_CYCLES increment error due to WFE/WFI"
> > +	depends on ARM64_AMU_EXTN
> > +	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> > +	default y
> > +	help
> > +	  This option adds the workaround for ARM Cortex-A725 erratum 3821522.
> > +
> > +	  On affected A725 cores, the CNT_CYCLES event may incur a significant
> > +	  increment error when entering and subsequently exiting WFx.
> > +	  As a result, the CNT_CYCLES may diverge from the system counter
> > +	  frequency at which it is expected to increment.
> > +	  This renders the AMU counter AMEVCNTR01, that implements CNT_CYCLES,
> > +	  being unreliable and unsuitable for use.
> > +
> > +	  Since there is no hardware workaround, reads of the affected CNT_CYCLES
> > +	  counter return 0 in the relevant paths. This causes users of the counter
> > +	  to treat it as unavailable and is functionally equivalent to firmware
> > +	  disabling the affected counter.
> > +
> > +	  If unsure, say Y.
> > +
> >  config ARM64_WORKAROUND_SPECULATIVE_UNPRIV_LOAD
> >  	bool
> >  
> > diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> > index 76350b38f0d7a..120c5dc3c11d7 100644
> > --- a/arch/arm64/include/asm/cpucaps.h
> > +++ b/arch/arm64/include/asm/cpucaps.h
> > @@ -75,8 +75,9 @@ cpucap_is_possible(const unsigned int cap)
> >  		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
> >  	case ARM64_HAS_LSUI:
> >  		return IS_ENABLED(CONFIG_ARM64_LSUI);
> > +	case ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT:
> > +		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT);
> 
> Hmm, ARM64_WORKAROUND_2457168 has not been present here, so seeing
> ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT here is not quite expected...
Yeah, it's bit of a stretch and not necessarily needed.
Added that for completeness but it's not really required.
Can get rid of that.

---
BR
Beata
> 
> >  	}
> > -
> 
> Nitpick: unrelated change?
> 
> Thanks
> Vladimir

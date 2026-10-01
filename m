Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05174A6892
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844719; cv=none; b=qR5Z08AfmlNsuYE0yb5b9KIpUECQ6kl1CLcI4WdKKZ39+nsTcNPTk2ProUOhB4zcLHKh5EH+Lm0io19G7UIP1V3F56o9bkadePL11ME+jmnq1G3Bf6DvDOlaNw+BU8hOoYxHbXg2TLMUS9I3zRjZRnspjoE+2m9pcwtAP/XnR/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844719; c=relaxed/simple;
	bh=nJL7T4f/rD7vUdshMIpvkv7tiy8BM+mA0Cdh9NJZBSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+SWsF8OvFVpS7bkaj4siUqOoKP2E6+2+NtgxW++AH9kpq2uDaMNqrHXDNuJKW/Bw8Um20DFIKiAM2CVN0uXeTNIiTkTk+9HRtNXIXnm60uME6ToCJstz4JGPsM84ZwtwxFwkROrg1xqnlvVAHGS45OgbIHRM4UrWh4AffNQsOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uOdtAXVw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uOdtAXVw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4D27497;
	Thu,  1 Oct 2026 01:51:53 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D2D33F85F;
	Thu,  1 Oct 2026 01:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790844717; bh=nJL7T4f/rD7vUdshMIpvkv7tiy8BM+mA0Cdh9NJZBSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uOdtAXVwG1CjvKZBLroFUoIbNiy8hgKXS0rg7CdbG/NM8bzQNKpQWULM/1F4aInWd
	 qDDGOyeL9CYMNL7BC7sPw15KiYawbPxE7wvJxpuAr/w2QGde//a2+unNs0Tuufq2u+
	 r6jQeR8MTTkcRibz0mFjhLxha1GVPiQvgxYZE9XI=
Date: Thu, 1 Oct 2026 10:51:52 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, suzuki.poulose@arm.com, James.Morse@arm.com,
	xuewen.yan94@gmail.com, seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: errata: Add Cortex-A725 erratum 3821522
 workaround
Message-ID: <ar4fKMzA-tdITsxH@arm.com>
References: <20260929154325.3416271-1-beata.michalska@arm.com>
 <20260929154325.3416271-3-beata.michalska@arm.com>
 <d0a20ba6-2d1f-4169-9188-15b954c377b4@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0a20ba6-2d1f-4169-9188-15b954c377b4@arm.com>

On Wed, Sep 30, 2026 at 10:27:27AM +0100, Vladimir Murzin wrote:
> Hi Beata,
Hi Vladimir
> 
> On 9/29/26 16:42, Beata Michalska wrote:
> > Cortex-A725 erratum 3821522 affects the CNT_CYCLES event, which can
> > incur a significant increment error when a CPU enters and subsequently
> > exits WFE or WFI, and may no longer track the system counter
> > frequency.
> > 
> > The AMEVCNTR01_EL0 counter is used as the AMU constant counter for
> > frequency invariance and CPPC FFH feedback counters. Wire the affected
> > Cortex-A725 range into the shared broken AMU constant-counter capability
> > so the affected counter is treated as unavailable by returning zero in
> > the AMU counter paths. This prevents the broken counter from being used
> > as a reference source.
> > 
> > The erratum can also affect PMUv3 users of the CNT_CYCLES event,
> > but this workaround intentionally does not change PMU event handling.
> > Hiding or rejecting the PMU event from the erratum code would change
> > the perf-visible PMU event interface, including raw event selection,
> > and would need a separate PMU-specific approach rather than being
> > folded into the AMU reference-counter workaround.
> > 
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >  Documentation/arch/arm64/silicon-errata.rst |  2 ++
> >  arch/arm64/Kconfig                          | 22 +++++++++++++++++++++
> >  arch/arm64/kernel/cpu_errata.c              |  6 ++++++
> >  arch/arm64/kernel/topology.c                |  9 +++++----
> >  4 files changed, 35 insertions(+), 4 deletions(-)
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
> > index 3b6c052d46a18..cab741a695f52 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1081,6 +1081,28 @@ config ARM64_ERRATUM_2645198
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
> > diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> > index f18683e56184b..42a6fff8c3f44 100644
> > --- a/arch/arm64/kernel/cpu_errata.c
> > +++ b/arch/arm64/kernel/cpu_errata.c
> > @@ -388,6 +388,12 @@ static const struct arm64_cpu_capabilities arm64_repeat_amu_constcnt_list[] = {
> >  		/* Cortex-A510 r0p0-r1p1 */
> >  		CAP_MIDR_RANGE(MIDR_CORTEX_A510, 0, 0, 1, 1)
> >  	},
> > +#endif
> > +#ifdef CONFIG_ARM64_ERRATUM_3821522
> > +	{
> > +		/* Cortex-A725 r0p0 - r0p2 */
> > +		CAP_MIDR_RANGE(MIDR_CORTEX_A725, 0, 0, 0, 2)
> > +	},
> >  #endif
> >  	{}
> >  };
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > index 64588554e7f76..fc5d3abd12905 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -397,10 +397,11 @@ static void cpu_read_corecnt(void *val)
> >  static void cpu_read_constcnt(void *val)
> >  {
> >  	/*
> > -	 * Return 0 if the current CPU is affected by erratum 2457168. A value
> > -	 * of 0 is also returned if the current CPU does not support AMUs or if
> > -	 * the counter is disabled. A return value of 0 at counter read is
> > -	 * properly handled as an error case by the users of the counter.
> > +	 * Return 0 if the current CPU is affected by either erratum 2457168
> > +	 * or erratum 3821522. A value of 0 is also returned if the current
> 
> Perhaps wording it generically like:
> 
>   Return 0 if the current CPU is affected by a HW erratum.
> 
> would save us from having to change the comment next time we encounter a broken AMU :)
Indeed. Will change that.
Thanks.

---
BR
Beata
> 
> Thanks
> Vladimir
> 

Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AEB205E29
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790959002; cv=none; b=gPmbUcuwszyhvZWMFziTFJ0P+RePBAmAuzXyEaw/nvONv1BWjxnFL+UHuf0oSGy4lzsm+6utqe/yDrdVqUZqkvdB1hFq+0pgM5tUjtYoxUlOG92tNiaxUteAAlpdDilQw6X7pBG0N+FidYNCkZic10LbtaiZ53huvd5VG1Iib+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790959002; c=relaxed/simple;
	bh=V2iP11AqLJrnlffFoNaBLvF6WfZv6nsMy1aV182Y27w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QT+HkxwxC4uILX1MEYDDc1Jw2NMagJsof3kk5rOIhXdyT03EkreqNnfC5gs/zatnXRzfEds5aqQZ9qNM17mZza6J1dvQmFsFZYOJvUpPMIOmjPBhO5GvA2GGy4W/0RthsgzmlEB33tlhsJ9dAPYENWfjm22Yp7Q0VDCVPeWsMJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TTI09i01; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TTI09i01"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C0B42F;
	Fri,  2 Oct 2026 09:36:36 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B881C3F86F;
	Fri,  2 Oct 2026 09:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790958999; bh=V2iP11AqLJrnlffFoNaBLvF6WfZv6nsMy1aV182Y27w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTI09i015O+RaWePVACx4VPp/sX2xyvGk+lltTEEf0YLeoLb6U7zJJlThGKSp7tcf
	 Gc8eh+g3w8gogE1lInO0AlJFoy5oh42K5qY4OPe9UnNrwMH8FHiNPS+1rIonePpxD8
	 b81dHbG6Cnsza+fRQB6U7boGC1vMk7B+Zj/q256o=
Date: Fri, 2 Oct 2026 17:36:30 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Rodolfo Giometti <giometti@enneenne.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 1/2] arm64: Support inlined clocksource reads for the
 arch counter
Message-ID: <ar_djtAlVLAy0Gan@J2N7QTR9R3.cambridge.arm.com>
References: <20261002151938.69857-1-dwmw2@infradead.org>
 <20261002151938.69857-2-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002151938.69857-2-dwmw2@infradead.org>

Hi David,

On Fri, Oct 02, 2026 at 04:19:37PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Commit 2e27beeb66e43 ("timekeeping: Allow inlining clocksource::read()")
> allows an architecture's clocksource::read() to be inlined, and was only
> wired up for x86_64 thus far in commit b27801189f7fc ("x86: Inline TSC
> reads in timekeeping").
> 
> Add the corresponding ARCH_WANTS_CLOCKSOURCE_READ_INLINE support for the
> arm64 arch counter, allowing the indirect clock->read() call in the fast
> paths to be replaced with a direct sysreg read. A static key selects
> CNTPCT vs CNTVCT as appropriate, and the inline support is only
> advertised for the plain (no erratum workaround) read paths.
> 
> Measured on a Cortex-A53 at 1.35GHz (12.5MHz arch counter): the
> interval from a raw counter read in the caller to the counter read
> inside ktime_get_real_ts64() drops from 30.2ns to 23.4ns, mean of 1M
> iterations. Every ktime_get*() user of tk_clock_read() benefits
> similarly. Except ktime_get_snapshot_id(), which I shall get to shortly.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Assisted-by: LLM

On IRC you mentioned that the saving here was dominated by other costs
(in the microseconds range). Given that, as I mentioned there, I'd
prefer to avoid this.

The arm_arch_timer driver is complicated enough with all the errata
handling, with which we've had more than one painful problem. I don't
want more complication there just to game a microbenchmark.

Mark.

> ---
>  arch/arm64/Kconfig                     |  1 +
>  arch/arm64/include/asm/clock_inlined.h | 26 ++++++++++++++++++++++++++
>  drivers/clocksource/arm_arch_timer.c   | 21 +++++++++++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100644 arch/arm64/include/asm/clock_inlined.h
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5a51b0ef944..25795b87cd41 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -94,6 +94,7 @@ config ARM64
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
>  	select ARCH_WANT_LD_ORPHAN_WARN
> +	select ARCH_WANTS_CLOCKSOURCE_READ_INLINE
>  	select ARCH_WANTS_EXECMEM_LATE
>  	select ARCH_WANTS_NO_INSTR
>  	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
> diff --git a/arch/arm64/include/asm/clock_inlined.h b/arch/arm64/include/asm/clock_inlined.h
> new file mode 100644
> index 000000000000..fe997412bc7d
> --- /dev/null
> +++ b/arch/arm64/include/asm/clock_inlined.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_ARM64_CLOCK_INLINED_H
> +#define _ASM_ARM64_CLOCK_INLINED_H
> +
> +#include <linux/jump_label.h>
> +#include <asm/arch_timer.h>
> +
> +struct clocksource;
> +
> +/*
> + * Set by the arch timer driver when it selects the physical counter
> + * (kernel booted at EL2); otherwise the virtual counter is used. The
> + * driver only advertises CLOCK_SOURCE_CAN_INLINE_READ when it selected
> + * a plain (no erratum workaround) sysreg read matching this function.
> + */
> +DECLARE_STATIC_KEY_FALSE(arch_timer_inline_read_pct);
> +
> +static __always_inline u64 arch_inlined_clocksource_read(struct clocksource *cs)
> +{
> +	if (static_branch_likely(&arch_timer_inline_read_pct))
> +		return __arch_counter_get_cntpct();
> +
> +	return __arch_counter_get_cntvct();
> +}
> +
> +#endif
> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
> index cc9a8b399004..1c3d503d881a 100644
> --- a/drivers/clocksource/arm_arch_timer.c
> +++ b/drivers/clocksource/arm_arch_timer.c
> @@ -133,6 +133,13 @@ static noinstr u64 arch_counter_get_cntvct(void)
>  u64 (*arch_timer_read_counter)(void) __ro_after_init = arch_counter_get_cntvct;
>  EXPORT_SYMBOL_GPL(arch_timer_read_counter);
>  
> +#ifdef CONFIG_ARM64
> +#include <asm/clock_inlined.h>
> +
> +/* Selects CNTPCT in arch_inlined_clocksource_read() */
> +DEFINE_STATIC_KEY_FALSE(arch_timer_inline_read_pct);
> +#endif
> +
>  static u64 arch_counter_read(struct clocksource *cs)
>  {
>  	return arch_timer_read_counter();
> @@ -917,6 +924,15 @@ static void __init arch_counter_register(void)
>  		} else {
>  			rd = arch_counter_get_cntvct;
>  			scr = arch_counter_get_cntvct;
> +			/*
> +			 * A plain sysreg read with no erratum workaround
> +			 * matches arch_inlined_clocksource_read(); allow the
> +			 * core timekeeping code to bypass the indirect call.
> +			 */
> +#ifdef CONFIG_ARM64
> +			clocksource_counter.flags |=
> +				CLOCK_SOURCE_CAN_INLINE_READ;
> +#endif
>  		}
>  	} else {
>  		if (arch_timer_counter_has_wa()) {
> @@ -925,6 +941,11 @@ static void __init arch_counter_register(void)
>  		} else {
>  			rd = arch_counter_get_cntpct;
>  			scr = arch_counter_get_cntpct;
> +#ifdef CONFIG_ARM64
> +			static_branch_enable(&arch_timer_inline_read_pct);
> +			clocksource_counter.flags |=
> +				CLOCK_SOURCE_CAN_INLINE_READ;
> +#endif
>  		}
>  	}
>  
> -- 
> 2.43.0
> 

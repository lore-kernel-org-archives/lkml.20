Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650E4545D8E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874614; cv=none; b=OQvMv8PpRs/PH9DJbfRF4x6hKnUG/Q0c1weBbW+2dUllQs3OOixPu3P9tOrVOOMVsrk+1jK6g/l91OJpEyt4IT+CKVpBF7nUoGtpDivRtQtnsauzKgnkV8QizgkFPvd6/45VBymQCkSMzB5+L09DcOS691RiNIdNVLrVPXDiB0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874614; c=relaxed/simple;
	bh=4glOVeulBFDIQV+U/gsQ4wFkaeohRD9SwaXlHEmJYdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLxAQVPRBQh+lBegjPtqhy3QUmlYTsrOrD6QfTHj3UnnhUZFY3UxxStY49lKBZb9JLSsbanLrN52aMyb4MVHlMSd77/36GzLJnmbkc8RVwuwB7XAdsuPQrlzA858Uz8GsMhuScQxmPV70KdruorKjpG3z5uQiLAahSbyjEx0onw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B716C1F00A3A;
	Tue,  8 Sep 2026 13:36:45 +0000 (UTC)
Date: Tue, 8 Sep 2026 14:36:39 +0100
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 19/19] arm64: smp: Harden parallel CPU bringup against
 broken PSCI firmware
Message-ID: <aqAPZ59D_tfN6wUQ@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-20-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907164024.17164-20-will@kernel.org>

On Mon, Sep 07, 2026 at 05:40:22PM +0100, Will Deacon wrote:
> Since firmware has occasionally been known to get things wrong, harden
> our parallel CPU bringup code against a PSCI implementation that passes
> the CPU_ON argument to an incorrect CPU.
> 
> The primary CPU writes the MPIDR of the incoming CPU to the end of its
> task stack and this is then checked against the MPIDR_EL1 register
> during early kernel entry. A mismatch is reported via the existing
> failure reporting mechanism and the CPU is not brought online.
> 
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/smp.h    |  4 +++-
>  arch/arm64/kernel/asm-offsets.c |  1 +
>  arch/arm64/kernel/head.S        | 39 ++++++++++++++++++++++++++++-----
>  arch/arm64/kernel/smp.c         | 11 ++++++++--
>  4 files changed, 46 insertions(+), 9 deletions(-)

[...]

> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> index bec4bc1b12db..56deeb9673d6 100644
> --- a/arch/arm64/kernel/head.S
> +++ b/arch/arm64/kernel/head.S
> @@ -192,11 +192,21 @@ SYM_CODE_END(preserve_boot_args)
>  	 * its location in the task stack. We reserve the entire pt_regs space
>  	 * for consistency with user tasks and kthreads.
>  	 */
> -	.macro	init_cpu_task tsk, tmp1, tmp2
> +	.macro	init_cpu_task tsk, tmp1, tmp2, check_mpidr=
>  	msr	sp_el0, \tsk
>  
>  	ldr	\tmp1, [\tsk, #TSK_STACK]
> -	add	sp, \tmp1, #THREAD_SIZE
> +	mov	sp, \tmp1
> +	.ifnb	\check_mpidr
> +	mov_q	\tmp1, MPIDR_HWID_BITMASK
> +	mrs	\tmp2, mpidr_el1
> +	and	\tmp2, \tmp2, \tmp1
> +	ldr	\tmp1, [sp]
> +	sub	\tmp1, \tmp1, \tmp2
> +	cbnz	\tmp1, __cpu_secondary_broken_psci_arg
> +	.endif
> +
> +	add	sp, sp, #THREAD_SIZE
>  	sub	sp, sp, #PT_REGS_SIZE
>  
>  	stp	xzr, xzr, [sp, #S_STACKFRAME]
> @@ -401,11 +411,12 @@ SYM_FUNC_START_LOCAL(__secondary_switched)
>  	cbnz	x2, 1f
>  	adr_l	x0, secondary_data
>  	ldr	x2, [x0, #CPU_BOOT_TASK]
> -	cbz	x2, __secondary_too_slow
> -
> -1:
>  	init_cpu_task x2, x1, x3
> -
> +	cbnz	x2, 2f
> +	b	__secondary_too_slow

Bah, Sashiko points out that this is too late, as x2 has already been
dereferenced on the non-PSCI 0.2+ path. I'll rework this for v2.

Will

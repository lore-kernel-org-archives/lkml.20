Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1CD449EA9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460774; cv=none; b=Wyc2zcBc/P0IOxT1feULxEOVCD6rwd151dBZXErOADQul9tI4XK3BZocrUK2ZrTPJdZ0sSImJp8xWt8UKOop+BJI3LJQd19jIBIl2MSIWRUDZdUBEBl4BnxCqI153tI68uRTeKOsp/EBPUjVe2w7mLHW+VKpL4xMxhzLyS7hiXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460774; c=relaxed/simple;
	bh=Rq4bRDngK22vqRDxlQGBJHlkLgXmDpex4yWT3kgYd6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Je703wwHai7N3M72HsIkA0PcNgMe8pC8gzhql/LyAm57ZL804LTyAovr6ko9CQUPNX5y+YBvbtq8bUON18D1S3leIOK1jU9F24yDNR8CccCEneJth3zsGwhNVuSBzuU0Nf5V4IE2jmsoYbMPnE+/tFmK4iRZvMTuVyqqq720xo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=yWTNNxBy; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="yWTNNxBy"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EXzZkr9qT6NMHiIPYkMhbu7eTjz0R5QmQok3N0POnAI=;
	b=yWTNNxBygJvS173H3H6bFpxiw0lOv4//r5FsuD9I/DFDvz2Rdcv08Sd2Sru0WOxAQL95EFEgp
	5BLrjbGyz5ygSQO2shGVdRWph0l45LeVpG0vBKWOOhUHtFC46btGDsinMvFRZsNgLvpZXVUEldN
	yXdddCZLIH2oOhtIRHUWD1s=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j0pBJ4KHjzKm52;
	Thu,  8 Oct 2026 19:47:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A11F040572;
	Thu,  8 Oct 2026 19:59:22 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 19:59:21 +0800
Message-ID: <80514dc0-857f-4c04-aa30-21ecd35b2a18@huawei.com>
Date: Thu, 8 Oct 2026 19:59:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] arm64: entry: Use SPSel to switch to overflow
 stack
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Ard
 Biesheuvel <ardb@kernel.org>, Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Mark
 Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-18-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-18-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/9/19 0:14, Will Deacon 写道:
> When detecting a stack overflow on exception entry from EL1, use SPSel
> to switch to the overflow stack without corrupting any GPRs. Not only is
> this simpler than the previous logic, but it also opens the door to
> more complicated overflow checks (for example, based on per-task stack
> sizes or stacks which are not aligned to a specific page order) as well
> as the possibility of returning from a stack fault if we were able to
> resolve it.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kernel/entry.S | 69 ++++++++++++---------------------------
>  1 file changed, 21 insertions(+), 48 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index 6958ee238649..b4df2f23ebe7 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -51,11 +51,11 @@
>  	mov	x30, xzr
>  	.endif
>  .Lskip_tramp_vectors_cleanup\@:
> -	.endif
> -
> +	sub	sp, sp, #PT_REGS_SIZE
> +	.else	/* \el == 1 */
> +	.ifc	\ht, h
>  	sub	sp, sp, #PT_REGS_SIZE
>  
> -	.if	\el == 1
>  	/*
>  	 * Test whether the SP has overflowed, without corrupting a GPR.
>  	 * Task and IRQ stacks are aligned so that SP & (1 << THREAD_SHIFT)
> @@ -63,45 +63,16 @@
>  	 */
>  	add	sp, sp, x0			// sp' = sp + x0
>  	sub	x0, sp, x0			// x0' = sp' - x0 = (sp + x0) - x0 = sp
> -	tbnz	x0, #THREAD_SHIFT, 0f
> +	tbnz	x0, #THREAD_SHIFT, __bad_stack
>  	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
>  	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
> +	.else	/* EL1t */
> +	msr	spsel, #0			// Stay on the overflow stack
> +	sub	sp, sp, #PT_REGS_SIZE
> +	.endif
>  	.endif
>  
>  	b	el\el\ht\()_\regsize\()_\label
> -
> -	.if	\el == 1
> -0:
> -	/*
> -	 * Either we've just detected an overflow, or we've taken an exception
> -	 * while on the overflow stack. Either way, we won't return to
> -	 * userspace, and can clobber EL0 registers to free up GPRs.
> -	 */
> -
> -	/* Stash the original SP (minus PT_REGS_SIZE) in tpidr_el0. */
> -	msr	tpidr_el0, x0
> -
> -	/* Recover the original x0 value and stash it in sp_el0 */
> -	sub	x0, sp, x0
> -	msr	sp_el0, x0
> -
> -	/* Switch to the overflow stack */
> -	adr_this_cpu sp, overflow_stack + OVERFLOW_STACK_SIZE, x0
> -
> -	/*
> -	 * Check whether we were already on the overflow stack. This may happen
> -	 * after panic() re-enables interrupts.
> -	 */
> -	mrs	x0, tpidr_el0			// sp of interrupted context
> -	sub	x0, sp, x0			// delta with top of overflow stack
> -	tst	x0, #~(OVERFLOW_STACK_SIZE - 1)	// within range?
> -	b.ne	__bad_stack			// no? -> bad stack pointer
> -
> -	/* We were already on the overflow stack. Restore sp/x0 and carry on. */
> -	sub	sp, sp, x0
> -	mrs	x0, sp_el0
> -	b	el\el\ht\()_\regsize\()_\label
> -	.endif
>  .org .Lventry_start\@ + 128	// Did we overflow the ventry slot?
>  	.endm
>  
> @@ -544,22 +515,24 @@ SYM_CODE_END(vectors)
>  
>  SYM_CODE_START_LOCAL(__bad_stack)
>  	/*
> -	 * We detected an overflow in kernel_ventry, which switched to the
> -	 * overflow stack. Stash the exception regs, and head to our overflow
> -	 * handler.
> +	 * We detected an overflow in kernel_ventry.
> +	 * Restore SP and X0.
>  	 */
> +	sub	x0, sp, x0
> +	sub	sp, sp, x0
> +	add	sp, sp, #PT_REGS_SIZE
>  
> -	/* Restore the original x0 value */
> -	mrs	x0, sp_el0
> +	/* Switch to the overflow stack */
> +	msr	spsel, #0
>  
> -	/*
> -	 * Store the original GPRs to the new stack. The orginal SP (minus
> -	 * PT_REGS_SIZE) was stashed in tpidr_el0 by kernel_ventry.
> -	 */
> +	/* Stash the exception regs */
>  	sub	sp, sp, #PT_REGS_SIZE
>  	kernel_entry 1
> -	mrs	x0, tpidr_el0
> -	add	x0, x0, #PT_REGS_SIZE
> +
> +	/* Fix-up the saved SP */
> +	msr	spsel, #1
> +	mov	x0, sp
> +	msr	spsel, #0

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	str	x0, [sp, #S_SP]
>  
>  	/* Stash the regs for handle_bad_stack */

-- 
Best regards,
Jinjie


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55854949F2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048185; cv=none; b=OiTVcvXeFAmls+nQgb9BJxBzaO4kVSGm7/elBPVKMl1B9ix9Of48hkQ4RdTeVrc38MYmFipj8r9niSKXBBwfB/zOMJhKSXB2ztS6E/JbKkU3VMyOZItMRNuXN55TZ40CvdzBy61t3boN3DDXcmRg7HiFoJ2Lt9JiqtMtDf3B7F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048185; c=relaxed/simple;
	bh=iTqT7mryvjsJeX9OToGmlp1uflWsp/yL5jLj0xRAq7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGbAt9+ZZcBSbTklTA/5Yar31Y2rZ4gU21YCCxwtba7xscETv3rm/e2Jw48T4ltw5gomrnrV7ihOH5MIJttwS26xXgnEt222VFv4s7Ej7RSPPBQHPZPJepm4cP90y4LVe7ZSltLySlLSeTsfUqYzRpwHzx2htieUOlXWiKSKfV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=EiZ+k6gY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="EiZ+k6gY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E6E51570;
	Thu, 10 Sep 2026 06:49:37 -0700 (PDT)
Received: from [10.0.152.207] (unknown [10.0.152.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3A0C3F59E;
	Thu, 10 Sep 2026 06:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789048181; bh=iTqT7mryvjsJeX9OToGmlp1uflWsp/yL5jLj0xRAq7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EiZ+k6gYrFFklPfNYclyE+wnL5/q8uJLnVQQBgPyIX1o9MChkCxUS16MHg5HDwdHM
	 jZLorCGbiI5PwTlxRFgAROCPfxrdv0x4tTeYtLmNIzJYXKJhMME1F4dhXl8ZM3n5D3
	 s+roG6zsO7r/Bn9q+EO3sT+hsluhWgY7o7hG1kg0=
Message-ID: <5ecf87dc-30ec-454f-bee3-0c05f2f11168@arm.com>
Date: Thu, 10 Sep 2026 14:49:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/21] arm64: Move overflow sp into SP_EL1 and kernel sp
 into SP_EL0
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164247.17223-1-will@kernel.org>
 <40954731-a235-4877-b615-7a3f66f1b039@arm.com>
 <aqFDFYECDl15R_39@willie-the-truck>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <aqFDFYECDl15R_39@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Will,

On 9/9/26 12:29, Will Deacon wrote:
> Hi Vladimir,
> 
> On Wed, Sep 09, 2026 at 11:39:24AM +0100, Vladimir Murzin wrote:
>> On 9/7/26 17:42, Will Deacon wrote:
>>> This series is a bit of a complicated juggling act that, on its own,
>>> doesn't achieve an awful lot. However, it lays the ground work for
>>> sizing the kernel stack at runtime, e.g. via a cmdline option or even
>>> potentially on a per-task basis and so I would like to work towards
>>> getting it merged independently.
> [...]
> 
>> I gave it a try and I observe splat:
> Thanks for taking it for a spin!
> 
>> Unable to handle kernel execute from non-executable memory at virtual address ffff000970e81148
>> Mem abort info:
>>   ESR = 0x000000008600000f
>>   EC = 0x21: IABT (current EL), IL = 32 bits
>>   SET = 0, FnV = 0
>>   EA = 0, S1PTW = 0
>>   FSC = 0x0f: level 3 permission fault
>> swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000008129f000
>> [ffff000970e81148] pgd=0000000000000000, p4d=18000009f1dff403, pud=18000009f1079403, pmd=18000009f0ef1403, pte=00e80009f0e81707
>> Internal error: Oops: 000000008600000f [#1]  SMP
>> Modules linked in:
>> CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.3.0-rc2-7fb054f87+ #3627 PREEMPT(lazy) 
>> Hardware name: Generated (DT)
>> pstate: 1634023c9 (nZCv DAIF +ALLINT +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
>> pc : 0xffff000970e81148
>> lr : 0xffff000970e81148
>> sp : ffff000970e81150
>> x29: ffff800080f85fc0 x28: 0000000000000001 x27: 0000000000002000
>> x26: 0000000000000000 x25: 00000000000000c0 x24: 0000000040000023
>> x23: ffff800080c0e1d8 x22: 00000000000003c0 x21: ffff800080b58300
>> x20: cfa2800080b58300 x19: 00000000200003c0 x18: 0000000000000000
>> x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000028
>> x14: 0000000000000000 x13: ffff8000814f3ac0 x12: ffff8008efcac000
>> x11: b2000c3eb474d99d x10: 0000000000000008 x9 : 0000000000001000
>> x8 : ffff800080010800 x7 : 055001f2b5503510 x6 : 0000000001310000
>> x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff800081502d80
>> x2 : 0000000000000802 x1 : ffff000800106a70 x0 : 0000000000000001
>> Call trace:
>>  0xffff000970e81148 (P)
>> Code: 00000000 00000000 00000000 00000000 (00000002) 
>> ---[ end trace 0000000000000000 ]---
>> Kernel panic - not syncing: Oops: Fatal exception
>> SMP: stopping secondary CPUs
>> Kernel Offset: disabled
>> CPU features: 0x0,00000000,034bfc7d,ff728b42,7ffce667
>> Memory Limit: none
>> ---[ end Kernel panic - not syncing: Oops: Fatal exception ]---
>>
>> I suspect it is related to power management, since it can be triggered
>> with the sleep command, though I haven't debugged it. I noticed that
>> Sashiko has reported issues related to suspend/resume, so if you
>> provide fixups for the relevant commits, I can give them another
>> try. Otherwise, I'll wait for v2 :)
> It's fiddly to envisage how we end up trying to execute from non-executable
> memory, but there are two bugs in the suspend/resume code:
> 
> 1. I don't save/restore the stack pointers correctly (I suppose this could
>    explain almost any crash, tbh)
> 
> 2. I don't restore the pauth keys properly
> 
> I've hacked up an untested diff below, please can you take it for a spin?
> 

With fixup applied I do not see splat anymore :) 

Thanks
Vladimir

> Cheers,
> 
> Will
> 
> --->8
> 
> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
> index f093cdf71be1..facf3f1cc3b1 100644
> --- a/arch/arm64/kernel/sleep.S
> +++ b/arch/arm64/kernel/sleep.S
> @@ -133,7 +133,8 @@ SYM_FUNC_START(_cpu_resume)
>  	add	x0, x0, #SLEEP_STACK_DATA_SYSTEM_REGS
>  	/* load sp from context */
>  	ldr	x2, [x0, #CPU_CTX_SP]
> -	mov	sp, x2
> +	msr	sp_el0, x2
> +
>  	/*
>  	 * cpu_do_resume expects x0 to contain context address pointer
>  	 */
> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> index 0811fa569100..bec7f858fae9 100644
> --- a/arch/arm64/mm/proc.S
> +++ b/arch/arm64/mm/proc.S
> @@ -87,6 +87,7 @@
>   * This must be kept in sync with struct cpu_suspend_ctx in <asm/suspend.h>.
>   */
>  SYM_FUNC_START(cpu_do_suspend)
> +	msr	spsel, #1
>  	mrs	x2, tpidr_el0
>  	mrs	x3, tpidrro_el0
>  	mrs	x4, contextidr_el1
> @@ -98,8 +99,7 @@ SYM_FUNC_START(cpu_do_suspend)
>  	mrs	x10, oslsr_el1
>  	mrs	x11, sctlr_el1
>  	get_this_cpu_offset x12
> -	msr	spsel, #1
> -	mrs	x13, sp_el0
> +	mov	x13, sp				// SP_EL1
>  	stp	x2, x3, [x0]
>  	stp	x4, x5, [x0, #16]
>  	stp	x6, x7, [x0, #32]
> @@ -115,6 +115,7 @@ alternative_if ARM64_HAS_TCR2
>  	mrs	x2, REG_TCR2_EL1
>  	str	x2, [x0, #104]
>  alternative_else_nop_endif
> +	msr	spsel, #0
>  	ret
>  SYM_FUNC_END(cpu_do_suspend)
>  
> @@ -122,6 +123,8 @@ SYM_FUNC_END(cpu_do_suspend)
>   * cpu_do_resume - restore CPU register context
>   *
>   * x0: Address of context pointer
> + *
> + * Entered with SPSel == 1, returns with SPSel == 0.
>   */
>  SYM_FUNC_START(cpu_do_resume)
>  	ldp	x2, x3, [x0]
> @@ -130,6 +133,10 @@ SYM_FUNC_START(cpu_do_resume)
>  	ldp	x9, x10, [x0, #48]
>  	ldp	x11, x12, [x0, #64]
>  	ldp	x13, x14, [x0, #80]
> +
> +	/* Move 'current' somewhere safe */
> +	mov	x15, x3
> +
>  	/*
>  	 * Restore x18, as it may be used as a platform register, and clear
>  	 * the buffer to minimize the risk of exposure when used for shadow
> @@ -156,8 +163,7 @@ alternative_else_nop_endif
>  
>  	msr	sctlr_el1, x12
>  	set_this_cpu_offset x13
> -	msr	sp_el0, x14
> -	msr	spsel, #0
> +	mov	sp, x14				// SP_EL1
>  
>  	/*
>  	 * Restore oslsr_el1 by writing oslar_el1
> @@ -179,8 +185,9 @@ alternative_if ARM64_HAS_GIC_PRIO_MASKING
>  alternative_else_nop_endif
>  #endif
>  
> -	ptrauth_keys_install_kernel_nosync x14, x1, x2, x3
> +	ptrauth_keys_install_kernel_nosync x15, x1, x2, x3
>  	isb
> +	msr	spsel, #0
>  	ret
>  SYM_FUNC_END(cpu_do_resume)
>  #endif
> 


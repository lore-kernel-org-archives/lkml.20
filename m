Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BFF3F660F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513101; cv=none; b=rv9d3Am1ALYni5FL0+EjS3fYW7Aq1lIFS7dfWWwsseJUYqjA4LnTZeaqbdZt0eY1ZEg0bJVRCyonSLJvhQf9rSY9eICWJfhByJnHSq7pRYzrKbzkGB3cbDD/yamSYH/q7IllW7C8jre++JdUaCwRUthHSF8cTYmHR4UzzkneGgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513101; c=relaxed/simple;
	bh=wXmzkJfAG9AZFegQcaDW3q98Haet3MPsgaJCxlXvTNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndqyMhygZVg9y+eqt4kMHqkvYb7ECshInefdXSkkLpd+HtXP1mUAZdsDLgKtpz2iTRWccwCUJWjYLiJxyPlO6UgCXBTUCHt8U6uvcJlYpafWADhAb20iJjyoiuf//FVPIOpmkvXmXBc69uqu33JLBL48BHSyWL0AKbx4uzCnIyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyTKw19O; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyTKw19O"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848643382fcso822118b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788513099; x=1789117899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpLVtcxeLSgcfCU3L42j1VklWUvMTxW7/92G4rpbZfI=;
        b=RyTKw19OTqM1iY6Usl0HQxweaoGG+z521/q9cAuhE+vhhZxvuflR9wWPLFVnRlBsq7
         bye69fugq7csgLPXNYa1jIAxV96eID3BsU5xovm94AbjodVPicfu277Wehw5YyVSPHiA
         t3WxuMRkViptA2Z+ud/N7UTfRHedIgtLapwECvMqOnIyNLT/gB1qXOuqKDQ+Zs+HH+02
         cEN0nfJ2Q8Fak1HnajZVeFkVlNyErAyQjBjoiyGfAf0MkJ1Rq2cOsgva7d64IntZJZrb
         FRufuVkU2jxYZ97E1YMojtgJSb9KFPZ9hu+/d3CRvQFTYvTO/WRMJtrZ1Jwe68eGgOVS
         VOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513099; x=1789117899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpLVtcxeLSgcfCU3L42j1VklWUvMTxW7/92G4rpbZfI=;
        b=N/OpW7L3DbsoyoieqjXUyn7kAoBiHPedGp9Rd4Mly3TaqkBLVNbBGHqGiZHLo6uSEO
         nxe74q19/RJFAXaGYNWVwZw+Nlc3drHEFAvuGDHk3sZOew3xn23hF55rL4jGfLBvSSYj
         cX42nbcJIhOBh2rZBR/NX59yoos4MgcTk5yFin/fPHZKKKv2zXE6W/fPTGplQVipkkQI
         uZmI8NiXMKMQyoFaXhRsNS/kJ72+MtT1APFRpdbsKTo2X04mf8oOgNNVqwXzpP/sMH+p
         PHHPbjxDAhwO8b3W0zE8S6ypIEFxps3ETm8MN0k1Qx+vHvPcptmbfsUhkxWBPgEGj/OW
         gJfA==
X-Forwarded-Encrypted: i=1; AKwUvBx7KkVQqH3V696MFV9nxNysdUpFUefRfJN4onTjZGpqzhECfLFxI/95yi3IxCy4sGpXxKU+mGpzkt/olKg=@vger.kernel.org
X-Gm-Message-State: AFuF++lIqj05yNh+Gg8Uc/lnLv8B77XygKf00vVkLZ2FDeNkUeqRpZ88
	tkaQPRgZBZKSPNLFOePzeELK/QAh93gMv8V5uWFzIcFqTVhR0NSptYOF
X-Gm-Gg: AYBFou0LH40F0iUgQ2gQnLWPUA02ZEzj+oj9Y1OmTITqkX/TKcmLAvfQXnu9RtEZOAt
	tTUwcTDA7DXgH5thqyaYcF2h5HVOdKKqs7kEHrC+WMacbhxmdsADkRLIL8ESzF6qY8+95CcduS2
	MItx16C/iaBKFSyqQ2eCgkW3Cu9mU1ojw4TeG+o4dBQ9hay0hPIUSSExXB1JKktMSxv4f7x2isN
	BOZ6WupY7ikc148ePPNo/p9nsFPC5BRREBzKiHd9NuJhqC9tnh16CK076hsZ8WQqdB90PoVp/7a
	67ouJdsD6gEjW5xrwsXOFI5SpRC5ZSvuJwdMWBAHdZINsLauA0n5LFbGX14pH0egp/b/l4PXcvx
	MG6cjRbscBNx1AyAa+hDnRsHcugXuRMRrr0KqaJ0esQrj5fLIjjC8BzN2HI+9vbVWobOkKOXZVY
	kr6eESlbmt5Srkf+wd/nVOna9yQh2g8xhsaQFIkPoKk8HGscMLs4KfwK0fE6Ub+0VLVmDQHy9wd
	AJQK4EFEmtK9UqCYDqtyNeyPsodXc839anP9Rb+XVLbi8k=
X-Received: by 2002:a05:6a00:2d0c:b0:857:72ba:ff0d with SMTP id d2e1a72fcca58-8616af5cf97mr6704891b3a.21.1788513099219;
        Fri, 04 Sep 2026 02:11:39 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.52.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153027951sm913106b3a.40.2026.09.04.02.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:11:38 -0700 (PDT)
Date: Fri, 4 Sep 2026 14:41:33 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, sshegde@linux.ibm.com, mchauras@linux.ibm.com, 
	ritesh.list@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH V3] powerpc/entry: Fix irq_soft_mask corruption on
 replayed interrupt exit
Message-ID: <apqLMmLNnhSQZz0g@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260904090858.128563-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904090858.128563-1-mkchauras@gmail.com>

On Fri, Sep 04, 2026 at 02:38:58PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> When __replay_soft_interrupts() replays a pending interrupt (e.g.
> PACA_IRQ_DEC -> timer_interrupt), it calls the handler directly with a
> synthetic pt_regs. The DEFINE_INTERRUPT_HANDLER_ASYNC wrapper around
> each handler calls arch_interrupt_async_exit_prepare() on the way out,
> which calls arch_interrupt_exit_prepare() -> local_irq_disable() ->
> arch_local_irq_disable(), which does:
> 
>     irq_soft_mask_set(IRQS_DISABLED)   /* 0x1 */
> 
> This unconditionally overwrites irq_soft_mask with IRQS_DISABLED (0x1),
> stripping the IRQS_PMI_DISABLED (0x2) bit. The result is that
> irq_soft_mask is 0x1 instead of IRQS_ALL_DISABLED (0x3) when the
> handler returns to __replay_soft_interrupts().
> 
> For a normally-taken interrupt this is harmless: the next interrupt
> always enters through arch_interrupt_enter_prepare() which
> unconditionally sets irq_soft_mask to IRQS_ALL_DISABLED. But during
> replay, next_interrupt() is called directly between replayed handlers
> without going back through arch_interrupt_enter_prepare(), so the
> stripped bit is never restored. next_interrupt() then fires a WARNING:
> 
>     WARNING: arch/powerpc/kernel/irq_64.c:75
>     WARN_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED)
> 
> The warning was observed early in boot on a POWER10 pseries guest
> during kmem_cache_init_late(), where a spinlock release triggers
> interrupt replay that processes a pending timer interrupt.
> 
> Debugger state confirming the bug:
>   Before timer_interrupt(&regs):
>     irq_soft_mask = 0x3 (IRQS_ALL_DISABLED)   correct
>     irq_happened  = 0x41 (HARD_DIS|REPLAYING)  correct
>   After timer_interrupt(&regs) returns:
>     irq_soft_mask = 0x1 (IRQS_DISABLED)        WRONG - PMI bit stripped
>     irq_happened  = 0x41                        unchanged
> 
> The fix is to replace local_irq_disable() with hard_irq_disable().
> 
> hard_irq_disable() is the right primitive here for two reasons:
> 
> 1. On PPC64 (hw_irq.h:301) it calls irq_soft_mask_set_return(IRQS_ALL_DISABLED),
>    setting the soft mask to 0x3 (both IRQS_DISABLED and IRQS_PMI_DISABLED),
>    which preserves the PMI bit and fixes the WARNING. The additional
>    work it does (__hard_irq_disable(), PACA_IRQ_HARD_DIS |=) is
>    redundant but safe since both are already set at this point in the
>    exit path; the trace_hardirqs_off() inside is guarded by
>    if (!arch_irqs_disabled_flags(flags)) so it will not double-fire.
> 
> 2. On PPC32 (hw_irq.h:467) hard_irq_disable() maps to
>    arch_local_irq_disable() -> __hard_irq_disable(), which clears
>    MSR[EE] in hardware. This is exactly correct: PPC32 has no soft-mask
>    PACA mechanism, so the hardware disable is the right way to satisfy
>    irqentry_exit()'s requirement. This also fixes a build error on PPC32
>    where irq_soft_mask_set() is only defined under CONFIG_PPC64:
> 
>        arch/powerpc/include/asm/entry-common.h:273: error: implicit
>        declaration of function 'irq_soft_mask_set'
> 
>    Using hard_irq_disable() requires no #ifdef and is consistent with
>    how the rest of the entry code (e.g. entry-common.h:463) handles the
>    same PPC32/PPC64 split.
> 
> Fixes: 334f3f6d7a16 ("powerpc/entry: Disable interrupts before irqentry_exit")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/6f9bfb0f-b14c-468e-bb9f-c157d120d0dc@linux.ibm.com/
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---
> Change log:
> V2 -> V3:
> 	- Revert to hard_irq_disable
> 	- Removed some dead code
Ignore this line.

Regards,
Mukesh
> V2: https://lore.kernel.org/all/20260820134718.2176411-1-mkchauras@gmail.com
> V1 -> V2:
> 	- Instead of using hard_irq_disable use irq_soft_mask_set
> V1: https://lore.kernel.org/all/20260812152035.1661781-1-mkchauras@gmail.com
>  arch/powerpc/include/asm/entry-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> index 94083516df57..80b07750b531 100644
> --- a/arch/powerpc/include/asm/entry-common.h
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -270,7 +270,7 @@ static inline void arch_interrupt_exit_prepare(struct pt_regs *regs)
>  	}
>  
>  	/* irqentry_exit expects to be called with interrupts disabled */
> -	local_irq_disable();
> +	hard_irq_disable();
>  }
>  
>  static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
> -- 
> 2.55.0
> 

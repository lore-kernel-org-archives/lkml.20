Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CD63F926D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019911; cv=none; b=FlgY57bJrb2l4bkttoAaG4gX7or2NPnZ2QOiMoVN7483VUT2wovmGg7yVHznd3yV+w2bvY7L/4eoskeK9WNbNMAp9Y+yyaP/nm5LU9d1LYbopikXxQyWrvAeLtUay+x0KZpoSdFfsdqozIwsqTI+ixNfpGE6bNOVdyQwGcfC5o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019911; c=relaxed/simple;
	bh=YxfxjIdk7qYu/wnxld2cvZHhefyHUld2qknAHJuBEzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb2My8iqj1U0Dl+zVK3/O6WqRT4zaXG+ZaAURlbi8+rfXZvHzRpz1HjHaPGJCwiNTwmt++//9HA4NsgY0lA12dkRXa8NwFpoUEI+vqz/DcBDEycsdxENRY7oJcXZrXidjOt2RoI22zeebnSNUe+TFcNooT9v5u9mNpWx6q6kUbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFffMx8L; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFffMx8L"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-67375a844dfso131557d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791019908; x=1791624708; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8YAiFdZQfKL2vYUOmLOKntCFlon8PTZjXEJkeu5RQ4=;
        b=jFffMx8LHCIvX8zFSy7IXa8ToeJuFJ1gfA//frm8BMihUkmmJzQLRcXjMm6G2WnG+w
         lXv+C1gmIH5LjFB9cJ+57AsRbwEXfCuOiEMvKi11WwIvudWpt+8lr+GjhEF/z6NqAPxY
         vQ+mx96N67K9R/ASigM6z4QNgkvz9BeGvuVteIBWL6MPCdXLiki0A9H6AAmPMZZroMCV
         PsfraSFXfZ4uY7T0ziI/Aw6rhut+vcWpk4QF3cKYYpO7pTvkl30ewQLpYJdW/VsfvcXs
         qgPSMOUQ6/sDbD18bq9TbCnczb6MzzcviIva83JPXjYWLoWjig82DjRQ3sykqzjr5wa4
         JJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791019908; x=1791624708;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F8YAiFdZQfKL2vYUOmLOKntCFlon8PTZjXEJkeu5RQ4=;
        b=WLLH+TwiMS0IQRKZ+/knF8d/TB5m1ZQtEteE/+EAKf0EY6XPBP+9fY3PKXFErJLUwq
         Da3cQUTpJdyfkAh/WDkWK1u+LKqgziLkGXx8+YUNzeLPf4P/YRX8M4vzbvhEpRM9SFJs
         xlJUad2INHEt74Vb6SFCANkW3uFpFqHFyeHvlzElOVn1ccGu2j0a+EbomGc+hLylOY2f
         n/oX3EfXfBb6iv1eXaZg1+rj4AjBNJ6HbZTPpyEGjBeRABM8V5oOCj0/vU1uX0ujo8QX
         YAP204zoEi8n4JT2D2Ceyh8kxakXsL8fR74Qy0S1xnX2cWap2Zhe/HJEN9SA/9kyIz4p
         HVYw==
X-Forwarded-Encrypted: i=1; AKwUvBwzU4e0gDvyTbMP3NXz3d3bXqxzd7Bvf/1tm0i2uV2IG9Iurflg2X6EOXbvb4bJ79SP0PBK7YhDWs1qnTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsGPUGFiArhA9wikazFin5FZuYF9hxlZCzhKV62CKK2a00xBHe
	O7HvEW9oHtKNl/HZaX/pi4u3mSIWUdAeXjAN+B/Jegp7Tuoyz9+bRnRw
X-Gm-Gg: AYBFou2SbcwUEBzg2LdSX9CdJ4DCqDy8ErY6Heh9t/Qxr2NlvmWV9bH/jD9SCUVt9yK
	kjnLZQ1XnfRH7Rq/dAPZ5+Aw8gGufV5SN/uLTcK8Qyqtp0kxbZ2rJrGC/fv8mNxdDq/zznv7Og1
	XMwlm9P7Nr9sPFJpqLut/Mrfm6Q1k4vf14u08h/rkCWyIw8t/626OjgeoiM/bw8W5P5EFMPsY6G
	Jbkd6cRfV75t8JEmbRvj00SeAyLuWNuGPSXW6AOwYMGqvnPysQK8zF5pTROSO2wGNWIjl2vqQyV
	+lOmITP/cCvUVpoC11PTxzudAHIgJgaLAiQ4NJNAvlYpmWbFwqyfkQHOdAVrhCDA1YzXjWRfclQ
	eLq6BV93CogWW31QBCzfNFOj9ROaSsAIwPrQHua5cFE1GxUE4aG+00JdyMek+nnpn2GdAReftJs
	vMdHzUrpSTLxEUBO65j6OrQ8+dxoBTojOOWYmEIBxTB6UiDn83gc3IwIhr2O5Fm9+jwsb3/9NWC
	Jk+gghtj74h0xqhRWCnLnO/MTFpY2ktbOYnkSWQc2Sz
X-Received: by 2002:a05:690e:1289:b0:677:b861:e946 with SMTP id 956f58d0204a3-677b861fe94mr1812374d50.62.1791019907931;
        Sat, 03 Oct 2026 02:31:47 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1b828sm520694d50.4.2026.10.03.02.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:31:47 -0700 (PDT)
Date: Sat, 3 Oct 2026 15:01:37 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, apw@canonical.com, 
	joe@perches.com, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ritesh.list@gmail.com, mkchauras@linux.ibm.com, 
	ruanjinjie@huawei.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH] powerpc: fix NMI exit ordering: restore soft masks after
 irqentry_nmi_exit()
Message-ID: <asDLVug2VgtCJOue@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260929071600.2963954-1-mkchauras@gmail.com>
 <ar9qRKA1mavDruDR@kunlun.suse.cz>
 <5409ae4d-1d1d-426b-a810-f12ef40bf86b@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5409ae4d-1d1d-426b-a810-f12ef40bf86b@linux.ibm.com>

On Fri, Oct 02, 2026 at 04:26:43PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 10/2/26 1:54 PM, Michal Suchánek wrote:
> > On Tue, Sep 29, 2026 at 12:46:00PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > > When running with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=y and LOCKDEP=y, an
> > > Oops is triggered during NMI exit:
> > > 
> > >    [  202.258332] Oops: Exception in kernel mode, sig: 4 [#1]
> > >    NIP [000000000003e178] 0x3e178
> > >    LR  [c00000000003e174] arch_local_irq_restore+0x2a4/0x328
> > >    TRAP: 0700  MSR: 0000000000081000 <ME>
> > > 
> > > The faulting instruction at NIP is a 'trap' (0fe00000) inside the
> > > rfi_flush_fallback trampoline at a userspace-looking low address, reached
> > > after a bad rfid caused by an incorrect SRR0 value.
> > > 
> > > Root cause
> > > ----------
> > > DEFINE_INTERRUPT_HANDLER_NMI used to call arch_interrupt_nmi_exit_prepare()
> > > *before* irqentry_nmi_exit(), giving this sequence:
> > > 
> > >    arch_interrupt_nmi_enter_prepare()   // saves irq_soft_mask, irq_happened
> > >    irqentry_nmi_enter()                 // __nmi_enter() -> nmi_count++, in_nmi()=true
> > >    ____func(regs)                       // NMI handler body
> > >    arch_interrupt_nmi_exit_prepare()    // RESTORES irq_soft_mask=0 (IRQS_ENABLED)
> > >                                         // RESTORES irq_happened with pending bits
> > >    irqentry_nmi_exit()                  // instrumentation block runs here...
> > >      trace_hardirqs_on_prepare()        //   ...with in_nmi()==true still
> > >      lockdep_hardirqs_on_prepare()      //   ...and irq_soft_mask already restored to 0
> > >        -> arch_local_irq_restore(0)     // mask=0 -> enable path entered
> > >             WARN_ON_ONCE(in_nmi())      // FIRES: __nmi_exit() hasn't run yet
> > >      __nmi_exit()                       // nmi_count-- (too late)
> > > 
> > > arch_interrupt_nmi_exit_prepare() restores irq_soft_mask to whatever
> > > the interrupted thread had (IRQS_ENABLED / 0) and restores irq_happened
> > > with any pending deferred-interrupt bits that were present when the NMI
> > > fired.  This is correct and necessary before rfid back to the interrupted
> > > context, but it must not happen until irqentry_nmi_exit() has fully
> > > completed.
> > > 
> > > With irq_soft_mask=0 and pending bits in irq_happened, the
> > > trace_hardirqs_on_prepare() call inside irqentry_nmi_exit()'s
> > > instrumentation block reaches lockdep_hardirqs_on_prepare() which
> > > calls __trace_hardirqs_on_caller(), which eventually calls
> > > arch_local_irq_restore(0) (the IRQS_ENABLED / enable path).
> > > 
> > > arch_local_irq_restore() with mask=0 hits the CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
> > > guards at irq_64.c:217:
> > > 
> > >    WARN_ON_ONCE(in_nmi());   // TRUE: __nmi_exit() not yet called
> > > 
> > > The WARN_ON_ONCE fires a 'trap' instruction (tw 31,0,0 / 0fe00000) in
> > > kernel mode with MSR_PR=0, MSR_IR=0 (real-mode).  The program check
> > > handler (TRAP 0700) takes the sig:4 (SIGILL) path via do_program_check()
> > > and calls die(), producing the Oops.
> > > 
> > > The RESTART_TABLE mechanism in arch_local_irq_restore then causes the
> > > bad rfid that lands at the userspace-looking address visible in the NIP.
> > > 
> > > The bug is invisible with LOCKDEP=n because trace_hardirqs_on_prepare()
> > > is a no-op when CONFIG_TRACE_IRQFLAGS is not set (TRACE_IRQFLAGS is
> > > selected by PROVE_LOCKING which selects LOCKDEP).
> > > 
> > > Fix
> > > ---
> > 
> > Hello,
> > 
> > please avoid excessive formatting in commit messages.
> > 
> > When git am is used to apply this patch it strips everything after this
> > line
> 
> Yes. Good catch. Please run ./scripts/checkpatch.pl --strict always.
> 
> I am seeing this pattern quite often these days.
> Maybe it is worth updating checkpatch.pl to catch such things.
> 
> ERROR: Invalid commit separator - some tools may have problems applying this
> #18:
> ----------
> It flags this one, but if i remove that line it doesn't flag subsequent the --- tag.
> 
> What I would want checkpatch to see if there are multiple --- in the commit message,
> Flag it and show it as error.
> 
> +cc Andy, Joe. Do you think that's good to fix it?
> 
Hey Michal and Shrikanth,

Thanks, i'll fix this and send out a new vesion.

Regards,
Mukesh
> > 
> > > Move arch_interrupt_nmi_exit_prepare() to after the irqentry_nmi_exit()
> > > block, so that:
> > > 
> > >    irqentry_nmi_exit()                 // __nmi_exit() -> nmi_count--, in_nmi()=false
> > >    arch_interrupt_nmi_exit_prepare()   // now safe to restore soft mask state
> > > 
> > > The instrumentation inside irqentry_nmi_exit() now executes while
> > > in_nmi() is still true (nmi_count not yet decremented), but
> > > irq_soft_mask is still IRQS_ALL_DISABLED (NMI-entry value), so
> > > arch_local_irq_restore() is never called with mask=0 from that path.
> > > After __nmi_exit() returns, arch_interrupt_nmi_exit_prepare() restores
> > > the pre-NMI soft mask and irq_happened, which is the correct state for
> > > the rfid back to the interrupted context.
> > > 
> > > Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > > Closes: https://lore.kernel.org/all/d4cccba9-ce5c-424b-864c-2248fb0d99e6@linux.ibm.com/
> > > Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
> > > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > > ---
> > 
> > because it's the same as this line that marks the end of the commit
> > message.
> > 
> > Thanks
> > 
> > Michal
> > 
> > >   arch/powerpc/include/asm/interrupt.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> > > index 1b45a49e9bed..56f855c6f07e 100644
> > > --- a/arch/powerpc/include/asm/interrupt.h
> > > +++ b/arch/powerpc/include/asm/interrupt.h
> > > @@ -301,7 +301,6 @@ interrupt_handler long func(struct pt_regs *regs)			\
> > >   		state = irqentry_nmi_enter(regs);			\
> > >   	}								\
> > >   	ret = ____##func (regs);					\
> > > -	arch_interrupt_nmi_exit_prepare(regs, &nmi_state);		\
> > >   	if (mfmsr() & MSR_DR) {						\
> > >   		/* nmi_exit if relocations are on */			\
> > >   		irqentry_nmi_exit(regs, state);				\
> > > @@ -317,6 +316,7 @@ interrupt_handler long func(struct pt_regs *regs)			\
> > >   	} else {							\
> > >   		irqentry_nmi_exit(regs, state);				\
> > >   	}								\
> > > +	arch_interrupt_nmi_exit_prepare(regs, &nmi_state);		\
> > >   									\
> > >   	return ret;							\
> > >   }									\
> > > -- 
> > > 2.55.0
> > > 
> > > 
> 

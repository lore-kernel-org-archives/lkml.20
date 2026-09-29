Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22BA376A07
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666172; cv=none; b=RxPN+U/jjzORUuBbSwi83rtp8rfhx1QcXQGl4amAhY2D9L5vcCYiW/G8s9uD6GLyRnHUyovggl3Dg12/4hJ27+PU7vNaxJXG59z61+hryU1Um1RDgVtxMi6tAeAMUQW2FqqY/t9OHCJzTZ91TR3AeBfmWLAooYioOBXGI/kb2kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666172; c=relaxed/simple;
	bh=6jwGK/RpDDVIi9XxA9dCge2nNTpeuKH0rCMjPJqRD/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aSzqaSlBqYD7QEituYQxfnaNnrSvBWdI2aaS38+516vrpIb71FnQZ3RNj1bQMFW+gMoQv39u2z3/k5yUV5vw1keuOMBG0AqAyJBZvZDsSe919TOlmbMmgeAl0wSOmwICj5WI44SEvMTOjEZWIMD0JXH8x2fZCQKFFO3NC2KHP+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bscL93fb; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bscL93fb"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd046b87so2769960c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666170; x=1791270970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tV37dXjm0XTJJYPlLCuDvkniyGjzFz1oUiZO7WcjuN4=;
        b=bscL93fbGvFmEAMCi8aNEYLkJYj4A/tyYrozgrOvZnrRjeJ/Rg9VvQ7waY6z2lnQj0
         58Ll8FM8snDOqa0EVvYpfI52z31JdQNA15Dl4xQqZCcmBU4TKna9Zxzu4mgyghnXHDnj
         QXCLr8f7Fg+IF0pwjy2OOlgl5D7AUlkMV9RvDUMldrUq8/E5Vz1iziY5owYmATRIT9Mf
         WHpRr9ulWzLDTFcDdXZNrkmoFwNunJCng5tkGLvXNZM0GZyAWsFAMWeUdCOopeAmylWr
         M0AStjZ/izEf/Pi0wX4/19sokpJk1IkOhCCqC+thW/t/QkCqeQllsJFGm7dXT4SBGrXb
         zSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666170; x=1791270970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tV37dXjm0XTJJYPlLCuDvkniyGjzFz1oUiZO7WcjuN4=;
        b=Bq9gO5KLJOTNYcfTeWL2CPLKcIQqGkDLUxYq5hIMYOfvzuV4SlrY7GnOiOKULtkvcB
         GwJKM/fpEa/a16GxsM0OAsvBOkpuh8wipc7dpGv/wVqZEk1O+nNJJyNkCKAuJK1c5yfJ
         s/+9Sb/U+tNvLgvZvizWhgSv8rmZhiRDGqF57GXo2dkQ0X/wl2Zfa26tWIwYyOCnf8Ll
         DLwgzZyAzw2++WbhH95/cywXYZj2+nl7SrSsFJa1eje6JEaB8oSvb8+mvAHmrmbcjHX7
         DKV6/APNhUaFnGcRmgciBohsMUOr2aEVanMHzgsEEJ5QDLu93cFXsDdVlJ8CSqNaUvx8
         ggHA==
X-Forwarded-Encrypted: i=1; AKwUvBwat30zbeJCGujv8uD0X4DEczH5qqM0uRhGfStUQiru1ZAqDTBn/vd5R8Pov/L7EyTo1CkFD2lOP9RUh/w=@vger.kernel.org
X-Gm-Message-State: AFuF++kA1YvED5Z7PYZSkeWLgpc0/Sv2sjk+kKY5uyLCeQ+vGwlokeOw
	admyAU5Z7JOOLYwLmFR8S9Cx3fZzjXALUqgImm8O0gDO8gY+7s1Dy/sDcVRjm/+h
X-Gm-Gg: AYBFou0HNt3VL165GzrGasliyiOrGD++uN3lli7MeLOzdFvq48aJ0KBRKt2UkGkk4pg
	Y8DiTviwZNOm9Y1R6DpJeWfn1uIeZda84RbFINNGSuEcUzvPu/J+QQTBqtDI3+3BCxO8TY5RqGO
	A/uHGfEM5nw0Rv1kE312hHppdx8IoddmCtd1KDBk/tJ0V8fIm9rqqjT2PWaX8oOTEqyJKnRoinS
	ygaTowM1cRaWlIPXBAvJsRYyvTh8L879dXz3EDHmHFj2eYwK+T0mLpWKnCQjHER+xBLpBbSSWZD
	hlJAp4irBYtVKCaCrL9YqcEmn+NEEMh0cD84HkEU2IZJdY7ds81yrCKFMio/LofuQFlA675pfKH
	qGDNVRwhSBdzGC8FshDzOiDatCyCddHJGAuBmLa8a8Uc135f2u8H4UhLJzuUZ4ic5eE3gwGrkuO
	y7cufF+fxCxRVb7BJdymXGxepIV5K2L6mI1ob/Z5XusFoJqKDlWJhc62JcKtJLxTDOZxdRoz1x+
	nBKcmLIR1zA57DxyA25tVX55gMLnTca8cNMenwTEP/IoQ4ZBz7xRizypmta
X-Received: by 2002:a05:701b:2511:b0:14a:c6cf:1449 with SMTP id a92af1059eb24-14ac6cf14e6mr3420039c88.32.1790666169513;
        Tue, 29 Sep 2026 00:16:09 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-147913a776fsm27867713c88.17.2026.09.29.00.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:16:09 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	mkchauras@linux.ibm.com,
	mkchauras@gmail.com,
	ruanjinjie@huawei.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH] powerpc: fix NMI exit ordering: restore soft masks after irqentry_nmi_exit()
Date: Tue, 29 Sep 2026 12:46:00 +0530
Message-ID: <20260929071600.2963954-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=y and LOCKDEP=y, an
Oops is triggered during NMI exit:

  [  202.258332] Oops: Exception in kernel mode, sig: 4 [#1]
  NIP [000000000003e178] 0x3e178
  LR  [c00000000003e174] arch_local_irq_restore+0x2a4/0x328
  TRAP: 0700  MSR: 0000000000081000 <ME>

The faulting instruction at NIP is a 'trap' (0fe00000) inside the
rfi_flush_fallback trampoline at a userspace-looking low address, reached
after a bad rfid caused by an incorrect SRR0 value.

Root cause
----------
DEFINE_INTERRUPT_HANDLER_NMI used to call arch_interrupt_nmi_exit_prepare()
*before* irqentry_nmi_exit(), giving this sequence:

  arch_interrupt_nmi_enter_prepare()   // saves irq_soft_mask, irq_happened
  irqentry_nmi_enter()                 // __nmi_enter() -> nmi_count++, in_nmi()=true
  ____func(regs)                       // NMI handler body
  arch_interrupt_nmi_exit_prepare()    // RESTORES irq_soft_mask=0 (IRQS_ENABLED)
                                       // RESTORES irq_happened with pending bits
  irqentry_nmi_exit()                  // instrumentation block runs here...
    trace_hardirqs_on_prepare()        //   ...with in_nmi()==true still
    lockdep_hardirqs_on_prepare()      //   ...and irq_soft_mask already restored to 0
      -> arch_local_irq_restore(0)     // mask=0 -> enable path entered
           WARN_ON_ONCE(in_nmi())      // FIRES: __nmi_exit() hasn't run yet
    __nmi_exit()                       // nmi_count-- (too late)

arch_interrupt_nmi_exit_prepare() restores irq_soft_mask to whatever
the interrupted thread had (IRQS_ENABLED / 0) and restores irq_happened
with any pending deferred-interrupt bits that were present when the NMI
fired.  This is correct and necessary before rfid back to the interrupted
context, but it must not happen until irqentry_nmi_exit() has fully
completed.

With irq_soft_mask=0 and pending bits in irq_happened, the
trace_hardirqs_on_prepare() call inside irqentry_nmi_exit()'s
instrumentation block reaches lockdep_hardirqs_on_prepare() which
calls __trace_hardirqs_on_caller(), which eventually calls
arch_local_irq_restore(0) (the IRQS_ENABLED / enable path).

arch_local_irq_restore() with mask=0 hits the CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
guards at irq_64.c:217:

  WARN_ON_ONCE(in_nmi());   // TRUE: __nmi_exit() not yet called

The WARN_ON_ONCE fires a 'trap' instruction (tw 31,0,0 / 0fe00000) in
kernel mode with MSR_PR=0, MSR_IR=0 (real-mode).  The program check
handler (TRAP 0700) takes the sig:4 (SIGILL) path via do_program_check()
and calls die(), producing the Oops.

The RESTART_TABLE mechanism in arch_local_irq_restore then causes the
bad rfid that lands at the userspace-looking address visible in the NIP.

The bug is invisible with LOCKDEP=n because trace_hardirqs_on_prepare()
is a no-op when CONFIG_TRACE_IRQFLAGS is not set (TRACE_IRQFLAGS is
selected by PROVE_LOCKING which selects LOCKDEP).

Fix
---
Move arch_interrupt_nmi_exit_prepare() to after the irqentry_nmi_exit()
block, so that:

  irqentry_nmi_exit()                 // __nmi_exit() -> nmi_count--, in_nmi()=false
  arch_interrupt_nmi_exit_prepare()   // now safe to restore soft mask state

The instrumentation inside irqentry_nmi_exit() now executes while
in_nmi() is still true (nmi_count not yet decremented), but
irq_soft_mask is still IRQS_ALL_DISABLED (NMI-entry value), so
arch_local_irq_restore() is never called with mask=0 from that path.
After __nmi_exit() returns, arch_interrupt_nmi_exit_prepare() restores
the pre-NMI soft mask and irq_happened, which is the correct state for
the rfid back to the interrupted context.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/all/d4cccba9-ce5c-424b-864c-2248fb0d99e6@linux.ibm.com/
Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 1b45a49e9bed..56f855c6f07e 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -301,7 +301,6 @@ interrupt_handler long func(struct pt_regs *regs)			\
 		state = irqentry_nmi_enter(regs);			\
 	}								\
 	ret = ____##func (regs);					\
-	arch_interrupt_nmi_exit_prepare(regs, &nmi_state);		\
 	if (mfmsr() & MSR_DR) {						\
 		/* nmi_exit if relocations are on */			\
 		irqentry_nmi_exit(regs, state);				\
@@ -317,6 +316,7 @@ interrupt_handler long func(struct pt_regs *regs)			\
 	} else {							\
 		irqentry_nmi_exit(regs, state);				\
 	}								\
+	arch_interrupt_nmi_exit_prepare(regs, &nmi_state);		\
 									\
 	return ret;							\
 }									\
-- 
2.55.0


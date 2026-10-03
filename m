Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BA63A9DB2
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020722; cv=none; b=AkTavuXF1+c9EQIRl4IFTy/uiJSv2e8tdCmN2wt+VxcVJ9QU1KEMcYMJzzmUYRcUPnlEQRSUNCXiKVIHqFhxgkjpszHe1Rr80DADZAiFPQasSHwKzK+d847s/OWYBaDSAq4N3vHOFDW43qEG6qINtj0BHM8FFvEFKufQp5k0QSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020722; c=relaxed/simple;
	bh=s33dYOw3cK4Xe7CzapHfSTG+HpAybbtLEAGiFrub/rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qNytfjMK2YZzklyPo8jSO5B3LgPq9QX+d9/diKkaAT4LqOWvmqZ6W1NXcPcLATAoKGZr5uP2Ih+1yvb2LVT8xQhflEubyOKyDXHfjo9semZeAmuUvWPY6gDOgOdykXxrXOLIiV1I8g9RjKc0uMIEHtJt+umq0WNW/gyQcBAB2nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKaYZ+LE; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKaYZ+LE"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-35118a5991dso96197eec.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791020720; x=1791625520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6wW0Un3ym1Iv5CZgyMVb1WOGO/BQAZRmqh+pgtAtyU=;
        b=RKaYZ+LEc1eNrTMefqSaFZ6pjvEQ5vd5rq5YWnmPQQNvH0n6j/NYF1xx/Y7hMFxQdR
         Nef3Y5M7e3m8h3kquW0ucIvdrOINDU6Na0wgm/f8mtZrKtg79wFzq1AhyYsLxmn4H+Hy
         krFAEvaA6h2+EDn+I6U9ICcFuh+ws6IEOIL0RqpWq7oyWlhqqeMdI1N1CaIu6FvRd4R2
         LI2bb53aM3eAs5WOuFa8B6PFNgHCjNSGindM2DLFwZ3cuQHTQ8DnR2To/SpAzs4LxykH
         XpEKonBJXspc7XyevCuftQmUiHZCb2REBd2LUM2GEzP4BI2KAtapQZqMCvaiSRu9lR56
         Wffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791020720; x=1791625520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6wW0Un3ym1Iv5CZgyMVb1WOGO/BQAZRmqh+pgtAtyU=;
        b=IwRlecHb64VraDKs1GWS28tDAnx5Gbhy1twuarOX7Pj4iIpz2/UgKPr1O/TWk7Xv3u
         sPfn2e4zHo2k5SyRLoF1W0jFSl+uEm6/KZuN2O49Qzp+F7putUyCZ1QfnD95hgK6Q+CP
         iiCylZRCpX0fXqp4dWjhH7f+pxrfrRAnWUzL/Hm+N39tspNdPLLIpLQHThOG0O60MrV5
         Zl3OsWd4du+9LeQahgM4nULRZWS3Hd6CQaZqMMxN/GesNpTslllBaHyKQO8ENrNZwagU
         3oYWpnqFIFG7RnINyCEGzuSFXqU+TYb3IdD7C3pDiVlFzb6wtKl2HtUMCV8LHW2uRd06
         Bs2g==
X-Forwarded-Encrypted: i=1; AKwUvBwaY8uPYIhnmVW1T2RJ+yD2WXwB0LLtKaQNUq5UdoOcaGSpwtxILD42f9KMUiLXKZno1tfho3z6aHE19Oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/Y5tb3mTAIxtKV5ts57gt10stUaIlw2eOJ+2YtwoiaBEM6Tjx
	aqPDAZiXbMr93hop04CndwPtA2iUy9T0q7UGtwMtltFOhVRf1ZWgpbfx
X-Gm-Gg: AYBFou34M+N3WkyXO3W74v9vL9mBvohCuy/qdjHMmeLjDo4S6numonC7S/1NVUYmljT
	Gv9YcFc7Tf1BrF/ScGcVwL26ACsMio4LJmuCEkDWo7gihPIs1S0kyxrkKwVYONdWL57iQ5curwX
	ugk12l3HZdMeE/Tkbn7ImLVPQvPycufELJVomQdOh69bbkNE7D9paz2c7Hut1KnSTGIwpBC1SoE
	8BjsyJJiEk6MKWU7Vl21cEJpYcZUENAOVy/rM/udeYwY1r7BM1JcTqam3Zp5efXuJagdg3v2Gg8
	qeY0Vqs+XfbDk/BZN5Y6kGNh0MS0pEKgvMYbpRYnImlLav5iMZ4MnPyhT+4n6ixHEsnI62Ix3u7
	WQ3qqeVVLCoCuhBi/3wFvGCjtIUMeUP1bJMqOfuRteBkj0WI4QTNf8bdiht/NgfbBkOWXtR4G+m
	wu7VMkW5tb0VxwRiLqm0aIR8GOr7jfiSTf+aIU+03Cl+08IaRlIS5fI8HhfT3XNkvMjfy9sLtdr
	DNL3m9TUt77b7+q64F/iqCGA9wbuLJJr2Bswa7yzQMK+1v5vQ==
X-Received: by 2002:a05:7301:782:b0:351:1e72:735d with SMTP id 5a478bee46e88-3511e7277b6mr17179eec.19.1791020719529;
        Sat, 03 Oct 2026 02:45:19 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34ef98d925csm14055363eec.0.2026.10.03.02.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:45:19 -0700 (PDT)
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
Subject: [PATCH V2] powerpc: fix NMI exit ordering: restore soft masks after irqentry_nmi_exit()
Date: Sat,  3 Oct 2026 15:15:09 +0530
Message-ID: <20261003094509.3408190-1-mkchauras@gmail.com>
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

Root cause:
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

Fix:
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

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
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


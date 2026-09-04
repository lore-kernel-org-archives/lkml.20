Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE83FA5FC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512953; cv=none; b=QptGIYZ4Wvqbg64Oa9mmB6uVmSfaK7QUirq0TsRquwQtYRe2dPAtDbs/RXeP8eNbECGlKTA4BN5Gniv+Za6FIZeoBwUqmoROct1fkxhgd/4rg23IFUKDsYYx0jHjaWib0XRtgCJBkDZqQE2GiFNI3pOZjFpwzoAXatyXr40gZ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512953; c=relaxed/simple;
	bh=P5pxLz5KPUDW6oeFfkn57sEIwgkxpnTAYm5AJJvcV3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rR2lVaWDAXsJe5sloUW2d2KQu0n7vecEMuVyyB43Vh3YWUuxEDYK909o2UT4yDolmAIhVxUxRWEFwDJUQWkOqHAajk8KiYsCXSvI6ngGlj0FpTs13Qfr5w73P8RNn9VKNEufXqrdPxqmLce8IPHmUXjMCppvc/EbhkbzRpooB0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkN3jJQ1; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkN3jJQ1"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2db18e5cb56so4267265ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788512949; x=1789117749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jeSwwPU8HH7uQiH/u+hsVibbM0HgI3yvXFGeul75aVU=;
        b=TkN3jJQ1/HV3stq00KdYE2nhky/mwhFQNt6Daw2ohK5zFFcESNUc5irdZuqdUHx+aQ
         2/SMfsJUM8SRzHDAHkJzWs/NDsgkrZVD0y/AS/SJzwjHUM7daAUTlkGdokvVyE+igtZv
         J++P7WyCpNvTtGUnyxiGzA1qwN2uWb17k56iaNxdmOZMvteLG31RJ3s0wPpylu8YV47e
         TZwCs2HRSmZQgtBBS1oNsrbSyhRy0xvHZD35zzXhrHtG8r/3BzSeCaQTP5eNZxceSUwP
         1l78NnBND0VNvn8af9sf9wVovTUV5N39sOkA+qdxgV8iO7hzHZ3I3oOv6LLVXb6guB3d
         YoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512949; x=1789117749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeSwwPU8HH7uQiH/u+hsVibbM0HgI3yvXFGeul75aVU=;
        b=Dbj3Rt+yWcTATg3FTh3LtvCz4XbjLZ/xwPnvdmus767/OWNNXa0cL/+Ev2L6EOQbUq
         nlvuimfr2AUfL63Ndew+0g3kfkFeFsyAD8/AhlXS8abFUr8lCqtMra+v6a0+gh6Kmd94
         38pgjHT4s28nQgf0T67RVPSaz9oNHaaWM6HVRNjyjI82jIR/f1A64QPMASCdLy8Yl6jd
         SoSD+jiIYz1ow5hBQh3sjbowgrSJFwhZj6h3Se2FJt2Dke7j6P5OsTMIk+a5zHdSJjJV
         xzKpQYJxmUoHGBg1KQ1xwteaNiVFu3zRXIFVTrS013QD/gNEE8ioqL0ZkgELcVviT8J3
         9TAA==
X-Forwarded-Encrypted: i=1; AKwUvBw/SarDfpYivXtA2leBPJaflHML/g4HbVaA932W1F/pNUZAWQpHZiXZP9/O8A0xU01ivtyl+Xzbx8MuY8c=@vger.kernel.org
X-Gm-Message-State: AFuF++mDO22aLuidpEDZNeordzBmQYv97Q3+jXV2P3NBomh7ifrPZw2u
	ySFOSiK0h3Dn7xkmctGB23hNOnq7dNoukpgIuVJ//1QycTnBXzf+hJcm
X-Gm-Gg: AYBFou03oqrOiQmd2bxQ8QNmVDVWYcJCdHCnnOONDmFcdAHmoYXmkCdHhO1v1sZnkvo
	TGQKCmtBFBN4b9Fs14hWSrXkyG4lx7ySq11bjbSXzCVOE/KTJWyGhyZTJ8xT+E60/XhpE+JgCqt
	w6OEip6AF7n7HtqDtOGsjxic8OfTzmA2eiiyesVUIarqJnTtM5Y9hqUc2l/gJ1x34jsnXspJeMw
	NRnTvDc3MNabGn2IFRbztgcmSk/eYgHyPYTsTSxL3y7o1pI9zQ4fG1oHJKeX+9CcGYrpd1XMQ/s
	p0HcCN9W88DgsbKmJ9xAaTjLayYJ/YzA2DO1yTkGqqpQQrCMN94GwV9IPVIYeFWHX9FnLRx4x29
	1GIEupk1P+E2YpLlGleiJKA7s0yyaTmIK6aK/kaBSq5e+PMAZJ52XsuJehrWyY9UzHJOyShUlr7
	4Ffk+E81u1kUsh0oTex/MMgvt3QWkNmzFbCQaJtd3HKSgCCdWZcJUNX6xoq1DEx1noNH+4TZynW
	nMAaAi2YF2/+eoP3K8I3RjsM3hm2VPHm+zx
X-Received: by 2002:a17:902:d492:b0:2d9:68b7:c324 with SMTP id d9443c01a7336-2db125cce1bmr63911345ad.3.1788512948933;
        Fri, 04 Sep 2026 02:09:08 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.52.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db18a1eb47sm5254225ad.48.2026.09.04.02.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:09:08 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	sshegde@linux.ibm.com,
	mkchauras@gmail.com,
	mchauras@linux.ibm.com,
	ritesh.list@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V3] powerpc/entry: Fix irq_soft_mask corruption on replayed interrupt exit
Date: Fri,  4 Sep 2026 14:38:58 +0530
Message-ID: <20260904090858.128563-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When __replay_soft_interrupts() replays a pending interrupt (e.g.
PACA_IRQ_DEC -> timer_interrupt), it calls the handler directly with a
synthetic pt_regs. The DEFINE_INTERRUPT_HANDLER_ASYNC wrapper around
each handler calls arch_interrupt_async_exit_prepare() on the way out,
which calls arch_interrupt_exit_prepare() -> local_irq_disable() ->
arch_local_irq_disable(), which does:

    irq_soft_mask_set(IRQS_DISABLED)   /* 0x1 */

This unconditionally overwrites irq_soft_mask with IRQS_DISABLED (0x1),
stripping the IRQS_PMI_DISABLED (0x2) bit. The result is that
irq_soft_mask is 0x1 instead of IRQS_ALL_DISABLED (0x3) when the
handler returns to __replay_soft_interrupts().

For a normally-taken interrupt this is harmless: the next interrupt
always enters through arch_interrupt_enter_prepare() which
unconditionally sets irq_soft_mask to IRQS_ALL_DISABLED. But during
replay, next_interrupt() is called directly between replayed handlers
without going back through arch_interrupt_enter_prepare(), so the
stripped bit is never restored. next_interrupt() then fires a WARNING:

    WARNING: arch/powerpc/kernel/irq_64.c:75
    WARN_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED)

The warning was observed early in boot on a POWER10 pseries guest
during kmem_cache_init_late(), where a spinlock release triggers
interrupt replay that processes a pending timer interrupt.

Debugger state confirming the bug:
  Before timer_interrupt(&regs):
    irq_soft_mask = 0x3 (IRQS_ALL_DISABLED)   correct
    irq_happened  = 0x41 (HARD_DIS|REPLAYING)  correct
  After timer_interrupt(&regs) returns:
    irq_soft_mask = 0x1 (IRQS_DISABLED)        WRONG - PMI bit stripped
    irq_happened  = 0x41                        unchanged

The fix is to replace local_irq_disable() with hard_irq_disable().

hard_irq_disable() is the right primitive here for two reasons:

1. On PPC64 (hw_irq.h:301) it calls irq_soft_mask_set_return(IRQS_ALL_DISABLED),
   setting the soft mask to 0x3 (both IRQS_DISABLED and IRQS_PMI_DISABLED),
   which preserves the PMI bit and fixes the WARNING. The additional
   work it does (__hard_irq_disable(), PACA_IRQ_HARD_DIS |=) is
   redundant but safe since both are already set at this point in the
   exit path; the trace_hardirqs_off() inside is guarded by
   if (!arch_irqs_disabled_flags(flags)) so it will not double-fire.

2. On PPC32 (hw_irq.h:467) hard_irq_disable() maps to
   arch_local_irq_disable() -> __hard_irq_disable(), which clears
   MSR[EE] in hardware. This is exactly correct: PPC32 has no soft-mask
   PACA mechanism, so the hardware disable is the right way to satisfy
   irqentry_exit()'s requirement. This also fixes a build error on PPC32
   where irq_soft_mask_set() is only defined under CONFIG_PPC64:

       arch/powerpc/include/asm/entry-common.h:273: error: implicit
       declaration of function 'irq_soft_mask_set'

   Using hard_irq_disable() requires no #ifdef and is consistent with
   how the rest of the entry code (e.g. entry-common.h:463) handles the
   same PPC32/PPC64 split.

Fixes: 334f3f6d7a16 ("powerpc/entry: Disable interrupts before irqentry_exit")
Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/all/6f9bfb0f-b14c-468e-bb9f-c157d120d0dc@linux.ibm.com/
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
Change log:
V2 -> V3:
	- Revert to hard_irq_disable
	- Removed some dead code
V2: https://lore.kernel.org/all/20260820134718.2176411-1-mkchauras@gmail.com
V1 -> V2:
	- Instead of using hard_irq_disable use irq_soft_mask_set
V1: https://lore.kernel.org/all/20260812152035.1661781-1-mkchauras@gmail.com
 arch/powerpc/include/asm/entry-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index 94083516df57..80b07750b531 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -270,7 +270,7 @@ static inline void arch_interrupt_exit_prepare(struct pt_regs *regs)
 	}
 
 	/* irqentry_exit expects to be called with interrupts disabled */
-	local_irq_disable();
+	hard_irq_disable();
 }
 
 static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
-- 
2.55.0


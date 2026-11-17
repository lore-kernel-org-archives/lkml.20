Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925539;
	b=PR2gXONdBjnRF+eLcxl8vGRk5zXQ7w3c3lt9WksVyzcWSjDAKW4yCLdiGb0OG3Avc4QT
	 yk1vH06Qje6pFSqFWQWM111Tu7HOdw9Qyoh4GOndJMhtOWOsb486anlLtGoezZRhkY5Xp
	 TVmAUlehNUS+GnN++/jL0TVrjbkEUJXAAwXJCb0nc4NhBnlD2YY9qBtKoFwbRYvgVWakq
	 POZgkhk9OW5vSp6/VNX10lWqAQ/C4o6DKEvVLqIm3YBV+EJj7XF4zMBjaefzYEFWcchER
	 mDoxaA4XpkP20tNxl3rLIvBZMxXw5dNicW86w5PB3LcZkf6hE9yuwJ3L3fw23DTg5qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cJ9sO9k+T8zaWbNVfOgYQ/LgwKnb8ilExNHXvYhGb+8=;
	b=jcNndw6QrFwXcB/PYI0pXQj+t78EdPwmi2VRYKCTnFtcrc70mexM/Ld2im8jOBG+cDol
	 SiPdsWNwmIt8fGwht0mOtu0YIXj5vBsup6jjNifSunsAVvsUf7BxfSBMMRzrZ25HaUlne
	 bQNQKHTZ0r6r8MzDXHa1p7N4RuPyDJ7NUofLyTxxg7rs4LNp5/xo46VPzWC3HpImTvQYT
	 0dwR7RpBeo+YmZ+TFC6XczC9rVRyDMP0Y+saXrzcF60XmtrJteyuFl4wjuLLGccYhsZCi
	 TZpcnVGa531dpq4M/aKUlShnyhldkYH9acoHErHn+sfdLQOg1FV1Z2jcMNE63xyO+zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvU8PZwo;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709F3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvU8PZwo
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6df5e315bd1so4656853eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925538; x=1795530338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJ9sO9k+T8zaWbNVfOgYQ/LgwKnb8ilExNHXvYhGb+8=;
        b=fvU8PZwoJzgDdPJaufAshrKUP/8OeTfvlCP/aUkIJVTlTuE/ZnAIImHBFNHPfadx1O
         uXiWdZPfCpMxiGeV+m/r7QhkJZIy4qWvpHlMZF0yHePZ9JXtUwojLDzmBI05aDfn4XsT
         ppFbU0s381l1jt+a/6WIjT1bnkcziypFdr0PjCiw+yKr1lavKUwr6QVHj3f4Gd6F5XEK
         Lv4QssdNML1FJtXIZv/d/S1nOis80tU9y0G/IsSBCDT1t6/JHAZGjEFy76O2RMAITz9+
         PY6KmZTqseG1OEAtRt2fC8TADoyUpWhKRAU7kwBOtJpWdlCpHS2IWsMrF+nxJdgC7lRe
         W7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925538; x=1795530338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJ9sO9k+T8zaWbNVfOgYQ/LgwKnb8ilExNHXvYhGb+8=;
        b=UzI4E0r8OE97GbZvFoIUnTdrSvl5pGdjqHSHugFMn0MBN9hD+no68j2BTJ6hO/A/Ag
         p/dVpJLOBJBbXnUXSLuZnFqPNp/sJuxgber9KVAw8DVUBnjFCn8jDigoMCkNh+vGZOgp
         254u4YrwgjQ2vCST+AVJwhIFHxvN04acsbMFOWHfLyKkSticx99gfQvrwPhhJopU3HNT
         FUZNpo8uxa+Oe8spuFLEqFvWFWK8Ymituu1RVehdcS6Wzp9SFfopRcYsrCvz0mRPIBwC
         Y25gYXClYpFaQz7l+OD0NihgGeoL7qANAohc5wV4/mjpNTaWVoHMR1urbjp67CFHmjRg
         5Obg==
X-Forwarded-Encrypted: i=1; AL+hErEPWqlxGs8xgxOodvjTFFX1S8hg7PnxY87zzgbvtn+SP1Sq06H3KVHlxo3NLRwVWsvcceQJLJ1eRrM1aBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l3RStdPSyw71wx8UGu5Q5fkPw4bpDWXCqzX5yUerfSEbUyMcq
	QZQ2Lmzdy99xJoaKigEeNGB0B+qDH2M/LMqOwW/+5ZV2hyNhGsoxuZC5
X-Gm-Gg: AYBFou1jJJ4axMKgekaFSA35VcGi+BlMHi//niQ5g0LkMcArdfCT+EeF2cMqeKqD8k4
	EjBdvoKCd/FXeIFvxtR/+fu8K+CQI5K87yEwibarESTANDoRCcTMX2YrSAWJd6TKrOILrrh81PD
	PI2/92qZpxFl0MVSyBHjrWEQiUaqDed+e64SiNZ4B+YvTnfFo6CGE+Pe0ef8mcAUj+skasxKw8U
	AsfkH6mFia2sUpBDG1Qi5rAjabzqhZCN/uX8Gp92gjSeeLtJXYzV4Szt+rBK5oZTSI/Wb3LLMJt
	CIqi2yf78KRJvy+j5TZO7naF7BXUG7LD9E78WjvDKILGdb/k5XEtlvdvhDJrh6JGAMiT/BLrzcA
	CnbVXXlYrVK33SmIJBDP2XTXL+xxJuMdZtgIFFmgeDl3A2T032nnQr6K0wObRv/ZrfzOOPp6/1A
	CJoqI1u9/GYrtJpuGa6LpenlNcbzMN/uA9JHqR8ntLcGqa2hOtqgcrqMfvlfoe1BqPqee3s9EIB
	3F+WTnspQ+QNotMVr7ij/Q/tGG0SC1G9aDeSjAhUY884zRt8IuENHzu98Am7Ok7pk+c6uAApytB
	0lZfLFgwyMA/8rK2ukTmEfC3CEBj2mWKZw==
X-Received: by 2002:a05:6820:169f:b0:71a:ee95:bfe5 with SMTP id 006d021491bc7-71aee95c36fmr4678633eaf.26.1794925538329;
        Tue, 17 Nov 2026 06:25:38 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71af0a8a18csm5313709eaf.4.2026.11.17.06.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:25:36 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCHv2 1/4] powerpc/64: Leave lockdep hardirq context around replayed interrupts
Date: Tue, 17 Nov 2026 19:55:17 +0530
Message-Id: <cfdac7c3508cf0eb1cbf063e7f6331dccb128796.1794924821.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1794924821.git.ritesh.list@gmail.com>
References: <cover.1794924821.git.ritesh.list@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With PROVE_LOCKING, boot warns once and lockdep turns itself off:
  DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context())
  WARNING: kernel/locking/lockdep.c:4448 at lockdep_hardirqs_on_prepare+0x22c/0x2d4, CPU#0: swapper/0/0
  CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.4.0-rc2-00027-g074831f06e18-dirty #123 PREEMPT
  NIP:  c0000000002b2f2c LR: c0000000002b2f28 CTR: c000000002426f90
  REGS: c000000004f075c0 TRAP: 0700   Not tainted  (7.4.0-rc2-00027-g074831f06e18-dirty)
  MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 48022221  XER: 20040000
  NIP [c0000000002b2f2c] lockdep_hardirqs_on_prepare+0x22c/0x2d4
  LR [c0000000002b2f28] lockdep_hardirqs_on_prepare+0x228/0x2d4
  Call Trace:
    lockdep_hardirqs_on_prepare+0x228/0x2d4 (unreliable)
    trace_hardirqs_on+0x98/0x11c
    irqentry_exit+0x64c/0x1064
    timer_interrupt+0x274/0x6bc
    __replay_soft_interrupts+0x158/0x380
    arch_local_irq_restore+0x1cc/0x244
    console_flush_one_record+0x438/0x654
    console_unlock+0xb8/0x1e0
    vprintk_emit+0x300/0x56c
    vprintk+0x20/0x34
    _printk+0x40/0x54
    lockdep_init+0xdc/0x104
    start_kernel+0xa24/0xc68
    start_here_common+0x1c/0x20

Since commit bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature") a
replayed handler always returns via irqentry_exit(), which traces hardirqs
on while the replay is still inside irq_enter():
  arch_local_irq_restore()
    irq_enter()                        hardirq_context = 1
    __replay_soft_interrupts()
      timer_interrupt(&regs)
        irq_enter_rcu()                hardirq_context = 2
        irq_exit_rcu()                 hardirq_context = 1
        irqentry_exit()
          trace_hardirqs_on()          hardirq_context != 0 -> WARN
      next_interrupt()
        lockdep_hardirq_exit()         too late

Leave the hardirq context before each replayed handler instead of
after it:
  arch_local_irq_restore()
    irq_enter()                        hardirq_context = 1
    __replay_soft_interrupts()
      lockdep_hardirq_exit()           hardirq_context = 0 // fix
      timer_interrupt(&regs)
        irq_enter_rcu()                hardirq_context = 1
        irq_exit_rcu()                 hardirq_context = 0
        irqentry_exit()
          trace_hardirqs_on()          ok
      next_interrupt()
        trace_hardirqs_off()
        lockdep_hardirq_enter()        hardirq_context = 1
    irq_exit()                         hardirq_context = 0

Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")
Cc: stable@vger.kernel.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/kernel/irq_64.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
index d5c48d1b0a31..b189e796eb34 100644
--- a/arch/powerpc/kernel/irq_64.c
+++ b/arch/powerpc/kernel/irq_64.c
@@ -75,12 +75,6 @@ static inline void next_interrupt(struct pt_regs *regs)
 		WARN_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
 	}

-	/*
-	 * We are responding to the next interrupt, so interrupt-off
-	 * latencies should be reset here.
-	 */
-	lockdep_hardirq_exit();
-	trace_hardirqs_on();
 	trace_hardirqs_off();
 	lockdep_hardirq_enter();
 }
@@ -137,18 +131,21 @@ static __no_kcsan void __replay_soft_interrupts(void)
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S) &&
 	    irq_happened_test_and_clear(PACA_IRQ_HMI)) {
 		regs.trap = INTERRUPT_HMI;
+		lockdep_hardirq_exit();
 		handle_hmi_exception(&regs);
 		next_interrupt(&regs);
 	}

 	if (irq_happened_test_and_clear(PACA_IRQ_DEC)) {
 		regs.trap = INTERRUPT_DECREMENTER;
+		lockdep_hardirq_exit();
 		timer_interrupt(&regs);
 		next_interrupt(&regs);
 	}

 	if (irq_happened_test_and_clear(PACA_IRQ_EE)) {
 		regs.trap = INTERRUPT_EXTERNAL;
+		lockdep_hardirq_exit();
 		do_IRQ(&regs);
 		next_interrupt(&regs);
 	}
@@ -156,6 +153,7 @@ static __no_kcsan void __replay_soft_interrupts(void)
 	if (IS_ENABLED(CONFIG_PPC_DOORBELL) &&
 	    irq_happened_test_and_clear(PACA_IRQ_DBELL)) {
 		regs.trap = INTERRUPT_DOORBELL;
+		lockdep_hardirq_exit();
 		doorbell_exception(&regs);
 		next_interrupt(&regs);
 	}
@@ -164,6 +162,7 @@ static __no_kcsan void __replay_soft_interrupts(void)
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S) &&
 	    irq_happened_test_and_clear(PACA_IRQ_PMI)) {
 		regs.trap = INTERRUPT_PERFMON;
+		lockdep_hardirq_exit();
 		performance_monitor_exception(&regs);
 		next_interrupt(&regs);
 	}
--
2.39.5


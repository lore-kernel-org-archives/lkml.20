Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158335;
	b=5VqUQ8NR3BBKmcYVwxnpLGqpWTDJcl58Amr/cgPY2YdGik7ndIbWAKmB0X3tV+W566W0
	 K8tuCkElrN6PFJ3v3F9GxVk/M0Jo4hXre6J550JPcoWx489etG23s1eofINXiwwRgsJ8/
	 1wILyWe7H+E/WPb5p0NGgwLPjwVuuk7G81eKVIOFqgF1IitkJ1T5O7QNI/KNrab+GfpS8
	 f/HY+Ii4+vaplalYYDv21LLl8bYC+nSXYu/Ui0OJZMSdiua5L0UGLvRlPYjo631hSmtzI
	 NzRob8ukIqAg9XC6/FcmQXZMXtVJQe9eA6s/Xp6dlImbp1/vDl76E0X8QljTs+ksIMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=;
	b=0BQgx1zutYz3w9JdDBsGRcqwoEfo7jeRII6eR3aHlK/r3qGgKiNV9afpv9N/7ip0/x+9
	 uPiJMsus6rso97RoVSmpT04EPM9DjcxlI/Lmb0Cc+/98fwW+mUa9B/C6u9EjGzncmONTA
	 S1L4SC35HtyS0GQX5SLhvkpdURTZphTL4NZzV4+2b5QGMSsfc+BbAN8Dzb1oRZQukAEVi
	 YeUTUocNtDtvyrR02ENuzXhudvzE0+C0ne8VPu2srgfiuSKWfLtjmIq5BskNQ/cDHpPCH
	 74RVBuPBSMxaBDtrZwIdLT/gDCzOfXHzHrXiKPQsUHW4p1fVM2l+E8RgrIAudPmV6nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6rhB1DT;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486FF606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 486FF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6rhB1DT
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1067999f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158333; x=1793763133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=;
        b=m6rhB1DTxD/frThV3rkb81u9I768z3nILRhLvGcghPRdtT0iqdaHBK3PiE4u2uhfb3
         cU6Ijw38u6Gx8Qm3+T1UAB36f54YQtQB/O0yC7YCx4ypqHuDOZyaWkXW/PTDe2HZaU2p
         QS+PE3tT+t8MDIrOMiNDpgStB8k3C/tVX+nJuXvpIV1Ps9OdVA0JUbkdodzdootAOlRp
         23ukxHzOIdJW3xo5xO8MC4ejW9Y283YuV/JkWq9IRoYScVwEJypmIfH9rSADkOq2es6y
         kZq5CVkR0TxB120nYsFh+kUeV8YvBaRJFnbeHA+YPkGtCaBPPfP6rXL6ACX6otHLxNNR
         zomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158333; x=1793763133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=;
        b=L8NYsS9hvPcE7KM4LedDUDINzSbI9LAusW9sPWzTnrdYXDPcFCFhMU44xtZoL6v1iW
         62P/fRS5kaWRmh7z3pVTaPrWZ7Iq7TXU+vccKA7Qa79s4mg8aIPDktoWfEHgUNjaRDvI
         nvdZXRPvYEMP6cdJzkQhAeNJ2dS0hpoUIK5y50ncl78kB4sbSvUUxIctZOw0DJNOPc94
         oyOhW0y1GBSSzlc+BQkewJwa87quvlEIeicw0I/x+QIcBBVgz8bQ3uCXQSqO708b33zK
         VBMmDobHs98lANvG0g08uNz/gIqhug9iQ7ZA2aO6B44PgAQTNhAsqbK2tqJdVs2SjzsA
         rNrw==
X-Forwarded-Encrypted: i=1; AKwUvBymVIlX5CydnufcCkTapsUlCQBcpM1HX4yVVxuxYY3M7/NYXnSmnbIqJaNT1yePbcESjfDMF1dfHCAnL5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIR64M/eJn77PITvH6YaHi7h35PCx1lHMHS8+zYP1JZ0hOGMbya
	ZdURT4iPvmsh+kkrzcOb1iCrQ3qCfg+tf5gMHlIe/k0iqPuFYNMEUBY+
X-Gm-Gg: AYBFou1RPKY32bOXZwKGDhBJy6bS5aaaXdNQeoDKC0MQavSXq6cdtq51nbNqEN8QQzv
	LLBKKl58EK8O/z8otn9NY416g/Q9b50aJdlurXIVqd27fAz/KGhxuNygRhc0vgG/VhNKoixlKYM
	tuA9riskOkaBCfioZyc2TMJLXTFewfW+Fa/3UGrfVEpKcnmstQ9sduAWwa0UNtWJ6taNYAHEcFk
	aAZhSJP/AlePbd2EL126mEbYqZo3+CYQ9EGV0V8nxviCG6jv4z/st8PYyvG0TnurOZ02f9fDhDo
	6bHj5GAj7fdKhmed1MuBHO/b75e4WmG1H7Tt+iIuwwssBrfeRsSBaewryTOLJrVBotb0dX9wPkq
	zY8CPK+v8OIldd3C/QW0a3el+fZ2/3bQ1nqzFm9TcqGsn6JUmHEk12ZpbuTR0M/EfW/6HLSIJv6
	HOHbKECVFO31lrlRicRfjakEAyS4iegJGRpkARx+8DehfZVvkSYOGlY8LfvGJ/p0/Gq5skC3CqS
	m0Zknq6JwwO+Ez6TWOHe3VFHPL80VXYuGu95WlRajGXmrM939Xhve4g/FGRSESUyaL1yd84ma0M
	zLbMOGq3XuokhuJDfbTzlRwnON9p7FM/BnhsT25gNkAV50rQQNTbp3JUHOZhOz4lUnrBR2YFZI9
	5gqKpui0IdcWczCGZ3bSX48gPtoK+78PuPYUu6MqoUASVs2UaWh6gjCxChNiRJz5WW0WmU2WNR1
	JQlKhCohf8r7jTunPnJP89ps3bZiF9XcjT
X-Received: by 2002:a5d:5d88:0:b0:48e:5c9b:f12c with SMTP id ffacd0b85a97d-48e60212fb8mr338598f8f.16.1793158333537;
        Tue, 27 Oct 2026 20:32:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:13 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 11/13] arm64: Use the pre-counted hardirq lifecycle
Date: Wed, 28 Oct 2026 04:31:25 +0100
Message-Id: <20261028033127.82193-12-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
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

Ordinary EL0 and EL1 interrupt paths establish generic entry state before
irq_enter_rcu() adds HARDIRQ_OFFSET and lockdep nesting. Callbacks in that
early window are therefore not classified as hardirq work. Their exit paths
also drop the classification before function-graph return callbacks and the
kernel return tail have completed.

After the EL1 pseudo-NMI decision, enter ordinary interrupts through
irqentry_hardirq_enter(). Finish the staged count update and delayed timer
and accounting work with irq_enter_rcu_preempt_counted(). Use the retained
exit preparation followed immediately by conditional raw count and lockdep
teardown.

For kernel returns, preserve the existing per-CPU register adjustment, then
stage hardirq return-tail classification before MTE exit tracing. Keep the
pseudo-NMI lifecycle unchanged.

The noinstr path also depends on the raw preempt-count and
__kern_my_cpu_offset() inlining prerequisites earlier in this series.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
Assisted-by: LLM
---
 arch/arm64/kernel/entry-common.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 003f84109a913..d70cffffe71c6 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -94,6 +94,8 @@ static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
 {
 	local_daif_mask();
 	irqentry_exit_pcpu_adjust(regs);
+	/* arm64 uses the split exit API, so enter the tail before MTE tracing. */
+	irqentry_hardirq_tail_enter(&state);
 	mte_check_tfsr_exit();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
@@ -560,13 +562,19 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
 static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
+	struct irqentry_hardirq_cookie cookie;
 	irqentry_state_t state;
+	bool do_sub;
 
-	state = arm64_enter_from_kernel_mode(regs);
+	state = irqentry_hardirq_enter(regs);
+	cookie = irqentry_hardirq_count_state(state);
+	mte_check_tfsr_entry();
+	mte_disable_tco_entry(current);
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted(cookie);
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare(cookie);
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_kernel_mode_preempt(regs, state);
 }
@@ -877,16 +885,24 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 static void noinstr el0_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	arm64_enter_from_user_mode(regs);
+	struct irqentry_hardirq_cookie cookie;
+	irqentry_state_t state;
+	bool do_sub;
+
+	state = irqentry_hardirq_enter(regs);
+	cookie = irqentry_hardirq_count_state(state);
+	mte_disable_tco_entry(current);
+	sme_enter_from_user_mode();
 
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
 	if (regs->pc & BIT(55))
 		arm64_apply_bp_hardening();
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted(cookie);
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare(cookie);
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_user_mode(regs);
 }
-- 
2.39.5 (Apple Git-154)


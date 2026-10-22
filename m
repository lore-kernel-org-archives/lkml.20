Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646263;
	b=fUxIfznswgB7I4a/lf0bZd9xaKpwAjSoKxpqjZKBF2eOHRYSk4xIr6Lom/m9qXSV6tID
	 RI+35gheZfR9DkjxYzkwT7dEBJNuPPaqnE2h/Mp92eGupZuURK3CfMqB1+FueFR0JvnDO
	 zWoCIKMdMI8eAUiIeMynWl0Ysf2GPXvCERb4KNpRooZMuyXwDQgeWXHzPS131wo/IeuUK
	 eEsdknSOGidy5whVTBH6QBP7uZ5IxykUSqmg9yYoat7zPkSxVf3dhUoLBiwzq52E0mPry
	 Pcel59/tSlmLgt2+8iuKRXzI+1paCHh1mGwkl4BQIO6MFosvwMMF8250Dpa9M+6boWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=;
	b=fMHA78s8QFxn3GmZ2MntuwywKBw7Y2Pwjn03ee5q0XjMtB7r9IfRUW0DbQUR+Hr/XUq6
	 x5bb3S4NDLXxJ0z8Szr5xKH4NU9ehQKcNdccpgYScLlosRGwlelR706267D52Ynyr4EL2
	 WM08vsdva6Hw8GoNEHKftMNe4cPF1bCtmAusQJjHmzIN92Ii+O17sWAe8X4K7WcV/3Ygq
	 Uq7R1G8OdaLwzCQGbthtro99sobikmz1R0EBmbR4exbPLkvF9G5QePq/XAHMkgPLLeSFg
	 BhLVEV9hO2sYQH98lDJl4VzDu66HZfECy6QgaiXnJmuXbnGd8sJu4Kgr9KsBY6iPBGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVoa5sPI;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB75606A331
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB75606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sVoa5sPI
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so2075145e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646262; x=1793251062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=;
        b=sVoa5sPIaKdctHZpZqX/Tr/a3nD/WcLeHZH9WemG0HXKqTdFFgQaFQZ4Cur//1TVtP
         +IJn6IC0dDP6m4vxjQWZ5aR79dbKnXLHOPNUVurEmFnZV/yqzsl/muVxW+cMH/0zPQdd
         dK/8pqIuUUk9dLZUuIQTWEglQ5bCKqg/XsY7lVX/kuRlghT8EUfinDMS4f2mkQ8Mt9Fz
         EmXEQVQ/l6Wtatrq/tc7Is3h3kRt4DHc0JnYD0UP1IIfrpj77eW+iAD7w+r8XxYlAHrZ
         EElQx2RYSJCa1tDUa2Y9+3pFcnzxyHS/dBzXaHOgb2gR8NWlTrnSbb607yDipz8V6BfE
         WVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646262; x=1793251062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=;
        b=Nz9NEktDr/291fHkIV03Gl2Ae6XzeVvVV3vtniWsfTkWhTOTzpfIDN4FYdq45Qwz4+
         O9Yj5DYkGjcd4geMuf+YREDVm+nAbGbpCY8bAHEx77CHSLUPJUHvPHAYPLJJGb5fnyHx
         oSkS8JkLC1XM5FWD7sdTFhc4/6Cy3OB4rjLmPw2DDFNIJX/LAuDLg3q88C0n3JPrT7wq
         mzacHG8nt1E/tfM9p25lBX0/SIDucOiIrPL9OYKjW09ex9wdoQ0KLvsAjxyBX0Qb9rVw
         aQM/iCtYXGoDxNBLiEiXmfaRpv4OVLVCj9d7++kI73EdVuaCkj5NWOczlIjNaAlQonGO
         KyUA==
X-Forwarded-Encrypted: i=1; AKwUvBzFpnAWWZ+HLA9g1g8HtrLxexy8E2FxaFCryvXz2QLEBT/yfW1QD9bOiFWINueitSdm2M78NNyCmQAFiI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5P66xf6zTBYx1xatgP0wYg0NOyxpRroP+y2XmtLToWNPSChcQ
	DJs3PYqkY5YlzN6w228PXBKGEghI7waBumEyYSTXYYHM6a5AJhDeqKFf
X-Gm-Gg: AYBFou375V5BtvtSxYYqMsJThcNpgBA8/AdtIoGeVHKVRbdH4HY3oZ2hzT9ozVWBswJ
	OFMMZ2Xt6BbBOt+fqVXQykdqNYjItLTXOLP1NIk9ZIqK5pSA3UpUITbqMY5/Fq4ouS8i7444Bo7
	iqgi10tiLArRdM5itjkJcTH6T86q9SQq+FKGzSurjSBN7TuWIvDYe2iXPHZx72lytSEB3ny6gjb
	ckrpfHsoMgupXp1e38JB4zM+vv5Gn4XNdYxQzzT8/yvfA/ORwoVHb1p4B5auh+kMqND7PbCcRuY
	ukTFuHfFdNrB598e5zKnl3Rz/WubimSPoFJvDGV+yk/xXCIw4a9xbAN8XUpAcO4DUPDhR1Yo1HS
	2/+je1xeMmt/uXawQfjHEU9QxZN0osQgYThUa7LyxkYdXZ1nau90WfGH+G8j+38d/8wcuL9pPWP
	Dy/mjW0SJNRlNkikF9V6BSN1/d8c3jcpZGP1jYj/pH+qtH/X6dJKX3CR+MCgbI0p5s3M0c01Ede
	3U828f5hxCdOi7Moc7jqD7O9ZdE9yZAjmw9cUY6eGq/TBUiAGOldXWKUhMzRWZDxPsvKa5WlPBj
	KOcHTq7Q3c8mea4b388Fm2QpQgTN50GFQlcVOM7F/doZlPsquAZ0abDQU9r+rZ9gkGall3Ie+6o
	1QTGt2Uj4ILraPwIBBwUt4jMCVFJ1Ut9kTEj3Ccm4JGoEDeAQHt2etfhfW/5Voc/GVSI61nwIq3
	hee9Jh5w==
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr16486165e9.8.1792646261504;
        Wed, 21 Oct 2026 22:17:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:41 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Subject: [RFC PATCH 09/12] arm64: Use the pre-counted hardirq lifecycle
Date: Thu, 22 Oct 2026 07:16:51 +0200
Message-Id: <20261022051654.79224-10-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
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
irqentry_hardirq_enter(). Complete delayed timer and accounting work with
irq_enter_rcu_preempt_counted(). Use the retained exit preparation followed
immediately by raw count and lockdep teardown.

For kernel returns, restore return-tail classification after masking DAIF
and before MTE exit tracing. Keep the pseudo-NMI lifecycle unchanged. Force
arm64 preempt_count() inline so noinstr callers cannot be outlined into
instrumentable text.

The noinstr path also depends on the raw preempt-count and
__kern_my_cpu_offset() inlining changes carried as patches 1 and 2. Keep
them separate because they are externally authored fixes.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
Assisted-by: LLM
---
 arch/arm64/include/asm/preempt.h |  2 +-
 arch/arm64/kernel/entry-common.c | 23 +++++++++++++++++------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 4f917596f387d..3d61be0f825fb 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -7,7 +7,7 @@
 #define PREEMPT_NEED_RESCHED	BIT(32)
 #define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
-static inline int preempt_count(void)
+static __always_inline int preempt_count(void)
 {
 	return READ_ONCE(current_thread_info()->preempt.count);
 }
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 93056a766fb20..fda807c61ff27 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -56,6 +56,8 @@ static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
 						irqentry_state_t state)
 {
 	local_daif_mask();
+	/* arm64 uses the split exit API, so enter the tail before MTE tracing. */
+	irqentry_hardirq_tail_enter(state);
 	mte_check_tfsr_exit();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
@@ -523,12 +525,16 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
 	irqentry_state_t state;
+	bool do_sub;
 
-	state = arm64_enter_from_kernel_mode(regs);
+	state = irqentry_hardirq_enter(regs);
+	mte_check_tfsr_entry();
+	mte_disable_tco_entry(current);
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted();
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare();
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_kernel_mode_preempt(regs, state);
 }
@@ -839,16 +845,21 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 static void noinstr el0_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	arm64_enter_from_user_mode(regs);
+	bool do_sub;
+
+	(void)irqentry_hardirq_enter(regs);
+	mte_disable_tco_entry(current);
+	sme_enter_from_user_mode();
 
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
 	if (regs->pc & BIT(55))
 		arm64_apply_bp_hardening();
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted();
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare();
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_user_mode(regs);
 }
-- 
2.39.5 (Apple Git-154)


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158311;
	b=phRc3jTVN5ZiecBQhkQiAzzCR24+4W6losjFwWfVQWQ3fs34NvxxOQij4AzUr8OAMUt3
	 CQ/AGgNwSqZUkQNbRsNTHc9MA4yCevsOvYHN5EkbZT1bZrfwz7gg0VURh18ITeVo8POxK
	 va+kdVd9p6BLlUmxVBXk/MqnFbYgYxQ6zl8JFu3r7YEj5G12iEb2JWi5R1W7S+4Tal8/O
	 XUtZeLyH3Gzv9SioScVxJ5IQcJyYi4x62KmkHhmx+GPGR6UmpZ9m4gwDFpq3sQTumLMJi
	 0V3yeIAvDJrf2lANJcxvf1DmW0Lc8LH1jdevEvwSM5eV/cOEZysouBmkC0KhXM0UWsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cBw/L/ygxWFW2P1pTYoVf3ArkDdn4roU8ZXqmZMF7LY=;
	b=ZaAQcrTg74sJj4k5p8Vcjqtl4omE7+hmSn98zkkjA4R0jmOa0c6IdOIjsvIjrjAGV1IZ
	 1atYOVcxVn4vOGssIZukMWyZKtJjjzUtkuZ/Lc9M6gKBu8nU/VrerdbcE4gVKGTSlHXty
	 shdlcjb3sVNjMMk9TTk3duPoUf95gdWVkQ+0M8sUZ7vD2cYgr2+NFOk7DDqh+H77Nzmvr
	 knNluUI47KKMYZOIBvgYaopX6WHNyDcd3CemAU2+YGyrbANiRPmeuwHjkkJzu+NgObZLa
	 jTLg4iyhmsmw/ilvbuG4b45NM/JSpEZGikJZvQjNHSMiBah2eFAYMLcASD0rHEHuA8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xov40eWd;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56681606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56681606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xov40eWd
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso359530f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158310; x=1793763110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBw/L/ygxWFW2P1pTYoVf3ArkDdn4roU8ZXqmZMF7LY=;
        b=Xov40eWdq9tlcuudzwVsg89mEHbXSOG93FbvWugvW4E2/kBLkLRSdSNP/DrT/EbNO1
         AG+QsEbV+XdNpNu3UEHz18lTw/JrvytEGzaDclNE9pkUVqFa8luRglENQAH7evzQDDs/
         M0g+QciC+P7bXb7vvCe601b5r9GnWYqZmqcPvvOQddl/wLqg7yvqblhVaI2xv3LZFVng
         WkhTZ6S9mjcTDftmLJLfEI5Z2nacHEQ1ec0uNBt/CO7AY/aqm3IGQJTW7alm2w6B0fB4
         CcrHbnBTEejbK9fsYX70xWmmKDJW5Oezg5FHvzJCcRGXxz41DFqaLQG/ZTFSf3cfN+E1
         HhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158310; x=1793763110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBw/L/ygxWFW2P1pTYoVf3ArkDdn4roU8ZXqmZMF7LY=;
        b=1Cz3+JqOD1Q4OPb0mp7ADi99aVa8ysWPw9xq6PyhVSO3RG55zFFqAFqJFre9OggYqq
         guETv8cTBnN8Ky4dkj35riTOwMEwIhfbxqyKeXGYcl0Zz7JakjfjPDEKv9fiROcGi3jT
         xge600gWLrRyHLlCH7wpE39IaLaECIkpQ/Za3Je5FYL3j5G6hNFrbhem3TEsNsNp7bDL
         AZQf3cmAkpOUZNy4q0MN2QMWCTkqIwzDfDG3bZlSIxd8dUut5nT1qTaRtej49WBi0ALJ
         +iK1yrARxUk8mjfttxKLiX1Pf8dGt8Ic0af6qHH0q6cjjANgnTyU2ET6wlMKe7cEqM0s
         d9Wg==
X-Forwarded-Encrypted: i=1; AKwUvBx9BvcFqGIFzGROtOUdTM+mSMhTR4fxjJZiUGQKOdhE7tfThbecyyJVDyZP0bdJ1jBQtkf6AysRxEsZ4q8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0TxTCra2bxgCrpnu5VHFR3Cn1A0Tcjwp7TosRnDZECSYl98Cs
	VJUqgsCGfDz1VpyKvStx0XAIAdfOEeXQMfHh/KLjT/E0Fx1zcWsLV9BR
X-Gm-Gg: AYBFou1LdewPRPlQOapA3GCvotEXiwTCIpKZXRa+j5GjFR1V0S4gskcD6yfKbWadhGG
	J8xJhkmfadBP27H3bRKDCSpwEJaxsCwB5AFkFrJK3jQrmGwNg8TaIN6FUl5wTZzz+5aekmAz6VN
	jQNclz/tighziv5GA+u7q0X7HdnQPIfz1BIsbz8O7VYu5hJBBQAmtug0a/c/IxdMukaXyptg6SW
	rR+2hsxHpQxkzVMYa3OEbRe5ARFOeIB43fqKz3WJMIQuH6I1oyNpUsBk71rjrpHGf/5fGa4IbGd
	SVEmXu6M+lK4T4w5eVFGXn+vRfDYfYeV9Cn12ofo6+SQ/DLy5UEOzFixIJvkP1GAp3BOGwt6lw7
	Eegg6jXo9sX+flaKZYr9R1sK8ZdX+OQ6bHuK73iFq+gRvTzMVerYEYywiqJbM0fn74NGZLrgMem
	jE9hT+zn8MVIq/78ohZqGXYfJalvKG3wG9oxz6svlEpNJkZmrnETLsquhSqnt5EvtyZDgMW06qM
	y3FlYsRkQIleiQuqNx6on2Kqjd+K773mhOpgJoqD7kAx9fR/5mpOAxg9n+s2gPOHZUZqSEvf0Ly
	l+mPI6L+QGTkFkAUuh4rY+9G3HF7UkUc/ELJUzWIxChckTpZsQ5oT0mN5kvp2PB93Rble3J/uuU
	hjVshTn8GH4tQI7CPxR3ety/amMS9o9c2jfsqVwhgrx3fUIvMhSi/Jd5EtXvKVART8ic8OtEH3h
	4U8uqIaa2dnSBDAEeablcgeWbMr2fgiDOE
X-Received: by 2002:a5d:4f07:0:b0:48c:7ee3:e07d with SMTP id ffacd0b85a97d-48e5d312c2bmr2026606f8f.52.1793158309691;
        Tue, 27 Oct 2026 20:31:49 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:48 -0700 (PDT)
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
Subject: [RFC PATCH v2 03/13] sched: Split preempt-count bookkeeping from raw updates
Date: Wed, 28 Oct 2026 04:31:17 +0100
Message-Id: <20261028033127.82193-4-kmehltretter@gmail.com>
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

Very early hardirq entry code needs to update the preempt count before
instrumentable debug and tracing code can run. Conversely, hardirq return
code needs to finish instrumentable validation and latency tracing before
raw teardown.

Add a small hardirq-entry header with irqentry_hardirq_count_start() to
stage the raw HARDIRQ_OFFSET addition and record whether it was applied in
an opaque cookie. With DEBUG_PREEMPT and without separate reschedule bits,
route an already-negative count through a noinstr slow helper which
preserves the existing DEBUG_LOCKS_WARN_ON() oops short circuit. Add
irqentry_hardirq_count_finish() to report a rejected addition or complete
post-add debug checks and latency tracing, and add
irqentry_hardirq_count_sub_prepare() for validation and tracing before a
raw subtraction. Keep preempt_count_add() and preempt_count_sub() behavior
and ordering unchanged.

Keep latency tracing in each calling path so CALLER_ADDR0 identifies the
caller. Force the start and stop helpers inline because trace provenance
depends on their stack frames.

Assisted-by: LLM
---
 include/linux/hardirq.h          |   1 +
 include/linux/irqentry_hardirq.h |  81 +++++++++++++++++++++++++
 kernel/sched/core.c              | 101 +++++++++++++++++++++++++++----
 3 files changed, 171 insertions(+), 12 deletions(-)
 create mode 100644 include/linux/irqentry_hardirq.h

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index 2648c49cd8f6c..dcbda3c1d5636 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -4,6 +4,7 @@
 
 #include <linux/context_tracking_state.h>
 #include <linux/preempt.h>
+#include <linux/irqentry_hardirq.h>
 #include <linux/lockdep.h>
 #include <linux/ftrace_irq.h>
 #include <linux/sched.h>
diff --git a/include/linux/irqentry_hardirq.h b/include/linux/irqentry_hardirq.h
new file mode 100644
index 0000000000000..1937fc972e846
--- /dev/null
+++ b/include/linux/irqentry_hardirq.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_IRQENTRY_HARDIRQ_H
+#define __LINUX_IRQENTRY_HARDIRQ_H
+
+#include <linux/preempt.h>
+
+struct irqentry_hardirq_cookie {
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+	bool applied;
+#endif
+};
+
+static __always_inline bool
+irqentry_hardirq_count_applied(struct irqentry_hardirq_cookie cookie)
+{
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+	return cookie.applied;
+#else
+	return true;
+#endif
+}
+
+static __always_inline bool irqentry_hardirq_count_valid(void)
+{
+#ifdef CONFIG_DEBUG_PREEMPT
+	/*
+	 * Without separate reschedule bits, preempt_count() excludes any
+	 * shared reschedule bit. A negative result therefore denotes an
+	 * existing underflow.
+	 */
+	if (!IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS) &&
+	    preempt_count() < 0)
+		return false;
+#endif
+	return true;
+}
+
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+struct irqentry_hardirq_cookie noinstr
+__irqentry_hardirq_count_start_slow(void);
+#endif
+
+/*
+ * Attempt the non-instrumentable part of a staged hardirq-count addition and
+ * record whether it was applied. The returned cookie must be passed to the
+ * matching irqentry_hardirq_count_finish() and subtraction preparation. A
+ * rejected cookie attempts deferred reporting and suppresses post-add
+ * bookkeeping and the matching subtraction regardless of warning
+ * suppression.
+ */
+static __always_inline struct irqentry_hardirq_cookie
+irqentry_hardirq_count_start(void)
+{
+	struct irqentry_hardirq_cookie cookie = { };
+
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+	cookie.applied = true;
+	/* DEBUG_LOCKS_WARN_ON() permits the addition during an oops. */
+	if (unlikely(!irqentry_hardirq_count_valid()))
+		return __irqentry_hardirq_count_start_slow();
+#endif
+	__preempt_count_add(HARDIRQ_OFFSET);
+
+	return cookie;
+}
+
+#if defined(CONFIG_PREEMPTION) && (defined(CONFIG_DEBUG_PREEMPT) || \
+					defined(CONFIG_TRACE_PREEMPT_TOGGLE))
+void irqentry_hardirq_count_finish(struct irqentry_hardirq_cookie cookie);
+bool irqentry_hardirq_count_sub_prepare(void);
+#else
+static __always_inline void
+irqentry_hardirq_count_finish(struct irqentry_hardirq_cookie cookie) { }
+static __always_inline bool irqentry_hardirq_count_sub_prepare(void) { return true; }
+#endif
+
+#endif /* __LINUX_IRQENTRY_HARDIRQ_H */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8ca..7e2da8fc32b6d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6028,7 +6028,7 @@ static inline void sched_tick_stop(int cpu) { }
  * If the value passed in is equal to the current preempt count
  * then we just disabled preemption. Start timing the latency.
  */
-static inline void preempt_latency_start(int val)
+static __always_inline void preempt_latency_start(int val)
 {
 	if (preempt_count() == val) {
 		unsigned long ip = get_lock_parent_ip();
@@ -6039,6 +6039,62 @@ static inline void preempt_latency_start(int val)
 	}
 }
 
+static __always_inline void preempt_count_add_debug_checks(void)
+{
+#ifdef CONFIG_DEBUG_PREEMPT
+	DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
+				PREEMPT_MASK - 10);
+#endif
+}
+
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+/*
+ * Preserve the DEBUG_LOCKS_WARN_ON() add-or-reject decision without invoking
+ * instrumented reporting from noinstr entry code. The caller reaches this
+ * only after observing an already-negative count. Recheck after testing oops
+ * state to retain the original short-circuit order.
+ */
+struct irqentry_hardirq_cookie noinstr
+__irqentry_hardirq_count_start_slow(void)
+{
+	struct irqentry_hardirq_cookie cookie = { };
+
+	if (!READ_ONCE(oops_in_progress) && !irqentry_hardirq_count_valid())
+		return cookie;
+
+	__preempt_count_add(HARDIRQ_OFFSET);
+	cookie.applied = true;
+	return cookie;
+}
+NOKPROBE_SYMBOL(__irqentry_hardirq_count_start_slow);
+#endif
+
+/**
+ * irqentry_hardirq_count_finish - Finish a staged hardirq-count addition
+ * @cookie: Result of the matching irqentry_hardirq_count_start()
+ *
+ * Attempt to report a rejected addition and skip its post-add work, or
+ * complete the post-add debug checks and latency tracing for an applied
+ * addition, after an entry path had to stage the update before instrumentable
+ * code could run.
+ */
+void irqentry_hardirq_count_finish(struct irqentry_hardirq_cookie cookie)
+{
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+	bool applied = irqentry_hardirq_count_applied(cookie);
+
+	if (!applied) {
+		DEBUG_LOCKS_WARN_ON(!applied);
+		return;
+	}
+#endif
+	preempt_count_add_debug_checks();
+	preempt_latency_start(HARDIRQ_OFFSET);
+}
+NOKPROBE_SYMBOL(irqentry_hardirq_count_finish);
+
 void preempt_count_add(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
@@ -6054,13 +6110,8 @@ void preempt_count_add(int val)
 		return;
 #endif
 	__preempt_count_add(val);
-#ifdef CONFIG_DEBUG_PREEMPT
-	/*
-	 * Spinlock count overflowing soon?
-	 */
-	DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
-				PREEMPT_MASK - 10);
-#endif
+	preempt_count_add_debug_checks();
+	/* Keep latency attribution in the preempt_count_add() stack frame. */
 	preempt_latency_start(val);
 }
 EXPORT_SYMBOL(preempt_count_add);
@@ -6070,13 +6121,13 @@ NOKPROBE_SYMBOL(preempt_count_add);
  * If the value passed in equals to the current preempt count
  * then we just enabled preemption. Stop timing the latency.
  */
-static inline void preempt_latency_stop(int val)
+static __always_inline void preempt_latency_stop(int val)
 {
 	if (preempt_count() == val)
 		trace_preempt_on(CALLER_ADDR0, get_lock_parent_ip());
 }
 
-void preempt_count_sub(int val)
+static __always_inline bool preempt_count_sub_debug_checks(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
 	/*
@@ -6086,15 +6137,41 @@ void preempt_count_sub(int val)
 	unsigned int pc = preempt_count();
 
 	if (DEBUG_LOCKS_WARN_ON(pc - uval > pc))
-		return;
+		return false;
 	/*
 	 * Is the spinlock portion underflowing?
 	 */
 	if (DEBUG_LOCKS_WARN_ON((val < PREEMPT_MASK) &&
 			!(preempt_count() & PREEMPT_MASK)))
-		return;
+		return false;
 #endif
+	return true;
+}
+
+/**
+ * irqentry_hardirq_count_sub_prepare - Prepare a raw hardirq-count subtraction
+ *
+ * Run debug checks and latency tracing before an entry path performs a raw
+ * preempt count subtraction after all instrumentable code has returned.
+ *
+ * Return: true when the caller should perform the subtraction.
+ */
+bool irqentry_hardirq_count_sub_prepare(void)
+{
+	if (!preempt_count_sub_debug_checks(HARDIRQ_OFFSET))
+		return false;
+
+	preempt_latency_stop(HARDIRQ_OFFSET);
+	return true;
+}
+NOKPROBE_SYMBOL(irqentry_hardirq_count_sub_prepare);
+
+void preempt_count_sub(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
+		return;
 
+	/* Keep latency attribution in the preempt_count_sub() stack frame. */
 	preempt_latency_stop(val);
 	__preempt_count_sub(val);
 }
-- 
2.39.5 (Apple Git-154)


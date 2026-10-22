Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646252;
	b=VPibRLa8h2vuWIL42+37xGaKfPRLl9APOZ9F+aK7gkMFVgWbBd9iQl6pYa1B/Bt3QOQ6
	 J3kNBtJ/ttCr0a2HKyrwi9UDLI3qMy0qIonOKndT2inmmHk8huSWJOWEbrNTOqFkEhoVX
	 /a26h9h6WbM3cZEofSdyETJ/C9aYPkeLOXowRs71921O821oCOtu7bZqnTFcJagdt3v32
	 oHam+C9hcIFGXhZlpaMQhKVN90c3iP2kO2lB/exJYLvnqYAVPbt2E39OP/iuQxsiH4Etd
	 iW1XI+KLX/3j06XO830m93ndlqP3VOG+kGdjPC4Mg1ZQWypv6vO3tqYoR0S7bKPW75w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SgSVPju/oDwYCUMu1qXQuK1g6vGXDkUziO98RSaFsPc=;
	b=q1NaiNqUa3I217GUkShKHya/OtIrKhOK2A9dBpQqfoeoCDsgUE/SoxG3MK/6cdUbvAOE
	 otIMrIA+V/c8SkoYESEC9hMwwoksdjFPE+EGZlU+5l2tWvxGeXTMZu6Q/YFfyLLaMFMnx
	 Hs5QTZFRKVFlW2z/+vu4W6xUYmhd1j3znLgTUHG3dY9sx4Py7lkfupINUaOGSxeAM+A1q
	 RbkKxxcHeQzrcFouCKG8wnNtS3KnK7sFXJ/Ym5J25hrSGnVe7cfhBxBs0GNH04zFiMJxx
	 9s6slVaja354hpLg02RUDD6m7SQTNLmvUFiQhVHhI2Mm6D6FmHVVcrAhBKCYX+oZCnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mV9IvZyy;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3A760A260F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D3A760A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mV9IvZyy
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so16290305e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646251; x=1793251051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgSVPju/oDwYCUMu1qXQuK1g6vGXDkUziO98RSaFsPc=;
        b=mV9IvZyyzzbb8eaAq6WvvyU135ja9QGcCNyd0fJ/Rk00xax7ivbbJh0YOCwOj0uU9r
         Sv3sxXQHx5XvUGVhU1w0dQId4eQB0Ahb1C/jzherVi59bpgQvHQEgzuCGSQjX1tynKtq
         XfNgYHmZNLlcc4Ks+57CJOVR20sy71p8y5GsPhGA3v089OZlWQZGOy54eJ9UWfP0xfT0
         EhawdTFhkEw5DB370nnFZn9FD6sSH6iN66zAa8OqDMF4OI+AFm3ecjvZzbU4FpZOKnfv
         Q+unLImemE4UTWn19tJ9yWLuFDHBUYq51E522H1mbVA6g8CqRgWFl10Z5gTsWhMC1xnd
         SKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646251; x=1793251051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgSVPju/oDwYCUMu1qXQuK1g6vGXDkUziO98RSaFsPc=;
        b=XfcZIrtNksHcgG/+JAFFa4CJ/DutkhZ2DUqu2rvXM3hLtOzmpr8UrydK3UHPLkr7tI
         WKLXMN4SDrFIPlXfjc526LcZEcGxCzdwYWF4nPnA3dmm2purTrZoG5GZXaoIhQnZa/HR
         tpGxABrO+ev8kJqFGJ/Chp4qoO3Su2NgP+XlOra08Ys7eCbA7cdEDewxcwf3SQkBAr6Y
         MAWNKpBXhxkv3aED5uYieByX8jnzWuxVOp9vY/6qG5LQ3tAJHXOMBD/l6hDoYMWz2i71
         jNyh0KhGzV0sbuktQ5MYj+IJaDL8I+M6JqF4NW8jNiliC3Ziqp1ctO1iHPIOrH6tdd81
         hzrw==
X-Forwarded-Encrypted: i=1; AKwUvBzeorulmp44kiTUhFB7LxsBiiITwNE5nCsi3QmLCxjrXyhn7kxNLn5+J0SB90O/RiDau/bD7Vc8dYRm4Wc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZuGjPDIxF2b8lRGYp4ipWSaYLsUmXSl67D5de0rZeDS2Chfmw
	e78iamu5Go3PwhHpr1OtbGsMZvVOtbc8s1AukA7GGHWOIedom699HgpG
X-Gm-Gg: AYBFou2nJqR6oBbSF8Fs1l+KIH3tsrJVcpW+NwJ0gigr7N/2/n96gxnb37wJK427jer
	/tMXVbuEzX8+v9VtUQp9h+ZmAafi7jKmdiYvbMM652Xwh8FzotlAKiCXRBZjZpjG+d6RNCyUG7S
	aSYPCW0Z4WrBQqn6hYfKr15PncyeMjaSmEw6isUvzXPIc/X2FQHQsCsa/dvpRChmqGGRuEwqFap
	Cwc5fpulN8aPmFP5alWdxc9lCaFboOiqA1S6w04jGuikUGlwE61RDZlSv3gK9K23gW2WClUa3MW
	NMBSNkfk1x3zDzQOyg2ooEth0+A9HNORnJUKKWxMyp978bRd3kWIdfWV+gIyH0X6XhP23dNzvDf
	MAI+jCAjFNjv8ZedQRZzryNb0OOl931lU/BJiqVNxddbcbBrN4fOvg5tRlbEaceMyk8UjflJ9yK
	8am25X4vaqF8oHxsLpAr+WgNFtGw04jwVu7Z1H85ltL1xQ7d0ln0S8I08VwEt/Kk6Rp9jQKqg15
	xWDGgAMUtGMhvo4hO9LPlxCFez8T25ASpbFIvLyJsmy0wv5jCRlcDQHwcsQcCk+PcMJT5eLduVb
	ywyzjmPoxB8ZK3xJE00lnZ1Dg8LG+w/HD2RbKjAV8rrhB5a4XmZX/NmVrOvK+KqaOdRqEqryca1
	NjAez+MRefSFvhGGnWr3XfQxyBTsa10XIuE24v2BChVhDehvICbcyqGTrvXw=
X-Received: by 2002:a05:600d:8653:20b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4a205ca7975mr15129905e9.4.1792646250340;
        Wed, 21 Oct 2026 22:17:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:29 -0700 (PDT)
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
Subject: [RFC PATCH 06/12] lockdep: Prepare IRQ-on state from a hardirq return tail
Date: Thu, 22 Oct 2026 07:16:48 +0200
Message-Id: <20261022051654.79224-7-kmehltretter@gmail.com>
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

lockdep_hardirqs_on_prepare() rejects any live hardirq context. An ordinary
hardirq return tail needs to retain one synthetic hardirq nesting level
through traceable IRQ-on preparation so callbacks remain classified as
hardirq work.

Factor the common preparation and add a return-tail variant which accepts
exactly one nesting level. Keep the ordinary helper restricted to zero.
Neither helper changes IRQ or hardirq state. The caller must remove the
tail context before lockdep_hardirqs_on().

Assisted-by: LLM
---
 include/linux/irqflags.h |  2 ++
 kernel/locking/lockdep.c | 42 ++++++++++++++++++++++++++++------------
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index e98313a8ad307..c7601a173e55b 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -25,6 +25,7 @@ struct task_struct;
   extern void lockdep_softirqs_on(unsigned long ip);
   extern void lockdep_softirqs_off(unsigned long ip);
   extern void lockdep_hardirqs_on_prepare(void);
+void lockdep_hardirqs_on_prepare_irqtail(void);
   extern void lockdep_hardirqs_on(unsigned long ip);
   extern void lockdep_hardirqs_off(unsigned long ip);
   extern void lockdep_cleanup_dead_cpu(unsigned int cpu,
@@ -33,6 +34,7 @@ struct task_struct;
   static inline void lockdep_softirqs_on(unsigned long ip) { }
   static inline void lockdep_softirqs_off(unsigned long ip) { }
   static inline void lockdep_hardirqs_on_prepare(void) { }
+static inline void lockdep_hardirqs_on_prepare_irqtail(void) { }
   static inline void lockdep_hardirqs_on(unsigned long ip) { }
   static inline void lockdep_hardirqs_off(unsigned long ip) { }
   static inline void lockdep_cleanup_dead_cpu(unsigned int cpu,
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 01dba8fb32a90..457bef3ea1689 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4395,15 +4395,7 @@ static void __trace_hardirqs_on_caller(void)
 		mark_held_locks(curr, LOCK_ENABLED_SOFTIRQ);
 }
 
-/**
- * lockdep_hardirqs_on_prepare - Prepare for enabling interrupts
- *
- * Invoked before a possible transition to RCU idle from exit to user or
- * guest mode. This ensures that all RCU operations are done before RCU
- * stops watching. After the RCU transition lockdep_hardirqs_on() has to be
- * invoked to set the final state.
- */
-void lockdep_hardirqs_on_prepare(void)
+static void __lockdep_hardirqs_on_prepare(unsigned int expected_context)
 {
 	if (unlikely(!debug_locks))
 		return;
@@ -4442,10 +4434,11 @@ void lockdep_hardirqs_on_prepare(void)
 		return;
 
 	/*
-	 * Can't allow enabling interrupts while in an interrupt handler,
-	 * that's general bad form and such. Recursion, limited stack etc..
+	 * Ordinary IRQ enable requires no hardirq context. The interrupt return
+	 * tail variant permits exactly the synthetic context it is about to
+	 * remove.
 	 */
-	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context()))
+	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context() != expected_context))
 		return;
 
 	current->hardirq_chain_key = current->curr_chain_key;
@@ -4454,8 +4447,33 @@ void lockdep_hardirqs_on_prepare(void)
 	__trace_hardirqs_on_caller();
 	lockdep_recursion_finish();
 }
+
+/**
+ * lockdep_hardirqs_on_prepare - Prepare for enabling interrupts
+ *
+ * Invoked before a possible transition to RCU idle from exit to user or
+ * guest mode. This ensures that all RCU operations are done before RCU
+ * stops watching. After the RCU transition lockdep_hardirqs_on() has to be
+ * invoked to set the final state.
+ */
+void lockdep_hardirqs_on_prepare(void)
+{
+	__lockdep_hardirqs_on_prepare(0);
+}
 EXPORT_SYMBOL_GPL(lockdep_hardirqs_on_prepare);
 
+/**
+ * lockdep_hardirqs_on_prepare_irqtail - Prepare an interrupt return tail
+ *
+ * Like lockdep_hardirqs_on_prepare(), but invoked while the single synthetic
+ * lockdep hardirq context covering an interrupt return tail is still active.
+ * The caller must remove that context before lockdep_hardirqs_on().
+ */
+void lockdep_hardirqs_on_prepare_irqtail(void)
+{
+	__lockdep_hardirqs_on_prepare(1);
+}
+
 void noinstr lockdep_hardirqs_on(unsigned long ip)
 {
 	struct irqtrace_events *trace = &current->irqtrace;
-- 
2.39.5 (Apple Git-154)


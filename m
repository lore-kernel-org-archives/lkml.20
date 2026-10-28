Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158326;
	b=fGHEgwMYM+I0Rs/A8dhmYTAkrvlyJFMbLgIMvzUvtlf+LyLKGjGXGOn1Qcg7O9as6f0m
	 4tUspXbanAr3hH13OXCril8xoyWAHzawjTrxkfNKyMj9YRWPCe/hNfYJVeAFkEPwcMaa7
	 ICaPvqweKqNVcGT+/LxGZaqsMhLtsjy7n04gSO8rZq9ItNb/Pd+un/eIQDlD7L8tSNIko
	 qiR66D8dlFpCfMvEG56c2HiyYpHiDD/ujAnJ0F/BCcZrRp/AuNUOGkRrqJylL1XlDL/rF
	 tq+6PaKeR0fAfeViw6oYS379GNPGcAoIwW4og2Jy3zoriG9kvAqiGfq/nuJIOJoCojw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=;
	b=YDulbxkXv2cMDcOSbdCt/R7emVGhyCHOmpRMGe9WSTEKkViwWBG5fcVTZkZqgtHCQ/r8
	 g0Gy7KRcH3G60as5+8iylJvhIFTjenYAcpS6zNYMQWJGrDubWUzarWHCFoiw0EGci/gdC
	 jq/nYLVGz7ooVrwQqof9/gJgIwpGIWfHm1gAb5DHMML4fnGItndymQ4dkQEsiWPm1S1xj
	 sZplopm0qEmyA5siAy82mUsie6cY47giUT9foLDlQ+BrAYuyo+aTp00zEPZ0VpGcwH6C8
	 0Xw8brlvrZ60U5154Bukyxh2mLjz3SWCxyaPuln3gyAzBKiRfCyvMQkAzSSyq9myKBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQYihddN;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0866606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0866606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IQYihddN
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so214127f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158324; x=1793763124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=;
        b=IQYihddNldSwwNQL4cNDOCOj3vvWf6Wnmb806Mt7YnHev8qmPKJiywxcjV1sz23mXu
         dsePR7cCzgB1pkxuONknafj6ZvOcKxOm9j21xDL+bfrY+eQ0VQuSbN3gctFdA4KuZLpc
         OoXsqXDz1La7cEGOcnMkuJs36dhQ4jJmZlkgx/4ZM7D8fxZnRkApn6OA0yKoYFHPPqbk
         NXtRw8M6f3S2T8WDmwVlJoDaOifcuApwzusE2dCncmuNF7/4LvAnZecpSlEEWnG4gGCG
         f43UwyjXzPxKe0pBrfcsDQ79AEFjnAbqaV9ok+1I9lUNLDqEtqrdHjtp3kc55W7icDz0
         hOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158324; x=1793763124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=;
        b=sUJWkRz11xxAl8A5WtIyi9s/L7ktT8OZVuK2UqzkXbYlOHBx4ZEaJeXwd/mK0ezFdN
         n9WqHtxoge4LYFnZxgdzx3z1465iwxp6opEs8azIcuiv3NVBlUrj/cednhU1QeecmVF8
         fR5TterRqsmUeq2SQYNa41L+p/beDOIOObXmSE0ZPHL88L+gmkLWm6+hdfCuJ8dM1eIz
         Ws+3ytbUQSxIb+z/KCvDmXc/Wte/pCZHGs4xcQhsfSwe+tVZg8Y1E4uKHYS+My1LTpCo
         kdhmG3b7SP+QrD3vldErYme9AK3AHvqYcqTdkb+Z0APi75DbT3loZxHE6e2cSyhtwcdv
         z2Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxo9bWPXIiiqlBJ1tet6IP02vTa60dGOCZ6iaGc4TmK6ZO9obu2/uJZH3SgKCOLjC/9AgCkbgHerY68H1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWKmObOsncNPnryi6zGhjnY7R7u0dSktXwg0KqyGWHFhBzQnl2
	Tukw0K64VDDIQI7GImEaUmJnSL1RUKsVGXVbj6Vu25qHNgW0Lll8JbLz
X-Gm-Gg: AYBFou3lFaVSDhA+/vlNqxcEG15++0G4SR7p/5Vj7U5DW72quNM+aOPqc0ha6NlL9oP
	i6z7vuIlLfbPuwNDYNrLe+N1qWmcDr4q4tCgdGWTHg+9VRONuC56gYKgWYwYQt/Uc3kZ1+xZW20
	FKi+bxXlFUEj17/bdWVfhXN3CGqduWDn7ZIEzOBYs8bWhQguNt8txFSZ/FvUoxyLFIAEMfN3gkW
	yk0+kRa5Mf7axvSg1mk+BTUzs9daY8OaXb5o8TEO+CNMaaE0htDI8C2aAcy7QTGuZYo41TrsOjO
	Qx3drl6HAIz8XJZrFb/FdHJahBAPpOVa57MVUZTb7QG1bjhnk+GFpzzPoDcknKAQBG7R+8ed4dx
	gs/fxhzxso1MC/UNhwTV56pQu1hymv23mvjIJKDLC56D0MiAgh6m5NHccItCGBZ65iGCQey2/1F
	R+pT0DuwGHaOXQaP3PIBrhMWsQQelLoSaMPxbS85vNh1VVLwQraBE6xVGK/0ShIgHP6MeZEQwG6
	eI7b9MN0lMyaL7w5UIk70OtVRB6VcmyKzWPcCF1D1wPLpslCLZnqhNVvCeeHv1E7399MFuK00d8
	eCxWHxpEZbriRhsKjNuQCb1+crp9IZNtGUWqRtOk838/YBS1wmZD+ZMhFEZMGbhK+nbmq8J8LZ1
	rJLl4wPqmFaw512WCZt5KumWQCLNYE9bMttp8hBU+CDanieYlB1SeEC0mxsUsPhXwGhfosE3s9S
	c64eyA46QdJmzhS8cBOLRfJ3S8t/HLJwvM
X-Received: by 2002:a05:6000:46d9:b0:48d:fa9c:7838 with SMTP id ffacd0b85a97d-48e5d567dd3mr1945784f8f.2.1793158324146;
        Tue, 27 Oct 2026 20:32:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:03 -0700 (PDT)
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
Subject: [RFC PATCH v2 08/13] lockdep: Prepare IRQ-on state from a hardirq return tail
Date: Wed, 28 Oct 2026 04:31:22 +0100
Message-Id: <20261028033127.82193-9-kmehltretter@gmail.com>
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

lockdep_hardirqs_on_prepare() rejects any live hardirq context. An ordinary
hardirq return tail needs to retain synthetic hardirq nesting through
traceable IRQ-on preparation. This keeps callbacks classified as hardirq
work.

Factor the common preparation and add a return-tail variant which requires
the synthetic hardirq context to be present. An interrupted outer hardirq
can contribute additional nesting. Keep the ordinary helper restricted to
zero. Neither helper changes IRQ or hardirq state. The caller must remove
the tail context before lockdep_hardirqs_on().

Assisted-by: LLM
---
 include/linux/irqflags.h |  2 ++
 kernel/locking/lockdep.c | 43 +++++++++++++++++++++++++++++-----------
 2 files changed, 33 insertions(+), 12 deletions(-)

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
index 01dba8fb32a90..2ecd506715fa7 100644
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
+static void __lockdep_hardirqs_on_prepare(bool expect_hardirq)
 {
 	if (unlikely(!debug_locks))
 		return;
@@ -4442,10 +4434,11 @@ void lockdep_hardirqs_on_prepare(void)
 		return;
 
 	/*
-	 * Can't allow enabling interrupts while in an interrupt handler,
-	 * that's general bad form and such. Recursion, limited stack etc..
+	 * Ordinary IRQ enable requires no hardirq context. The interrupt return
+	 * tail variant requires its synthetic context, possibly nested inside
+	 * an interrupted outer hardirq.
 	 */
-	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context()))
+	if (DEBUG_LOCKS_WARN_ON(!!lockdep_hardirq_context() != expect_hardirq))
 		return;
 
 	current->hardirq_chain_key = current->curr_chain_key;
@@ -4454,8 +4447,34 @@ void lockdep_hardirqs_on_prepare(void)
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
+	__lockdep_hardirqs_on_prepare(false);
+}
 EXPORT_SYMBOL_GPL(lockdep_hardirqs_on_prepare);
 
+/**
+ * lockdep_hardirqs_on_prepare_irqtail - Prepare an interrupt return tail
+ *
+ * Like lockdep_hardirqs_on_prepare(), but invoked while the synthetic lockdep
+ * hardirq context covering an interrupt return tail is still active. An
+ * interrupted outer hardirq can contribute additional nesting. The caller
+ * must remove the tail context before lockdep_hardirqs_on().
+ */
+void lockdep_hardirqs_on_prepare_irqtail(void)
+{
+	__lockdep_hardirqs_on_prepare(true);
+}
+
 void noinstr lockdep_hardirqs_on(unsigned long ip)
 {
 	struct irqtrace_events *trace = &current->irqtrace;
-- 
2.39.5 (Apple Git-154)


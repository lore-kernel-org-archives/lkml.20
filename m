Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8264037CD2F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364886; cv=none; b=Wzo6JryOsd16dmtjfqp4GG39UpfIYa4myMJ7wMILtWrU0j6k9MG4UwPr9EnRBEuyHuD5u2OtLj0dZPoBU5B+h5egSJaPo/IMY1SgKNsy1eCJ7RXPKoOdWRhOwpfWpYWJLLDovW9Cdq9zeOnokfGvcDdt002GSdJsKoyv1P07Jso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364886; c=relaxed/simple;
	bh=bmZDrzPv7j28nzorU00vwOfoyhr0L6EkTjbbMFjV388=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MticbTrE5RyWj65lInCKbYjS7O9CbZjDPTS7Z0kIj14xoFFnWX06NtqSuabHOvKB3imRQbyhxeet3yoN0qzIFsRUS2Jkh4mGz/EFHAoEhPiXh61oolIZNaV3K75e6FJfTFDMi0LNgioiiZEhCM8K8OXYF7guaXHIdIlH/kn8Hss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qV2fPNBY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qV2fPNBY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482dd6ee390so2274409f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789364881; x=1789969681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFAjPxzAC+7uvdp4ugVfLG9EnUXAfU3b+9d5yWrMSJU=;
        b=qV2fPNBYM4h924rRdlbCQS+HKt/uZcM4Ejf6u2mQWy7I3riljJD52ppfRIuuyLQtHR
         ew18jYpFjJ3j9U6HoAv80ux9pUjF4Iw1jmohoAp2M8B4QArHhD2O1sWRkXHTG+6xEykY
         FHnR2nkbre8wYYIbVi94lcdv9e0shQPUb3mw2v9CNv0afiaXZ78/4A7VLsive+1gPIkh
         4QNdS99w7EDLDuota8mYQdoYNiUIC+i4OmfWPz+iH5GP5OcYkQZLmRiTT3Gt3KiXpabp
         vVxTf0yLBN4tjlGhBpQqm/n8+RG3pjXTNnZwyrNYGGuZoBqxG6d3wzL20rdmZK3cLz6G
         afUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364881; x=1789969681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gFAjPxzAC+7uvdp4ugVfLG9EnUXAfU3b+9d5yWrMSJU=;
        b=A4Gdo34P1piZIIXCTZShUz0jKEBU2n/+3pXNkN3W3PPyCGBW20W0op2HTRf8XCR9NQ
         bQvqRsmCNuz/upycjZEK38RyVStGWgYuBwVEA/EmHilMyuiEB0qhjbh85K6aPlkQEr6C
         19gArZ6+PETmJx3zwnldpaNjaVomE9eL1F509Gy3pVQ9ARcotc4hlGZp6KBkkOj5KK0+
         VSE3WDTaBCdZCjJFo45/7RhXKUJ4dJfe0TLMUTREX824TT8/VYTBpekZNWulmwtM/ME/
         JufLmkAUFivM09aEo3MQWBb39XlNrdXds0Sg4Zfa+EeJXVnUs4kom++qD01wNTbSYIlP
         HRfg==
X-Forwarded-Encrypted: i=1; AKwUvBz1pjFMEIJx6GjpUP+Qi5xAgNZDypmJ3SZk+iKlziTe3vJ8slObE66Ppa0CLu5DroCLniH9YHIyngqcD2E=@vger.kernel.org
X-Gm-Message-State: AFuF++mnNsea3x+LuhXpeKx2zEGSLa6Wg4ITYOH999wzLsiLkm0JYowr
	BK/DGjk4B3oh38JGEsABdapQ+NgitensWbMY/5xW1U/KFinaciQQWDjX
X-Gm-Gg: AYBFou2TxtjZInTPwoUqEIpI+4LSsm/1ylhyEJhnHlASPtXpJ5UfRJcmRv8XdFU/vJu
	v9NJjqAA+R4Gd/aHp035DGJHSUbUPWkjHUe7mW6TJMgiakZPRinEtI6JXEqTwETZIRcd/RNK1TQ
	eZgAyQNWR6s/FwpHTk5ToXfPQlAFW2CNfsDRDZDOFCUXz2db44fksgVgEwXX7wykIA7AlLg466J
	TBN/m3WaOg3RRCe8nFNigk3NQftGu61aj29pOgGtPpPCg1RgH7hOvSnWcECnQBjOQp5MxGjIkVE
	8k4+lKOKYZPyP10qWIJya43p9pJY1PLgYrG3cMhHeQKAUmrLisM/ISUTIiKKYp/LoD0OSgScMkj
	fGph42yqyzce8Yf/hGtIAw4aQToQ/FVJ3L5baAQ+kDmOYje0HwFsKXQ4LVafE0WF4CMaR2dtRN4
	QuBUW8f4HyNQgE0VS29WszVQGsatSySt0vbWGv62tv20mvZhTrZM8dCMLvPESuLI35zjBVyMImq
	9ZjC55Rux2ANfh8w41asZamq+b4Q2ojPrXsbI2JWl8fc6Cpmk6caiVjQDDgke/trBKf2VgE7Wj7
	ZKSke1SqvCku+bpiq+NbW2HohbGnnbw=
X-Received: by 2002:a05:600c:3586:b0:49c:ee01:8c53 with SMTP id 5b1f17b1804b1-49e7a65c7bamr12745825e9.2.1789364880534;
        Sun, 13 Sep 2026 22:48:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-122-014.77.7.pool.telefonica.de. [77.7.122.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm214537735e9.5.2026.09.13.22.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 22:48:00 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <include@grrlz.net>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] hrtimer: Pause KCOV during deferred rearm
Date: Mon, 14 Sep 2026 07:46:29 +0200
Message-Id: <20260914054632.12877-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260914054632.12877-1-kmehltretter@gmail.com>
References: <20260914054632.12877-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deferred hrtimer rearm can run after HARDIRQ_OFFSET is dropped. in_task()
is then true, so KCOV attributes the instrumented timer-reprogramming
subtree to current.

With CONFIG_KCOV_SELFTEST added to x86_64 defconfig, the interrupt
selftest fails under QEMU, detecting spurious coverage in
__hrtimer_rearm_deferred(). The same happens on s390, RISC-V and LoongArch,
which also enable HRTIMER_REARM_DEFERRED.

Excluding the involved files instead would cost their coverage on real
task-context paths, e.g. the hrtimer and timekeeping syscalls.

Take the kcov_pause guard in an __always_inline wrapper around
__hrtimer_rearm_deferred(). Use it at all call sites, including
hrtick_schedule_exit(). Callers that may run with KCOV enabled for current
are built without KCOV instrumentation or marked noinstr. HAVE_NOINSTR_HACK
covers pre-GCC-12 x86. The other affected architectures restrict KCOV to
GCC 12 or Clang through ARCH_WANTS_NO_INSTR. This avoids relying on
__no_sanitize_coverage, which is empty before GCC 12. Tested with GCC 8.1
and 15 on x86_64.

A later patch also pauses __schedule(); keeping hrtick_schedule_exit()
guarded here makes the deferred-rearm fix independent of that scheduler
change.

Fixes: 15dd3a948855 ("hrtimer: Push reprogramming timers into the interrupt return path")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
This patch depends on patch 2, "kcov: Add a kcov_pause guard".

 include/linux/hrtimer_rearm.h | 18 ++++++++++++++++--
 kernel/sched/core.c           |  2 +-
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/linux/hrtimer_rearm.h b/include/linux/hrtimer_rearm.h
index 17a81826bd9a..cd935bab3da3 100644
--- a/include/linux/hrtimer_rearm.h
+++ b/include/linux/hrtimer_rearm.h
@@ -6,12 +6,25 @@
 
 #ifdef CONFIG_HRTIMER_REARM_DEFERRED
 #include <linux/irqflags.h>
+#include <linux/kcov.h>
 #include <linux/lockdep.h>
 #include <linux/preempt.h>
 #include <linux/thread_info.h>
 
 void __hrtimer_rearm_deferred(void);
 
+/*
+ * KCOV: Pause outside __hrtimer_rearm_deferred() to suppress entry coverage.
+ * Callers with KCOV enabled for current must be built without KCOV
+ * instrumentation.
+ */
+static __always_inline void hrtimer_rearm_deferred_kcov_paused(void)
+{
+	guard(kcov_pause)();
+
+	__hrtimer_rearm_deferred();
+}
+
 /*
  * This is purely CPU local, so check the TIF bit first to avoid the overhead of
  * the atomic test_and_clear_bit() operation for the common case where the bit
@@ -43,7 +56,7 @@ hrtimer_rearm_deferred_user_irq(unsigned long *tif_work, const unsigned long tif
 	 */
 	if (unlikely((*tif_work & TIF_REARM_MASK) == _TIF_HRTIMER_REARM)) {
 		clear_thread_flag(TIF_HRTIMER_REARM);
-		__hrtimer_rearm_deferred();
+		hrtimer_rearm_deferred_kcov_paused();
 		/* Don't go into the loop if HRTIMER_REARM was the only flag */
 		*tif_work &= ~TIF_HRTIMER_REARM;
 		return !*tif_work;
@@ -55,7 +68,7 @@ hrtimer_rearm_deferred_user_irq(unsigned long *tif_work, const unsigned long tif
 static __always_inline void hrtimer_rearm_deferred_tif(unsigned long tif_work)
 {
 	if (hrtimer_test_and_clear_rearm_deferred_tif(tif_work))
-		__hrtimer_rearm_deferred();
+		hrtimer_rearm_deferred_kcov_paused();
 }
 
 /*
@@ -78,6 +91,7 @@ static __always_inline bool hrtimer_test_and_clear_rearm_deferred(void)
 
 #else  /* CONFIG_HRTIMER_REARM_DEFERRED */
 static __always_inline void __hrtimer_rearm_deferred(void) { }
+static __always_inline void hrtimer_rearm_deferred_kcov_paused(void) { }
 static __always_inline void hrtimer_rearm_deferred(void) { }
 static __always_inline void hrtimer_rearm_deferred_tif(unsigned long tif_work) { }
 static __always_inline bool
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 7885ff76e69f..ae97c63842a4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1020,7 +1020,7 @@ static inline void hrtick_schedule_exit(struct rq *rq)
 	}
 
 	if (rq->hrtick_sched & HRTICK_SCHED_REARM_HRTIMER)
-		__hrtimer_rearm_deferred();
+		hrtimer_rearm_deferred_kcov_paused();
 
 	rq->hrtick_sched = HRTICK_SCHED_NONE;
 }
-- 
2.53.0

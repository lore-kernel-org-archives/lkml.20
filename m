Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4D54D9F8F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226707; cv=none; b=RNTkne/5aHquAUJUwPLbVdBxP9CGp6llV9wHAKA0tczmTmp9ZljV/sR6t3prZqk9Dyt20MRTXW8lNRa9lHw2Iyr6Acmu3RtPuWUNqje3Q8ROKNCvdN1v9LFkFNwerC462L8W59PTIYVvYvh582If5nz5ck0wBwFGWHFvblqsYE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226707; c=relaxed/simple;
	bh=WX3y0A1ebAe6pR20v4B/6vO/77pOhDpweuxCf5B8G78=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j7djSBT/eidMGX60+VBjuXGQvPyNC5MBUMxIU/JDgSrZ1vBf5LHs4besBBaXFsJCxj0iJnqTZGar+G61rcKmxBalz5EhLWiQlV7vum0M3bbN6nDolsucfJpisatBrQ0JdiAyhNI+E9+RyHyPiqRtdOmSnzv4wZSB/OWdqphOqrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIV419uA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIV419uA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1626d6a6cso12908365e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226704; x=1791831504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eZ7uO448g6yOkrX0DXhajzQSvmZCKPSGAdZSi0RZN4=;
        b=gIV419uApHavaLL1H9hGk5VDuKuhjNMx3PWRMVtWJOyDaMZUDdzD6u6944V3p8SEvV
         6AZL351ONO+YmpTvLV4w8SxDrJrUQclrFSVssUpEmmbsp7Np8ZA483+LkcDxwW6iV+xD
         MVANe4YGeRkUj3HMYcWc9IrQCTjZczgwuuBWggudNC+sb3lKAU/SMlZxh21Jckhang5D
         NE6E+72lYVSLmuxJjB4zUP0x9BPUhmd0sPWrPVx4bA46SuuNIKRlVgS+DkeGDwilZ5yp
         CoFo36FNufGIvA6QHrAH7VVa6KrY/MJ6H5iYcCAwZfDvYWt+o/+c22v5T8ww8OmuMkHS
         Ttpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226704; x=1791831504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0eZ7uO448g6yOkrX0DXhajzQSvmZCKPSGAdZSi0RZN4=;
        b=w+D4yyIyE1Pg2KIQpV8ThePc9c+28fWgsFudYGQ6rZAsgpY4L/X1IZEAFhUJIAIa7T
         KBdVqSExGzTWe5ysLiuFcBBi50bYzk0EbYVVdwxvvxUt4KXdz2LwgILL6+mumd9dbZa5
         kqZ4kXzDx8R6xMfnfYKihEcM98FMptM7mCm67+ZG/2M/Vx6i1zEwQC4hv6itNKuX08NU
         CYsRsP+WHWE1DKULgWYc33uwsvi5tI1d9EF/buayelRbSeosxu+dcQZERukyiy+CWxfx
         gWO8OFmTILF6lqFIDN9X4AD2s8xPF6UT9r3+rYKqlqkcPzZsVYpub8U6FQKfNE1FC2nN
         uIMg==
X-Forwarded-Encrypted: i=1; AKwUvBzvk3OtUmXS9UjcfGG09upUaC25uv4vtwtIQAMHfSnelpYQswXlU7lc6wDArHvMuQa+SAuph1VWeJXxz84=@vger.kernel.org
X-Gm-Message-State: AFuF++lGxk67T9rCk8WpcpBCJM6s9s+YuE4px3us/WklUlQWlF8Fkzq6
	jdJYeKcXcvmnOYk4gVSyaGtCp86mm/XRU+7g+y0jcQzrkYnQt2nfE/Hh
X-Gm-Gg: AYBFou35qTHezucB9/hA6mmvoihhlb0WXH0Cbd8Qepdc+UXsGkbhwQLySTxC3Lgy0WC
	lX/tiGLKv8YfrhGT6kR+JTI29TGfAa9zOBGrhQL4pNfT2IZ2cUcqOX8GhpVyxG9znGdl7zSMWTa
	kWyGL7Mr7KG7xVGBRpnynltGhzw7Iunv3uCbwxsYhOeEBRixR4Iq5kTdukzviVhK7t42pi9z0b6
	kDKXR1L09WJ1Ptz8D6YV4NlkJR4XepZXpOEB0G49VKsbl5Ufw/v6QmrCpTcKBMRYWMQa/PDKMii
	qziK+nT3yZjuiOs9S3Yqa5goCbMJyxc44ijiU4swwxLn1Cijc3JY03CUVgQLVz54TZuGXn/7Rum
	jZHWN7h0FOACcvS3M7uhS9PNPg5MpquCA5WO3yLLAhUlcjC4ZUYG90h97vbPIkd9hkghp93JThz
	iRXfXZGzhRp9+D0/dttM2o+QWD+mO5fD2An85ughcP9wnscDub25hSlrH5Cdc0QP3oJA302zVfW
	ZGX62weERsDjgcsmw2xGXE7atWcSfXtkzeDf58tVWpZTY+NADL8meITWtF84vFLDPlrBkPKeTCz
	rDs8sdioFMyDDuWGgMFKVyOkmESVJ+ObiOe2BLKlejs5tsQQ4t6awMoHHAkJ7yaNmQM9po3mfcf
	y5g==
X-Received: by 2002:a05:600c:6085:b0:4a1:69fd:f90a with SMTP id 5b1f17b1804b1-4a1772b1c9fmr21984425e9.26.1791226703514;
        Mon, 05 Oct 2026 11:58:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm281196795e9.2.2026.10.05.11.58.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 11:58:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <brads@mainlining.org>,
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
Subject: [PATCH v4 3/6] hrtimer: Pause KCOV during deferred rearm
Date: Mon,  5 Oct 2026 20:58:00 +0200
Message-Id: <20261005185803.39170-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005185803.39170-1-kmehltretter@gmail.com>
References: <20261005185803.39170-1-kmehltretter@gmail.com>
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
index 1fe40de6ebe3..87cff2884980 100644
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


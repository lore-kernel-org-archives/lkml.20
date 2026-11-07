Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057453;
	b=TBB/wRaDcLLkOLXE9qDPb3M/c0eiaZ3+rA6dqFzSGyNWHuNbk46Mf4vHDRfeKpCaNDUI
	 pFrB4Oa3OwPrU5dPYDr67me6ctrptEAZnfCWx1CHMSOiRa0M95rK5HW6YH3Ec4Klr6LPE
	 JdMod6DRbnhQkU5xdTa2LOXfKIcK+iEnD3xwHYAwmrMmY4/j1xdgXyM5TfHXizA8qHbvH
	 zx5/se9jAiJ6eWmBpKsqRrw6ju0U9QiHyryqG7i381Pw5RUT7gav26f1kBIvK80mP/oZG
	 VEg2jG1iQnqKhvDTkVOkNb7KWztuDBNxp0z8Dp7/h4pB8riUq+KTqA+JaLh5dFrhJlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lUMGRPQKK0YziSwuHZdCLQr3adBDCdp+cKA6XOKv3jc=;
	b=x45fqIplzpM3JrKpo2H5RQAYFPc3mmhX9MXkbZPj9hX6bVDh00DRQV8FEAxxpWWWapX4
	 ceIAz8pUhChkS4nGaPMdkD47iMOCHyAUpaLURCdESHvnrzh3nZWVHV4xOdFynSWFAy/y3
	 hM9n8TKSY/cTyxmhWEFj0znQwXN0awugS97QaWurQbZlQtyCFhwUZ/CYyGLoKx+75sjgt
	 UbDJVsaRXid1sQI/j0G3xavjU0xAANRntIx7xxqW+Irh2/UzDHiwLUxBiZiSOBwOEcLZl
	 xhn1lCFGM5A5uX/tFyep/mPcePaxg9J1BQt4YXnlKYLcjDFTkbY/Jw+CiFOgv/xkraQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwlRAQV0;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D90606A334
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4D90606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwlRAQV0
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso12487045e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057451; x=1794662251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUMGRPQKK0YziSwuHZdCLQr3adBDCdp+cKA6XOKv3jc=;
        b=fwlRAQV0OjVDHx3yHIhV1GRTh/XbD/tmYnw/w4qdhInde5BL6qVBlTK0tDL4eQL5VI
         GGxg+cK4CYkje40dTrbRWdc/ggIlKh/kMjTCSl3bZrJT1x3xbp0AEES0lMaD2R9NxbdJ
         Q3EqxzSguUYo+T6s/GZ+swnzgpy1bcbDAEZyl7qxWmFGoHFQD6Dqofq4c+iXgBkIevx6
         hBnH+VCnZ8K/3EvBrzyYUmn4cLTnkL375GIr0DRIAywqRJeJ70X+UnoHAHg+9C7iMU4f
         4AxUIMlh+NNAMkrJitzM3FVJw3U0DeJc49gfnOCcbm4xBu7mADJyj8Ff9RBa7QwNC/4A
         IRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057451; x=1794662251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUMGRPQKK0YziSwuHZdCLQr3adBDCdp+cKA6XOKv3jc=;
        b=lMLn6yA+CeV0rqpnIIpOeq7+XnHQ7/brZ/FmcsJGiJe0k/VCt4arXH9cgyVh/lD1my
         a3fXiIcH+OC2MugJKHcLBho8tVfa2l2oWAIxMpulC+jF0bXfGpSeMHeuxBcOQOU5l18O
         JZfiLq7yuoOWfmxkr+fNZWCXyJ6tEe3hBdAwIfBFrkbbWJikWGoBm2kM+gGC4ddfL4vZ
         hfdSw0wdW/xLqU8T1Xe6N8EQuX1qSwj0p+mD1KolGr27p+YL2BP6wJsk03Nmqc1ZF3vl
         CR97o5vkTcOpHwbdBo98As2N3AfGi2QARI/8sZ0RYu7xy6AB7L09vTZpkt0i0IjSgQKt
         s1xQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3oRORVt7FApAQnJQL+mTBSrZ83ZIB3kQ2cr7wKCGuH4aqw1bFdhYKSyGgGyHosUn+fZth62S9ADndYTs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jmFtIezBu7KZRh8gJB7SCNcBS7Ah8n2ZhWxXa/CMl+DPGHkOQ
	evK7rCF4eb+dKJGO7Oa6NcdF7I8S106yd3p/PMp2IzFeF69zkY1atBAW
X-Gm-Gg: AYBFou2ejZAxQ39ceiwW3v6oXnfwrkv0gR8vpexgSjk9Q6YS3y38NpPJlqvZgO2V769
	aVOlZZ51uBLQX6xpymGKlfPnWBLLa0D1+qIwGnwfHLoTcCAsZO7o4KH7PdMZkHWVpO0k9bvO0LE
	OjjCmi+c9takj2iqdD77MrHA4m884hsDZDV5+21unF07TJ4D9R6vlnifvwSyqzW4mOvS7uSg/3D
	2IhM4HHNOZwHN7A0X1J2HOdanlDApdMH4UkydrFysd2vtJGR7u38pr7XuDDiH49T5Ubx4n8JqMN
	ZYBr49UJjb0vmdsfknkzb4zjNGj9MTkiaYnOciEmz5Y+c9dy/Mqx+jSTNPBwmVds71VqlRAYmUS
	EqxpHGMR0VNIb1cTSMQM3W+v9x3TRQI9ceJt+h7Dnc3jGJPHBg3D0dyegFdWvpSjy3+qa643+Pd
	I5v5TxIDKxi5GtA0ep/HRlJ7/MV0WV5dxhssOkjRPfpDQ5Q2VqvzL417aENE8fdWgVEVaF17edL
	6YAndD69kRcPThCjvFFGjdJRu3q2l2en8s5mFXhP2LCb8aFAP7AlNx6BDTuJ2IoRNEz5/cqTMOF
	i62ByzStMdZz6jR3lcjOz7JbBY1r9fcqtgOgKP0DlFQs1P3aCZ8G875M3V+/f9VBsiN91r7wrrr
	W2/BFworOn30V57lF+5wKB5//EhHhpJtAHzfWbUHZ92/Vzgu15E+bF8kBigwG3pAV/FVOSu2Ilc
	vnN3r+8YBZfefEEEdXNwWO9kpMPldjVO5dYyTLswtlUgdFobGsBmAz
X-Received: by 2002:a05:600c:a308:b0:4b7:6b0a:a2f6 with SMTP id 5b1f17b1804b1-4b76b0aa492mr50947135e9.21.1794057450936;
        Sat, 07 Nov 2026 05:17:30 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3279f9csm65132675e9.8.2026.11.07.05.17.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 05:17:30 -0800 (PST)
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
Subject: [PATCH v5 3/6] hrtimer: Pause KCOV during deferred rearm
Date: Sat,  7 Nov 2026 14:17:07 +0100
Message-Id: <20261107131710.89264-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261107131710.89264-1-kmehltretter@gmail.com>
References: <20261107131710.89264-1-kmehltretter@gmail.com>
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

Deferred hrtimer rearm can run after HARDIRQ_OFFSET is dropped. in_task()
is then true, so KCOV attributes the instrumented timer-reprogramming
subtree to current.

With CONFIG_KCOV_SELFTEST added to x86_64 defconfig, the interrupt
selftest fails under QEMU, detecting spurious coverage in
__hrtimer_rearm_deferred(). The same happens on s390, RISC-V and LoongArch,
which also enable HRTIMER_REARM_DEFERRED.

Excluding the involved files instead would cost their coverage on real
task-context paths, e.g. the hrtimer and timekeeping syscalls.

Pause KCOV with kcov_pause_scope() in an __always_inline wrapper around
__hrtimer_rearm_deferred(), and map the wrapper directly to
__hrtimer_rearm_deferred() when CONFIG_KCOV=n. Use it at all call sites,
including hrtick_schedule_exit(). Callers that may run with KCOV enabled
for current are built without KCOV instrumentation or marked noinstr.
HAVE_NOINSTR_HACK covers pre-GCC-12 x86. The other affected architectures
restrict KCOV to GCC 12 or Clang through ARCH_WANTS_NO_INSTR. This avoids
relying on __no_sanitize_coverage, which is empty before GCC 12. Tested
with GCC 8.1 and 15 on x86_64.

A later patch also pauses __schedule(); keeping hrtick_schedule_exit()
guarded here makes the deferred-rearm fix independent of that scheduler
change.

Fixes: 15dd3a948855 ("hrtimer: Push reprogramming timers into the interrupt return path")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
This patch depends on patch 2, "kcov: Add a kcov_pause guard".

 include/linux/hrtimer_rearm.h | 23 +++++++++++++++++++++--
 kernel/sched/core.c           |  2 +-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/include/linux/hrtimer_rearm.h b/include/linux/hrtimer_rearm.h
index 12e42721c8e0..b0fd7aaff538 100644
--- a/include/linux/hrtimer_rearm.h
+++ b/include/linux/hrtimer_rearm.h
@@ -12,6 +12,24 @@
 
 void __hrtimer_rearm_deferred(void);
 
+#ifdef CONFIG_KCOV
+#include <linux/kcov.h>
+
+/*
+ * KCOV: Pause outside __hrtimer_rearm_deferred() to suppress entry coverage.
+ * Callers with KCOV enabled for current must be built without KCOV
+ * instrumentation.
+ */
+static __always_inline void hrtimer_rearm_deferred_kcov_paused(void)
+{
+	kcov_pause_scope();
+
+	__hrtimer_rearm_deferred();
+}
+#else
+#define hrtimer_rearm_deferred_kcov_paused()	__hrtimer_rearm_deferred()
+#endif
+
 /*
  * This is purely CPU local, so check the TIF bit first to avoid the overhead of
  * the atomic test_and_clear_bit() operation for the common case where the bit
@@ -43,7 +61,7 @@ hrtimer_rearm_deferred_user_irq(unsigned long *tif_work, const unsigned long tif
 	 */
 	if (unlikely((*tif_work & TIF_REARM_MASK) == _TIF_HRTIMER_REARM)) {
 		clear_thread_flag(TIF_HRTIMER_REARM);
-		__hrtimer_rearm_deferred();
+		hrtimer_rearm_deferred_kcov_paused();
 		/* Don't go into the loop if HRTIMER_REARM was the only flag */
 		*tif_work &= ~_TIF_HRTIMER_REARM;
 		return !*tif_work;
@@ -55,7 +73,7 @@ hrtimer_rearm_deferred_user_irq(unsigned long *tif_work, const unsigned long tif
 static __always_inline void hrtimer_rearm_deferred_tif(unsigned long tif_work)
 {
 	if (hrtimer_test_and_clear_rearm_deferred_tif(tif_work))
-		__hrtimer_rearm_deferred();
+		hrtimer_rearm_deferred_kcov_paused();
 }
 
 /*
@@ -78,6 +96,7 @@ static __always_inline bool hrtimer_test_and_clear_rearm_deferred(void)
 
 #else  /* CONFIG_HRTIMER_REARM_DEFERRED */
 static __always_inline void __hrtimer_rearm_deferred(void) { }
+#define hrtimer_rearm_deferred_kcov_paused()	__hrtimer_rearm_deferred()
 static __always_inline void hrtimer_rearm_deferred(void) { }
 static __always_inline void hrtimer_rearm_deferred_tif(unsigned long tif_work) { }
 static __always_inline bool
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8c..3f13170c2939 100644
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
2.39.5

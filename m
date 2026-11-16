Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815688;
	b=XvgxNteM5PtuKXPaE0H94o/NVCgDCEt616jVOWUVd9v77dZc7uH+PP7v01HXIfH7O83Q
	 r62oBK/oIy7mWjeTTc009necQbZFyi4NftPiW/AcLjVZlB216VZqnlmJ0h9Sx1Qj6uibE
	 2J/iTthsvYwzjj2T8r29lA4Vs+SGE2RIPx49tEvb3jvtK6PooMeDYzGiTuXiqyVuo+s/D
	 LABoDjRQaKBXyAJfHFMGeSJ2iX8i+hPwfWNAsyDgGqZQKH40Zu+qjtpgufN9zpyCv3F3w
	 dQl3OEpReuFogxGb7PuEeLcydBDgT/bMn2uHBiusq0S5ODbMqpjfL0xgxnqCLpfpQyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V/ALRmUD/hAy570O2Xf1osysz7Ylv+AoJE5xebVPkiE=;
	b=cTF9oR7KGMyUak+RyGBzlcKCaaZcQhwikJeMuD6rv+2+S+49dcQpXLqTFpa8Ntiql3qd
	 pT3Id6Tl/2tZjR0yHl4ztgG36GN0kvYNgIkXzBQUf5N85YVtiwtWYCLD/VLi5N96Pn7eo
	 zvRzTOvFwx4U74BUjhNZxaQV27nVda0mihDbuNB1cX+vqlsTPPVLIaMfq2MIHKPUmTgh5
	 6H+dm82Mhy/ro8RsXwkMusSfTIm+IXBbIDwjumzj8Ozx727uwPDMQrqqVBcyv5BDS9aKr
	 44GhwWw/hioJnDfwTMugYZxu3f8MiGzIIMjTdifYjuXgk0xu2nwXi4cjCC2N6hW5t4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvZjNdHq;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F95E606A883
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F95E606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvZjNdHq
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1648083f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815686; x=1795420486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/ALRmUD/hAy570O2Xf1osysz7Ylv+AoJE5xebVPkiE=;
        b=fvZjNdHq+TzTFxD8WAWKmO3XhCPWghE4pID+d8gCU4kYBuG9N+vRpmIw2el5mQ2vgR
         173Z+k08ZqqHeEfuS0p+Q7KxYhIlOGp5AiP0o2TMTdJtRgp3T/Egm6KHcRSiE3ZNW0TQ
         8cFQZ1LlM4gHVxWHiH4ojeUbXTEgVXUWLL70LNPP9VL4/B4TzefBch/qZ2yekteG8c6p
         z5GCH3H3Mhgn8rfVzvnmOSAgVWvuZOaIkGnd+sFc/DCBFIIHidQoyy4OiaBXzzC0Jk1r
         VcfxEzctgflDlFSKtEHB9rLIqSMCeZoMBjZf1yZ0VR851oTEKzCuirCdjH+5MwCdWC6m
         7e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815686; x=1795420486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/ALRmUD/hAy570O2Xf1osysz7Ylv+AoJE5xebVPkiE=;
        b=BqTOrkw3/3smWtTs9xHFYLn2/8jpPt1luKzGHiXMkFhgR7zzHiMzYB0bJtHmvN0w5U
         4uU/tFbVPiwblqJ/tYRn2G5efEzq4XPNMc09cBYp0kXqpsmhusD9SKvWR67JOUVAKcaS
         0Dsn/6BQUtcMvj/QjI09BlE1oUpXHEXKXiY+mm70OVqFsv1dS9W0OTjZQJTfjtbjvGR4
         QrQe08OhgKAGNq3AkJbggioCAArywzOjqckkXtl134lRfCecnQsATKFE5EJ+1MxQPm0J
         X6ffmGreYMS9p4PJtQYm13f08P+Xu/frb0Y9DPSfEYnXVyKShimYE8pHp00u+Rv4+J7t
         zCHw==
X-Forwarded-Encrypted: i=1; AL+hErHEfVG7d0GnSukkWPBf4NMsz9uq6WN2e99tJbOhrWSUJbh+N2Rhj6n651SmBvwJmV9TkYvzH0KDfP8IHLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3PWyWDcuWvIVRGnvPrtW7G6C6Bse9XUMr3jlKQJ0PzG0IHuOS
	SdmEydQ2Ex41JEHJhCLmS4Nsu6P7jnjMZcIGGx52PwFNw8+lcG+eYuuh
X-Gm-Gg: AYBFou3izHnlDFNzPGbKN0y3DVFxiJq6w+LBIaCvJ1emiYFZMQX9SUQblFUd50rx5pk
	I8NP7MCcZzRmVKZlY4rOvOBRWaVQl7egq+D+ogDgICN2F/RhAFXSTYowEoTVue2Dhc7WtgHAmsL
	sV/4YP4wz9gHlKwM4YzDr9d2Tbc9mFeZCzMcYp7A17D9+/grBgkNpSDQegge4s4DOPZNmJxOePJ
	e0ve47C1WvMsOENSaOzR28hXFhy45vz87PfmJ4/kUPCN3wxKEX4L12kd5zpBzBFS78S9i/JHVJ9
	oN0YYsfUvdFe33Oap+tB1sEAuKhbGR3C/FPheKW0lz2Bo+NadMqt79h5KuAlPoMQlj64K6j5DDk
	lj5vRpu84N3lobd6KggRk9AljY396wTJMqrDF1ZfiY/uXRszeopE4kS/gRJNdbdM27yGAbRXYcJ
	v+TLpRj+ASOJofaD3l+m9oQF+qMeKsHM9w08H9woFjAsJGnBArGN7R8IVpZsTi3qC0E0x1adrue
	QIkvUbvRwcLiIiuSrwvfwY3+jijYj3RqQjt1PAyt5qQZT6ov9c30kD+FYl7CQDg8Lwbpm9Tlzbr
	rRoKSA/jguE/zQoXsBCBYvkOkbbeHVg+NBZbKNQ5l4CUEuJDHXxBg3mYcaACJTgJF/ll5AqUfcR
	WNEt9R4NZWL/yHEetZiE8ZJl8yXeIXm+mEHHXK3NSpjMy8YhWkziPjJyJ66cGcUkj9Vlsgl18M1
	pwuR0RNUSM0ytQ4UcsKzcShzOBhG8z
X-Received: by 2002:a05:600c:a010:b0:4bb:6238:cd81 with SMTP id 5b1f17b1804b1-4bb6238d365mr123245015e9.10.1794815685909;
        Sun, 15 Nov 2026 23:54:45 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-148-032.95.117.pool.telefonica.de. [95.117.148.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm210329875e9.14.2026.11.15.23.54.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:54:45 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] sched/preempt: Check preempt counts in notrace helpers
Date: Mon, 16 Nov 2026 08:54:24 +0100
Message-Id: <446e2bd042ce071da52ea80f577fe43c1b3dc031.1794814699.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1794814699.git.kmehltretter@gmail.com>
References: <cover.1794814699.git.kmehltretter@gmail.com>
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

The notrace preemption macros use raw count updates even with
CONFIG_DEBUG_PREEMPT enabled. They therefore skip the bounds checks
which ordinary preemption operations provide.

Add checked noinstr preempt-count helpers and use them in
preempt_disable_notrace(), preempt_enable_notrace() and
preempt_enable_no_resched_notrace(). Export the out-of-line helpers
for module callers. Keep raw updates when CONFIG_DEBUG_PREEMPT is
disabled.

Share the validation with preempt_count_add() and preempt_count_sub(),
while leaving their preemption-latency tracing and ordering unchanged.
DEBUG_LOCKS_WARN_ON() brackets its diagnostic work with
instrumentation_begin() and instrumentation_end(), but evaluates its
condition before that region. Branch profiling would therefore call
ftrace_likely_update() from noinstr text.

Compile core.o with branch profiling disabled when DEBUG_PREEMPT and
TRACE_BRANCH_PROFILING are both enabled, as the scheduler Makefile already
does for build_policy.o and build_utility.o. This keeps valid notrace count
updates free of profiler calls while retaining the existing warning path.
The tradeoff is loss of branch-profile data for the rest of core.o in that
configuration; scheduler tracepoints and function tracing are unchanged.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Link: https://lore.kernel.org/r/20261029093219.GH1779021@noisy.programming.kicks-ass.net
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/preempt.h | 22 ++++++++++++++++++----
 kernel/sched/Makefile   |  3 +++
 kernel/sched/core.c     | 40 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 06ff44a4b8b6a..42c585fd91d45 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -217,6 +217,17 @@ static __always_inline unsigned char interrupt_context_level(void)
  */
 #define in_atomic_preempt_off() (preempt_count() != PREEMPT_DISABLE_OFFSET)
 
+#ifdef CONFIG_DEBUG_PREEMPT
+void preempt_count_add_notrace(int val);
+void preempt_count_sub_notrace(int val);
+#define preempt_count_dec_and_test_notrace() \
+	({ preempt_count_sub_notrace(1); should_resched(0); })
+#else
+#define preempt_count_add_notrace(val)	__preempt_count_add(val)
+#define preempt_count_sub_notrace(val)	__preempt_count_sub(val)
+#define preempt_count_dec_and_test_notrace() __preempt_count_dec_and_test()
+#endif
+
 #if defined(CONFIG_DEBUG_PREEMPT) || defined(CONFIG_TRACE_PREEMPT_TOGGLE)
 extern void preempt_count_add(int val);
 extern void preempt_count_sub(int val);
@@ -231,6 +242,9 @@ extern void preempt_count_sub(int val);
 #define __preempt_count_inc() __preempt_count_add(1)
 #define __preempt_count_dec() __preempt_count_sub(1)
 
+#define preempt_count_inc_notrace() preempt_count_add_notrace(1)
+#define preempt_count_dec_notrace() preempt_count_sub_notrace(1)
+
 #define preempt_count_inc() preempt_count_add(1)
 #define preempt_count_dec() preempt_count_sub(1)
 
@@ -263,7 +277,7 @@ do { \
 #define preempt_enable_notrace() \
 do { \
 	barrier(); \
-	if (unlikely(__preempt_count_dec_and_test())) \
+	if (unlikely(preempt_count_dec_and_test_notrace())) \
 		__preempt_schedule_notrace(); \
 } while (0)
 
@@ -283,7 +297,7 @@ do { \
 #define preempt_enable_notrace() \
 do { \
 	barrier(); \
-	__preempt_count_dec(); \
+	preempt_count_dec_notrace(); \
 } while (0)
 
 #define preempt_check_resched() do { } while (0)
@@ -291,14 +305,14 @@ do { \
 
 #define preempt_disable_notrace() \
 do { \
-	__preempt_count_inc(); \
+	preempt_count_inc_notrace(); \
 	barrier(); \
 } while (0)
 
 #define preempt_enable_no_resched_notrace() \
 do { \
 	barrier(); \
-	__preempt_count_dec(); \
+	preempt_count_dec_notrace(); \
 } while (0)
 
 #else /* !CONFIG_PREEMPT_COUNT */
diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
index b1f1a367034ff..d87f1bd3c28c3 100644
--- a/kernel/sched/Makefile
+++ b/kernel/sched/Makefile
@@ -27,6 +27,9 @@ endif
 
 # Branch profiling isn't noinstr-safe
 ifdef CONFIG_TRACE_BRANCH_PROFILING
+ifdef CONFIG_DEBUG_PREEMPT
+CFLAGS_core.o += -DDISABLE_BRANCH_PROFILING
+endif
 CFLAGS_build_policy.o += -DDISABLE_BRANCH_PROFILING
 CFLAGS_build_utility.o += -DDISABLE_BRANCH_PROFILING
 endif
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1a088d4576f59..98ca93bc60887 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6040,7 +6040,7 @@ static inline void preempt_latency_start(int val)
 	}
 }
 
-void preempt_count_add(int val)
+static __always_inline bool __preempt_count_add_checked(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
 	/*
@@ -6052,7 +6052,7 @@ void preempt_count_add(int val)
 	 */
 	if (!IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS) &&
 	    DEBUG_LOCKS_WARN_ON((preempt_count() < 0)))
-		return;
+		return false;
 #endif
 	__preempt_count_add(val);
 #ifdef CONFIG_DEBUG_PREEMPT
@@ -6062,6 +6062,21 @@ void preempt_count_add(int val)
 	DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
 				PREEMPT_MASK - 10);
 #endif
+	return true;
+}
+
+#ifdef CONFIG_DEBUG_PREEMPT
+void noinstr preempt_count_add_notrace(int val)
+{
+	__preempt_count_add_checked(val);
+}
+EXPORT_SYMBOL(preempt_count_add_notrace);
+#endif
+
+void preempt_count_add(int val)
+{
+	if (!__preempt_count_add_checked(val))
+		return;
 	preempt_latency_start(val);
 }
 EXPORT_SYMBOL(preempt_count_add);
@@ -6077,7 +6092,7 @@ static inline void preempt_latency_stop(int val)
 		trace_preempt_on(CALLER_ADDR0, get_lock_parent_ip());
 }
 
-void preempt_count_sub(int val)
+static __always_inline bool preempt_count_sub_debug_checks(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
 	/*
@@ -6087,15 +6102,32 @@ void preempt_count_sub(int val)
 	unsigned int pc = preempt_count();
 
 	if (DEBUG_LOCKS_WARN_ON(pc - uval > pc))
-		return;
+		return false;
 	/*
 	 * Is the spinlock portion underflowing?
 	 */
 	if (DEBUG_LOCKS_WARN_ON((val < PREEMPT_MASK) &&
 			!(preempt_count() & PREEMPT_MASK)))
+		return false;
+#endif
+	return true;
+}
+
+#ifdef CONFIG_DEBUG_PREEMPT
+void noinstr preempt_count_sub_notrace(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
 		return;
+	__preempt_count_sub(val);
+}
+EXPORT_SYMBOL(preempt_count_sub_notrace);
 #endif
 
+void preempt_count_sub(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
+		return;
+
 	preempt_latency_stop(val);
 	__preempt_count_sub(val);
 }

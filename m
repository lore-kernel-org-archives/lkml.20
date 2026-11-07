Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057451;
	b=R08m685Ew5+18d0yfVPtKj+g/uWRk1Zageb/pHM17DdS6SeT7UIg5n6SJ3dLpGTllFwd
	 aeI735gL4sznNg3JYKlbbPeKwJjONLDbI1AhTHlJIfJqyQbflI1SG3GHslBz8ar3H08tT
	 w80Rv6EQyR6sTDnexaN8AqyhiHU/HdltFayybexYl5b4SRPHPSF5hpGlaSgHsPpWUIV+7
	 G+e4wpGW/xwdNCBLR0UNfNrRO4MuUT81VmGttoHe8DoFEgQxOPjb8FJcqNKYoGgUohV5z
	 xAOpxhrs6MeOViREXDPUe2c2meIPv4v6PNzMV2EMjyUoyMmYB9DfGeWUes4MPmesGLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f7hHMHm4WB1frdnfMK3rR7ZqF31yyOyM/lKH7fCZawM=;
	b=ep0YFLaEmu1/WNgLZjyHMyRb207aLZQAd0qJ83aTeqqlO9vAqAtN8oap326T4g+6Y/gl
	 IuiV+3XgT+RkfKzvw9rsl6j4qQ1Qf6HTM5JeLyLGiSUId0ZfLFPHBQakPWxdFjlgfU0dF
	 boMcXuvsAQ1q/euhRyDnQlNAns3TYrTRVOoYK4dMh0NuH2UCKcW+rPvUaBBcK+1EsEp4I
	 TqMZ5vzcrV4WlkPBIjUGeSsAkVuwlhTjSUQ0P5JS9lcZEDN0JdbxLO0j+pgme43BJ0Hfh
	 UDFAJP9VfTugxYkUb3bC6uusCSQt/sa0OzTBC26UQ36+RQeerlUoDOg0EuH+XPilONg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyeqbpXJ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065BE606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 065BE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyeqbpXJ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso4452375e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057449; x=1794662249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7hHMHm4WB1frdnfMK3rR7ZqF31yyOyM/lKH7fCZawM=;
        b=fyeqbpXJStId0UdKia6ZRVAA0O+CeBIygqGURAl8hsCqaCwWt32ye/5ahcvViGTNL4
         Z6XXXJJajYAqzxO45Umfr8/KB4cfj2Z6ti89zB1sXB5P6odOdKmk2xW77Gm+AYqn2dJ/
         ZqwFRzCTBWxieOcN3Tr+wBfO69Je28lgUpoueNE7jqo1Bj7AZJFFjDa9hwV/gXhyaH7a
         4MzzxE8RnO89ptOKWh4c7gweh9NjtajlBDizslMCTXNjnRsaDjYE88doLOF51v+Bqihk
         LhJktxvHQaYuz//9NUzdEGVxd+GeZkhEKs3UoUxxcvN7j4rJagSC8BSWwDrZD6ndfGzM
         lpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057449; x=1794662249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7hHMHm4WB1frdnfMK3rR7ZqF31yyOyM/lKH7fCZawM=;
        b=YuTg8gug14/rZkN/dOPuQxcSczEPr488bbw6L5A3ItywT4pDtYuYP70Qx/0reV4seT
         ZEosOK2ibEKSYqHAgPd+zUt0iOWZu1Fpb70R2avYS0PyyIlxha5nzapKbZ5kzVQ5zjpN
         kgn7qHnVwWBXE+JV7OLQpK5mnXZmmguhmX3OkPYMgVxuUb2jlWCtxPQUlnIxGUdZGJc6
         dRJQ+I0lWw+9gYQrTmL432WhFnOjndvNJ+yxJNDCwtUOsOD3oZES1+H+S9NDgb5ddI/N
         rTvKD5o5dZPXWrdhX0PurOYthXFE1TKhgH17PRT2GgubZmlB8i++Gw3GBuKdga/9mv/4
         ehig==
X-Forwarded-Encrypted: i=1; AKwUvByGieTIVX870kAGS9TlxE6CV/l6jBfaoX31OXKfMuuHZ4DdVuGgiWMbX2kNZdjLsrCfVWgmoQPDJQwg2aM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1b8z1sHs5cdvsDKU+KBK0FjnYn4TAlZp/d2LZsXaJoFS4eWY4
	o3IbnJSEPfUtCpFAdHgpqDdN9G9593yXVEo0FpqJ7OO4HYowX6rpG/pK
X-Gm-Gg: AYBFou0duoDI4rzHlQ+ltXrD6xbVuA0N+Fgtiu3bvUsBaF397CSoKn/vnfxQEQ6jHS0
	xPtmHttfLhFVAKBZiaT8iWVo+JvI/dGD98NUQFfwJGb4ZRkSwNtTelh35QKS06uV9SL8vmDzpp5
	y7ttQ3HOz3ndMOOf1CGsbfSAPMLEBoIBerfKTKb9NH/JjzYvEBbeu1APVqWfiP0n+1xJqCrHGbv
	hPGMawaU1WSLk3RZiTNRK3uNLUjpBVIAfRnQQFDHVuxDFqd5kHOlxQ4C8aaCZGBidP95elMPJ2n
	G4S/ZJX+SpaAeAFRZn6Xpxn9KnJPK11v1OgLxNLLisVrBp9dqMf1g/iAQZ4bTm6tL1EW7TkrMuy
	CSHznUTfNSo1FgUsD2ZoOvMH7+4rRDVik6GkCHWSZhY3g4BKRP1Oz8C57spTy7LnUS6fi8K0oXj
	EGbMJsbsa2PxnMICYjuYgsj0bdDT4znfIZVMkOphGgMxdY+vLA7FWA10dWrltbcgNnR2PVoxWi7
	OJoFFJLrLyriVlstTSYAWgU0dzvEBRowKHxKQfiyXqsYfdefrK+pcDv32wE65l8yX3h6MZotwZm
	T3gxUs8fistRBptX159mt3Ql2dNID3EJRfw2jLJBYBXObzsNClb5/6tnJ6FPOYK69qyWO/+3BYl
	WD9Zeh1uRdE6tB26NYTrB9SoGSiwWStq+WwT4X2dHw/Qr5RsWfc3k9Iu8HJlH/dLObeLK2/KZsg
	uUSYshHoCXaKfXB26N8KdajyyDyo8L9z4=
X-Received: by 2002:a05:600c:34d5:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4b6dc6df61amr97456735e9.4.1794057449178;
        Sat, 07 Nov 2026 05:17:29 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3279f9csm65132675e9.8.2026.11.07.05.17.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 05:17:28 -0800 (PST)
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
Subject: [PATCH v5 2/6] kcov: Add a kcov_pause guard
Date: Sat,  7 Nov 2026 14:17:06 +0100
Message-Id: <20261107131710.89264-3-kmehltretter@gmail.com>
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

Interrupt-return work can run after HARDIRQ_OFFSET is dropped, when
in_task() is true. KCOV then attributes instrumented callees to the
interrupted task.

Add a KCOV_PAUSED bit next to KCOV_IN_CTXSW and mask both in
kcov_mode_enabled(). The coverage callbacks need no new check because
check_kcov_mode()'s exact comparison rejects modes with KCOV_PAUSED set.

The context switch suppression keeps its own bit: kcov_prepare_switch()
runs on the previous task and kcov_finish_switch() on the one switched
in, so its lifetime is not a pause section.

The shared setter no longer sets KCOV_IN_CTXSW on a disabled task,
since its mode already fails the coverage callbacks' exact comparison.

Provide a kcov_pause guard and kcov_pause_scope() macro backed by flag
helpers shared with context switch suppression. The helpers access
kcov_mode with READ_ONCE() and WRITE_ONCE() and use compiler barriers
to keep instrumented calls inside the suppressed region. The guard
saves the previous pause state and restores it at scope exit, so
sections nest. When KCOV is enabled for current, remote softirq
sections save and restore the complete mode, preserving the pause
state. With CONFIG_KCOV=n, kcov_pause_scope() expands to a no-op
without defining the guard type or cleanup variable.

With CONFIG_KCOV=y, restoring a previously clear flag still writes
kcov_mode even when task coverage is disabled; nested guards also take
that path in this case.

The helpers are __always_inline. Guard users must be built without KCOV
instrumentation because inlining does not remove the caller's own coverage
callbacks.

Suggested-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/kcov.h | 80 +++++++++++++++++++++++++++++++++++++++-----
 kernel/kcov.c        |  5 ---
 2 files changed, 71 insertions(+), 14 deletions(-)

diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 895b761b2db1..7f3c34071f85 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -9,6 +9,9 @@ struct task_struct;
 
 #ifdef CONFIG_KCOV
 
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+
 enum kcov_mode {
 	/* Coverage collection is not enabled yet. */
 	KCOV_MODE_DISABLED = 0,
@@ -23,20 +26,64 @@ enum kcov_mode {
 	KCOV_MODE_TRACE_CMP = 3,
 };
 
-#define KCOV_IN_CTXSW	(1 << 30)
+#define KCOV_IN_CTXSW	BIT(30)
+#define KCOV_PAUSED	BIT(29)
+
+static __always_inline bool kcov_mode_enabled(unsigned int mode)
+{
+	return (mode & ~(KCOV_IN_CTXSW | KCOV_PAUSED)) != KCOV_MODE_DISABLED;
+}
 
 void kcov_task_init(struct task_struct *t);
 void kcov_task_exit(struct task_struct *t);
 
-#define kcov_prepare_switch(t)			\
-do {						\
-	(t)->kcov_mode |= KCOV_IN_CTXSW;	\
-} while (0)
+static __always_inline unsigned int
+__kcov_set_flag(struct task_struct *t, unsigned int flag)
+{
+	unsigned int mode = READ_ONCE(t->kcov_mode);
+	unsigned int prev_flag = mode & flag;
+
+	if (!prev_flag && kcov_mode_enabled(mode)) {
+		WRITE_ONCE(t->kcov_mode, mode | flag);
+		barrier();
+	}
+	return prev_flag;
+}
 
-#define kcov_finish_switch(t)			\
-do {						\
-	(t)->kcov_mode &= ~KCOV_IN_CTXSW;	\
-} while (0)
+static __always_inline void
+__kcov_restore_flag(struct task_struct *t, unsigned int flag,
+		    unsigned int prev_flag)
+{
+	if (!prev_flag) {
+		barrier();
+		WRITE_ONCE(t->kcov_mode, READ_ONCE(t->kcov_mode) & ~flag);
+	}
+}
+
+static __always_inline void kcov_prepare_switch(struct task_struct *t)
+{
+	__kcov_set_flag(t, KCOV_IN_CTXSW);
+}
+
+static __always_inline void kcov_finish_switch(struct task_struct *t)
+{
+	__kcov_restore_flag(t, KCOV_IN_CTXSW, 0);
+}
+
+/*
+ * Pause coverage for current. Callers must be built without KCOV
+ * instrumentation.
+ * Pass the returned state to __kcov_resume().
+ */
+static __always_inline unsigned int __kcov_pause(void)
+{
+	return __kcov_set_flag(current, KCOV_PAUSED);
+}
+
+static __always_inline void __kcov_resume(unsigned int paused)
+{
+	__kcov_restore_flag(current, KCOV_PAUSED, paused);
+}
 
 /* See Documentation/dev-tools/kcov.rst for usage details. */
 void kcov_remote_start(u64 handle);
@@ -89,6 +136,20 @@ void __sanitizer_cov_trace_const_cmp4(u32 arg1, u32 arg2);
 void __sanitizer_cov_trace_const_cmp8(kcov_u64 arg1, kcov_u64 arg2);
 void __sanitizer_cov_trace_switch(kcov_u64 val, void *cases);
 
+/*
+ * Scope-based KCOV pause:
+ *
+ *	kcov_pause_scope();
+ *
+ * pauses coverage for current until the end of the scope. Callers must be
+ * built without KCOV instrumentation.
+ */
+DEFINE_LOCK_GUARD_0(kcov_pause,
+		    _T->paused = __kcov_pause(),
+		    __kcov_resume(_T->paused),
+		    unsigned int paused)
+#define kcov_pause_scope()	guard(kcov_pause)()
+
 #else
 
 static inline void kcov_task_init(struct task_struct *t) {}
@@ -105,6 +166,7 @@ static inline void kcov_remote_start_common(struct kcov_common_handle_id id) {}
 static inline void kcov_remote_start_usb(u64 id) {}
 static inline void kcov_remote_start_usb_softirq(u64 id) {}
 static inline void kcov_remote_stop_softirq(void) {}
+#define kcov_pause_scope()	do { } while (0)
 
 #endif /* CONFIG_KCOV */
 #endif /* _LINUX_KCOV_H */
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 7f106182cf1b..1d741a16d5ca 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -848,11 +848,6 @@ static const struct file_operations kcov_fops = {
  * collecting coverage and copies all collected coverage into the kcov area.
  */
 
-static inline bool kcov_mode_enabled(unsigned int mode)
-{
-	return (mode & ~KCOV_IN_CTXSW) != KCOV_MODE_DISABLED;
-}
-
 static void kcov_remote_softirq_start(struct task_struct *t)
 	__must_hold(&kcov_percpu_data.lock)
 {
-- 
2.39.5


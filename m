Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8537C93F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364882; cv=none; b=HWc3C4hr2Nf8UEhYNRRjba+qN8SHixFa1zwUvX7Uj5/vfAb1V/CeS0Tpz10LihBAXWZQHPzMU/2W6svpVOrL9DGqtKzWEvbfB9OagRplOOBFDr3afn16JS/JeOI6lGWA3du7IEDvwEQyy27Uw94nQh5jxmnvuaxFDYLCO9oh0i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364882; c=relaxed/simple;
	bh=VhuMZhQSgNUoK23zJ2zuGMxgfoJ6eICwbGGFCSMgtLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lNpNCyuNXkqF0ziEHoYatfeItiayHtke1Mqe7eNQei0sbl3hyGCr9D6Yov2nW5KJNh29wErguuZvcm9xyqKrN+0UCFPlJMFzTWL82qhUfDcAP6tb3PVVn7w0Jdkp3vJtLuA/FmTYGj2E+jdHrlLRsI8o7hi+v9ehPuIbjag+7+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDiaANrq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDiaANrq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso4535275e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789364879; x=1789969679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DwGhYZenzciYHL+gywc0ajJIiQoquXAsP6MMMAsMaU=;
        b=RDiaANrqbHEKKukEDx+yCiL2qUEbwS3x8DwNwne3Mc1+U7iSwms+qMj+T9aMlG4DAG
         WQpqC78UTdXvccyxgboQFwGx4RZU8wb4m3o/yvcuMdZY91PoT3ZzHOeBgSkxeQsiSgHd
         gX+rxAK9lLTO6Eh6DIU+irWDLTFv6bKdKorc06ssr55Mn/QkoGGzvQm28SDnxYavIKNm
         l16XpaNaltnSo0ZgpuAr20D65b3T9gKiNtC48njj+d+GhWE5CodXP7v15ilPox4pxceb
         C+rsalwDBP5KlIWQrfLUueDWQHpAElMphhXXk78jqYwRxAVIEyuhzFNNfUsfX+yyMcHA
         XBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364879; x=1789969679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8DwGhYZenzciYHL+gywc0ajJIiQoquXAsP6MMMAsMaU=;
        b=bHZU0pYwrEbRGNrNCGtlN311f8ziH3ubARPqywbEwvGaVG0VkQy4N4J+v212FUH7w9
         91iX+QXHyHTwPyMCnq6By3VvBluAk4PUBlv304z1rCxL1J5DC50lGPwU02UXyH4ZuTuJ
         7mEFQEQjXHq5BR2m8Iq9b7sdNrXpOXOxia+YeCqnsbkwrweHATYn/jayaDGYnQQOF5Ed
         EDwovqkLefZqDgG+28aP8xkuTD/0k+/ySiTZ+2wZ7iNYmrGVVdRknB7MQZBOSFI/LF1I
         gQ2dfPYsCz+Upy+X0eqaNJOYr3Y7vOaqagp31tlavnPxW4pIqZwcLXvzKEEVxxKwhzOv
         goOg==
X-Forwarded-Encrypted: i=1; AKwUvBxayJAZgP0ERKm7jQ9B/yZ/ha+5EZqpxUamA5XgZTW5Sdpm/yzO7t7kAA3CG0tmqokaBns8QV6PaL86AP4=@vger.kernel.org
X-Gm-Message-State: AFuF++lTlOKomj7Skm4Tse6M0rxrn5mYo7j2iZ5P7409y2XdjJKfq0hS
	ekoeezN0+9IB3se725x/xMYVj31ep5HDV6/J9PGiBQp1Zbab3m3eVgs9
X-Gm-Gg: AYBFou3D4ZXZoEn5LEwID+drJXM5kwXP+WKEu0l141V81DETw/3aJ/6Zr/kkxZ4gghy
	jq/1rsloaIjGv8hXY5R8DqAzA1CpZNerJBP+pMXkQwaKV+dF+XfassQlcxnZGLgIBNxjfcznS1m
	fARLeU+/8YS4+toXJyBboEqbNaY7+vBe7ixCcwlqGgfr+OWC51ro9bg1rnpvvi9dLsim6twmoqr
	K/VyFymkmIfSNSiCVCUhAs8uvhX0gwz8YcIgK/RU0eBJAalzE8L4JV3Kp0dXvf3dybmbiEK6mws
	Mbegvm7OfEz80NQ35XRBL1j8CWVuUNwKwBQsJViW+sjmJbYHU5wiWgS5sT3VF2X2VSg4jOyWZsk
	x9t7jfutXaleCP+sbK7al6eYVdQjEG42nPi6mPAoSzVTfIDjELSm2TolDpRAHd0O9fpuUOY3AhZ
	VbVs4xqHmjH4/JXN0UJakXNqfVeXRGAjMp7gXa8CMY0O1/Cz96+AhSiaoO3a+PLf9qLGiLpuzza
	dYUpOptNFqZ0LEmu78UcWMRgebPyPTHhWQZtVtb0uRAOZDwITnTo6aPX8W9fSuZEQyfw716N/1Q
	AiKUU/UJITq3kuXdjqYglpUd5lTYghk=
X-Received: by 2002:a05:600c:6989:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-49e7a64ccc4mr8629955e9.2.1789364878978;
        Sun, 13 Sep 2026 22:47:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-122-014.77.7.pool.telefonica.de. [77.7.122.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm214537735e9.5.2026.09.13.22.47.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 22:47:58 -0700 (PDT)
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
Subject: [PATCH v3 2/6] kcov: Add a kcov_pause guard
Date: Mon, 14 Sep 2026 07:46:28 +0200
Message-Id: <20260914054632.12877-3-kmehltretter@gmail.com>
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

Provide a kcov_pause guard backed by flag helpers shared with context
switch suppression. The helpers access kcov_mode with READ_ONCE() and
WRITE_ONCE() and use compiler barriers to keep instrumented calls inside
the suppressed region. The guard saves the previous pause state and
restores it at scope exit, so sections nest. When KCOV is enabled for
current, remote softirq sections save and restore the complete mode,
preserving the pause state.

With CONFIG_KCOV=y, restoring a previously clear flag still writes
kcov_mode even when task coverage is disabled; nested guards also take
that path in this case.

The helpers are __always_inline. Guard users must be built without KCOV
instrumentation because inlining does not remove the caller's own coverage
callbacks.

Assisted-by: LLM
Suggested-by: Alexander Potapenko <glider@google.com>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/kcov.h | 80 +++++++++++++++++++++++++++++++++++++++-----
 kernel/kcov.c        |  5 ---
 2 files changed, 71 insertions(+), 14 deletions(-)

diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 895b761b2db1..41833b434c40 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -2,6 +2,8 @@
 #ifndef _LINUX_KCOV_H
 #define _LINUX_KCOV_H
 
+#include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/sched.h>
 #include <uapi/linux/kcov.h>
 
@@ -23,20 +25,64 @@ enum kcov_mode {
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
@@ -93,6 +139,8 @@ void __sanitizer_cov_trace_switch(kcov_u64 val, void *cases);
 
 static inline void kcov_task_init(struct task_struct *t) {}
 static inline void kcov_task_exit(struct task_struct *t) {}
+static inline unsigned int __kcov_pause(void) { return 0; }
+static inline void __kcov_resume(unsigned int paused) {}
 static inline void kcov_prepare_switch(struct task_struct *t) {}
 static inline void kcov_finish_switch(struct task_struct *t) {}
 static inline void kcov_remote_start(u64 handle) {}
@@ -107,4 +155,18 @@ static inline void kcov_remote_start_usb_softirq(u64 id) {}
 static inline void kcov_remote_stop_softirq(void) {}
 
 #endif /* CONFIG_KCOV */
+
+/*
+ * Scope-based KCOV pause:
+ *
+ *	guard(kcov_pause)();
+ *
+ * pauses coverage for current until the end of the scope. Callers must be
+ * built without KCOV instrumentation.
+ */
+DEFINE_LOCK_GUARD_0(kcov_pause,
+		    _T->paused = __kcov_pause(),
+		    __kcov_resume(_T->paused),
+		    unsigned int paused)
+
 #endif /* _LINUX_KCOV_H */
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 79dabbad5a38..faccbd3bd2b8 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -830,11 +830,6 @@ static const struct file_operations kcov_fops = {
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
2.53.0


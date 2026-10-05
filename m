Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2EC4DC551
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 18:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226704; cv=none; b=R94EHXq8RjOvNfyfK3KxFNT7bBrJnvau1tZyKMkUi7g+87c28TXKB5+LHz3dmb9KI4SVL0yX+FezVIduhnPGJspn+QPD1kvW6BT7q66pfjwSv9OV4Oa5Km5LdCQQcoN+O5hzQ4WzPc4/mhFI5IVSdzz4SKvtXYiN3SuV/9u5Pq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226704; c=relaxed/simple;
	bh=VhuMZhQSgNUoK23zJ2zuGMxgfoJ6eICwbGGFCSMgtLk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k995AHM1I4+6Jp4Ja3LOB319cL1875AESzJLKJkZyAeP8bT/izsclmmvVp2iBmLVcKGDBkWXSsB1fZjqpiOQ0WWtMxfa27Fkdz7z3TVykeL0lmCjzO8yfZNBq89a55t2HyzoDSYf8zbgBjWSGNYugnkAPrcXvx5ONWjSBPkvwB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cr+vAqWg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cr+vAqWg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso21149575e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226701; x=1791831501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DwGhYZenzciYHL+gywc0ajJIiQoquXAsP6MMMAsMaU=;
        b=cr+vAqWg8ry4nPQCey0VuTVkt9oEcfpm1qpch8tj9aC7wBhjGrnhRsuQQOr7H8Xlb/
         RhTz+cPy1g9rakZIorJXhuAZ3fXR+vtobJCl2DAsQhP3iRO5kK3IO/OxaOSZU/A2NmE/
         584MJBhduqBQKuVBKEjp8IM4CP39f/8LsUgzqz/oKdXxcK/KvTjgADtH5M+OGlEhXXTF
         oz3s7qsR2FLtvErz1QpE/ICCqDVO82So2v12+ykyAG8hw4NTekcw8kthn0nTJfYqLLP4
         KoqoSpbAz48gTCZ43eTQohhwM+2WxRNgf9BsTdi9g+o/6t+0J4SnZ5yWRjByompxg8rJ
         4fJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226701; x=1791831501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8DwGhYZenzciYHL+gywc0ajJIiQoquXAsP6MMMAsMaU=;
        b=DPejGx2ELeJF+rjr8MAtEenb7zXH0uyGj9vsD57U1T3DF15sz8lV5hjL/GVQq9u7s4
         VwI1WYkHiZt9iDZmpKvw5K6bMauu+hHNEnFp5SxZWM5hvOvZBI5zN4AmWAjKvvliFW4J
         ipdQApg/4T4IEdKHz3XCKSmth9hhxe7NPGhukLQQ1z/kQ8zcE27MyEqOFnf4pvxScWcb
         Emi0YqDcOFyROfQR8cT/nWdB/VIA0oPsAEIN7V0IfZbW/lpLzvMsCBtRvj89jGgkkZ4V
         0vndB15jdbEqSJQ+uLCzrD/EVOK82U3roK1kvnS+dUHZjrAWKw32empBJKYT7Rf5pctS
         dRmw==
X-Forwarded-Encrypted: i=1; AKwUvByedUAiXTcd48Z03KKiyqsAlvY+wq+VqKuCoPqZROuVUntVpVD7iEfYPh3TN6F8KQh2dKvCSpIbwZBlYTc=@vger.kernel.org
X-Gm-Message-State: AFuF++lHZMgMv6Ro3YoGuDBnf2+kunBysDHcTayiVVYTl+pmBy8oLC7X
	eUPLWittoEqmo3hqLhnEGtPvFo0VVwXU9djHJIqdOAWQMucCKkAxeRRP
X-Gm-Gg: AYBFou2gzrZYEHQhStuZCntCd24EJsNRWIpOK2HFlMsnaWXl96XB+OX1x1FOxNLceXG
	HNeAzR7ZXcfhcFxO/sL7Y24KW0J7uudSolVf2EfaSaeiJcCjZc+o91PYlzNo8B5LlEE+dpHkF8t
	7ym2dLfZlvI5vOjDBB0d4KjxENyYxcXUkzGT/9b0nPEZgs816pFTptve7Yo2xTSQp4jGDJxZ67J
	Hr698NLShxZ+DWu2aaRXNswREeQ8Q9NEBqJ/S3YvKTdFau4yVaNDKsCy6lts6eqa7JMlDRsbyBB
	mWAhLVeRLoBXHD5uS+p75TYvea02NVk8bq6ULhJ09idBo3QLen2gixJaHAFvWby3XFnj09gBt9e
	sfLd2rVcdxdyaEFpDptmRd80/0rPIVvM1uhdhIqpBK8Fq6I81VvvGhK5fTT7I+gOSHOllmWIHHY
	tZlFDZ8fOYDMLfyv5kTe7E6EPxu6F/WCuaQwn89uL15q7oJc/EPY/txVgQcRsdDyMF/mTQjma7R
	aNrf7kzOw2hc2tvDlNPXVjENy7Pk3jhb2L3LPzFyKOAxVPAOuPg4eYdz58ngIpvPYCHO3JOnQpd
	1DGlctvlRrAXGtTYuH3rtI9xE5QRlelyM/OafKnsbzb3xjkPlGKleKos395Pxu9Ml+mI+036y6s
	3tQ==
X-Received: by 2002:a05:600c:3485:b0:4a1:6916:798 with SMTP id 5b1f17b1804b1-4a176ca18femr29083865e9.14.1791226700993;
        Mon, 05 Oct 2026 11:58:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394e6c5asm281196795e9.2.2026.10.05.11.58.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 11:58:20 -0700 (PDT)
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
Subject: [PATCH v4 2/6] kcov: Add a kcov_pause guard
Date: Mon,  5 Oct 2026 20:57:59 +0200
Message-Id: <20261005185803.39170-3-kmehltretter@gmail.com>
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


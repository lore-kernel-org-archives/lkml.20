Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372229;
	b=EKLMmbPLxKprJSNd5Inu45Pf2kQvpIGC/Lu/8DAmi8NB/S2ozJ9ZIS1mBb1mtjy7JFhr
	 yC7za2QzAR+8SJRHFO+Li0Lmr7wy00dUH9qnMHEYoPt8mDHmCREpkPEFgVg6beRLIgbha
	 M1PR22tQ/UISklViU8++a/uSOYcjKJ5rOv1La3JRxsw/OGs3wzm4uSRfY3+hcN7pWttPn
	 5Z25FFavfRPIX2MgCtydl9kDoVqxTC00ONMFYW9QUf+iNRU86O10mdoDaK4S0TGWZbgQw
	 GrljGJCQZU+KdwebzLDSHDPZYrlQ4WzfHHmJ/bimd8PpBGApnbq43H9Gpbiv0KSIEOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=xxNQrZo1DdOgC5ZNVUxedcmoaN43mBZANIkpXi8hXU0=;
	b=a1/3inU2mQB31Ryci1i+EXC7ALIPwZu32RqCIpzFw//GPIcy4ESSOvo4nhQtvapsiChX
	 WxFNDzl8/L8hySDauPxae1Mo5cPAgCNiGMsOl+n2nVgp8t2cKt4AnVR5sBiwESMx2bvqT
	 pmuVbwaTpzhmoytFJqTmvdyWIssY1kCcRU6oGYusgWg4zfepcj/MfnZIasX9lAdJ7Kas5
	 A1anvs5NoJpMJ9iLZ2nY/HmAOBN6sWCBu3Xcps/S9AjXPs/WGMDQLw60p8+J5bbBeXttT
	 MsLIeYqfC6btWS+TzIINMV1LWMmz1FNLyJKSLSVD9stPw6tgSUvUovs7AuhoRtVpQjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elver.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KflBchpm;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D355606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D355606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KflBchpm
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6b1c6f567caso947373a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793372227; x=1793977027; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxNQrZo1DdOgC5ZNVUxedcmoaN43mBZANIkpXi8hXU0=;
        b=KflBchpm/Dmv/tMP96F7V2l5HG45pDjXspLmKjjNBSTv3mR43oa21Gov9BpYELpN1K
         qTOkPeHqHHk454WkakGTVl1gKdWwIP08IzjwzkrnLYOw8M3uXP42TByYYnIy5bT8kNmN
         ejCYL/zqX1/wsTHmDN7y5Nt9uX0gMIPvGiWG8Vmb9bRGZsSmiLHhign9kIMPEd1zOTQz
         3iYG+7losWqhQxQ007BI/ZSKkCsRl7SByTfngSsQ34gFe0DhWsSa9S2GULkXxYDhKBlX
         bvZdCDqHJNPEPGX8xKYhpN9Z3VtjcLS/NMKKDCxLmqgdy6pHs422nWpvZKY1nG0OR4Gj
         ElAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372227; x=1793977027;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxNQrZo1DdOgC5ZNVUxedcmoaN43mBZANIkpXi8hXU0=;
        b=KWlBC6niv+06KsqQy/tHUq70XxEUO1crvijL2VtRjp16yhS1/31iWqOXQ6OPw6dY59
         /IemQ+W7z8eVHgl2zaUTb7UxkYIhyeEATTJwNBautIXd1bUGKFkthcIu2Wfa6yIzSI5X
         dt0TgUbouNVrtjHfpJRWEpYKEXdKGd9esLhq6R/S2h1SBl8Qs4XSlzTy+0hqz3Vtbppb
         s46rK5Wo1TtWfDvsnkROEYuBzfgc3lZsYzz76pRNUifdChysvG+2qI69fcPaGHWzO6fV
         ORQ8uir0SVBlutGjFewdhtzc5526y/E8yLySMjYdjIcsaiRGJd0A7w375dck3mQNMXbX
         xJLA==
X-Forwarded-Encrypted: i=1; AKwUvBxECSrwcF68vPfJ4Mz2Q2gYuCYVzxEQg+wjqls92qhH3dwDdhTtVdkvDQVi0ebWta2Xts6+WBeOqM73/YI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgaNLmHN6CjU/KymHF1ly2V0gGgOScS3EBi6FaGvmPSMDFk2DL
	/HS3VYVrRJuvaRnaE7kdYys8x4nl4TRiN0Mpz1OwHfH7Z4JgmM4oXawQ0GDTB0ky6aJd/jFo8nx
	PQw==
X-Received: from edrm17.prod.google.com ([2002:aa7:d351:0:b0:6b1:ef87:b3d2])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:c9:b0:6b4:8da3:ba27
 with SMTP id 4fb4d7f45d1cf-6b4d562eef3mr1457324a12.31.1793372226613; Fri, 30
 Oct 2026 07:57:06 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:56:19 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030145655.439579-1-elver@google.com>
Subject: [PATCH] kcsan: Reset per-task KCSAN state on fork
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Kees Cook <kees@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

arch_dup_task_struct() copies the parent's task_struct verbatim, which
includes kcsan_ctx and kcsan_stack_depth; nothing reinitializes them for
the child.

With CONFIG_KCSAN_WEAK_MEMORY this leaks a live reorder_access: an
access whose simulated reordering is only valid until the parent returns
from the frame that performed it (tracked via kcsan_stack_depth and
cleared by __tsan_func_exit()). The child inherits both the entry and
the parent's stack depth, but never returns through the parent's frames,
so the entry is never invalidated and is replayed on every subsequent
check_access() of the child.

The most direct way to hit this is the copy itself: __tsan_memcpy()
runs check_access() on the destination before copying. If that access is
selected for a watchpoint, set_reorder_access() records it (ptr = the
child's task_struct, ip in arch_dup_task_struct()) in the parent's ctx,
and the memcpy then copies that entry into the child. For an idle task
created by fork_idle(), the stale access covers thread_info.flags, which
other CPUs frequently access, resulting in false positive reports and:

  WARNING: kernel/kcsan/report.c:344 at sanitize_stack_entries+0x120/0x12c
  Cannot find frame for arch_dup_task_struct+0x40/0x154 in stack trace
  ...
  Call trace:
   sanitize_stack_entries+0x120/0x12c (P)
   print_report+0x84/0x488
   kcsan_report_known_origin+0x14c/0x1ec
   kcsan_setup_watchpoint+0x578/0x864
   __kcsan_check_access+0x1ec/0x1f8
   do_raw_spin_lock+0xa4/0x1c4
   _raw_spin_lock+0x70/0x88
   rcutree_report_cpu_starting+0x1ac/0x4b8
   secondary_start_kernel+0xe8/0x28c
   __secondary_switched+0xc0/0xc4

Reset the child's KCSAN state in dup_task_struct() after the copy,
alongside the existing kcov/kmsan initializers.

Reported-by: Paul E. McKenney <paulmck@kernel.org>
Link: https://lore.kernel.org/all/97f6213a-1dec-494e-96d1-abe546bce993@paulmck-laptop/
Fixes: 69562e4983d9 ("kcsan: Add core support for a subset of weak memory modeling")
Cc: stable@vger.kernel.org
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/kcsan.h | 10 ++++++++++
 kernel/fork.c         |  2 ++
 kernel/kcsan/core.c   | 13 +++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/include/linux/kcsan.h b/include/linux/kcsan.h
index c07c71f5ba4f..c7e9d15dd7bd 100644
--- a/include/linux/kcsan.h
+++ b/include/linux/kcsan.h
@@ -13,6 +13,8 @@
 #include <linux/kcsan-checks.h>
 #include <linux/types.h>
 
+struct task_struct;
+
 #ifdef CONFIG_KCSAN
 
 /*
@@ -66,9 +68,17 @@ struct kcsan_ctx {
  */
 void kcsan_init(void);
 
+/**
+ * kcsan_task_init - initialize KCSAN state of a new task
+ *
+ * @task: task to initialize; must have been copied from its parent already.
+ */
+void kcsan_task_init(struct task_struct *task);
+
 #else /* CONFIG_KCSAN */
 
 static inline void kcsan_init(void)			{ }
+static inline void kcsan_task_init(struct task_struct *task) { }
 
 #endif /* CONFIG_KCSAN */
 
diff --git a/kernel/fork.c b/kernel/fork.c
index 5ef413368912..62a096ca8dce 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -93,6 +93,7 @@
 #include <linux/compiler.h>
 #include <linux/sysctl.h>
 #include <linux/kcov.h>
+#include <linux/kcsan.h>
 #include <linux/livepatch.h>
 #include <linux/thread_info.h>
 #include <linux/kstack_erase.h>
@@ -986,6 +987,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
 
 	kcov_task_init(tsk);
 	kmsan_task_create(tsk);
+	kcsan_task_init(tsk);
 	kmap_local_fork(tsk);
 
 #ifdef CONFIG_FAULT_INJECTION
diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index a3aa5e5b039d..26755add7cdb 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -828,6 +828,19 @@ void __init kcsan_init(void)
 	}
 }
 
+void kcsan_task_init(struct task_struct *task)
+{
+	/*
+	 * dup_task_struct() copies the parent's kcsan_ctx, including a
+	 * reorder_access that is still live in the parent's frame.
+	 */
+	memset(&task->kcsan_ctx, 0, sizeof(task->kcsan_ctx));
+	task->kcsan_ctx.scoped_accesses = (struct list_head){ LIST_POISON1, NULL };
+#ifdef CONFIG_KCSAN_WEAK_MEMORY
+	task->kcsan_stack_depth = 0;
+#endif
+}
+
 /* === Exported interface =================================================== */
 
 void kcsan_disable_current(void)
-- 
2.56.0.317.g454f8302e1-goog


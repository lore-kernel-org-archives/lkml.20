Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349243;
	b=f26krFFc8JSsh1dpsGCbJOxmhzSvvWdF5TbaSBCF0PmwJqZt55k6CR/HethnBrTDhMj6
	 +wfUTJXc+SCIauy+kAkW1IlCY5RLs048tAG0jdd7BK8NY3ddNHGWcPvwl4w/uRl8O3pod
	 FrQYIxp1zBFvcUgjtoM+EzrZA31pEjSTQjNtjL7ar5SCafvOOBZc5WzRCUG34C+HOQrVf
	 43uNLE6t4A4K3MHcYbHhTZxIZa5bXh8OjytNl2gVEeQ1QZQCqqs0YIhEt8vBLbVn9dJWG
	 +qwfncshRn+2nwQGKymVh1MiUQMohiBq+ZouhlmgCIBWpiPGH/ilZA0Mc206jkcFbyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=OaDrDItNm4hikv/Q3sLJs60ByZn6DMzU1f9WMqSeQ8k=;
	b=GDS5UIwEkOAe8I0J2400yLm0XeXdKSVBZ+ivKAJQ+tKAqVRGvsrT2xXiIa4pLWxJPfLN
	 GAS4Xf/+5pJ/6CwWvnuC9eW8VjN48t94m44IQOV3vHKCe1YPB7eQl865QsUedLMmyAYDo
	 sLvJpzFTwu30Yt7C51BZGtctKzYzeAV9sAJmuxRL6YKpjGENzMDOpipLMX0uAVQNrCE4s
	 qIXp7sOnlq2OQcnZypPA1EBQu3sHoVQkefWnelYuqTnUtXbjnCOg8+u1nBO4U0ksthYuQ
	 lXfdvQTVNZigQfPXBUZnSOSiXru+/YJBQ6Xrhs4l8awjiYO5ojyuL559zEFlWcOberg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eEEEfV7i;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE80606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE80606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eEEEfV7i
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so3227605e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793349242; x=1793954042; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OaDrDItNm4hikv/Q3sLJs60ByZn6DMzU1f9WMqSeQ8k=;
        b=eEEEfV7ikbRZxEwNrbFU1e4PdGZRJwWvnzBfSt+FQy/mnjO3kKKDXAgp2amLppLAwX
         /0k20dqjaSHepJUXPSDAbPU8xEymU+CA1TC53mN3FyvRdqCOCdnuWTr4IqzjFRZec6b/
         W366XAKXcYE1igPNj5+efJ+n5GQUdjsbfdWg5We8r27o645FkbB9WfofVH15cZn8riXB
         Vc9cMGg1XATkXv3eljKWfUXD/N83E2Wo9T1ClWkt43dNFqT13WWOKp1yvCT1F4j/AWXV
         sWST3T7iDK3H80EbP+hm02KPTtDYXjN1HflZGXDc5TX6bgOuevomZqr2QVtLqEauD7Q8
         VsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349242; x=1793954042;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaDrDItNm4hikv/Q3sLJs60ByZn6DMzU1f9WMqSeQ8k=;
        b=cjaQszqNiIL80fAZGQzMZisfYU3QM0ksUl9hednRgaqBFtzufx/7bIJyjRHHArjDbh
         baqA1yegWkQm8yv+T8mZR8xvly/BlBntrHOhZXRVVU5BlcZ4sDq0tZ18YcleXf5cmyQN
         iWCNUki10cg3GA3VBBDzWZiMy9KLsj71ys6Mry02YLDSSdXyJS+ju/RLUWXFwTvnnLg6
         QL4cZA0fv+UfH60SV80a9WhuFZJmXj1JXPIg4kmXR5DSty/wdrCy1fmMJUOM0uRUKlbi
         R29UwxfAAXhDbZ+r2Zb9eqWMBh/jP14ut/fENr8R5xgpLRGXNxVdeRK52rkULDtuYXsr
         s/gg==
X-Forwarded-Encrypted: i=1; AKwUvBy5FA25IazAMAVau9RFK4dUkn1ARRHDGePhFW3hz6n6FGYFHCNz18LNYaeglh1YSakkkKKjxa1BtMLIHcw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdXGojguNcwSeKQNeFqFS/tGLTGd+MRw8qf/jcDRsNNNsPjDCn
	Grsbawj9jwg3st4D9uW/Lq6qjia1fKJDpYO/LET7tiNTametkcIKAsYBZWejvtqDYw==
X-Gm-Gg: AYBFou0FUeH8Oh5JYk9KLVSSEGGZQKQO2g3J4nmexM4CnnCIe507w+yZ1R+vBYLg7iI
	CVHVl/LmIAK1hPjgT9VHe5WjMz8YsxMyiLKeYPSF9M9MqUEVfhc2fn7btVLV81XiopMhuTNbdvm
	kvSEEzETs7C3ouXrsOgkIecfaiz9deidn4PmY0cDaYGI0EWmd0XbgvunPzuPAhFXXRxVnmtWcp+
	yC4a+iOPm5nOBXZ6HKctrV3EWwGtasJVWfvgSI5PB/ERnmszUKueR2AkCAkkfGabdpRo+TiQps+
	vXthf+zpv4nELoEl4GUs+0/dAnuQ0SFy5UOEDAvxb3mXDLQkSmBY1RI0IRL6bNG8DuJr7XZa6pA
	MQ/O0tqzZOipZH5NVCWubdk46UoRwf5sHNE8G/zJMNOteSlnmxVj+2yfhJr7J1WKAQsfo96+BCn
	cdwiqf3G9HIWSxkP3ws/rU7Zr+/8Fi+mDMIwWo/YqcSw50BQp9EFWj55FrpKyN1hkzEHnlEtbgf
	kS0oaGZaavfFCg2rQHnmxAOGKbn0dxVmvZvpFu2Bib5aNNMImF16Ye2POtIccgGHnOtLiGBUp4T
	Bt4xqMF629bgKcu8vHcaW/xdTY6SK4+7hjWtLv0Cdvvg86NTEMmhMR9UMpMB3vLZbhKJdBhUx6w
	=
X-Received: by 2002:a05:600c:3144:b0:4a1:acaa:c355 with SMTP id 5b1f17b1804b1-4ac17ffb31cmr29522575e9.10.1793349240969;
        Fri, 30 Oct 2026 01:34:00 -0700 (PDT)
Received: from elver.google.com (124.100.205.35.bc.googleusercontent.com. [35.205.100.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm1906153f8f.15.2026.10.30.01.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:33:59 -0700 (PDT)
Date: Fri, 30 Oct 2026 08:33:55 +0000
From: Marco Elver <elver@google.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Kees Cook <kees@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [BUG] KCSAN cannot find frame in stack trace
Message-ID: <auRWcyCJehRIi287@elver.google.com>
References: <97f6213a-1dec-494e-96d1-abe546bce993@paulmck-laptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97f6213a-1dec-494e-96d1-abe546bce993@paulmck-laptop>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Thu, Oct 29, 2026 at 05:10PM -0700, Paul E. McKenney wrote:
> Hello!
> 
> I am seeing the following (very) intermittent spat when running
> the rcutorture script torture.sh on recent -next (starting about
> next-20261014) with KCSAN enabled:

I think there's no reason why this should happen more often. Maybe the
torture testing or your system became better at exposing this?

[...]
> This is the code at line 344 of kernel/kcsan/report.c:
> 
> 	/* Should not happen; the resulting stack trace is likely misleading. */
> 	WARN_ONCE(1, "Cannot find frame for %pS in stack trace", (void *)ip);
> 
> This does not happen often enough for reasonable bisection.  However, the
> alleged fix below does seem to prevent this from happening.  This alleged
> fix should of course be considered to be part of the bug report: I am
> *not* claiming that it is a proper fix.
> 
> The diagnosis sounds plausible to me, but perhaps not to those who
> understand the affected code better than I do.  And I don't know why
> this wouldn't have been showing up earlier.
> 
> Thoughts?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> LLM alleged fix:
> ------------------------------------------------------------------------
> 
> kcsan: reset per-task KCSAN state in dup_task_struct

Yes, it's very plausible and the stack-trace and WARN all line up.

We don't need to reset kcsan_save_irqtrace as that's guaranteed to be
overwritten before reading out again.

Updated fix below; it's basically identical, except for
kcsan_save_irqtrace. Let me know if I can either add your
SOB+Co-authored-by, or you send it out as a PATCH yourself.

Thanks,
-- Marco

------ >8 ------

From: Marco Elver <elver@google.com>
Date: Fri, 30 Oct 2026 00:46:03 +0000
Subject: [PATCH] kcsan: Reset per-task KCSAN state on fork

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
 kernel/kcsan/core.c   | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)

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
index a3aa5e5b039d..d19d60ad007a 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -828,6 +828,22 @@ void __init kcsan_init(void)
 	}
 }
 
+void kcsan_task_init(struct task_struct *task)
+{
+	/*
+	 * arch_dup_task_struct() copies the parent's kcsan_ctx verbatim,
+	 * including a reorder_access that is still live in the parent's frame
+	 * (e.g. the write of the copy itself). The child never returns through
+	 * that frame, so it would replay the stale access indefinitely, causing
+	 * false positives and "Cannot find frame" warnings in replace_stack_entry().
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


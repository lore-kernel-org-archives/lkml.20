Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E9A4734EB;
	Fri,  2 Oct 2026 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933595; cv=none; b=R/UkVFQkDd5Sfm8DGRtMhkZe/4Gs4AWQM7yt/2g/47ptBO5oiKjhEdE6F/X4cIGBF5LfPqxGUgZQLIIFCUy0wjm0Xf3enmKZkuFWY7aNlds1qgVyUyx2KIFkiYU1EgTLcF40rJjGngQwqxAJN6vNI+H7fQk4t4F3jRiin0jlh8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933595; c=relaxed/simple;
	bh=9eyLlOB42YSnq1kNwhbQSwB8gEX41IfJSVJMAdmegu0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=nFyWU4D7oyuFHG5eQoDhTSkDfMIY7j6ucL54fMuSzaaLtTiupNPHTPDSssn0YTKD/UuhF/Hlg35wa64YJZHHbIZyA59b4bivAD2HnxyQwF3whkRRSMtdh0Ym/oFgXdqhmUghCZTKJJm2FjWrHZDXDgGD48JHpfZbFz1sxWvdaSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aCMKz8Sd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OBi6TC5S; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aCMKz8Sd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OBi6TC5S"
Date: Fri, 02 Oct 2026 09:33:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790933592;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48SdwBTwcfmrZKybZRu5jy3f1wibxeQl+ozYqT+iY4k=;
	b=aCMKz8Sd7as14+h3qjRxLGSZa2MZa0RTRHQqBiYoys+mzHeHMAjrs5XR6+c3jl602Mnfiz
	kZ2CxIeX7m6s9NX9SUKPXPMRe2ZRw5DjpHh/YrCacFsoDVyW5gmHTWp1oE8BJSowtp41X9
	XlMhpdiKglNfUwq5hh13TR2XCTYmtRELsglvYs1oDVryxOV6gSk4cnfuU6Hc8s6E1ap+yM
	VJX+c5BX1zLLXKhlxRiPGXK0DbbWoAkniqFgEyvJiBcVnrnLEzvUg6VZ+GWr3yQnTe23rO
	llyARbiNYA/1yOxF7i/z4hitmiFuMxhA6JOkq4mrsZg1SGo5FwdTOyo7ExViEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790933592;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48SdwBTwcfmrZKybZRu5jy3f1wibxeQl+ozYqT+iY4k=;
	b=OBi6TC5SIa0i28NBKBdNz1cGHXm9UWU3s24tk6YRBsKSc30MJof+TODwkGLOxRYV/BXzP3
	mH2yOV1Pl3ul3eAA==
From: "tip-bot2 for Sebastian Andrzej Siewior" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] irq_work: Flush lazy work CPU down on PREEMPT_RT
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260911143815.997254-3-bigeasy@linutronix.de>
References: <20260911143815.997254-3-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179093359112.3910103.11423659957142400373.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     40dcc9bdbef3d93a516c8ee32cb1b50eddeeebcc
Gitweb:        https://git.kernel.org/tip/40dcc9bdbef3d93a516c8ee32cb1b50edde=
eebcc
Author:        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
AuthorDate:    Fri, 11 Sep 2026 16:38:13 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 01 Oct 2026 14:00:35 +02:00

irq_work: Flush lazy work CPU down on PREEMPT_RT

PREEMPT_RT invokes IRQ_WORK_LAZY callbacks and callbacks which are not
explicitly marked IRQ_WORK_HARD_IRQ from thread context.  If a CPU gets
shutdown, the irq_work is flushed during smpcfd_dying_cpu() which is
invoked on the target CPU with disabled interrupts.

The callbacks enqueued on lazy_list on PREEMPT_RT are not flushed because
they require thread context. The callbacks remain and get processed once
the CPU gets back online.

per-CPU irq_work items continue to work for enqueues on their local-CPU,
only the work on the "offline" CPU get stuck. "Single" irq_work are
worse because they remain "claimed" and can not be used again. One
"symptom" is the late printk() in CPU down path which enqueues the
irq_work for printing but it never gets scheduled. Further prints don't
print to the console because the irq_work is "pending" of the offline
CPU.
Another problem is the canceling/ flushing of the irq_work which is
stuck. Since the irq_work will not continue, the task waiting for its
completion will block waiting.

While looking through the users of irq_work, it does not matter if the
callback is enqueued on another CPU. This makes it possible to invoke
the callbacks from a remote CPU by smpcfd_dead_cpu(). This is invoked
from the control CPU with enabled interrupts shortly after the
hotplugged CPU is shutdown so the llist can be accessed safely.

Add irq_work_run_cpu() which invokes the irq_work callbacks of the
specified dead CPU. Invoke it from smpcfd_dead_cpu().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260911143815.997254-3-bigeasy@linutronix.de
---
 include/linux/irq_work.h |  2 ++
 kernel/irq_work.c        | 11 +++++++++++
 kernel/smp.c             |  1 +
 3 files changed, 14 insertions(+)

diff --git a/include/linux/irq_work.h b/include/linux/irq_work.h
index c5afd05..7184e12 100644
--- a/include/linux/irq_work.h
+++ b/include/linux/irq_work.h
@@ -59,6 +59,7 @@ void irq_work_sync(struct irq_work *work);
 #include <asm/irq_work.h>
=20
 void irq_work_run(void);
+void irq_work_run_cpu(unsigned int cpu);
 bool irq_work_needs_cpu(void);
 void irq_work_single(void *arg);
=20
@@ -67,6 +68,7 @@ void arch_irq_work_raise(void);
 #else
 static inline bool irq_work_needs_cpu(void) { return false; }
 static inline void irq_work_run(void) { }
+static inline void irq_work_run_cpu(unsigned int cpu) { }
 static inline void irq_work_single(void *arg) { }
 #endif
=20
diff --git a/kernel/irq_work.c b/kernel/irq_work.c
index 9f19c05..73eabcb 100644
--- a/kernel/irq_work.c
+++ b/kernel/irq_work.c
@@ -263,6 +263,17 @@ void irq_work_run(void)
 }
 EXPORT_SYMBOL_GPL(irq_work_run);
=20
+void irq_work_run_cpu(unsigned int cpu)
+{
+	if (WARN_ON_ONCE(!cpumask_test_cpu(cpu, cpu_dying_mask)))
+		return;
+
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		return;
+
+	irq_work_run_list(per_cpu_ptr(&lazy_list, cpu));
+}
+
 void irq_work_tick(void)
 {
 	struct llist_head *raised =3D this_cpu_ptr(&raised_list);
diff --git a/kernel/smp.c b/kernel/smp.c
index b696bcc..8f530a0 100644
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -87,6 +87,7 @@ int smpcfd_dead_cpu(unsigned int cpu)
=20
 	free_cpumask_var(cfd->cpumask);
 	free_cpumask_var(cfd->cpumask_ipi);
+	irq_work_run_cpu(cpu);
 	return 0;
 }
=20

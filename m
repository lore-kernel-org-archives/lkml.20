Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793726628;
	b=GeesRG4qiPjddfXcEyXjBPAWAblGnfFN/rTfZMMHoGD/fYqzfWb0avgP0sCOicEMTxTW
	 e6iinuhARewBJCBmen6FPxqVT0fxreDAmh0tU5aLy+3Q6SWePdHJccUDdfWOSs7oWIdMw
	 3ctlNJ40x3zm7vHpLeHixnlgNZt2CWejPgoNL/Nei+57Fl+qPUJeQ8WtWgG5SBYWf+QEu
	 FdDhc/2hGwZW0fX+8TMeOY/ctr7pBDI6ACrsDRswY9SaLCHR6UDWF6ZnfNWN8hj+AVghH
	 S/JkKlbqqpRsuFahUwRSFXWmZFy7ZuWjqdTWxYovs/g2a+1q9Z6Ydd3kXfTLQ3S4MAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726628;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=IXb4yV9mnjGFFMF2fUFFF4uke1VBAuM43A0GXpbx3l0=;
	b=ACBKA+tiu5rRs7imweP3DOMkY2eN7v5N2Y8zMsk4Uyd2XoWt7yoLBhffS95vjjqP34TI
	 Ke5ckkqQPr2jQBaXacchspnb1cqIs2eDLu9QipvdEmSauv6tbrp3wK4kexJCBFng8cUPn
	 OBYMasloChXsVD9YbeNiScSVgQbKtUdxCm4FHyJHh70szd0XXgM8ogkjaQb/kWpVzq91p
	 9zcVea7u0XyT8kP3pm9HCslGXsRLVWXLl8HHZlRztKDhipeVo/H4/GWuql1DojFq/uO11
	 +ungTvEC+msWjPbjXj+ZyVRBjIgW2GTrddDBZx+HciLoQ2H9GRgWa3e4hc880y8iAow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Ub39bYyw;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2461B606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2461B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Ub39bYyw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=IXb4yV9mnjGFFMF2fUFFF4uke1VBAuM43A0GXpbx3l0=; b=Ub39bYywn2mantva38X88Rbrot
	u1gcpXL2hN8nNfZUeia/AQ+NHT3qf4rxjM7jAcGbFH7z1scouz5HDpkfmttcNwd7ukXxV1+Wj6hR4
	68+LTTNWdMS7XrgovdY77Col43imi0dFbQkpH+7EPSjFvU8O16TVekj4ZuOxh/ujL0jtbECm1ccPH
	CuEKgBbcDyMgFXzCIi/OM49bLjsbgz18WR9Z4BVtUuYHzVlWkeg04FiRS7lSGXuQe7EeKNzsEPgcO
	lnNNWPXnaU+hRTUwfpAsfoyX8ApU4GNe8ZurAZCCCoKnpSQ+Zg0P7oqkatqEt3FqTsCw8nL4ZHEx1
	ahMW320g==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOIEW-0075v5-2E;
	Tue, 03 Nov 2026 17:23:41 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 03 Nov 2026 09:22:28 -0800
Subject: [PATCH] kcsan: Don't flush the consoles while holding report_lock
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-kcsan-irqtrace-emergency-v1-1-162288205435@debian.org>
X-B4-Tracking: v=1; b=H4sIAFMY6moC/yXMQQrCQAxG4auUrA00HRHxKuJimvlbozhqpopSe
 ndHXX6L92YqcEOhXTOT42nFrrlCVg3pMeYRbKmaurbbiLSBz1piZvP75FHBuMBHZH3zIJJSCNu
 4Dko1vzkGe/3W+8Pf5dGfoNP3R8vyAViRJg58AAAA
X-Change-ID: 20261103-kcsan-irqtrace-emergency-f11dd338a43c
To: Marco Elver <elver@google.com>, Petr Mladek <pmladek@suse.com>, 
 John Ogness <john.ogness@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>, Dmitry Vyukov <dvyukov@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=4629; i=leitao@debian.org;
 h=from:subject:message-id; bh=PqV+5SeKbOcbWoiZGtCRVcv8lA/jERSTOfPEU+Jzq/U=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6hiZ4JwnWns036FQsQn8OiYTTBg4+CoFZNVLr
 vVB3pfzLgmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCauoYmQAKCRA1o5Of/Hh3
 bfX2EACtjxGWUzX3/T+j3/Hd7nWsGyV3MzY8MJvp5RckEjBz1XFgwvRYulqAlZa1/aJ7xszbqQD
 fvGh7kx5CTlw3Rh+pUyJ8zsckzRS81KdWzULh6nJEkdUIXlM3H+FLM9QcM/HOsVdNwDAHdJjjt6
 rPm33gNlpSFhnwb0rWQnnjcUifrEYVXWks/3FIgu89Ma8Sph4w8LrKVfjJj/W77CEFRBILCMH+H
 zcLizAonYzl4h+GlY6PmZG0HxG+IzWgkaSTl4Dk/8Jz02syAfYr/xEw+0iLckIhTTK7iJzBb2r/
 xfJkXr94vtXsYrXHMVcd/2C20pD9KOKUv6COwAWDqCq7AmQMEuyS+yW18EN/AO2dDxzHhrqspxV
 YcxKIJ2x7yn4J6/I4APA3dwsXa8/JPgyx1rbGlRIWW7idRAsfsKGqS8RRApnkrVwEmx/gm8kjn9
 5mQgy7+A/77bPWL8rjPlyMKhXuWmuTrOUiJKoT2M1MyRfuB8hyO440MEgatbewTdKb86w/Ez5YH
 ttgO1/EV2zIe2tePmdxqIwBUHmozjrHAisTwj652aJSgoOwvSS2mZBFe2UnlprMbKm1zwebl0xu
 85q/NsXEy1Ch7oCclbWmfHAI0JuIF4m27hzmv3ktQ3gMW1Ft1eiXM44EAQF9OKanhIYlBHMDC6V
 vCIYYQf3h1T5s8Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Since commit 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep
splats"), print_irqtrace_events() runs inside an nbcon emergency
section. In an emergency section, every printk() flushes all pending
records to the nbcon consoles from the calling context (instead of the
printk thread).

With CONFIG_KCSAN_VERBOSE, print_report() calls print_irqtrace_events()
while holding the raw report_lock with interrupts disabled, so every
verbose report writes out the whole console backlog under report_lock,
as consoles/UARTs are usually slow, this is not good.

Other CPUs that detect a race in the meantime spin on report_lock with
interrupts disabled, as the lock is taken before rate_limit_report()
gets a chance to drop the report.

On a 72-CPU arm64 machine with a pl011 serial console, a printk flood
from memory offlining left the console about 16 seconds behind. The
next KCSAN report flushed that backlog under report_lock, the rest of
the report never made it to the log, and the buddy watchdog flagged a
CPU waiting for the lock:

  BUG: KCSAN: data-race in mlx5e_poll_tx_cq+0x5d8/0x998
  ...
  irq event stamp: 28975074
  smp: csd: Detected non-responsive CSD lock (#2) on CPU#35, waiting 5000000052 ns for CPU#26 ipi_mb+0x0/0x18(0x0).
  smp: csd: Detected non-responsive CSD lock (#3) on CPU#65, waiting 5000000020 ns for CPU#00 do_nothing+0x0/0x18(0x0).
  watchdog: CPU71: Watchdog detected hard LOCKUP on cpu 0
  Kernel panic - not syncing: Hard LOCKUP

Even without a backlog, each verbose report held report_lock for 0.2 to
0.8 seconds on that machine, the time the console needs to write the
report itself.

Add __print_irqtrace_events(), which prints the same lines without the
emergency section, and use it for verbose reports.
print_irqtrace_events() keeps the emergency section, as the lockup
detectors and the scheduler bug reports rely on it.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 include/linux/lockdep.h  |  4 ++++
 kernel/kcsan/report.c    |  6 +++++-
 kernel/locking/lockdep.c | 10 +++++++---
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index a6451ecbbe9a05..3cf52a4ba9002d 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -476,8 +476,12 @@ do {								\
 #endif /* CONFIG_LOCK_STAT */
 
 #ifdef CONFIG_PROVE_LOCKING
+void __print_irqtrace_events(struct task_struct *curr);
 extern void print_irqtrace_events(struct task_struct *curr);
 #else
+static inline void __print_irqtrace_events(struct task_struct *curr)
+{
+}
 static inline void print_irqtrace_events(struct task_struct *curr)
 {
 }
diff --git a/kernel/kcsan/report.c b/kernel/kcsan/report.c
index 11a48b78f8d15b..ab15ed9d642c90 100644
--- a/kernel/kcsan/report.c
+++ b/kernel/kcsan/report.c
@@ -385,7 +385,11 @@ static void print_verbose_info(struct task_struct *task)
 
 	pr_err("\n");
 	debug_show_held_locks(task);
-	print_irqtrace_events(task);
+	/*
+	 * No emergency section: it would flush all pending messages to the
+	 * consoles while report_lock is held with interrupts disabled.
+	 */
+	__print_irqtrace_events(task);
 }
 
 static void print_report(enum kcsan_value_change value_change,
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef26f..847157d46e4c2f 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4241,12 +4241,11 @@ check_usage_backwards(struct task_struct *curr, struct held_lock *this,
 	return 0;
 }
 
-void print_irqtrace_events(struct task_struct *curr)
+/* Like print_irqtrace_events(), but without the emergency console flush. */
+void __print_irqtrace_events(struct task_struct *curr)
 {
 	const struct irqtrace_events *trace = &curr->irqtrace;
 
-	nbcon_cpu_emergency_enter();
-
 	printk("irq event stamp: %u\n", trace->irq_events);
 	printk("hardirqs last  enabled at (%u): [<%px>] %pS\n",
 		trace->hardirq_enable_event, (void *)trace->hardirq_enable_ip,
@@ -4260,7 +4259,12 @@ void print_irqtrace_events(struct task_struct *curr)
 	printk("softirqs last disabled at (%u): [<%px>] %pS\n",
 		trace->softirq_disable_event, (void *)trace->softirq_disable_ip,
 		(void *)trace->softirq_disable_ip);
+}
 
+void print_irqtrace_events(struct task_struct *curr)
+{
+	nbcon_cpu_emergency_enter();
+	__print_irqtrace_events(curr);
 	nbcon_cpu_emergency_exit();
 }
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-kcsan-irqtrace-emergency-f11dd338a43c

Best regards,
--  
Breno Leitao <leitao@debian.org>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791998;
	b=whvEnma8KsjuJ3sYaV2Wpb2tCT5R8EN2lLzLkim6pmAqNiLB1AAh7p5L+5+5Wf5Freia
	 jCRoAxaRM8VUqhzjjUsqZdyhPUYpJR+4QsavNyd1VJtVarqbjqLQl49MDk92KO5MwtCFG
	 kMtGXg9yKzIpciMsZMqmqDsY1rvReucdltK4ZwJAXi3PK8J2+k1q582C3n+6gtta2bO1y
	 N8fV/W1Gx4oHu56eM+5VtjpKgqtPwBv6vLiPYb2iD6LW26gbzWQPUIbm688DnT2qRdfQg
	 cmN0hFMrd6Ni0SLMxAxXwTFHkxW/7YmCdqgYEw1VL8IELCrw+XMTV1Dot3jek5RUiMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791998;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=c41xccn6GMPMTwYiEGkWnWKuMNW5/Izyfh/RufDy3T0=;
	b=wPv/L1eT6WswvX+Us+dGz0z7h2UJ91k+aXdIsv5aN8+tVxpuI08B9pgEZEs4HlrAO5VA
	 KEaj/ubeEBtdiRWYAL+NRwbL2X/ju9SzqOjk5gtds3+moxNS481gmzoh2esQ70QbfOTlH
	 i4LNPQnwdzEbTkCb0o4abRN+N7FBCLUYbxL/ClsR9/PXjo0VwD6miYbDmEFingoYugnZl
	 JKJMRNqXM6IiUfWbhScRoJ9APYs0KkuqTo+M8NCW3sgLnCFQLrdXbNvfL97ng1TRBL7lD
	 q1S7HUPmqUue9gTGwQybuM/OwEPOBRqb7boK3RA7AwZAifKBYuB4/3dPlDwHlwBjtEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=VWAetPDR;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BD4606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66BD4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=VWAetPDR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=c41xccn6GMPMTwYiEGkWnWKuMNW5/Izyfh/RufDy3T0=; b=VWAetPDRx1VxZjtCaGEKUxNYNS
	yWL3S4uSdL+lYhuUmf8Adqkv3Dz7r4YFFd1pvOU+KSTSOFsq4C2taMhXzpoBO11q/dawuHkx2uaVs
	q7d33BJSqkpNkh0+eHrQyMz+4ssqD+m2L1uIn4PIWXxPYi3QFEJ+UsSBgljSA/jKBtS95J/FTzcaB
	Y9BDA7I+3sSou15kLbPHcpv6+FdfUGoxh0a+ZBd3PIIKCY9ZP6v2Row/RAhrKwdmuzGITx2Ao/1fy
	K7IDRP4kt0jMdhwNhVnoN42SpOBMpqJyVpnKjlqIWecvnVKVrWbnLZP19shD1SNTd7kGHAgin42tI
	/lN9v2AQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOZEo-007gHN-1S;
	Wed, 04 Nov 2026 11:33:07 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 04 Nov 2026 03:32:58 -0800
Subject: [PATCH v2] kcsan: Don't enter an nbcon emergency section for
 verbose reports
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
Message-Id: <20261104-kcsan-irqtrace-emergency-v2-1-ceafc0098a25@debian.org>
X-B4-Tracking: v=1; b=H4sIAOkX62oC/42NQQ6CMBBFr0JmbQ1tgRBX3sOwKO0Ao7HgtBIJ4
 e4WvID5q5f8/98KAZkwwCVbgXGmQKNPoE4Z2MH4HgW5xKByVUmZa/GwwXhB/IpsLAp8Ivfo7SI
 6KZ3TujaFtpDmE2NHn+P61vw4vNs72rj/7Y2BQhx5Odyz3Ht/aGYpUiql6lrlZaHLq8OWjD+P3
 EOzbdsXdNn0eNMAAAA=
X-Change-ID: 20261103-kcsan-irqtrace-emergency-f11dd338a43c
To: Marco Elver <elver@google.com>, Petr Mladek <pmladek@suse.com>, 
 John Ogness <john.ogness@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>, Dmitry Vyukov <dvyukov@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=4972; i=leitao@debian.org;
 h=from:subject:message-id; bh=sDxA0TMWn3HSyIp9gd9A+MU7mBtGNGJfktjfg9//H+Y=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6xfvGKX2AREjSj6QHXlodhvWlmmqcqmVxRYxG
 C1GQsiaSq+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCausX7wAKCRA1o5Of/Hh3
 bQNGD/489lfUhdVvlPXytuEh4+P1cDs9l5pSPX/go85MEM6Qo0AYw+bRkImm6ETsPF47qXJ3aBq
 zBdLObM2rOF6/85Y5w99n/ANQLWOvLRhRWlgSgLzG2IaY0PCEwy0hRKNPCJI0GxmkpojZ7iBk0r
 m6MX6wGL3DQWbzUDLOhns/NUDMF/DLHMdvp5tHhWAcFTgf5QtyP8PCCmpzUa+KFzQPden6TCZSM
 xvV74vYW9PEkBDhvq1rmyeaFZ/vA9fudvY/JZmko5xZSJRUH31DKZc4CEMk7ULjvxjelJ97iI7r
 sbCTzQjS/1tiT+aosXSESw1Rj9OFdnS3FK8kbBxrDwyAR8gjgjl7e5S3x8rjC24ru1Et0ysb0Yx
 idi5rrApEG1WzgKpbpsEvE6oLE3ZQ9anTrLiuLHLMfJtiwvoYXBilY7JsJWSXIBfEqXzuZbNswO
 AklknWlL5ShFCdfUKTQFWEA54a6AbSvJYkrmkmJ2rSeyEDi9S8ELdX1HSHbk3tpU47U+fleg5iD
 m3CLxuzeUYdYhxYd5BbX+KvJgXyOKHwFFZYWTv2zzfnhMl63EulbDeyO4wnDr8pnvcBWOR849NZ
 nFV/7cKMOs5at9IxeW6F3r1Hydt1w0UM5quDrHgTaWVTQb0bawsq/dVcIaoZW25KroK6R5s6B0m
 F+bWUDj4H/ypFTg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Since commit 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep
splats"), print_irqtrace_events() runs inside an nbcon emergency
section. It is not only used by lockdep splats, though: verbose KCSAN
reports call it too, and a data race report is not an emergency. Yet in
an emergency section, every printk() flushes all pending records to the
nbcon consoles from the calling context, instead of leaving them to the
printk threads.

KCSAN makes this worse, as print_report() runs with the raw report_lock
held and interrupts disabled, so every verbose report writes out the
whole console backlog under report_lock. Other CPUs that detect a race
in the meantime spin on report_lock with interrupts disabled, as the
lock is taken before rate_limit_report() gets a chance to drop the
report.

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

Fixes: 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep splats")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Retitled and reworded the commit message: a KCSAN report is not an
  emergency, report_lock only makes it worse (John Ogness)
- Add Fixes: tag (John Ogness)
- Link to v1: https://patch.msgid.link/20261103-kcsan-irqtrace-emergency-v1-1-162288205435@debian.org
---
 include/linux/lockdep.h  |  4 ++++
 kernel/kcsan/report.c    |  3 ++-
 kernel/locking/lockdep.c | 10 +++++++---
 3 files changed, 13 insertions(+), 4 deletions(-)

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
index 11a48b78f8d15b..d2b1af47ee78d5 100644
--- a/kernel/kcsan/report.c
+++ b/kernel/kcsan/report.c
@@ -385,7 +385,8 @@ static void print_verbose_info(struct task_struct *task)
 
 	pr_err("\n");
 	debug_show_held_locks(task);
-	print_irqtrace_events(task);
+	/* Not an emergency: don't force console flushing from this context. */
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


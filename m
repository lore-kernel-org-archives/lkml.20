Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E7B4DD3B1
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220568; cv=none; b=aLVapTdZs+UrGP+uJUjfjT/1R0R1PO22OoI4/3QLwCbgKY1/p675LgH8/Pj69F+JWppkUnUlJ0/toC1oPkC6xK7anym18REvNIBgh8LGeWXIGnc1/TT8BG/6HbA3/oVIcKbP2jbsNCmqFW9wKpUkc6rZz3mGCy1udZQsmiZjep4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220568; c=relaxed/simple;
	bh=NerSRQgPomHVGQsyQmO2Em3s0dFaIoYpp/fMfD73Ojo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqwPPIDGwz1ulUiU2V+ScFTa9qTZnyPB7BapNzraPpJhWCxS36R8QZzPgOuxbAl+LWb+SexW97essbS9q8kGMFLXp+aFu1MS63VN2M7LAh60IeSVG++Ie+n1Kk4ferEXnMNwPGNExoSWASpibSTK8w+UmQ3vOBYLoq+srVdhn3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEwhjs69; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEwhjs69"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e5eso1001506a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220566; x=1791825366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfCwDuuYoLXczS4CwGW4NE2cKOD24/roRAYfYD5E8yk=;
        b=TEwhjs69bamKEFsvfX/GtNfoNSws9p0GBo6LyZNjFYBJQRwL6M5b+ZE1BIBC6+xmb5
         ng3iRAFDNwR+v8kcOYjkj3AWKZc8MfI1X8brekvrLwhm2WVM+UClsUeFIENO3Xcozj8p
         zdP5Aj1WykRiVkyIlMfLCl8RXggxXisi1TVr49ottZpPL9CNVLKpecuiO8Iifw//8iVk
         PgdIG8qOr4PFq9NYdwB0i4G5w22aY1yoYPOomOEEnMYHjCSrhWVFE50MhwVCn4DJ/Rk4
         MXbFQ5GtD3HusI1oMJ/WSovh4JSRjt40O2k9cjxPqXBblBBUAyr3mW0GDJ5K+MLGxRHd
         FyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220566; x=1791825366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xfCwDuuYoLXczS4CwGW4NE2cKOD24/roRAYfYD5E8yk=;
        b=Vs/jhv+y3h2KpW/pFjRkgeXdHD8cwnaFBR+92CB38Kc0jHeTODq18Hpl30sJe4VYyR
         vEOSwHPxQVvEmO1n+aGQdmIljs8nkGhB2COCZreFV21hWwc68VMwoZkkryXLpczkw0E8
         /xnVOW+RzGYHTs86nSdB9YlcYvD9vfG0/tX2bbeUoHWLwjaHmM+U775BiiR6Rzy1Q3Xn
         KjFKmrtN9slzXyw9x/GpPp1/4nxc6wp1OpHX4iDNDrJR9bZDAF8r8Xi8osHEPTL1VgVe
         2OVxtSiq0LhVH5hIC49S9JXq73AwoEuVEOXFwq6skJguDyMpOlajJfDqmKFOKfdh0kgA
         ypyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrgkkrKedQAqNadr/y5kwpIcMNpb/O+KhECtaB7bWqSNNHIYtuwU27eEvfWUEYyOzfAay1yHX9bl44RwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx1XOidLE6lZg/kGyjn+NpMOfwsT/Rh/Sq6b5wQmHzOUsxOATr
	/OLyLl4wp03NwZGXxPGs+4qu3s2ykdT5x7SjjfAgniedEoz1vTyGV4vz
X-Gm-Gg: AYBFou24QHIFMMK2OMKhpknVULrS8bK675N5hRjjJXOSTwfGW9AWpGuk6MUkAftDWJR
	RAxO3gZ++YxhW9bhHN0RtMNDyfd5WKW60rk2U7Hd9xe3V3Avgs1qLX6K1+ubSXEZx3OvhO9zmS4
	drUCdX3YoGOyt8S5f5uC6GeCKK0ZVPg4c2ffOZB/e+P5Wz9ErChNEjIhl4AEzcB/LWDpw158dR6
	3+5xc3lhvyYoaTL/gClWMOG6nYxN3nNiKiVF9mJIQhO7Ns+uo1a5tIxYXwuuWw+35Y0pTcTwo+C
	w2lGVAOoOwpHYmEDXvxF3bt2pxLOPWKGDudTMC+DUeHFUTfRW6iDbi0P2hmQvdF6UTJULVUKxXY
	gBbtL+RZABFRe7M+xWhepeuE36McLxWfj7DVD+vPIUr4soEblJJ6ZM0PxRYE043l2dqROhX2mKZ
	lMEbs0stcb970QAFXY7o6W7EzKDaSDSJI0LgX/pqLyzSPHO/lag8xJbbyW8+KgEakJHbbh0rvtE
	6s29sf+F8IjryMZ/9goW64x9ZZlGug=
X-Received: by 2002:a17:90b:3843:b0:3a0:a259:c67d with SMTP id 98e67ed59e1d1-3a6ce6ca70bmr10121855a91.20.1791220563141;
        Mon, 05 Oct 2026 10:16:03 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:16:02 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 01/15] hazptr: add shared scan kthread
Date: Tue,  6 Oct 2026 01:15:15 +0800
Message-ID: <20261005171529.1378809-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Batch concurrent hazptr_synchronize() callers into a shared scan
cycle, avoiding redundant wildcard flips and slot scans.

Queue waiters to a kthread and perform a two-phase wildcard scan
once for all queued waiters.  After both phases, complete waiters
whose address is no longer held by any slot; waiters that remain
blocked are retried in a later cycle.

Waiters are embedded in the caller's stack frame, so no dynamic
allocation is needed in the synchronize path.

Fall back to the direct scan if the scan kthread is unavailable.

Adapted from the scan-kthread approach in Boqun Feng's shazptr
implementation.

Link: https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 201 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index d3d1050d92cf..9e274a691af5 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -12,6 +12,10 @@
 #include <linux/mutex.h>
 #include <linux/list.h>
 #include <linux/export.h>
+#include <linux/completion.h>
+#include <linux/kthread.h>
+#include <linux/swait.h>
+#include <linux/sched.h>
 
 /*
  * The current hazard pointer wildcard. Flips between 1UL and 2UL to guarantee
@@ -209,12 +213,179 @@ void hazptr_scan_period(void *addr, void *scan_wildcard)
 	}
 }
 
+struct hazptr_waiter {
+	struct list_head node;
+	void *addr;
+	struct completion done;
+};
+
+struct hazptr_scan_state {
+	struct task_struct *kthread;
+	struct swait_queue_head wq;
+	bool wakeup;
+	struct mutex lock;
+	struct list_head pending;
+	struct list_head scanning;	/* kthread only */
+};
+static struct hazptr_scan_state hazptr_scan;
+
+/*
+ * Check per-CPU slots before overflow-list slots to match the
+ * acquisition ordering of promoted slots.
+ */
+static bool hazptr_value_present(void *val)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct hazptr_percpu_slots *percpu_slots = per_cpu_ptr(&hazptr_percpu_slots, cpu);
+		struct hazptr_overflow_list_flip *overflow_list_flip = per_cpu_ptr(&percpu_overflow_list_flip, cpu);
+		unsigned int idx;
+
+		for (idx = 0; idx < NR_HAZPTR_PERCPU_SLOTS; idx++) {
+			struct hazptr_slot_item *item = &percpu_slots->items[idx];
+
+			/* Pairs with smp_store_release in hazptr_release(). */
+			if (smp_load_acquire(&item->slot.addr) == val)
+				return true;
+		}
+		for (int i = 0; i < 2; i++) {
+			struct hazptr_overflow_list *list = &overflow_list_flip->array[i];
+			struct hazptr_backup_slot *b;
+			unsigned long flags;
+
+			raw_spin_lock_irqsave(&list->lock, flags);
+			hlist_for_each_entry(b, &list->head, overflow_node) {
+				/* Pairs with smp_store_release in hazptr_release(). */
+				if (smp_load_acquire(&b->slot.addr) == val) {
+					raw_spin_unlock_irqrestore(&list->lock, flags);
+					return true;
+				}
+			}
+			raw_spin_unlock_irqrestore(&list->lock, flags);
+		}
+	}
+	return false;
+}
+
+/*
+ * Wait until no per-CPU slot or overflow-list slot holds @wc.
+ * Callers must ensure that the wildcard value in use by new acquires
+ * differs from @wc, so that the set of slots holding @wc only
+ * shrinks, which guarantees forward progress.
+ */
+static void hazptr_drain_wildcard(void *wc)
+{
+	while (hazptr_value_present(wc))
+		cond_resched();
+}
+
+/*
+ * Move pending waiters to ->scanning and perform a two-phase
+ * wildcard scan shared by all waiters.
+ */
+static void hazptr_scan_do_cycle(void)
+{
+	void *scan_wildcard, *old_wildcard;
+	struct hazptr_waiter *w, *n;
+	LIST_HEAD(done);
+
+	mutex_lock(&hazptr_wildcard_lock);
+
+	mutex_lock(&hazptr_scan.lock);
+	list_splice_tail_init(&hazptr_scan.pending, &hazptr_scan.scanning);
+	mutex_unlock(&hazptr_scan.lock);
+
+	if (list_empty(&hazptr_scan.scanning)) {
+		mutex_unlock(&hazptr_wildcard_lock);
+		return;
+	}
+
+	/* Pass 1: drain the unpublished wildcard. */
+	scan_wildcard = flip_wildcard(READ_ONCE(hazptr_wildcard));
+	hazptr_drain_wildcard(scan_wildcard);
+
+	/* Flip so new acquires use the new generation. */
+	WRITE_ONCE(hazptr_wildcard, scan_wildcard);
+	old_wildcard = flip_wildcard(scan_wildcard);
+
+	/* Pass 2: drain the old wildcard. */
+	hazptr_drain_wildcard(old_wildcard);
+
+	/* Complete waiters whose address is no longer held by any slot. */
+	list_for_each_entry_safe(w, n, &hazptr_scan.scanning, node) {
+		if (!hazptr_value_present(w->addr))
+			list_move(&w->node, &done);
+	}
+
+	mutex_unlock(&hazptr_wildcard_lock);
+
+	list_for_each_entry_safe(w, n, &done, node) {
+		list_del_init(&w->node);
+		complete(&w->done);
+	}
+}
+
+static int hazptr_scan_kthread(void *unused)
+{
+	for (;;) {
+		bool idle;
+
+		swait_event_idle_exclusive(hazptr_scan.wq,
+					   READ_ONCE(hazptr_scan.wakeup));
+
+		hazptr_scan_do_cycle();
+
+		mutex_lock(&hazptr_scan.lock);
+		idle = list_empty(&hazptr_scan.pending) &&
+		      list_empty(&hazptr_scan.scanning);
+		if (idle)
+			WRITE_ONCE(hazptr_scan.wakeup, false);
+		mutex_unlock(&hazptr_scan.lock);
+
+		if (idle)
+			continue;
+		/* Waiters still blocked: retry after a short delay. */
+		schedule_timeout_idle(1);
+	}
+	return 0;
+}
+
+/*
+ * Queue @addr for the shared scan.  The waiter lives on the
+ * caller's stack, so no allocation is needed.
+ */
+static void hazptr_synchronize_queued(void *addr)
+{
+	struct hazptr_waiter waiter = {
+		.addr = addr,
+	};
+
+	init_completion(&waiter.done);
+	INIT_LIST_HEAD(&waiter.node);
+
+	/* Enqueue and wake the scan kthread. */
+	mutex_lock(&hazptr_scan.lock);
+	list_add_tail(&waiter.node, &hazptr_scan.pending);
+	if (!READ_ONCE(hazptr_scan.wakeup)) {
+		WRITE_ONCE(hazptr_scan.wakeup, true);
+		swake_up_one(&hazptr_scan.wq);
+	}
+	mutex_unlock(&hazptr_scan.lock);
+
+	/* Sleep until the scan kthread completes this waiter. */
+	wait_for_completion(&waiter.done);
+}
+
 /*
  * hazptr_synchronize: Wait until @addr is released from all slots.
  *
  * Wait to observe that each slot contains a value that differs from
  * @addr before returning.
  * Should be called from preemptible context.
+ *
+ * If available, queue the caller for a shared scan; otherwise use
+ * the direct scan path.
  */
 void hazptr_synchronize(void *addr)
 {
@@ -235,6 +406,13 @@ void hazptr_synchronize(void *addr)
 	/* Memory ordering: Store A before Load B. */
 	smp_mb();
 
+	/* Pairs with smp_store_release in hazptr_scan_init(). */
+	if (smp_load_acquire(&hazptr_scan.kthread)) {
+		hazptr_synchronize_queued(addr);
+		return;
+	}
+
+	/* Fallback: use the direct scan path. */
 	guard(mutex)(&hazptr_wildcard_lock);
 	scan_wildcard = flip_wildcard(hazptr_wildcard);
 	hazptr_scan_period(addr, scan_wildcard);
@@ -282,3 +460,26 @@ void __init hazptr_init(void)
 		}
 	}
 }
+
+/*
+ * Initialize the scan kthread.  Failure falls back to the
+ * direct scan.
+ */
+static int __init hazptr_scan_init(void)
+{
+	struct task_struct *t;
+
+	init_swait_queue_head(&hazptr_scan.wq);
+	mutex_init(&hazptr_scan.lock);
+	INIT_LIST_HEAD(&hazptr_scan.pending);
+	INIT_LIST_HEAD(&hazptr_scan.scanning);
+
+	t = kthread_run(hazptr_scan_kthread, NULL, "hazptr_scan");
+	if (!IS_ERR(t))
+		/* Pairs with smp_load_acquire in hazptr_synchronize(). */
+		smp_store_release(&hazptr_scan.kthread, t);
+	else
+		pr_warn("hazptr: scan kthread failed, using direct scan\n");
+	return 0;
+}
+core_initcall(hazptr_scan_init);
-- 
2.43.0


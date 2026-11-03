Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692847;
	b=VUHV13G3uzlxMx5gG7h1oW7A2vqV7zcInX3bhg5hzBJnFdKPzyxX4PMYUWryyS3eaqIi
	 rKObJd7Nmxnt3AdWl8Qi/j2oeywrzExJncRbXLYVMMofRDqg3E1woIpf6oIDMkGsuxdRJ
	 iHZTB2mOXl83a2fYPnoZyz7qqsOlmIo/ec45lOfTeGB8xbVwG+hNB2j1Op5pkXoRhvf8H
	 HN2b9NR7IVTtUN3Ni3j43pNFLaz0enpTpB1PDudXhVdOe/5nOh4zCxEXdexJiniaZZeeW
	 I1RVV2HQgIYyi/ZY4TRP6+pbt/dF9lT+uZwkXijzwVXP+iXxSTU4rQakoEqTUGfK31g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=axvLEFAtLHuXEMPFGyntKrpt+rf9qpIaNSM/g7iVnHA=;
	b=T4ZHAyMjPQISSNh/uzadxNFI943JJrjttclYC5nmXoODd8D/Kp1MdDZhGeCiYBK214T8
	 0lrnwSTQ1PJFO+y+SoHISKim3JREsvEH2Hw+A8PbXi24wJAlCX5//ipNfeR3pHxhooEbt
	 udrKbKb3iACX/GTubaPZ8GstBahBk+eedcfw4Ef5WJ3KuSHPEfsUAP43qfFjL1O9JDXmT
	 EMB+KDamKoriwERMBNxQPZZf3FeRhAsguuVRbWdaakBRxtRsQ8XyYNqQe9Iv7LOfMy9BQ
	 nF5TmH+puTKjw3JIP0c6nVo0mkc0YHGENo79G/dv0ujs72DPSZ7gJEu6QgRCNOf/HBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TkbN7JC4;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31410606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31410606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TkbN7JC4
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9E3303F606
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793692844;
	bh=axvLEFAtLHuXEMPFGyntKrpt+rf9qpIaNSM/g7iVnHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=TkbN7JC4NwqwaC8NlTPVX/z0ilUl0WHS85fzKdAsXkY2S3lCCkCafb5uW3wMznFqa
	 hXOoWSGdS4uYj+BQrSVsUoq3i3TCwB4sIYpQhEzvJq2Q/rGCo3jWE1rWY8mAISJv7n
	 fQ0z3ycWoMEhu8Ae4o3M54WwrNFGkm+j+MQ4dSrwkvJUB+nCY/V/aqyRXSRq2YvH6F
	 ebSDs/NRiNOhRY0FdCzlFQF7uHHwB0P5YS0SXMgqODf2Fa+9xsPXUmxQA4ZweNmo2t
	 x56+D/u/jDkNrUL0GdmNazJkgC+kG2f4ihQq01MDpzvxCvvKIvw4rXMwQEZYpoKC9o
	 Er5zf8sX3yQ53VTLE8j7+xyHR0lqAMZzfF1TT8ijpSBasT+UaBgwafhE235h4GjS03
	 wu7LQBv2vtjzsznTJC+w8rFQ3D9EupmUopDCUqCbz07pdvrH5UJAoGyRgmjpoWzY0z
	 xQmgwTJmDPCMOjoTmvE3TWjWU5/VbMIKoiGqR2bxbU/pDgHIHeXLCPQj1KES8LXhd6
	 BzhdNA/n1AdHw64yga6Ul6PrAdOIGITUZWU6ImoV7WGk0Q7MQcaV6zmCrMiurTcyVB
	 fRnEDhn+jPMXKQITdX9nfGSBnXlawAoOLf01P38gwr38Op/7es+qRYwWKXWOGMsluu
	 gRQjUo+kqELeGE80P3LmFDrc=
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so16515354eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:00:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793692843; x=1794297643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axvLEFAtLHuXEMPFGyntKrpt+rf9qpIaNSM/g7iVnHA=;
        b=coiTRneaUtI9mR4DkyOHzspm8SDfUMioGxS7SEVDT0b1xyWBhV+KiCkoMksU+4YH1z
         Y07rpVTrPujY6yKe9NPeCeP/hTXC0P+uC2AgFqaCFkVGnKjlGHmN+bVeU1TZUufUbUtH
         2CKRqL2iGB/rtEIKeCUTGaaKZhn8Zunbrf43CzV7BMUlZEByo3RgabDLX3iw8iatu0xu
         +nG0oCp6j2+o8wthhg6omCFWf16GoDzCimDn9W2zsuyOoO82QLACX7KIaWrhs1wln0lO
         e/ALI4cpTSYRmlieQwUbYUvMoC9QrqrkdVsjdq+HVUomI+5uTvByvWxZD9N616OlN08U
         jQXg==
X-Forwarded-Encrypted: i=1; AKwUvBylom9EZ3zvoi3zouKdpzBALXOfNQcEcHflMpQM4wP0MqJWxz53BR5OBRXttE/rwInqGZ+Bww1vcNDdDG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aoHAGhgD8hP8232dGOB4IMAgnxvvxNx1YR7mS3qJ4lTaF7WwX
	raWOzjLAjNQnU0eTm09jIwpmTFqEZr5SoKlu4rgG2h4cw3AkiK0vFtcgqjGPXklJiJvZ4yLo66Z
	mCuPeFwV64ZGlud3F/7CmeFuC6IbMmwMzvuXTU1qCdRSy641VIOag+lVrRULwfX6dZk6WwYMx9r
	yTUHcFmQ==
X-Gm-Gg: AYBFou3NLMRqT9GDit89JzKqb8DK1x82boeBWHrp0w2yvv1xKeHZcNrnUdHI6bz4CdL
	S88FxG3NB/FFcAUU0bch1a5dBapnzqH50uA/6Fzm4pTz2S0xXB7Ad53pws5Ql7Kxn+p5I3Wa+9w
	DUvFFlFl2B3SDnnk7uXEVmzmSPILTpLQphK8loMmNPoK5DGIr9B4SZgSvekcWr6udu0EnomwQx6
	iEkaAmrt7oQXwfRlNHxS2fuYfjufp2wGMZCR577SRZnLqkQW8WkifAOp4tEVULVb4ap8sJp4NoJ
	VtRCjB7PMwDYtUZUpPPmeIKkz4dgjtJlgzhaMPyTSbS2Z5ymP6nvzMR8SpMpN3KoqGGtR1tqkdk
	PYgYlkkhBLcAB4jxGlEWAxJjl2Y4ZTrBCCvv3jlesR82G7DpF4ThChDzalFeEMpCwptZn50oXuK
	kx+suCTxsW9+aWCo2gQw==
X-Received: by 2002:a05:693c:65d6:b0:368:72f0:353a with SMTP id 5a478bee46e88-36a42431e17mr15518473eec.38.1793692842732;
        Tue, 03 Nov 2026 00:00:42 -0800 (PST)
X-Received: by 2002:a05:693c:65d6:b0:368:72f0:353a with SMTP id 5a478bee46e88-36a42431e17mr15518408eec.38.1793692842058;
        Tue, 03 Nov 2026 00:00:42 -0800 (PST)
Received: from Garunix (122-58-163-222-fibre.sparkbb.co.nz. [122.58.163.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af4e6sm37885274eec.4.2026.11.03.00.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:00:41 -0800 (PST)
From: Matthew Ruffell <matthew.ruffell@canonical.com>
To: Waiman Long <longman@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Caron Wills <caron.wills@pulsar.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: [PATCH 3/6] mm/folio, mm/mlock: Don't batch folios in per-CPU LRU caches on isolated CPUs
Date: Tue,  3 Nov 2026 20:59:37 +1300
Message-ID: <20261103075940.110308-4-matthew.ruffell@canonical.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103075940.110308-1-matthew.ruffell@canonical.com>
References: <20261103075940.110308-1-matthew.ruffell@canonical.com>
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

From: Caron Wills <caron.wills@pulsar.com>

Folios are collected in per-CPU folio batches (cpu_fbatches and
mlock_fbatch) before being added to or moved on the LRU lists. Another
CPU can only empty such a batch by queueing lru_add_drain_per_cpu() on
the owning CPU and waiting for it in __lru_add_drain_all(), which is
what every lru_add_drain_all() caller (compaction, khugepaged, memory
hotplug, memfd, drop_caches, ...) and every lru_cache_disable() caller
(page migration through cpuset.mems, mbind() and move_pages(),
alloc_contig_range(), memory offlining) does.

On an isolated CPU that per-CPU kworker may not run for a very long
time, or ever: low latency deployments pin a SCHED_FIFO busy-polling
thread to each isolated CPU, and since RT bandwidth throttling is gone
nothing forces such a thread to yield to a SCHED_NORMAL kworker. Any
folio left in that CPU's batch then blocks the waiting caller.

LP: #2165410 hits exactly this. Writing cpuset.mems for a cgroup on a
192-CPU AWS instance with nohz_full CPUs 18-95,108-178 running FIFO
spinners makes cpuset_migrate_mm_workfn() -> do_migrate_pages() ->
lru_cache_disable() -> __lru_add_drain_all() -> flush_work() wait for
the kworkers on those CPUs, and PID 1 (systemd), which flushes the
migration workqueue from task_work before returning to userspace, stays
in D state for 2 to 10 minutes. logind cannot create sessions meanwhile
and SSH logins fail. The reproducer, a FIFO/80 thread per isolated CPU
that touches and MADV_DONTNEEDs a 24 MB buffer in a loop, keeps 1 to 14
folios in the lru_add batch of every isolated CPU at all times.

Stop batching on isolated CPUs: when the current CPU is isolated, move
the folio to the LRU immediately through an on-stack batch, without
touching the per-CPU batch at all. The latter matters: __lru_add_drain_all()
samples the per-CPU counters without the owning CPU's local_lock, so a
folio that sits in the batch even for the few instructions between
folio_batch_add() and an immediate drain is enough to get work queued on
that CPU. A first version of this patch reused the lru_cache_disabled()
add-then-drain path and was caught doing exactly that in testing.
cpu_needs_drain() now stays false for isolated CPUs and
__lru_add_drain_all() never queues work on them. The per-CPU buffer_head
LRU has been skipping isolated CPUs the same way since commit 8a237adf213d 
("fs/buffer.c: disable per-CPU buffer_head cache for isolated CPUs"),
and mm/memcontrol.c schedule_drain_work() does not queue memcg stock drains
on them either.

The cost is one lruvec lock acquisition per folio instead of one per
batch of 15 on isolated CPUs, which are not expected to do bulk memory
work. Nothing changes on housekeeping CPUs or on systems without CPU
isolation, where cpu_is_isolated() is a static-key guarded test.

Link: https://bugs.launchpad.net/bugs/2165410
Signed-off-by: Caron Wills <caron.wills@pulsar.com>
Signed-off-by: Matthew Ruffell <matthew.ruffell@canonical.com>
---
 mm/folio.c    | 21 ++++++++++++++++++++-
 mm/internal.h | 28 ++++++++++++++++++++++++++++
 mm/mlock.c    | 28 ++++++++++++++++++++++------
 3 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/mm/folio.c b/mm/folio.c
index 35e242b48870..7f85747910d7 100644
--- a/mm/folio.c
+++ b/mm/folio.c
@@ -208,6 +208,16 @@ static void folio_batch_move_lru(struct folio_batch *fbatch, move_fn_t move_fn)
 	folios_put(fbatch);
 }
 
+/* Move a single folio to the LRU without touching the per-CPU batches. */
+static void folio_move_lru_now(struct folio *folio, move_fn_t move_fn)
+{
+	struct folio_batch fbatch;
+
+	folio_batch_init(&fbatch);
+	folio_batch_add(&fbatch, folio);
+	folio_batch_move_lru(&fbatch, move_fn);
+}
+
 static void __folio_batch_add_and_move(struct folio_batch __percpu *fbatch,
 		struct folio *folio, move_fn_t move_fn, bool disable_irq)
 {
@@ -220,7 +230,9 @@ static void __folio_batch_add_and_move(struct folio_batch __percpu *fbatch,
 	else
 		local_lock(&cpu_fbatches.lock);
 
-	if (!folio_batch_add(this_cpu_ptr(fbatch), folio) ||
+	if (lru_batching_bypassed())
+		folio_move_lru_now(folio, move_fn);
+	else if (!folio_batch_add(this_cpu_ptr(fbatch), folio) ||
 			!folio_may_be_lru_cached(folio) || lru_cache_disabled())
 		folio_batch_move_lru(this_cpu_ptr(fbatch), move_fn);
 
@@ -856,6 +868,13 @@ static inline void __lru_add_drain_all(bool force_all_cpus)
 	WRITE_ONCE(lru_drain_gen, lru_drain_gen + 1);
 	smp_mb();
 
+	/*
+	 * Isolated CPUs don't batch folios (see lru_batching_bypassed()), so
+	 * their counters stay at zero and no work gets queued to them.  This
+	 * matters because the per-CPU kworker of an isolated CPU may not get
+	 * to run for a very long time, if ever, and flush_work() below would
+	 * wait for it.
+	 */
 	cpumask_clear(&has_work);
 	for_each_online_cpu(cpu) {
 		struct work_struct *work = &per_cpu(lru_add_drain_work, cpu);
diff --git a/mm/internal.h b/mm/internal.h
index 566cbd2dce48..5888f7b5ea5c 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -17,6 +17,7 @@
 #include <linux/pagewalk.h>
 #include <linux/rmap.h>
 #include <linux/swap.h>
+#include <linux/sched/isolation.h>
 #include <linux/leafops.h>
 #include <linux/tracepoint-defs.h>
 
@@ -1006,6 +1007,33 @@ bool need_mlock_drain(int cpu);
 void mlock_drain_local(void);
 void mlock_drain_remote(int cpu);
 
+/*
+ * Folios are normally parked in per-CPU batches (cpu_fbatches and
+ * mlock_fbatch) before they are moved to the LRU lists. A remote CPU can
+ * only empty such a batch by queueing lru_add_drain_per_cpu() on the owning
+ * CPU and waiting for it, see __lru_add_drain_all(). On an isolated CPU that
+ * kworker may not get to run for a long time, e.g. because a SCHED_FIFO task
+ * busy-loops there, and every lru_add_drain_all() or lru_cache_disable()
+ * caller in the system then blocks behind it.
+ *
+ * Isolated CPUs therefore bypass the per-CPU batches entirely and move
+ * folios to the LRU lists right away, through an on-stack batch. The folio
+ * must not even transiently sit in the per-CPU batch: __lru_add_drain_all()
+ * samples the batch counters without the owning CPU's lock, so the few
+ * instructions between folio_batch_add() and an immediate drain are enough
+ * to get work queued on the isolated CPU. The per-CPU buffer_head LRU
+ * (bh_lru_install()) and the memcg stock drain (schedule_drain_work())
+ * already stay away from isolated CPUs the same way.
+ *
+ * Callers hold the batch's local_lock, so smp_processor_id() is stable. The
+ * housekeeping cpumask consulted by cpu_is_isolated() is RCU protected.
+ */
+static inline bool lru_batching_bypassed(void)
+{
+	guard(rcu)();
+	return cpu_is_isolated(smp_processor_id());
+}
+
 extern pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
 
 static inline unsigned long __vma_address(const struct vm_area_struct *vma,
diff --git a/mm/mlock.c b/mm/mlock.c
index 67ae9b18b923..3bb8195e5c5f 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -209,6 +209,16 @@ static void mlock_folio_batch(struct folio_batch *fbatch)
 	folios_put(fbatch);
 }
 
+/* Handle a single folio right away, without touching the per-CPU batch. */
+static void mlock_folio_now(struct folio *folio)
+{
+	struct folio_batch fbatch;
+
+	folio_batch_init(&fbatch);
+	folio_batch_add(&fbatch, folio);
+	mlock_folio_batch(&fbatch);
+}
+
 void mlock_drain_local(void)
 {
 	struct folio_batch *fbatch;
@@ -254,8 +264,10 @@ void mlock_folio(struct folio *folio)
 	}
 
 	folio_get(folio);
-	if (!folio_batch_add(fbatch, mlock_lru(folio)) ||
-	    !folio_may_be_lru_cached(folio) || lru_cache_disabled())
+	if (lru_batching_bypassed())
+		mlock_folio_now(mlock_lru(folio));
+	else if (!folio_batch_add(fbatch, mlock_lru(folio)) ||
+		 !folio_may_be_lru_cached(folio) || lru_cache_disabled())
 		mlock_folio_batch(fbatch);
 	local_unlock(&mlock_fbatch.lock);
 }
@@ -277,8 +289,10 @@ void mlock_new_folio(struct folio *folio)
 	__count_vm_events(UNEVICTABLE_PGMLOCKED, nr_pages);
 
 	folio_get(folio);
-	if (!folio_batch_add(fbatch, mlock_new(folio)) ||
-	    !folio_may_be_lru_cached(folio) || lru_cache_disabled())
+	if (lru_batching_bypassed())
+		mlock_folio_now(mlock_new(folio));
+	else if (!folio_batch_add(fbatch, mlock_new(folio)) ||
+		 !folio_may_be_lru_cached(folio) || lru_cache_disabled())
 		mlock_folio_batch(fbatch);
 	local_unlock(&mlock_fbatch.lock);
 }
@@ -298,8 +312,10 @@ void munlock_folio(struct folio *folio)
 	 * which will check whether the folio is multiply mlocked.
 	 */
 	folio_get(folio);
-	if (!folio_batch_add(fbatch, folio) ||
-	    !folio_may_be_lru_cached(folio) || lru_cache_disabled())
+	if (lru_batching_bypassed())
+		mlock_folio_now(folio);
+	else if (!folio_batch_add(fbatch, folio) ||
+		 !folio_may_be_lru_cached(folio) || lru_cache_disabled())
 		mlock_folio_batch(fbatch);
 	local_unlock(&mlock_fbatch.lock);
 }
-- 
2.55.0


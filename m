Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32FC2561A2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042578; cv=none; b=ogb5U2f+/n+qy7fnI3DG1LLc8Q/IHd4NyOlGDfFt6tDvr5d/Y/XyJSwpQcOUv5neZx2dQ+YMoeIo4pc4KFWvgucUOPccaBHqDEnFBJkb5Xqfvn1FCqektKyJNy5fXjIgwAwxJncLj6b99bRbbG456Ns+O/ihkziQZkzcaKUOkmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042578; c=relaxed/simple;
	bh=DV5W7+ftr+8JV/8aE+TuA3HpLqB/iTiTmFrvWlzLgaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G6Ehr2hr8fWkctBKDCmk5UT0+KuQa/rZCx6l/Mod1J2p0Pa/fuv21cgXQ7DNLFmUPCJS18o6f/6hnbN77GoftXHwwH7Bta3FpgevKq3mcEFSclHqGrZpuGZHQ/mBSEAFtELcs3al1dnLqB4kaOGvy3xc7LQrmevjqWinkK6T8oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcKKkMwG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcKKkMwG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e946155442so10680435ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042576; x=1792647376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5jCMfqHYuHZoKneOf0AX3dfIs1eYeLWU8lTx7TNOe3k=;
        b=DcKKkMwG7S4ysxUnIS8bPSJYX05mR8zgG5G7J1ipUVEWlL7uowz6rCKN2ehFv3aocb
         xw+a2R2ZGBLxaU8QyBcFhCpODkJDBB6QUSMjX1JlvOhS/YVI5OAD1J5alVsjtisXeIbH
         E+KUVJKswo+285T2th0FSvKxKsChi8kS+LSoD0QJeCBCYFwNjKXF7Vmj+/NhzOS8KsWI
         m6xw17WsDcseHPJOOjx5VCQhptiNgOojggQfiAjllHPt/W0+xFPry2nlkxLGz1UQJxyW
         9yvoKSvwAvbKv+BVFJo2E2d/YCzp0pMeID6yJCCIgRqwfjHzuBxG/8QIYHW23RUZSsNT
         Cdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042576; x=1792647376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jCMfqHYuHZoKneOf0AX3dfIs1eYeLWU8lTx7TNOe3k=;
        b=vVX5+GUCk6S8CaQx5VRdl+JDJeI76l+kPac66uQiJ1CrNujsagNy/h4/2Pe7+IW51C
         8Ey2Sws2YTWmoUpOmN+T/yA6ly4pediC/dgowsPh53uXrcIbKgtmh5hg01SyjZxnQJY7
         Mjd/beYc87VEB5qSHaCHPuVOd0fptTp6iF9MSxc9u7HNLlQIp8R5Ueq5a+PMn6i9ZmdM
         ONBSs+zcXA+BqQenTcvTmKzUulzGNkrOyuJ4fJmbm1efouKPrLCd891Yg+Zlb/fnKQ/l
         b6EfSwRanXsmnlAuObQph5c/5VEG7q8exfJTeJbRl0JOEpNwSClXic/E/7pVC83rpCn1
         USVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHV2ilfDkolw4zfTClWduEPDtMd1Rk4FLEDmK2cJVii9oVXrHNQJ/oXjh4OB1iu2Npfa2o6xQIcqjSpbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoobGaG424N1PIFkqZjoRS70ZCIhbgPLW2YOsc6wXbbZ2Zvu1w
	ppC+az+Cv3MhfXpfNOAQgOgv1tGu9f2UA5SsOnzfiwPsFF2PNcSvWWuZ
X-Gm-Gg: AYBFou2jXNMKcSMltVrocdqxpp0J7gf8p4ib0MsNduzcGjHi2YbLkXC3VgAwLRxOlIh
	S6pNvMQkB0UOrV5+RYiRvlt9VoWFUYWpXkNgCm2/KrmhyG41ZXz9tfM7R89kR3fk9t8WwmA947z
	sjlMLO01/cBAW6Bts5jrFjJdJJIB800skY513KtOs8z6qPrOigNBnE1CIxKX8vEmCZEJ4eeaPZu
	HeCS4q/7qFG+kmtBamtdpw6n8i/BxvticK+MExMxOkoLG1zF1WN8apycgS4Bn8OmpfZdCpDBIs1
	KtuSl4wTm1v9UN9fgeZMkaVFF6hpV3Q8ZjPxyuk8YHzgB9Uc0V8g6ghSLlu8Ej2TSeMBzxvl/pk
	gv+QHcs/8sN/ncVeJi0FhVrqb/j9ECCRppJh7Y/aOgDTWks/aDWES8tI0Hr6iiVUORMsh0oaI6/
	wMBNQuhwAxOfyFbPtXf4s1lGiS+UfgHtyzL3wnRPfaQw8ErCn/Gom0hvvgqJV7a2Y/iv6yaEpYF
	8mo3IE6
X-Received: by 2002:a17:902:d50a:b0:2e2:e240:57eb with SMTP id d9443c01a7336-2e842aa6640mr157282915ad.12.1792042575898;
        Wed, 14 Oct 2026 22:36:15 -0700 (PDT)
Received: from localhost.localdomain ([2a05:dfc1:8bc4:feda::11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841432a03sm76171875ad.0.2026.10.14.22.36.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 22:36:15 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	yu.c.chen@intel.com,
	tim.c.chen@linux.intel.com
Cc: chen.yu@linux.dev,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	Jemmy Wong <jemmywong512@gmail.com>
Subject: [PATCH v3] sched/cache: Remove the old cache group footprint on exec
Date: Thu, 15 Oct 2026 13:36:04 +0800
Message-ID: <20261015053604.29927-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exec replaces the task's cache group before resetting its NUMA fault
statistics, but only the exit path subtracts the task's contribution
from the old group's footprint.

Although de_thread() removes other members of the executing task's
thread group, tasks sharing the mm through CLONE_VM without CLONE_THREAD
can retain the old mm and cache group. The executing task's contribution
then remains without further updates or decay, potentially suppressing
cache-aware aggregation through the LLC capacity check. A vfork() child
rarely accumulates NUMA faults before exec because scanning starts late;
the issue mainly concerns longer-lived CLONE_VM tasks. This was found by
code inspection, not a workload reproducer.

Simply subtracting on exec is insufficient: the unlocked read/modify/write
updates can race with NUMA placement by another task sharing the group,
which can overwrite the subtraction. Convert footprint to atomic_long_t
and use non-returning atomic add/sub operations, which require no ordering
against unrelated accesses. Apply the net change in total_numa_faults once
per placement pass to limit shared cache-line traffic.

Rename sched_cache_replace_grp() to sched_cache_switch_grp() to reflect
its expanded responsibility: subtract the task's contribution when leaving
the old group, publish the new pointer, and return the old reference for
the caller to release. Use it for both exec and exit, and document that
exec subtraction must precede task_numa_free() resetting the NUMA total.

With atomic updates, placement deltas balance the departing task's total,
so no write-side clamp is needed, provided the accounting fits in signed
long. Retain a defensive read-side clamp and warn on a negative footprint
observed by the LLC capacity check.

Keep the existing NUMA reset ordering. If exec fails after switching groups
but before resetting the statistics, exit can subtract the old total from
the new group. This mismatch is confined to the execing task's private
group: the task is past the point of no return and the group disappears on
exit. The surviving old shared group remains correctly accounted.

Fixes: b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_grp to fix UAF")
Suggested-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
---
v1: https://lore.kernel.org/all/20261009151215.62878-1-jemmywong512@gmail.com/
v2: https://lore.kernel.org/all/20261010111612.31345-1-jemmywong512@gmail.com/

Changes in v3:
- Convert grp->footprint to atomic_long_t and use atomic add/sub to avoid
  losing placement updates or exec/exit subtractions, as Chen Yu suggested.
- Update the group footprint once per NUMA placement pass, using the net
  change in p->total_numa_faults rather than updating each fault bucket.
- Rename sched_cache_replace_grp() to sched_cache_switch_grp() and move
  leave-group accounting into it, as agreed with Chen Yu. Exec and exit
  share the subtraction, guarded by old && old != new.
- Remove the write-side clamp now that updates are atomic. Use an atomic
  read, WARN_ON_ONCE(), and a defensive zero clamp in the capacity check.
- Explain the failed-exec over-subtraction case and why it is confined to
  the dying task's private group; leave NUMA reset ordering unchanged.
- Add Suggested-by: Chen Yu. Drop Tim Chen's Reviewed-by tag because the
  accounting changes are substantial and need renewed review.

Changes in v2:
- Mention vfork(), explain that longer-lived CLONE_VM tasks are the main
  concern, and state that the issue was found by code inspection.
- Add the Fixes tag and document that exec footprint subtraction must
  precede task_numa_free() resetting p->total_numa_faults.
- Add Tim Chen's Reviewed-by tag (not carried forward to v3).

Validation:
- Strict checkpatch and whitespace checks passed.
- Built kernel/sched/{fair,core,build_utility}.o on x86-64 with:
  - CONFIG_SCHED_CACHE=y, CONFIG_NUMA_BALANCING=y
  - CONFIG_SCHED_CACHE=y, CONFIG_NUMA_BALANCING=n
  - CONFIG_SCHED_CACHE=n, CONFIG_NUMA_BALANCING=y
- Runtime and performance testing have not been performed.

 include/linux/sched.h |  3 +-
 kernel/sched/fair.c   | 84 +++++++++++++++++--------------------------
 2 files changed, 35 insertions(+), 52 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index d35ae49a991f..4a02a47c988e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2412,7 +2412,8 @@ struct sched_cache_group {
 	unsigned long epoch;
 	u64 nr_running_avg;
 	unsigned long next_scan;
-	unsigned long footprint;
+	/* Sum of the member tasks' accounted footprints, in pages. */
+	atomic_long_t footprint;
 	int cpu;
 	refcount_t refcnt;
 	struct rcu_head rcu;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..47faa0bf12c7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1483,6 +1483,7 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 #ifdef CONFIG_NUMA_BALANCING
 	unsigned long llc, footprint;
 	struct sched_domain *sd;
+	long fp;
 	int scale;

 	guard(rcu)();
@@ -1497,7 +1498,9 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 		 * excluded.
 		 */
 		llc = sd->llc_bytes;
-		footprint = READ_ONCE(grp->footprint);
+		fp = atomic_long_read(&grp->footprint);
+		WARN_ON_ONCE(fp < 0);
+		footprint = max(fp, 0L);

 		/*
 		 * Scale the LLC size by 256*llc_aggr_tolerance
@@ -1677,7 +1680,7 @@ int mm_init_sched(struct mm_struct *mm,
 	grp->cpu = -1;
 	grp->next_scan = jiffies;
 	grp->nr_running_avg = 0;
-	grp->footprint = 0;
+	atomic_long_set(&grp->footprint, 0);
 	refcount_set(&grp->refcnt, 1);
 	/*
 	 * The update to grp->pcpu_sched should not be reordered
@@ -1719,12 +1722,26 @@ DEFINE_FREE(sched_cache_group_put, struct sched_cache_group *,
 #define rcu_deref_sched_cache_grp(tsk) \
 	rcu_dereference_check((tsk)->sched_cache_grp, (tsk) == current)

-static struct sched_cache_group *sched_cache_replace_grp(struct task_struct *p,
-							 struct sched_cache_group *new)
+static inline void sched_cache_footprint_update(struct task_struct *p, long delta)
+{
+	struct sched_cache_group *grp = rcu_deref_sched_cache_grp(p);
+
+	if (grp && delta)
+		atomic_long_add(delta, &grp->footprint);
+}
+
+/* Remove the old contribution and return the old group for the caller to put. */
+static struct sched_cache_group *sched_cache_switch_grp(struct task_struct *p,
+							struct sched_cache_group *new)
 {
 	struct sched_cache_group *old;

 	old = rcu_deref_sched_cache_grp(p);
+#ifdef CONFIG_NUMA_BALANCING
+	/* Other tasks sharing the old mm can keep its group alive after exec. */
+	if (old && old != new)
+		atomic_long_sub(p->total_numa_faults, &old->footprint);
+#endif
 	rcu_assign_pointer(p->sched_cache_grp, new);

 	return old;
@@ -1778,28 +1795,18 @@ void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
 	/*
 	 * Acquire the new reference before publishing the pointer, then drop
 	 * the old one. @p is current and the only writer of its own pointer.
+	 *
+	 * Footprint subtraction must precede task_numa_free() in bprm_execve(),
+	 * which clears p->total_numa_faults. Nothing here enforces that order.
 	 */
-	old = sched_cache_replace_grp(p, sched_cache_group_get(mm->sched_cache_grp));
+	old = sched_cache_switch_grp(p, sched_cache_group_get(mm->sched_cache_grp));
 	sched_cache_group_put(old);
 }

 void sched_cache_exit_mm(struct task_struct *p)
 {
-	struct sched_cache_group *grp = sched_cache_replace_grp(p, NULL);
-
-#ifdef CONFIG_NUMA_BALANCING
-	/*
-	 * Subtract this task's footprint from the group before dropping the
-	 * reference, so the group footprint converges as its threads exit.
-	 * Unlocked for performance; clamp to avoid underflow.
-	 */
-	if (grp && p->total_numa_faults) {
-		unsigned long fp = READ_ONCE(grp->footprint);
-		unsigned long sub = min(fp, p->total_numa_faults);
+	struct sched_cache_group *grp = sched_cache_switch_grp(p, NULL);

-		WRITE_ONCE(grp->footprint, fp - sub);
-	}
-#endif
 	sched_cache_group_put(grp);
 }

@@ -2189,6 +2196,9 @@ void init_sched_mm(struct task_struct *p)
 static inline void account_mm_sched(struct rq *rq, struct task_struct *p,
 				    s64 delta_exec) { }

+static inline void sched_cache_footprint_update(struct task_struct *p,
+						long delta) { }
+
 void init_sched_mm(struct task_struct *p) { }

 static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
@@ -3883,14 +3893,13 @@ static int preferred_group_nid(struct task_struct *p, int nid)
 static void task_numa_placement(struct task_struct *p)
 	__context_unsafe(/* conditional locking */)
 {
-	struct sched_cache_group __maybe_unused *grp;
 	int seq, nid, max_nid = NUMA_NO_NODE;
 	unsigned long max_faults = 0;
 	unsigned long fault_types[2] = { 0, 0 };
+	unsigned long old_faults = p->total_numa_faults;
 	unsigned long total_faults;
 	u64 runtime, period;
 	spinlock_t *group_lock = NULL;
-	long __maybe_unused new_fp;
 	struct numa_group *ng;

 	/*
@@ -3965,36 +3974,6 @@ static void task_numa_placement(struct task_struct *p)
 				ng->total_faults += diff;
 				group_faults += ng->faults[mem_idx];
 			}
-#ifdef CONFIG_SCHED_CACHE
-			/*
-			 * Per task p->numa_faults[mem_idx] converges,
-			 * so the accumulation of each task's faults
-			 * converges too - Given the number of threads,
-			 * it cannot overflow an unsigned long.
-			 * Racy with concurrent updates from other threads
-			 * sharing this mm. Acceptable since footprint is a
-			 * heuristic and occasional lost updates are tolerable.
-			 *
-			 * If a task exits, its corresponding footprint must
-			 * be subtracted from p->sched_cache_grp->footprint,
-			 * otherwise the footprint will not converge: the
-			 * exiting thread's footprint remains unchanged/undecayed.
-			 * See exit_mm().
-			 *
-			 * Lost updates and unsynchronized subtraction
-			 * in exit_mm() can cause footprint + diff to
-			 * go negative. Clamp to zero to prevent the
-			 * unsigned footprint from wrapping.
-			 */
-			scoped_guard(rcu) {
-				grp = rcu_dereference(p->sched_cache_grp);
-
-				if (grp) {
-					new_fp = (long)READ_ONCE(grp->footprint) + diff;
-					WRITE_ONCE(grp->footprint, max(new_fp, 0L));
-				}
-			}
-#endif
 		}

 		if (!ng) {
@@ -4017,6 +3996,9 @@ static void task_numa_placement(struct task_struct *p)
 		max_nid = preferred_group_nid(p, max_nid);
 	}

+	/* Apply the net change once per placement pass to limit cache-line traffic. */
+	sched_cache_footprint_update(p, p->total_numa_faults - old_faults);
+
 	if (max_faults) {
 		/* Set the new preferred node */
 		if (max_nid != p->numa_preferred_nid)
--
2.25.1


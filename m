Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639188;
	b=f/wRNgGy5hPGoqTCiMMwQFy2coWt0oNuUQbpDnaEMPs1QKxTVb1bbypbzBOLaKY66ME7
	 /EjCOCoql6aGFyxuEPvSBGcGyiPJY8saXp2Fk9ilMtMVQt1v5M7JOoMXDxtJO7HEzCahx
	 8oBBD/5j3t5E10JZNzPmhFFnAkrL/Gj3D3eMwqkhSnRJgHYQd3mb6GbpWi+gn5/MK08/M
	 5kke8Oih7VoFDSlEzX79eAqqTNepid8F/Dg7EcrK4MyDDMLWQPCs40e+qOSRFdcJ1DZ3o
	 8nitlYuS103BasZPUk2Oj7qPq/V60QCsSF03wGJhznEQewMNlpXz0o2B3UYUaJfL9fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qkx2vN5MAYxqpI3Lak3hsEW2qVTL4Xsx4WLX1J+7XIk=;
	b=HL+hnJ8JePp4Jn9t6brgs7etQA9uvFVOmqWZzsxebeFaGlhWnVkB2NKWQ+GXED9d4O0C
	 tP3Nqko8KRSwKC1owHz3BZUjBR2mYeQxqFkb76nk1+0cUU9rd5zH9EsoNe3tnT3HNiDFN
	 rslKAjipmmscNvpJvaH2nSoldVDO19hZc4ERjW7jfZoVJtV/SJGwMCRj5I6g7qKdwlhsz
	 2sdZEDgLGbwJP7CtluqiFdR3j28DuHty35q8KuuNxgj6YWe0FRtrCpC+OEkH7PPWvKwjc
	 fbLFVyUTmAJauoYRYOjGhN450fYTz0npPz379GEP1US666AJhEWPHQJxbJ5/m7zMSew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RTPOOUEW;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EED9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EED9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RTPOOUEW
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso502685b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792639188; x=1793243988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qkx2vN5MAYxqpI3Lak3hsEW2qVTL4Xsx4WLX1J+7XIk=;
        b=RTPOOUEWWorK67HxaDAOpiLRpcQGL3HI+BFZ9aYC/vtiro4MVEuUrpggA1AaFbpXoY
         Rl5db2rbuqit4HoTyWI0O0i9sY6EvZEv/beAZyuD84zXqX/Zv3pqdPDRqiS0flJKHfFE
         tU3GA+ZtLqJJOndfh6Jh5fcP9RXquoU9Kc8MRrztyuGAIduESw9tVRY6/31E20fRO9+t
         pWPZTYLYX+tvoDJZ0zp+yLeXDl7fRBAabjW2xeqtpRx+ecXkNmJsvki9Bc4Eup4LZXkq
         csozhXCnOBXnW4K8FZTVE943+v7LSQFJii+8+XqfuU4LwM2Eudoc56dVibUXk5e7AkE2
         0wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792639188; x=1793243988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qkx2vN5MAYxqpI3Lak3hsEW2qVTL4Xsx4WLX1J+7XIk=;
        b=v9pqhaHjeh2YUNHrG8s/ZJC4Y++JDpweb8T2ZfgMg0y3ERPBQ/Hp5iYw/M4N1DDpoS
         OTXwEnVMSVqUSeqfR12Tuirp/4bpQYdolqVBhGK6hHzUJs8pr1zfsxJwjyNdDM2srXR2
         eCLT6VUZCkeDl+hCWxXhaYw1IS19OuyuWTzucxp0ucyAO/blAXn4WHIQSJ3JqtvDZntK
         /hcw5xyC6D0Q+8YA/4Y0x2bXrt02Ep08ACSfe26v0kMIJluXziB+l4hlR1LqflqV+Z+q
         S9J3m0+sPO6OLt+gXq3fztnxf55tuPIFxXIEPlby7ayRya5MRloNqzv43TlJn2p1iVm7
         rF9g==
X-Forwarded-Encrypted: i=1; AKwUvBzt/ISDebI8M1WB1+V54QCkoyzfHFJDc4xnpHFVkpp1/fK+ruxVjThhBHYSd7DeWDnKB5mcrhc5yg8Pf7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgpxvhd89XY5thX8d6lfRBLB0xzDNObB+YzJGUzvQ2LorzXnMP
	x/BGXNUqFEbzB6unZz7kLJziZOxw7n2I7DFiecajSPyjYlIYGWtXVEMn
X-Gm-Gg: AYBFou02DV7fW1ftaO824k9ZCYhoQMAQGNsUKx/syfBGBTgZ85SVj/Rqn6WxLtRtHWY
	D8hLZRRijw2/45QK5MM3h8OPCSBXxSwpS0IOhAZT7q8EDAuUbplbn1AI2Rft/5rBxlbM+/gveSl
	VABb0E4c3v44Xmuic0yNc/jDLASFdhe9XAsDF56WCyGpXaiwaJUsBVEJnCLMqRq532iydm6ejV+
	uLsx9SyeI+JtzCkCElgKOMwXbKSSTSsP6B4AN76lOLhvoHNWdbrGXhQ+rC1zewmYT6++3NSCSMT
	cq72/VCQGrqHnhQkuLFWqg9oiN967chjwEDcsXOYno61WLebIBc0qXndeabX7vRO5FSGchzsZn6
	XCraKA9hdgSEd6MwxfJz9YqomccQ6sJx7d+ssoAJzFdjUYL0UUB8RYjxAa4oROvkiqSXYFkXVMg
	cUfY4I8sfuBJANWtUqNAEVLwnzEpvqq0SdNDwzvz7wyC+Y7MynpMOM69ezYzlf+KufVcwHr0XCx
	UxH0WvBJDK9/hrTQJDQ+Fo4CZQiKRQ+l7ZpzY/5mdQrG+WdYt8pCi8=
X-Received: by 2002:a05:6a00:3c84:b0:89f:fc75:6d99 with SMTP id d2e1a72fcca58-8a089ef7a4amr3004857b3a.60.1792639187454;
        Wed, 21 Oct 2026 20:19:47 -0700 (PDT)
Received: from localhost.localdomain ([2a05:dfc1:8bc4:feda::10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a08933a9e3sm1470513b3a.8.2026.10.21.20.19.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 20:19:45 -0700 (PDT)
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
Subject: [PATCH v4] sched/cache: Remove the old cache group footprint on exec
Date: Thu, 22 Oct 2026 11:19:33 +0800
Message-ID: <20261022031933.46869-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Exec switches cache groups without subtracting the task's old footprint.
CLONE_VM tasks without CLONE_THREAD can retain the old mm and group
despite de_thread(), leaving an undecayed contribution that can suppress
cache-aware aggregation. This mainly affects longer-lived CLONE_VM tasks:
vfork() children rarely accumulate NUMA faults before exec because scanning
starts late. Found by inspection, without a workload reproducer.

Rename sched_cache_replace_grp() to sched_cache_switch_grp() and share
exec/exit accounting: subtract the old contribution, publish the new
pointer, and return the old reference for release. Exec subtraction must
precede task_numa_free() clearing total_numa_faults.

Convert footprint to atomic_long_t so concurrent placement updates
cannot overwrite exec/exit subtractions. Use non-returning atomic
add/sub, requiring no ordering against unrelated accesses, and apply
the net total_numa_faults delta once per placement pass to reduce
cache-line traffic. Assuming signed long accounting does not overflow,
updates balance without a write-side clamp; retain the defensive
read-side zero clamp and negative-value warning.

Keep NUMA reset ordering unchanged. If exec fails after switching groups
but before resetting statistics, exit can subtract the old total from
the new, private group. The task is past the point of no return, so that
group dies on exit; the surviving old shared group remains correctly
accounted.

Fixes: b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_grp to fix UAF")
Suggested-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
Assisted-by: LLM

---

v3: https://lore.kernel.org/all/20261015053604.29927-1-jemmywong512@gmail.com/
v2: https://lore.kernel.org/all/20261010111612.31345-1-jemmywong512@gmail.com/
v1: https://lore.kernel.org/all/20261009151215.62878-1-jemmywong512@gmail.com/

Changes in v4:
- Restore the footprint convergence comment next to the batched update in
  task_numa_placement(), referring to atomic_long_t as Chen Yu requested.
- Add Chen Yu's Reviewed-by, Tested-by and Assisted-by tags.
- Shorten the commit description while retaining the accounting rationale.

Changes in v3:
- Use atomic_long_t and atomic add/sub to prevent lost accounting updates.
- Batch placement updates using the net total_numa_faults delta.
- Rename sched_cache_replace_grp() to sched_cache_switch_grp(); share
  exec/exit subtraction, guarded by old && old != new.
- Drop the write-side clamp; use an atomic read, warning and zero clamp.
- Document failed-exec over-subtraction in the dying task's private group;
  keep NUMA reset ordering unchanged.
- Add Chen Yu's Suggested-by; drop Tim Chen's Reviewed-by pending renewed
  review of the accounting changes.

Changes in v2:
- Mention vfork(), explain that longer-lived CLONE_VM tasks are the main
  concern, and state that the issue was found by code inspection.
- Add the Fixes tag and document that exec footprint subtraction must
  precede task_numa_free() resetting p->total_numa_faults.
- Add Tim Chen's Reviewed-by tag (not carried forward to v3).

Validation:
- v4: Strict checkpatch and whitespace checks passed.
- v3: Built kernel/sched/{fair,core,build_utility}.o on x86-64 with:
  - CONFIG_SCHED_CACHE=y, CONFIG_NUMA_BALANCING=y
  - CONFIG_SCHED_CACHE=y, CONFIG_NUMA_BALANCING=n
  - CONFIG_SCHED_CACHE=n, CONFIG_NUMA_BALANCING=y
- Chen Yu tested v3 with hackbench on a Xeon with multiple LLCs per node
  and reported no obvious performance difference. Some apparent
  regressions had large run-to-run variance; selected reruns were also
  unstable. His report is at:
  https://lore.kernel.org/all/atiP8TwaDDtbImRn@chenyu-dev/
- Build and runtime tests have not been rerun for this comment-only v4
  revision.


 include/linux/sched.h |  3 +-
 kernel/sched/fair.c   | 90 +++++++++++++++++++------------------------
 2 files changed, 41 insertions(+), 52 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 12a7e094a3e6..bb0a424b6ad8 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2391,7 +2391,8 @@ struct sched_cache_group {
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
index b5546cd27dba..ab5c117d32a2 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1427,6 +1427,7 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 #ifdef CONFIG_NUMA_BALANCING
 	unsigned long llc, footprint;
 	struct sched_domain *sd;
+	long fp;
 	int scale;

 	guard(rcu)();
@@ -1441,7 +1442,9 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 		 * excluded.
 		 */
 		llc = sd->llc_bytes;
-		footprint = READ_ONCE(grp->footprint);
+		fp = atomic_long_read(&grp->footprint);
+		WARN_ON_ONCE(fp < 0);
+		footprint = max(fp, 0L);

 		/*
 		 * Scale the LLC size by 256*llc_aggr_tolerance
@@ -1621,7 +1624,7 @@ int mm_init_sched(struct mm_struct *mm,
 	grp->cpu = -1;
 	grp->next_scan = jiffies;
 	grp->nr_running_avg = 0;
-	grp->footprint = 0;
+	atomic_long_set(&grp->footprint, 0);
 	refcount_set(&grp->refcnt, 1);
 	/*
 	 * The update to grp->pcpu_sched should not be reordered
@@ -1663,12 +1666,26 @@ DEFINE_FREE(sched_cache_group_put, struct sched_cache_group *,
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
@@ -1722,28 +1739,18 @@ void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
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
+	struct sched_cache_group *grp = sched_cache_switch_grp(p, NULL);

-#ifdef CONFIG_NUMA_BALANCING
-	/*
-	 * Subtract this task's footprint from the group before dropping the
-	 * reference, so the group footprint converges as its threads exit.
-	 * Unlocked for performance; clamp to avoid underflow.
-	 */
-	if (grp && p->total_numa_faults) {
-		unsigned long fp = READ_ONCE(grp->footprint);
-		unsigned long sub = min(fp, p->total_numa_faults);
-
-		WRITE_ONCE(grp->footprint, fp - sub);
-	}
-#endif
 	sched_cache_group_put(grp);
 }

@@ -2133,6 +2140,9 @@ void init_sched_mm(struct task_struct *p)
 static inline void account_mm_sched(struct rq *rq, struct task_struct *p,
 				    s64 delta_exec) { }

+static inline void sched_cache_footprint_update(struct task_struct *p,
+						long delta) { }
+
 void init_sched_mm(struct task_struct *p) { }

 static void task_tick_cache(struct rq *rq, struct task_struct *p) { }
@@ -3830,14 +3840,13 @@ static int preferred_group_nid(struct task_struct *p, int nid)
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
@@ -3912,36 +3921,6 @@ static void task_numa_placement(struct task_struct *p)
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
@@ -3964,6 +3943,15 @@ static void task_numa_placement(struct task_struct *p)
 		max_nid = preferred_group_nid(p, max_nid);
 	}

+	/*
+	 * Per task p->numa_faults[mem_idx] converges, so the accumulation of each
+	 * task's faults converges too. Given the number of threads, it cannot
+	 * overflow an atomic_long_t.
+	 *
+	 * Apply the net change once per placement pass to limit cache-line traffic.
+	 */
+	sched_cache_footprint_update(p, p->total_numa_faults - old_faults);
+
 	if (max_faults) {
 		/* Set the new preferred node */
 		if (max_nid != p->numa_preferred_nid)
--
2.54.0 (Apple Git-157)

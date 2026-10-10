Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B5C485CE4
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791630988; cv=none; b=BjDNnPdDG9GfqKs9ti+z3cmhSFU2Kn+Tu+HvVDjxrQx0F5rKVHwliZAQf0Wl63K95TkbopmtzJCtCMldBTRzfBJUm2tDUUiiY84XlTSwcQgNCUgus/DTKm76R0JQPuJ6nju/WCTIx4opx7VVfhv4rjeoTOpArfoCzAD/rZtxtfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791630988; c=relaxed/simple;
	bh=/5Oi2072IZTW9Sep4QfMQSOeOUIc6twtDr99qv5q8m4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DG1Ipi+V6i+aIWPqA2MlBni/wYJt79bOXeuDSKZOa/YL31nuwwCw4sQ8lH8d8604kaqQRXNAq6kmLAiAXGa64nwQKV3SniDclgP0NpcHEpODAB1M5tu3Y/TOlO+IKIaIv7ClfD+INfgs9xSVaFlWWcalGcwMGM2hXnGehIJ1iH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Owqr1yRj; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Owqr1yRj"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a706146559so283656a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791630984; x=1792235784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K03SRXp+zEhkNZF4oA4RdcIxXLxbmgWgRn2FFsyVA0c=;
        b=Owqr1yRjIJKNds3bbkiHEgLm6jD/2w8QqqI56WmpqLYPi/YRf77Xl+EyCLMbI8rML4
         3AL01YLwEZyWkzLN0QxQ/gIO/kNCUTF60lSVpb5R6RJ8q0LOjvQIMuvA/jyNRBmsGwnz
         kQEEswzH7NAjsaRFA1vOTzSF8iN6iPJ58PaAHqgDJWxlKFFuO2pUEElR9jPRUmnwUADF
         ApCQZyoEQJJK0EaJR02lD7oaOlvv+GQ4MVAcVRT9IhTwbglloGx5Lv95TSyiK+lU+7si
         uFDacXEC5RKF1mUPbjqkJySLYjypI6SseaA/ltivqxL7V/2K82olW0q2o6XU1knwjFGY
         Z1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791630984; x=1792235784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K03SRXp+zEhkNZF4oA4RdcIxXLxbmgWgRn2FFsyVA0c=;
        b=P3TFssMMlaV2NW2vAbhP2iEvSzgXiEBR7K+xDIDnPocy+ttWNByxtCInKNxRVDLoev
         9nTXTY+cuuXUIU7im/zPyKyNsM1xt8vj7qrThxg6ghLCoIgV8Bh+KxyQV9jeTVdx9hZO
         95rbi3CcQOyvZnhVtGTTKRhugNFIGPN3D1JUAcr2jqt2S+12dlNzmcScAyEy0nf5PYzK
         t+RlMYdgHTClBhbMeNMHBDNfh21QksXkERzo/WJczPf0b6YWdYWSPQ4ikFaYMpY6w74o
         ljiVzgYvVzlNxCAAOVIAlWXG0VWMXgSs+vyurx1MtPtbKriepqjEYe0HlQzJGWo1Dolp
         bntw==
X-Forwarded-Encrypted: i=1; AKwUvBzvIu/b6fu461guFjUOETwOLPOLRpCpiwKlgj26xe6oFD3CPTx8bOsJ4oxk6wRQ4tJWMBT3XYuy8Ef5rxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKHh8MIc49N9dg9YAiYhSE9N80ubsMcLoa1xPVtiad3bIOJfMj
	MN+PLaXnPl5jvShbtBWXoAAZR3Sc+TXVlIHSh5uwuouBfU2BwiYEXmCS
X-Gm-Gg: AYBFou0QGeN84HXptYn1KUozHBlmbIoshO6wfBmgPgORvR588w5hsVaAPbMk1OlS2ub
	lviaU/cEGARkdlmheYGhn28eSRXHzqE83bKsKEyr6lVLvONsLwueBZLjaHJOxyfZyiF7XiCPI3H
	/4rbAPI341v2A7z4Dt72pQamEKWt+9Oa2xai/sXdKK8gEvt++P5SZNdP5H4qmU1y0l98nPsLlc3
	MrVrgGC5BmuBkCTyb/u0SyylQbsQQJX3AMexvTC/pEX13R/CyANi4w5+BGg75hYVW+9xnLhNxRP
	QzYcjDbFmehMXzm1UxZYmfg/jy14zTFQu/oJb3z9ujkGhuoPYKYtrZA8yKVKeZ0mUMQtJ+TMrEc
	VW4apHfvjJOSA3Db2/6YQGLszJWYr2drM8hWNYKejunPCgavj0Mp9vhlkt/U22CQR+3WXDCsIzV
	WQv+KNMDQSdkxXmJVSzouJdaGqcBKYgDVZzG1VW8B3fTj4a7QSjeRGj/iL0VcPtKJVidRLIA==
X-Received: by 2002:a17:90b:4d85:b0:3a4:c946:9f4e with SMTP id 98e67ed59e1d1-3ab3acdc386mr3626687a91.58.1791630984205;
        Sat, 10 Oct 2026 04:16:24 -0700 (PDT)
Received: from localhost.localdomain ([2a05:dfc1:8bc4:feda::10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ca1e04sm8054932a91.1.2026.10.10.04.16.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:16:22 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tim Chen <tim.c.chen@linux.intel.com>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Chen Yu <yu.c.chen@intel.com>,
	linux-kernel@vger.kernel.org,
	Jemmy Wong <jemmywong512@gmail.com>
Subject: [PATCH v2] sched/cache: Remove the old cache group footprint on exec
Date: Sat, 10 Oct 2026 19:16:12 +0800
Message-ID: <20261010111612.31345-1-jemmywong512@gmail.com>
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
(e.g., vfork()) can retain the old mm and cache group. The executing
task's contribution then remains without further updates or decay,
potentially suppressing cache-aware aggregation through the LLC
capacity check.

A vfork child rarely accumulates NUMA faults before exec because NUMA
scanning starts late. The issue mainly concerns longer-lived CLONE_VM
tasks that accumulate NUMA faults and later exec. This issue was found
by code inspection, not a workload reproducer.

Factor the existing footprint subtraction into a helper and use it when
leaving a cache group on both exec and exit. Subtract before dropping the
old group reference, preserving the existing underflow protection.
Document that exec must subtract the contribution before
task_numa_free() resets p->total_numa_faults.

Fixes: b636fef85bda ("sched/cache: Introduce task_struct->sched_cache_grp to fix UAF")
Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>

---

v1: https://lore.kernel.org/all/20261009151215.62878-1-jemmywong512@gmail.com/

Changes in v2:
- Mention vfork() and that a vfork child rarely accumulates NUMA faults
  before exec. The leak mainly matters for longer-lived CLONE_VM tasks.
  Note that this was found by code inspection.
- Add a Fixes: tag.
- Comment that footprint subtraction must stay ahead of task_numa_free()
  in bprm_execve(), and that nothing enforces that order.
- Add Reviewed-by: Tim Chen.

 kernel/sched/fair.c | 55 +++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..719a3fc3651f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1771,6 +1771,25 @@ void sched_cache_fork_cleanup(struct task_struct *p)
 	RCU_INIT_POINTER(p->sched_cache_grp, NULL);
 }

+static void sched_cache_footprint_sub(struct sched_cache_group *grp,
+				      struct task_struct *p)
+{
+#ifdef CONFIG_NUMA_BALANCING
+	/*
+	 * Remove this task's contribution when it leaves the group, either
+	 * through exit or exec. Other thread groups sharing the old mm can
+	 * keep the group alive after exec resets this task's NUMA statistics.
+	 * Unlocked for performance; clamp to avoid underflow.
+	 */
+	if (grp && p->total_numa_faults) {
+		unsigned long fp = READ_ONCE(grp->footprint);
+		unsigned long sub = min(fp, p->total_numa_faults);
+
+		WRITE_ONCE(grp->footprint, fp - sub);
+	}
+#endif
+}
+
 void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
 {
 	struct sched_cache_group *old;
@@ -1778,8 +1797,13 @@ void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
 	/*
 	 * Acquire the new reference before publishing the pointer, then drop
 	 * the old one. @p is current and the only writer of its own pointer.
+	 *
+	 * Footprint subtraction must stay ahead of task_numa_free() in
+	 * bprm_execve(), which clears p->total_numa_faults. Nothing here
+	 * enforces that order.
 	 */
 	old = sched_cache_replace_grp(p, sched_cache_group_get(mm->sched_cache_grp));
+	sched_cache_footprint_sub(old, p);
 	sched_cache_group_put(old);
 }

@@ -1787,19 +1811,7 @@ void sched_cache_exit_mm(struct task_struct *p)
 {
 	struct sched_cache_group *grp = sched_cache_replace_grp(p, NULL);

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
+	sched_cache_footprint_sub(grp, p);
 	sched_cache_group_put(grp);
 }

@@ -3975,16 +3987,15 @@ static void task_numa_placement(struct task_struct *p)
 			 * sharing this mm. Acceptable since footprint is a
 			 * heuristic and occasional lost updates are tolerable.
 			 *
-			 * If a task exits, its corresponding footprint must
-			 * be subtracted from p->sched_cache_grp->footprint,
-			 * otherwise the footprint will not converge: the
-			 * exiting thread's footprint remains unchanged/undecayed.
-			 * See exit_mm().
+			 * If a task leaves its cache group through exit or exec,
+			 * its contribution must be subtracted from the old group's
+			 * footprint. Otherwise, that contribution remains
+			 * unchanged/undecayed while other tasks keep the group alive.
+			 * See sched_cache_footprint_sub().
 			 *
-			 * Lost updates and unsynchronized subtraction
-			 * in exit_mm() can cause footprint + diff to
-			 * go negative. Clamp to zero to prevent the
-			 * unsigned footprint from wrapping.
+			 * Lost updates and unsynchronized subtraction on exit or
+			 * exec can cause footprint + diff to go negative. Clamp
+			 * to zero to prevent the unsigned footprint from wrapping.
 			 */
 			scoped_guard(rcu) {
 				grp = rcu_dereference(p->sched_cache_grp);
--
2.54.0 (Apple Git-157)


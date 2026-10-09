Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22B72DCF74
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558754; cv=none; b=ha6LNRZkFc8cuBh743QIk2ad62/pSykyndr8JHB0wpP/6muvmYANvnzWUGH09uZk4WfnufhYulf+N5U4fAnVcQtZx3RWJv497sv8wo3pA98A7Q50IOid72dDgFqeXUCK8AY2eNglq9GcVgDxJX88rghhuo+3Od1mIy5B0IA1PfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558754; c=relaxed/simple;
	bh=2TCHCYLLMHwD1Tir/dooRl55s17HB5QzbAxYOTPwl88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=enF2isrDbeGKTOpSvVWlLIPJFK+Cp4td+860u2ToNk/8KMhYYDfTGZp1gOHmJ/+ZYqh+Jgr1EUm4sqZHomvRQiD0GVukSwo6Jl1+D1LGOrfkOdEDqWXE2qB+XLIpKJBMYvcoGf+Vud3kW8xJFlV3242s9zCtq35ZZ0rx+lbdnaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4N2QciP; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4N2QciP"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-88b7d853b11so3423598b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791558752; x=1792163552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+7Mb8sSh+9b1pnB2p0zPUmieP0/YSMAh7Bulz3cHpC0=;
        b=D4N2QciP0tpTMXz6TIkx5NrzsDPKjfuGcsFoPsGnrc2xnI7fClh23s/CmN3gSCUp8H
         OBIV3IrWXJF3hHbg/xAoZTQVTPgMPXaPAyEK6Y4cc2cW1E3HfnQ/7/YTU4nn6XpzJiis
         y/pNqdPyuw+4yWPFUl//XNMD4PQFTD4FWil89IUfMtoQVcP29xM5/mOzbqVGT6UdYeFT
         qQF069kucIxRZ6nrMLaFaF9mdbPETK59+ORhMOQs6z4V2XgUaNTPkP/PstbmT/KsWWQa
         ZWh7dqDPaE7KujSMN61y2+Vfb9ToGg+xDqt7LArAtNODBEpjEto9TGV+QLit4+WbUTjE
         q34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558752; x=1792163552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7Mb8sSh+9b1pnB2p0zPUmieP0/YSMAh7Bulz3cHpC0=;
        b=W/jkofC2D5T7OWJbzVVUVhA5wF5sVZe50eU5aMMW3RFuXFKsmqDpQUID9Nj+O8s3nv
         2mIZuEAn7Zc//MdFhT43EkVBrUWBFoSCyMoNEfviDAPqLsTXE8WqwZ6sbsdo1IqRnQyl
         Kxi8nFJtoiEahuJIhYgooZOmAIukVEDFTWO061aDc9VsnQdnvQ8ftNhyk4jK9am+bDNp
         zXCZRSHo8KZUBI4oWsWFNELd+m03z0OwdV9cMp0O+yJmdyVcHU0GzES0AmfeH94QnclF
         16SYDh8WrgtSoejMr5wrwy8CylS0L4yPMT9o3kUZaShvK68D1TZcrwYFZ/qbsmSGVB2S
         9tjw==
X-Forwarded-Encrypted: i=1; AKwUvBwgAwLzfEdzIdXlA4eMG16eehzo/AGWjZn8hA8Kx57MDiltek60WZrE0lPn8OlgaN7RgwIiyG0X9tOpZmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeP6ZSDjLrGK569Rn60O9aLozq79uoNZfo57cmUEVvfjRnm4t2
	vV9W2rPWS+6fr3XAhuLMZeGGoRj1W6YUtiN5wKYSP49QEcyDVFXsXr0q
X-Gm-Gg: AYBFou2EilfJ/P2dhIfcSNp5eIBgtB3OqeKSr3nPOdpWWNM+2p3RRCIIwEZOnhftmmm
	h2Y5OSkWsiYGlN1aVfe5a190ltfhrsk5WTXxAhyCkG3tbzk0X63ApvKhWd4noaoDW2ecUFX3YH2
	OC0WupLTnQpWvQpXgno/gHatAPRV+Fg2sP906PqtIUQ3rNl7PBTKBeFc44khRZTRqBkU6lap2NZ
	8t2KbuOCt6ZVT8A7RAjIQWWe2CeTGAJNzw5rielXA5w8OA5ZMPI4AvDeV7JlB138o39bg3lfOa+
	+LvMlJ+2G8VWn9qrUyqGHv+uAz/4UuceLmisBS4m/Q1ZvvorGs6w1cFCNsQFqMWAYTt9qlRHyGD
	BtlwTi8PHtQT8ybLX1sDnY2lT9w99VsHUtBf9Dk6jfS7rHEMBDnqL+bE3c3Yi3UuR40ch0TKc5O
	eK+/ln9orzHt5TRociYmmWJv3pF8BqYzyQjBc80h9Ab6y/9ZbG13oikV+xFT+nYo3thh9Q/V6IQ
	Do+qyQEowESaLeQadKYQdWw
X-Received: by 2002:a05:6a00:2192:b0:890:e6dd:52ca with SMTP id d2e1a72fcca58-897c82b3b66mr1909619b3a.47.1791558752054;
        Fri, 09 Oct 2026 08:12:32 -0700 (PDT)
Received: from localhost.localdomain ([202.8.105.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3107398sm1182265b3a.17.2026.10.09.08.12.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 09 Oct 2026 08:12:31 -0700 (PDT)
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
	Jemmy Wong <jemmywong512@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/cache: Remove the old cache group footprint on exec
Date: Fri,  9 Oct 2026 23:12:15 +0800
Message-ID: <20261009151215.62878-1-jemmywong512@gmail.com>
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
thread group, tasks created with CLONE_VM without CLONE_THREAD can
retain the old mm and cache group. The executing task's contribution
then remains in that group without further updates or decay, potentially
suppressing cache-aware aggregation through the LLC capacity check.

Factor the existing footprint subtraction into a helper and use it when
leaving a cache group on both exec and exit. Subtract before dropping the
old group reference, preserving the existing underflow protection.

Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
---
 kernel/sched/fair.c | 51 ++++++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..af182c9fcde7 100644
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
@@ -1780,6 +1799,7 @@ void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
 	 * the old one. @p is current and the only writer of its own pointer.
 	 */
 	old = sched_cache_replace_grp(p, sched_cache_group_get(mm->sched_cache_grp));
+	sched_cache_footprint_sub(old, p);
 	sched_cache_group_put(old);
 }
 
@@ -1787,19 +1807,7 @@ void sched_cache_exit_mm(struct task_struct *p)
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
 
@@ -3975,16 +3983,15 @@ static void task_numa_placement(struct task_struct *p)
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


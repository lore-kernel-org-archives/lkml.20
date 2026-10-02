Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7749A4F68AB
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956016; cv=none; b=YuaqiuKWNLznKDBqaQvcPrkNOGvAaU8mrjpUPbyiLDWPyHDymaXC0tlQ7FksveWU7pSh3K13a6wHQjySfJRQEDH+Z8F6AnT/TjAtee3zVFWU9c3IrvpP9STce3rHSKWMeaoaJAzs84NH9FN+cFj50w4uK+f7hQcFb4l1dtRRVZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956016; c=relaxed/simple;
	bh=8LDacuZaZ8swaQleVc5TrMEGU/bkjmMF4l7WP1XooQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lEqk5tnlo/UnPObSGeui//v1CMF81cHSz/Tem1HliFdZ8x6d8n+41GqanHRVBbXyR/BedkiT6Uv1r47oSrqHUz8n71BhmLYdA6bdw7wLfmnNDOhS543Pz3h1JL0fUEYtnYq4Xx4goGGbBxrSN0KIHUGcl8IZ3I1zpuLQyAD+VeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3Qe+LA/; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3Qe+LA/"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2e2bfc2540cso21326175ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790956014; x=1791560814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pka2rlWSvPrqgR6Hzv68haUoZpXlk1pZ3oLkuapj80Q=;
        b=m3Qe+LA/Hn5wZMrIlRjPTaTU05S6PplJPmpkD8QguNapBjC7JSy2H9Wz1NoqONvOeF
         yJ8imfW1zqTgX/NdiKNqhjcdTE/mTnjEhMcFBp0fHV+SQJUAMxXFIxpnUT11JCgPojrl
         tFqsjsPI0menzWSVvRc0goLp1We0zp8qnzVxTtjiE9SlP/cYC+VoXx4F2glOu1P0ahua
         oh3tftASlclGnn/4NJKY/LAKhX7Ou8HE4xJqrQwu1cb4Hg6d16KmWy6zRNrHofG6p9hT
         zLs5vxGnSFWWlSYe7s2hVdpCl5eXaET2W5xqqtgE3bosklIjdZhblWpLyxuJdVg3Uhb6
         Vdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956014; x=1791560814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pka2rlWSvPrqgR6Hzv68haUoZpXlk1pZ3oLkuapj80Q=;
        b=l3x0khGfGtl76nhoJTp3ZpQ/SEFfxFRNV07FthLxWZXBTGVzsIuzEOBYylGfAwPwaI
         M+H/QdfzIm6z4nCuTHelTGjtRqJ+Xm3UwqelbbZawOt8KZtjGCX0vF5tnMmKtw2uMEjh
         9l5Vm5/6O67sUB+lxJb1G/RBs99xSbrrXJ8VWs+tOQgL7NNVZ72QU4lGoveryQkfs5+v
         mQ2tTDr7u2jjhfFB6kTJcbRSaa78iorVUNUcXRQ8Qfm89U5L7gwTELOXC04DT/8bj33o
         c5RjbuZ9HkL11y8O1JEN0Bvxwpccjfum0+yAor8OqXFuXY6p30CgQvmX4WeGHi3EmHL6
         aPcg==
X-Forwarded-Encrypted: i=1; AKwUvBwrAGCSAJZgwUrDdGKvRLn4Rhdc6gR+W6fkafjvcuZdVN4xt4dMvMgWCzahf34wY/VnL7xbQ/aMcxYLgNc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAFPfh2/ClO/1GaxUOshIJafYK51dXbRMwGZw5iqk6ov+YcFmB
	6CU2Cfp8TPuPnTz0NMDuAxsFyicvRo5v6Nx3FybZW0mtZgOaZY0zR7ad
X-Gm-Gg: AYBFou3sn8rN2FaDTBy2URdlfTkL0fh8Si6jV6YtCVRW+xLHXqKjkXWNNAyVTWIdMbN
	mwq/1fYchcvBS1btu7N7XAEtXE0hBHRTOpV0iqYcdrsXJRmu8XEfHT/riq6RXfrnredlK/aTZgv
	AcJZi7yBL3Ws50wd80F/ML/xEWSs1qx/kBBP1o/pnWzWye7Tw1HA7ZFc7GEAcqcH0DZj/msuiVj
	3CfcoHHED/+72FdLdwkLQtQ7Scii6WXtLPSmnhZ/PjyZ4C+ZtqCFNDkqJeJHqkp4A456nkUy9A1
	A9riwb7OcRvA9lUBhDRkg2RbA9DUK93lciuVFyrSf+WnkHToyup1K2qurJ7s25gbU3nTGoNahEO
	lkXWNaZC3fTXLwGfF2cEfwvwhAnpbUmV6P22/FI2+OSHadPfWKZJyFyjmErHwzCls5GUhrtbqbV
	f4cKC5r0bauetorlD+HpGro4lo6S1TEtKz9y2eeRSxEm6pLN2hG7r91lXVXpCHJts/ZiLwi79NO
	1e7WJPpShpE
X-Received: by 2002:a17:902:e5c8:b0:2df:3872:f289 with SMTP id d9443c01a7336-2e49b64bdddmr35973405ad.28.1790956013699;
        Fri, 02 Oct 2026 08:46:53 -0700 (PDT)
Received: from localhost.localdomain ([202.8.105.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6d9a88sm9785075ad.53.2026.10.02.08.46.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 08:46:53 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Tim Chen <tim.c.chen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] sched/fair: Rename group_imbalanced to group_pinned_imb
Date: Fri,  2 Oct 2026 23:46:33 +0800
Message-ID: <20261002154634.71878-3-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261002154634.71878-1-jemmywong512@gmail.com>
References: <20261002154634.71878-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name dates back to the original group_imb heuristic, which flagged
a group when the load difference between its busiest and idlest CPU
exceeded the average task load. Commit 6263322c5e8f ("sched/fair:
Rewrite group_imb trigger") replaced that heuristic: the flag is now
set only when a lower domain fails to balance because tasks are pinned
by cpus_ptr (LBF_SOME_PINNED), and kept while all tasks are pinned
(LBF_ALL_PINNED). The name was carried over unchanged and later became
group_imbalanced in commit 0b0695f2b34a ("sched/fair: Rework
load_balance()").

Today the name no longer matches the condition:

 - group_classify() checks group_overloaded first, so a group whose
   load really is skewed is usually not classified as imbalanced,
   while a flagged group may carry a single extra task.

 - calculate_imbalance() does not measure any imbalance for this type;
   it moves one task (migrate_task, imbalance = 1).

 - Elsewhere in fair.c "imbalance" consistently means the amount of
   load to move (env->imbalance, imbalance_pct, calculate_imbalance(),
   the lb_imbalance_* schedstats), and imbalanced_active_balance() uses
   "imbalanced" for repeated balance failures, unrelated to this flag.

Rename it to group_pinned_imb. The "pinned" prefix names the cause that
raises it, an imbalance the balancer could not fix because tasks are
pinned by cpus_ptr, and distinguishes it from the unqualified
"imbalanced" uses above. The enum is local to fair.c, so no tracepoint,
schedstat or other user-visible interface is affected.

No functional change.

Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
---
 kernel/sched/fair.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index bcb9987952b9..49de871ee7ab 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10579,7 +10579,7 @@ enum group_type {
 	 * The tasks' affinity constraints previously prevented the scheduler
 	 * from balancing the load across the system.
 	 */
-	group_imbalanced,
+	group_pinned_imb,
 	/*
 	 * There are tasks running on non-preferred LLC, possible to move
 	 * them to their preferred LLC without creating too much imbalance.
@@ -11938,7 +11938,7 @@ group_type group_classify(unsigned int imbalance_pct,
 		return group_llc_balance;
 
 	if (sg_imbalanced(group))
-		return group_imbalanced;
+		return group_pinned_imb;
 
 	if (sgs->group_asym_packing)
 		return group_asym_packing;
@@ -12401,10 +12401,10 @@ static bool update_sd_pick_busiest(struct lb_env *env,
 		/* Select the group with most tasks preferring dst LLC */
 		return update_llc_busiest(env, busiest, sgs);
 
-	case group_imbalanced:
+	case group_pinned_imb:
 		/*
-		 * Select the 1st imbalanced group as we don't have any way to
-		 * choose one more than another.
+		 * Select the 1st group with pinned tasks as we don't
+		 * have any way to choose one more than another.
 		 */
 		return false;
 
@@ -12653,7 +12653,7 @@ static bool update_pick_idlest(struct sched_group *idlest,
 		break;
 
 	case group_llc_balance:
-	case group_imbalanced:
+	case group_pinned_imb:
 	case group_asym_packing:
 	case group_smt_balance:
 		/* Those types are not used in the slow wakeup path */
@@ -12786,7 +12786,7 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 		break;
 
 	case group_llc_balance:
-	case group_imbalanced:
+	case group_pinned_imb:
 	case group_asym_packing:
 	case group_smt_balance:
 		/* Those type are not used in the slow wakeup path */
@@ -13049,11 +13049,11 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
 	}
 #endif
 
-	if (busiest->group_type == group_imbalanced) {
+	if (busiest->group_type == group_pinned_imb) {
 		/*
-		 * In the group_imb case we cannot rely on group-wide averages
-		 * to ensure CPU-load equilibrium, try to move any task to fix
-		 * the imbalance. The next load balance will take care of
+		 * In the group_pinned_imb case we cannot rely on group-wide
+		 * averages to ensure CPU-load equilibrium, try to move any task
+		 * to fix the imbalance. The next load balance will take care of
 		 * balancing back the system.
 		 */
 		env->migration_type = migrate_task;
@@ -13184,13 +13184,13 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
 /*
  * Decision matrix according to the local and busiest group type:
  *
- * busiest \ local has_spare fully_busy misfit smt asym imbalanced llc overloaded
+ * busiest \ local has_spare fully_busy misfit smt asym   pinned   llc overloaded
  * has_spare        nr_idle   balanced   N/A   N/A  N/A  balanced  N/A  balanced
  * fully_busy       nr_idle   nr_idle    N/A   N/A  N/A  balanced  N/A  balanced
  * misfit_task      force     N/A        N/A   N/A  N/A  N/A       N/A  N/A
  * smt_balance      nr_idle   nr_idle    N/A   N/A  N/A  balanced  N/A  balanced
  * asym_packing     force     force      N/A   N/A  N/A  force     N/A  force
- * imbalanced       force     force      N/A   N/A  N/A  force     N/A  force
+ * pinned_imb       force     force      N/A   N/A  N/A  force     N/A  force
  * llc_balance      force     nr_idle    N/A   N/A  N/A  nr_idle   N/A  balanced
  * overloaded       force     force      N/A   N/A  N/A  force     N/A  avg_load
  *
@@ -13245,11 +13245,11 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 		goto force_balance;
 
 	/*
-	 * If the busiest group is imbalanced the below checks don't
+	 * If the busiest group has pinned tasks the below checks don't
 	 * work because they assume all things are equal, which typically
 	 * isn't true due to cpus_ptr constraints and the like.
 	 */
-	if (busiest->group_type == group_imbalanced)
+	if (busiest->group_type == group_pinned_imb)
 		goto force_balance;
 
 	local = &sds.local_stat;
-- 
2.54.0 (Apple Git-157)


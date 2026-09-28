Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FF1284880
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790569264; cv=none; b=MxsFGSGgSkH2RX7xJhZeS1exqJjPW3sYY+sry+dJ9CTbNThdU1u1v/b0uN2Gg1LSriA3nIbKGbhc0fGE6Uvb3hNkmTkMC6LnvF/6+eEF7HEu6uxyrGftQXU0EwDvseoUVBjIJ+aTXzberux2Adk7LCbvqpyhHwP4dkrYCO9US0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790569264; c=relaxed/simple;
	bh=ccy5gUF6HS5Nv0pbuG461Pc9V0kxOdHrsE9EH1lDY5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hxb3LCxwkpKgiFodF7dBNJy8JbY/Df/77Jgb5ZEMUWFTKUJ+BCQWnFhf+oyzLSqUHjp/O5NehemdRL8U78gvbPHJtZy+Tj9AB9VsOxkkAx84BbXEG5argYrpIjDBWPH6RVX2clwuAPdfC/Of+nJgQ3HFgmIk8BmRVkc9iknJhHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTWbKtrd; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTWbKtrd"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba91so1165312a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790569262; x=1791174062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AGk9tIHCQP9pSZPdd7BAe6NHxpMiRVu9MQgApLZJQQ=;
        b=ZTWbKtrdyJ/E9A1zX074jh9j+elIp9OLc0H76YVaxLnqiez51HiEuoMbo9dvC66GnO
         lXeXMqKaIRKP/lRO+S9WpfiB24L1sKSBGiFZ0ySn1nFh+mkumxMHT3DnSqb7QjC4dgH7
         NlXUMULKTrWjJeMI79z9455kgi+5+gNjSwbt2rO7NiLGRCd0Qf4eP9pq5ro7eEa04/Tb
         lpSn4bW4fJzdJirsYQY/RUUwPGbLosqRIudPPL/6YlTv6V7Rqpri0xvjiG8tWhz2V835
         m8T964HulUbfksarxmMQ7xPdwo79VPKeJKF78J+bWsFTyryCewgqT/hmj02LtMfv501D
         3+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790569262; x=1791174062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AGk9tIHCQP9pSZPdd7BAe6NHxpMiRVu9MQgApLZJQQ=;
        b=pmsQvXH9k5lWE9x+tirt5p8I8PCXcfZSHk0sU/taF7e9tuOLZRrLbHZVScDfRNgM17
         vXcjw+AAw58B4ZxMErLnzct5wH4PzeFxHThJzYEV3pK3+f7i5JMBuJNsT3ro1Jt5bTS4
         JPqrM51Hp77h+S58sfLwt3YZszLyhG2v4w9mSKRdpX+7o2GCa0S5krSYXU+NV8Je+FjW
         TmA0Gxkj2/PdcMCNgLMcy/8nFMrDGx8h5nZS5gk8rpwkPp/TVREHoAtZ6oThp+Ed2w9L
         QVCs/gmsedfD/WWyIevJTFiALU4hOnwCzJl/H+KkEe3zcEz2zshpakdhm/ENg3ODgCf7
         rMPw==
X-Forwarded-Encrypted: i=1; AKwUvBxmP4csJzIK77yXxXb1CJoEa6JkP0KT8IdteTYEw6rWBbHSD+dAdWgMvQN735Whli3VBcEcDAaVK2r49p8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSk5kzSL1QHzeA3IhhwPbjaFWAXeHqR2MhI/2KlpvlP0Y0AtwO
	sH/k02OtYk+xFDVXHx4LvJKHKDNgjZUx/CcE0eCcR4TJ2+qrjOoDKlcc
X-Gm-Gg: AYBFou1Dx4eMDfLqVuw79ZLgYg9SWxHaPhK4SW2GntIcXe8HEzCaT+V0eIAFzotQk2r
	K+kJ8zBPDtwaEvWMVbRNJgZ/If7WH6M4EFCJzWXGHofmSvDv1EffLwgcZEICFA6QmgKV8pInydf
	YEnrO8iCQPx56bQF8NvAvUfMmmq5RiC1kK4Rkdbn08ZYFFncmwuXHViu6iwp3w2mwevOikuvRdD
	kuhHrzT37JyEmMx9dzVBNW6o6WW3LMmAGVrtEmExUpp8zz5TKJZ3A6lVVKFdrp3EOfDAnT1aysQ
	ZWojyS2Xi/iBmzefqEbVE1FLd7t5JY3ZQ47x7k4ByyrWWtpX8KX+saaJRVu5jqDoURbUnvQmj1R
	mVZBXISaEKcYbc7OBb/i65BxmeZ5vUtKpaawg2tUxyqM8uuP/nSLyuAd3QpQzedNMBPyIJGtMxO
	VoPaIyRaYenYDUwYPKUz6BfPdo7DLcwNh0RfZZ3bjMsbGvjdmjyn18aPYIHrfnQDLQ3tEzqKw3G
	aUNlsR0ekm0UA==
X-Received: by 2002:a17:90b:4a50:b0:3a0:bdd8:fb11 with SMTP id 98e67ed59e1d1-3a0bdd8ff40mr7682327a91.66.1790569262094;
        Sun, 27 Sep 2026 21:21:02 -0700 (PDT)
Received: from localhost.localdomain ([167.71.204.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm18252804a91.6.2026.09.27.21.20.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 21:21:01 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] sched/fair: Rename group_imbalanced to group_pinned_task
Date: Mon, 28 Sep 2026 12:20:17 +0800
Message-ID: <20260928042018.10618-3-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928042018.10618-1-jemmywong512@gmail.com>
References: <20260928042018.10618-1-jemmywong512@gmail.com>
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

Rename it to group_pinned_task, which describes the condition that
raises it and follows the adjective_noun pattern of group_misfit_task.
The enum is local to fair.c, so no tracepoint, schedstat or other
user-visible interface is affected.

No functional change.

Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
---
 kernel/sched/fair.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f9ddcecfd19d..aa63950976aa 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10363,7 +10363,7 @@ enum group_type {
 	 * The tasks' affinity constraints previously prevented the scheduler
 	 * from balancing the load across the system.
 	 */
-	group_imbalanced,
+	group_pinned_task,
 	/*
 	 * There are tasks running on non-preferred LLC, possible to move
 	 * them to their preferred LLC without creating too much imbalance.
@@ -11701,7 +11701,7 @@ group_type group_classify(unsigned int imbalance_pct,
 		return group_llc_balance;
 
 	if (sg_imbalanced(group))
-		return group_imbalanced;
+		return group_pinned_task;
 
 	if (sgs->group_asym_packing)
 		return group_asym_packing;
@@ -12164,10 +12164,10 @@ static bool update_sd_pick_busiest(struct lb_env *env,
 		/* Select the group with most tasks preferring dst LLC */
 		return update_llc_busiest(env, busiest, sgs);
 
-	case group_imbalanced:
+	case group_pinned_task:
 		/*
-		 * Select the 1st imbalanced group as we don't have any way to
-		 * choose one more than another.
+		 * Select the 1st group with pinned tasks as we don't
+		 * have any way to choose one more than another.
 		 */
 		return false;
 
@@ -12416,7 +12416,7 @@ static bool update_pick_idlest(struct sched_group *idlest,
 		break;
 
 	case group_llc_balance:
-	case group_imbalanced:
+	case group_pinned_task:
 	case group_asym_packing:
 	case group_smt_balance:
 		/* Those types are not used in the slow wakeup path */
@@ -12549,7 +12549,7 @@ sched_balance_find_dst_group(struct sched_domain *sd, struct task_struct *p, int
 		break;
 
 	case group_llc_balance:
-	case group_imbalanced:
+	case group_pinned_task:
 	case group_asym_packing:
 	case group_smt_balance:
 		/* Those type are not used in the slow wakeup path */
@@ -12812,11 +12812,11 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
 	}
 #endif
 
-	if (busiest->group_type == group_imbalanced) {
+	if (busiest->group_type == group_pinned_task) {
 		/*
-		 * In the group_imb case we cannot rely on group-wide averages
-		 * to ensure CPU-load equilibrium, try to move any task to fix
-		 * the imbalance. The next load balance will take care of
+		 * In the group_pinned_task case we cannot rely on group-wide
+		 * averages to ensure CPU-load equilibrium, try to move any task
+		 * to fix the imbalance. The next load balance will take care of
 		 * balancing back the system.
 		 */
 		env->migration_type = migrate_task;
@@ -12947,13 +12947,13 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
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
+ * pinned_task      force     force      N/A   N/A  N/A  force     N/A  force
  * llc_balance      nr_idle   nr_idle    N/A   N/A  N/A  nr_idle   N/A  balanced
  * overloaded       force     force      N/A   N/A  N/A  force     N/A  avg_load
  *
@@ -13008,11 +13008,11 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 		goto force_balance;
 
 	/*
-	 * If the busiest group is imbalanced the below checks don't
+	 * If the busiest group has pinned tasks the below checks don't
 	 * work because they assume all things are equal, which typically
 	 * isn't true due to cpus_ptr constraints and the like.
 	 */
-	if (busiest->group_type == group_imbalanced)
+	if (busiest->group_type == group_pinned_task)
 		goto force_balance;
 
 	local = &sds.local_stat;
-- 
2.54.0 (Apple Git-157)


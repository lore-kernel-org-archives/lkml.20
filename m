Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D26284880
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790569271; cv=none; b=iYIA6Vsn0rEjt3KBiKpdongl8LveE4aOe2VrzbbKUEp6J57ZuvZrEmpt0k8PYBhsEEY3RR2A7rwomPAuphYlSowFWCYREHyc+vuK2Hcbpk3NeQ7OY+efw1CU4kyxWfM1koCjXYonfNpdcvUU9A+OmD8GdtnijUleLCTw4p9OsrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790569271; c=relaxed/simple;
	bh=rHtAJu9myEVWaon00JtyR1KPg4HvRBlo/nQFJYHAa/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsMzd+fbETAjblX2lWf+8qZMkjJ/uzP2DACuDVATePqBYNZBzSge8ocF7DjT6+y9aXBA5J0jbiq5H1SmMwNj5tSKzIFCtvfbF9UoISg151i/h7rSHBHHA0m/Km0GeOoVptW0jRspOU5w/b6WmWy5UtkSw8PYSYP6awT69xqNZuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Od+fhAJI; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Od+fhAJI"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0b6200eb0so1913294a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790569269; x=1791174069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbEpdPOy/URT06FWkQkW8rQL9Hp6kxZwEK3QU+C5YWY=;
        b=Od+fhAJIPIoc86eC7LBryeoQfwqHGG26YQWTRj+hoPrB0MpJKlgxJry5v/T8wmp/ly
         grFSAybQNv+EK5dIGux2FTO8m3TXAbjySJIN7ZOavma9i6aJhIJaKLb74ztkqys+PWrx
         z0nvuBRtwYmva0huynCvE3sw7h8mfkFRuYgDatx6MpabwAhMSBg7fl14vn4iFwJkVbNr
         noh/mjtBoeLT6iJJEPl4w0pjpknclnoyHm8ahK7iJax70iv74eXeIC9sgJW07JZVEUPn
         Mbq0LgomK83ZpmZuRfwxfvxe4NtgaTjJZtqaLhTFRiuOZtugaNvSyUekbiJDb3cUpVH+
         EyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790569269; x=1791174069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbEpdPOy/URT06FWkQkW8rQL9Hp6kxZwEK3QU+C5YWY=;
        b=M9Yt2qpc+Rqb2780x72ltSRyc7Z3B8d/6CRQQLrRKCEUltTUDq2bF4c/aUE1Ei65f6
         1pOoLW7BOptI0z9JBJ2TNL2Tgmo1vTroMxVUmEO9gCk/cNPp2j9jX13lyY2m/VkHDTUb
         JjYWbKvh36W9j9fh+GqkjnSik/3Fc6Frg7RYRQpcZEMIgWiROCZsasC3oqbbZOdUrNgp
         rvDfNiUO55CrI2Zo932Su4Sg7mXh3s8rf8kkni+6wpmCvVt+oXFmB0ZgMkutSGIQiN0d
         mnw4AnqLaKOSuSOB5zf9PHpv++ZkRNrk+Y/7DMRiuheCoR9sceJXAIW6FcVyTD00bVWT
         qSWw==
X-Forwarded-Encrypted: i=1; AKwUvBxKLx3wKGtkx0AB4bdca5uCFgI99tXfYrblC9HzTT0HhdIDNOmHws3cl/eJSRmNFmBByNH7ewNEdTm9hnQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAXk836/O+hmSTVWtbOHMwRET8+hF2RFs/HmtdY5pk4xke110I
	eGO0EshcYEfuG0/wLXm2gcOXyBVeeSGGrL4KH48NdZ8sBrEhkcTBZLpi
X-Gm-Gg: AYBFou0va+GGcGZrxzB9nbrIFZ9MoG5znUMHeRWHoYq5TQxJnZ22Iq9ePg8ae42nAxK
	oyOvTY8oKxlYDlWUBvxjfd/VM2oHKR1IzeEZgrNxdHXCjbGkGv4Q9pn3uZA8cvtBvOZMhf+x6u0
	4lHUfcvjlRp2WJIu/7mPxWkKDX92z0N8HMWhYZNcw7SHIW3PAGc0BHC6cAlgNg2COijprzyLdU9
	SvBaJq/m6qAJRRFTw5T4QW5Lc0ornnZ7Esn2+9ZkrZvd1ysjjoYU+idCFsBt4YyrwGU4ZobM6V9
	QgjoIXfLH5jvbkznfxbXRd+Ndw9e/25jLQdqm2DhSRs6sSDBrHxvqZZX3twVnLss/u2HS0lCmkj
	fh7xI/yzFYMwNf9b8JcHDw9pKBnmaluCkJZzmRAK39ACpzseZm2n8qOepKBFo43Ee7mD1oul9i9
	KVIMAVgErStu+55Rut8amYA6tn2O0L9LNCoX9ryfKqtl7kgM56KC3Fi4i/hoWE0yAFe9wkffKCy
	cPrcZZ6HrBgOg==
X-Received: by 2002:a17:90a:d40b:b0:39d:f2a1:3a with SMTP id 98e67ed59e1d1-3a0bb573f4amr7292011a91.15.1790569268815;
        Sun, 27 Sep 2026 21:21:08 -0700 (PDT)
Received: from localhost.localdomain ([167.71.204.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm18252804a91.6.2026.09.27.21.21.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 21:21:08 -0700 (PDT)
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
Subject: [PATCH 3/3] sched/fair: Rename sgc->imbalance to sgc->pinned_task
Date: Mon, 28 Sep 2026 12:20:18 +0800
Message-ID: <20260928042018.10618-4-jemmywong512@gmail.com>
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

sgc->imbalance does not describe a load skew either. It is set only
when a child domain failed to balance because some tasks were pinned by
cpus_ptr, and the parent then classifies the group as group_pinned_task
so that it can force a migration.

The old name also collides with env->imbalance, the amount of load
still to move, and with imbalance_pct. And after the previous rename,
sg_imbalanced() returns group_pinned_task, so the helper and the group
type no longer agree.

Rename the field to pinned_task and its reader to sg_pinned_task().

No functional change.

Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
---
 kernel/sched/fair.c  | 24 ++++++++++++------------
 kernel/sched/sched.h |  6 +++++-
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index aa63950976aa..43bdca636461 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11595,7 +11595,7 @@ static inline bool check_misfit_status(struct rq *rq)
 }
 
 /*
- * Group imbalance indicates (and tries to solve) the problem where balancing
+ * sgc->pinned_task indicates (and tries to solve) the problem where balancing
  * groups is inadequate due to ->cpus_ptr constraints.
  *
  * Imagine a situation of two groups of 4 CPUs each and 4 tasks each with a
@@ -11623,9 +11623,9 @@ static inline bool check_misfit_status(struct rq *rq)
  * subtle and fragile situation.
  */
 
-static inline int sg_imbalanced(struct sched_group *group)
+static inline int sg_pinned_task(struct sched_group *group)
 {
-	return group->sgc->imbalance;
+	return group->sgc->pinned_task;
 }
 
 /*
@@ -11700,7 +11700,7 @@ group_type group_classify(unsigned int imbalance_pct,
 	if (sgs->group_llc_balance)
 		return group_llc_balance;
 
-	if (sg_imbalanced(group))
+	if (sg_pinned_task(group))
 		return group_pinned_task;
 
 	if (sgs->group_asym_packing)
@@ -13619,10 +13619,10 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 		 * We failed to reach balance because of affinity.
 		 */
 		if (sd_parent) {
-			int *group_imbalance = &sd_parent->groups->sgc->imbalance;
+			int *pinned_task = &sd_parent->groups->sgc->pinned_task;
 
 			if ((env.flags & LBF_SOME_PINNED) && env.imbalance > 0)
-				*group_imbalance = 1;
+				*pinned_task = 1;
 		}
 
 		/* All tasks on this runqueue were pinned by CPU affinity */
@@ -13722,21 +13722,21 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 out_balanced:
 	/*
 	 * We reach balance although we may have faced some affinity
-	 * constraints. Clear the imbalance flag only if other tasks got
+	 * constraints. Clear the pinned flag only if other tasks got
 	 * a chance to move and fix the imbalance.
 	 */
 	if (sd_parent && !(env.flags & LBF_ALL_PINNED)) {
-		int *group_imbalance = &sd_parent->groups->sgc->imbalance;
+		int *pinned_task = &sd_parent->groups->sgc->pinned_task;
 
-		if (*group_imbalance)
-			*group_imbalance = 0;
+		if (*pinned_task)
+			*pinned_task = 0;
 	}
 
 out_all_pinned:
 	/*
 	 * We reach balance because all tasks are pinned at this level so
-	 * we can't migrate them. Let the imbalance flag set so parent level
-	 * can try to migrate them.
+	 * we can't migrate them. Let the pinned flag stay set so the parent
+	 * level can try to migrate them.
 	 */
 	schedstat_inc(sd->lb_balanced[idle]);
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf8..b64966dde395 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2257,7 +2257,11 @@ struct sched_group_capacity {
 	unsigned long		min_capacity;		/* Min per-CPU capacity in group */
 	unsigned long		max_capacity;		/* Max per-CPU capacity in group */
 	unsigned long		next_update;
-	int			imbalance;		/* XXX unrelated to capacity but shared group state */
+	/*
+	 * Set when a child domain cannot balance pinned tasks.
+	 * XXX unrelated to capacity, but it is shared group state.
+	 */
+	int			pinned_task;
 
 	int			id;
 
-- 
2.54.0 (Apple Git-157)


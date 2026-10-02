Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9EB4F646E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956020; cv=none; b=pm8pe6bZoqbsyT6J06lRGlZgyFMUyEfgQeB3eH7kzwOQPe1ZN9V+a1+9hLI3uakbe6HMPtfV7E0X9HkALp5lT/wo6eB/JTFo6FLcKubCU/svhmSDmrd7l583q2kdbKWC2q8FXvZecoBYSW4p+TrJ6xVQPsklssWT4Juh9yPzTIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956020; c=relaxed/simple;
	bh=n8KoiOBH8fykndO08qZrOhzcBdxH4PnCFyAy1h8McjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V1I2xBi6CfmDddUhqdJBzW+WOfUpltRhVlhGvUmDARQB+Gr+tVtyrF0Ln/LUzGcnUIsPX9T4PJGz8J+0wuTuEOAwSGLZESf9fbRjnNSPji6BFobqoW+BeWEkvSs0ar+rv4Muv1/yX7ePt+AEF0p8HQlGJzUCvCVQCEQMmLB5dRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fa3JsTzk; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fa3JsTzk"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2db1ca069c8so37844405ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790956018; x=1791560818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xjw6qoPxLNaGbusPK32A1qkrQ15mneg4DB9BIdUbtrI=;
        b=fa3JsTzkHNbbKgEw1EInUqRmk75vx9YW+7SYNwkeufAmCQgpcMNpInni1N2IfZvsRJ
         B4psqEKQtjAvefJy5ZxTPikXCJYmvcZ8RWSlYVXzCV4+QEqnS9+lZcPym3Kkf1JcO7Se
         Ya2njAmyu3TG3yOpXewNI0fv7lQx1Nst2a8N+9yvaQqO+hZHiMnEMQZoticDmQINnrNc
         hsSyIe4jAmhWuMmvX1rdY94N9AfcdNqGQHSxwQjw2hR5UGYNYIxBx2b8lVeHP1MbC6Do
         9AtKhCw2+sd+cxeVhFtbgYlintihqbCITNP8YwMNwOs7oolO6cJ+BcsHz3tAVNI4BGy0
         x6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956018; x=1791560818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xjw6qoPxLNaGbusPK32A1qkrQ15mneg4DB9BIdUbtrI=;
        b=wUVVLjUVx/GNsJLAieeFIiVmBC9OSmohPV4unWZvX0F7r7s/TdSV5h64OxkWFXwQCr
         Y5eggbyv8EkRp006iCI9C4AgoHTOC4gud0ZbBMNl3Xy1cKh88yR6I8s8UuI+c6bL2n8P
         Vgoz5h17ctgNQq9FMbcIEWaCcCK2M8YLH5SeqS2dwFWFrz6qtROOd/PvVp+m9f43+d8a
         jABbQ4tu6v440yPRnHAph2nDdpV7mcC4pdxZq6pILKm9IT4vnYdY8wj7coh8oDKnjGKK
         2TuFfh4xCJaEAaZLKrZnQYBEY3slhoD9nDN90UwKgGeYKP4tCImWXkwyT+dxg+UbBvYJ
         0OMw==
X-Forwarded-Encrypted: i=1; AKwUvBxIvAAPzKHYj1IIZslNFrsAIOLRtX0lOn98vo8mnk79HouoyNhHSLIvseKP/HImk7TG4pBNIAh8jf3VR/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5rQBI+bvN1CMUlDjLFKbOnaj7uTTJO9XWrcfdgczoXs7hNHAo
	O6vjevDZBADW2WlbqD9WP9DDTsysdxoLN5E7qPvlTVdr+vvyeB+O/e6t
X-Gm-Gg: AYBFou0cMbnfy+TOZH4+O2S3NmIQ5/72OyNjuQiikVsuqx6Deoa0cRV4wCucsmjwcQJ
	DgnCvUzT4XVy6+VxyqY8jMSzHevUAAYEYY4EwU0IGrBi9gy7uSU03S7P4NCJ6JrvxN/mN5DZSmn
	KACGRJS4lcZXfjOy2LRtBK96GuK5WIKefl3AV+5bzBvJ3F+3XWJZuo5uBVn9Q1zeBkYKNiSHmGW
	tl4oQBzzlRwJoIoixalZcfUnNL6gIjO+OPeSVrqQBu3ZECog/gNh9UfiXjxL+cSFoje+RtiHVlB
	cI67MDEoOpkgBkF/iYxXV9PxHa/mGZWkhOvrRfRhlxkTNtEHcR/oEFFqw4DLfR5Hv6t2Z99IuJm
	yNtSk3HG2eoc+M25ogApaluWSpCP7fd5sRqlLY/GthprrQApf+2aUlg83+ttEwitZoCEHdnvusD
	3dFEDs8zAFzWABr7Ewtfr51bl2ejK+5CvLM5guVxsYgfq1MTpO0e+ZfftIx6il/Z4hw8/E0bcLf
	5vftbwDqMdd
X-Received: by 2002:a17:902:e752:b0:2e2:ca82:6262 with SMTP id d9443c01a7336-2e49b6d120dmr29672815ad.33.1790956018470;
        Fri, 02 Oct 2026 08:46:58 -0700 (PDT)
Received: from localhost.localdomain ([202.8.105.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6d9a88sm9785075ad.53.2026.10.02.08.46.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 08:46:58 -0700 (PDT)
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
Subject: [PATCH v2 3/3] sched/fair: Rename sgc->imbalance to sgc->pinned_imb
Date: Fri,  2 Oct 2026 23:46:34 +0800
Message-ID: <20261002154634.71878-4-jemmywong512@gmail.com>
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

sgc->imbalance does not describe a load skew either. It is set only
when a child domain failed to balance because some tasks were pinned by
cpus_ptr, and the parent then classifies the group as group_pinned_imb
so that it can force a migration.

The unqualified name is easily confused with env->imbalance, the amount
of load still to move, and with imbalance_pct. And after the previous
rename, sg_imbalanced() returns group_pinned_imb, so the helper and the
group type no longer agree.

Rename the field to pinned_imb and its reader to sg_pinned_imb().

No functional change.

Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
---
 kernel/sched/fair.c  | 24 ++++++++++++------------
 kernel/sched/sched.h |  6 +++++-
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 49de871ee7ab..0f773e1af9f5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11832,7 +11832,7 @@ static inline bool check_misfit_status(struct rq *rq)
 }
 
 /*
- * Group imbalance indicates (and tries to solve) the problem where balancing
+ * sgc->pinned_imb indicates (and tries to solve) the problem where balancing
  * groups is inadequate due to ->cpus_ptr constraints.
  *
  * Imagine a situation of two groups of 4 CPUs each and 4 tasks each with a
@@ -11860,9 +11860,9 @@ static inline bool check_misfit_status(struct rq *rq)
  * subtle and fragile situation.
  */
 
-static inline int sg_imbalanced(struct sched_group *group)
+static inline int sg_pinned_imb(struct sched_group *group)
 {
-	return group->sgc->imbalance;
+	return group->sgc->pinned_imb;
 }
 
 /*
@@ -11937,7 +11937,7 @@ group_type group_classify(unsigned int imbalance_pct,
 	if (sgs->group_llc_balance)
 		return group_llc_balance;
 
-	if (sg_imbalanced(group))
+	if (sg_pinned_imb(group))
 		return group_pinned_imb;
 
 	if (sgs->group_asym_packing)
@@ -13870,10 +13870,10 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 		 * We failed to reach balance because of affinity.
 		 */
 		if (sd_parent) {
-			int *group_imbalance = &sd_parent->groups->sgc->imbalance;
+			int *pinned_imb = &sd_parent->groups->sgc->pinned_imb;
 
 			if ((env.flags & LBF_SOME_PINNED) && env.imbalance > 0)
-				*group_imbalance = 1;
+				*pinned_imb = 1;
 		}
 
 		/* All tasks on this runqueue were pinned by CPU affinity */
@@ -13973,21 +13973,21 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 out_balanced:
 	/*
 	 * We reach balance although we may have faced some affinity
-	 * constraints. Clear the imbalance flag only if other tasks got
+	 * constraints. Clear the pinned flag only if other tasks got
 	 * a chance to move and fix the imbalance.
 	 */
 	if (sd_parent && !(env.flags & LBF_ALL_PINNED)) {
-		int *group_imbalance = &sd_parent->groups->sgc->imbalance;
+		int *pinned_imb = &sd_parent->groups->sgc->pinned_imb;
 
-		if (*group_imbalance)
-			*group_imbalance = 0;
+		if (*pinned_imb)
+			*pinned_imb = 0;
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
index e656c7059bf8..14ce0f6e6027 100644
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
+	int			pinned_imb;
 
 	int			id;
 
-- 
2.54.0 (Apple Git-157)


Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61484A5EAF
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465986; cv=none; b=sS6fp4t5suf/Y2CIb4LHaBrq7gke92qv8c7ZGz9xA4Blqv2JRzhpe7bWuM/HJY8lUOP/o8wL+LrcSIfG1aZa0INCarj4R/YHICKCBGc7DwFZA/6hkpOUcXd2WgktTpRr5PCj/oZpaddjqsnxKGieUOmfXTj+KNziK+yM1gfaVfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465986; c=relaxed/simple;
	bh=A6vBZVQfQNm84G5e7IAi/6qeHlgp6gEqDsR23cAwxoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9bvt3kQbEN8AKC6v+NoltS3FMhrPrIbzevPslfkbtSxxsQ49fQZscJ6slObvuMc0nwx0WBcF9Fbpp74+wO4DUCY8hTuStjPDCufWZdETsEFxJ82/5zwF1RhfkSCzXuZnPD8keu1UnTOM9q3k5X8AMVrdMp/JoU6gui/4kCoKGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUSphRF5; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUSphRF5"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2147484a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465982; x=1792070782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUs9M9QY+/BZ8f/irZusUbubH0TlwWBXtpJCy11a8LU=;
        b=YUSphRF5BWuUSY1rJjIcfipaAgVXi8Q+mnFHKV8ZKCe+smkLJ/6kG6bEf7e1ZPvWEZ
         6mOOPF92wPRPCFZchZMMFL6J6p/BZ14Gp+k3VnwvIpYfH1Nl9UxN8pTzIxpHKAvDzVQm
         fJ8x2X99aQbl0bMXC/wP3MI0AKjsZTjeqR3bvKFPqWB14tNyH04q9VApV0CVwvEuT8Z5
         Sje/cosRxzXrItaGiUnamV6DcfUmbEcQRyE3qA61+TAHWnzneY6bMPJShjwfVHPQ5+d1
         ZnWnrg3ct1CvTyVsJAZircKEu0YTa3v0yDmoC3hnQGyU18v7n+msnKH4Pz9LdJkHi/GT
         E3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465982; x=1792070782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DUs9M9QY+/BZ8f/irZusUbubH0TlwWBXtpJCy11a8LU=;
        b=vtvsbrDW3WOg/YVnw3EC55iwqbHU2F255PBQI5i2/Ib1SbXllS7hHtgdLG9fWPMyaw
         aRBiBYuM0/EEYie54/rvQx/HdwMsj/wKHRg3KOMzXevsl3xceDzu5pRU5I9kfjzx3lv1
         d0g36BZBsymmN/DGP8leo+jIZg+fuap3itTxDjYmNunbyJL2x33Eont0rHcO4VkYGkDq
         gSMBr/4urJJWo1aUeEy4wZi1wj8daCj6L/f+FEoE6+15z24UEMJ/zxl2YAc17u1yIKaC
         eOWNRSWNqUoxcWehLp8pA6wZILsroIXtODfejyH86A5BZwbs+M3p9rW2/6vET05Mm184
         hWHA==
X-Forwarded-Encrypted: i=1; AKwUvBzZNEEWMgd/WM3/9wrRHykFQLGnXrKuFMtnfP1wEPT50IEb5TBtLQ9IQdSE3lwLP/JQQP0wGnyGs+9e17U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/9Ob1EB09uRBajtC7gBToNbBAmq93acpfqp2wf2Toq5ekWpAZ
	VO2TLsXpWwkpkwOQEb2tcX1OmgTWhqEC9M6QQ36PYR0oyPYKfTA86a+f
X-Gm-Gg: AYBFou3RIJ9VVKGwsU2+8LxrKkUiikO/X+1nMifMEf25s28reQ97F1hWe91NN0/RER2
	lbOZmc+X53zzb/yU4iOX2cyNHKNgwuOMx0yHa1Ok7/oq0XkwDM//wsrgErz04qz3p56484oc0Sm
	vVEd8ynRxLlP1yva2bkh0QEADwjgHNG/4hJ4DkvPaSoS9Bjfs//eQb8xTVQ15RNv6iPd2NvNHmn
	BJdlpORb/Id1CmA6zyRqrxPjA0vw8eZaygmjqUu8WwXFtcMKPlBnvTFQZgCWQpDsRfgOo9SKD+i
	IfRr5oIUIqCaICG5kTe+e3C1NXOsMYv8uYGR0Zh5F7+z02bjvg6IyVkX+gTU2X52KoF9fJxkv4s
	nfpiUQi3EPzdwJ0eGDMvl9zdLzAAwrBcvJHbQlmY4ZYycRdwmzHP2LbVyTUQtW9LYkGiHswAmh/
	ADBzGW14zNB5sfPcLlRAJF7bwRuEbcDU1EcsIYjw8Abi18OZRa+O9Ajx2FtNUc4LvtAbPvTQ==
X-Received: by 2002:a17:90b:1d05:b0:3ab:22fe:b13e with SMTP id 98e67ed59e1d1-3ab22fecf3fmr191270a91.53.1791465981790;
        Thu, 08 Oct 2026 06:26:21 -0700 (PDT)
Received: from localhost.localdomain ([2a05:dfc1:8bc4:feda::11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab1e8b7d4csm476312a91.16.2026.10.08.06.26.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 06:26:21 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Jemmy Wong <jemmywong512@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] sched/fair: Drive NUMA and cache tick work from the execution context
Date: Thu,  8 Oct 2026 21:26:02 +0800
Message-ID: <20261008132604.98242-2-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008132604.98242-1-jemmywong512@gmail.com>
References: <20261008132604.98242-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

task_tick() is invoked with rq->donor. Under proxy execution the donor
is blocked on a mutex while rq->curr burns the CPU.

update_se() already charges sum_exec_runtime and LLC runtime to
rq->curr. The NUMA and cache tick hooks still used the donor, so
node_stamp + numa_scan_period was never crossed (donor runtime is
frozen) and TWA_RESUME task_work was queued on a blocked task.

Pass rq->curr for those hooks, matching psi_account_irqtime() and
wq_worker_tick(), and rename task_tick_fair()'s argument from curr to
donor so the scheduling context is not mistaken for rq->curr.

The lock holder need not be a fair task, so only run the hooks when
rq->curr is in fair_sched_class. This keeps NUMA scanning off non-fair
tasks and keeps task_tick_cache() consistent with account_mm_sched(),
which already ignores non-fair tasks.

Without CONFIG_SCHED_PROXY_EXEC the two rq members are a union.

Fixes: aa4f74dfd42b ("sched: Fix runtime accounting w/ split exec & sched contexts")
Fixes: df0d98475954 ("sched/cache: Introduce infrastructure for cache-aware load balancing")
Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
Assisted-by: LLM
---
 kernel/sched/fair.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..9dbc127a9ee1 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15326,12 +15326,13 @@ static inline void task_tick_core(struct rq *rq, struct task_struct *curr) {}
  *
  * NOTE: This function can be called remotely by the tick offload that
  * goes along full dynticks. Therefore no local assumption can be made
- * and everything must be accessed through the @rq and @curr passed in
+ * and everything must be accessed through the @rq and @donor passed in
  * parameters.
  */
-static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
+static void task_tick_fair(struct rq *rq, struct task_struct *donor, int queued)
 {
-	struct sched_entity *se = &curr->se;
+	struct sched_entity *se = &donor->se;
+	struct task_struct *curr = rq->curr;
 
 	if (se->on_rq) {
 		unsigned long weight = NICE_0_LOAD;
@@ -15344,22 +15345,29 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
 			weight = __calc_prop_weight(cfs_rq, se, weight);
 		}
 
-		se = &curr->se;
+		se = &donor->se;
 		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
 	}
 
 	if (queued)
 		return;
 
-	if (static_branch_unlikely(&sched_numa_balancing))
-		task_tick_numa(rq, curr);
+	/*
+	 * NUMA and cache work follow the execution context: update_se()
+	 * charges runtime to rq->curr, and TWA_RESUME must run on that
+	 * task. Under proxy-exec rq->curr may be of another class.
+	 */
+	if (curr->sched_class == &fair_sched_class) {
+		if (static_branch_unlikely(&sched_numa_balancing))
+			task_tick_numa(rq, curr);
 
-	task_tick_cache(rq, curr);
+		task_tick_cache(rq, curr);
+	}
 
-	update_misfit_status(curr, rq);
-	check_update_overutilized_status(task_rq(curr));
+	update_misfit_status(donor, rq);
+	check_update_overutilized_status(task_rq(donor));
 
-	task_tick_core(rq, curr);
+	task_tick_core(rq, donor);
 }
 
 /*
-- 
2.54.0 (Apple Git-157)


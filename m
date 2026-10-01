Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A344250129F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862069; cv=none; b=DzYM30sEhFIQdTyEUd8MQx+mD1eDOMUb1n8MjjGHpCvg/pNQ5kKyCret1WcWph8M4lpVUVwzh3QZGpwDGUWS0XWtXt7eLg99s34x8emPTF4ce1eoOk7PAEJitDzfysG7BKV3YFWBTGZljLWh0kVI8kDZ+GNOsDSr0mmRCJmyytU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862069; c=relaxed/simple;
	bh=QZjcuywRNS2WiAJq9hADEBe6E+3S3iTn6zsm924dRlU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TfkuWXvWz1pzNfRnbQzmi4Gr/gd58MtU90AI49v84MULeD0+7iec4Zelu3Y1jtZeW25pxm2vLPHuoJXTUimuN9SsOqZWMDxHCFMq5BbWEzr+S3UN9zE9HQzZnahSnkx46qtsvnl6hlrX+VJGNKPIoOep0JIKSJOL6AA10rG+v04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=X2Iyp0u5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="X2Iyp0u5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D20E1476;
	Thu,  1 Oct 2026 06:41:02 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.0.130.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 83C9C3F86F;
	Thu,  1 Oct 2026 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790862065; bh=QZjcuywRNS2WiAJq9hADEBe6E+3S3iTn6zsm924dRlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X2Iyp0u5ERo3xFWjAuSqo2fvv1jnliK4oFWdVKMZoh3mQbJFP9xefMf7kAN7m9EIr
	 iP9sf6pB03FY8o8uP63VLYtfW7FMhi63mGJLdeR9VttIw7ZrgILctGV8Hu5/pfJWK6
	 zvuecNl1In5jcI0Xng1eKWbpY2PPEqL+J+rzB0IE=
From: Christian Loehle <christian.loehle@arm.com>
To: linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	elif.topuz@arm.com,
	sh@gentwo.org,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH v2 2/5] sched/eevdf: Share the slice protection calculation
Date: Thu,  1 Oct 2026 14:40:13 +0100
Message-Id: <20261001134016.3881268-3-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001134016.3881268-1-christian.loehle@arm.com>
References: <20261001134016.3881268-1-christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_protect_slice() and update_protect_slice() duplicate the slice
selection and vprot limiting rules. Merge the calculation into
set_protect_slice().

No functional change intended.

Suggested-by: Elif Topuz <elif.topuz@arm.com>
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/fair.c | 39 +++++++++++++++------------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 85bf02570473..3f881ded5457 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1119,43 +1119,34 @@ struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
  * When run to parity is disabled, we give a minimum quantum to the running
  * entity to ensure progress.
  */
-static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
+static inline void set_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se,
+				     bool update)
 {
 	u64 slice = normalized_sysctl_sched_base_slice;
+	u64 vruntime = se->vruntime;
 	u64 vprot = se->deadline;
 
+	if (update) {
+		vruntime = min_vruntime(se->vruntime, avg_vruntime(cfs_rq));
+		vprot = se->vprot;
+	}
+
 	if (sched_feat(RUN_TO_PARITY))
 		slice = cfs_rq_min_slice(cfs_rq);
 
-	slice = min(slice, se->slice);
+	if (!update)
+		slice = min(slice, se->slice);
 
 	/* If there are shorter slices than se's one */
-	if (slice != se->slice) {
-		vprot = min_vruntime(vprot, se->vruntime + calc_delta_fair(slice, se));
-		if (sched_feat(PREEMPT_SHORT))
+	if (update || slice != se->slice) {
+		vprot = min_vruntime(vprot, vruntime + calc_delta_fair(slice, se));
+		if (sched_feat(PREEMPT_SHORT) && slice != se->slice)
 			vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));
 	}
 
 	se->vprot = vprot;
 }
 
-static inline void update_protect_slice(struct cfs_rq *cfs_rq, struct sched_entity *se)
-{
-	u64 vruntime = min_vruntime(se->vruntime, avg_vruntime(cfs_rq));
-	u64 slice = normalized_sysctl_sched_base_slice;
-	u64 vprot;
-
-	if (sched_feat(RUN_TO_PARITY))
-		slice = cfs_rq_min_slice(cfs_rq);
-
-	vprot = min_vruntime(se->vprot, vruntime + calc_delta_fair(slice, se));
-
-	if (sched_feat(PREEMPT_SHORT) && slice != se->slice)
-		vprot = min_vruntime(vprot, ineligible_vruntime(cfs_rq));
-
-	se->vprot = vprot;
-}
-
 static inline bool protect_slice(struct sched_entity *se)
 {
 	return vruntime_cmp(se->vruntime, "<", se->vprot);
@@ -10268,7 +10259,7 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
 	if (sched_feat(RUN_TO_PARITY)) {
 		u64 old_vprot = se->vprot;
 
-		update_protect_slice(cfs_rq, se);
+		set_protect_slice(cfs_rq, se, true);
 		if (hrtick_enabled_fair(rq) && se->vprot != old_vprot) {
 			/* The enqueue may have armed the timer before this update. */
 			if (protect_slice(se))
@@ -15576,7 +15567,7 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, enum snt_e
 	if (on_rq) {
 		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
 		if (first)
-			set_protect_slice(cfs_rq, se);
+			set_protect_slice(cfs_rq, se, false);
 	}
 
 	if (task_on_rq_queued(p)) {
-- 
2.34.1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434387;
	b=eKvTpoQ6SKwS1WQw0ft1VN8eZeW74U8UIm6fkkqcazIh7dkSqgsYlRrvT6tsJD4TPGkb
	 R5Mc4Jyl8Kx8Kin82nFidLz7JA2O0bR+oy9f1N7zawzKjymK30JVVX5tdJCcM3ptqcdca
	 aay3aHx6MKlwhcflv2Rs4X0fArl9jLaC3Pg27qsyglhxpD3EnDM4KvSWT/jRu5RtbhltI
	 167wGpKVTAWjOZiy4LTZxFMbYING1RIK7P58WFpQKPbzWYJqzNcKEc8kL10FzRk4wm55m
	 IaMnaMBn9iUGkh3mJaVBK0BMkJWsvHSfXhH9rt5CEFDlLHfYHo9xlPiJVxhc92+AyOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Nopl7OC6OC3jjxrSDWB4dphBmpfr7ikO8pphH6u9omA=;
	b=N5cehpqkgirtIwcNAlBSy/8uhJfUa+iMoQb4dhnCWgApNtwWPxsBwSmY202WHXpuYTRi
	 8bfaab0V0nx1Q0KCGHF8TZnyd/n0d6/btxk30Uio/rdbKE6hMf28N59ClsPYJHzdoQ1cn
	 BWJDS/cHudkay+jQCKqXP3Ape5T/7yaYyp2OKddQsscbglp8+ZqtKNMM3a7Yho9ECoLaT
	 nv9c/x1Vos36JUyfyykVxARroFgKxARyEW1ryKnttJ11y9JEGzgIecDYfD8fLi1ZdfIPN
	 pgVf1s7WoLkgSbab6ENGOXBeqC3p3YTR0J/VDXNmoPS1mFkp47z159g2ZOjms/hAKwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RBEUfkXM;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51856606A325
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51856606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RBEUfkXM
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1479427f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792434385; x=1793039185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nopl7OC6OC3jjxrSDWB4dphBmpfr7ikO8pphH6u9omA=;
        b=RBEUfkXMCf4KYG/C82dHXL2TE5UAK+0pssxrCTGern0nBSQitNdTpuEI+b9P7taZW2
         uOFrqu5zlk/wgz9gsipwy5ekQKJ9ScMJO0winpKflAIQu8XkBP6fsH3OAMlOCgsADDhI
         PPj9otpx1fJRXAJe9lPrdbEgL2HLMjUCVS4YAf8PpWReePVnTqW9FwufRW4rnOMfR3gS
         zH95X3DNHEq9Fb6P0NhPGhajQ+K60B25k4usQSZtO/aExwY+bWTxYaouAfw2QkPpnb4U
         AlsbpU7TxnR9L/iOQVZ+Bt7hqhHCW17KHehUQ8x95fxrq/E2YBVVKt1M5GC5TrueIODX
         DxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434385; x=1793039185;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nopl7OC6OC3jjxrSDWB4dphBmpfr7ikO8pphH6u9omA=;
        b=aZYueWBWaKVGNY2of6faJHPcSA1Ygy3FHijjNEjokrGhKxIR+Kn9mGBqypRpndKVwg
         Tm9HzpyF/KFrz+bGxPUXoEWjdUNO83ta4HtmGUsU0NzANVM3ZN5DzMPnqmxyU7mO3B5k
         wsZb1XPRHcu8iMnt6m/7dXM6EAz+k43dHlzjqK8AyfZ7tD59CfjShwdQqdtDdCAuV0Xr
         7nlgoZ3cNWED63zOV1I5Uly0fZNNNzjle+Xbsg9HWF3pF5eivQh5h1qxp0MGoitRCbwN
         gr558h9ZLqTVdIx4BaReIKEz6JqeqfQY2IufB6dT0n1+vd8E1yn66UuNBfiQlj+sXEii
         SYbA==
X-Forwarded-Encrypted: i=1; AKwUvBwqmXmhzeCOpi726wcBKhIhN7pziqsESiBQSr0Coy5JIe5wegMiozg65rLGnG56QpwuRL5yF+56yAzv1+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKn0nBizzHA3S2/9NuI9y1kcPUl00aldC30bfp6xRcn5hnI+hFl
	9vVKsNjFJWxZGdzbnWYn6JV3jWuCDIWkHrJckh/sJhrZKOZzcVgFyI2fPjXroQ0TY8o=
X-Gm-Gg: AYBFou3rLTvZRLZZRRlWSqoT32LFrvYPpeyGfiqxKV8i0ZGTTzwIsINynsypGLPkqcx
	1m7z6hnfimYaJ9b1SSCrglGbcTNuEmaoGMCTri4YCKBKSNSR4a/6rW7paBkPBf93vbFuH5R1Btr
	wWOtAf0h28uAkfNE/HcLfGdLCgZkSbtcEHQ7r4G7OHC2mBT5z2fFRMNwPnJ4VlVeFUqS1o4e76q
	gH//rjla9QSqPTMJKgLxuFlP/3UA7p0KYf+2KfkZIMhTSHGhvpdWeLKBGTQF8+EDeG6mXEmEObG
	rV2ppOiUS7QIG3AJZdbx+6bBN5ZrKIWr6PDBaR48iTzt/4cow1ghs+uQQYg8TdXnYyGKdgUntPU
	9Bl3Fael2o8cXvDxUWuIT8Mokfy+4ezb7TvaqPKfTG1VE0z/8WOAp7krZsx66nTm/7WWGN12CWE
	V+QxVhlOjZdhbW/F/iEltdvTt2uIRza4SnghEI/6IQxdnUUrd0CYVeqssNDxNGMRTTgMTA+ww8R
	ndfag23cjmKWRY=
X-Received: by 2002:adf:f881:0:b0:48c:5cf9:88d6 with SMTP id ffacd0b85a97d-48e07bbe2f6mr12777929f8f.2.1792434385541;
        Mon, 19 Oct 2026 11:26:25 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:aea:8007:d7bd:c2c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm520008f8f.54.2026.10.19.11.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:26:24 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	jakub@okonski.org
Cc: longman@redhat.com,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	cgroups@vger.kernel.org,
	jstultz@google.com,
	qyousef@layalina.io,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2] sched/eevdf: Fix sched idle task group preemption
Date: Mon, 19 Oct 2026 20:26:22 +0200
Message-ID: <20261019182622.1584454-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Even with flat hierarchy which puts all runnable tasks in the same cfs rq,
we need to parse the hierarchy to check for sched_idle task group.

Reported-by: Jakub Okoński <jakub@okonski.org>
Link: https://lore.kernel.org/all/58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org/
Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---

Changes since v1:
- fix prototype and cleanup unsued variable

 kernel/sched/fair.c | 82 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 13 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0f2364479f9d..27ce3eb467a0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -433,6 +433,38 @@ static inline struct sched_entity *parent_entity(const struct sched_entity *se)
 	return se->parent;
 }
 
+static void
+find_matching_se(struct sched_entity **se, struct sched_entity **pse)
+{
+	int se_depth, pse_depth;
+
+	/*
+	 * preemption test can be made between sibling entities who are in the
+	 * same cfs_rq i.e who have a common parent. Walk up the hierarchy of
+	 * both tasks until we find their ancestors who are siblings of common
+	 * parent.
+	 */
+
+	/* First walk up until both entities are at same depth */
+	se_depth = (*se)->depth;
+	pse_depth = (*pse)->depth;
+
+	while (se_depth > pse_depth) {
+		se_depth--;
+		*se = parent_entity(*se);
+	}
+
+	while (pse_depth > se_depth) {
+		pse_depth--;
+		*pse = parent_entity(*pse);
+	}
+
+	while (!is_same_group(*se, *pse)) {
+		*se = parent_entity(*se);
+		*pse = parent_entity(*pse);
+	}
+}
+
 static int tg_is_idle(struct task_group *tg)
 {
 	return tg->idle > 0;
@@ -476,6 +508,11 @@ static inline struct sched_entity *parent_entity(struct sched_entity *se)
 	return NULL;
 }
 
+static inline void
+find_matching_se(struct sched_entity **se, struct sched_entity **pse)
+{
+}
+
 static inline int tg_is_idle(struct task_group *tg)
 {
 	return 0;
@@ -10129,7 +10166,35 @@ preempt_sync(struct rq *rq, int wake_flags,
 }
 
 /*
- * Preempt the current task with a newly woken task if needed:
+ * Preempt an idle entity in favor of a non-idle entity (and don't preempt
+ * in the inverse case).
+ */
+static inline enum preempt_wakeup_action
+wakeup_preempt_sched_idle(struct sched_entity *cse, struct sched_entity *pse)
+{
+	int cse_is_idle, pse_is_idle;
+
+	find_matching_se(&cse, &pse);
+	WARN_ON_ONCE(!pse);
+
+	cse_is_idle = se_is_idle(cse);
+	pse_is_idle = se_is_idle(pse);
+
+	/*
+	 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
+	 * in the inverse case).
+	 */
+	if (cse_is_idle && !pse_is_idle)
+		return PREEMPT_WAKEUP_RESCHED;
+
+	if (cse_is_idle != pse_is_idle)
+		return PREEMPT_WAKEUP_NONE;
+
+	return PREEMPT_WAKEUP_PICK;
+}
+
+/*
+ * Preempt the current task with a newly woken task if needed.
  */
 static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_flags)
 {
@@ -10137,7 +10202,6 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
 	struct task_struct *donor = rq->donor;
 	struct sched_entity *nse, *se = &donor->se, *pse = &p->se;
 	struct cfs_rq *cfs_rq = &rq->cfs;
-	int cse_is_idle, pse_is_idle;
 
 	/*
 	 * XXX Getting preempted by higher class, try and find idle CPU?
@@ -10174,22 +10238,14 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
 	if (!sched_feat(WAKEUP_PREEMPTION))
 		return;
 
-	WARN_ON_ONCE(!pse);
-
-	cse_is_idle = se_is_idle(se);
-	pse_is_idle = se_is_idle(pse);
+	preempt_action = wakeup_preempt_sched_idle(se, pse);
 
-	nse = se;
-	/*
-	 * Preempt an idle entity in favor of a non-idle entity (and don't preempt
-	 * in the inverse case).
-	 */
-	if (cse_is_idle && !pse_is_idle)
+	if (preempt_action == PREEMPT_WAKEUP_RESCHED)
 		goto preempt;
 
 	update_curr_fair(rq);
 
-	if (cse_is_idle != pse_is_idle)
+	if (preempt_action == PREEMPT_WAKEUP_NONE)
 		goto update;
 
 	/*
-- 
2.53.0


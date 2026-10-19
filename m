Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433777;
	b=UgBDge0Tn1aYkvODA5xWCf0mymyv053tXeBj0tiMdzqgvihYJXWYf/V879vzGwgojUrs
	 Ymdpc0GASLqV3vZ7JTY/F+bnM+UO4WrlmMp3/PAFNffio3ckvMIR881LFPQ3gOrsTzI41
	 qSSaeDeIiWlCSOWadaTEcBjAGBrCMsBa+Cpkg4/GD/xtnGqXRlliPhYhhUoWotzndIIq1
	 YD6ze8XsearMhYcpdrxEy3NwgcTXXnx4M5+M+/vvyaQ+gQx3dWh/p08R3U0ad43wr/oF4
	 Y7zrBamTcFQL/oK3cdHD1/EOhgpLPIOJni6/QjJ5ID1fsFvnQk1mf6zQpCObnFajp/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=O0/TE8eMqHolOOyHMRR0hwR2h8un8krdiW92QaauaW4=;
	b=QZdAkuTrpgc+BlwOy7ldN8bWtsHWG43XXlIbFlMNBvBPVxBLVdcWLhvTOHRX57pSuykP
	 idtFVZ1mx+MwdzGfqriva2YGxhgspmjzlKW52yKl5BQmy0y2ojb+H4N5VWZPy8zgHnY0W
	 oYiRDnImjqQjP9M5VVwqHeB9ETS3LJcLvlnQKwylz/jmLJgzEsSzwXMnxDD7QP0JzW/bd
	 9SyivMbg3Gf+oKCGJC0ddonheMDmQX1ejfh87ljI8EmmXQAGiiLBy60NN4DVVfosQR5aB
	 Ffr/fm/FaOgu4tfMfYo/MsVeTcV8DUI3HUrpPNhAiDonQy2lRuKq0AofCIsCokSfw9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P15o8bhX;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5CC606A322
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5CC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=P15o8bhX
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b060ec084so1640239f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792433775; x=1793038575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O0/TE8eMqHolOOyHMRR0hwR2h8un8krdiW92QaauaW4=;
        b=P15o8bhXD4fPfV9e2fC6vwKj/u9yl33N9jQBVq19hy7lOtzsmmrE0D0d9WvRm30g4U
         vm+ECkG0c/IjwrYJTa34UaPEVAzlJU2dgfrjlytZQluoWrzIPZW9NNkQBHc7pcoa/wfz
         kp48qjd+08KE7Y0P64BBu9GPRRd7DmjV7U0VekgjFAEMsRAMwEQf2qgApuhsaGNQQmyN
         NoE1wQb+OIMT5OZIX0j9ekCoUTvHeYTWMlGQaVmboKoZ3MI6oF3c8lE6+ZhY0764l5vQ
         jMFK6fidrFhwkGT/EmhTLfe62z64j8EA0iB0QLkkZ8tjeZv3w8w7wQ37LTWJAJHARFl8
         Z13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433775; x=1793038575;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O0/TE8eMqHolOOyHMRR0hwR2h8un8krdiW92QaauaW4=;
        b=nr/GzvLXdap5ES99UwWz4OpwyKN7n/AVvkZL/lTOA5XsUKvxnTEOcQcq54q8pIJdJh
         iUDkM71v4OKJYmZ8s3wEVwKmCWMCDbTejUtDUMEmCgK/RdksStD3GYYhIZF83sDk+cVf
         MmAERWQsznd7bGfIH/G30ZuxcaANaP+vSEQDiYfIH4RO+B5oNkcIQZJfK8C86pvCR89Z
         iCWEu9ZTmcnROzMsJskUWTal1AxdiVY0xCR+BrdmuItC9mbUtjGGQHRUHRfG1Em29aFw
         YGmSrPDScfURIHHgBkos/EhLYMHP9ItIbP5CVXVHYhDV4Gxl/V3dElpPlNdsIH/LDxwe
         tmiw==
X-Forwarded-Encrypted: i=1; AKwUvBys+MYGewcM/cvckEqxCUQNODsHZJFaqnvfpE/6GMAKutwMfTE5TwU6McVm1NumiYbB5xgdVpB++CFwZRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs65Ui9gRCcaqtvOezWvvQ3m4zR9NEhow9uH0qh36Anf6MtWs6
	vC0k72byrm+/4mSTWWclq7uHmWpZEVCAFkfWS3xDDBX/XwuCXA4Fjn8eYXbbC2jFkps3Jp9E7Nj
	VZEqg
X-Gm-Gg: AYBFou3rQHBnmXg4RVWucYrqg4R6/MKhu09fgUHpmNBbnPt8exfqqqRjfEm+vnfO6Ed
	UZstv2alVvuBOYH+UkNJy0UCc8MqRuUvDIlDAbDCgAGpExL5xgHG/cQRzcpEeFSJudx6DHnUpNk
	GSMR/R8jF9sMSXo9LnAME+J5cNTdkVIQJ0Jp+Tq7iz9xxz5Ye9BeB9AEh2PLjXm8DJe66DLUcQ9
	GV9FngDmgOk6XxErXmEsQdb1XZUtpoTy2Uw7I5hwMePItoVJSUR9RwpnFdoy5jlSoEmVOr68Hri
	ZpGm6Eb3a58ieZSG2GrnwmPwt5jwIZDEeJ1M72mFBCxGyKISsYGxAXNvckHE+yaBz9AAaVp3RKi
	14bovb86IjfV0R6oo1FfFULHfzudzQ3lt7tToHmhm7bahW5EHpsIQP81ykSG9sgipP6kNgon5db
	pDdydKPQ8UTUbB32n3pFse3+y23lXyDeKJCa/b96QiUd/YckFTBhHJcQwIFBi9j1i/kkHV/jGZs
	YF6tpk+DHzxzV8=
X-Received: by 2002:a05:600c:c0c7:b0:4a1:d743:77f1 with SMTP id 5b1f17b1804b1-4a1d7bc2e33mr120421865e9.24.1792433775118;
        Mon, 19 Oct 2026 11:16:15 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:aea:8007:d7bd:c2c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cb8d5csm10596675e9.6.2026.10.19.11.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:16:14 -0700 (PDT)
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
Subject: [PATCH] sched/eevdf: Fix sched idle task group preemption
Date: Mon, 19 Oct 2026 20:16:11 +0200
Message-ID: <20261019181611.1461433-1-vincent.guittot@linaro.org>
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
 kernel/sched/fair.c | 81 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0f2364479f9d..20c33d13a5e7 100644
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
+static inline preempt_wakeup_action
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
@@ -10174,22 +10239,14 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
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


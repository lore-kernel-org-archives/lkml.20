Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE73330D29
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788977838; cv=none; b=tCXVrsJ2geNT8LsMlUIVTARMvXuglVY56uGi9hhEm9RFf9hqMvD2BPG94CrGMjioUxL+IkQI1oEkJZTvEdyr645eGNFL2tS2iwlrldZbi20HDHDFsxsnriqnLivOUZ0WnUM4Qf85H1zq5tnX3q2K5neMxlVCf4qnr7EplGNAnaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788977838; c=relaxed/simple;
	bh=8rCqOHK9UQet12zi2HJfEXQtbfeRsLJ9O5tNN02b2Bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ou5yJ/23gJUkcs9q0bxw7A37Kfma9Xj6I0ijpguZz5Qis5Luu6FriJ2FO2Kb75pDyJ80sVIWxSmbes0/2PfaQi/QZT3Afnoy2ksxR4fWJv3TmChGiX+JQ93xnYE+I3jQBAq9Goo/b59v3NvEp4O2MEZLX0ehdLJqmgr35AO20nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3hEDVfZ; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3hEDVfZ"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e56a1b327so1424013d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788977836; x=1789582636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxlKOF0jVydTMJwkJ+9HN4kH14NhjqLFran6KyqZa7A=;
        b=S3hEDVfZjA/EX6qELPpgJ7ey3srpj6GyhQahbveqS5KToBdWGlPbUNccI/tGvmTBvf
         MJaxJKKcyPnj0dBsI8yAZO4f44HrKogZ+j2UxpXJQI/YdCDZ4sgTsj3a/Il0zptgurQx
         6V3F/OTXRl0+3NR5vloFG2u0c6RHwvdPLHVSFxAsvdMBqCvhqqEC0TlUFdL5C/S/Ufca
         ggZXC8vJrrTLxVguoYkQ+xh8rpNO037UO9JGK4569Q6gw6hygVL1f9gQlpCVJr+STob2
         ge1vNkFO/Iy3w6os80gg1By6zAQ0MSd3nV1C/zm7N/HNEUMxQOLLDiaOjzPFH520+/Yx
         WdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788977836; x=1789582636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxlKOF0jVydTMJwkJ+9HN4kH14NhjqLFran6KyqZa7A=;
        b=gKShmWxB0q8y2WFx06abtHcY4z0kIeFdlgQ5qhEOfUqVyiazusKhz3lhydB0B/h/zG
         dDLzKWmQ9ztixnD1vJQmo47DK5YtUy+S5CsHxqKtZFGOw2lOC0vI7vW2+fDWQXt5PEGp
         IV/0rAjJD4ZtTAoyNK5Z3Adjr59LOR0Pc/B1rghU14F+EKJdpcxcaHMByiV/+R8iMDwO
         /4OXQT/1RMSr5qQS8isNHifcp4bWklFNlTZ7/zsEgLy697YHjFTE/3UR66TBb3R8sJgX
         BJjzJg0axm5jWKzdZFtalETVY/8fwTKH2/4XFxKUO3dNM7ym6OlSr5jd+4IS2jm9+DAy
         sAEA==
X-Forwarded-Encrypted: i=1; AKwUvBwCQeaOIjKEIHD4tigZ1hTqloB2T0gzu58rdTH+lSvqk5ToRQ4q8rYX0EsFlZcb1oMKTjasZLG99LJM7NA=@vger.kernel.org
X-Gm-Message-State: AFuF++lAdhjgEZs/RiFtlrnojjHAPUzmPPSmVvrdcnm/VNXjtcZNjZ3K
	lYtXJ84DNyvaTvGvc+41zWwGgG306T76yOcnVXGgo4BKSPKHufLFh503
X-Gm-Gg: AYBFou3oyxQUS/sdsaG6b3PubaeX+yZrtO7Ifw8bls7ey7W8E917t1qH6JhLDWeaAxQ
	fGdU0GCfH65aCabf0lA6mQQmxjc5RbSb87hdPSHuMW5bGYYQVzbmAEmfSpU+3Tyd2c8buzNTiLV
	U1nVyEiU1KFVddbXeKoE3MpazZWc++ByG42TVISHBwYO/Pt9lDpM4ZjJ3pFdyhQPNmwsEjKiHfQ
	yyBYW3SYMzjMlxaeJJKIXyfd0r1KvBOMjH8G/O7qpPlP8HlVUwRJShmSBBmHR8VSbmp1rYGa2py
	vLK3f6KLBcobBctcTYkBN4klZ03LL0KQDv0gr0nYf7PEFgU1n3kkddGU6GQHfG8UglNF2ia6/oz
	yV7o4E6+jcGJPQsg0l9IIiCKU2qCAvn4q/wO6BkwsTfAkLagp/wrMwXwd34d+D+RkbOcScNcFeS
	TbRaByoTz4cqlEGVMYIy7fVJ8MTe4a9tQtb8DXxRbjLTgTpJip3BzeKsKMszSM58AoMKnywiX9Q
	j0/ZbREuI62d0QEUJzqYGkx92q3
X-Received: by 2002:a05:690e:4554:20b0:671:631:c13a with SMTP id 956f58d0204a3-6710631c365mr1832456d50.53.1788977835970;
        Wed, 09 Sep 2026 11:17:15 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149600f48sm114821757b3.13.2026.09.09.11.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:17:14 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH] sched/fair: Rework pick_task_fair() control flow
Date: Wed,  9 Sep 2026 14:17:12 -0400
Message-ID: <20260909181712.1050224-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split out the logic picking a task from rq to a separate helper,
and get rid of the gotos.

With GCC 15.2.0 and x86_64_defconfig, the new version saves 96 bytes,
and with defconfig + CONFIG_SCHED_CORE + CONFIG_CFS_BANDWIDTH it saves
124 bytes.

No functional changes intended.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 kernel/sched/fair.c | 51 ++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index ade1eceb39b8..ad0c477e58a8 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10043,39 +10043,42 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
 	resched_curr_lazy(rq);
 }
 
-struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
-	__must_hold(__rq_lockp(rq))
+static struct task_struct *pick_task_fair_rq(struct rq *rq)
 {
 	struct cfs_rq *cfs_rq = &rq->cfs;
 	struct sched_entity *se;
-	struct task_struct *p;
-	int new_tasks;
 
-again:
-	if (!cfs_rq->h_nr_queued)
-		goto idle;
+	while (cfs_rq->h_nr_queued) {
+		/* Might not have done put_prev_entity() */
+		if (cfs_rq->curr && cfs_rq->curr->on_rq)
+			update_curr_eevdf(cfs_rq);
 
-	/* Might not have done put_prev_entity() */
-	if (cfs_rq->curr && cfs_rq->curr->on_rq)
-		update_curr_eevdf(cfs_rq);
+		se = pick_next_entity(rq, true);
+		if (se)
+			return task_of(se);
+	}
 
-	se = pick_next_entity(rq, true);
-	if (!se)
-		goto again;
+	return NULL;
+}
 
-	p = task_of(se);
-	return p;
+struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
+	__must_hold(__rq_lockp(rq))
+{
+	struct task_struct *p;
+	int new_tasks;
 
-idle:
-	if (sched_core_enabled(rq))
-		return NULL;
+	do {
+		p = pick_task_fair_rq(rq);
+		if (p)
+			return p;
 
-	new_tasks = sched_balance_newidle(rq, rf);
-	if (new_tasks < 0)
-		return RETRY_TASK;
-	if (new_tasks > 0)
-		goto again;
-	return NULL;
+		if (sched_core_enabled(rq))
+			return NULL;
+
+		new_tasks = sched_balance_newidle(rq, rf);
+	} while (new_tasks > 0);
+
+	return new_tasks ? RETRY_TASK : NULL;
 }
 
 static struct task_struct *
-- 
2.53.0


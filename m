Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9242331ED1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742338; cv=none; b=kv0/jbU5TAsYiDsUolXMr7U3hjdfpeUDhtYtqp+CJqlmJ3eKASzojbuYWe16eEdDA0OGUAmdWcpJIt30xuqZYK3YhVWhnATC7QQKPWSdTCKQFHms72Xu0nt+fUiP009SxyOlwTPYkSEgc3UEVKQI+A81Arsf6sSQAGaGxfpqs18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742338; c=relaxed/simple;
	bh=c5L2N8K4jaLW+YKL5ZRHSmA5GrbCHJUx1YRDRSpMbtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptwXahgwPUpkhg1nk7Bn8PfQ0bcLW63sT5APaiKNq2bDFbNItzB/PKbvveNZCIwXz/NoL33sle7Jjyi+ARxYkFpk9mxVntGB4jOOHsXGVDuvY1C5uLB+C5RKak7n5iDQkS60yMQjHbsR5YG8bPJbIz4kW0EsIJaM9/3UXzvrioI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKzfY19i; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKzfY19i"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so674827a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789742335; x=1790347135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tC1/zDZqUkjtQhuXKRML0y+kRLO/BEGkJoW2Cy9A5NY=;
        b=QKzfY19iS2KdWT6+wvWMQ/y+5ab1/slocJrgfBQSeZ1Uxh/VBwOTbuU9W469ZmkHKV
         A4cJ/odUcGJLhYXcMTkZTzYFCYQEZyPLBnPPEN8Qu+OnjnLxhTFY4VCtPvhtnY9rCFG/
         KMPV+4PXjuOKVdABXVhn4AK5486rf03tVR8fU1JMWH8er3up5NJwQhobzVM5scTvDzoc
         Gs2towLY4qhEKIsh0o7UFGgCM/vRs35NxqzzBT2p9Ek6xlovXjH8fUTZkcpBwB498fX8
         CeBLkT0j5pnqq8YnAe7NGWj8TmUTVEY+1b85EkP6/GfLPuVI3JCHNLjBOWf4KTQOrnCq
         35mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742335; x=1790347135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tC1/zDZqUkjtQhuXKRML0y+kRLO/BEGkJoW2Cy9A5NY=;
        b=hQNlpGbXEHnk+mG3Lp/Z+CBU2eOnndUYtxL2MJeieQFiPFEedzMTfH7uHU+LxfrSMe
         lC1CmGdEcgmbaBPq6uKMFMLtEicMvnQGY3wR8HM4i/duItiol5qxppIeoLA1oCfXBqTW
         HO+3KeIzROmkMr7EEve9yvfO7RcQvpWQDbh+MGlhx0Ysp0CCwh/cMHzhX1pHGCqpxfUQ
         7mZ2VO1rKPTlZ/w5HZ3uIqbv32be2V7n2L483xAHOdvix1JF/ZkGpwVJZgh0ky6xgWMw
         /FldeCKHFyvrJGVZAQi9stWrbvhK17YYv3WxQ3AtKGVUPJWBUeNjowl6oPK/i1wU+Hh+
         WjWA==
X-Gm-Message-State: AFuF++n7EEEkfXSj5QBJ43cN8JbR3uPI+ke8UqCmq4gSAvZvO9XassoV
	INoOnVL6breya20u82JzKG09eKJufrPkfaar4UXnD8oLHB8IXQde3+L4
X-Gm-Gg: AYBFou2Y4JA/vckNrnenYptLcgTmfiqNy+yx6lZXmnjrZGkhfS3ZB3J0qi+yJzDbhxz
	FsIq62oJV33zKBqJi/fF5Q66KYeKAG2v7Gbo5VTTXT2wr6bjGka8iCKYvZJ15MzYfCVQFIXC7Uh
	lE/KclM0/4hB8ly7pcASe5avaWuu6DQxtS8m+T7ySTR1TJvBuPII0zY6n63Omoax3ImM0ynJJfK
	+IRrXr789Ornups2YQ93zLFp7dKanDbRrx6gWKcMcymJVOKDGx6VVvy7wHrHUJ233Cb6DWzlpRG
	RULxIjpGOq4DtwDzWnqJQirJcVm0W9uiepAqfTyQi8tan6sKXelb0+tdCBIl6cbHeUfK6iuNATt
	cPcMOen0gzog5ZuoEZSUgEKfSNO1fExU3TsPpb7aFLhVrxDM01SdC/EjjTVEZt9p2Si4y4zugcd
	fLQ1VjzshBjrGAf9qDUlwu/rSdDQrMkFD+mJFUSAyf4E2JbVWAx+/DPRCaFq1IfSCoszdqoG5Zm
	v9GC4fiX724g4wXRaBgiA==
X-Received: by 2002:a05:6a21:7018:b0:3dd:85ba:ad0 with SMTP id adf61e73a8af0-3dd85ba2520mr5312855637.35.1789742334641;
        Fri, 18 Sep 2026 07:38:54 -0700 (PDT)
Received: from DESKTOP-S9NKFCJ ([103.120.166.85])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50e7a64sm1139230a12.27.2026.09.18.07.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:38:54 -0700 (PDT)
From: rahadbhuiya <rahadbhuiya2021@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Andrea Righi <arighi@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	rahadbhuiya <rahadbhuiya2021@gmail.com>
Subject: [PATCH] sched_ext: Fix coding style and macro parenthesization in ext and cid
Date: Fri, 18 Sep 2026 20:38:44 +0600
Message-ID: <20260918143844.1279-1-rahadbhuiya2021@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several checkpatch issues in kernel/sched/ext/:

- Convert SPDX comment to C++ style in ext.c and cid.c per
  Documentation/process/license-rules.rst.
- Parenthesize SCX_CID_TOPO_NEG and scx_enabling_sub_sched macro
  definitions to avoid precedence side effects.
- Put struct initialization opening brace on the same line in
  scx_tg_online().
- Remove prohibited space before semicolon in scx_bypass().
- Add blank line after local variable declaration in
  scx_alloc_and_add_sched().

Signed-off-by: rahadbhuiya <rahadbhuiya2021@gmail.com>
---
 kernel/sched/ext/cid.c |  6 +++---
 kernel/sched/ext/ext.c | 20 +++++++++++---------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/ext/cid.c b/kernel/sched/ext/cid.c
index bc4eee5bb4cb..ef0a29a88cd1 100644
--- a/kernel/sched/ext/cid.c
+++ b/kernel/sched/ext/cid.c
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
 /*
  * BPF extensible scheduler class: Documentation/scheduler/sched-ext.rst
  *
@@ -28,10 +28,10 @@ struct scx_cid_topo __rcu *scx_cid_topo;
 
 static struct scx_cid_tables *scx_cid_tables;	/* used only during alloc/free */
 
-#define SCX_CID_TOPO_NEG	(struct scx_cid_topo) {				\
+#define SCX_CID_TOPO_NEG	((struct scx_cid_topo) {			\
 	.core_cid = -1, .core_idx = -1, .llc_cid = -1, .llc_idx = -1,		\
 	.node_cid = -1, .node_idx = -1, .shard_cid = -1, .shard_idx = -1,	\
-}
+})
 
 /*
  * Return @cpu's LLC shared_cpu_map. If cacheinfo isn't populated (offline or
diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 3219f0da0fe4..a807754ff1f0 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
 /*
  * BPF extensible scheduler class: Documentation/scheduler/sched-ext.rst
  *
@@ -129,7 +129,7 @@ static atomic64_t scx_sched_id_cursor = ATOMIC64_INIT(0);
  */
 struct scx_sched *scx_enabling_sub_sched;
 #else
-#define scx_enabling_sub_sched	(struct scx_sched *)NULL
+#define scx_enabling_sub_sched	((struct scx_sched *)NULL)
 #endif	/* CONFIG_EXT_SUB_SCHED */
 
 /*
@@ -4779,12 +4779,13 @@ int scx_tg_online(struct task_group *tg)
 			sch = scx_tg_sched(&root_task_group);
 
 		if (SCX_HAS_OP(sch, cgroup_init)) {
-			struct scx_cgroup_init_args args =
-				{ .weight = tg->scx.weight,
-				  .bw_period_us = tg->scx.bw_period_us,
-				  .bw_quota_us = tg->scx.bw_quota_us,
-				  .bw_burst_us = tg->scx.bw_burst_us,
-				  .sched_idle = tg->scx.idle };
+			struct scx_cgroup_init_args args = {
+				.weight = tg->scx.weight,
+				.bw_period_us = tg->scx.bw_period_us,
+				.bw_quota_us = tg->scx.bw_quota_us,
+				.bw_burst_us = tg->scx.bw_burst_us,
+				.sched_idle = tg->scx.idle,
+			};
 
 			ret = SCX_CALL_OP_RET(sch, cgroup_init,
 					      NULL, tg->css.cgroup, &args);
@@ -6200,7 +6201,7 @@ void scx_bypass(struct scx_sched *sch, bool bypass)
 
 			/* cycling deq/enq is enough, see the function comment */
 			scoped_guard (sched_change, p, DEQUEUE_SAVE | DEQUEUE_MOVE) {
-				/* nothing */ ;
+				/* nothing */;
 			}
 		}
 
@@ -7288,6 +7289,7 @@ struct scx_sched *scx_alloc_and_add_sched(struct scx_enable_cmd *cmd,
 
 #ifdef CONFIG_EXT_SUB_SCHED
 	char *buf = kzalloc(PATH_MAX, GFP_KERNEL);
+
 	if (!buf) {
 		ret = -ENOMEM;
 		goto err_free_lb_resched;
-- 
2.54.0.windows.1


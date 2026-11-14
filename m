Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645129;
	b=XePqjR3D/iQZhSE+vqGAKVmMOX9OQYrnIE4Nm/WVkf3oriaIvycNdjHer+XfPlSvtRfV
	 Z1OWXZXpWAf+ABf6APHMpXZhDJ4RF3nC68Qq7wEisxLzzzY/4pcgJVNtZPBsl94Ieb8Tu
	 5dBg9xd0eErSAzOCmLwLpu+96ZO97bQlpr/TGco3Ds6TGLoahbTiO5NshfMKfGAST0HFZ
	 4iqmhQ6AWI/Hi6q6JEYyvQVjOePT5k1NVsg/RTN5yYps9Gb1dpS6oZn2S8o75jn3XndnQ
	 S/KZHzjicQs/IemL1x9E33daoqawzCHm30bqu3uHvmlgXu7BpiK0n8SuNqm8D1sB/qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645129;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/kfnCnL2FfTXlX8HBdpj6Ey3REAg8JJil7iZklVSU5A=;
	b=mMDt3ZKXkTMvZr2yF7oH8GerG8UY9rFA6z8AP9g8Vn0e358BHoX+Af3OR4YYrIY28P6p
	 ejID+bfK03f3Ls7yhwfaqgKIQLPwtyxm+tjmdRY1ZKlrSF0q/iBKWednJhPppNPFQEWtL
	 IhgVHo+eZsThfzFHZMqAdIrvjLRwQBWOAdHr3dkFopt7+UoG4CmwAOjHkBCbUFScryr+B
	 WiousclJ3xjoeObFFxFswZD8b1gadpmKtZFVUE1AM+w80UCImSoQBbt7LAXZxBlxcw6U6
	 BR1SJPHg84j3iJfM7ReBwaZlbTXv8iuyLQ9qMoYkFZwrGD7gQEZx6YdmyJfaWvuvlIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TFUHhxWR;
	arc=none smtp.remote-ip=91.218.175.12
Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFB5606A890
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CFB5606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TFUHhxWR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=c+2Dv0KGtPLfcqjt11UtONzjMu0zD2TMN0PDR+tdXHA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794645127; v=1; x=1795249927;
 b=TFUHhxWRfj4Z9HbV3CLqx2qLbrEyAA8e/DUUZ+LbLRAAGAvmqSY6E4riVwmFT9AQiUL6AiPu
 kyI1n+b+V3Sg3N0n8KNkOswWKAYHssJuiJe8zLkolUFXOkbKEngcEYDv9Lw0YRWupnhTy3LNtvQ
 GJfW0MDnPUl3zZEFa/kR7Z9E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4e0684a63d91fa96;
	Sat, 14 Nov 2026 08:32:07 +0000
X-Mizu-Trace-ID: 4e0684a63d91fa96
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Ridong Chen <ridong.chen@linux.dev>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH v5 06/12] cpuset: use partition_update() for remote partition update
Date: Sat, 14 Nov 2026 16:31:18 +0800
Message-Id: <20261114083124.1340140-7-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261114083124.1340140-1-ridong.chen@linux.dev>
References: <20261114083124.1340140-1-ridong.chen@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ridong Chen <chenridong@xiaomi.com>

Now that the partition_update() helper is available, use it to replace
the existing remote partition update logic. This unifies the update
path through a single centralized function.

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 681adcde10e8..7a3e797aee52 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1835,8 +1835,8 @@ static void partition_disable(struct cpuset *cs, int new_prs,
  * will be added to the subpartitions_cpus and removed from parent's
  * effective_cpus, and the tmp->delmask vice versa.
  */
-static void __maybe_unused partition_update(struct cpuset *cs, int prs, struct cpumask *xcpus,
-					    struct cpumask *excpus, struct tmpmasks *tmp)
+static void partition_update(struct cpuset *cs, int prs, struct cpumask *xcpus,
+			     struct cpumask *excpus, struct tmpmasks *tmp)
 {
 	struct cpuset *parent;
 
@@ -1935,7 +1935,6 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
 static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
 			       struct cpumask *excpus, struct tmpmasks *tmp)
 {
-	bool adding, deleting;
 	int prs = cs->partition_root_state;
 
 	if (WARN_ON_ONCE(!is_remote_partition(cs)))
@@ -1948,15 +1947,15 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
 		goto invalidate;
 	}
 
-	adding   = cpumask_andnot(tmp->addmask, excpus, cs->effective_xcpus);
-	deleting = cpumask_andnot(tmp->delmask, cs->effective_xcpus, excpus);
+	cpumask_andnot(tmp->addmask, excpus, cs->effective_xcpus);
+	cpumask_andnot(tmp->delmask, cs->effective_xcpus, excpus);
 
 	/*
 	 * Additions of remote CPUs is only allowed if those CPUs are
 	 * not allocated to other partitions and there are effective_cpus
 	 * left in the top cpuset.
 	 */
-	if (adding) {
+	if (!cpumask_empty(tmp->addmask)) {
 		WARN_ON_ONCE(cpumask_intersects(tmp->addmask, subpartitions_cpus));
 		if (!capable(CAP_SYS_ADMIN))
 			WRITE_ONCE(cs->prs_err, PERR_ACCESS);
@@ -1971,22 +1970,7 @@ static void remote_cpus_update(struct cpuset *cs, struct cpumask *xcpus,
 	}
 
 	cs->remote_partition_updating = true;
-	spin_lock_irq(&callback_lock);
-	if (adding)
-		partition_xcpus_add(prs, NULL, tmp->addmask);
-	if (deleting)
-		partition_xcpus_del(prs, NULL, tmp->delmask);
-	/*
-	 * Need to update effective_xcpus and exclusive_cpus now as
-	 * update_sibling_cpumasks() below may iterate back to the same cs.
-	 */
-	cpumask_copy(cs->effective_xcpus, excpus);
-	if (xcpus)
-		cpumask_copy(cs->exclusive_cpus, xcpus);
-	spin_unlock_irq(&callback_lock);
-	if (adding || deleting)
-		cpuset_force_rebuild();
-
+	partition_update(cs, prs, xcpus, excpus, tmp);
 	/*
 	 * Propagate changes in top_cpuset's effective_cpus down the hierarchy.
 	 */
-- 
2.34.1


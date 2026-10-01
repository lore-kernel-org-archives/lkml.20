Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E974FECDD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862079; cv=none; b=KVd4QVId6v4u66uyVALcqhxfSsvBVYPCMUYhuRKuVCgvlqJDr78/0SDdfdQHPWBcF/ZpGhrYDSw3lkJVNMaxgSsIQwUquLPfXVYxh6dTJydYYARnwFGVxpWj1LB/msMeyHnXeo3ZkulvXw9zYdHKwJmYGQKzKQN4Jq3hw6Tnbuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862079; c=relaxed/simple;
	bh=RlR5vKox3eGtgBQvbDj3VpCxc7RHD2RUsyPyNBD45gY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LGOSYVlOuNfyVEzhfDZbWmpSLh1c4vrJxAgVy4Ftsf+ES44pQZK93StJp/Xg3gPNpcAYfng3IYjM+8+xfbT0L0gBmnauVJUvDmiBfHkd62gdniwuwKVkCB7ZZ7PVyQPZ4n6ug4mqbAWTWZ+ZmOvu1nrhjNB6SICQHiiViRviNoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JwXASKt3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JwXASKt3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 634A916F3;
	Thu,  1 Oct 2026 06:41:12 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.0.130.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B5B143F86F;
	Thu,  1 Oct 2026 06:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790862075; bh=RlR5vKox3eGtgBQvbDj3VpCxc7RHD2RUsyPyNBD45gY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JwXASKt3DBEsEdSlSclMWgMxy7GkjOG0lb2pD2nEWWRFUyqOdvI44gXY2WmBZEmXE
	 d0ltf5M3gAQYDtcd1Pstsa2JTlj6+Vl2z0vlPs9JGCmAMRmidqeMKNWj23rkJftFJF
	 J/RI8u7Y3LB6JZtRM5kwsn0jwHDOcW9Ut95hrrcc=
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
Subject: [PATCH v2 5/5] sched/eevdf: Update protection after restoring current
Date: Thu,  1 Oct 2026 14:40:16 +0100
Message-Id: <20261001134016.3881268-6-christian.loehle@arm.com>
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

A running task changed through the sched_change pattern is restored
with SNT_NORMAL. Only fresh picks set slice protection, so the restore
currently leaves vprot unchanged.

If sched_setattr() shortens the task slice, the old boundary can remain
live far beyond the new request. Lower the existing boundary when
restoring current. If protection remains live, rearm HRTICK because its
previous expiry may be later than the new boundary. The update can also
move vprot behind current's vruntime. In that case, request lazy-resched
when another fair entity is queued instead of letting hrtick_start_fair()
fall back to the later deadline.

Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/fair.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index bffc560bc7b8..59f9c08f968a 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15571,8 +15571,7 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, enum snt_e
 
 	if (on_rq) {
 		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
-		if (first)
-			set_protect_slice(cfs_rq, se, false);
+		set_protect_slice(cfs_rq, se, !first);
 	}
 
 	if (task_on_rq_queued(p)) {
@@ -15582,8 +15581,15 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, enum snt_e
 		 */
 		list_move(&se->group_node, &rq->cfs_tasks);
 	}
-	if (!first)
+	if (!first) {
+		if (!protect_slice(se)) {
+			if (rq->cfs.h_nr_queued > 1)
+				resched_curr_lazy(rq);
+		} else if (hrtick_enabled_fair(rq)) {
+			hrtick_start_fair(rq, p);
+		}
 		return;
+	}
 
 	WARN_ON_ONCE(se->sched_delayed);
 
-- 
2.34.1

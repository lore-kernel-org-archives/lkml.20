Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CAE4BCABD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862075; cv=none; b=aQzGjvbGJH7y3SYdaIKzq/2yDBITv2a/X2zJmIyfI79bQ17TyDxW6ElrBoyB8YPnR0w7E5D/gp/1it9pV1mZFrfIDWFHPzw0w5wktlBKR+hXLCBDgCC+mHSO0t5u/vzn9zgDveQepa8gWBSGe/2tFMbZ1u7iWifD4DD257KZxp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862075; c=relaxed/simple;
	bh=7biCfTRmCDTSGGGAJP54+HkO7khsZGZgLxcb7Blpsyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ctSlXUnq515niuYFMVjeXoQxCHgSYpxIO3eL2c5q2nUeu4cJy374eoL1B12DjcBq2CJBPi+/9MMH7Tam8+Sv+zfU8fIt09oGdpXbMsaF4oaUU7vPPJju+LpCbx0XkYgaTvsE0HVwYZ4sAK4C6rlzXKdgYUjHKybkulxJOpeQ4yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=m95OzNaG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m95OzNaG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45318169E;
	Thu,  1 Oct 2026 06:41:09 -0700 (PDT)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.0.130.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E5803F86F;
	Thu,  1 Oct 2026 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790862072; bh=7biCfTRmCDTSGGGAJP54+HkO7khsZGZgLxcb7Blpsyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m95OzNaGWodE6sYTZ8KXFpPkmPJtUvzELJPWDWBfKPSegszf+MADLoSAf2rddyJ9q
	 jaIJ6rtJFjLaAyYV9THxgvYNymoaTvKAzU3yHp3kg5gZ3VUL+Jz4cVhxE6/ePRdPu1
	 v/MFkjUsAodTxiCLixaTFb/pZAPf8rPwHNUWNBkA=
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
Subject: [PATCH v2 4/5] sched/eevdf: Keep expired protection expired across reweighting
Date: Thu,  1 Oct 2026 14:40:15 +0100
Message-Id: <20261001134016.3881268-5-christian.loehle@arm.com>
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

reweight_eevdf() rescales live slice protection, but leaves an expired
vprot unchanged when moving vruntime. A reweight can move vruntime behind
the old vprot. For example, reducing the weight of an entity with positive
lag can do so:

    before reweight:       vprot <= vruntime
    after reweight:        vruntime < vprot

protect_slice() consequently becomes true again, even though no fresh
protection was granted.

This can also happen in the HRTICK callback. entity_tick() can expire
protection and request a reschedule, after which task_tick_fair() calls
reweight_eevdf() before schedule() gets a chance to select another entity.
The reweight can move vruntime behind the stale vprot, making
protect_slice() true again before the pending selection. A four-task rt-app
workload with 100 us, 1 ms, 10 ms and 100 ms requests can then repick
current despite a runnable, eligible entity having an earlier deadline.
Cgroup weight changes also expose this with HRTICK disabled.

sched_change_begin() exposes another path by temporarily dequeuing current.
enqueue_task_fair() then reweights it with on_rq clear before
place_entity() moves vruntime. Remember whether protection was expired
before placement so the later SNT_NORMAL restore cannot revive it.

Separating vprot from vlag allowed the expired absolute boundary to
survive the lag update and rescaling. Previously, those writes to vlag
overwrote the shared storage. Commit ff38424030f9 ("sched/eevdf: Update
se->vprot in reweight_entity()") subsequently handled live protection,
but left the expired case unchanged.

Keep an expired current entity's protection at its new vruntime:

    after reweight:        vprot = vruntime

This keeps protect_slice() false. Retain the existing rescaling for
protection that was still live and leave non-current entities alone.

Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
Reported-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Link: https://lore.kernel.org/lkml/20260930133716.214471-1-kayracizmeci@gmail.com/
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/fair.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 15fa967273f6..bffc560bc7b8 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4941,6 +4941,9 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
 		se->deadline += avruntime;
 		se->rel_deadline = 0;
 		se->vruntime = avruntime - se->vlag;
+		/* Reweighting must not revive expired slice protection. */
+		if (curr && !rel_vprot)
+			se->vprot = se->vruntime;
 
 		if (!curr)
 			__enqueue_entity(cfs_rq, se);
@@ -8204,7 +8207,7 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	struct sched_entity *se = &p->se;
 	struct cfs_rq *cfs_rq = &rq->cfs;
 	unsigned long weight;
-	bool curr;
+	bool curr, expired = false;
 
 	if (task_is_throttled(p) && enqueue_throttled_task(p))
 		return;
@@ -8237,6 +8240,8 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	 * XXX comment on the curr thing
 	 */
 	curr = (cfs_rq->curr == se);
+	if (!curr && task_current_donor(rq, p))
+		expired = !protect_slice(se);
 	if (curr)
 		place_entity(cfs_rq, se, flags);
 
@@ -8248,6 +8253,8 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
 	if (!curr) {
 		reweight_eevdf(cfs_rq, se, weight, false);
 		place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
+		if (expired)
+			se->vprot = se->vruntime;
 		__enqueue_entity(cfs_rq, se);
 	}
 
-- 
2.34.1

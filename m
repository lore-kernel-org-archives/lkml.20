Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA37B3EB0E7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171151; cv=none; b=VrSliJOVFOqpQ8HdiPAE70EDlK0HjrqDxUrbSSHuZIIv0uBrV+S4eblC5eHwojm4iPa3147wG5rJ1pKNGs45siy9f/2oRyoQcW+9R5IwnQws0OVsTR5KhJiiCvGHHLmYKfb24AhzzOJM6p09Ova+N4zKiF4Z5lZzJSM1VMy42U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171151; c=relaxed/simple;
	bh=ISNh9C3Os9e5ai1dxkK2bgve6qDwdOM5O2dLma129KE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H5oWoGNMP4wdAsZdCN0X+nAxyPa050Bn/iF4LdUFVBFZO6EjyEM4X7DLRX3YDb/IPXLNoOeXKEKXda6vS7537FNQ0CAAGAWXJhw35cUAKTakBhFTKj4bCC30CdCLmAc4ztNmUEcmlTgn4cujgI0mqxrBjfdP50hH9wiGzcSx/kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 75328adea52411f19a56ed5b684f684d-20260831
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9d8aba1e-de01-4712-93ad-a71323c415ad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:4ba9283be8647d0b100fe1aadcde0a70,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 75328adea52411f19a56ed5b684f684d-20260831
X-User: liwanwu@kylinos.cn
Received: from kylinos.cn [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liwanwu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1032056607; Mon, 31 Aug 2026 18:12:22 +0800
From: Wanwu Li <liwanwu@kylinos.cn>
To: "Ingo Molnar" <mingo@redhat.com>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Juri Lelli" <juri.lelli@redhat.com>,
	"Vincent Guittot" <vincent.guittot@linaro.org>
Cc: "Dietmar Eggemann" <dietmar.eggemann@arm.com>,
	"Steven Rostedt" <rostedt@goodmis.org>,
	"Ben Segall" <bsegall@google.com>,
	"Mel Gorman" <mgorman@suse.de>,
	"Valentin Schneider" <vschneid@redhat.com>,
	"K Prateek Nayak" <kprateek.nayak@amd.com>,
	"Aaron Lu" <ziqianlu@bytedance.com>,
	"Wanwu Li" <liwanwu@kylinos.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] sched/fair: Use cfs_rq->h_curr in throttle_cfs_rq()
Date: Mon, 31 Aug 2026 18:11:40 +0800
Message-Id: <20260831101141.391382-2-liwanwu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831101141.391382-1-liwanwu@kylinos.cn>
References: <20260831101141.391382-1-liwanwu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 85570f10a4c6 ("sched/eevdf: Move to a single runqueue"),
cfs_rq->curr is only maintained on the root cfs_rq (set/cleared from
set_next_task_fair()/put_prev_task_fair()), while cfs_rq->h_curr is
the per-level current entity, set by set_next_entity() at every level
of the hierarchy. For an intermediate cfs_rq (a cgroup), cfs_rq->curr
is always NULL, but cfs_rq->h_curr is the group entity at that level.

throttle_cfs_rq() reads cfs_rq->curr to decide whether there is a
running entity at the throttled level, in which case it should request
a full sched_cfs_bandwidth_slice() of runtime and arm the deferred
throttle task_work via task_throttle_setup_work(). For intermediate
cfs_rqs the check is always false, so bandwidth-controlled cgroups
always get just 1ns of runtime and never arm the deferred throttle
work; the running task then escapes throttling until the next pick
arms the work instead, even though there is an on-rq entity at this
level.

Switch the read to cfs_rq->h_curr so intermediate bandwidth-controlled
cgroups behave consistently with the root cfs_rq, matching the
existing usage of cfs_rq->h_curr in update_curr() and
check_enqueue_throttle().

Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
Signed-off-by: Wanwu Li <liwanwu@kylinos.cn>
---
 kernel/sched/fair.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6d881e530f89..02b38d84fb2d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6978,14 +6978,14 @@ static int tg_throttle_down(struct task_group *tg, void *data)
 static bool throttle_cfs_rq(struct cfs_rq *cfs_rq)
 {
 	struct cfs_bandwidth *cfs_b = tg_cfs_bandwidth(cfs_rq->tg);
-	struct sched_entity *curr = cfs_rq->curr;
+	struct sched_entity *curr = cfs_rq->h_curr;
 	struct rq *rq = rq_of(cfs_rq);
 
 	scoped_guard(raw_spinlock, &cfs_b->lock) {
 		u64 target_runtime = 1;
 
 		/*
-		 * If cfs_rq->curr is still runnable, we are here from an
+		 * If cfs_rq->h_curr is still runnable, we are here from an
 		 * update_curr(). Request sysctl_sched_cfs_bandwidth_slice
 		 * worth of bandwidth to continue running.
 		 *
-- 
2.34.1

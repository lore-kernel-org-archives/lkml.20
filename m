Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2583EB0E5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171151; cv=none; b=H08m3mTk/f31zGB9uxdNM59IpH/ugk97XtkE9HCs+zUeD31YEqoeWsxfuJrq3xQXhr02u19b2ipJSFsbJrwdC6FB7+e9xPPFIwjMpR4s3S0/lG77BcB2aVshE/QY5376FEiXHO+XgrSpwdSx6cg9DZpZ/VsmQ8yYOC+TmO44sXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171151; c=relaxed/simple;
	bh=F3lZ8hncu38WIMpzjXijasHn44ca8UUYBbCLTFUInUs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SQEeVdtom5InlKYxAQ20h27z3UVRiNxAx+wfsnYre7h1noTIVX06v6nROZXP+1VI3y124TelaebxVkxgwafKjgCZqnCezZlXBniBytIHjBKmU/QMXrbRKRGkk1XVyU7Yjvc2Vv7GNaoB6UKeK49YNoYSaOlJ+1H6QujUwNmVIWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 75aaab54a52411f19a56ed5b684f684d-20260831
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d2d50851-98c1-4c39-b1fa-fa06325de161,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:9b564fedbbf2761cc8e511e88fcc4704,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 75aaab54a52411f19a56ed5b684f684d-20260831
X-User: liwanwu@kylinos.cn
Received: from kylinos.cn [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liwanwu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 414080977; Mon, 31 Aug 2026 18:12:23 +0800
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
Subject: [PATCH 2/2] sched/fair: Use cfs_rq->h_curr in distribute_cfs_runtime()
Date: Mon, 31 Aug 2026 18:11:41 +0800
Message-Id: <20260831101141.391382-3-liwanwu@kylinos.cn>
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

distribute_cfs_runtime() refreshes the rq clock and accounts elapsed
runtime with update_curr() before redistributing bandwidth, but gates
this on cfs_rq->curr. Since commit 85570f10a4c6 ("sched/eevdf: Move to
a single runqueue") cfs_rq->curr is only maintained on the root
cfs_rq, so for the cgroup cfs_rqs it walks, the check never fires and
the refresh is dead code.

Use cfs_rq->h_curr, the per-level current entity, restoring the
intended behaviour: only refresh when something is actually running at
the throttled level, i.e. within the deferred throttle window.
Without this, runtime consumed by a still-running task of the
throttled hierarchy is not docked before redistribution;
unthrottle_cfs_rq() catches up unconditionally since
commit 28ad5427682b ("sched/fair: Call update_curr() before
unthrottling the hierarchy"), so this is not a correctness hole today,
but the refresh the check was written for is gone.

Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
Signed-off-by: Wanwu Li <liwanwu@kylinos.cn>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6d881e530f89..0c69d1c0ebf0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7192,7 +7192,7 @@ static bool distribute_cfs_runtime(struct cfs_bandwidth *cfs_b)
 		if (!list_empty(&cfs_rq->throttled_csd_list))
 			continue;
 
-		if (cfs_rq->curr) {
+		if (cfs_rq->h_curr) {
 			update_rq_clock(rq);
 			update_curr(cfs_rq);
 		}
-- 
2.34.1

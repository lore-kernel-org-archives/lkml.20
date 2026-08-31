Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DEC3E0241
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171149; cv=none; b=bRi3I7JINCBoXhM8UgsRLNjQLe/hK5R0Z/E6dhpOK5HMib2UnhBdFOvwrSnr0qY53q7Cl6vxst62N/op2fs4FKCewe94lek1ftM5W1eKaqu5qgI/RkjhdtaaDIwZ4a34oH60iRFvfhclIoo8rjjCMdYugTutqu+qEx4L8ZiJotU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171149; c=relaxed/simple;
	bh=RcOP1NDQQPqZkGJ91JufvzO8ys9JVue1CXqog2TH0Z8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qcrQiijcklgoHWrIvc3eP8v1Fpyk47jmG58FhpSnxeu0hBoWXCVT41fSTc6VbFwAGrKeuK1qRZdLFB7khW3vB5hs9Bscpmpr4qacH0rdffi11jSOcx4RMUwqY7kejQMHS8T6HmhH4Yf0N561BNux/vJZDjOCcfrkdWVy1+NBbAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 74c020d4a52411f19a56ed5b684f684d-20260831
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:4b641a69-50e4-4722-9b20-b7fc85e98cdf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:d3d548fb41c10750fb6da136da82571d,BulkI
	D:nil,BulkQuantity:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 74c020d4a52411f19a56ed5b684f684d-20260831
X-User: liwanwu@kylinos.cn
Received: from kylinos.cn [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liwanwu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1521691000; Mon, 31 Aug 2026 18:12:22 +0800
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
Subject: [PATCH 0/2] sched/fair: Use cfs_rq->h_curr in the bandwidth paths
Date: Mon, 31 Aug 2026 18:11:39 +0800
Message-Id: <20260831101141.391382-1-liwanwu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter, Ingo,

Since commit 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
the per-level "is something running at this level" information moved
from cfs_rq->curr to cfs_rq->h_curr; cfs_rq->curr is now only
maintained on the root cfs_rq. The cgroup hierarchy is kept for load
tracking and bandwidth accounting, which makes the bandwidth paths the
only code that still runs per-level and consults a per-level current.
Two locations were not updated in this conversion:

  1/2: throttle_cfs_rq() reads cfs_rq->curr to decide whether the
       throttled level has a running entity. For intermediate cfs_rqs
       the check is always false, so quota exhaustion never requests a
       full sched_cfs_bandwidth_slice() and never arms the deferred
       throttle task_work via task_throttle_setup_work(); a running
       task can out-run its group's quota until the next pick armed
       the work instead.

  2/2: distribute_cfs_runtime() gates its clock refresh and runtime
       accounting on cfs_rq->curr, which never fires for cgroup
       cfs_rqs. Since commit 28ad5427682b ("sched/fair: Call
       update_curr() before unthrottling the hierarchy")
       unthrottle_cfs_rq() catches up unconditionally, so this is not
       a correctness hole today, but the refresh the check was written
       for is gone.

I audited all cfs_rq->curr references in kernel/sched/fair.c:

  - Only two sites still run at every level of the hierarchy:
    throttle_cfs_rq() (patch 1/2) and distribute_cfs_runtime()
    (patch 2/2). Both reads are fixed here.

  - Every other reader is confined to the root cfs_rq, where curr is
    correctly maintained (avg_vruntime, place_entity, pick_eevdf,
    enqueue/dequeue paths, update_curr_eevdf, put/set_next_task_fair
    and the two assignment sites), or already reads the per-level
    current via cfs_rq->h_curr (update_curr, check_enqueue_throttle,
    set_next_entity, put_prev_entity).

I noticed that 85570f10a4c6 carries a TODO to eventually get rid of
cfs_rq->h_curr. Until that rework lands, the throttle paths should
observe the per-level current as they did before the conversion; if
you prefer, these fixes can be folded into the planned rework.

Wanwu Li (2):
  sched/fair: Use cfs_rq->h_curr in throttle_cfs_rq()
  sched/fair: Use cfs_rq->h_curr in distribute_cfs_runtime()

 kernel/sched/fair.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.34.1

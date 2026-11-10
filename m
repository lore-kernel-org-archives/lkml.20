Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=3.64.226.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352913;
	b=KZddWd7opTS8uZv4dw+UZd1mMhmsi9Tg/OpFwWK0xA9SG3LaI/W40OyNPfJwoqujMYaR
	 Q6gCs2KX6Q6djdwUlhiTu6xKsqO6CvWDeDDvmsu/jauKZNlxfDo778B0QcTxjJrwvpI1n
	 f3UEdnHT9Brq35yq3vxJDs/37ApfTitAo8TXWAPMBur0WogdfbmpWRYNpBtLgnpDfl7Lp
	 TwixwIctIZxR80rSKisVxE48SF45B9v6vBzopZ7osD5ByAcAUFW6XRU+sYTzuEEAPM9bd
	 xFNr1gD8eH2TbsvQw7JLQpqLDCJRqfXR3sIBdCMm/HGh3QZ/epOY9rdrzX3N+IpAvXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352913;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Feedback-ID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-F-Verdict:X-Titan-Src-Out:X-CMAE-Score:X-CMAE-Analysis;
	bh=e8xhpPi+d1QBxuJvVOKjfIrHJ0T8FywntD6SbLtumIE=;
	b=QwEp/Xb+R3VHgAwr0zMZx+NwRsW5UUZCFSJTHNjq3OQoXD3Z6flI/8xoNuv3gC+IVcIv
	 n7u1BqqvOeM83RvYeQqv+jY9KoY17/2uYIrLeHIAAF50MGNcs0COrqO9drqVSH3Wow8WT
	 KwtWOssefadp8bsHcpeIE+juFHBoFliklpECul0Y06T0DY8VjWm7Axh3GTz1bK88OFqqd
	 dLceuYq1ZrMCpI7mBT5lf0F+Lw9v1qZ+ETnbzzOfAPq8rrUzFDpGfHrN/+IVEtug5q8Vk
	 s4/a4CCoCu1y+J76WPs8xvb1q/N50007388pUhOyOYjIANyOC/2IevCBXzyps3wo5uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=cnm55nK1;
	arc=none smtp.remote-ip=3.64.226.210
Received: from mail16.out.titan.email (mail16.out.titan.email [3.64.226.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB8A606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB8A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=cnm55nK1
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jPN2f2PdJzBrJg;
	Tue, 10 Nov 2026 23:21:46 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..RAXsoAOM0E4RGmxW.AtHplOF1VLaqHb-xaNUmSEcqQ3SAAN95meqlZvXos2-hwcgyz2jGKUsC6-YswUiX9_84KJvfUosR0veyA-6SV__jBh1FpCk_I_NKB41yC_NPzOWtIdjh1XQvKw.VFOPr7XIJ6xrYPEa9XDAhA
DKIM-Signature: a=rsa-sha256; bh=e8xhpPi+d1QBxuJvVOKjfIrHJ0T8FywntD6SbLtumIE=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=from:to:date:message-id:subject:cc:in-reply-to:references:mime-version:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1794352906; v=1;
	b=cnm55nK1rfQoih8tK938qIfyqD6v2Qi2EGngf6bu0uKEMfyVQl/VKeuMXbuKWqwigYY8FK4i
	TqNHgoPN62wqPcic3dvlgAotMXugKzA/ng1qvQdoAJImyIqN9m6EccONdnJIqCVdMgd/B+bD/r+
	2Og5NG/0y9a5WWk533xFYF+g=
X-AuthUser: mgorman@techsingularity.net
Received: from morpheus.112glenside.lan (unknown [84.203.172.48])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jPN2d4NJdzBrJT;
	Tue, 10 Nov 2026 23:21:45 +0000 (UTC)
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Seiji Nishikawa <snishika@redhat.com>,
	Mian Yousaf Kaukab <ykaukab@suse.de>,
	LKML <linux-kernel@vger.kernel.org>,
	Mel Gorman <mgorman@techsingularity.net>
Subject: [PATCH 3/3] sched/rt: Treat migrate-disabled tasks as pushable if RT_PUSH_IPI is disabled
Date: Tue, 10 Nov 2026 23:20:57 +0000
Message-ID: <20261110232057.4144723-4-mgorman@techsingularity.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110232057.4144723-1-mgorman@techsingularity.net>
References: <20261110232057.4144723-1-mgorman@techsingularity.net>
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
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1794352906103526424.1930444.850361007055682158@prod-euc1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KNjj5FFo c=1 sm=1 tr=0 ts=6af3a70a
 a=yHdhZq8wnfzzRmla7jO6EQ==:117 a=yHdhZq8wnfzzRmla7jO6EQ==:17
 a=CEWIc4RMnpUA:10 a=R_Myd5XaAAAA:8 a=19DPlBb7v9612iHLt3sA:9
 a=L2g4Dz8VuBQ37YGmWQah:22

Migrate-disabled tasks are not accounted as pushable to avoid spurious
IPIs. When RT_PUSH_IPI is unavailable or disabled then there are no IPIs so
pull_rt_task() must find rqs with off-cpu migrate-disabled tasks. It then
can push the running task away allowing the migrate-disabled task to run.

Restore the original accounting of migrate-disabled tasks as pushable if
RT_PUSH_IPI is disabled.

Signed-off-by: Mel Gorman <mgorman@techsingularity.net>
---
 kernel/sched/rt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index cc77683f4897..bb640278d30e 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -396,8 +396,12 @@ static inline void rt_queue_pull_task(struct rq *rq)
 
 static void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
 {
-	if (p->nr_cpus_allowed <= 1 || is_migration_disabled(p))
+	if (p->nr_cpus_allowed <= 1)
 		return;
+#ifdef HAVE_RT_PUSH_IPI
+	if (sched_feat(RT_PUSH_IPI) && is_migration_disabled(p))
+		return;
+#endif
 
 	plist_del(&p->pushable_tasks, &rq->rt.pushable_tasks);
 	plist_node_init(&p->pushable_tasks, p->prio);
-- 
2.55.0


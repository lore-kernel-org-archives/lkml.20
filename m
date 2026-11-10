Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=3.65.7.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352897;
	b=GqnS0PIsKSSxZ/1S9HGvwhOqAd5cCpdsoWtGfMxrIPfkjFfFfZf13yjG6hxVo3rheqzL
	 2rzrTV18wmOoURXIxxsRbWnAqU1t1EdbSIN1W7q885VHTveoy1Jq+9nSUqBCPniFvg3rr
	 SWgXxnA8SYJk1yIoKEXuqFDcjM0Nv63BR724YolEa8RORO5614ZjXLTGOq4XO57vgmF2K
	 zTbtCcaXONU8tUg6vTLTr8HE7diDF/xnRFZOvBWnaSprnY/eu+VJgfIbtCUkV7bFdGwqW
	 tym7WkhgDf8vFpMOYAIpqY2F5iYUrdiWN7oqrMaqj6AV7qiDU5BmtUHvWpgM1EPSTvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352897;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Feedback-ID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-F-Verdict:X-Titan-Src-Out:X-CMAE-Score:X-CMAE-Analysis;
	bh=oSZ84sjUDe3E0+Th4IwpJV8npnomE8Ts1fGwjYwviX4=;
	b=mQ+6+jdk6MhGbgCgaa373WJ6797fewdmcTrSSIzKDHvVFZz66wvxSNnpzHBideIkL0R5
	 ocvHA9KkZrc65f4SP8W8xi+sCGUwnip/ctszpSmkAL6wWgAH+lFehPWb/ceXKka+gDkoF
	 NNo0fZO9XlaVNwfZna/gyKLPZXx6Ij8eoq6ZBdms/Gp+KKN27Z/IcQu1l4hSK8ZdvKaED
	 4qasRbJIW2x6ame8Tww+ppWO6pEUj9yJKry1vYYXSkBeamBk7X/769ND1OqXD6UAt1GyD
	 ZyVsLmn8gpR7YnF8FowQ25VVgF50GRmBAVgS9uh2QrnBnkzcAAecKuTt2rWTST8SEfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=LFxk7AQM;
	arc=none smtp.remote-ip=3.65.7.70
Received: from mail30.out.titan.email (mail30.out.titan.email [3.65.7.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1275606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1275606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=LFxk7AQM
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jPN2R4TkBzBrJd;
	Tue, 10 Nov 2026 23:21:35 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..Jrlut8beAaNKzROG.FEB5DM3V4IJ9g_rqtSq2p1zU7qKuUBwTF_xlqatBKJRK4FA7gLKMD83KK9nFq2iAswx_kR3L-Pnd2jsjNIKSJYwPCXhj6ChueKHe7clHNyriUwiNe6EEp40mlg.5mZIDuBplB8qY8-Dd6iNzg
DKIM-Signature: a=rsa-sha256; bh=oSZ84sjUDe3E0+Th4IwpJV8npnomE8Ts1fGwjYwviX4=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=from:to:subject:message-id:cc:mime-version:date:in-reply-to:references:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1794352895; v=1;
	b=LFxk7AQM14j13FkQLnarmsV1BJz2bAMkidywfj3yWE1kIAoAmH2c7EdGsEPtAFfjaNM+dZ9W
	Ku7yjWxDS5l6k/5KXuZkzymMaeBdCQof8mZ6V8FyRKP13NUC8qb3Hfxa1SsQhFhvxuMnaCKq3Rn
	plL6akFllhvQ+4PkuImMXpAo=
X-AuthUser: mgorman@techsingularity.net
Received: from morpheus.112glenside.lan (unknown [84.203.172.48])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jPN2Q6hRjzBrJT;
	Tue, 10 Nov 2026 23:21:34 +0000 (UTC)
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
Subject: [PATCH 2/3] sched/rt: Check eligibility of pushable task in one place
Date: Tue, 10 Nov 2026 23:20:56 +0000
Message-ID: <20261110232057.4144723-3-mgorman@techsingularity.net>
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
X-Titan-Src-Out: 1794352895389597792.1930444.7896420370219259427@prod-euc1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KNjj5FFo c=1 sm=1 tr=0 ts=6af3a6ff
 a=yHdhZq8wnfzzRmla7jO6EQ==:117 a=yHdhZq8wnfzzRmla7jO6EQ==:17
 a=CEWIc4RMnpUA:10 a=R_Myd5XaAAAA:8 a=P9KaP7WhLAoyDb-noI4A:9
 a=L2g4Dz8VuBQ37YGmWQah:22

Two callers of enqueue_pushable_task() perform the same checks, move them
to one place to mitigate the risk of the checks made out of sync and in
preparation for the next patch.

No functional change intended.

Signed-off-by: Mel Gorman <mgorman@techsingularity.net>
---
 kernel/sched/rt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 2587ef92efc3..cc77683f4897 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -396,6 +396,9 @@ static inline void rt_queue_pull_task(struct rq *rq)
 
 static void enqueue_pushable_task(struct rq *rq, struct task_struct *p)
 {
+	if (p->nr_cpus_allowed <= 1 || is_migration_disabled(p))
+		return;
+
 	plist_del(&p->pushable_tasks, &rq->rt.pushable_tasks);
 	plist_node_init(&p->pushable_tasks, p->prio);
 	plist_add(&p->pushable_tasks, &rq->rt.pushable_tasks);
@@ -1448,7 +1451,7 @@ enqueue_task_rt(struct rq *rq, struct task_struct *p, int flags)
 	if (task_is_blocked(p))
 		return;
 
-	if (!task_current(rq, p) && p->nr_cpus_allowed > 1 && !is_migration_disabled(p))
+	if (!task_current(rq, p))
 		enqueue_pushable_task(rq, p);
 }
 
@@ -1746,7 +1749,7 @@ static void put_prev_task_rt(struct rq *rq, struct task_struct *p, struct task_s
 	 * The previous task needs to be made eligible for pushing
 	 * if it is still active
 	 */
-	if (on_rt_rq(&p->rt) && p->nr_cpus_allowed > 1 && !is_migration_disabled(p))
+	if (on_rt_rq(&p->rt))
 		enqueue_pushable_task(rq, p);
 }
 
-- 
2.55.0


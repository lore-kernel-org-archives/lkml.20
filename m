Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052975;
	b=gBw0/4UeClckQrlVXT4P2bfj8IdeHlQ4GCo+lvARlV/fP6mhQuWK1S7SD1J9jWs5W/u2
	 UkCzp0PN9Xyx4u0CDZLo6HDik62o9WJed9gUMPnG2fcoBcXktFMCD+rahv2/6V9VfEqMH
	 0y98nskGggdG8mc7Ge6b8F8+y8mg/DlwkJHQJs+7tWWKTARDx2vbcVbaj3ltlvISZgogl
	 eU9lFiJdhyMz0jOUoIU9NFEuhsjjZG+61669fQiNcz60hEG7nkejJwC0FxnTKb73hVCLC
	 3lMyst82lkgqJENX6RcPOXmY5Du8Z4VBbWiak9pJreVh4FzfETu2afeC2KSS67VpDAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052975;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=18Gqpg6a8mYPKsqaIFV8FR07ll7ZqbzcL3bZ/3yheIA=;
	b=UamU5Y9RGIuSO6MkNKMKvzwcxiM8wvzcFimJPrbeUmaoGbbqtwXIHDgEqROYfOXWuIid
	 MgL8qDO3547HluKJagwBZyjPebCQERqstVr28SbPwTHEIAJroH3gjNLwzBnDcnZ2dQKuL
	 U5hTgoL9QW/f6dHI/Q3Yz18cxXPRsmGTFNWQ3qjQmt+GByVuvUbwkfSLI8wzJNdzw7R68
	 g2bTjxk20yfvoDka6RShlH7IuPU3UQp4TNe8SJLye6HULtXEP6uqznrAqPSFsMPuPvwZL
	 FptOk7bie7xozoUIzE/tDZWRNYMhk/Eg6Py0IVOGqy/wWM8G66yn2tOx0nZp78VjxPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=N8sIin2H;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD76606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD76606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=N8sIin2H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=18Gqpg6a8mYPKsqaIFV8FR07ll7ZqbzcL3bZ/3yheIA=; b=N8sIin2HnadvnEhQV5RQ+2V+QW
	7yNHR9ndk/FjvhT7tRElCriR8i77ue6Pmce6HUvQaKksOakkdT/kEJk6cnXr+Bx2g5/Ru2ydLeMHo
	jHeFW9mZ0KgSLZ41NaCE/hitL6QB8eFJMql/EyHr/K7yBvDYSZ6VccekGvZaC03jq6io/m7OL7xmA
	jmMQZyfsx7Wl2CfGFwTSswMee+eRe4vJqk05yuVdt/x2xgfEz1jHexJbXDJM50WFkpnCdhzAif2tw
	cId3jidg4PtRZlRpqF7sPt1yfTQOn4mDm3KYWNIsWTnNC0Y4og3nUHBNLMzvLJTsESKpEFHGHJYRb
	MVIhtztw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf8A-000000008y2-1ZK4;
	Sat, 07 Nov 2026 12:02:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 2D7AA302FFB; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120207.538879470@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org
Cc: peterz@infradead.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 vschneid@redhat.com,
 kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org,
 tj@kernel.org,
 ziqianlu@bytedance.com
Subject: [PATCH v2 07/12] sched/core: Simplify/fix time updates
References: <20261107115913.261163891@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Use __update_rq_clock() and the new update semantics instead of using
convoluted logic to try and divinate if a clock needs updating.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c |   25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6302,7 +6302,6 @@ static struct task_struct *
 pick_next_task(struct rq *rq, struct rq_flags *rf)
 	__must_hold(__rq_lockp(rq))
 {
-	bool core_clock_updated = (rq == rq->core);
 	struct task_struct *next, *p, *max;
 	const struct cpumask *smt_mask;
 	int i, cpu, seq, occ = 0;
@@ -6358,10 +6357,7 @@ pick_next_task(struct rq *rq, struct rq_
 	/* reset state */
 	rq->core->core_cookie = 0UL;
 	if (rq->core->core_forceidle_count) {
-		if (!core_clock_updated) {
-			update_rq_clock(rq->core);
-			core_clock_updated = true;
-		}
+		__update_rq_clock(rq->core);
 		sched_core_account_forceidle(rq);
 		/* reset after accounting force idle */
 		rq->core->core_forceidle_start = 0;
@@ -6390,14 +6386,11 @@ pick_next_task(struct rq *rq, struct rq_
 	 * and there are no cookied tasks running on siblings.
 	 */
 	if (!need_sync) {
+		__update_rq_clock(rq);
+
 		next = pick_task(rq, rf);
-		if (unlikely(next == RETRY_TASK)) {
-			/* rq lock may have been dropped, clocks invalidated */
-			core_clock_updated = false;
-			if (!(rq->clock_update_flags & RQCF_UPDATED))
-				update_rq_clock(rq);
+		if (unlikely(next == RETRY_TASK))
 			goto restart;
-		}
 
 		if (!next->core_cookie) {
 			/*
@@ -6436,18 +6429,12 @@ pick_next_task(struct rq *rq, struct rq_
 		 * pick_next_task(). If the current cpu is not the core,
 		 * the core may also have been updated above.
 		 */
-		if (i != cpu && (rq_i != rq->core || !core_clock_updated))
-			update_rq_clock(rq_i);
+		__update_rq_clock(rq_i);
 
 		p = pick_task(rq_i, rf);
 		if (unlikely(seq != rq->core->core_task_seq ||
-			     WARN_ON_ONCE(p == RETRY_TASK))) {
-			/* rq lock may have been dropped, clocks invalidated */
-			core_clock_updated = false;
-			if (!(rq->clock_update_flags & RQCF_UPDATED))
-				update_rq_clock(rq);
+			     WARN_ON_ONCE(p == RETRY_TASK)))
 			goto restart;
-		}
 
 		rq_i->core_pick = p;
 		rq_i->core_dl_server = rq_i->dl_server;



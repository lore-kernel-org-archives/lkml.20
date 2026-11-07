Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052975;
	b=Zjw30RpcxkfTK2HZMjHL1OosT8+5xO4DH9okvtp8D0Pl3StBjfQeKU+d+TvtGbgeWpZj
	 7nVJhCbWr9Z4e8n2Giy0Qcgb7iHlu5b5pjwKrx5/MZVQGNedbFYjCD6roLgY6zP40LHMD
	 DlKBzfatdGLMtl2nUVVDz7eRKcgAHCBemQdCcKjmL/OZsyLxLBx1PitaLFSoBuh0egoXD
	 ucvXN9zXsxSEnBOtRs5Q/RC9Buo2RWVhCIcJihgAGsirKcykzyOdeQo71x8/ncl9OEJJx
	 MdMmLB5fQrkP/3rLLv+EonYo6Ltvt5nToC702vIi/rvh8Cm0RFvIhkoPikOMMOCU28w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052975;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=QgElrRtXKoOV0Fy/9U5JxVD2RvOCNcWNrT/eS9dLBhw=;
	b=5f3WH41h6dJw48whp1e5TCaS87/EkX79gBPDGBXYzoNx4UyKt6MTEe/mb/U6z7ctMaoT
	 VlPbesv0Mq7UbDbFY/mt2Dut/eXetRz3Yxi9Y9L8m0zShoKNE7C4MPgkYcFKfrs8/1p0t
	 sZNcWd3AjLsPxC/ymY1iz+06jiY+XeuMkkmZ1uGwvldjI6jVO5vWQyWL93MdUxbJAJddF
	 qf2pXTYcGc35V0JtNwQ6HMhfOBrdPqA5BbxzIZMhJIA48mw4DuHHSz2q3cU0b0XeCBGkG
	 /9WvSD0bYyys65ULsqyc2wFSfBz+IsrFRvv8iML4cND8u6ieQqorH1ZiHDEgLhZTGsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KLqMpNfg;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA55606A333
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA55606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KLqMpNfg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=QgElrRtXKoOV0Fy/9U5JxVD2RvOCNcWNrT/eS9dLBhw=; b=KLqMpNfgkXshcPkxs/amUwpnlC
	bdV6cs1yYZ0w+3oFsgusSK8la0ys8nUPL+oxzvITBqi0eauWgTHbM/pQ8ywFErUc4zUUyx1Dvp37d
	PmUX4TpNIOgb5aW0ivssS9V/DSFdyDQNIgTsmFh864dRv+NYSAhm5LpnawBzqcRfJuYG/gmLq441c
	8CiVFGb3HAmDP94FWa5mEMboDVwYZvVTqPEeYxH7mO6kIziwl6tiuu4zFSwfnAMyxXT8ODiBsLP3h
	w2y6SRNTlN11/H5Cir5iDHY76/awfJE5Q0bFUAI1Hg2lA6tQbbMEQPoC3WxDi6CVncww6+hqDVCgF
	c41aoPyw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf89-000000008xH-2Hp6;
	Sat, 07 Nov 2026 12:02:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 1862F300882; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120206.858693648@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:15 +0100
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
Subject: [PATCH v2 02/12] sched/core: Introduce rq_drop_lock()
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

Currently rq_unpin_lock() serves a dual purpose, it pairs with both
rq_pin_lock() and rq_repin_lock(). That is:

	rq_pin_lock()
	  rq_unpin_lock()
          rq_repin_lock()
	rq_unpin_lock()

In prepration of making the temporary drop and the final drop
distinct, this needs another function. Introduce and use
rq_drop_lock() for the temporary drop, like:

	rq_pin_lock()
	  rq_drop_lock()
          rq_repin_lock()
	rq_unpin_lock()

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/core.c     |    8 ++++----
 kernel/sched/deadline.c |    4 ++--
 kernel/sched/ext/ext.c  |    4 ++--
 kernel/sched/fair.c     |    2 +-
 kernel/sched/rt.c       |    2 +-
 kernel/sched/sched.h    |    5 +++++
 6 files changed, 15 insertions(+), 10 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3910,7 +3910,7 @@ ttwu_do_activate(struct rq *rq, struct t
 		 * Our task @p is fully woken up and running; so it's safe to
 		 * drop the rq->lock, hereafter rq is only used for statistics.
 		 */
-		rq_unpin_lock(rq, rf);
+		rq_drop_lock(rq, rf);
 		p->sched_class->task_woken(rq, p);
 		rq_repin_lock(rq, rf);
 	}
@@ -5042,7 +5042,7 @@ void wake_up_new_task(struct task_struct
 		 * Nothing relies on rq->lock after this, so it's fine to
 		 * drop it.
 		 */
-		rq_unpin_lock(rq, &rf);
+		rq_drop_lock(rq, &rf);
 		p->sched_class->task_woken(rq, p);
 		rq_repin_lock(rq, &rf);
 	}
@@ -5260,7 +5260,7 @@ struct balance_callback *splice_balance_
 void __balance_callbacks(struct rq *rq, struct rq_flags *rf)
 {
 	if (rf)
-		rq_unpin_lock(rq, rf);
+		rq_drop_lock(rq, rf);
 	do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
 	if (rf)
 		rq_repin_lock(rq, rf);
@@ -6929,7 +6929,7 @@ static inline void proxy_release_rq_lock
 	 * to pick_again, so the callbacks will get re-established.
 	 */
 	zap_balance_callbacks(rq);
-	rq_unpin_lock(rq, rf);
+	rq_drop_lock(rq, rf);
 	raw_spin_rq_unlock(rq);
 }
 
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1129,7 +1129,7 @@ static void __push_dl_task(struct rq *rq
 		 * Nothing relies on rq->lock after this, so its safe to drop
 		 * rq->lock.
 		 */
-		rq_unpin_lock(rq, rf);
+		rq_drop_lock(rq, rf);
 		push_dl_task(rq);
 		rq_repin_lock(rq, rf);
 	}
@@ -2720,7 +2720,7 @@ static int balance_dl(struct rq *rq, str
 		 * disabled avoiding further scheduler activity on it and we've
 		 * not yet started the picking loop.
 		 */
-		rq_unpin_lock(rq, rf);
+		rq_drop_lock(rq, rf);
 		pull_dl_task(rq);
 		rq_repin_lock(rq, rf);
 	}
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -3924,7 +3924,7 @@ static enum scx_dsp_verdict dispatch_pic
 {
 	enum scx_dsp_verdict verdict;
 
-	rq_unpin_lock(rq, rf);
+	rq_drop_lock(rq, rf);
 	verdict = dispatch_one(rq, prev);
 	rq_repin_lock(rq, rf);
 
@@ -3949,7 +3949,7 @@ static enum scx_dsp_verdict dispatch_cor
 	if (rq->scx.flags & SCX_RQ_IN_DISPATCH)
 		return SCX_DSP_NONE;
 
-	rq_unpin_lock(rq, rf);
+	rq_drop_lock(rq, rf);
 
 	verdict = dispatch_one(rq, prev);
 
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -14907,7 +14907,7 @@ static int sched_balance_newidle(struct
 	 * further scheduler activity on it and we're being very careful to
 	 * re-start the picking loop.
 	 */
-	rq_unpin_lock(this_rq, rf);
+	rq_drop_lock(this_rq, rf);
 
 	sd = rcu_dereference_sched_domain(this_rq->sd);
 	if (!sd)
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -1611,7 +1611,7 @@ static int balance_rt(struct rq *rq, str
 		 * disabled avoiding further scheduler activity on it and we've
 		 * not yet started the picking loop.
 		 */
-		rq_unpin_lock(rq, rf);
+		rq_drop_lock(rq, rf);
 		pull_rt_task(rq);
 		rq_repin_lock(rq, rf);
 	}
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1991,6 +1991,11 @@ static inline void rq_unpin_lock(struct
 	lockdep_unpin_lock(__rq_lockp(rq), rf->cookie);
 }
 
+static inline void rq_drop_lock(struct rq *rq, struct rq_flags *rf)
+{
+	rq_unpin_lock(rq, rf);
+}
+
 static inline void rq_repin_lock(struct rq *rq, struct rq_flags *rf)
 {
 	lockdep_repin_lock(__rq_lockp(rq), rf->cookie);



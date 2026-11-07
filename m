Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052980;
	b=woVHnmnwrKjsNt48pDVFOQGeGgANr8dBtfvUqIza5DsYuoUoJqX0LSl2G8DVs+/w2wAd
	 HEmOvPQqSiUw1PDQje58yCd3PSfNbE5Cu7z8d/rdwn84+HZAgd18roHTSnvMKx9GP76FB
	 kUPxskLmyaRPuYqOdfua7ImZ7JrdYRjF6TrX/OpJO4DGLq0HofnS5h9ip6xsePOdTCFZT
	 drzMzWtRgs56tZzH+PXmXrcFCbm6Lkr/2OiEz3cpdRbmxgTqGZR1L+3yd9sizOWVcRR97
	 bylGntwsDRvZBcW3dDCP/jaP/8uTUKN8mOOAG1l+1zbp/AJbS2BPbG2m1ipG55X04Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052980;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=J2BDJ/52TL1KSLFD0+jGK076gvNMWOuIwR0EWAvl6a8=;
	b=qudnMmtHYSqS+PZyUeZYguk8ttBRZESQ/OtAamFjO45ZTl3uxVKGeyqwJu/NKlT2xMoO
	 zb+wgLdPzmRbX3awHILKkf9jm0i9pbe+zBUk2c0fsESMSundqmz7QfQxh2LHtRwfc4vUY
	 VDsMQl0YVmGLSxYab+bErrtU6ZKEkeZbjUVLAf3/GjmQDhPTHQvkOaz98BbD5GzQWgPt3
	 XYY04I2XiltwHgK2JsHprnV4jjqoZyXjXYwEpNry1wewJ9ySOGyDaX6FVgUYgn+ycKG3B
	 Q5vkhtHVHiodaS0lOAl0vJabI/I1jU0v0WzJevsYc/bhDNyZAFCofDBMTtjiC5v0Lzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oBixrCPI;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEC1606A33B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEC1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oBixrCPI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=J2BDJ/52TL1KSLFD0+jGK076gvNMWOuIwR0EWAvl6a8=; b=oBixrCPIWMyQum3b7pZKuASHbp
	2CDpPGQ2q/NRE6/8fVf3svviqgXC1BrWtokcg5kRAOPWARd3kQuZiqj6wE8PEbOcn79xkOvyteC5H
	zPrNjDMnx48Wgg1IblShBvgKpDH3vEJV40icARJXPeeaBTkqz/+e0finySQ0N8fd+j4nCqINbvG94
	l5IL+E78KS4/BIgHx8VNx2oHD+cV83EEvSMEomYnBmyeX23gW/QfUjlBtSSeh7NeQHTJgdwDFPQWk
	CkgU1AMfFHrK392JKVkPgjIjfd4pnP/CPBUwS0TLkPxFM1DTtCxiju3PqNGWAboLNdRguyEhnSCBv
	/9B8yS7g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPf8B-00000005BYg-1pfc;
	Sat, 07 Nov 2026 12:02:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 2979F302FBB; Sat, 07 Nov 2026 13:02:45 +0100 (CET)
Message-ID: <20261107120207.361504499@infradead.org>
User-Agent: quilt/0.68
Date: Sat, 07 Nov 2026 12:59:19 +0100
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
Subject: [PATCH v2 06/12] sched/core: New rq_{pin,drop,repin,unpin}_lock() semantics
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

The current semantics are such that UPDATED is cleared on rq_pin_lock() but
remains set on rq_unpin_lock(). This works because rq_clock() itself asserts
rq->lock is held.

However, there are two problems with this, both related to the newidle/balance
lock drop.

The code as-is, tries to preserve UPDATED over drop()/repin(), but during the
drop an interleaving lock()+update_rq_clock() will still move the clock --
since it will clear UPDATED on lock(). Make this stronger using the freshly
minted freeze and thaw. This way the clock remains where it was, restoring the
'atomicity' of schedule().

Additionally, there is a variant with core-scheduling. In that case rq->lock is
shared among the sibling threads, but rq->clock and rq->clock_update_flags are
very much per thread. This disparity can cause another form of the above
problem, where one sibling is trying to forward the clock of the other sibling.

Sort this by making lock() clear all sibling UPDATED, but only for non-nested
(using core_pick_in_flight as nesting counter).

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/sched/sched.h |   61 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 10 deletions(-)

--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1936,6 +1936,51 @@ static inline void assert_balance_callba
 }
 
 /*
+ * We want clocks to be updated _once_ during core scheduling.
+ *
+ * rq_lock(smt0)
+ *   __rq_clock_clear(); // outer
+ *
+ * core->core_pick_in_flight++;
+ * update_rq_clock(smt0);
+ * drop()
+ *   freeze();
+ *
+ *			rq_lock(smt1)
+ *			  __rq_clock_clear(); // inner
+ *
+ *			update_rq_clock(smt1)
+ *
+ *			rq_unlock(smt1)
+ *
+ * relock()
+ *   thaw();
+ * update_rq_clock(smt1) // no second update
+ * core_pick_in_flight--;
+ *
+ * rq_unlock()
+ */
+static inline void __rq_clock_clear(struct rq *rq)
+{
+	if (!sched_core_enabled(rq)) {
+		rq->clock_update_flags &= ~RQCF_UPDATED;
+		return;
+	}
+
+#ifdef CONFIG_SCHED_CORE
+	/*
+	 * Inner rq_{,un}lock() should preserve state.
+	 */
+	if (!rq->core->core_pick_in_flight) {
+		int cpu;
+
+		for_each_cpu(cpu, cpu_smt_mask(cpu_of(rq)))
+			cpu_rq(cpu)->clock_update_flags &= ~RQCF_UPDATED;
+	}
+#endif
+}
+
+/*
  * Lockdep annotation that avoids accidental unlocks; it's like a
  * sticky/continuous lockdep_assert_held().
  *
@@ -1949,33 +1994,29 @@ static inline void rq_pin_lock(struct rq
 {
 	rf->cookie = lockdep_pin_lock(__rq_lockp(rq));
 
-	rq->clock_update_flags &= ~RQCF_UPDATED;
+	__rq_clock_clear(rq);
 	rf->clock_update_flags = 0;
 	assert_balance_callbacks_empty(rq);
 }
 
 static inline void rq_unpin_lock(struct rq *rq, struct rq_flags *rf)
 {
-	if (rq->clock_update_flags & RQCF_UPDATED)
-		rf->clock_update_flags = RQCF_UPDATED;
-
+	/* __rq_clock_clear(rq); */
 	scx_rq_clock_invalidate(rq);
 	lockdep_unpin_lock(__rq_lockp(rq), rf->cookie);
 }
 
 static inline void rq_drop_lock(struct rq *rq, struct rq_flags *rf)
 {
-	rq_unpin_lock(rq, rf);
+	rf->clock_update_flags = rq_clock_freeze(rq);
+	scx_rq_clock_invalidate(rq);
+	lockdep_unpin_lock(__rq_lockp(rq), rf->cookie);
 }
 
 static inline void rq_repin_lock(struct rq *rq, struct rq_flags *rf)
 {
 	lockdep_repin_lock(__rq_lockp(rq), rf->cookie);
-
-	/*
-	 * Restore the value we stashed in @rf for this pin context.
-	 */
-	rq->clock_update_flags |= rf->clock_update_flags;
+	rq_clock_thaw(rq, rf->clock_update_flags);
 }
 
 #define __task_rq_lock(...) __acquire_ret(___task_rq_lock(__VA_ARGS__), __rq_lockp(__ret))



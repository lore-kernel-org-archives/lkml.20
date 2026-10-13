Received: from mta0.migadu.com (out-83.mta0.migadu.com [91.218.175.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E54052CCE7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914583; cv=none; b=K9bu2H2EF8g+dXG3gdFpUtEohgvAeHcOZQ9DCCN9NaPlwo3c8hGc4zne3aaTgGtlA2kI2sNFp+npRpwJ349iDbMnClV+2ruXjUIRz6oW8oY6r2xGkNh1H3EwkyULCe8+READEfC4/7iElCfAisPVGa05BdrxlISUCMITJ68qdXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914583; c=relaxed/simple;
	bh=R+pI384S0Q9r6atCJ0SvFSIfiwHu6LC+34s4EEpq3to=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t92tSxyIJnCRULUAy6dwFgN4v9e3HbPvaFv8qRhAj1I8+DoKEutEq5ipiTIbqh9CASS1le28oORbM4+dANb+EJf1dH92MPLsclPa14J20r4khuoOGmCPyNQaTT2isZuGccH2oJyZZDmpayB9PjowxLufZVSpGoFRk5Nf0yosOmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vSgMJk84; arc=none smtp.client-ip=91.218.175.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vSgMJk84"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R+pI384S0Q9r6atCJ0SvFSIfiwHu6LC+34s4EEpq3to=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914579; v=1; x=1792519379;
 b=vSgMJk84S8TdMTPnj0urNyg8DG9Hz0tJuVpvu4WI2Lb2hfwrtlB3zAUFNVpWcnDY7aXlyizn
 xT9U1ZU8XyStBZElmFTdGYdU8yVhKTyr1JW7YV51XQFZu6D3iE1gO5ei3XRaXeifdaL/EWMTXXe
 dY/DtCb13Ztk87GmGwdUjMfs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id bf028f438df0e5f0;
	Tue, 13 Oct 2026 18:02:58 +0000
X-Mizu-Trace-ID: bf028f438df0e5f0
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Eric Dumazet <edumazet@google.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-rt-devel@list.kernel.org,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH 15/15] net: Rename rps_lock to backlog_lock.
Date: Wed, 14 Oct 2026 02:02:31 +0800
Message-Id: <82e503b4127cea58ede01b856d5ddaa0ba75e630.1791912669.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791912669.git.wen.yang@linux.dev>
References: <cover.1791912669.git.wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

commit 765b11f8f4e20b7433e4ba4a3e9106a0d59501ed upstream.

The rps_lock.*() functions use the inner lock of a sk_buff_head for
locking. This lock is used if RPS is enabled, otherwise the list is
accessed lockless and disabling interrupts is enough for the
synchronisation because it is only accessed CPU local. Not only the list
is protected but also the NAPI state protected.
With the addition of backlog threads, the lock is also needed because of
the cross CPU access even without RPS. The clean up of the defer_list
list is also done via backlog threads (if enabled).

It has been suggested to rename the locking function since it is no
longer just RPS.

Rename the rps_lock*() functions to backlog_lock*().

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Acked-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 net/core/dev.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 317c221c99c2..f1ac29d7144e 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -243,8 +243,8 @@ static bool use_backlog_threads(void)
 
 #endif
 
-static inline void rps_lock_irqsave(struct softnet_data *sd,
-				    unsigned long *flags)
+static inline void backlog_lock_irq_save(struct softnet_data *sd,
+					 unsigned long *flags)
 {
 	if (IS_ENABLED(CONFIG_RPS) || use_backlog_threads())
 		spin_lock_irqsave(&sd->input_pkt_queue.lock, *flags);
@@ -252,7 +252,7 @@ static inline void rps_lock_irqsave(struct softnet_data *sd,
 		local_irq_save(*flags);
 }
 
-static inline void rps_lock_irq_disable(struct softnet_data *sd)
+static inline void backlog_lock_irq_disable(struct softnet_data *sd)
 {
 	if (IS_ENABLED(CONFIG_RPS) || use_backlog_threads())
 		spin_lock_irq(&sd->input_pkt_queue.lock);
@@ -260,8 +260,8 @@ static inline void rps_lock_irq_disable(struct softnet_data *sd)
 		local_irq_disable();
 }
 
-static inline void rps_unlock_irq_restore(struct softnet_data *sd,
-					  unsigned long *flags)
+static inline void backlog_unlock_irq_restore(struct softnet_data *sd,
+					      unsigned long *flags)
 {
 	if (IS_ENABLED(CONFIG_RPS) || use_backlog_threads())
 		spin_unlock_irqrestore(&sd->input_pkt_queue.lock, *flags);
@@ -269,7 +269,7 @@ static inline void rps_unlock_irq_restore(struct softnet_data *sd,
 		local_irq_restore(*flags);
 }
 
-static inline void rps_unlock_irq_enable(struct softnet_data *sd)
+static inline void backlog_unlock_irq_enable(struct softnet_data *sd)
 {
 	if (IS_ENABLED(CONFIG_RPS) || use_backlog_threads())
 		spin_unlock_irq(&sd->input_pkt_queue.lock);
@@ -4790,12 +4790,12 @@ void kick_defer_list_purge(struct softnet_data *sd, unsigned int cpu)
 	unsigned long flags;
 
 	if (use_backlog_threads()) {
-		rps_lock_irqsave(sd, &flags);
+		backlog_lock_irq_save(sd, &flags);
 
 		if (!__test_and_set_bit(NAPI_STATE_SCHED, &sd->backlog.state))
 			__napi_schedule_irqoff(&sd->backlog);
 
-		rps_unlock_irq_restore(sd, &flags);
+		backlog_unlock_irq_restore(sd, &flags);
 
 	} else if (!cmpxchg(&sd->defer_ipi_scheduled, 0, 1)) {
 		smp_call_function_single_async(cpu, &sd->defer_csd);
@@ -4857,7 +4857,7 @@ static int enqueue_to_backlog(struct sk_buff *skb, int cpu,
 	reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	sd = &per_cpu(softnet_data, cpu);
 
-	rps_lock_irqsave(sd, &flags);
+	backlog_lock_irq_save(sd, &flags);
 	if (!netif_running(skb->dev))
 		goto drop;
 	qlen = skb_queue_len(&sd->input_pkt_queue);
@@ -4866,7 +4866,7 @@ static int enqueue_to_backlog(struct sk_buff *skb, int cpu,
 enqueue:
 			__skb_queue_tail(&sd->input_pkt_queue, skb);
 			input_queue_tail_incr_save(sd, qtail);
-			rps_unlock_irq_restore(sd, &flags);
+			backlog_unlock_irq_restore(sd, &flags);
 			return NET_RX_SUCCESS;
 		}
 
@@ -4881,7 +4881,7 @@ static int enqueue_to_backlog(struct sk_buff *skb, int cpu,
 
 drop:
 	sd->dropped++;
-	rps_unlock_irq_restore(sd, &flags);
+	backlog_unlock_irq_restore(sd, &flags);
 
 	dev_core_stats_rx_dropped_inc(skb->dev);
 	kfree_skb_reason(skb, reason);
@@ -5977,7 +5977,7 @@ static void flush_backlog(struct work_struct *work)
 	local_bh_disable();
 	sd = this_cpu_ptr(&softnet_data);
 
-	rps_lock_irq_disable(sd);
+	backlog_lock_irq_disable(sd);
 	skb_queue_walk_safe(&sd->input_pkt_queue, skb, tmp) {
 		if (skb->dev->reg_state == NETREG_UNREGISTERING) {
 			__skb_unlink(skb, &sd->input_pkt_queue);
@@ -5985,7 +5985,7 @@ static void flush_backlog(struct work_struct *work)
 			input_queue_head_incr(sd);
 		}
 	}
-	rps_unlock_irq_enable(sd);
+	backlog_unlock_irq_enable(sd);
 
 	skb_queue_walk_safe(&sd->process_queue, skb, tmp) {
 		if (skb->dev->reg_state == NETREG_UNREGISTERING) {
@@ -6003,14 +6003,14 @@ static bool flush_required(int cpu)
 	struct softnet_data *sd = &per_cpu(softnet_data, cpu);
 	bool do_flush;
 
-	rps_lock_irq_disable(sd);
+	backlog_lock_irq_disable(sd);
 
 	/* as insertion into process_queue happens with the rps lock held,
 	 * process_queue access may race only with dequeue
 	 */
 	do_flush = !skb_queue_empty(&sd->input_pkt_queue) ||
 		   !skb_queue_empty_lockless(&sd->process_queue);
-	rps_unlock_irq_enable(sd);
+	backlog_unlock_irq_enable(sd);
 
 	return do_flush;
 #endif
@@ -6125,7 +6125,7 @@ static int process_backlog(struct napi_struct *napi, int quota)
 
 		}
 
-		rps_lock_irq_disable(sd);
+		backlog_lock_irq_disable(sd);
 		if (skb_queue_empty(&sd->input_pkt_queue)) {
 			/*
 			 * Inline a custom version of __napi_complete().
@@ -6141,7 +6141,7 @@ static int process_backlog(struct napi_struct *napi, int quota)
 			skb_queue_splice_tail_init(&sd->input_pkt_queue,
 						   &sd->process_queue);
 		}
-		rps_unlock_irq_enable(sd);
+		backlog_unlock_irq_enable(sd);
 	}
 
 	return work;
-- 
2.25.1


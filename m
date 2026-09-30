Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB453E1D12
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790796088; cv=none; b=T5FCtIDv4iExksRbyfBIIG2eYTAWmujQYv3CjfsZPL4dMHM0n8vDLEVWcQzOD5UQeGZSAan7K/QBaHOFMQx0dnQ2Pxq12m/KlpxqNFuiwVpPUJwIdoU0i+72lHtMnA9AygQZbiRhf39LiRaAmrtFu5/6SeHqS6+2TpCwLOBtvj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790796088; c=relaxed/simple;
	bh=MyorId+LNXDQ3tBXVrKOG34/XwgfgE8q2c/oj8aOYQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XwCP8Rmxpz8wQATX4ASl3/rGz3AjXvlXnqcY3cjPsYYJH0lU/MnU3iAe5Xjs3TZWSTMizGfwYHZQpot8MqLYxqhxCx95g6/zEmlUgKSVmHxZKytOC+YM2sy2+rwRgQq1+SwXXHdkPbdIlA70MH8tKpYdMrsUz/VPQ0yP3zrwZf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuPrw3qe; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuPrw3qe"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so32432485e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790796085; x=1791400885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nf3oV330ckZwsw/LTGlRTnwET/Uw246suYw2VNp67Og=;
        b=DuPrw3qezOrhHX9vAy8mygFXiENjPX7O44qrZgK+VlNSnfVsNoKYd9AGAPb5njBHAo
         rMnASDFNQb7YgYROX2oSNYk6DWV32w7ONJRkuZrC7nsdJ0i5HfMhp4YsMTis/n2ZFsbl
         SmcEsTSiQngrlcFFx6vOvqKC8tKGcdU/uv5oMzMX+Km+Ai90fp7u3Nlfi+7Sb5TciH0A
         GUQmrvREf3TyPpHwERq5drWsbBgRJyNUfaGfTGkrKSq9uKKmV7P7I1x0TKd3wDXHOgxr
         Otjgq+cew+rxiN2hMmnAYQxQin1RLHJ130e7mblReB8pjPsHI1M+XFA0K1r8i9TmU+DC
         KbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790796085; x=1791400885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nf3oV330ckZwsw/LTGlRTnwET/Uw246suYw2VNp67Og=;
        b=XhoRiB2vXOyErNsk+pJeU0QNmRphq/EB/wxU+OawXG4+3Rjvtc5kMl6CFHLFk2RHqr
         ZtlobtrkQGoK/FQlDia2ZRhIJMkMmwdofevUuJfoflXpaJyqwrGtYKlpf2Fuv1lt4M2O
         copn9fsQZTVPjZwmMMe6Sovf+bKm6tqOHVvMBR1ZSfRwj+rK19YaxEC1hrz91Gw/Xyya
         8YSdsBvxjxTFf2QcjWLEfmha5WtvhS/jF/ykZtPp4n6I+ubvzJ3Wc/KXW/2XT3eq1h86
         OgI8bdy6fERfcEHa76r8xJehg2oDIWnO/hhqDr8N8zjUw0F7DChsZZFuy7d5nkJGEZxE
         zeOA==
X-Forwarded-Encrypted: i=1; AKwUvBxI52HPq9j3i5KO9Eqhr0pQlWFGiPdKJZgaspYuvq+473Keg6awKhOiXsCy93jdOIbTNqZH4KhEBb04l7g=@vger.kernel.org
X-Gm-Message-State: AFuF++mT7/uyxSkKCHlRyjFLpr3voaowJomINn4Kp84jga+bvBwbAFqu
	tEz+sbuuNFiZXnp3vznBU7xsfv400iC8pbcGPV2ayukkKzgWVK0GYulr
X-Gm-Gg: AYBFou0dSQDDH4c4+jLi6WkfPsQ0mOMvi1Hcv1Bxho4p90PQpBPqSuZPW68rFU5+pDn
	FHugB7pEF5qgQWd3bun8aqVFJth29x1ukG2y4x3i/YfZTJTj2AOkLHxA1PWcptD5KqgU6SQMA67
	oj+RHNrZd64v9Oz35t7VnQ7CN6Mvt/XbDjF31fvJLtc8ErJTWpq19ulcfDxBxPBYWqMA0K1YF/d
	eozir/KtxG87yPsO9UDyyOyh5LbUqLnMSa9TXlRRPU/GWJ0pPkMQ64Xf1oL/x3wuZOtYKKI8eqn
	htfkL6foMXHcklAHBw3hh4OQHBZ5IOm6K7dIxQxD91Zf24LBDjlEwBtYMM6f6MzA1lCZfW7DfgO
	yZARXwhLF5SgJjdB11Ic/PHApQoZC9eX6kNi82z9BHNiHlpMA7iyT39TyijYh5oRO1GbigOUHlD
	BQ0GExhyvKKu7TtXxPE8cWFMmwVT+oywKnHe7l2Qbtsv8K6jBFgbXX3vkKYwp4S9n0/5fQ8ll2I
	CrzWuOQg8XD2ftbdqXVtuniMndEDzIj7a0XzyUhcfIcQi5L4O+SkKqgli7yWbzpIoqFBIZC956P
	OG7HP8tNJ+EriyV+n3PCEUfjRsKF9maofdgFjPqi73k4LtPYo5RHjDEc8gLXMov/XYys9eYGEcx
	3
X-Received: by 2002:a05:600c:37c4:b0:49f:ce78:356b with SMTP id 5b1f17b1804b1-4a01b125598mr35582525e9.28.1790796084483;
        Wed, 30 Sep 2026 12:21:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2b3-0101-b51c-a607-3dcc-3979.310.pool.telefonica.de. [2a02:3100:b2b3:101:b51c:a607:3dcc:3979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9248ccsm3513165e9.3.2026.09.30.12.21.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 12:21:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH net v2 1/2] netpoll: use a raw lock for the deferred transmit queue
Date: Wed, 30 Sep 2026 21:21:02 +0200
Message-Id: <20260930192103.62973-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260928064239.32456-1-kmehltretter@gmail.com>
References: <20260928064239.32456-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

netpoll_send_skb() calls __netpoll_send_skb() with hard interrupts
disabled. When direct transmission cannot complete, the latter queues
the skb with skb_queue_tail(). The sk_buff_head lock may sleep on
PREEMPT_RT:

  BUG: sleeping function called from invalid context
  in_atomic(): 0, irqs_disabled(): 1, non_block: 0
  rt_spin_lock
  skb_queue_tail
  netpoll_send_skb

The delayed transmit worker has the same problem when it requeues a busy
skb with skb_queue_head() after disabling interrupts.

Add a dedicated raw spinlock and use the unlocked skb queue helpers under
it. Keep raw critical sections limited to queue operations. During
cleanup, splice the queue to a private list before freeing its skbs.

Fixes: b6cd27ed3388 ("netpoll per device txq")
Cc: stable@vger.kernel.org # 6.12+
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/netpoll.h |  1 +
 net/core/netpoll.c      | 75 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 70 insertions(+), 6 deletions(-)

diff --git a/include/linux/netpoll.h b/include/linux/netpoll.h
index 1c6b1eec5efd6..e20e0592e9349 100644
--- a/include/linux/netpoll.h
+++ b/include/linux/netpoll.h
@@ -47,6 +47,7 @@ struct netpoll_info {
 	struct semaphore dev_lock;
 
 	struct sk_buff_head txq;
+	raw_spinlock_t txq_lock;
 
 	struct delayed_work tx_work;
 
diff --git a/net/core/netpoll.c b/net/core/netpoll.c
index fe1e0cda5d6bf..e0cfcb05468e2 100644
--- a/net/core/netpoll.c
+++ b/net/core/netpoll.c
@@ -79,6 +79,68 @@ static netdev_tx_t netpoll_start_xmit(struct sk_buff *skb,
 	return status;
 }
 
+/*
+ * Transmit paths can access txq with hard IRQs disabled. Use a raw lock
+ * because the skb queue lock may sleep on PREEMPT_RT.
+ */
+static bool netpoll_txq_empty(struct netpoll_info *npinfo)
+{
+	unsigned long flags;
+	bool empty;
+
+	raw_spin_lock_irqsave(&npinfo->txq_lock, flags);
+	empty = skb_queue_empty(&npinfo->txq);
+	raw_spin_unlock_irqrestore(&npinfo->txq_lock, flags);
+
+	return empty;
+}
+
+static struct sk_buff *netpoll_txq_dequeue(struct netpoll_info *npinfo)
+{
+	unsigned long flags;
+	struct sk_buff *skb;
+
+	raw_spin_lock_irqsave(&npinfo->txq_lock, flags);
+	skb = __skb_dequeue(&npinfo->txq);
+	raw_spin_unlock_irqrestore(&npinfo->txq_lock, flags);
+
+	return skb;
+}
+
+static void netpoll_txq_queue_head(struct netpoll_info *npinfo,
+				   struct sk_buff *skb)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&npinfo->txq_lock, flags);
+	__skb_queue_head(&npinfo->txq, skb);
+	raw_spin_unlock_irqrestore(&npinfo->txq_lock, flags);
+}
+
+static void netpoll_txq_queue_tail(struct netpoll_info *npinfo,
+				   struct sk_buff *skb)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&npinfo->txq_lock, flags);
+	__skb_queue_tail(&npinfo->txq, skb);
+	raw_spin_unlock_irqrestore(&npinfo->txq_lock, flags);
+}
+
+static void netpoll_txq_purge(struct netpoll_info *npinfo)
+{
+	struct sk_buff_head purge;
+	unsigned long flags;
+
+	__skb_queue_head_init(&purge);
+
+	raw_spin_lock_irqsave(&npinfo->txq_lock, flags);
+	skb_queue_splice_init(&npinfo->txq, &purge);
+	raw_spin_unlock_irqrestore(&npinfo->txq_lock, flags);
+
+	__skb_queue_purge(&purge);
+}
+
 static void queue_process(struct work_struct *work)
 {
 	struct netpoll_info *npinfo =
@@ -86,7 +148,7 @@ static void queue_process(struct work_struct *work)
 	struct sk_buff *skb;
 	unsigned long flags;
 
-	while ((skb = skb_dequeue(&npinfo->txq))) {
+	while ((skb = netpoll_txq_dequeue(npinfo))) {
 		struct net_device *dev = skb->dev;
 		struct netdev_queue *txq;
 		unsigned int q_index;
@@ -107,7 +169,7 @@ static void queue_process(struct work_struct *work)
 		HARD_TX_LOCK(dev, txq, smp_processor_id());
 		if (netif_xmit_frozen_or_stopped(txq) ||
 		    !dev_xmit_complete(netpoll_start_xmit(skb, dev, txq))) {
-			skb_queue_head(&npinfo->txq, skb);
+			netpoll_txq_queue_head(npinfo, skb);
 			HARD_TX_UNLOCK(dev, txq);
 			local_irq_restore(flags);
 
@@ -282,7 +344,7 @@ static netdev_tx_t __netpoll_send_skb(struct netpoll *np, struct sk_buff *skb)
 	}
 
 	/* don't get messages out of order, and no recursion */
-	if (skb_queue_len(&npinfo->txq) == 0 && !netpoll_owner_active(dev)) {
+	if (netpoll_txq_empty(npinfo) && !netpoll_owner_active(dev)) {
 		struct netdev_queue *txq;
 
 		txq = netdev_core_pick_tx(dev, skb, NULL);
@@ -314,7 +376,7 @@ static netdev_tx_t __netpoll_send_skb(struct netpoll *np, struct sk_buff *skb)
 	}
 
 	if (!dev_xmit_complete(status)) {
-		skb_queue_tail(&npinfo->txq, skb);
+		netpoll_txq_queue_tail(npinfo, skb);
 		schedule_delayed_work(&npinfo->tx_work,0);
 	}
 	ret = NETDEV_TX_OK;
@@ -362,7 +424,8 @@ int __netpoll_setup(struct netpoll *np, struct net_device *ndev)
 		}
 
 		sema_init(&npinfo->dev_lock, 1);
-		skb_queue_head_init(&npinfo->txq);
+		__skb_queue_head_init(&npinfo->txq);
+		raw_spin_lock_init(&npinfo->txq_lock);
 		INIT_DELAYED_WORK(&npinfo->tx_work, queue_process);
 
 		refcount_set(&npinfo->refcnt, 1);
@@ -397,7 +460,7 @@ static void rcu_cleanup_netpoll_info(struct rcu_head *rcu_head)
 	struct netpoll_info *npinfo =
 			container_of(rcu_head, struct netpoll_info, rcu);
 
-	skb_queue_purge(&npinfo->txq);
+	netpoll_txq_purge(npinfo);
 	kfree(npinfo);
 }
 
-- 
2.53.0

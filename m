Received: from mta1.migadu.com (out-113.mta1.migadu.com [95.215.58.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03C52F292
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914364; cv=none; b=tNwna2CnDhJBaOpLBrRXv0WWLkcPcLOUmo7aLhGYHguMLh6vYHkX1ndzQ/jqg0ulX7XnI5U+r7Ft5F5Nl4wN5H6OrFjPdDcg055NButBzuSRL4OoUPUDcj0N5V7s1KUSbPqwjl3zfzS1bsvNi4RXBa4OgOp8w3ezXiQSmMfRSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914364; c=relaxed/simple;
	bh=UlY7QlMUrNEOh4hmb9le0VB8UsxmrmjM0k/WpNGXkOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rjeTVh5ai4UGkEzcaJJ+7e0yIsUc9VGwkpJOH750QhVvoUyUYvRhJsVGYyPET5MIps7ukXMlzP5+pMwKqJsW70d/uGZwXaSx0aEjbaZIHP9rI3zY39Ud35a07sOnNUck3U1JBTkf9X/3gRJKTjlf71T+Cw755t7CzswJ/FpG2cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KPjV+rxi; arc=none smtp.client-ip=95.215.58.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KPjV+rxi"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UlY7QlMUrNEOh4hmb9le0VB8UsxmrmjM0k/WpNGXkOI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914360; v=1; x=1792519160;
 b=KPjV+rxiefhviSBnK4gg3Cod99hApXIPI5eN0EcI8wu3BVjV/ocD91lioy17UXKnc6YxP0Ac
 CSzGcmEHY6X6TEKpSjSlwLY7/MjmIJwRgQ/99RwPY6OvSg1Z69VIaabIr3Fp+cWpZE22Xg++Dlv
 Qyy7lf3Uf+PxyddMUvUYJZnk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id c84f0cb4edcfb4e0;
	Tue, 13 Oct 2026 17:59:20 +0000
X-Mizu-Trace-ID: c84f0cb4edcfb4e0
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
	Jacob Keller <jacob.e.keller@intel.com>,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH 02/15] net: avoid irqsave in skb_defer_free_flush
Date: Wed, 14 Oct 2026 01:58:36 +0800
Message-Id: <aa067ff5678ffa30e088d6171b18bceb61fffa86.1791912669.git.wen.yang@linux.dev>
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

From: Jesper Dangaard Brouer <brouer@redhat.com>

commit 3176eb82681ec9c8af31c6588ddedcc6cfb9e445 upstream.

The spin_lock irqsave/restore API variant in skb_defer_free_flush can
be replaced with the faster spin_lock irq variant, which doesn't need
to read and restore the CPU flags.

Using the unconditional irq "disable/enable" API variant is safe,
because the skb_defer_free_flush() function is only called during
NAPI-RX processing in net_rx_action(), where it is known the IRQs
are enabled.

Expected gain is 14 cycles from avoiding reading and restoring CPU
flags in a spin_lock_irqsave/restore operation, measured via a
microbencmark kernel module[1] on CPU E5-1650 v4 @ 3.60GHz.

Microbenchmark overhead of spin_lock+unlock:
 - spin_lock_unlock_irq     cost: 34 cycles(tsc)  9.486 ns
 - spin_lock_unlock_irqsave cost: 48 cycles(tsc) 13.567 ns

We don't expect to see a measurable packet performance gain, as
skb_defer_free_flush() is called infrequently once per NIC device NAPI
bulk cycle and conditionally only if SKBs have been deferred by other
CPUs via skb_attempt_defer_free().

[1] https://github.com/netoptimizer/prototype-kernel/blob/master/kernel/lib/time_bench_sample.c

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Jesper Dangaard Brouer <brouer@redhat.com>
Link: https://lore.kernel.org/r/167421646327.1321776.7390743166998776914.stgit@firesoul
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 net/core/dev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index f44ffac6cba6..efe483d7e03f 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -6762,17 +6762,16 @@ static int napi_threaded_poll(void *data)
 static void skb_defer_free_flush(struct softnet_data *sd)
 {
 	struct sk_buff *skb, *next;
-	unsigned long flags;
 
 	/* Paired with WRITE_ONCE() in skb_attempt_defer_free() */
 	if (!READ_ONCE(sd->defer_list))
 		return;
 
-	spin_lock_irqsave(&sd->defer_lock, flags);
+	spin_lock_irq(&sd->defer_lock);
 	skb = sd->defer_list;
 	sd->defer_list = NULL;
 	sd->defer_count = 0;
-	spin_unlock_irqrestore(&sd->defer_lock, flags);
+	spin_unlock_irq(&sd->defer_lock);
 
 	while (skb != NULL) {
 		next = skb->next;
-- 
2.25.1


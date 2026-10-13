Received: from mta1.migadu.com (out-110.mta1.migadu.com [95.215.58.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A14352E042
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914356; cv=none; b=GIFeX3bFXSzwwgfwXCJwZiWo34qQLeddzdyMXHBdWklwOqZtpyAxsSJytSnAHvHp07Nws+wua8FAx1P5k+KQErA/oPd0IB0ktF1KuLPuzoodmu8FRYbBUJ9V0zKWwNysIpFwhc2iHTKFPCBx5vu8dXJRRBF/vM+Y2+b21B7fucQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914356; c=relaxed/simple;
	bh=lFj4P1C84GknCzyL3LN9APTN5ny8dDAsCuZSO8sswvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iOuD+YgsDQRxIs9QcKC5Vq3mLIxxHLGcMuzzz8RXIHLIrmCfqfz3/C/cSVZaXjjTqUeB5PHplKDorryumvAqEPEEU8qDU2ElOCxkX4TK9eDuG3AW/oo+584PazFGVNR6ZJp6OGc5W1Acw25G5/nPqCNQSeoTT+k5ifOeWqg/OqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KaU9Ylp0; arc=none smtp.client-ip=95.215.58.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KaU9Ylp0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lFj4P1C84GknCzyL3LN9APTN5ny8dDAsCuZSO8sswvg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791914352; v=1; x=1792519152;
 b=KaU9Ylp0pxQg3dFPVC2t4nu2TilfAxu+Jkj2PgHdWq1D7D/JW30DIUrh3gNORy00XV3FwSiY
 P0NcmGiJfk9LJ86+RsDoUD3PLv08cN2hC+qGE5uEbU9QpdQcsx+MU/NuE8HomcIrd6dzamVD2Bm
 EERBcadolSFGey9fiB1H7gwY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id ec7c469c793e45a9;
	Tue, 13 Oct 2026 17:59:11 +0000
X-Mizu-Trace-ID: ec7c469c793e45a9
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
Subject: [PATCH 01/15] Revert "net: Avoid the IPI to free the"
Date: Wed, 14 Oct 2026 01:58:35 +0800
Message-Id: <3cbe89d9d68c4a6cde983624b6849a05373c6361.1791912669.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

This reverts commit 8d152d22d9f056f87875f97aec016a65622abbf0.

That commit is an RT-only workaround. skb_attempt_defer_free() collects
skbs allocated on a remote CPU on a per-CPU list and, once the list passes
half its watermark, pokes that CPU with an IPI to raise NET_RX_SOFTIRQ so
the list gets drained. On PREEMPT_RT that IPI wakes ksoftirqd from hardirq
context, which is undesirable, so the commit redirected the deferred skb
recycling to a workqueue (sd->defer_work) instead.

It is reverted here for two reasons.

First, it is incomplete. It only covers the defer_list path. RPS steering
still pokes the remote CPU with an IPI from napi_schedule_rps(), and that
IPI handler (rps_trigger_softirq) still calls ____napi_schedule() ->
raise_softirq_irqoff(NET_RX_SOFTIRQ). That is the path that trips
do_softirq_post_smp_call_flush() on PREEMPT_RT, and the workaround does
nothing about it.

Second, it is superseded. The following patches backport the upstream
backlog-NAPI smpboot threads (dad6b9770263 and friends). With those,
use_backlog_threads() is unconditionally true on PREEMPT_RT, so both the
cross-CPU backlog enqueue and the defer_list purge wake a per-CPU
"backlog_napi/%u" thread with wake_up_process() instead of sending an IPI.
Deferred skbs are then freed from the same NAPI loop that is already going
to run, without the workqueue round-trip.

Reverting first restores the upstream 6.1 code shape so the rest of the
series applies unmodified.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 include/linux/netdevice.h |  4 ----
 net/core/dev.c            | 37 +++++++++----------------------------
 net/core/skbuff.c         |  7 +------
 3 files changed, 10 insertions(+), 38 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index fbd3b17463da..e97967ca2760 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3199,11 +3199,7 @@ struct softnet_data {
 	int			defer_count;
 	int			defer_ipi_scheduled;
 	struct sk_buff		*defer_list;
-#ifndef CONFIG_PREEMPT_RT
 	call_single_data_t	defer_csd;
-#else
-	struct work_struct	defer_work;
-#endif
 };
 
 static inline void input_queue_head_incr(struct softnet_data *sd)
diff --git a/net/core/dev.c b/net/core/dev.c
index 5d6ca8510227..f44ffac6cba6 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4712,6 +4712,15 @@ static void rps_trigger_softirq(void *data)
 
 #endif /* CONFIG_RPS */
 
+/* Called from hardirq (IPI) context */
+static void trigger_rx_softirq(void *data)
+{
+	struct softnet_data *sd = data;
+
+	__raise_softirq_irqoff(NET_RX_SOFTIRQ);
+	smp_store_release(&sd->defer_ipi_scheduled, 0);
+}
+
 /*
  * Check if this softnet_data structure is another cpu one
  * If yes, queue it to our IPI list and return 1
@@ -6772,30 +6781,6 @@ static void skb_defer_free_flush(struct softnet_data *sd)
 	}
 }
 
-#ifndef CONFIG_PREEMPT_RT
-/* Called from hardirq (IPI) context */
-static void trigger_rx_softirq(void *data)
-{
-	struct softnet_data *sd = data;
-
-	__raise_softirq_irqoff(NET_RX_SOFTIRQ);
-	smp_store_release(&sd->defer_ipi_scheduled, 0);
-}
-
-#else
-
-static void trigger_rx_softirq(struct work_struct *defer_work)
-{
-	struct softnet_data *sd;
-
-	sd = container_of(defer_work, struct softnet_data, defer_work);
-	smp_store_release(&sd->defer_ipi_scheduled, 0);
-	local_bh_disable();
-	skb_defer_free_flush(sd);
-	local_bh_enable();
-}
-#endif
-
 static __latent_entropy void net_rx_action(struct softirq_action *h)
 {
 	struct softnet_data *sd = this_cpu_ptr(&softnet_data);
@@ -11620,11 +11605,7 @@ static int __init net_dev_init(void)
 		INIT_CSD(&sd->csd, rps_trigger_softirq, sd);
 		sd->cpu = i;
 #endif
-#ifndef CONFIG_PREEMPT_RT
 		INIT_CSD(&sd->defer_csd, trigger_rx_softirq, sd);
-#else
-		INIT_WORK(&sd->defer_work, trigger_rx_softirq);
-#endif
 		spin_lock_init(&sd->defer_lock);
 
 		init_gro_hash(&sd->backlog);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 665be0ad4b8d..a66066bc9861 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6746,11 +6746,6 @@ nodefer:	__kfree_skb(skb);
 	/* Make sure to trigger NET_RX_SOFTIRQ on the remote CPU
 	 * if we are unlucky enough (this seems very unlikely).
 	 */
-	if (unlikely(kick) && !cmpxchg(&sd->defer_ipi_scheduled, 0, 1)) {
-#ifndef CONFIG_PREEMPT_RT
+	if (unlikely(kick) && !cmpxchg(&sd->defer_ipi_scheduled, 0, 1))
 		smp_call_function_single_async(cpu, &sd->defer_csd);
-#else
-		schedule_work_on(cpu, &sd->defer_work);
-#endif
-	}
 }
-- 
2.25.1


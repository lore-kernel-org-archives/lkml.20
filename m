Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58393DB333
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545741; cv=none; b=XnwHn05BsdeKY09f3D6YySPTl9r1QRilwvHAk1clR0Pz1XsZaeS7U/BZsFMqf2MmzOIeIGwMJCVYhROskaQR6uL+6hL690UJXzLJ263aDwPnmSKIFfd1GmqXK83Ltrq8ZJTLLfqGe9aRHYOdrrjd7YupYuxsHDUI0kGxDS8TXkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545741; c=relaxed/simple;
	bh=eRG8WvF1bsjLPC0MjjmZR0uNw9zvAMam79yEOqb8sT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G16CK9VvxAIwzy5uCcL7A6H/aij6oK+7yR+JDsVmnZWUR8kZYixgzUMCVw7ECbii/TUt8irdgr+QaNNt0+wmJWMjbjo+BsFbum/oWEA/o3HY6lOUfOYRGLzMt8kSeNHRM6337f8apuDgEUJkx42H8rfrKhFxlohnbgS8WeBZceU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adjVrIgd; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adjVrIgd"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6dde81a6820so4785005eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545721; x=1792150521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS9A7YoCLm+UzG8nxic/xw1Qa1nYtCBqz/7ErKQAzHI=;
        b=adjVrIgd83y8cPrUJst7eS0b69LiziPK1/vSXia7tR3O5dqu+hCm9IRTNPTVvoPYiF
         2zBtKfNp7ffHSHsK6LZ08wGF5HANaS9cdTvg8mzMjVxiC7WeZ1n3J+x3rWI12VSirud5
         FrGbUfkYu9Ub3dQUrmfFg7EHcQozJs9GTxj0vZLxpbi+4IC1am5Z7miicVjJLS2IA2zE
         fjs6t9IFAsgTIlzZ+2qs5MaAIlhZhEDbAia9eYbT0zMDj/GByN6hiYlGwYy6tJpJwS10
         mLsyMVHNshDc8DqPwWT28YnPEJwK5nfjeGPdrY603NGqEvgG9hL89pbgIp414wlaxSa/
         gvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545721; x=1792150521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DS9A7YoCLm+UzG8nxic/xw1Qa1nYtCBqz/7ErKQAzHI=;
        b=ZQClTEJk0TQpgMPNdxwJ1X1fXAt1F04dXpxeycY3aVlhag8I8lB18b+ADfLTjmkj/m
         8f5v6fc1lr5vmlC1Hn/x3BTdD05g+gdKCb9sHXBIEbjp724yv9HOYyzxfToQw7g9rkMl
         GqQA7lw+BNsBYkBKO2QOu3PKiqYv8E8grFRBLANmq6EwATT18/ZfuelnmLbnT1UHtWAp
         5dkv0z/jBPCpYqNDxfdwje0b1WkXYr1Qv3tH5V2FSEtywRNDrPqw1ek+yMxzNQgOtys1
         vo9OoMSGl3VTIOBZvi7cjlZxfu1/FTgAH4BeHaOs85bCHGpNdhREtFMQxwxjr7zudxxP
         thKQ==
X-Forwarded-Encrypted: i=1; AKwUvByYLK7tVJwLDFsRY+3z2g9SmhjXuQEPp/xDHhO0cN1WJ1Ms9kacuWufR1yIdWSE8p/dFCyleZ28ztHSRqA=@vger.kernel.org
X-Gm-Message-State: AFuF++musx1FJyD+9bUGhBPloNWUbt3u17elFSikV2OJg3pBrzxEpAiz
	KpZDKWB+C4ydoGh8ozEcMpZIXIVZWrB9HAdVjwAJo326w8/6hxA8b86q
X-Gm-Gg: AYBFou25QBcTJViQxFOXcPXKO8vSUSse76hRsXXuhWUTex3XZ2kesAqzrJxS0dDXZCW
	e7Axs2qwfzC+HPQwXgVKmRW/jvZYwJvVt2FxFrxiRCER0uHeymz6+ht5qFLy6LI9Sn4cSMiF4fZ
	gWJI8diqvv1nAPNb9kLn+r1+GKHStRgUqy+xpsmISXZphdmXDWNDskUrB0SseKxuNZ4GrrDVKy4
	G/gtGckHVK9EnzVH5n5HFElzbHYNP+vAb8WusV71nZjgb/l6XujYw4nmwlcxqEBieO7A3jdPBF/
	tonIaz1NtRVmz/qYFNVQdA5wL857J63Aye7ROwia/2B0Y9YpNqZ1ljsEuZvZRYGxZB3asj+jKQY
	GbNNubeo7CuQd2+lYRNg7vD0yNbsTCWEyhX5fx70lHTdy5VYZbZqfNQMsAN304mFAwBs8XWCyYD
	owj+jbkJLp1ay78MFzQpWq5HVQiSSyXvM2hXCkkZ2VOmLpkZ56Xlzd0/LBh607KM4rTKD/
X-Received: by 2002:a05:6820:c95:b0:6e0:1917:42f9 with SMTP id 006d021491bc7-6ef11839a31mr1124128eaf.51.1791545721421;
        Fri, 09 Oct 2026 04:35:21 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:75::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039a3e016sm1452342a34.17.2026.10.09.04.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:35:20 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 09 Oct 2026 04:35:06 -0700
Subject: [PATCH net-next 3/4] eth: mpnic: count Tx queue stops and wakes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-mpnic-counters3-v1-3-7dc7644cc500@gmail.com>
References: <20261009-mpnic-counters3-v1-0-7dc7644cc500@gmail.com>
In-Reply-To: <20261009-mpnic-counters3-v1-0-7dc7644cc500@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Eric Dumazet <edumazet@kernel.org>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org
X-Mailer: b4 0.13.0

Count how often a Tx queue is stopped for lack of descriptors and woken
again by completions, and report the counts through the queue stats API.

Stops are counted on the TWQ from the xmit path and wakes on the TCQ
from mpnic_poll(), keeping a single writer context for each.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 13 ++++++++-
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.h |  2 ++
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 37 +++++++++++++++++++-------
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.h   |  2 ++
 4 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index c2f4a326a8f0..9e262f939c79 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -176,9 +176,9 @@ static void mpnic_get_queue_stats_tx(struct net_device *dev, int idx,
 	struct mpnic_net *mpn = netdev_priv(dev);
 	struct mpnic_ring *txr = mpn->tx[idx];
 	struct mpnic_queue_stats *stats;
+	u64 bytes, packets, stop, wake;
 	struct mpnic_q_triad *qt;
 	unsigned int start;
-	u64 bytes, packets;
 
 	if (!txr)
 		return;
@@ -190,10 +190,19 @@ static void mpnic_get_queue_stats_tx(struct net_device *dev, int idx,
 		start = u64_stats_fetch_begin(&stats->syncp);
 		bytes = u64_stats_read(&stats->tcq.bytes);
 		packets = u64_stats_read(&stats->tcq.packets);
+		wake = u64_stats_read(&stats->tcq.wake);
+	} while (u64_stats_fetch_retry(&stats->syncp, start));
+
+	stats = &txr->stats;
+	do {
+		start = u64_stats_fetch_begin(&stats->syncp);
+		stop = u64_stats_read(&stats->twq.stop);
 	} while (u64_stats_fetch_retry(&stats->syncp, start));
 
 	tx->bytes = bytes;
 	tx->packets = packets;
+	tx->stop = stop;
+	tx->wake = wake;
 }
 
 static void mpnic_get_base_stats(struct net_device *dev,
@@ -207,6 +216,8 @@ static void mpnic_get_base_stats(struct net_device *dev,
 
 	tx->bytes = base->tx.bytes;
 	tx->packets = base->tx.packets;
+	tx->stop = base->tx.stop;
+	tx->wake = base->tx.wake;
 
 	rx->bytes = base->rx.bytes;
 	rx->packets = base->rx.packets;
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h
index a61249d12a04..0d1ee66dd86c 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.h
@@ -16,6 +16,8 @@ struct mpnic_base_stats {
 		u64 packets;
 		u64 bytes;
 		u64 dropped;
+		u64 stop;
+		u64 wake;
 	} tx;
 	struct {
 		u64 packets;
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
index 4bf640494115..35129fc149e2 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
@@ -68,6 +68,23 @@ static struct netdev_queue *mpnic_txring_txq(const struct net_device *dev,
 	return netdev_get_tx_queue(dev, ring->q_idx);
 }
 
+static bool
+mpnic_maybe_stop_tx(const struct net_device *dev, struct mpnic_ring *ring)
+{
+	int res;
+
+	res = netif_txq_maybe_stop(mpnic_txring_txq(dev, ring),
+				   mpnic_desc_unused(ring), MPNIC_MAX_SKB_DESC,
+				   MPNIC_TX_DESC_WAKEUP);
+	if (!res) {
+		u64_stats_update_begin(&ring->stats.syncp);
+		u64_stats_inc(&ring->stats.twq.stop);
+		u64_stats_update_end(&ring->stats.syncp);
+	}
+
+	return !res;
+}
+
 static void mpnic_tx_doorbell(struct mpnic_ring *ring, __le64 *meta)
 {
 	*meta |= cpu_to_le64(MPNIC_TWD_FLAG_REQ_COMPLETION);
@@ -164,9 +181,7 @@ mpnic_tx_map(struct mpnic_ring *ring, struct sk_buff *skb, __le64 *meta)
 	ring->tail = tail;
 
 	/* Verify there is room for another packet */
-	netif_txq_maybe_stop(mpnic_txring_txq(skb->dev, ring),
-			     mpnic_desc_unused(ring), MPNIC_MAX_SKB_DESC,
-			     MPNIC_TX_DESC_WAKEUP);
+	mpnic_maybe_stop_tx(skb->dev, ring);
 
 	if (__netdev_tx_sent_queue(mpnic_txring_txq(skb->dev, ring),
 				   MPNIC_XMIT_CB(skb)->bytecount,
@@ -204,9 +219,7 @@ static netdev_tx_t mpnic_xmit_frame_ring(struct sk_buff *skb,
 	if (skb_put_padto(skb, MPNIC_MIN_FRAME_LEN))
 		goto err_drop;
 
-	if (!netif_txq_maybe_stop(mpnic_txring_txq(skb->dev, ring),
-				  mpnic_desc_unused(ring), MPNIC_MAX_SKB_DESC,
-				  MPNIC_TX_DESC_WAKEUP)) {
+	if (mpnic_maybe_stop_tx(skb->dev, ring)) {
 		mpnic_tx_flush_doorbell(ring);
 		return NETDEV_TX_BUSY;
 	}
@@ -310,9 +323,13 @@ static void mpnic_clean_twq0(struct mpnic_napi_vector *nv, int napi_budget,
 	u64_stats_update_end(&cmpl->stats.syncp);
 
 	txq = mpnic_txring_txq(nv->napi.dev, ring);
-	netif_txq_completed_wake(txq, total_packets, total_bytes,
-				 mpnic_desc_unused(ring),
-				 MPNIC_TX_DESC_WAKEUP);
+	if (!netif_txq_completed_wake(txq, total_packets, total_bytes,
+				      mpnic_desc_unused(ring),
+				      MPNIC_TX_DESC_WAKEUP)) {
+		u64_stats_update_begin(&cmpl->stats.syncp);
+		u64_stats_inc(&cmpl->stats.tcq.wake);
+		u64_stats_update_end(&cmpl->stats.syncp);
+	}
 }
 
 static void mpnic_commit_cq_head(struct mpnic_ring *cmpl)
@@ -699,6 +716,7 @@ static void mpnic_aggregate_ring_twq_counters(struct mpnic_base_stats *base,
 					      struct mpnic_ring *twq)
 {
 	base->tx.dropped += u64_stats_read(&twq->stats.twq.dropped);
+	base->tx.stop += u64_stats_read(&twq->stats.twq.stop);
 }
 
 static void mpnic_aggregate_ring_tcq_counters(struct mpnic_base_stats *base,
@@ -706,6 +724,7 @@ static void mpnic_aggregate_ring_tcq_counters(struct mpnic_base_stats *base,
 {
 	base->tx.packets += u64_stats_read(&tcq->stats.tcq.packets);
 	base->tx.bytes += u64_stats_read(&tcq->stats.tcq.bytes);
+	base->tx.wake += u64_stats_read(&tcq->stats.tcq.wake);
 }
 
 static void mpnic_aggregate_ring_rcq_counters(struct mpnic_base_stats *base,
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
index 7b44cf700e5b..764e78918b8f 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.h
@@ -89,10 +89,12 @@ struct mpnic_queue_stats {
 	union {
 		struct {
 			u64_stats_t dropped;
+			u64_stats_t stop;
 		} twq;
 		struct {
 			u64_stats_t packets;
 			u64_stats_t bytes;
+			u64_stats_t wake;
 		} tcq;
 		struct {
 			u64_stats_t packets;

-- 
2.52.0


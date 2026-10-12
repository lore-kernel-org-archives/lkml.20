Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3147D92B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806697; cv=none; b=pDydXiJFMIF/hMOynp3B2tOIBCpbL+kjNMt/g1OWCGBu4wpr0QXt2Xq3Xqv2BuB3iMy00WIN9/buXDk51P4AJuGQx8DVVITnvcZIyadX5InXh7UZ4+7pJizuc7U5VsiyoXhdUAhj6Ot1NWnfhdfari44+FRr0fYcm3H/QqCNgJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806697; c=relaxed/simple;
	bh=9kyrycnyVjA9m0hbdvi9SzGqg0J2H5jDAGWLdm0YCQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hH3G+hX9htX+IUI8yzQKORMnDUtJhYBB3X6D2EG3jZlqMMav88YifgllOVnfb5gz6KLkuP0fow1VnMYf13zlCuUcRM5zzrxJ7QRnRGwcpngRRJMy58QU50ataS9mS7viS/jqa6VVrMZK0szk38jWwsCWnGYCME3hJNCZqtJqfQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSAd3HXj; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSAd3HXj"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f5a0893610so553980eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806695; x=1792411495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3WM8D0a1FeGmJ072QFLZ3lNVfM/LNVYGsbp96E8Q60=;
        b=ZSAd3HXjCoesgdhM/SoyEq3WR5Yx0bJcHfGAOHikrDJC4dPcfaSVFJexMAJ6Q+rtlQ
         z8ikXPVo0bH3Qzog5RFSLwQiFisxQ4ZZubkDIIf0G+sGGIP+y7zIHI+jL1EIkzWh539/
         u4K+lrXZBHRPUkrjrMHaSc+j6m3VBGPutlHc/b97hs5gHrZu7yjV97Vfk/SjiyBRhnU9
         AMZKNsTF5Jm8sZdTB26SwbdhfXsIqCvGJw49QwS9DdHje0nqrvDxxwzEum8Uc5heQ9Dc
         qC8ouRkVZf6Q+o5ih7kpG44WxnE2oGPDjs3EsmCE4FvWyWNJBVVrDQZbPFHi7CcIdAMw
         eoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806695; x=1792411495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3WM8D0a1FeGmJ072QFLZ3lNVfM/LNVYGsbp96E8Q60=;
        b=VZqQGQHY+RwgvJBLA9yrVTrNoucXXo7TyJZXWdbCmD53bYNBhWAkIjjmcIaqSkMZcK
         7pGja70G7Paux78QfWLBq33j0tCMWEyIrtiggYEpNAFUjM5k1gY15OHrFsge8EXV/EZu
         ebkwxhK9LpXsdmRdhp5T1UWhyHZzQ7CyqiPhJml0ERZe8PxD6irpm6FtokVaHXEprqal
         92E62gtLhzW7k93UT77pfjvY/woCLlyNCWxi1PWmZwwyn7EQlcM6hVdrjIsSJfxTNguw
         g30reOTjMk1OhTXBOOmJ/TkgrfAMu69WrsCki37aK7HqQccB8dltQw00MzxSlJYufrze
         BSpA==
X-Forwarded-Encrypted: i=1; AKwUvBx50+rlWHw2pt/zDlunUq1/pk8Wy1P+cW6iizm7oRHwqaNjcVLuAo0yJ6gCjdZiL+HXhGo6PkAMdkE6Sok=@vger.kernel.org
X-Gm-Message-State: AFq9FYICvQ0gMgkqfZABDkfuszSglTeqvJCkfMJCXXcu1AT2raN5I587
	g/uMqw2C3AkIbhsdqTJMY7kHVc8AdEgV4+kUFtjyXs7ni29x+FBESx8h
X-Gm-Gg: AYBFou19qalwU4CgfpcN+FY/NeZIZybAQHhW8odoMro5Sa7NGXygKXr3zhh4mWhirWY
	N2U8nX2pyAIlFow2THryObM6KHcXVOT9NYpjAcot/NseBNGwdRauSVekLoq5Jwez7nBxsmMj5S6
	ImnOLowy+CxnwEsQBMEJuEGQR56/3Xr1DGVHxmpEgFT3brPvpnkPg8r5dvquA1iFGsPv/vq/FzI
	VDDuSPTzuIjgCtFIQYIrSLBtEyukELhJ2+fL/Hit72orXxB/8LsuoneiFwOK9gejIWdMZuOy+3c
	Aii8ou4lPuyaXLatMWo7Tea7uxSHQDWSIN04he+wIS5vAEgm4R7xgPLrigVkvqebiuOcD2q7PD3
	iLwSHI7lvdnD+c1TIOnLAqQn3NUQyk0ymbfCZogpmHG1zzVnsPRqrrAIMfiXc2MRjcJYjEXo+7I
	oZGXEp144ud5SnRDjxBhrZDeD3MP+hNsqQmZ0fHgV5QVAvFqP+fdcGXwB38YxFEjrMfHr/Qc5wz
	mU=
X-Received: by 2002:a05:6820:1c93:b0:6f7:9b00:9c54 with SMTP id 006d021491bc7-6f79b009e85mr881759eaf.34.1791806695182;
        Mon, 12 Oct 2026 05:04:55 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f634860481sm2492881eaf.13.2026.10.12.05.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:04:54 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 12 Oct 2026 05:04:36 -0700
Subject: [PATCH net-next v2 3/4] eth: mpnic: count Tx queue stops and wakes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-mpnic-counters3-v2-3-8afba81c2d5a@gmail.com>
References: <20261012-mpnic-counters3-v2-0-8afba81c2d5a@gmail.com>
In-Reply-To: <20261012-mpnic-counters3-v2-0-8afba81c2d5a@gmail.com>
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
index d5185e64f804..931e1031a180 100644
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
@@ -697,6 +714,7 @@ static void mpnic_aggregate_ring_twq_counters(struct mpnic_base_stats *base,
 					      struct mpnic_ring *twq)
 {
 	base->tx.dropped += u64_stats_read(&twq->stats.twq.dropped);
+	base->tx.stop += u64_stats_read(&twq->stats.twq.stop);
 }
 
 static void mpnic_aggregate_ring_tcq_counters(struct mpnic_base_stats *base,
@@ -704,6 +722,7 @@ static void mpnic_aggregate_ring_tcq_counters(struct mpnic_base_stats *base,
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


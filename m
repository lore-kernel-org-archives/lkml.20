Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB5741442F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345763; cv=none; b=UW43wo+ADcrgQa44pBnR9ncxmknEgXbP45fAkdHW6zGGnFUIZjP2ohF8nVjsTOo6RYacjIqFZ59xDg9ph8NKQUkrCc8OOsYnKBigAtqFIG+pfC2LbOzCxy98sgEmUkDnCJvAjNqpzreINMGzRtoHCfez2hDFLE672v3h7GRlL68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345763; c=relaxed/simple;
	bh=pim3M58UFmkJsoEIxj0/ekTdPpwZBDH5uEI693BOkR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahWMQS/KncxLvf17+O2eOE5qBbVRgPKkjVLxr9s0A1pdbIpJCDga0fn+VuQV6yhEdB9dOInFnu3b48jd+bIHwX9LxlqhBpJgoLs/8ZxL/qAHDGgunbnTPILVbPsLSPQKyi4vZBrO6WdN3KZIpcVeSrnHnoHrRL4bwIlAsJVMg+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=QWXE3uxL; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="QWXE3uxL"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c418e215671so161273766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345760; x=1792950560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXMAmZymA97+atQA0fvJYHm18oUeUxxR7xGhCvjS8eo=;
        b=QWXE3uxLD9S9rLze6j9PZZMTlIf3PuoI0ufFqVTf/TcuAi5gC+Pere4oKllARgkxnF
         0egJ7SqhULi03pM4kLcIHuxbMhmLoPNcWVFHtZmm7+J880WtrNWeXfxNisGZjjfKUYnL
         5eFFMV8B36AyQs5dPJAaJ6VwAbiNvTtSutPZiiTeRoApVUcRoBvXHvBF3dJDrcvteoVH
         OGgJHMKW69naoABHHctjQ/e8RBS11/AXswmWAQGh/ummnETVWKZmF6Z/T75CY1sWnxeg
         dz9WkBkdqG/QLxAkGG8rC5ryZu5Isa21USl830Oi5cwT6eouAuw14kRxjaRSlIqIEkVp
         p2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345760; x=1792950560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXMAmZymA97+atQA0fvJYHm18oUeUxxR7xGhCvjS8eo=;
        b=yuRO0x2M5bEMEiVxwu08+pzut7zQDsVnqH9tSy+5gyliQTSjJNMM3PjTDoVgjVfYJZ
         YKJZKnusCgl+8d1akgdYe06ze/92RLsHV7uYxgwHgYZjZ5dCaip91hctxFkPRqdcn9c3
         OD34zylUotJN5DJjVxF2JNUJzeDuOlneUDmw28V6CgWklspKjot3EOHZHSbwdhq+Wkra
         oqbjf63tT1vIdmsNYPlF4UVGunKYI1Wlkl8bfbZyrYhJLEjaRe8wsSisiqgdp1VvwdDr
         SlTJYCQTyt2wJWSjjwNv3iRA7d163sJPDdiCk3sXE+2VtmN0Yo4VGBtyQILHvV6CZsAS
         lRKw==
X-Forwarded-Encrypted: i=1; AKwUvBzeud6P6I+3QJ/pCtW5a+e3T0uCay6umkytVYu09yUbrXYjYuZPmGgR1W7W9AG/GAPZZD1dgF1m1uhqAIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrQ4H0FZvDrKjUnI6NPb3OxWzJ8E2ns2Vvb/AWtL+p6Dj4KmHW
	sdrM2Vy53HAUjn8P6lrUWHneoqcTsRL1yZKYJvh5SyvF0xNujTUAaTa8IKRV3Pi+zg==
X-Gm-Gg: AYBFou18kOrmTFYrnQKOSEO4wYqxko6/LIy6rFHZVHliUrX4wyo5J6SdB/QLND+Yft1
	crmvsTR/sEXz269CL6ITZTra8mBVOqCG/g+jsstGYoNUj3IkYv4YJ9fKkSyrYZMyd5L6Y9tNdC+
	lXlShBHq6PRyHqt8SDwfqISwNRf5t3ccAL926FgQ6+zzgUwcSJSopyJIqpO0q9udYqHzSNJLb1F
	xp6w0R7aeRr0P0mMl0AxKbOhvhkDJM/L/DsqtPGnuxkXHPMP93k9Arq3aGeMTUCo/aRpvuYpzDo
	euXy+rEZAriE4WCL82rdb9SLbG8s30hdZQQrbJR8yAz4YDVJhHEW2ZUqma8lW+UmvBvU/I4Auv9
	rICkOOTNFC9/8I9KDiCGsrgKbNRqslVOwjx5y7WZnVVfmuMzqlFlwo2t0Ce3w7uuYeta2nOhOd5
	GFH1yeCs6hWLzDhkBMoD9KrPSdXMqqESbqI5OIREwh9SRoypZRQnrZRMMCrIMTNSEKvGeD4HXZl
	KcIazflG9rPrzZiukJFU2faGJyobMdxEpphAXIQzy+9zF/nE4cfhPcKTQ1z8foE+PypY0q+krUY
	Gvnr9/7Xc9HgNAaGfQFvCEXEZPoH+2gh5eYmitK+qICyS6AZB7LlgICnkabRo5yqkE1L4E6Ly8A
	ER2OYzLscV7T8MPHM8MAnDQ6wx3PfKhtx+hHEhO4SzdbRC9uf7navOnXDrMiRnGapg5AKgSG6Np
	gJiOeNLGfH
X-Received: by 2002:a17:907:6d28:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c419d34faadmr385413766b.9.1792345760009;
        Sun, 18 Oct 2026 10:49:20 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:19 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: [PATCH ath-next v5 6/9] wifi: ath11k: run the TXQ scheduler on tx completion
Date: Sun, 18 Oct 2026 19:49:01 +0200
Message-ID: <20261018174904.1757161-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A station at its airtime queue limit gets airtime back only when the
hardware completes its frames, but ath11k starts a round only from
wake_tx_queue, so the backlog waits for the next frame from the stack.
Start a round for each access category, taken from the frame's queue
mapping, that a reaped completion belonged to, whether the hardware or
the firmware released the frame.

TCP download from a wired host to one 1x1 VHT80 station, BE
aql_txq_limit 500/1000 us, 20 s, three interleaved runs per arm, sender
RTT:

                    Mbit/s              RTT mean ms   RTT max ms
  with this patch   94.5, 94.4, 94.6    68, 62, 67    126, 135, 121
  without           74.0, 78.5, 72.4    28, 27, 27     55,  40,  40

Without it the link idles between arrivals, which also lowers its RTT.
At the default limits both arms reach 88 to 95 Mbit/s.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_tx.c | 33 +++++++++++++++++++------
 drivers/net/wireless/ath/ath11k/mac.c   |  7 ++++++
 drivers/net/wireless/ath/ath11k/mac.h   |  1 +
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index f7d3cf0ff0358..5bcdeeb7e65ad 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -286,7 +286,8 @@ int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 
 static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 				    int msdu_id,
-				    struct dp_tx_ring *tx_ring)
+				    struct dp_tx_ring *tx_ring,
+				    unsigned long *push)
 {
 	struct ath11k *ar;
 	struct sk_buff *msdu;
@@ -307,6 +308,8 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 	dma_unmap_single(ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	ar = ab->pdevs[mac_id].ar;
+	__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
+		  push);
 	ieee80211_free_txskb(ar->hw, msdu);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
@@ -316,7 +319,8 @@ static void ath11k_dp_tx_free_txbuf(struct ath11k_base *ab, u8 mac_id,
 static void
 ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 				 struct dp_tx_ring *tx_ring,
-				 struct ath11k_dp_htt_wbm_tx_status *ts)
+				 struct ath11k_dp_htt_wbm_tx_status *ts,
+				 unsigned long *push)
 {
 	struct ieee80211_tx_status status = {};
 	struct sk_buff *msdu;
@@ -339,6 +343,8 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 	info = IEEE80211_SKB_CB(msdu);
 
 	ar = skb_cb->ar;
+	__set_bit(ar->pdev_idx * IEEE80211_NUM_ACS +
+		  skb_get_queue_mapping(msdu), push);
 
 	if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 		wake_up(&ar->dp.tx_empty_waitq);
@@ -390,7 +396,8 @@ ath11k_dp_tx_htt_tx_complete_buf(struct ath11k_base *ab,
 static void
 ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 				     void *desc, u8 mac_id,
-				     u32 msdu_id, struct dp_tx_ring *tx_ring)
+				     u32 msdu_id, struct dp_tx_ring *tx_ring,
+				     unsigned long *push)
 {
 	struct htt_tx_wbm_completion *status_desc;
 	struct ath11k_dp_htt_wbm_tx_status ts = {};
@@ -415,12 +422,12 @@ ath11k_dp_tx_process_htt_tx_complete(struct ath11k_base *ab,
 		else
 			ts.peer_id = HTT_INVALID_PEER_ID;
 
-		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts);
+		ath11k_dp_tx_htt_tx_complete_buf(ab, tx_ring, &ts, push);
 
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_REINJ:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_INSPECT:
-		ath11k_dp_tx_free_txbuf(ab, mac_id, msdu_id, tx_ring);
+		ath11k_dp_tx_free_txbuf(ab, mac_id, msdu_id, tx_ring, push);
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_MEC_NOTIFY:
 		/* This event is to be handled only when the driver decides to
@@ -694,9 +701,10 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct sk_buff *msdu;
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
+	unsigned long push = 0;
 	u32 *desc;
 	u32 msdu_id;
-	u8 mac_id;
+	u8 mac_id, i;
 
 	spin_lock_bh(&status_ring->lock);
 
@@ -740,7 +748,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 			ath11k_dp_tx_process_htt_tx_complete(ab,
 							     (void *)tx_status,
 							     mac_id, msdu_id,
-							     tx_ring);
+							     tx_ring, &push);
 			continue;
 		}
 
@@ -756,12 +764,23 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 		spin_unlock(&tx_ring->tx_idr_lock);
 
 		ar = ab->pdevs[mac_id].ar;
+		__set_bit(mac_id * IEEE80211_NUM_ACS + skb_get_queue_mapping(msdu),
+			  &push);
 
 		if (atomic_dec_and_test(&ar->dp.num_tx_pending))
 			wake_up(&ar->dp.tx_empty_waitq);
 
 		ath11k_dp_tx_complete_msdu(ar, msdu, &ts);
 	}
+
+	/* A completion returns the airtime the frame was charged, which is
+	 * what an airtime-limited station in that access category is waiting
+	 * on. The arrivals that would otherwise start a round are themselves
+	 * queued behind that limit.
+	 */
+	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
+		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
+					   i % IEEE80211_NUM_ACS);
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 226e1417ffe74..4527ab6977d04 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10156,6 +10156,13 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	ath11k_mac_schedule_txq(hw->priv, txq->ac);
 }
 
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac)
+{
+	rcu_read_lock();
+	ath11k_mac_schedule_txq(ar, ac);
+	rcu_read_unlock();
+}
+
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
 	.wake_tx_queue			= ath11k_mac_op_wake_tx_queue,
diff --git a/drivers/net/wireless/ath/ath11k/mac.h b/drivers/net/wireless/ath/ath11k/mac.h
index 127cb476b44b7..b78a357b5472e 100644
--- a/drivers/net/wireless/ath/ath11k/mac.h
+++ b/drivers/net/wireless/ath/ath11k/mac.h
@@ -161,6 +161,7 @@ struct ath11k *ath11k_mac_get_ar_by_vdev_id(struct ath11k_base *ab, u32 vdev_id)
 struct ath11k *ath11k_mac_get_ar_by_pdev_id(struct ath11k_base *ab, u32 pdev_id);
 
 void ath11k_mac_drain_tx(struct ath11k *ar);
+void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac);
 void ath11k_mac_peer_cleanup_all(struct ath11k *ar);
 void ath11k_mac_tx_mgmt_pending_free(struct ath11k *ar);
 u8 ath11k_mac_bw_to_mac80211_bw(u8 bw);
-- 
2.53.0


Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8625626A1AC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875618; cv=none; b=qE5VHDLyHdn+PVDhMxA2Bf8cx3FDQU3jmQ83YkviiWtMrO+f4NR+wHlcuWU9Sp5y32UwIT0pqsbl3E1K1UrjWbc5zz4Zj2jDIj4gLCxWOjiTf6D7E7YoC5gsNSSUzR3VkGbo7eaxLs+xHcBIFhGfobQFmWVu62B4zYf64NAXlWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875618; c=relaxed/simple;
	bh=tWeMJdyya94Pj22O2F78rknlFlco4Dn7ExL7y3l21O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqFcdKDIdxCKCjiD9ynlVsCeIgPWMCOx9ADswUAQWJS+FyDl9a45x568ztzQ0GtgqQ9GJsC4RWGQOTVlYEaQ46k8/wk53qTDIlWXqb9+yjDrOeP6rFx6LFw9Pyvxg6qNfieToskKRR4k2Lz1QeT2H/f/tZGVL5Ch016gZ3aIqf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=PEjGgaYv; arc=none smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="PEjGgaYv"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c15be76348eso177211466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875604; x=1789480404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pS1WN+VaDUT/SQWzxBVX651q3Q/xVMNypcReV8SLoo=;
        b=PEjGgaYvm++KCbWM+BRGWfTHFse+1lH73ilN2jDwTojxqTKx/cJsYVGADiGOa1NfJF
         ymeFH/chFOtk0rdpGIqbLpH3+hQErRNlaDd+XBF4dhNndCTvqKm08xSExe39YzxIZ+Ac
         K4JKN1DU7Xxikt/HnH2qRq+W8WxhLtTkNV590EnQDB11U/joLsf5CqiRcOoq72Wd+qBP
         CETGY9VvSNfWePRVfVWmiGf5N/iQtYvTINvCtZhH32n3hWWdlWpK9feArQvlDbWAlpii
         F02Q5UaDzb6fq/dvDVQx72tQk5LKKeMAOygij9WsfD/JpxL1DWWI5pmCdiHixA0eAV41
         fIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875604; x=1789480404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pS1WN+VaDUT/SQWzxBVX651q3Q/xVMNypcReV8SLoo=;
        b=eSMY0w0Is1DXft7EuQXLzDXtmjv0NDOCzCIaH1ncvtaL3LpvT8CjeRp8hYpUPGhdv+
         1V44N9KATpDhDCWZRwRTyAI5AhnlIWFA67R2sW47T/DjcF+Up+rauo30jJMwhKHLlVpq
         KC1aKzG5ENcOwnLIL1bTIezbqa1U7/L1oau5FIFn2iG0UY/h3RH1jsoqBoOdDPucBf1F
         KnT+hLNfsaSKVpSLLcceFaph/bdIsnmZWb06V4HYjxHFUnMm0GAHvqkeFpQY4WaIDc6+
         CySfrs2o6WCfKBZtuZhLIsM2+O1RJPYOstyMwYoqW1NHsh7KZdzfhwSLx92tsNFvexd9
         HlYQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4mH19VlQeGu2w7dURaUXqT235UbmRkRiHzFUiHfr7uLchPODFwa64QTZ7H8Za9U2QCn0QPOdrKt3cH2E=@vger.kernel.org
X-Gm-Message-State: AFuF++nK92P9TqhIU+CH0ZrtrhdMWo2EhExzy0JOCbkuiabtkXVDg/96
	SLTt5X7zD9MQ2AwjMv0xsh/jnDsvaWnGkqM33StxEgx7RR727rsq+YOQprxVbpM3xA==
X-Gm-Gg: AYBFou0bfVTryvcI7WWXOX+xCvAjCJeTrN+UMbDRXfx7VBA5YMy5GkHR5ASzjGKllPl
	u4oOzAl+e0ACrN5vzuCa1fyI0KK8JZbX00R5vwbnlcSQNs1nkcGqjGJGMEoMxIy4f37rTrB2qeM
	KLUiZvsWC/vNDsY7vrlzgtnfOE0rM2mwzkkTZPWuNH42aG6nUFa3VAjcSYxlYV9N/FL5B8jYwhy
	0vjETyWQVqZzV6eer2zy2flm+sVBoQA8OdXTYrKvvw/mpCks1KQSWP2KA09HJM8QmMC96NOUnms
	cNGc+N1LsjlPeVrZ5xomB5YjkhsBJsRpoUFBGono+cfbC7NN/6CCos5wJHUdeEDMflQmOP0kKja
	vj7uC0cMRmKgT1S9waUO8ZTtxLSnYllKHCt2SZOZtKUvqkKsj0CGXi2u7eHASXMRv7WPvnjaSy/
	AYndmzI02EVInoE83hbRZI5k6WqUfA8BIlC6E5jmBvuOxPtqrxFYJhTKwvSch5B7MZYnE4pkuWE
	jt2jY6ngE8Sqkj4lyLL0By2Mys+yuCh/RMKufNnqAwYyadQDzNNkzFv2Y55EzlZ+XpyQOCkU36J
	6IVKM6vvX2oa9D0cYmlY8sV6295P6zqjAyDFgQldTQyFFDFQOhy36rMtMEr+JAulbXzXxfDbNmi
	nfW4YdqiYKeNdltYpRqPsngGEOxDTiFruxKQfSYt2Q1lfXRPOOVPzhSB84IPve6k9x2H7+Cf6Zc
	MHXybQIH4eMKgK
X-Received: by 2002:a17:907:e00c:10b0:c26:19e3:e98e with SMTP id a640c23a62f3a-c2619e3f021mr646105566b.46.1788875604154;
        Tue, 08 Sep 2026 06:53:24 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:23 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 5/9] wifi: ath11k: schedule TXQs from the driver
Date: Tue,  8 Sep 2026 15:53:14 +0200
Message-ID: <20260908135319.754140-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908135319.754140-1-julius@bairaktaris.de>
References: <20260908135319.754140-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ieee80211_handle_wake_tx_queue() has exactly one entry point, the
wake_tx_queue callback, so a round starts only where mac80211 calls that
callback: a frame arriving from the network stack, a block ack session
starting or stopping, a station leaving powersave, or a stopped hardware
queue restarting. Every round runs under
local->handle_wake_tx_queue_lock, which is shared by all four access
categories of the hardware.

That is the wrong shape for a driver whose only backpressure is the
airtime queue limit. When ieee80211_txq_airtime_check() refuses a
station, ieee80211_tx_dequeue() stops handing out frames and the
station's intermediate queue keeps its backlog until the next enqueue,
not until the airtime it is waiting on comes back from the hardware.
Returning that airtime does not reschedule anything.

Open-code the round in the driver so that a second context can drive it.
The walk is the same deficit round-robin over the active TXQs of one
access category that the generic handler performs. A selection ends
where the airtime queue limit binds, because ieee80211_tx_dequeue()
applies the limit itself, and drains the station's queue where it does
not, which is what the generic handler does today.

mac80211 documents that a driver must not run concurrent scheduling rounds,
and the next patch adds a second context that starts one. The round
therefore takes a per-category lock rather than the hardware-wide one.
ath10k and mt76 also drive the round from the driver; ath10k takes its
per-category lock on the wake path alone, and mt76 serialises instead by
running its rounds from one per-device tx worker.

A custom .wake_tx_queue with a tx-completion driven push was proposed for
ath11k once before [1]; the design was right and the measurement that
justifies it is in the next patch.

Link: https://lore.kernel.org/all/20230501130725.7171-1-quic_tamizhr@quicinc.com/ [1]

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h |  5 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 44 ++++++++++++++++++++++++--
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..40895d276de5 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -709,6 +709,11 @@ struct ath11k {
 	 */
 	spinlock_t data_lock;
 
+	/* serialises one scheduling round per access category against the
+	 * other contexts that drive it
+	 */
+	spinlock_t txq_lock[IEEE80211_NUM_ACS];
+
 	struct list_head arvifs;
 	/* should never be NULL; needed for regular htt rx */
 	struct ieee80211_channel *rx_channel;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 40a2b6d2f804..342b38308468 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6546,6 +6546,43 @@ static void ath11k_mac_op_tx(struct ieee80211_hw *hw,
 	}
 }
 
+static void ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
+{
+	struct ieee80211_tx_control control = { .sta = txq->sta };
+	struct sk_buff *skb;
+
+	/* ieee80211_tx_dequeue() applies the airtime queue limit itself, so a
+	 * selection ends where that limit binds, where the hardware queue is
+	 * stopped, or when the queue empties, as the generic handler does
+	 * today.
+	 */
+	while ((skb = ieee80211_tx_dequeue(ar->hw, txq)))
+		ath11k_mac_op_tx(ar->hw, &control, skb);
+}
+
+static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
+{
+	struct ieee80211_hw *hw = ar->hw;
+	struct ieee80211_txq *txq;
+
+	spin_lock_bh(&ar->txq_lock[ac]);
+
+	ieee80211_txq_schedule_start(hw, ac);
+	while ((txq = ieee80211_next_txq(hw, ac))) {
+		ath11k_mac_tx_push_txq(ar, txq);
+		ieee80211_return_txq(hw, txq, false);
+	}
+	ieee80211_txq_schedule_end(hw, ac);
+
+	spin_unlock_bh(&ar->txq_lock[ac]);
+}
+
+static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
+					struct ieee80211_txq *txq)
+{
+	ath11k_mac_schedule_txq(hw->priv, txq->ac);
+}
+
 void ath11k_mac_drain_tx(struct ath11k *ar)
 {
 	/* make sure rcu-protected mac80211 tx path itself is drained */
@@ -10067,7 +10104,7 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 
 static const struct ieee80211_ops ath11k_ops = {
 	.tx				= ath11k_mac_op_tx,
-	.wake_tx_queue			= ieee80211_handle_wake_tx_queue,
+	.wake_tx_queue			= ath11k_mac_op_wake_tx_queue,
 	.start                          = ath11k_mac_op_start,
 	.stop                           = ath11k_mac_op_stop,
 	.reconfig_complete              = ath11k_mac_op_reconfig_complete,
@@ -10757,7 +10794,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 	struct ath11k *ar;
 	struct ath11k_pdev *pdev;
 	int ret;
-	int i;
+	int i, j;
 
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
@@ -10791,6 +10828,9 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
 		pdev->ar = ar;
 		spin_lock_init(&ar->data_lock);
+
+		for (j = 0; j < IEEE80211_NUM_ACS; j++)
+			spin_lock_init(&ar->txq_lock[j]);
 		INIT_LIST_HEAD(&ar->arvifs);
 		INIT_LIST_HEAD(&ar->ppdu_stats_info);
 		mutex_init(&ar->conf_mutex);
-- 
2.53.0


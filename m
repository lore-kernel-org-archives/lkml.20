Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD43343030D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345761; cv=none; b=oGyKohqER8IiMkGmeiBwSqh0Ca99rGSSUzXwEG5mdU1d39m8tsIC6acBN8k9o3auL5ejeu/GmdWbYIngHnzA8xQmdMkz73CldWAgQL48j3wjSyuDykFJa1NwkiO8JcZTlOxBxOXK6dgkaVN0YHWBkRj/0chnMiFlFkVJB0cC4p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345761; c=relaxed/simple;
	bh=Clm/EBv9b/45SKqfVbHrUUJsdOEqKjm4RWwwbn04sN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRsvIbk5170X2Na0GOCUVetF4pvVkpLRLYVvizBwCGMhejDUnqwIFYQr8yruqsb83W0LCa1Egf2BureJ/DSww7exkAjFWQ38CIG7ATsvlqYZoIWS0iikKVMN3VL/kfuUFW6bYRksVeUe7e46oY9MvUum5jTKgYa1ZyzNirfa3Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=CEIji4yJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="CEIji4yJ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso189934666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345758; x=1792950558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l49vYvw4c7WVjhiBreGzHpWeFIjvw03pd6v6/6nv5IY=;
        b=CEIji4yJVdeh55nL/3utDPZH3Vh64bHbqG5WEo1rnurqLCHK2+ML1AyBZYTOqMe5w9
         Y7EotfKMlDzbqr7+jK6rFkNCFTrzBUBQW7HxZP2ViZ/5ESd2xff042cNNJUjqQO5eko/
         cgSAyRoyMSB7EAWvNU/zbrG2eMqIb74plcvLO7zDt8j6IBG+MK8CVxjAVfJgH8WqwOXS
         OFG1kx0wm93YOs5sE70SsxRbDYYm86DngxoTaaNvviJ6LJBUhjd/HO34nOL+i32N/CTI
         9aTBTmbvqkxCYDGMRSvK4HbkdHEbVjz/HhXLholPgi3h7RvsBHqO4hsRwK4wdefJwC8n
         cQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345758; x=1792950558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l49vYvw4c7WVjhiBreGzHpWeFIjvw03pd6v6/6nv5IY=;
        b=HF5x5rSBhZ83MEnsDXVWtVVXW2rtRtZmTJV4PUF/D8Lih1ah+Aux5/vdN0df1VTxc9
         /V3gOxF0sCAIFV6hkqcOPE+nQ3Nkm6brOnGcu+mj615McHds7W6now61m5l9e7X7/MDB
         oVOsZtiFKUkYsKtmx4Kt/kdu4B+HGi6Me/G1yyTl6wcQTqS1PLWGlrzc6jb1XNC4rxCZ
         +bWEIyTC80wTx3vB+OEEGpnu7jqCMsVEK5E7mK1X/BrsIiuXT+OBsbJxNgYAmTIffugv
         WiLwBs+HgRz77D5Sv1auSp/evC1uQcM1vCRQp7xwHXqpOGPvQTq9P0OxPkMSgRQPTHyE
         4u1w==
X-Forwarded-Encrypted: i=1; AKwUvBxzh9PJIPTZQcyJTkY1MGTHEgRnKSlNf8pCTZF5UjSYOTlg/nO5l5Hm4TQJYqE8EvWE4gyjYwzRsY/J5Bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI9NhcgYpYut6bLUTz9OIbcm0ySEFHykhpWt+qSQfbcgP6NNdo
	BUPuizkXEnKBWSi2MivxatVQ/yK6Xw5gPVEk7XMp1v8yAwSkZJO3x1cC31zE6fc9JxUMTmCUqgb
	Lf/Pacy7h94E=
X-Gm-Gg: AYBFou0BHIq8Xd3or6eSvRl99sII7UZom/uhSl38NopuR+po4iU5rHdHz1iZB99fyt4
	ToSR2ka+gYMZmQgCYFjutwXIyFF3RkHluA2av4BpbMMb84UKuiy7y+ajXlxyBmk7cuRIv80vCwa
	9NNvw2U8hc5fEUU/SWKkqWsQ+DIt5/tATmFT3GZrpsLCxpUZxkN2cTozVHGULrTmbUzBt19Ho8x
	u40bFJ9pMRCRWpvIFK5fzVIASBSCZfhJR02X+K83RNQrEGAoTOs+8LgtzHbMs5imMipr/hcQAcy
	kfEgQw0XrhTdJCbstNuHcZdqDOgRXcOEW8KiPI6yLbVORPFxoO4GeJkqU5qqahaGH8OIvaNZbaC
	PRVo6xXA1POO5UJnyvGUq6SjY+FqgTFyCYV7R6vN6gvfEQwoCWBMCNwMhO+QYF8E/WUQ9WQDSC4
	D/tElhGJOdObDZsu0WkvKZVR9+r+QT8ZhgUVicVpdA12Ujoay8bMJJVEXqMOTP6TUSALPilaxe/
	otsvF5S0MDYh9gdn1b5AhvY8r9r2aXqXzm7aC2LraBQPkJgaKoeZ2SZFwbW6bpby1PXCcrzSb1x
	pW3H8zR5oWpDJlroGcINB/iIqLymB8C69wxHMvijK7eCu9ZP6k0hxP5UIZShSMZ7O3oFALymviY
	9RW3dh9VYJBlMIU0mMi6yE+iZh2QFOj2JEE1odQbHDEWDvtuoCpTXpm4sIT6B0QlRInPH/YELGH
	vXWpU3bD99rrU9mIvFHlg=
X-Received: by 2002:a17:907:c310:b0:c40:231:6eab with SMTP id a640c23a62f3a-c419d540a7bmr350811566b.16.1792345758054;
        Sun, 18 Oct 2026 10:49:18 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:16 -0700 (PDT)
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
Subject: [PATCH ath-next v5 5/9] wifi: ath11k: schedule TXQs from the driver
Date: Sun, 18 Oct 2026 19:49:00 +0200
Message-ID: <20261018174904.1757161-6-julius@bairaktaris.de>
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

The wake_tx_queue handler serves only the txq mac80211 passes it, so
there is no deficit round robin between stations. Run the round in the
driver: walk the access category's active txqs with
ieee80211_next_txq() and drain each through the TCL ring check until the
airtime queue limit binds or the queue empties. A full ring ends the
round, since all txqs of a round share it. Each round holds a
per-category lock, as in ath10k, because mac80211 forbids concurrent
rounds on one category and the next patch also starts rounds from tx
completion. The design was proposed for ath11k in [1].

Link: https://lore.kernel.org/all/20230501130725.7171-1-quic_tamizhr@quicinc.com/ [1]

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h |  5 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 44 +++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..40895d276de5f 100644
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
index eca16a151d068..226e1417ffe74 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10078,13 +10078,12 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 	return ret;
 }
 
-static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
-					struct ieee80211_txq *txq)
+static int ath11k_mac_tx_push_txq(struct ath11k *ar, struct ieee80211_txq *txq)
 {
 	struct ieee80211_tx_control control = {
 		.sta = txq->sta,
 	};
-	struct ath11k *ar = hw->priv;
+	struct ieee80211_hw *hw = ar->hw;
 	struct dp_tx_ring *tx_ring;
 	struct hal_srng *tcl_ring;
 	struct sk_buff *skb;
@@ -10097,6 +10096,10 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	tx_ring = &ar->ab->dp.tx_ring[ring_id];
 	tcl_ring = &ar->ab->hal.srng_list[tx_ring->tcl_data_ring.ring_id];
 
+	/* ieee80211_tx_dequeue() applies the airtime queue limit, so a
+	 * selection ends where that limit binds or the queue empties. A full
+	 * TCL ring ends the whole round.
+	 */
 	while (1) {
 		if (unlikely(test_bit(ATH11K_FLAG_CRASH_FLUSH,
 				      &ar->ab->dev_flags)))
@@ -10110,7 +10113,7 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 
 		if (num_free == 0) {
 			spin_unlock_bh(&tx_ring->wake_tx_lock);
-			break;
+			return -ENOSPC;
 		}
 
 		skb = ieee80211_tx_dequeue(hw, txq);
@@ -10123,6 +10126,34 @@ static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 
 		spin_unlock_bh(&tx_ring->wake_tx_lock);
 	}
+
+	return 0;
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
+		int ret = ath11k_mac_tx_push_txq(ar, txq);
+
+		ieee80211_return_txq(hw, txq, false);
+		if (unlikely(ret))
+			break;
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
 }
 
 static const struct ieee80211_ops ath11k_ops = {
@@ -10817,7 +10848,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 	struct ath11k *ar;
 	struct ath11k_pdev *pdev;
 	int ret;
-	int i;
+	int i, j;
 
 	if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
 		return 0;
@@ -10851,6 +10882,9 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
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


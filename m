Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506208;
	b=qIN0+Kh43NLLJ4zwR3X/HzWY6AFwFPJI6FqXayIBrxxVXlqwnmJZX1iHujOrUR6WVob3
	 MBSFwBYdkl3F8ZSx4hqyu+nSSqAx3qnOF7W7qxfr0fajQFH3mQmU5SIK6w2+/58VM6Uza
	 OCvK6758crGQc9lED9f/RSENsbNFT5TIpzireK5qjFDR8BJkjqb0fsgALl3z5s0FY6S1a
	 DOc63adxK+hdjvpCLFVw9fREa2l+nkpy3JKhFW8v9iYbOkCvbgiEEJRXgSv2MIiTYDGgx
	 PEkPwuRjAsuTk26c6HBjqoctqV+PguJl93d13SurBf2kH8c/6Uq9coskYj+cleiZLgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3wIm4YG5YTs5SCnZuWti0ur7cF4MpcSiaNujKUCPewA=;
	b=1M2HLGz+5jDjjt8pjg9PdhSxq0+pEqAmeBoueVzlXJUCmRdTwmQ78wAgAlxrgTxDqln6
	 qH4SKZSKnBqlC0SG+rzxDVA7rqQLuJLPGvL/QxRfwS+TzZQhkMTQUFcytYUWwE1E+mHbX
	 EvNSgyckhtIi+blnmk6iEPaAJ4jJUqkI600pOdARyalGTw5Y8ZJGC2rW0RUTlz11Dcwg2
	 ENwei4ONmUIy28Uh26bnrQR8g0wPlACv1P4sueS3nF7nb3ZRq0J5GAu2b9/oDxk9I7RWz
	 69+u980nNETHRZaP12NHcIeqC5QX/vekrgVobzye3OhjVQZOFFsdS1RcgWmyLZiW9Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lQ2/s6Cl";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F2D60A2623
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39F2D60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQ2/s6Cl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b001cd92bso15715f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506207; x=1795111007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wIm4YG5YTs5SCnZuWti0ur7cF4MpcSiaNujKUCPewA=;
        b=lQ2/s6Cl33XsyCyF27w3eyHqmufAD0KHzqu5nL+iUpWS67tXUGNNWySAMcHeXmc6U6
         IlyN5wHZA5fyYowqHM81jezUufltq1pm/WEs8oK3AKJt1kk3mRnra/mpDRCSxZTPZl1m
         NWQv4dSfNaqrxiKZ/tfP67pPqIE3Mpfrd2fbC6SEuSvusSIV/No1uXvIVf1vITGg3aSm
         sJITIlg4oZR8777KdW+uW03M/PoVN83BPb/YyRdLUL6ixGnNYg+nvSunPiUZlVcPll79
         HrMgEMQJKxHU2D+brejsuHbSDtClgAYoWvCIhiBxng21vp3tbHdfLvJdwcuLJqyVXlKd
         /GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506207; x=1795111007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wIm4YG5YTs5SCnZuWti0ur7cF4MpcSiaNujKUCPewA=;
        b=ckJp5UIFimetBXQjcSo0BTo/QvvC1B9j+aRmda9+SSCXbLYhK8NZkxIQ52iYo3OfUK
         NgsZzdaths/6CnSZens3glQiYmdk5eAQxwrVCOAF72Kc9+62MfyJWe/vT1EjQbk2Xh5B
         gejekdkABZBVRpFJwpcn3B1RFBsJwbd3QaBndlKE7wfLuT+04tSBwoTbQsHqH/gOHty3
         I2GMstJmWPCT7Jsgs0bWc71ic5Jn9xJBni1+NCRqOZnipa1u36jaqsH9SYL8xpvpcu3S
         77F3oB0yKFdye1+0XfY3CqHVOJKp9fULQURtjc6zOcNztoXBemCKtDOE2bMebtopKzmZ
         9pqA==
X-Forwarded-Encrypted: i=1; AL+hErGXL/71xaDDA+WOJ5Q6nZDAfXuRgJ+zpI9qC+mth3yolyKAG4govQPPuPPIW0gVTqE85LG/q91dp5HjdzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z96YzY6sjZXByVJfX9vVYiUfDQqGEQH7QS3C1lh8M6b4VTprpOy
	PuIaYehAX5ceRoYQzC0+dEXpZK8S9YpKotyPAuitoXVTRN/XB4C6zhGj
X-Gm-Gg: AYBFou1AWqjTqlt/YgvjR1qcf/Pvu9eEmViQW3z11gBsVxSqxGy223p421ik0aryM5h
	zng8kTrRJfs43dwd7sAXOwaR+PQFdQoAvvqOya0ITF0wQS55I7e4LfL4ffnE5+0hnmqd7JunU9l
	JoKqUsmWz2NZO5mLTvARhFqsfCK1fWYIavZFKfyRGAHyYkn/67fTHety6U1zkTmthZI//XckP3i
	A9cdzL7lM6Yf5pHzQ+P8oFIkBUgel/GHfpcX6EdUMFj5AEiNbvuX4DsoWV7BMxJAuJ+kveptfvs
	BuO8PL8Y9T4nW4OP4dn3lqgljf30Pd3tCo+uIwSyyojDi/p5QHnFRqS0fDRd09JqtQCulh+1dCG
	JLJ4Cb9xQlXpBwnq399ztQeCmr3hm3zaIZyoegPtRhkKwabOwKorlMpyrTmaRZQ+KZtLZsZ3bw3
	CMV4IyNUsJ1nvQOMQwKsDAZHiURg6BNdnTm0lUPPPKOoa434l9/K/Ux3w93TprSkYYt4UN8y2NL
	iy4GQILKFPEFhvVXVgIwiyKlySTXRnSWrodcONcZjfytpU0MH/WMubamgPWAuvNs7vyI4goJbI4
	rABGM6w31cxdyaeZN8wz6/kT8fIDmGqhl6ctQR2uvdTFGASh2EXbig3iagGG4n/13m9Qi5thWMv
	BsofwljLXiSeFpyQuWPPXgSftFsHPXtpXBeRladWN0HwrtD6qnLwrC86PACZAIxWeexAnqUir0j
	VU7SZdtC2pGoCAn9o2KtUtvCqoieLd8KSnRT6S9Ot1Vw==
X-Received: by 2002:a05:6000:24ca:b0:492:7fa6:efd4 with SMTP id ffacd0b85a97d-49c6fd933e3mr428161f8f.9.1794506206544;
        Thu, 12 Nov 2026 09:56:46 -0800 (PST)
Received: from zitrone.tail45b538.ts.net ([2a02:810d:a1:6000:900:be5c:7a9c:c176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c193fsm547430f8f.13.2026.11.12.09.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:56:46 -0800 (PST)
From: Andreas Wendleder <gonsolo@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	b43-dev@lists.infradead.org,
	Michael Buesch <m@bues.ch>,
	Alessio Ferri <alessio.ferri@mythread.it>,
	kvalo@kernel.org,
	julian.calaby@gmail.com,
	jpeisach@ubuntu.com,
	rosenp@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC wireless-next 4/4] wifi: b43: A-MPDU for the AC microcode
Date: Thu, 12 Nov 2026 18:56:40 +0100
Message-ID: <20261112175640.40603-5-gonsolo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175640.40603-1-gonsolo@gmail.com>
References: <20261112175640.40603-1-gonsolo@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The microcode builds the aggregates and sends the block acks. Accept block
ack sessions on both sides (ampdu_action) and set
IEEE80211_HW_AMPDU_AGGREGATION on the AC cores.

Frames of a session that the microcode gave up on are put back on the
ring, up to four times, with the retry bit set; the block ack window lets
them follow later frames. The cache info limits an aggregate to four MPDUs,
longer ones lose their later MPDUs.
Signed-off-by: Andreas Wendleder <gonsolo@gmail.com>
---
 drivers/net/wireless/broadcom/b43/dma.c  | 48 ++++++++++++++++++++++++
 drivers/net/wireless/broadcom/b43/main.c | 37 ++++++++++++++++++
 drivers/net/wireless/broadcom/b43/xmit.c | 22 ++++++++++-
 drivers/net/wireless/broadcom/b43/xmit.h |  2 +
 4 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/b43/dma.c b/drivers/net/wireless/broadcom/b43/dma.c
index 404f75f..ef05327 100644
--- a/drivers/net/wireless/broadcom/b43/dma.c
+++ b/drivers/net/wireless/broadcom/b43/dma.c
@@ -34,6 +34,9 @@
  * into separate slots. */
 #define TX_SLOTS_PER_FRAME	2
 
+/* Times an unacknowledged A-MPDU session frame is put back on the ring */
+#define B43_AC_AMPDU_REQUEUE	4
+
 static u32 b43_dma_address(struct b43_dma *dma, dma_addr_t dmaaddr,
 			   enum b43_addrtype addrtype)
 {
@@ -1378,6 +1381,7 @@ int b43_dma_tx(struct b43_wldev *dev, struct sk_buff *skb)
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 
 	hdr = (struct ieee80211_hdr *)skb->data;
+	b43_get_priv_tx_info(info)->requeues = 0;
 	if (info->flags & IEEE80211_TX_CTL_SEND_AFTER_DTIM) {
 		/* The multicast ring will be sent after the DTIM */
 		ring = dev->dma.tx_ring_mcast;
@@ -1466,6 +1470,7 @@ void b43_dma_handle_txstatus(struct b43_wldev *dev,
 	static const struct b43_txstatus fake; /* filled with 0 */
 	const struct b43_txstatus *txstat;
 	int slot, firstused;
+	struct sk_buff *requeue = NULL;
 	bool frame_succeed;
 	int skip;
 	static u8 err_out1;
@@ -1568,6 +1573,29 @@ void b43_dma_handle_txstatus(struct b43_wldev *dev,
 			else
 				txstat = status;
 
+			/* A session frame the microcode gave up on goes back
+			 * on the ring, as the stock driver requeues it; the
+			 * block ack window lets it follow later frames.
+			 */
+			if (!skip && !txstat->acked &&
+			    (info->flags & IEEE80211_TX_CTL_AMPDU) &&
+			    !(info->flags & IEEE80211_TX_CTL_NO_ACK)) {
+				struct b43_private_tx_info *pi =
+					b43_get_priv_tx_info(info);
+
+				if (pi->requeues < B43_AC_AMPDU_REQUEUE) {
+					struct ieee80211_hdr *hdr =
+						(void *)meta->skb->data;
+
+					pi->requeues++;
+					hdr->frame_control |= cpu_to_le16(
+						IEEE80211_FCTL_RETRY);
+					requeue = meta->skb;
+					meta->skb = B43_DMA_PTR_POISON;
+					ring->used_slots--;
+					break;
+				}
+			}
 			frame_succeed = b43_fill_txstatus_report(dev, info,
 								 txstat);
 #ifdef CONFIG_B43_DEBUG
@@ -1606,6 +1634,26 @@ void b43_dma_handle_txstatus(struct b43_wldev *dev,
 		if (skip > 0)
 			--skip;
 	}
+	if (requeue) {
+		if (dma_tx_fragment(ring, requeue)) {
+			struct ieee80211_tx_info *info =
+				IEEE80211_SKB_CB(requeue);
+
+			b43_fill_txstatus_report(dev, info, status);
+			ieee80211_tx_status_skb(dev->wl->hw, requeue);
+		} else if (free_slots(ring) < TX_SLOTS_PER_FRAME) {
+			/* The requeued frame took the slots this status freed:
+			 * the ring is still full, keep the queue stopped.
+			 */
+			if (!ring->stopped) {
+				b43_stop_queue(dev, ring->queue_prio);
+				dev->wl->tx_queue_stopped[ring->queue_prio] =
+					true;
+				ring->stopped = true;
+			}
+			return;
+		}
+	}
 	if (ring->stopped) {
 		B43_WARN_ON(free_slots(ring) < TX_SLOTS_PER_FRAME);
 		ring->stopped = false;
diff --git a/drivers/net/wireless/broadcom/b43/main.c b/drivers/net/wireless/broadcom/b43/main.c
index 5830acb..6b80b5e 100644
--- a/drivers/net/wireless/broadcom/b43/main.c
+++ b/drivers/net/wireless/broadcom/b43/main.c
@@ -5479,6 +5479,39 @@ static int b43_op_get_survey(struct ieee80211_hw *hw, int idx,
 	return 0;
 }
 
+static int b43_op_ampdu_action(struct ieee80211_hw *hw,
+			       struct ieee80211_vif *vif,
+			       struct ieee80211_ampdu_params *params)
+{
+	struct b43_wl *wl = hw_to_b43_wl(hw);
+
+	/* Only the AC-PHY path builds session frames */
+	if (!wl->current_dev || !b43_ucode_is_ac(wl->current_dev))
+		return -EOPNOTSUPP;
+
+	switch (params->action) {
+	case IEEE80211_AMPDU_TX_START:
+		return IEEE80211_AMPDU_TX_START_IMMEDIATE;
+	case IEEE80211_AMPDU_TX_STOP_CONT:
+	case IEEE80211_AMPDU_TX_STOP_FLUSH:
+	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
+		ieee80211_stop_tx_ba_cb_irqsafe(vif, params->sta->addr,
+						params->tid);
+		return 0;
+	case IEEE80211_AMPDU_TX_OPERATIONAL:
+		return 0;
+	case IEEE80211_AMPDU_RX_START:
+	case IEEE80211_AMPDU_RX_STOP:
+		/*
+		 * The microcode deaggregates and sends the block acks, mac80211
+		 * reorders.
+		 */
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static const struct ieee80211_ops b43_hw_ops = {
 	.add_chanctx = ieee80211_emulate_add_chanctx,
 	.remove_chanctx = ieee80211_emulate_remove_chanctx,
@@ -5501,6 +5534,7 @@ static const struct ieee80211_ops b43_hw_ops = {
 	.stop			= b43_op_stop,
 	.set_tim		= b43_op_beacon_set_tim,
 	.sta_notify		= b43_op_sta_notify,
+	.ampdu_action		= b43_op_ampdu_action,
 	.sw_scan_start		= b43_op_sw_scan_start_notifier,
 	.sw_scan_complete	= b43_op_sw_scan_complete_notifier,
 	.get_survey		= b43_op_get_survey,
@@ -5590,6 +5624,9 @@ static int b43_setup_bands(struct b43_wldev *dev,
 			hw->wiphy->bands[NL80211_BAND_5GHZ] = &b43_band_5GHz_aphy;
 	}
 
+	if (b43_is_ac_core(dev))
+		ieee80211_hw_set(hw, AMPDU_AGGREGATION);
+
 	dev->phy.supports_2ghz = have_2ghz_phy;
 	dev->phy.supports_5ghz = have_5ghz_phy;
 
diff --git a/drivers/net/wireless/broadcom/b43/xmit.c b/drivers/net/wireless/broadcom/b43/xmit.c
index dee6cc6..163e713 100644
--- a/drivers/net/wireless/broadcom/b43/xmit.c
+++ b/drivers/net/wireless/broadcom/b43/xmit.c
@@ -1160,7 +1160,27 @@ bool b43_fill_txstatus_report(struct b43_wldev *dev,
 			frame_success = false;
 		}
 	}
-	if (status->frame_count == 0) {
+	if (report->flags & IEEE80211_TX_CTL_AMPDU) {
+		/*
+		 * minstrel_ht ignores session frames without this; one report
+		 * per MPDU
+		 */
+		report->flags |= IEEE80211_TX_STAT_AMPDU;
+		report->status.ampdu_len = 1;
+		report->status.ampdu_ack_len = status->acked ? 1 : 0;
+	}
+	if ((report->flags & IEEE80211_TX_CTL_AMPDU) &&
+	    (report->status.rates[0].flags &
+	     (IEEE80211_TX_RC_MCS | IEEE80211_TX_RC_VHT_MCS))) {
+		/* Sent with two rate blocks: attempts at each */
+		report->status.rates[0].count = status->frame_count;
+		if (status->fb_count && report->status.rates[1].idx >= 0 &&
+		    (report->status.rates[1].flags &
+		     (IEEE80211_TX_RC_MCS | IEEE80211_TX_RC_VHT_MCS)))
+			report->status.rates[1].count = status->fb_count;
+		else
+			report->status.rates[1].idx = -1;
+	} else if (status->frame_count == 0) {
 		/* The frame was not transmitted at all. */
 		report->status.rates[0].count = 0;
 	} else if (status->rts_count > dev->wl->hw->conf.short_frame_max_tx_count) {
diff --git a/drivers/net/wireless/broadcom/b43/xmit.h b/drivers/net/wireless/broadcom/b43/xmit.h
index d403a28..b6723be 100644
--- a/drivers/net/wireless/broadcom/b43/xmit.h
+++ b/drivers/net/wireless/broadcom/b43/xmit.h
@@ -412,9 +412,11 @@ static inline u8 b43_kidx_to_raw(struct b43_wldev *dev, u8 firmware_kidx)
  * The structure is placed in (struct ieee80211_tx_info *)->rate_driver_data
  *
  * @bouncebuffer: DMA Bouncebuffer (if used)
+ * @requeues: times the frame was put back on the ring (AC-PHY A-MPDU)
  */
 struct b43_private_tx_info {
 	void *bouncebuffer;
+	u8 requeues;
 };
 
 static inline struct b43_private_tx_info *

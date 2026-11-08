Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122396;
	b=xOJ1my2Jv+rCISiowqd1tnFNFYmXf4jYPrXr4c6JC85KD/cdscD0rurMlvUNLRGlhKRj
	 myTvOwn+BoTW96Hwh7PT/GTR2T1/5NY9ba7Uho5DtoIyerAIDEcTL33tXLHWeHylLYwaW
	 AdkDjCgnZvAhm9ibv33GL1txR3hncNepxhik2TLXlgpBSJBqoJeCmmF0kVpQPZe9b0cw8
	 c//9BaEs/htz5HYImeHtTMvcPWh2ZFK7JkmebzmDrhduXti8PWF1H8ehwCXwLAQDjOGRr
	 hNlDtKxfjusbH5bhEJnfXXWc1uUGh4W7fbfHXTK1s8gHiIyfk06G/U3WqRgJHn/lsag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2ImTsYPrfEljpxg4p9epHRlQC0cVDFbjJcUcIEwrTtc=;
	b=zdYGo+Zs4njWsiXJI8W92QqRGWGzfdFcLINZEL7lS9Bv/zkhaILOm8HWQexmiOHh5ifR
	 fA71a1fbrsnKSAlwWiZIlhNh3ERnTkVHKhDjlm3w9Gv2oCRwyDTdJezMHcKrtLV/JRhdP
	 +GMDh2mhtcGuwDmD51ZjtGL74mqwPdWc2BAt0xNAR6dUlRJh+3FXhKR1RAMjjzx16IQl1
	 VLjwL7gkWdVr1UBoXyuq0Erru2al4N42Z4BbeAT0MgZCP+ElVqEZP2prZq6JgsvIpzAcx
	 cRKfTJEUzSQNHIcm1mRcSQjAiZQoELRGWoalIeGWu6X15+FQGyZHbxEKHYXml1U/7QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4sNZ0hv;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9A6606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC9A6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a4sNZ0hv
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so127164c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122395; x=1794727195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ImTsYPrfEljpxg4p9epHRlQC0cVDFbjJcUcIEwrTtc=;
        b=a4sNZ0hvofiUEahy6iTA/KvoT04OXEJyWiRAp3fUqofuoQ/D4RpUR3DH7J+vUctYDM
         e+Aumm3RllenY7prGNgZIbzOkLyfAUERYYrHGnmb80O/bknAY9eCU0guOEMprWa/0Rsu
         DqwF8OHkLk3Ew7QqAd/JSxjj1txZu29QJuytNf5z+06FNgLRn/Prwvk4SsRF+6nsQvkg
         FbbZobHwxbDFLtMMpy1tZEWuhdx43IeTkXm+Vc5IP/6zUvWNistIq2ptVFip7vkhI0vF
         OVEDmwgN6ffXuuXh1zoS7sbEtm4vj7Iq/sDE4T76se3+yn+8j2F/hMnINKBer5yUOiFS
         TWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122395; x=1794727195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ImTsYPrfEljpxg4p9epHRlQC0cVDFbjJcUcIEwrTtc=;
        b=I76wKa9ZmoiRZboYxxLDI1dyYZUOTE1Dmpjr5yEIZ2/RS/pjjl11npo0En/ICfkmvO
         3W856TXMtUh+jGW7wN94pvn/mGybg/IqdXnUYXHFKrmz7R3vBgEYZZE1AwKRKs4Wt8Ax
         GYHsdydnEeor1LN6LkorThumTEwwXQgb4SWTxDH3MVqbxqIqHW8J5nXjrNaTaURc5mj0
         aVc9RszjnT//uw3TgoHaSIpKFvsFR8HygwdtwiIRvrtkM2NP7PjJQ393IFyjNntOxCRj
         +96KHwBIj3gfwGBLaPGcVYvqdods8Ufpmpkweb+gfnfDjck8vG8OMWstD1ZZkaGg1T2L
         a6zA==
X-Forwarded-Encrypted: i=1; AL+hErEKEFKGVDbdI0uGWBbcRX/p9P6rr2pA/z6GMfSRYubzhCJfZ1yYNGADorC2oDH/nVZKk0n/u1Y+mICBPLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lkhM+RoSWELzoeloPphSLACn46YqEIVp/Nkm5l8Y/EAFy0jD7
	ZRpRMu/LSHjHPi4STF4iqdEJdBwfhmobDArG6+K4fnMrlES4zhUVgnYM
X-Gm-Gg: AYBFou3nDnoQi1F7cZX+ltf5Ad7xLOhTXj+THq9EFZbFkqAsiSjUFAiGs9HJ4Ld3e8A
	f6pST5ceNTg8rzfdCkC/Jse0qHJZMKmPGNHKKIwRvrw68ysLhzNI72eHyJoaUbE7LFp3uHnVvb/
	JiSBXPUGv4cmilnVNKiBeNG5VCyfMrIFY2rD+GkLNhQCLXCVW6q3gecnUEmDsp7dGsWgOvqjG05
	CK8rMW3N1UzDw1i6NLscP8NvA9VGs4ulWLT4DJ8zJBBVEpx7C7SuPloLDNElrb7D8zQG0qJrpyq
	o0vo7VUKuU0vFMZ3ASAWuQKmNXpzgYm4evpjB8ePZkrKwfyoZlIr2FVXj6Ry9iFTiMDF5GfBEVL
	trusSgYmpUUjPE4FMneGrDy7R6Rj1dzz8w2DuVq1oU7o7SdDszzghyqmXtVYWIeJ82spjwHUFwL
	Pmho7b/eQYYp3wWFyy2z/Tv0rfPGJsoa3Xhc7jcD9MBoRF0vy+TCOFKmx88Ty7QESU4HYFZ1BD5
	unaKMF4RWvtxQMLNLvkUfkibjv3gzGzknnz9dJp/r9o668tatzkbKrLc/TidClQhMvsmhPjCd77
	vVPCfuE7A1xHhg6MQcALP/gKquzSCalktA5Iv7xvBqzdqw==
X-Received: by 2002:a05:701b:450c:10b0:192:fd91:c567 with SMTP id a92af1059eb24-1b39fe87361mr1402459c88.11.1794122394823;
        Sat, 07 Nov 2026 23:19:54 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:54 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 3/4] wifi: mt7601u: add AP operations and beacon handling
Date: Sun,  8 Nov 2026 12:47:45 +0530
Message-ID: <20261108071820.35303-4-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108071820.35303-1-johnrobin044@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
 <20261108071820.35303-1-johnrobin044@gmail.com>
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

Implement the start_ap() and stop_ap() callbacks required for AP mode.
This clears the WCID tables and manages the hardware Pre-TBTT timer
for beaconing. Additionally, update mt7601u_bss_info_changed() to
handle BSS_CHANGED_BEACON and BSS_CHANGED_BEACON_ENABLED, routing
beacon frames through mt7601u_mac_set_beacon() and applying the
appropriate hardware SYNC modes for AP and ADHOC interfaces.

Signed-off-by: John Robin <johnrobin044@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/mac.c   | 59 ++++++++++++++++---
 drivers/net/wireless/mediatek/mt7601u/mac.h   |  3 +-
 drivers/net/wireless/mediatek/mt7601u/main.c  | 56 +++++++++++++++++-
 .../net/wireless/mediatek/mt7601u/mt7601u.h   |  3 +-
 4 files changed, 110 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mac.c b/drivers/net/wireless/mediatek/mt7601u/mac.c
index bf485dabca745..5e2dec131331c 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mac.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mac.c
@@ -272,13 +272,13 @@ void mt7601u_mac_set_short_preamble(struct mt7601u_dev *dev, bool short_preamb)
 		mt76_clear(dev, MT_AUTO_RSP_CFG, MT_AUTO_RSP_PREAMB_SHORT);
 }
 
-void mt7601u_mac_config_tsf(struct mt7601u_dev *dev, bool enable, int interval)
+void mt7601u_mac_config_tsf(struct mt7601u_dev *dev, struct ieee80211_vif *vif,
+			    bool enable, int interval)
 {
 	u32 val = mt7601u_rr(dev, MT_BEACON_TIME_CFG);
 
-	val &= ~(MT_BEACON_TIME_CFG_TIMER_EN |
-		 MT_BEACON_TIME_CFG_SYNC_MODE |
-		 MT_BEACON_TIME_CFG_TBTT_EN);
+	val &= ~(MT_BEACON_TIME_CFG_TIMER_EN | MT_BEACON_TIME_CFG_SYNC_MODE |
+		 MT_BEACON_TIME_CFG_TBTT_EN | MT_BEACON_TIME_CFG_BEACON_TX);
 
 	if (!enable) {
 		mt7601u_wr(dev, MT_BEACON_TIME_CFG, val);
@@ -287,9 +287,22 @@ void mt7601u_mac_config_tsf(struct mt7601u_dev *dev, bool enable, int interval)
 
 	val &= ~MT_BEACON_TIME_CFG_INTVAL;
 	val |= FIELD_PREP(MT_BEACON_TIME_CFG_INTVAL, interval << 4) |
-		MT_BEACON_TIME_CFG_TIMER_EN |
-		MT_BEACON_TIME_CFG_SYNC_MODE |
-		MT_BEACON_TIME_CFG_TBTT_EN;
+	       MT_BEACON_TIME_CFG_TIMER_EN | MT_BEACON_TIME_CFG_TBTT_EN;
+
+	/* AP Mode */
+	if (vif && (vif->type == NL80211_IFTYPE_AP ||
+		    vif->type == NL80211_IFTYPE_P2P_GO))
+		val |= FIELD_PREP(MT_BEACON_TIME_CFG_SYNC_MODE, 3) |
+		       MT_BEACON_TIME_CFG_BEACON_TX;
+	/* IBSS / Ad-Hoc Mode */
+	else if (vif && vif->type == NL80211_IFTYPE_ADHOC)
+		val |= FIELD_PREP(MT_BEACON_TIME_CFG_SYNC_MODE, 2) |
+		       MT_BEACON_TIME_CFG_BEACON_TX;
+	/* Station mode */
+	else
+		val |= FIELD_PREP(MT_BEACON_TIME_CFG_SYNC_MODE, 1);
+
+	mt7601u_wr(dev, MT_BEACON_TIME_CFG, val);
 }
 
 static void mt7601u_check_mac_err(struct mt7601u_dev *dev)
@@ -401,6 +414,38 @@ void mt7601u_mac_set_ampdu_factor(struct mt7601u_dev *dev)
 		   FIELD_PREP(MT_MAX_LEN_CFG_AMPDU, min_factor));
 }
 
+int mt7601u_mac_set_beacon(struct mt7601u_dev *dev, struct ieee80211_vif *vif,
+			   struct ieee80211_bss_conf *info)
+{
+	struct sk_buff *skb = ieee80211_beacon_get(dev->hw, vif, 0);
+	struct mt76_txwi *txwi;
+	int err, words;
+
+	if (!skb)
+		return 0;
+
+	/* USB devices already reserve enough skb headroom */
+	err = skb_cow_head(skb, sizeof(struct mt76_txwi));
+	if (err) {
+		dev_kfree_skb(skb);
+		return err;
+	}
+
+	txwi = (struct mt76_txwi *)skb_push(skb, sizeof(struct mt76_txwi));
+	memset(txwi, 0, sizeof(*txwi));
+
+	txwi->wcid = 0;
+	txwi->len_ctl = cpu_to_le16(skb->len - sizeof(struct mt76_txwi));
+	txwi->rate_ctl = cpu_to_le16(0);
+
+	words = DIV_ROUND_UP(skb->len, 4);
+	err = mt7601u_burst_write_regs(dev, MT_BEACON_BASE,
+				       (const u32 *)skb->data, words);
+	dev_kfree_skb(skb);
+
+	return err;
+}
+
 static void
 mt76_mac_process_rate(struct ieee80211_rx_status *status, u16 rate)
 {
diff --git a/drivers/net/wireless/mediatek/mt7601u/mac.h b/drivers/net/wireless/mediatek/mt7601u/mac.h
index 54bd4fac54d83..528756ccf4725 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mac.h
+++ b/drivers/net/wireless/mediatek/mt7601u/mac.h
@@ -167,5 +167,6 @@ struct mt76_tx_status
 mt7601u_mac_fetch_tx_status(struct mt7601u_dev *dev);
 void mt76_send_tx_status(struct mt7601u_dev *dev, struct mt76_tx_status *stat);
 void mt7601u_set_macaddr(struct mt7601u_dev *dev, const u8 *addr);
-
+int mt7601u_mac_set_beacon(struct mt7601u_dev *dev, struct ieee80211_vif *vif,
+			   struct ieee80211_bss_conf *info);
 #endif
diff --git a/drivers/net/wireless/mediatek/mt7601u/main.c b/drivers/net/wireless/mediatek/mt7601u/main.c
index 05ba43e1985c8..4389e332dfe19 100644
--- a/drivers/net/wireless/mediatek/mt7601u/main.c
+++ b/drivers/net/wireless/mediatek/mt7601u/main.c
@@ -149,7 +149,7 @@ mt7601u_bss_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		 *	 rt2x00 doesn't seem to be bothered though.
 		 */
 		if (is_zero_ether_addr(info->bssid))
-			mt7601u_mac_config_tsf(dev, false, 0);
+			mt7601u_mac_config_tsf(dev, vif, false, 0);
 	}
 
 	if (changed & BSS_CHANGED_BASIC_RATES) {
@@ -161,7 +161,20 @@ mt7601u_bss_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	}
 
 	if (changed & BSS_CHANGED_BEACON_INT)
-		mt7601u_mac_config_tsf(dev, true, info->beacon_int);
+		mt7601u_mac_config_tsf(dev, vif, true, info->beacon_int);
+
+	if ((changed & BSS_CHANGED_BEACON) && vif->type == NL80211_IFTYPE_AP)
+		mt7601u_mac_set_beacon(dev, vif, info);
+
+	if ((changed & BSS_CHANGED_BEACON_ENABLED) &&
+	    vif->type == NL80211_IFTYPE_AP) {
+		if (info->enable_beacon)
+			mt76_set(dev, MT_BEACON_TIME_CFG,
+				 MT_BEACON_TIME_CFG_BEACON_TX);
+		else
+			mt76_clear(dev, MT_BEACON_TIME_CFG,
+				   MT_BEACON_TIME_CFG_BEACON_TX);
+	}
 
 	if (changed & BSS_CHANGED_HT || changed & BSS_CHANGED_ERP_CTS_PROT)
 		mt7601u_mac_set_protection(dev, info->use_cts_prot,
@@ -183,6 +196,43 @@ mt7601u_bss_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mutex_unlock(&dev->mutex);
 }
 
+static int mt7601u_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			    struct ieee80211_bss_conf *link_conf)
+{
+	struct mt7601u_dev *dev = hw->priv;
+	int err = 0;
+
+	mutex_lock(&dev->mutex);
+
+	/* Clear the wcid Table */
+	for (int i = 1; i < 128; i++)
+		mt7601u_mac_wcid_setup(dev, i, 0, NULL);
+
+	/* Set pre TBTT to 6ms */
+	mt76_rmw_field(dev, MT_INT_TIMER_CFG, MT_INT_TIMER_CFG_PRE_TBTT, 6);
+	mt76_set(dev, MT_INT_TIMER_EN, MT_INT_TIMER_EN_PRE_TBTT_EN);
+
+	mt7601u_mac_config_tsf(dev, vif, true, link_conf->beacon_int);
+
+	mutex_unlock(&dev->mutex);
+
+	return err;
+}
+
+static void mt7601u_stop_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			    struct ieee80211_bss_conf *link_conf)
+{
+	struct mt7601u_dev *dev = hw->priv;
+
+	mutex_lock(&dev->mutex);
+
+	mt7601u_mac_config_tsf(dev, vif, false, 0);
+
+	mt76_clear(dev, MT_INT_TIMER_EN, MT_INT_TIMER_EN_PRE_TBTT_EN);
+
+	mutex_unlock(&dev->mutex);
+}
+
 static int
 mt76_wcid_alloc(struct mt7601u_dev *dev)
 {
@@ -419,6 +469,8 @@ const struct ieee80211_ops mt7601u_ops = {
 	.config = mt7601u_config,
 	.configure_filter = mt76_configure_filter,
 	.bss_info_changed = mt7601u_bss_info_changed,
+	.start_ap = mt7601u_start_ap,
+	.stop_ap = mt7601u_stop_ap,
 	.sta_add = mt7601u_sta_add,
 	.sta_remove = mt7601u_sta_remove,
 	.sta_notify = mt7601u_sta_notify,
diff --git a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
index 118d437078537..7366e1c476339 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
+++ b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
@@ -359,7 +359,8 @@ void mt7601u_mac_work(struct work_struct *work);
 void mt7601u_mac_set_protection(struct mt7601u_dev *dev, bool legacy_prot,
 				int ht_mode);
 void mt7601u_mac_set_short_preamble(struct mt7601u_dev *dev, bool short_preamb);
-void mt7601u_mac_config_tsf(struct mt7601u_dev *dev, bool enable, int interval);
+void mt7601u_mac_config_tsf(struct mt7601u_dev *dev, struct ieee80211_vif *vif,
+			    bool enable, int interval);
 void
 mt7601u_mac_wcid_setup(struct mt7601u_dev *dev, u8 idx, u8 vif_idx, u8 *mac);
 void mt7601u_mac_set_ampdu_factor(struct mt7601u_dev *dev);
-- 
2.56.0


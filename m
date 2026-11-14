Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697150;
	b=JnOY1lzhOTxbtJGO44i3FmbOZOqFDU87DUceI1zCXWEO5ikmMO7ncUHnviqZTS77LKIe
	 23klvbVo0X2Ci27MbJFZVtT4MvFV2c22WJn1JJHdfdoSFdj/XlrqtM+35CGnyZU8UN6Lh
	 wBoHbYH9PlcaXv2XsReH/4qLVziMaKH+BxMmlP9zA/+4Cg3mdqDBWm/bOujS0Td1fss+X
	 z2mLvewiIs35hEYQxlKqIaG67Mra+nGe1oLg/9tqufR+Ek14XmFcgq/3HhzImvdmIwt4X
	 LRIuNMQyh9fA2zKaxgd7A7yH3QAK9S+uiJ++RLcExA0FLXBBWV3dz6qD30pusLsmZjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=waR/zWZnBRXU2WEVTfXHQX/34C4JQcWIN/TomKd4jng=;
	b=HnnjwZKIeLw7W6JxpoByvAsYAM1gC9TO775Ky0/qPn9ls3TCmoNapt7FQT8wJehM+i7w
	 fImIvyIVISlvswklatC4j/h6205wefe9ow6ZEA5nN7mOUFOKGB6X6ggIZTA3kiIUYzzuI
	 256yg3C+11Du8ZQo392x5wkPvvNlXCF8Q58oGuMYOTvfEjEVMr67cCuKrBDrZV7z8cRk/
	 ybDugj9G8HpIdq/N9qALJ8NScFZXNhJRTQq1sc5i0A+0BQrytej+DT9DKVk1aELRoinlx
	 NFSnHmvcC5BfY3j3w5rTtovMsgL7lpQnv8y4g/Htj10b4LbZIl19PvdlpGFqnlQDzmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=wKkx1sK9;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B37606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B37606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=wKkx1sK9
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50933bdf4bso477082266b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697148; x=1795301948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=waR/zWZnBRXU2WEVTfXHQX/34C4JQcWIN/TomKd4jng=;
        b=wKkx1sK9/s44D46mlZTRd6mXKtuPQxJUju21Q9KRFhB+bet1SvuGecGDONTw/KfvEn
         zZb8KltACxdpIj3Mpf7Otdfw3XNewX7gbhz9Ut8b2FUp6+1DfK+cgy/uyuhwoSxwSZ7J
         wJDE7PoIWUW8NZiJ9eFX79vohtmYbD5wjAB/yHpkO0py0yG44PR8tsyO0HEiHFPmPr5c
         VojoGk0yfAwB3W17X12rBBHSI/5yvv0V86eN6Xps8Wt1O5j5Rxj8Jl+3GhQeoihhi8cl
         59CTrXqGass4r+TG221kXXGi3MZzvU48A+76ZeiCCHXy19DkEWSy2IDJAGwdf4bzHD2I
         BE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697148; x=1795301948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waR/zWZnBRXU2WEVTfXHQX/34C4JQcWIN/TomKd4jng=;
        b=V5b5cJgk/i3FTqyqM7242EOg1wQomMyTcKS2UG0ZQhVvU6lhCa49G1kw38nzeyXwDb
         87QAs/IUv6a0E80z6DFJu+92EkIZbkhcQXu7E/dTowyfkBUtlDxfCu5hwKAzyhKPO2EK
         h2xNDkfrEe6gZlvR3IrFgt17VT2BtwpSZg0LCISDg0PVntAO3kUAZK96KfDVlOPuQeGx
         Gk6+k2fDirChLeRFa5HpHOkmmSpx20uvaEkMnO7OivybA7PsQVONvKXm6C9deFhvp18C
         Op20adlUSRpkKaoEPIsqYSdTFXGhoN+cMSMckN6jSEp9bVNESa+j5fDpaGy4FNnbG4f7
         bFNg==
X-Forwarded-Encrypted: i=1; AL+hErGc6eRzW5W3dLyepL6SmVO12QEW8GPYp6naN0TOkvxnplKT17ja/dPiy6lcAvQT+FPtyvCKp+VV1QkH5CQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s+uan3IfRgj64ecze3DcJk9XNP5x9x0O1TltcnOnE/dc93/JA
	Z0F8x0/bJ5CM90Idoggp0cTXTP1k5LbywE6IZ5qA2Wx42EKcEuInrpF8sc84WZjsJA==
X-Gm-Gg: AYBFou2ip7aE0LJ4DkMUGnEZF1YQhr65GoO4oe3e8O7gWpBRY531TlzckJKoZ9wCXlB
	cwgVE3mqOIjBLLeQ30OYo4YX8lHm3Wrs8gaUG6vDiYlmqbaDWe7r139twj0qCtQyAFiFPDcOuy0
	COP7pLpUFhtx/H/7tsd7olGdJsiqcmqQB7VJz0K35vT1g7HlG7g+QYOrs+lR5dMcb723XIs2UDp
	qpMi9W8DioBvpUhNJLwzChJTOrC55hpEFEN9rmXqMBbKAjRRuZkVtFlYtv73gR0VjVNzh2uZbKe
	XHDPFmOezsJa+N9x8ncwrOuVKJ5I/lmUuaAERb7ihwqHURMTWiKWnIh10OAKJOBkar664lhPZ/f
	ixJlnER+y47IIXrTm1s2b+j24EngT5iL2SOBPRJDVKxkv97cGzMjX0j+uqDhJ8Qtm/6qOg3Ur5I
	SxZBBfC349EY7jg4+KYhK3jxFhUXc+ac6uhHRbmUFbup6mJggPOJqIpSQjMSzY7pu1rYlclLtbN
	uECnUt89z9DWISyplFzguiOgqpMQLr6JnKYciQ8A5TxvyQiXpy0KDvtZl4gl5abwn1LZlHbznB3
	g9/Dpa5kcV8oFbSvyzu+K+IG9qXPzkewe5znZ3Uir2PzlIxMBsNSnKcBgKlWqalDtUC1ySto2qO
	8v2VBXOrl/8xULCuxi5BZdQtTHCNGaSb4iJR8oKRLMXztBBrikebrDl9JNYCEeNUhKldLCdYois
	x6RTskeW40mZl6WfEkk5hnLVgmdIbDd7JFSZ6E16uQ/kvBiJjbht1B9zCe2uXlXMUdl+Y9ExI7i
	0UPWfBpkf+4uounQW82h1YuOldiN0vN0+63swJh+mPBfRfuZFA4KoEgkmaPbyJx3fTlE6CV7jpv
	BbW83Vqlf7VZWTk3BK6mzoTPhTTcTZOiOEISxAM5HkHna8Ffh6YRBw==
X-Received: by 2002:a17:906:c150:b0:c2e:1b6b:8b19 with SMTP id a640c23a62f3a-c507c41ed34mr840249666b.23.1794697148201;
        Sat, 14 Nov 2026 14:59:08 -0800 (PST)
Received: from Desktop (p200300f24709e8000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4709:e800::a27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dafbasm2718936a12.22.2026.11.14.14.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:59:07 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Sven Eckelmann <sven@narfation.org>,
	Kalle Valo <kvalo@kernel.org>,
	Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: [PATCH ath-next v2] wifi: ath11k: replace a pairwise key in place
Date: Sat, 14 Nov 2026 23:59:05 +0100
Message-ID: <20261114225905.978606-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

mac80211 replaces an in-use PTK by calling set_key() with DISABLE_KEY
for the old key and SET_KEY for the new one, which ath11k sends to the
firmware as an install of cipher NONE followed by an install of the new
key. Commit 97acb0259cc9 ("wifi: ath11k: fix group data packet drops
during rekey") stopped this clear-then-install sequence for group keys,
and the same sequence fails for a pairwise key. ath11k does not set
NL80211_EXT_FEATURE_CAN_REPLACE_PTK0, so mac80211 warns "Rekeying PTK
for STA ... but driver can't safely do that" and flushes the queues,
which waits ATH11K_FLUSH_TIMEOUT (5 s) for the whole radio whenever a
busy station keeps frames pending. On an IPQ8074 AP with a station
downloading at full rate and a rekey every 20 s, the first run of each of
two attempts logged 7 and 2 of these warnings and 2 and 1 flush timeouts,
and the station lost the link in both.

Keep the old pairwise key in the firmware when mac80211 disables it for
an authorized station, so that the following SET_KEY overwrites it in
place, as the group key path already does. Outside raw mode the hardware
encrypts a frame with the key it holds for the peer and generates the
PN, so a frame queued across the replace leaves with the old key or the
new one, and the SET_KEY resets the REO PN state. A pairwise key removed
without a replacement is cleared when the station leaves the authorized
state; a removal outside that state, as hostapd does for a leaving
station after closing its port, clears the key at once as before. A TKIP
fragment chain completed while the host holds no key for the peer is
dropped, as its MIC cannot be checked. With this, advertise
NL80211_EXT_FEATURE_CAN_REPLACE_PTK0 outside raw mode, where mac80211
assigns the PN itself.

Tested on an IPQ8074 AP with the same load: three runs with this patch
completed 3 to 4 handshakes each at 847, 828 and 851 Mbit/s, with no
warning and no flush timeout, and five station leave and re-association
cycles each cleared the key and completed the 4-way handshake on the
first attempt.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460

Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write these patches.

Changes in v2 (Sashiko review of v1):
- save the key length with the index and cipher, so the delayed removal does
  not send key_len 0, which the firmware ignores (len 16 in 3 of 3 runs now)
- delay the removal only while the station is authorized; a removal in any
  other state clears the key at once
- do not advertise NL80211_EXT_FEATURE_CAN_REPLACE_PTK0 in raw mode, where
  mac80211 assigns the PN
- drop a TKIP fragment chain completed while the host holds no key for the
  peer instead of dereferencing the missing key

v1: https://lore.kernel.org/all/20261107133925.3522299-1-julius@bairaktaris.de/

In the three rekey runs one softirq core carried 72-75 % of the load
(cpu3, cpu3, cpu1; /proc/stat tick accounting).

 drivers/net/wireless/ath/ath11k/core.h  |  9 ++++
 drivers/net/wireless/ath/ath11k/dp_rx.c |  4 ++
 drivers/net/wireless/ath/ath11k/mac.c   | 61 ++++++++++++++++++++++++-
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef2..f56fa9edcbfd 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -571,6 +571,15 @@ struct ath11k_sta {
 	bool use_4addr_set;
 	u16 tcl_metadata;
 
+	/* A pairwise key mac80211 removed but the firmware still holds,
+	 * cleared by the next SET_KEY or when the port closes.
+	 * Protected by ar->conf_mutex.
+	 */
+	bool ptk_clear_pending;
+	u8 ptk_clear_idx;
+	u8 ptk_clear_keylen;
+	u32 ptk_clear_cipher;
+
 	/* Protected with ar->data_lock */
 	enum ath11k_wmi_peer_ps_state peer_ps_state;
 	u64 ps_start_time;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..acdff945cd1d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -3276,6 +3276,10 @@ static int ath11k_dp_rx_h_verify_tkip_mic(struct ath11k *ar, struct ath11k_peer
 		key_idx = peer->mcast_keyidx;
 
 	key_conf = peer->keys[key_idx];
+	if (!key_conf) {
+		dev_kfree_skb_any(msdu);
+		return -ENOKEY;
+	}
 
 	data = msdu->data + head_len;
 	data_len = msdu->len - head_len - tail_len;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d..42019e0641f9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4509,6 +4509,34 @@ static int ath11k_set_group_keys(struct ath11k_vif *arvif)
 	return first_errno;
 }
 
+static int ath11k_mac_clear_ptk(struct ath11k_vif *arvif,
+				struct ieee80211_sta *sta)
+{
+	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
+	struct ieee80211_key_conf key = {
+		.cipher = arsta->ptk_clear_cipher,
+		.keyidx = arsta->ptk_clear_idx,
+		.keylen = arsta->ptk_clear_keylen,
+		.flags = IEEE80211_KEY_FLAG_PAIRWISE,
+	};
+	int ret;
+
+	lockdep_assert_held(&arvif->ar->conf_mutex);
+
+	arsta->ptk_clear_pending = false;
+
+	ret = ath11k_install_key(arvif, &key, DISABLE_KEY, sta->addr,
+				 WMI_KEY_PAIRWISE);
+	if (!ret)
+		ret = ath11k_dp_peer_rx_pn_replay_config(arvif, sta->addr,
+							 DISABLE_KEY, &key);
+	if (ret)
+		ath11k_warn(arvif->ar->ab, "failed to clear pairwise key of %pM: %d\n",
+			    sta->addr, ret);
+
+	return ret;
+}
+
 static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
 				 struct ieee80211_key_conf *key)
@@ -4519,6 +4547,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
 	bool is_ap_with_no_sta;
+	bool keep_ptk;
 	const u8 *peer_addr;
 	int ret = 0;
 	u32 flags = 0;
@@ -4614,7 +4643,21 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
-	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+
+	/* The same firmware race hits a pairwise key: a clear followed by
+	 * an install of the same peer's key leaves the firmware dropping
+	 * every unicast frame to the peer. mac80211 replaces a PTK by
+	 * DISABLE_KEY on the old key and SET_KEY on the new one, so keep
+	 * the old key until the new one overwrites it in place. Frames
+	 * queued in the hardware leave with the old key or the new one.
+	 * Only an authorized station gets a rekey, and a removal not
+	 * followed by an install is completed when its port closes.
+	 */
+	keep_ptk = sta && flags == WMI_KEY_PAIRWISE && cmd == DISABLE_KEY &&
+		   peer->is_authorized;
+
+	if (!keep_ptk &&
+	    (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta)) {
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
@@ -4656,6 +4699,13 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	if (sta) {
 		arsta = ath11k_sta_to_arsta(sta);
 
+		if (flags == WMI_KEY_PAIRWISE) {
+			arsta->ptk_clear_pending = keep_ptk;
+			arsta->ptk_clear_idx = key->keyidx;
+			arsta->ptk_clear_keylen = key->keylen;
+			arsta->ptk_clear_cipher = key->cipher;
+		}
+
 		switch (key->cipher) {
 		case WLAN_CIPHER_SUITE_TKIP:
 		case WLAN_CIPHER_SUITE_CCMP:
@@ -10056,6 +10106,9 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		}
 	} else if (old_state == IEEE80211_STA_AUTHORIZED &&
 		   new_state == IEEE80211_STA_ASSOC) {
+		if (arsta->ptk_clear_pending)
+			ath11k_mac_clear_ptk(arvif, sta);
+
 		spin_lock_bh(&ar->ab->base_lock);
 
 		peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
@@ -10606,6 +10659,12 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
+	/* In raw mode mac80211 assigns the PN, which the hardware must not
+	 * encrypt with a newer key
+	 */
+	if (!test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags))
+		wiphy_ext_feature_set(ar->hw->wiphy,
+				      NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
 		wiphy_ext_feature_set(ar->hw->wiphy,

base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0


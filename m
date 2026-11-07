Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058767;
	b=yls6tSJliuZecpl8b5eBVOgIPrK3/0/HcPewoAWS61dRFKro4mOuuvuJmJ8PxDaW7/QK
	 uqAT6pm1SoGwk9gZVR6UaRLdpVdsx82vGroUF+QDTpq4hzED9/J9G399a+5crZWzglRnK
	 jt9FRGuJVytXewVyXd8cE860hDs3cdh84xmyvcivuc+01dMI9UedahTzUPXh28n+ApC2d
	 kESavlCaId2Q6s/Oh+l2eVaLa2RAi+dXzTr/32wqbNurp0jS6lUzCyyvAGXuqKTa4mxm4
	 sYBYUm/QDGmdXAWSZ0QoYTNjUID8JyrvdwCEQ8j39JYaqkCIPTsB3MDCPoN6M9cIlMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w/IBxYIH+K6Y9RZD4pOBn7Z5Vj6ZH2uF8SNKdz2mVno=;
	b=PLAPgsyRXfzrvEO47lWZAL1zYalZKi/NKWb8k013w2AiV0Oskjic5CTYrNutiZfqcxId
	 TU/L3Ww2/zATDMEzFqmInLTL/TbUZSJ3yOWKWIJmk7olYEMu9O8YAW8cbHKaNRCPFSwZA
	 JUubYCeLioNDPRunaXq6k/gKgCBibWk+0HTotgvPz0qbiwag9njhiY2p44hcJsv2iAJJ8
	 uQ/7p5y7705HfsRkLk1VNcQT5BV24qGZx0VxBk5qYWW9sXO26Gs16t70BpEL/WQPRZ4Cy
	 CJgcaHzeLgiPsnI4Ulw1nevmue5HqyXqkuITbcEzY+B+Dh17LeJ+43WZzoauwCES5dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xdTjjITC;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E5606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6E5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xdTjjITC
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c3fd91337baso272738866b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794058765; x=1794663565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/IBxYIH+K6Y9RZD4pOBn7Z5Vj6ZH2uF8SNKdz2mVno=;
        b=xdTjjITC6uUAK2uZxG4/Z3iWhfeed0+Cz8NpRqPW2zaY+vJXI8RCP6dPu+W5eB2i8H
         0LKj3s7Qa/l9ByrWhJ6dbEMDWzjEmA327Wixh0wkF0VXhtHk2hDDmed7M/gOk2JYfvYE
         ot+9GUiW3WZtoFqCPCziJFfZBa6rl5skHROza6qlyLWltCq0/O3YsSF2UIO1uMW8m+eM
         OXY/tberDq+yx+j31NX5RAHGwmsI6LKFRENIo2VhzpXIZr/ceWDoM3dE0hGQWmERJEyQ
         Su1Q6h1KfSiJDHif/r3hA4KnvMkRnXx0jX4Koo4u0joR6W6UTBH3CvfL18TE9KjU1S5d
         6FgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794058765; x=1794663565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/IBxYIH+K6Y9RZD4pOBn7Z5Vj6ZH2uF8SNKdz2mVno=;
        b=iVgFVyRG6IhIzHyz8MPk4K/9CcEQ6HQ26UMf8Z8nfeqr99o9RLTBiEUIsnsNaqkopB
         nMPsOf1rD+iqCxmtJiDrUy+HysFYRsOkWOK1zibesCOoLOyWXt0fpbwk7R/EDaqKAXms
         /OQxrqoW+C3ySV+KeVDBfL68pRrvGGm77ADrueMUlp4jBIdCU5y/QgPaKNw6yfHGPkTA
         WLosDtokKkwnm6d0rFGjsDO/O3pxv0gw4aExz74LzXbr3BdyzGCBWC9daJtq+CGmDROI
         t3wCoNvyNNOo/dfmspwRKVcBPhXb38lUz3u166sJ+LRHju8OgyDT8BDK3tVtab8l8Wmn
         ciEw==
X-Forwarded-Encrypted: i=1; AKwUvByBNb+p47V/U2EQGWVh3jHJQzUs6r9H4Tq7Y6JHAsBauidKl8HGkm1H+WXWwT1MDfIflNZPvuW/g84T9bo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+s32jSH0v9nmD13JglEA+8sDsDMC62MxPwf/jYw6UbkqXSJdi
	5mTs5FqB8XZxkenV3mFTMRYLny15/JJndIsymWXnomh2Ks2aFRXgKdQj8zSQIFANOw==
X-Gm-Gg: AYBFou1xlMyOpXfih85jH3N+7ugQaeLi2c7iMbEJatvlFKj3Wc5/y/Kn7dYAPUqqvrF
	Og7wJMxVIZ/eH3+PmvMp/c8kHfuP+MSuCdBUjj6S4S8EdAyH2wXp3TXQu8IXlA1BkBZMAhV8O0j
	6yMrZndgiY5JP/eAflD//XpOBJKYw8CtRFdBbyrcew1a0xBAr9VhVNpaVoW714rkD52esQC4UD5
	smVDULW29cF05ZxiSeubNinMK3+fFy28KrMirAV8TELgcBJBUz6wHuW02C1BmMIRHLa2fER3bA5
	xCj7NAr9TflMsaKkLLYXzxX5/TBEriEseJcPcFFFuLRSjzXJkRCH4UgV3bI9lzdzhmEHa4aM5D0
	EC8o0rt0TsbSdUbFtg6VFC5J6RFVaNSmqHNGqqoDeNEleAZ4/8J290uxz3xYn6YMQ4AorQ4zwFR
	SCtUWrwaBXb1Mc2YTYjGGJfbJRwz2wy0hW9w/ApSyyDrqaSb2X6QUF/No14Ta8MFqomqqZ8QYb/
	KlWyvExOlEYh6yLy+tuUuhY2dq6gauXbi0uQK9bnZ1YlbAa8Qk4B8yXg8ckpeqvnfMkWIcUkQ63
	3xT+F3PRMYrwDP6n7VElFgnYzMhPl4Xi3/A633RYbFh1nqDiNNTRPa9DntwbfDTyZ6SlZXWdDEl
	ru7ph3NEAXjWJS4o0T3COSKkwU+zV1voWPI+RdexnDaHWx6Op723Zz5NYxbsvbxUy37C2QS2WMY
	prnp7bUCX8USi0prOlrpfADzzMnczxVttjcy4y2LsVy4frA7JxnV33K5u9xZMBYcbUNnLsMcGQM
	E/SzuVUNewdMUsr/y1yVlCmqgfxdsqUYMZtS5/AaDJyXy3OFNqZEf2G9kxs4Fn2V7Nt2QTvNm4a
	MvhU6HX4N5wtnMXm8A==
X-Received: by 2002:a17:906:ef04:b0:c24:6985:d7a1 with SMTP id a640c23a62f3a-c4d3468f9f2mr431978766b.7.1794058764366;
        Sat, 07 Nov 2026 05:39:24 -0800 (PST)
Received: from Desktop (pd95130be.dip0.t-ipconnect.de. [217.81.48.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d354ab149sm151758266b.3.2026.11.07.05.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:39:23 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Sven Eckelmann <sven@narfation.org>
Subject: [PATCH ath-next] wifi: ath11k: replace a pairwise key in place
Date: Sat,  7 Nov 2026 14:39:25 +0100
Message-ID: <20261107133925.3522299-1-julius@bairaktaris.de>
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
and it fails the same way for a pairwise key: on an IPQ8074 AP, the
station stopped receiving at its first PTK rekey in 6 of 6 runs, with a
Broadcom and a Qualcomm client, the REO counted up to 165 PN check
failures per run, and hostapd deauthenticated the station at the next
rekey. Because ath11k does not set NL80211_EXT_FEATURE_CAN_REPLACE_PTK0,
mac80211 also warns "Rekeying PTK for STA ... but driver can't safely do
that" and flushes the queues, which waits ATH11K_FLUSH_TIMEOUT (5 s) for
the whole radio whenever a busy station keeps frames pending.

Keep the old pairwise key in the firmware when mac80211 disables it for
a station, so that the following SET_KEY overwrites it in place, as the
group key path already does. Outside raw mode the hardware encrypts a
frame with the key it holds for the peer and generates the PN, so a
frame queued across the replace leaves with the old key or the new one
and never in the clear, and the SET_KEY resets the REO PN state. A
pairwise key removed without a replacement is cleared when the station
leaves the authorized state, and peer deletion drops it with the peer.
With this, advertise NL80211_EXT_FEATURE_CAN_REPLACE_PTK0.

With hostapd rekeying the PTK every 20 s, a download to a FastConnect
7800 station holds 914 to 945 Mbit/s through four rekeys, with no
second below 854 Mbit/s (3 runs); before, the station lost the
connection in 3 of 3 runs.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Fixes: 436a4e886598 ("ath11k: clear the keys properly via DISABLE_KEY")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write this patch.

 drivers/net/wireless/ath/ath11k/core.h |  8 ++++
 drivers/net/wireless/ath/ath11k/mac.c  | 55 +++++++++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..69e612a3e71b3 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -571,6 +571,14 @@ struct ath11k_sta {
 	bool use_4addr_set;
 	u16 tcl_metadata;
 
+	/* A pairwise key mac80211 removed but the firmware still holds,
+	 * cleared by the next SET_KEY or when the port closes.
+	 * Protected by ar->conf_mutex.
+	 */
+	bool ptk_clear_pending;
+	u8 ptk_clear_idx;
+	u32 ptk_clear_cipher;
+
 	/* Protected with ar->data_lock */
 	enum ath11k_wmi_peer_ps_state peer_ps_state;
 	u64 ps_start_time;
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..386e9593e4590 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -4509,6 +4509,33 @@ static int ath11k_set_group_keys(struct ath11k_vif *arvif)
 	return first_errno;
 }
 
+static int ath11k_mac_clear_ptk(struct ath11k_vif *arvif,
+				struct ieee80211_sta *sta)
+{
+	struct ath11k_sta *arsta = ath11k_sta_to_arsta(sta);
+	struct ieee80211_key_conf key = {
+		.cipher = arsta->ptk_clear_cipher,
+		.keyidx = arsta->ptk_clear_idx,
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
@@ -4519,6 +4546,7 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
 	bool is_ap_with_no_sta;
+	bool keep_ptk;
 	const u8 *peer_addr;
 	int ret = 0;
 	u32 flags = 0;
@@ -4614,7 +4642,21 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	is_ap_with_no_sta = (vif->type == NL80211_IFTYPE_AP &&
 			     !arvif->num_stations);
-	if (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta) {
+
+	/* The same firmware race hits a pairwise key: a clear followed by
+	 * an install of the same peer's key leaves the firmware dropping
+	 * every unicast frame to the peer. mac80211 replaces a PTK by
+	 * DISABLE_KEY on the old key and SET_KEY on the new one, so keep
+	 * the old key until the new one overwrites it in place. Frames
+	 * queued in the hardware leave with the old key or the new one,
+	 * never in the clear. A removal not followed by an install is
+	 * completed when the port closes, and peer deletion drops the
+	 * key with the peer.
+	 */
+	keep_ptk = sta && flags == WMI_KEY_PAIRWISE && cmd == DISABLE_KEY;
+
+	if (!keep_ptk &&
+	    (flags == WMI_KEY_PAIRWISE || cmd == SET_KEY || is_ap_with_no_sta)) {
 		ret = ath11k_install_key(arvif, key, cmd, peer_addr, flags);
 		if (ret) {
 			ath11k_warn(ab, "ath11k_install_key failed (%d)\n", ret);
@@ -4656,6 +4698,12 @@ static int ath11k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 	if (sta) {
 		arsta = ath11k_sta_to_arsta(sta);
 
+		if (flags == WMI_KEY_PAIRWISE) {
+			arsta->ptk_clear_pending = keep_ptk;
+			arsta->ptk_clear_idx = key->keyidx;
+			arsta->ptk_clear_cipher = key->cipher;
+		}
+
 		switch (key->cipher) {
 		case WLAN_CIPHER_SUITE_TKIP:
 		case WLAN_CIPHER_SUITE_CCMP:
@@ -10056,6 +10104,9 @@ static int ath11k_mac_op_sta_state(struct ieee80211_hw *hw,
 		}
 	} else if (old_state == IEEE80211_STA_AUTHORIZED &&
 		   new_state == IEEE80211_STA_ASSOC) {
+		if (arsta->ptk_clear_pending)
+			ath11k_mac_clear_ptk(arvif, sta);
+
 		spin_lock_bh(&ar->ab->base_lock);
 
 		peer = ath11k_peer_find(ar->ab, arvif->vdev_id, sta->addr);
@@ -10606,6 +10657,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
+	wiphy_ext_feature_set(ar->hw->wiphy,
+			      NL80211_EXT_FEATURE_CAN_REPLACE_PTK0);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
 		wiphy_ext_feature_set(ar->hw->wiphy,

base-commit: ad6bdd5f9030dbcf29a67f40ccdb3fa57afecff5
-- 
2.53.0


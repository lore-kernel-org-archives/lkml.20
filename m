Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794096178;
	b=l8f+8DekaMJE+Civbvr4ylaJURL+ByAsksxa2g7t4mw/Y6OMpu70rL8G1g4hf3yxLKy8
	 zTLAisKa/K4phagv93TnNutfsNpFpuEvszYDBDSk9sgD9gpzhWumWWRloScogwnBuwrbQ
	 pOgcX+Qf9CZW6Vn5hahK3srpnASERK7XaI53mfDyqHMHq+xSDlC6o5SvA8EQgniUcZSsH
	 iS6gBGNgX2JljCQ9NXWhq+HuViaisY4JrlONjYENvZfyqx1m8m9JEws8vpekF6fygAozs
	 pvQNRrzGXLMpnl9hSJmIuANHvoT/vjCZP2wFnNF9GQbzdCYw4eHGzBhdbPnjlrsn7KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096178;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r31NsiZOgizVwPpTDT3QJst8H8jPpnkDDnTlwzVVTYg=;
	b=vOSbwcd7mdGQlzDBG39cjPl1dB29aOXggm58W+G91zvXQm/CcJ6yrMJSfsGV6Tc2WnhF
	 s4TVHTGGo7UR+XwullEdnyIvpw/NBlJ/U+c4odGB3z3eUSRn4/BwwFXzBAC6aSBgtiwJb
	 fbEJZkkV4rHO2PDe9yn3HKIDX0rlxAVlB/vPCXlg4k8kjex4uRQQg2kyIl09ROuHC5okj
	 mH23QQizhKSpBb+FuakfuT94SqGCjv6pDFmAAdt+cAoHMnSpPHGReE3OACt+BE8ee2m8a
	 vqOuDmDC/NaU06QVB2hggINwEq7dpd2ufT9MelOWBvh3koHzBgu37R573aL1o3SCzng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VZefF6ga;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B61606A336;
	Sun,  8 Nov 2026 00:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VZefF6ga
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794096177;
	b=MkhaUwCheb4c6y+Kc8BpHlpZNq2+cJpMJGDXoh+xo2mfTDFbNYwrunlgAux/XGJUZBT6
	 vIQrXivzwC1NfzckKC76oePWTQnpxbG6ovfMQjEFX9BK2f1XHaBt3b206EGPYK0awUy9L
	 ACw3ajY4Jnkeo10vwCSRWSgJdUp+rcRIDIfo3EwrcfRRSLn9KtTzQ+XrkvKHf3aJ7+yvu
	 EkrSV9u7fwz6FH4BBw8KvcKIxwQ9gA1eHIluI5TGOd/0P/UzhaDIUNrS1xDuYCUnvyFK9
	 npAnfh5B2t7rpQN4k61Ga2QrXRc0BKxBvPzT89+odyQRsoTEFDgiEd6F+4bret9adhA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794096177;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=r31NsiZOgizVwPpTDT3QJst8H8jPpnkDDnTlwzVVTYg=;
	b=LRpjQJLGLJ8ASOKVSWyVCIvsNextyNGWaWbI4WQiv62NAWnnhGcUaTxaj5GoSuTW4xhW
	 PFDeFmBNTQj/Y5WiD+BC6ZuZIPlVducdGZC86VCHycBYuJfUA72v/ltED42UX0aOrUUFd
	 X/ZF7Fc/O2o0iCbp5gxdgivFtZG8ylbbMNeDKV9A3ufEYPAAEWMCcTPQvSb1EqJXE/szj
	 yxdDgH0MAnel5Q4dMPsRgsTgPcNp1vaGZYOwxpvDMPOp6gD9Lld8ivCzxxDdUmV3HoM3j
	 86CCil7g7egXOqvmJ4M7r1NJwvon6lRR7u8eyPEdGplttulqJS5KwgcRhHIBV8o6d4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE5B51F0089F;
	Sun,  8 Nov 2026 00:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794096177;
	bh=r31NsiZOgizVwPpTDT3QJst8H8jPpnkDDnTlwzVVTYg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=VZefF6gax4EOSxUIg9Pc8/xzKkNHqGDpJN5aduh/uuWl+TOFi8o13rzf1KuUofPmQ
	 g2xbuJ92XeWyrcbzJBX+48ixNo1cYdy2GQ7qnkvfuXkuyyg0wY/S0qroAWNlhHJMuD
	 TYr9FC5rOO/3efUr5IUd4zN9fDtFqf7cdOnu/Z76hDzYYKmYzTE1LLw/iNpl3/qBey
	 Nfb61NjWBP2vj0ArUehgNM7NGnagf5IJsaUDpbQ+O1Oi/yoVq3ccS1OT0u3Tgglgmh
	 dTO2ZWRTtyZ2SyjwtUGHPrKuYMXaS039mcIR/cAtLw92nOyG/fqQoaDghblP4GsAJF
	 KleckfKObZ5jQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4E72947D5E;
	Sun,  8 Nov 2026 00:02:56 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 18:02:56 -0600
Subject: [PATCH] wifi: ath11k: advertise 7935-byte A-MSDUs on 2 GHz-only
 radios
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-ath11k-2ghz-ht-max-amsdu-v1-1-ed18a6b0c18d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC+872oC/yXMMQ6DMAxA0asgz7WEMxSpV0EMJjHEIGgVB4SKu
 HvTdnzD/yeYJBWDR3VCkl1Nn2sB3SrwkddRUEMxuNrdieoGOUeiGd0Y3xgzLnwgLxY29DQQB+b
 Q9AwlfyUZ9Pit2+5v2/pJfP7+4Lo+/WuILnwAAAA=
X-Change-ID: 20261107-ath11k-2ghz-ht-max-amsdu-c1f1adaad7ba
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794096176; l=5625;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=C7DUr4eKMqw0XBpofJFw7fPdlQOxru+WVXPSPaby87E=;
 b=xtxBE9PG93ZvYFGT44EgRqSetMs+317bSzModVVHqyg96nhWOFgbrsldiIkefGrEEutTkAXII
 LRgO5RL8W43CzhvHG4YZU8VhHLY7GyKPYU4A8iDQSAAL8RuPvkREV5j
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Reply-To: christophergriffin05@gmail.com
Content-Transfer-Encoding: 7bit

From: Christopher Griffin <christophergriffin05@gmail.com>

ath11k_create_ht_cap() sets IEEE80211_HT_CAP_MAX_AMSDU when the pdev's
VHT capabilities allow an MPDU longer than 3895 bytes. ath11k fills the
pdev's VHT capabilities from vht_cap_info_5g only, so on a pdev without
5 GHz they are zero and its 2 GHz band advertises a maximum A-MSDU of
3839 bytes. The 2 GHz band of a dual-band pdev and every 5 GHz radio
advertise 7935 bytes with the same MAC.

The firmware reports VHT capabilities for 2 GHz too, in
vht_cap_info_2g. On IPQ6018 the 2 GHz pdev reports 0x73997992, a
maximum MPDU length of 11454 bytes, and the 5 GHz pdev 0x7399f9b2.

Keep the 2 GHz VHT capabilities with the band's other capabilities, and
take the max A-MSDU bit from them when the pdev has no VHT capabilities
of its own. Pdevs with 5 GHz are unchanged.

On IPQ6018 the 2 GHz radio's HT capabilities change from 0x11e7 to
0x19e7, and hostapd adds [MAX-AMSDU-7935] to its ht_capab. Its beacons,
read by another AP, advertise a maximum A-MSDU length of 7935 bytes,
where the 2 GHz-only radio of an IPQ8074 AP without the change
advertises 3839. Beaconing and channel switches on both radios work as
before.

Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-03982-QCAHKSWPL_SILICONZ-3

The change, this message and the test were written with Claude, an AI
coding assistant.

Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
Found on Arista C-360 (IPQ8074) and W-318 (IPQ6018) APs while comparing
the capabilities their radios report: every 2 GHz-only radio said
3839, everything else 7935.

ath12k fills the pdev's VHT capabilities the same way
(ath12k_pull_mac_phy_cap_svc_ready_ext() reads vht_cap_info_5g only), so a
2 GHz-only ath12k pdev probably has the same gap. I have no such
hardware to test it on, so this patch leaves ath12k alone.
---
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 15 ++++++++++-----
 drivers/net/wireless/ath/ath11k/wmi.c  |  1 +
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923ef24..6eca6dc67da16 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -818,6 +818,7 @@ struct ath11k_band_cap {
 	u32 phy_id;
 	u32 max_bw_supported;
 	u32 ht_cap_info;
+	u32 vht_cap_info;
 	u32 he_cap_info[2];
 	u32 he_mcs;
 	u32 he_cap_phy_info[PSOC_HOST_MAX_PHY_SIZE];
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa37d1..1f405e200b0bc 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5556,11 +5556,11 @@ static int ath11k_mac_op_conf_tx(struct ieee80211_hw *hw,
 }
 
 static struct ieee80211_sta_ht_cap
-ath11k_create_ht_cap(struct ath11k *ar, u32 ar_ht_cap, u32 rate_cap_rx_chainmask)
+ath11k_create_ht_cap(struct ath11k *ar, u32 ar_ht_cap, u32 ar_vht_cap,
+		     u32 rate_cap_rx_chainmask)
 {
 	int i;
 	struct ieee80211_sta_ht_cap ht_cap = {};
-	u32 ar_vht_cap = ar->pdev->cap.vht_cap;
 
 	if (!(ar_ht_cap & WMI_HT_CAP_ENABLED))
 		return ht_cap;
@@ -5769,7 +5769,7 @@ static void ath11k_mac_setup_ht_vht_cap(struct ath11k *ar,
 	struct ieee80211_supported_band *band;
 	u32 rate_cap_tx_chainmask;
 	u32 rate_cap_rx_chainmask;
-	u32 ht_cap;
+	u32 ht_cap, vht_cap;
 
 	rate_cap_tx_chainmask = ar->cfg_tx_chainmask >> cap->tx_chain_mask_shift;
 	rate_cap_rx_chainmask = ar->cfg_rx_chainmask >> cap->rx_chain_mask_shift;
@@ -5777,9 +5777,14 @@ static void ath11k_mac_setup_ht_vht_cap(struct ath11k *ar,
 	if (cap->supported_bands & WMI_HOST_WLAN_2G_CAP) {
 		band = &ar->mac.sbands[NL80211_BAND_2GHZ];
 		ht_cap = cap->band[NL80211_BAND_2GHZ].ht_cap_info;
+		/* A pdev without 5 GHz has no VHT capabilities of its own, but
+		 * the firmware reports them for 2 GHz too: use those for the
+		 * max A-MSDU length.
+		 */
+		vht_cap = cap->vht_cap ?: cap->band[NL80211_BAND_2GHZ].vht_cap_info;
 		if (ht_cap_info)
 			*ht_cap_info = ht_cap;
-		band->ht_cap = ath11k_create_ht_cap(ar, ht_cap,
+		band->ht_cap = ath11k_create_ht_cap(ar, ht_cap, vht_cap,
 						    rate_cap_rx_chainmask);
 	}
 
@@ -5790,7 +5795,7 @@ static void ath11k_mac_setup_ht_vht_cap(struct ath11k *ar,
 		ht_cap = cap->band[NL80211_BAND_5GHZ].ht_cap_info;
 		if (ht_cap_info)
 			*ht_cap_info = ht_cap;
-		band->ht_cap = ath11k_create_ht_cap(ar, ht_cap,
+		band->ht_cap = ath11k_create_ht_cap(ar, ht_cap, cap->vht_cap,
 						    rate_cap_rx_chainmask);
 		band->vht_cap = ath11k_create_vht_cap(ar, rate_cap_tx_chainmask,
 						      rate_cap_rx_chainmask);
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 82f85df481cbf..69405d8ca0901 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -454,6 +454,7 @@ ath11k_pull_mac_phy_cap_svc_ready_ext(struct ath11k_pdev_wmi *wmi_handle,
 		cap_band->phy_id = mac_phy_caps->phy_id;
 		cap_band->max_bw_supported = mac_phy_caps->max_bw_supported_2g;
 		cap_band->ht_cap_info = mac_phy_caps->ht_cap_info_2g;
+		cap_band->vht_cap_info = mac_phy_caps->vht_cap_info_2g;
 		cap_band->he_cap_info[0] = mac_phy_caps->he_cap_info_2g;
 		cap_band->he_cap_info[1] = mac_phy_caps->he_cap_info_2g_ext;
 		cap_band->he_mcs = mac_phy_caps->he_supp_mcs_2g;

---
base-commit: ad6bdd5f9030dbcf29a67f40ccdb3fa57afecff5
change-id: 20261107-ath11k-2ghz-ht-max-amsdu-c1f1adaad7ba

Best regards,
--  
Christopher Griffin <christophergriffin05@gmail.com>



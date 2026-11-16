Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870183;
	b=bbLZPJ6HbZ7sWjaq37+5pki5qKJh1HnVGVUgIwimfDO5GrysFgRJp48ETs9QmgthGII4
	 1l813q452JpsCng0IJyS2Vzv3PhGytMySB5PJWAGk27gFRAjUN4cX6Kh5r1jo5/Zly6by
	 mopGFtwQOs0S2nkM75YKNwUKsM7rJ8ULA2+ToblSCDpqr9y3gz5dwsiTMz3hn2nwKYmWr
	 yytI8f9mzOiohKZB/oUM2wxFc99q9xBqg/CiS4asT0Lmx8F8aO2CsbMyXDVDZKXwIVaqG
	 YgSihq0ZqeV/JjiwFNmiCwqh5CuffiwzRuhsaq/b5BroaehiLUYLV2Emu2lOzh5IbbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nRFumCG1IZk3fjsdmZSVriNashmE07r3bdlI4W9+YCE=;
	b=WHOfpvWDf4qllW97v+pCyw7ilcVkyqSwxKMtqROr4EOkASgiM7EokQ8F9VbC0jOjCobX
	 X8zJtVnM9nA9Dg9ds+vHSX4SWxmwq89h+HuRxo7NIMFMdApGtWYAh7ZbKcUJJyrLd7v5B
	 DPzdF/LFjWMww5fzfk8RGII4KDtO7HSbnge/R3TDHSGfKKxzz5fcO4AuV8dRhUM8mX6wd
	 qMLcZYIaduKZFRNMUgSDc6dn0t2fZgxl29YzvNpoWmpahYGRJCHZKUfZTf4MX1EDkVtcD
	 H93xjKgAVvbdrxXN/sq6xKCUajd4EdtYJlE7VFFHaJJ+ioZOUjknjztqgumGIVOFYaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKfsChHR;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C7A606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C7A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKfsChHR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b467581b98so35624415e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794870179; x=1795474979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRFumCG1IZk3fjsdmZSVriNashmE07r3bdlI4W9+YCE=;
        b=fKfsChHRbJkgHA1Zn5/95TRvUTd0+x6g+VLr5rHsu4l3Fjs1jlWRNjhlL7+uBhyAiB
         tO0Qxih+V+3owTpaSx59MFFHLwgs6iEIRiQo07ibXqFPIHpUhnjq5XIyvQGh7Zy0sBTX
         aNEAosnWXWrDdpHQTIIX8EntYgsBB2QMqtc8FYgW39w41lzSLA1gxxKismWU5hQJAGZv
         soc1u+S+Bop2jutNh40YpwlRqJdTpkKl5M8u/6u1Z0bDCWt0ExYNGkgZ4zaHpaLHidbB
         G2qnD8avvWcY1gk6Vcug0u1bZ/kNv5p2t+hxhxROUb/6QHZGTW8yemw0wpyv+TmzlAY8
         zNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870179; x=1795474979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRFumCG1IZk3fjsdmZSVriNashmE07r3bdlI4W9+YCE=;
        b=V599eRBkQORjYMtuPE5Ut+3q3/1nysNdm4wQaPMchSYDpBSBH9tsDBY8iRBVx9Yx36
         QmjHOalRpcDSuo7gBi8K6onVwsTPF5DjbY1MqA+kTlsE1gVHfL3Uuuc/bK5J53vlUG4d
         8aCwQ3pXrohDK1DxgFrRQG59pGIErxMrfC3KoUk7rXpbHSQJCdqiBG00eI0t4O3aHJWO
         /SpiyIyHt4U0L1976na0tZNT+3Mxqs96LHWRHFM4XqwqWtCUFx8Id1an3VCIOvDpkDmI
         6mVKn0OlA0F2UKBXLaoVa1NNpneuD2pHuyZ6MV794/AP7OVNK3iOr3GqjlNsOtxmEQsi
         0N0g==
X-Forwarded-Encrypted: i=1; AL+hErFrYAvEm+bIe/XIpn1dirsCvgMTdDlL7BcZTBJDQsIuuAoyikwz5/fFCDL08aSdXza5sY5U9tXl1XZx8Jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tv5tMA84BwpyXBG06tefarPI5Lsm3hwffPQISwiGwfAE//RX7
	xFU90uCoUXODwTvNKnKH1FZS1ZvVrBP0L8BtsmhY2vUaK8bhH3A+xKlo
X-Gm-Gg: AYBFou3v0c95KNWp/eHW6M5zFpn9U27Vn+Ca5I1stT7+rLW2ht4LayFQy8B8h+VMsiv
	j83f+HAvhzn+PMGIZwLzer23jQREIhygGts4gC5pR1r9XIddhAQhiElZIC9/AG0rh95nFiaefnd
	C+SVmYnl0wNRVuobg7V0qiDA+tAH/0VKPOoyAsfytE2tA5o5VwuqPEs2G3sKu7aS+1sCesxMcq2
	MjDbinEojUqQaQNZEKQT/JjrgB1b3TG9+7Q6G9PXTNZIQWkaP7A7RH+fWLb6zkAvSdi+CjOTSWG
	Wc1MIlfyK7aSh2FUOixWu9vW+uKuo4J6RYWbFATVdgzu2CFgi8QhNLLSyzYZjetjz3EYaJLFPGH
	VX60A1z1yCpcLKFEmJDT+/utBmeLZb77X/IQcoaRYIXUvhtyzEu24owln/d0G4zO3LEa2iB6DLf
	i7kgUXhHi9TGh+I/m9EnUWy1lsZX3UkQZhuztxqWionfOnodxtfBW9YpChEt2sRJLUoy6e7YvVS
	0csTb3RIph6Ia1E6IIVs00Wg1PDdwV63V4YJ936A4AEv0ZngCGge0hm2bdKVMjw9klvlZOleq8B
	8azyYLN7YPIUZT2uXi3tZWqEI05bdT+wfA==
X-Received: by 2002:a05:600c:8b34:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4bb55a25c0fmr239411275e9.3.1794870179190;
        Mon, 16 Nov 2026 15:02:59 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:dd63:7222:aab1:aecd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78344ddbsm24680955e9.0.2026.11.16.15.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:02:58 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH ath-current] wifi: ath12k: report TX status for broadcast and multicast frames
Date: Mon, 16 Nov 2026 23:02:49 +0000
Message-ID: <20261116230250.369383-2-ivitro@gmail.com>
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

From: Vitor Soares <vitor.soares@toradex.com>

In AP mode, once a station is associated, broadcast and multicast frames
sent by the AP log:

  ath12k_wifi7_pci 0003:01:00.0: dp_tx: failed to find the peer with peer_id 2

These frames complete against the AP's own peer. That peer has no
station, and since commit 981050b918fc ("wifi: ath12k: Fix TX status
reporting to mac80211 when offload is enabled") a missing station is
treated as a missing peer: the frame is dropped and an error is logged.
Before that commit, the TX status of these frames was reported without a
station.

Report the TX status without a station when the peer has none, and add
rate information only when a station is present. Only drop the frame
when the peer is not found, and log that case at debug level, as the
HTT completion path does.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 981050b918fc ("wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled")
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
This conflicts with c752394249f8 ("wifi: ath12k: store station pointer
only in dp_peer") in ath-next; the resolution uses
ath12k_dp_link_peer_get_sta(peer) in place of peer->sta.

 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
index 41abf1865702..794d85d9dbaf 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
@@ -856,24 +856,27 @@ static void ath12k_wifi7_dp_tx_complete_msdu(struct ath12k_pdev_dp *dp_pdev,
 	ath12k_wifi7_dp_tx_update_txcompl(dp_pdev, ts);
 
 	peer = ath12k_dp_link_peer_find_by_peerid(dp_pdev, ts->peer_id);
-	if (!peer || !peer->sta) {
-		ath12k_err(ab,
+	if (!peer) {
+		ath12k_dbg(ab, ATH12K_DBG_DATA,
 			   "dp_tx: failed to find the peer with peer_id %d\n",
 			   ts->peer_id);
 		ieee80211_free_txskb(ath12k_pdev_dp_to_hw(dp_pdev), msdu);
 		goto exit;
 	}
 
-	status.sta = peer->sta;
-	status.info = info;
-	status.skb = msdu;
-	rate = peer->last_txrate;
+	if (peer->sta) {
+		status.sta = peer->sta;
+		rate = peer->last_txrate;
 
-	status_rate.rate_idx = rate;
-	status_rate.try_count = 1;
+		status_rate.rate_idx = rate;
+		status_rate.try_count = 1;
 
-	status.rates = &status_rate;
-	status.n_rates = 1;
+		status.rates = &status_rate;
+		status.n_rates = 1;
+	}
+
+	status.info = info;
+	status.skb = msdu;
 	ieee80211_tx_status_ext(ath12k_pdev_dp_to_hw(dp_pdev), &status);
 
 exit:
-- 
2.53.0


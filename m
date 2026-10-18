Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A5B47532E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345765; cv=none; b=fdUJwOfGOEcDSfBqBs2X7MwCdrj0hRw7Gcg6v02svBd/4JMKAuJIkUS0EY02jZ4NN0FK7m52Dhi+pIFTIsv+HpgW5V5p/sxE5f4W2+lCzUa+MyqSQe05HZ7ZApmRLI0Fbp9IErm6jSQgSX5+F4H+3Eg6KkdGIxBQmrYwnLqaOAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345765; c=relaxed/simple;
	bh=ZgAH1aO17JCTl3Ktzh4EF5ov+WcA77yVVym4c2eRQd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EPh4QR5ii5UWWgqa3oyeB4a6ZMvtRlR6RpoYRzhESdnc8E3TaYODm18PuFLU8tTG6A7KgLQIlreUPtwLmtC871mdDDRQzdxWm1Bmj7YQE57epKEAnmTxRyFsYRmfuEJGuhwbjoTQlVe22rmffB59At42gNsdc6rEMp2grOjUmA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=n6Kk5LNI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="n6Kk5LNI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c20ce3c118aso264187366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345762; x=1792950562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpsxtVvi9ogB8U9CtpikmUlQdCiUBK5dcmVCHnoFJIw=;
        b=n6Kk5LNIqBxLR5ywlTA4K8103xgmMyKKwOhWXlhnERKK1RFHFbT6/RH1d8QpFusMbY
         nSMTWWdyDwIVo5j8Di2y8G+LDaBb6+n7cLbGohQ0IBkkILe6ljjnTlMtK0AeTp1oxYz7
         LdSFo+pltQVwpVw9qSmZs2UNohxy64lGjWCfuWO1rRBFRQWQfq+nLokgYzi3Krq6RFi1
         nn0Am2+BurPAMyKv0krHRVsNm94Dz8UfJD4svzSfNS/AmGTby2283spbGZ6nYtRyaaJN
         BP5bETOieJpFOUMJrsLbxHOz+rZQSeaUBV9rcnDaxEJgCAOfQY5fKSyUrIM0dKGdEFuO
         ut0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345762; x=1792950562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpsxtVvi9ogB8U9CtpikmUlQdCiUBK5dcmVCHnoFJIw=;
        b=Q9HcnAJ5Acd2MJsXatdZnpaqbQhJpOC1p6GwGMlZaWSCMTmb6IPtKOloUgcXfJzouV
         Gfk7hdDFt2q12lOLasRjPfQN3dxqFMwG5LRxg/MkhJT4nOOQQJEIpjkIEGpVnFJNkCbi
         YpeKUVxxFkYtrybUtFaVH/zAhoBhx6AAoSyBxXtX/ckv5AXvH5UqbXjiOxmPboSk4y9Q
         hwNkSfb9gyXu0/8q+ZemeU5plBtKM5QsmgXkR/0NP3KJ6mPooQsfcmpx5yC+yrTTCMpA
         KnTyVzEeFpeFJ6pw4qk9isorv3eMd8MbZAmBWfumOM66tjZT9pPx6smYuit4g42ZnLJN
         HNHg==
X-Forwarded-Encrypted: i=1; AKwUvBwV7Ijt3+mbUuvnQqbB9EHTGhK6InwZKsQUdkKFdZHBaZxHcvA12T1DCeWIkbyxYQ59uIx3Efd8It0wmuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFEuDdSlDBJwyoc6wul18293k8q9OWtPnKYAVIqihIPKGDxTW/
	uW3TDkucdUbxMxFtoPoLjkZGeLiskZmJf9ZXYS1BOrRgjlrS3nca9nXFdY3mb6zpJw==
X-Gm-Gg: AYBFou3QV8D9vEgOeW49exHC2vmvQe+haP08KhbksAklVE7oDLH9AfeC/EZ1zr7ft6W
	gxHAlTlNBLu39GKrPg/ICzUW0+XZWW1r633MsaQqrdHmJrKfM2A3QGkRXwkDXAIfqwIU0/CJqjE
	YYYdjdOQBhSQpg5BzosyU1ym9xSD49lJFb7SOay6xaTkSlzwP4ZPdHZjIx8Y+TDLqe3sVbHLYhJ
	179q23c7zqHHzAkpFKi5Zze1muelrphgPxKspeAzilxWvuZf6grIjbfwjjjjJo++nkbL3UA8Fp6
	HxjhFn/snzCwGGpHIBBNfFgsA3K6UYsD/22xIhlRJ6OtoL4WttiL/Q1TERjDTczZtnqg5wcrSmu
	p91mEKBlRB2jevMYSBkkSk6RUbDpqqxLCU+TivrvelbdJVzKMwT8FJLHUd3iFdaHDQeYfWJa3A7
	RxnInxcdfMPqpQGQiSzx9P4mwdEWSnDr1EBuAJiSYRwwkUT2DsVT26CsSJdWF4Fp2wbbzeleSUD
	iOopnbf9qe4TkhYsvoR3klsUYMsy/w1VdRsQmgKYoxDegW2x0k38+F5VmB7CpQ7l+MK4nHUwREj
	JH/M9hY8Qw0FMillG6FvRYSOZJYQnYLQ9vfezKj+O+w16d1fy2g3IV/7KPbOoEvMmWYmph4CbpM
	pyeD/7feGV1myefEW6SzYeOtAAjy/8JgQ0R5Y//anoWXGLzwbvTDKUw2Ws2EwB8VcJOpwP3ij8D
	sWR+DKtGNdf5dHv3Cy4l8=
X-Received: by 2002:a17:906:4795:b0:c42:fc8b:6c6a with SMTP id a640c23a62f3a-c42fc8b8ea7mr172167566b.14.1792345762000;
        Sun, 18 Oct 2026 10:49:22 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:20 -0700 (PDT)
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
Subject: [PATCH ath-next v5 7/9] wifi: ath11k: charge received airtime to the station deficit
Date: Sun, 18 Oct 2026 19:49:02 +0200
Message-ID: <20261018174904.1757161-8-julius@bairaktaris.de>
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

mac80211 charges received airtime to the same deficit, as AIRTIME_USE_RX
is set by default, but ath11k reports none. Register each received
PPDU's duration, which ath11k already adds to rx_duration, once against
the PPDU's first TID, or BE when it names none. The TID comes from the
PPDU end user stats TLV, which is added to the default monitor status
filter. The call runs after ab->base_lock is dropped, under the RCU read
lock.

A station uploading with DSCP CS5 moved its VI deficit in 3 of 3 runs;
uploads marked BE left it unchanged in 3 of 3.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 14 ++++++++++++++
 drivers/net/wireless/ath/ath11k/mac.c   |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 8b9df63966989..42ce3dcff5ce9 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5275,7 +5275,9 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 	struct sk_buff_head skb_list;
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
+	struct ieee80211_sta *sta;
 	int num_buffs_reaped = 0;
+	u8 tid;
 	u32 rx_buf_sz;
 	u16 log_type;
 	struct ath11k_mon_data *pmon = (struct ath11k_mon_data *)&ar->dp.mon_data;
@@ -5329,6 +5331,7 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 			continue;
 		}
 
+		sta = NULL;
 		rcu_read_lock();
 		spin_lock_bh(&ab->base_lock);
 		peer = ath11k_peer_find_by_id(ab, ppdu_info->peer_id);
@@ -5342,12 +5345,23 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 
 		arsta = ath11k_sta_to_arsta(peer->sta);
 		ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
+		sta = peer->sta;
 
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
 next_skb:
 		spin_unlock_bh(&ab->base_lock);
+
+		/* Charged once per PPDU with the measured duration, as on
+		 * the transmit side, to the first TID of the PPDU; BE when
+		 * it names none. Outside base_lock, which tx completion
+		 * contends for; sta is held by the rcu read lock.
+		 */
+		tid = ppdu_info->tid < IEEE80211_NUM_TIDS ? ppdu_info->tid : 0;
+		if (sta && ppdu_info->rx_duration)
+			ieee80211_sta_register_airtime(sta, tid, 0,
+						       ppdu_info->rx_duration);
 		rcu_read_unlock();
 
 		dev_kfree_skb_any(skb);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4527ab6977d04..d17f80cbcdb5d 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -229,6 +229,7 @@ ath11k_phymodes[NUM_NL80211_BANDS][ATH11K_CHAN_WIDTH_NUM] = {
 const struct htt_rx_ring_tlv_filter ath11k_mac_mon_status_filter_default = {
 	.rx_filter = HTT_RX_FILTER_TLV_FLAGS_MPDU_START |
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
+		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_USER_STATS |
 		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE,
 	.pkt_filter_flags0 = HTT_RX_FP_MGMT_FILTER_FLAGS0,
 	.pkt_filter_flags1 = HTT_RX_FP_MGMT_FILTER_FLAGS1,
-- 
2.53.0


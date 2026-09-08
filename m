Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBEF54EEA9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875615; cv=none; b=l93f+MNQaHYLsnbJgVx+lySKUH/lLHeyPMKCqmDfW6RA/V5BxyquF1aBWKG036ddyxYg6cfmXKSsqoWlErbPovtUEF4oyq7gaIKE2uU6DMwAdkFMN18AwvS6RK1LTq14D9bdx0IY4DYX2TOf3m5A6XsaiJbpKhxXH1WxYemSGrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875615; c=relaxed/simple;
	bh=fPPPO1UhrrdWqz2fqXxE88RQyxzcMWx9QsUwBY4Qv/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8ZVFXxD1FzQFuH5aK8Ze/p9o+sD+KhRoUsOesU5D8ERKcM+OHZZRjCav3NL0iQklRjrIIHkQBcj9oTjdZD44rsRoZ5qDL3IokgbYG5m+UnH10ySmvAcI41a2LKXOBVTxtsx0aH0JqgvnIm/CQHU3TySUMLK2ETAxP5Lh+MJ3yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=nd9WtYwc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="nd9WtYwc"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1c52d920b8so595025166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875607; x=1789480407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7N6u7JNFUy9B9KinNnYiVqxj1hXMMyS0WRxnAU9lCxc=;
        b=nd9WtYwce9z4kkVJEh33ostpsHreyDZW6H92tNvmasswElrYIHyhC7l7VHEinePVjm
         AxicEFf2h80buhVWUI/3m27PSEyL01oSsdfTyixViq5qDEwwKWW9rBiesWN14TEn8u/7
         6ZQnHfDCWdvdwJpjg7nwdRd1Ud5r9HFOl3kKYilDwiHV9Y3TP3oFr3E7s4MP36NGAQh6
         lKYvwmje8SVZaus6NOeOHjuvoWs4AFcPUHIx9tyzGVlNvVitYdfrxvJMAcsZLkhbe7q2
         jSaSMAPPevsCdx3KmOOrTNRwigO8Bw4YDzWYW7CxMQW04cekDP5F9TnArH9ZHIHn+Yat
         x55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875607; x=1789480407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7N6u7JNFUy9B9KinNnYiVqxj1hXMMyS0WRxnAU9lCxc=;
        b=Ju7Q/FA1hWr+bbFHuDbufnEEKfZbQD4NVwp12FDcj6rvqulDmQj4yYnmPMQOMo4Xfj
         ogVmh2Wq3rDd4PRpAGH8ycPggK64AzqWKmNgBBML2lq6MumRltK5HGSX/Qj7DPQcDibc
         q7GqbpRoYN3IfzD+z4mIg4sq3OGqH5BCMmr2GEWMPlqXOPiNDHI0E+Rs8w5djaQ6gHEc
         3eFHdvZ+S6AhbM53p50cCGEL9PCyCQxBmBvXrrtSloVzmL2GDiebmUCSabLGNIhWmKk5
         O9OSekQxD9fGKJ96LSkO9bzEUdoOdNszkA9WSxUQGwROCGcDdtTpyhAVh3Z+NTjOP8Yl
         G54w==
X-Forwarded-Encrypted: i=1; AKwUvBzWT6D4YnkGVpcau9J5goSumfoAHoQZqPfSqRVZYhxviCOhEzxl6R7jXe95gs5aQ7TCXcYvh4RfXvr8AXs=@vger.kernel.org
X-Gm-Message-State: AFuF++kUGAFHb6EEiZdhno0W6FISrettyoHaP3gqjEFAgVzoMw9L+0ah
	DeQNjExsROHJ2v8nbDUDqalg+LwXRwEfSvYqn3B6Ptao+qoc0pwPZiST2ADr2KFl+Q==
X-Gm-Gg: AYBFou3ILEzAPs5rzVFK2GPvBPYg2YACA10INUEeA+WmjJpnbQ+1uyPqVipwRydKstH
	IuQJWUuwuXOIlVt6Me7B+f9FMaZc6832Ij3Bh+JO1BBZZUt0zRYKggTQnSzXEKN2NgASsFlQMAU
	RMA/YB22dOkhaGiApWOIHf95GSgCMYNoW8VGyBNYqY3Q1/I+/AbPKn6KNxMzxtr7taGH/pQYM7m
	Img4kuabq4dW2CvAW4JhpGCDlU0/LEtsbWkMVw7j6bq6ecZ9rVm+u3BNTEUGYLQ18RJI5MVZxNR
	GBoyHeO56YgxRibRUNOzyXMFmwAhpM5MHGB1yN4tLZ91bs3tN7qK1v1eu/hsqWcEi/tCokVmyWj
	PeICZWk6sO1IQFDuFV2iT6GMVIqd/mlQKr7Z6C1uW4BmCdgKp9cnrEENop0jpqCZobU2XFvnAAd
	EBD0B6PhlcDR9SR907mlj1+AFEEVFhzhvbyi7xx0J3W0JPmLeS2E1w89fFLFSqtsbD6jbd+1siC
	2E9Ns1d4RFMvFcnyGcJAzbj0XkY1WXWnt3U1QDbJ0gPpH8o/uNT7l2uRm0ByUptJuTn89RCfM1y
	EFgXQo0OYCeWenvPwJcIXeaYhJdwwft1zgiwXLzaKOR8F0ofxqtCYB53mMgHVw5TFASYr44tJTQ
	pqXaUj3wjCPObm+usvTHs+qKoAy+R7a4wV/6xpwE1hNHCKZGgQR0G3frb1F3UyoQAczpilLuOxE
	SjsaES0pvHfYMY
X-Received: by 2002:a17:907:db01:b0:c16:26c7:6ba8 with SMTP id a640c23a62f3a-c260c8bfb07mr1133695366b.6.1788875607271;
        Tue, 08 Sep 2026 06:53:27 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:26 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 9/9] wifi: ath11k: budget the tx completion handler
Date: Tue,  8 Sep 2026 15:53:18 +0200
Message-ID: <20260908135319.754140-10-julius@bairaktaris.de>
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

ath11k_dp_tx_completion_handler() reaps every completion the release
ring holds before it returns, and ath11k_dp_service_srng() charges none
of that work against the NAPI budget the poll was given, unlike every
receive handler below it. With the scheduling round that now ends the
handler, one poll that finds the ring full runs one round for all of it.

Reap at most the budget's worth of completions per poll and return the
count, so the poll ends and the round runs once per budget of
completions rather than once per ring. The completions left in the
FIFO are reaped by the next poll, which NAPI schedules at once when the
budget was spent.

Measured on an IPQ8074 AP with a TCP download forwarded from a wired
host to one 1x1 VHT80 station, BE aql_txq_limit 500/1000 us, 20 s runs,
three interleaved runs per arm, download rate and the RTT the sender's
TCP sees on that flow, mean and maximum:

                    Mbit/s               RTT mean ms   RTT max ms
  with this patch   100.8, 101.5, 100.6   27, 26, 26   32, 31, 32
  without            74.7, 101.1, 100.6  120, 27, 26   1873, 31, 30

Without it a poll that finds the ring full reaps all of it before the
round runs, and one run in three stalls for close to two seconds. At
the default limit both arms read 101 Mbit/s at 47 to 55 ms. Two soaks
on the series, a 91 s TCP soak at 1033 Mbit/s aggregate over five
streams, about 86000 completions per second, and a 60 s soak of
200-byte UDP datagrams at 60906 packets per second, produced no
status_fifo-is-full warning and no TCL ring-full failure.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp.c    | 10 ++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.c | 11 +++++++++--
 drivers/net/wireless/ath/ath11k/dp_tx.h |  3 ++-
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/ath/ath11k/dp.c
index be65d73b904b..ddb434c513e0 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -783,8 +783,14 @@ int ath11k_dp_service_srng(struct ath11k_base *ab,
 
 	for (i = 0; i < ab->hw_params.hal_params->num_tx_rings; i++) {
 		if (BIT(ab->hw_params.hal_params->tcl2wbm_rbm_map[i].wbm_ring_num) &
-		    ab->hw_params.ring_mask->tx[grp_id])
-			ath11k_dp_tx_completion_handler(ab, i);
+		    ab->hw_params.ring_mask->tx[grp_id]) {
+			work_done =
+				ath11k_dp_tx_completion_handler(ab, i, budget);
+			budget -= work_done;
+			tot_work_done += work_done;
+			if (budget <= 0)
+				goto done;
+		}
 	}
 
 	if (ab->hw_params.ring_mask->rx_err[grp_id]) {
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.c b/drivers/net/wireless/ath/ath11k/dp_tx.c
index 70d326fe6a1f..3997bd336942 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.c
@@ -685,7 +685,8 @@ static inline void ath11k_dp_tx_status_parse(struct ath11k_base *ab,
 		ts->rate_stats = 0;
 }
 
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget)
 {
 	struct ath11k *ar;
 	struct ath11k_dp *dp = &ab->dp;
@@ -695,6 +696,7 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	struct hal_tx_status ts = {};
 	struct dp_tx_ring *tx_ring = &dp->tx_ring[ring_id];
 	unsigned long push = 0;
+	int done = 0;
 	u32 *desc;
 	u32 msdu_id;
 	u8 mac_id, i;
@@ -723,10 +725,13 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 
 	spin_unlock_bh(&status_ring->lock);
 
-	while (ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail) != tx_ring->tx_status_head) {
+	while (done < budget &&
+	       ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail) !=
+	       tx_ring->tx_status_head) {
 		struct hal_wbm_release_ring *tx_status;
 		u32 desc_id;
 
+		done++;
 		tx_ring->tx_status_tail =
 			ATH11K_TX_COMPL_NEXT(tx_ring->tx_status_tail);
 		tx_status = &tx_ring->tx_status[tx_ring->tx_status_tail];
@@ -774,6 +779,8 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
 	for_each_set_bit(i, &push, ab->num_radios * IEEE80211_NUM_ACS)
 		ath11k_mac_tx_push_pending(ab->pdevs[i / IEEE80211_NUM_ACS].ar,
 					   i % IEEE80211_NUM_ACS);
+
+	return done;
 }
 
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
diff --git a/drivers/net/wireless/ath/ath11k/dp_tx.h b/drivers/net/wireless/ath/ath11k/dp_tx.h
index 9303b5ba6e01..b5296cda73e3 100644
--- a/drivers/net/wireless/ath/ath11k/dp_tx.h
+++ b/drivers/net/wireless/ath/ath11k/dp_tx.h
@@ -21,7 +21,8 @@ void ath11k_dp_tx_update_txcompl(struct ath11k *ar, struct hal_tx_status *ts);
 int ath11k_dp_tx_htt_h2t_ver_req_msg(struct ath11k_base *ab);
 int ath11k_dp_tx(struct ath11k *ar, struct ath11k_vif *arvif,
 		 struct ath11k_sta *arsta, struct sk_buff *skb);
-void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id);
+int ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id,
+				    int budget);
 int ath11k_dp_tx_send_reo_cmd(struct ath11k_base *ab, struct dp_rx_tid *rx_tid,
 			      enum hal_reo_cmd_type type,
 			      struct ath11k_hal_reo_cmd *cmd,
-- 
2.53.0


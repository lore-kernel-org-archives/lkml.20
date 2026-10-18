Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DA23DB321
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343892; cv=none; b=Dcd3ONymHGcjGEI2owUkafZ7LFJ89Ua9mP3Nwe0TwXeqNNGdnu8T/RwNLxaqrixZaCXj9zhNa7uoEXsXTUuJjWM0r+ZmDwJmKzycV/ukZHUaGKJ/e02McRIW16U9AVahX8YNfFmOZXeXDuICbwJxNv8ixJNeCdrbS5NVHSz27w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343892; c=relaxed/simple;
	bh=w1rLqjDr4yH5xkXdYfNMXnRDAqicc9p6rrPKhsuTHk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D1oMxalgII8T0ea/Q55aNyaoJa3FcCElzf/lhZtrdRBSNlf2kULkX7z+jvYRCmCBpJFj1Hv5swiTkKwJWtpP+Ogx8lXUD6WviPkhSGCkehQhQBUH2LiM7Ut5Y5KVAN6w6MyhH9ACTyY6328y05Fz3zUKxfBrPTqkVQyHev62k5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=i/bzdJ9u; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="i/bzdJ9u"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so1220290a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792343887; x=1792948687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xsuOl66B+NTjagROmLIHJ/ZmiibRBs0hE2dnTH1r3+4=;
        b=i/bzdJ9u4HA6fFpl8xhsTiGRKG3afvQ1AQVKJTXheYOV5VZakQXmt6esVwEFEha9wM
         /NtGVb4weSQEBL0/lKFsOvtxRMJFVyzA5sT6K8SLNtRtHMP9bgMJQxrSSZCTEOkJyYQj
         J4EIR1mTdqLvEpl+0uauDleNx51bWFdq8n41CwlZSNFkmLrwKa6MfIkSaaqsBFIyj4Mp
         FOur4/SWOA88MNDrDtZOEPfTvKLQS3GPrFtbbzxuMeHsRBb43d+CyCUdt+wF5OLCO2Qt
         wXBdeTeMQzjPTks1xNKus+ipKm7x2uhsAqykyKldoKjdbRou2eK5x8cL+idKgywN7IMz
         8DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343887; x=1792948687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xsuOl66B+NTjagROmLIHJ/ZmiibRBs0hE2dnTH1r3+4=;
        b=xcd5hr86myl77Y9y6BEVLhYzIvTtybMqbahudCW8uojMjVaPL7ev1kIguCC7mghdAi
         fvmYba6RyJ2y5x6E1DNjE0kQDSYW+avJwVc2LlWdiAw1Lqc3t3dpimTrW1FwuCyoGrLY
         anPBmxqI0sp2E7s8htDwXVIp2D/YFSEZdeNrHmkuwQUswdanEZ4HZ6Anq5E3V9v2PWbH
         tZUy7/6T7MbNLaI1MJ6+V37qyQ3N1lJZUOV7di1MbaV13VpJCuClxqqZ1Wgpyif+x8iy
         136OsbK/SBBT9Q9iPMIYoXQQZrm8V/YIIF3RZzyWbes2Zw1vWQpEgZfDbxJZbAqF1hMe
         YkkA==
X-Forwarded-Encrypted: i=1; AKwUvBwRCSz4OTzBXXHEe04U86oqDs9bB7H96Hf+J8qavmoNwvniuqZP13x4shwV3IBEm0MyzZjwH5YxofgfmHA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT+oJaowLPWu6Fpo4mFRlH/fZmw+m/RLVrWrH0D4LtIxq7JKsy
	hoTotnLG0ECCkuNFV+kqA5g3qBB4qrKGkL30QjT4OAkhIwYayV4kKvAC8h6/1R6Arw==
X-Gm-Gg: AYBFou3GLsKBa400IrhFobyzaONS/jUtCHp7nsp8FShoKM9kBmOpHxKQMpsuqjU5o74
	I5IbfvEfv0wg0BRFQWIk6BEB9IH9goppSUciaP4xHLFku8ULnIpDbjNoQDkjNRRzvmRCO1jp3qG
	2wYSoZdCFDkVSFyeL6vZ3m9y41kPIsgAtstcg74QuXshk7ogQD63noetlQX/akUNtg6aKI6UB7k
	LrIs5uo6LNS/AOeWHyDZ40YZ7ctkxchTOkqs/ORO1HdwGHsZmVxH10D9CPrF46zF6k6m7mKmf6m
	Xi0toJCQ0q2P3STLCjKcU6x5fjPVVguIb/RiZVjo5BCShI7KyZPZOkcktKz4izqXBeLB67a2cfz
	ttV655MyuNZiHeCnvd8XBDkuYCIifgb63vJ2WRoIXVFNq6yBenc2f1El2zSmxY/d5j66WEAycwW
	6pQMai7cIQ6B2QhSfNebzev3x1Nl1lqLoSQpOdM50QlkR9wChrXRu00hivpptqXIiQM1wY6vEh1
	Ann5EOb1Bzq3g+/G5i1VLYzSm9JWaq0UiRKEekUj8fICvJ3Z+R+MFDsNiVRuelvKgdC/MjsQy/E
	jRXvN5L26ycSxYeqlffjoRsUAm224RbmaH2//gzL1JfHuqn/rq5b4o2HXYM1QRXiW8bcGqybvM/
	VC5xRbN65fqWuTXivZCiJ26/ot3M9SpBGBrADLe4gCQDIRi7dm0ACnpleDJF+MOZS1Qj26d5wzG
	bHz/fZFRpCQ36F/bbjvx8=
X-Received: by 2002:a05:6402:404f:20b0:6b1:c2ed:d027 with SMTP id 4fb4d7f45d1cf-6b3a81abaa0mr2274193a12.29.1792343886584;
        Sun, 18 Oct 2026 10:18:06 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3cbe98563sm525698a12.27.2026.10.18.10.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:18:05 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	john@phrozen.org,
	kvalo@kernel.org
Subject: [PATCH ath-next] wifi: ath11k: report TX retries in station statistics
Date: Sun, 18 Oct 2026 19:18:03 +0200
Message-ID: <20261018171803.1545946-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ath11k does not fill NL80211_STA_INFO_TX_RETRIES, and mac80211's TX
status accounting leaves it at zero because the driver reports no
per-rate try counts. The HTT PPDU statistics carry the MPDUs tried and
acknowledged per user. Report the unacknowledged MPDUs per station as TX
retries and leave TX failures to mac80211. Over 6 runs of 30 s the
station's TX retries track the firmware's pdev mpdu_requeued counter to
within 57 MPDUs.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h  | 1 +
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 +++++
 drivers/net/wireless/ath/ath11k/mac.c   | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index a0d725923e..f7ba888b61 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -556,6 +556,7 @@ struct ath11k_sta {
 	struct rate_info last_txrate;
 	u64 rx_duration;
 	u64 tx_duration;
+	u32 tx_retries;
 	u8 rssi_comb;
 	struct ewma_avg_rssi avg_rssi;
 	s8 rssi_beacon;
diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343..726a9fc807 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1454,6 +1454,11 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	sta = peer->sta;
 	arsta = ath11k_sta_to_arsta(sta);
 
+	if (usr_stats->cmpltn_cmn.mpdu_tried >
+	    usr_stats->cmpltn_cmn.mpdu_success)
+		arsta->tx_retries += usr_stats->cmpltn_cmn.mpdu_tried -
+				     usr_stats->cmpltn_cmn.mpdu_success;
+
 	memset(&arsta->txrate, 0, sizeof(arsta->txrate));
 
 	switch (flags) {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 1a237adaa3..066a503d76 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9435,6 +9435,9 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	sinfo->tx_duration = arsta->tx_duration;
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
 
+	sinfo->tx_retries = arsta->tx_retries;
+	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_RETRIES);
+
 	if (arsta->txrate.legacy || arsta->txrate.nss) {
 		if (arsta->txrate.legacy) {
 			sinfo->txrate.legacy = arsta->txrate.legacy;
-- 
2.53.0


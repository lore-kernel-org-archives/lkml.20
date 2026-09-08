Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8952654DADA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875622; cv=none; b=J984V2ORMyp8SumK3p+NO86YBKlSm99Y8k/Xik745JCBn7p9xogtDwNBFUYys/W+YqWavQOeGzqqOeleGKmZg8/QsTyqTgBzCg69thAI0MNUisVTU/wGnWKh77IWPSgHwb8uTfEjIs9479WIacmh2kDJEHT4FrSQmWQg45QO49A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875622; c=relaxed/simple;
	bh=ui7a4a3Woi27XfGFxXdwer5CuptT8ACQe6AUJ8sgdPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYX4AClJmD/5lpCBrt0mF7gjUqKtz3Xe7lsr32WO6VSLK0uwJKYboEByP41PX9bgpo0/uo3PqQcjmf3T/ddZQCdg8baq4zJqeRr/BQtadT6M9UFDn6cLi4ynnZHSHfq9FVzBX7Q55theeck4m5FiX/e3GyueV1d47ci/pY3X+Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=ZTLi9sj6; arc=none smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="ZTLi9sj6"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c15be76348eso177210466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875603; x=1789480403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aI13hMT4+xLSGth65Ot3fMrBV+yKj5UHO4cpBnEI4T0=;
        b=ZTLi9sj6FuIhK1cRGSAf/YkqYixA2wIuvj4zrxzB8f5QVlsoIT49FP8h7hAj8plLv7
         5l856ildSQFTff8hRnu7kik+6P0lKm+JEaCMqC657ESGL9ZFt2UByzM0L7czYL0cFl3h
         xWpvU/0M5p8uKYptKCyCDYigHpRlJulJJmYxK81z9LIirZpciGQNaa+cCrWqVYgyMA1a
         PQ2cm+L3iWx4sESXvZh5ycY1ONKZY8xier+MxqESbNcipY3Le+r51DQm9LBj2PvFFZ9/
         SUyC9MQOIpY6DM21rr2N7e/nKjz3lqkC2vbRd9ucFfgyEkpoLKdQO7Ge2mC/cvqgSTtU
         hAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875603; x=1789480403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aI13hMT4+xLSGth65Ot3fMrBV+yKj5UHO4cpBnEI4T0=;
        b=fK968xxsd+KDhpyelrPT1b+FKnp5z90nAiHD+YgCi0NPrsHM4KifKb2XI+LE/PeBCV
         EuAL7sx8W6MpItxHLMquF84R8jhQ7QifDV1pKL5T4ryYXlJT9Bc0ysoyH2ohW0aZX4sp
         frb8ZlOKXDxQB5US0n/N3YLcgTJzaC02K9GgB2W1i7aiD/vG/1v3wvZc8XPlgODTtHSb
         A27rwl+BfehAm+ow8nnRRnNtCyMOaNv+P2OOTKPY8T60adTSjeNQpsq+mcRtQCn7S4c+
         Fi/P530NCNlgLI0u5frxMOaIJ21uZ8Y3oxughIoTzacf6UqBh6LRBwjDwqfkaC0bCh17
         QEjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHwXMBybo8yxvi3q+RZD66gmYNwyYL+p/hY1QLD5DLcvUICCfawPETC0YywmaYPy+w2z2OsjjzIdR1v3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kYVBM1tPoIwrhgDEbsEaQ8rr5Cws8MAguvi+9zW0nJO9LGD2yT
	MY+j4LBQDdeapfM2zCZzZUrzLc1/gVw4LXDrfCXCY5p1BHqMzsMUPOilBbUqeT7SbQ==
X-Gm-Gg: AYBFou0ODOMXSm6C2Xq56VMqtlJz9fEhJsmeMTBMA0lIwbEfw5sZvCjMKDvEhUqs92d
	XAanJZ5flqRpiBokjFssStTp8fT5m9MmBNxC+kcWrzSi0cLHj4gKJw8eXUginvKAT3ldUyuJaO/
	BOPCGKJnaF7hEqxB13N4cDXeiZEfHN3fKzJgrj1DeshIunqDRipqAhtY0SSCG4CbDFainVmxa5v
	t3jTW6nKFZh4UkrCHmMVf43mxStlb/9dlakdw3jmm8/5aQQTXLxwTsIq2DTT91xjFW1tSS4lmv/
	Sn/OY5y6p40UT44M5lHX6bAqWxHx8zAiudTDvNmDX6IEJ5envxl7rNFkgFt42xt8frM+wmMZWfy
	E6fMl8mDAnWBMEdDi8jx2Say+xFmTU4nQIHgy6XLNtN2M8DhV4g13T4U6ZW5ucqbuV0nqsYMXiB
	V/twNrQOoBBEjq62UDvpzxzuKoO5x8aK69RRVz6shFPZPuT0g5Tdgz04pKcqhY2w2NFAmD1Dvy3
	tVDiuxTgFmi52m4I7qu2fPryVaImQedrr4GK7t8AR/T/UkFMl9fAvn9X0hg6PpeEYeHTSu/rsfM
	3dVNump1eABwhj038BHF+y5D0Dq3HDWFRoATGHmktwP8qNRCojHT8ibrFAspDjs0dLZeMRrDh0Q
	L+Ymg0KJPbb/+vTZHFhowcQ4VpPRAKIirHTF+vFIJza0bxvTE3wG+MPme8cLbzTGWkDbCJBRUhB
	b5upMJbVu1M69h
X-Received: by 2002:a17:907:d649:b0:c26:19e3:e982 with SMTP id a640c23a62f3a-c2619e3eee5mr931925666b.34.1788875603444;
        Tue, 08 Sep 2026 06:53:23 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:23 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 4/9] wifi: ath11k: report tx airtime and enable airtime fairness
Date: Tue,  8 Sep 2026 15:53:13 +0200
Message-ID: <20260908135319.754140-5-julius@bairaktaris.de>
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

mac80211's airtime scheduler charges sta->airtime[ac].deficit from one
place, ieee80211_sta_register_airtime(). Unlike AQL there is no estimator
fallback, and ath11k never calls it, so the ATF feature bit cannot be
advertised on its own: the deficit would only ever be replenished, every
station would stay permanently in credit, and the DRR would be inert. The
bit is not a no-op in that state either, because it also moves txq
insertion to the head of the active list, which __ieee80211_schedule_txq()
documents as safe only because the DRR moves a station back once its
deficit goes negative.

fes_duration_us arrives with every PPDU's stats and is already
accumulated into arsta->tx_duration a few lines above. Register it, and
set the feature bit in the same change so the two cannot be separated.

The access category the airtime is charged to comes from the TID, and the
ack/BA status TLV that ath11k took it from is emitted only for a PPDU that
drew a response. A transmission that timed out, was filtered or was aborted
names its TID only in the completion and rate TLVs, both of which already
reach the driver and were read nowhere. Take the first of the three the
firmware supplied that names one of the sixteen QoS TIDs; a PPDU that names
none is charged to best effort, where ieee80211_sta_register_airtime()
also puts the management TID.

The call runs under ar->data_lock and ab->base_lock. mac80211 takes
local->active_txq_lock[ac] inside it and calls nothing back under that
lock, and ath10k registers from the same place under its data_lock.

Measured on an IPQ8074 AP with two stations on one radio, a 1x1 VHT
client and a 2x2 HE client, both receiving at once. Before, 'iw station
set <mac> airtime_weight' is refused with -EOPNOTSUPP and the per-station
airtime file reads zero. After, the weight is accepted and read back, TX
airtime accumulates, and the per-AC deficits move.

What the deficit can do with that is bounded by how the driver hands
frames to the hardware. Every station keeps its full airtime queue limit
in flight and the hardware picks among them, so the scheduling order
does not reach the air and a weight moves nothing on this driver by
itself. The bit is what makes the weight settable and the deficit real;
what acts on them is a mac80211 change posted separately, which scales
the limit by the weight for a driver that says it pushes everything.

fes_duration_us spans the frame exchange sequence, so it includes the
SIFS and the responding BlockAck, time the radio spends receiving; the
airtime registered is therefore larger than the airtime transmitted. It
is a per-PPDU field, so each user of a downlink MU PPDU is charged the
whole sequence, as arsta->tx_duration already accumulates it; the stats
carry no per-user duration. On the firmware tested here every PPDU
carried exactly one user, over 21051 PPDUs.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 17 +++++++++++++++++
 drivers/net/wireless/ath/ath11k/mac.c   |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 33425707c084..68472e1e748a 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1377,6 +1377,7 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 	u16 rate = 0, succ_pkts = 0;
 	u32 tx_duration = 0;
 	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
+	u8 airtime_tid;
 	bool is_ampdu = false;
 
 	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
@@ -1485,6 +1486,22 @@ ath11k_update_per_peer_tx_stats(struct ath11k *ar,
 
 	arsta->txrate.bw = ath11k_mac_bw_to_mac80211_bw(bw);
 	arsta->tx_duration += tx_duration;
+
+	/* The ack/BA status TLV names the TID only for a PPDU that drew a
+	 * response; fall back to the completion and rate TLVs, then to BE.
+	 */
+	airtime_tid = tid;
+	if (airtime_tid >= IEEE80211_NUM_TIDS &&
+	    usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON))
+		airtime_tid = usr_stats->cmpltn_cmn.tid_num;
+	if (airtime_tid >= IEEE80211_NUM_TIDS)
+		airtime_tid = user_rate->tid_num;
+	if (airtime_tid >= IEEE80211_NUM_TIDS)
+		airtime_tid = 0;
+
+	if (tx_duration)
+		ieee80211_sta_register_airtime(sta, airtime_tid, tx_duration, 0);
+
 	memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
 
 	/* PPDU stats reported for mgmt packet doesn't have valid tx bytes.
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 38f641bbc53c..40a2b6d2f804 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10593,6 +10593,8 @@ static int __ath11k_mac_register(struct ath11k *ar)
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
+	wiphy_ext_feature_set(ar->hw->wiphy,
+			      NL80211_EXT_FEATURE_AIRTIME_FAIRNESS);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0


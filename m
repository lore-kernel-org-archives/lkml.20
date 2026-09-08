Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7BA54CF53
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875622; cv=none; b=MpecHpH/kzSaq/CyL5c8uCqiwhRBfhvlFw9Um5mqoSjWQokg6LHAGomK5wj30Rg+xoxyVqwA6uNMkfiXzF9ArqJAr9BcW1YDWeDKO5RXvT9vV7UZrEXDXDB/Qq0KcODj916Hnye6VeJSgq1rPcjHcQdL4foZ8+m+WQjSAYDFaN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875622; c=relaxed/simple;
	bh=U+YBo65UubxeHj2ED/frpI+wjbfAB/Yy4rnT49+O/jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9hXGAfOXUQ/5YrHH1fGP8T4K2KABvRxRHRhW/5QSLArHMVxC2A7lcj5Pd9Gmh4istJtW1oyswZlyYAO3Dm1ZX2hXtwjiSjnkmLt+mwUJGpD63RdiaiNDJA53kac2lCHlLPXbkbjb7EKCUstL4F5GGCIqvTU4Q+6MW29sDFrQ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=uOBgUL4P; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="uOBgUL4P"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c25b661d37dso653167366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1788875602; x=1789480402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2hMGkA6N+e7t0Ka56skOJW9Bs0c/5KzjT5GcuZfFgU=;
        b=uOBgUL4P82zCJc13RTTtMVSAkUoarEB82ITu2i30oe7WTTsqc9sZhNmqaM3aT5QR/5
         hdRvPX940xISknfNFQkWicjVHx+dyJMshyp+SsT17F58CkeWvTqHvN05RUCHOf5RjbSY
         mLEpN+Eh0jl2IC9ELqHWyz00bKKwIuYd+6PpDCOwZdhVGv23OcqwUGMFthrh1tSUjh+J
         eIR2BtvwjqCSZTxDV/52R5o2tG/j4OG4KDYdSDCQI5pMBh2vSoTYbWJuHE9T/8HdH2JX
         NUvGIn8Lg4kNK5OPvxs51eRx9kUtyKIRp7meNlKNle9WMUn5H1Bzx01FDzs1J9jLoI/H
         DmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875602; x=1789480402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2hMGkA6N+e7t0Ka56skOJW9Bs0c/5KzjT5GcuZfFgU=;
        b=cc4XclD2fbp2kBHoxlNFanyFyCCiwcIzeEXBl5fAGs1vgZ82lK+gcPfLk3u3sakE5m
         NCwJeFo6M2lrvNnK6SRnzZjo7IyOCZu2c/s6Ckx10tRELeuDqix0YvHkw7EuMb7VXEo9
         I327QiJwaDOkyY+tH63agGoh953lwUldaXCBmhyJsCiuypS5HEIzDNYvhgK9rqFj/1+J
         1hjikcHRBPcOziaNcWSdJv+2C9EuIIqFT722ongENj9sDSWHCTX4HKt0B8VF0HwenCeO
         qKu8H7LSiE4E9sBFB4ElG6ZnVRjOGVY/R4BPvzuSQqXzxvqNCVPjwnd4ICPRvAHi2P8j
         pH0w==
X-Forwarded-Encrypted: i=1; AKwUvByK5FLEmVTlOcmHl9UKt81D/kGhqt8t6A7oPgd0MZ9Ad732OROEKIPUfqnHOrWXOg4RiOWH96HtYA8AqvY=@vger.kernel.org
X-Gm-Message-State: AFuF++lcwrE4akKcUvW0W6T/2ayuPcpgtoma5MUck3nQeqPgSeI7u+/v
	aT1Ps1fkEKbF4FVsKZaAUMpuWW11jG6pXUK7DU7Ca/XDdfdaTRm4filF2jKzBc2krw==
X-Gm-Gg: AYBFou0Lrf4sNU4oGvlbiTETt9tQwFwIL3u7rbpyz/O1pQG37T2rRDsqZQQA61HHvAV
	3fty3IVm+JMZXylVKWzYmZ86luH0bAqXYcbnTLU8sVpmUqLeXe4RvbU+T2quqn7foikZzdW8hKf
	On0hha9A1yn1GyxqM9bn7LaZ6clyffiqP/m0N9K+3+edxvZZr2ozqPog24uwzjaAkcH1ZaN5OyP
	XVk84CILysQHWW1zBbWc14xkdrhrAtu/7I7Sgjq3Scm8KzmKMTbz1NzjBXYOutYpaFYB0HDPO3o
	IPt3SdAAlUsaF4tmBReFoBV3tco9W4AF6nvfbAfMrUKUW4AvYE/ZwSHf2bu7SRAn+DQX0OTOqNz
	pH9lotgfrLpnN3MimsWsIMMGh4UvNALc+ORCdJJ8JzsdKh2VG3TVbaKFa8RWvWklTpme1WI76J9
	HCrfJjyRu82UW/5C9Wc4ZAYc/K59yywlQ6GLWVzG1pbTK/U9U2DNQzH1r9CWxhaYHBg+F3DYQuO
	klg6QEN9QhONk7Ltd/LTiClvxSfQaBxm17gBVg0jiAvXr1YSuQUckFl7R/Dz8n75oEAgVKJ9sH3
	jXZanXErE6dQU/kvoE7OH8yTzAECF5lnM82JAzVbdlvZrxwyPmyFdYlyFKPoflEHBOvRM532C6K
	Z2RCGaKrK7ZkxgTbeDxqq48zouP9nSAw8rYsABANkiqo/xa46smY6RJINzshsgVQCHqvG+mGwEF
	30M8On3zPqIoQR
X-Received: by 2002:a17:907:7a8e:b0:c26:19e3:e97d with SMTP id a640c23a62f3a-c2619e3eefbmr961872066b.29.1788875601889;
        Tue, 08 Sep 2026 06:53:21 -0700 (PDT)
Received: from Desktop (pd951346e.dip0.t-ipconnect.de. [217.81.52.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm647602666b.58.2026.09.08.06.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:53:21 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	toke@toke.dk,
	sven@narfation.org,
	quic_vthiagar@quicinc.com,
	john@phrozen.org
Subject: [PATCH ath-next v4 2/9] wifi: ath11k: enable airtime queue limits
Date: Tue,  8 Sep 2026 15:53:11 +0200
Message-ID: <20260908135319.754140-3-julius@bairaktaris.de>
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

ath11k does not advertise NL80211_EXT_FEATURE_AQL, and every user of AQL in
mac80211 is gated on that bit: the airtime charge in
ieee80211_tx_dequeue(), ieee80211_txq_airtime_check(),
ieee80211_sta_update_pending_airtime(), and the per-station aql file in
debugfs, which is not even created.

That matters here more than it would elsewhere, because AQL is the only
brake. ath11k uses ieee80211_handle_wake_tx_queue(), whose
wake_tx_push_queue() drains a selected txq whole into the driver, and the
check at the top of ieee80211_tx_dequeue() is what stops that drain.
Without the feature bit nothing does, so mac80211 holds no backlog and
every queued byte of a saturated download sits in the hardware TX rings,
where there is no AQM and no flow separation.

Measured on an IPQ8074 AP with a TCP download forwarded from a wired
host to one 1x1 VHT80 station at 101 Mbit/s, sampled once a second from
that station's own aql file: BE pending airtime sits at the 12000 us
default high limit, 12024 us at the median, and at 1008 to 1024 us when
the limit is lowered to 500/1000 us. Pending airtime stands a frame
above the limit it is tested against because
ieee80211_txq_airtime_check() admits a frame while pending is still
below it. Without this patch the file does not exist and the limits are
never consulted.

The rate the estimator needs is already there: ath11k keeps a per-station
rate_info in arsta->last_txrate and passes it to ieee80211_tx_status_ext(),
which stores it as tx_stats.last_rate_info, and that is what
ieee80211_calc_expected_tx_airtime() reads. Where no rate is known yet the
estimator falls back to its 4 us floor, so a station's queue is charged the
minimum until the first HTT PPDU stats arrive and the per-AC limits of 5000
and 12000 us stay loose over that window. The current code charges nothing
and consults no limit at all, so that window changes nothing. A rate that
has gone stale low overcharges a station that has since sped up, bounded
by the same lag.

The estimate is only as fresh as arsta->last_txrate, which is updated from
the HTT PPDU stats when a descriptor is evicted from ar->ppdu_stats_info,
so the rate behind it can lag a rate change by up to
HTT_PPDU_DESC_MAX_DEPTH PPDUs.

ieee80211_sta_update_pending_airtime() returns the airtime but does not
reschedule the txq, and ath11k has no completion-side push, so a queue held
back by AQL is re-poked only by the next enqueue or queue wake.

The bit alone brakes the queue but does not refill it: the check at the top
of ieee80211_tx_dequeue() stops the drain, and nothing restarts it until
mac80211 next calls the wake_tx_queue callback. Later patches in this
series give the driver a scheduling round and run it from tx completion,
which is what makes a binding limit affordable.

ath10k and mt76 set the same feature bit.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2d55cdc4d165..38f641bbc53c 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10592,6 +10592,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ar->hw->sta_data_size = sizeof(struct ath11k_sta);
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
+	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0


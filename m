Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04FF3EC807
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546007; cv=none; b=MmIyTvpIzAgKnZoy9WBmB3xilBOGRym2fwP2KVCVRXlrTlyXBnlcnBaXJRRYHHKk/p90a8HlU+EUCFDwvMpCpb5az4q7zGOk/7dUqAVlPViTHqLRTPgvzIDHy1eduleJZ1DdbIXq6P4knVGhdQWWCrL9M+koF3bRey3AhiUtYaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546007; c=relaxed/simple;
	bh=zm8TN2xPa5JL/ZTyjZUP3HljYWUuDS5MN3Zj9QJzrjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q0eaJ88mTDBdwTaBAi+2RIOWiTMTumsS8uhTugprYwN+ubyuTs/qhigJvfj9dZ9WIKgXSacwKR0ImxE7AsIXNdGCkS0cUx/hRUiFpOzPyKKh2QD6NuTtWkYdrTWM1vL2+Rqhr0XDmmBLHdJG3gcsF+wdqLctq4Tyx8vHf5MGebo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+KxVzXb; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+KxVzXb"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9103f5b813aso8820656d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788546004; x=1789150804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YhHRDInvyI4x0tUqUbt97XsUeP2DQ10IkqTjP6rmV2U=;
        b=I+KxVzXbozLy8JQldmQpYXWEBMi3LXhT6ZYQJxfPOmq0lmZRUszxb6HTwyVnc8vxIT
         vnwXsvnmGikTbP/o77PbHWFbiJpM8Ojbg15kSDWhk72RHl4bCWkAHb6ML5P7RI25lNxk
         bR/x+8I4ohCP+FRCFjVN3SAt5kk3k03A75Yr1x/Ie3+OlJXkBCPVgr9yry+Jifz+EaiG
         cVnycgkUm/ThLkT18YbG8APKExe5FIRCMfCS+/3h/WMH0sJSbOWEO3qIy/5acq1Sm5Zb
         CkRxB6kqF7cRsneiGplRDHoQvhncTCC1QjWQEmQ0jFDSpD7v4i4ceNaKMUhySsleraJx
         Dd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788546004; x=1789150804;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YhHRDInvyI4x0tUqUbt97XsUeP2DQ10IkqTjP6rmV2U=;
        b=bmnOHYXRRlUuTWeZWpkTlI45FY5LbaCODNu9nKRkXtMB9KZuZMsA5wYFb0ARw+hDyZ
         /ZRuVJTiobYowxx5K2CrxRmlUa3f2y2w8ruI2PQtsiMc4H7p7QYk1KAYJUlRr65qwb19
         3wdyUHAWem0BLHLb2EpD0rdHw45ds6tCARTU1ECgNldKk1QNFwSiUVxuacFXlkv/s240
         EDPOAhbrLV4rp8HhohklhgFq+h1OCBHD9iV8YQ+KVEzYZ4DJaOmPzPiEIz6+0nEiv1fv
         XpiG1Ct2IEt8WmmiBKAVBv+zbBLwqYbNLHTrdvuzY8lUv1tKmi7nznUFVFgoxwhJTeXG
         x0ww==
X-Forwarded-Encrypted: i=1; AKwUvBz/P3tZX79UEgYYcnHy5lDGCf7qt1OD/j5wuvBVWPTQ4A/LBScFesn6reXuWifeqR3hT9bAjMok9HHyVWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l7yrVKptAcq4LXfQcSCOAzZ+4bS2U9sJRY7/9GyRSTm65k/QAp
	6tXEg6Vm8sHyUsz1yteyY4mNUrDEmHZClDEbT9It3OsiBz75sbZTwuw=
X-Gm-Gg: AYBFou0h5dBrAgk1vesH6vIJaz8v0VX9RODr4tsemVu8mU2o3v6ILwvKZ9M0WyshTTD
	zDpoSKXMeKk6+tcuG5W2yg8mOoB546dumInZrE3iXY9Y8T4cEX/RLqAYobiGdMAUqto6DOGqWw3
	c39BIgc5klX7u1l9pJwwiovWl2lZUM+crFhoLsUYasVc87sgFa37/RjqB+8a7WW6eWiQSETaOZn
	wjWNYfkSo5Mn7U1rkHx+Ad6D+TREu0atbcxYQczob4N5sCcMjap1eU/jt0bh6ZDzrtZo3HJGeJc
	RZ1Y62B9SEzZvb8hWm6IL/BxJIfwxunFTQ38qDwUbL1f0N1Jq6BfX9p+T0jJx+lqraWk/KR8nMM
	KS9XZKe9n1kEbGT3RbMl9NG+O4M9ffTBVwmPSL5unoswwKVGG3cmYl1momFTyqEzW35NFHo3/7a
	I9UJzVpulPoGyY5U20cGwV78tPU6U0j4lZ/8pLqxFeykwcLxTWizLd3j38cZp5TCTBU8sd9QtHB
	y8N5TTbsI7tKLOa7yddlvwI6n4RSbYdmA/efKKyMcopFfSfK4vOx12G+QsnhIiXuMCvXy6z7aGB
	HVKB
X-Received: by 2002:a05:6214:21c8:b0:910:3270:51cd with SMTP id 6a1803df08f44-9103ef9568amr87602966d6.19.1788546004315;
        Fri, 04 Sep 2026 11:20:04 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104067b033sm26251956d6.30.2026.09.04.11.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:20:04 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: Simon Wunderlich <sw@simonwunderlich.de>,
	Kalle Valo <kvalo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: ath9k: count spectral samples in the driver's own RX stats
Date: Fri,  4 Sep 2026 21:19:58 +0300
Message-ID: <20260904181958.790792-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath_cmn_process_fft() is shared by ath9k and ath9k_htc, but it casts
common->priv to struct ath_softc to reach the rx_spectral_sample_good
and rx_spectral_sample_err counters. On ath9k_htc common->priv is a
struct ath9k_htc_priv, and with CONFIG_ATH9K_DEBUGFS the increment
lands far past the end of that allocation, once per FFT sample. On
x86-64 with a distribution config the structure is 2664 bytes and the
counters sit at offset 11912 of struct ath_softc.

Store a pointer to the driver's struct ath_rx_stats in struct
ath_spec_scan_priv and count through it. Both drivers pass their own
stats to ath9k_cmn_spectral_init_debug(), and both print them in the
shared recv debugfs file, so the two counters now also work on
ath9k_htc. A pointer keeps the common code free of driver structures,
which a check on the driver type would not. Without debugfs the
pointer stays NULL and nothing is counted, as before.

Fixes: 03224678c013 ("ath9k: add counters for good and errorneous FFT/spectral frames")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
Changes in v2:
- Say where the quoted sizes come from and why a stats pointer rather
  than a check on the driver type.
- Add Assisted-by, rewrite the commit message, rebase onto ath-next. No
  code change.

 .../net/wireless/ath/ath9k/common-spectral.c  | 29 ++++++++++++-------
 .../net/wireless/ath/ath9k/common-spectral.h  | 11 +++++--
 drivers/net/wireless/ath/ath9k/debug.c        |  3 +-
 .../net/wireless/ath/ath9k/htc_drv_debug.c    |  3 +-
 4 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/common-spectral.c b/drivers/net/wireless/ath/ath9k/common-spectral.c
index ca01a07f6630..d8be24ebcd24 100644
--- a/drivers/net/wireless/ath/ath9k/common-spectral.c
+++ b/drivers/net/wireless/ath/ath9k/common-spectral.c
@@ -465,6 +465,20 @@ ath_cmn_is_fft_buf_full(struct ath_spec_scan_priv *spec_priv)
 		return 0;
 }
 
+static void ath_cmn_count_fft_sample(struct ath_spec_scan_priv *spec_priv,
+				     int ret)
+{
+	struct ath_rx_stats *rx_stats = spec_priv->rx_stats;
+
+	if (!rx_stats)
+		return;
+
+	if (ret == 0)
+		rx_stats->rx_spectral_sample_good++;
+	else
+		rx_stats->rx_spectral_sample_err++;
+}
+
 /* returns 1 if this was a spectral frame, even if not handled. */
 int ath_cmn_process_fft(struct ath_spec_scan_priv *spec_priv, struct ieee80211_hdr *hdr,
 		    struct ath_rx_status *rs, u64 tsf)
@@ -472,7 +486,6 @@ int ath_cmn_process_fft(struct ath_spec_scan_priv *spec_priv, struct ieee80211_h
 	u8 sample_buf[SPECTRAL_SAMPLE_MAX_LEN] = {0};
 	struct ath_hw *ah = spec_priv->ah;
 	struct ath_common *common = ath9k_hw_common(spec_priv->ah);
-	struct ath_softc *sc = common->priv;
 	u8 num_bins, *vdata = (u8 *)hdr;
 	struct ath_radar_info *radar_info;
 	int len = rs->rs_datalen;
@@ -624,10 +637,7 @@ int ath_cmn_process_fft(struct ath_spec_scan_priv *spec_priv, struct ieee80211_h
 				ret = fft_handler(rs, spec_priv, sample_buf,
 						  tsf, freq, chan_type);
 
-				if (ret == 0)
-					RX_STAT_INC(sc, rx_spectral_sample_good);
-				else
-					RX_STAT_INC(sc, rx_spectral_sample_err);
+				ath_cmn_count_fft_sample(spec_priv, ret);
 
 				/* Mix the received bins to the /dev/random
 				 * pool
@@ -642,10 +652,7 @@ int ath_cmn_process_fft(struct ath_spec_scan_priv *spec_priv, struct ieee80211_h
 				ret = fft_handler(rs, spec_priv, sample_start,
 						  tsf, freq, chan_type);
 
-				if (ret == 0)
-					RX_STAT_INC(sc, rx_spectral_sample_good);
-				else
-					RX_STAT_INC(sc, rx_spectral_sample_err);
+				ath_cmn_count_fft_sample(spec_priv, ret);
 
 				/* Mix the received bins to the /dev/random
 				 * pool
@@ -1052,8 +1059,10 @@ void ath9k_cmn_spectral_deinit_debug(struct ath_spec_scan_priv *spec_priv)
 EXPORT_SYMBOL(ath9k_cmn_spectral_deinit_debug);
 
 void ath9k_cmn_spectral_init_debug(struct ath_spec_scan_priv *spec_priv,
-				   struct dentry *debugfs_phy)
+				   struct dentry *debugfs_phy,
+				   struct ath_rx_stats *rx_stats)
 {
+	spec_priv->rx_stats = rx_stats;
 	spec_priv->rfs_chan_spec_scan = relay_open("spectral_scan",
 					    debugfs_phy,
 					    1024, 256, &rfs_spec_scan_cb,
diff --git a/drivers/net/wireless/ath/ath9k/common-spectral.h b/drivers/net/wireless/ath/ath9k/common-spectral.h
index 011d8ab8b974..0e2c7d6d3487 100644
--- a/drivers/net/wireless/ath/ath9k/common-spectral.h
+++ b/drivers/net/wireless/ath/ath9k/common-spectral.h
@@ -94,12 +94,16 @@ struct ath_ht20_40_fft_packet {
 	struct ath_radar_info radar_info;
 } __packed;
 
+struct ath_rx_stats;
+
 struct ath_spec_scan_priv {
 	struct ath_hw *ah;
 	/* relay(fs) channel for spectral scan */
 	struct rchan *rfs_chan_spec_scan;
 	enum spectral_mode spectral_mode;
 	struct ath_spec_scan spec_config;
+	/* driver's RX statistics to account samples into, if any */
+	struct ath_rx_stats *rx_stats;
 };
 
 #define SPECTRAL_HT20_40_TOTAL_DATA_LEN	(sizeof(struct ath_ht20_40_fft_packet))
@@ -169,7 +173,9 @@ static inline u8 spectral_bitmap_weight(u8 *bins)
 }
 
 #ifdef CONFIG_ATH9K_COMMON_SPECTRAL
-void ath9k_cmn_spectral_init_debug(struct ath_spec_scan_priv *spec_priv, struct dentry *debugfs_phy);
+void ath9k_cmn_spectral_init_debug(struct ath_spec_scan_priv *spec_priv,
+				   struct dentry *debugfs_phy,
+				   struct ath_rx_stats *rx_stats);
 void ath9k_cmn_spectral_deinit_debug(struct ath_spec_scan_priv *spec_priv);
 
 void ath9k_cmn_spectral_scan_trigger(struct ath_common *common,
@@ -181,7 +187,8 @@ int ath_cmn_process_fft(struct ath_spec_scan_priv *spec_priv, struct ieee80211_h
 		    struct ath_rx_status *rs, u64 tsf);
 #else
 static inline void ath9k_cmn_spectral_init_debug(struct ath_spec_scan_priv *spec_priv,
-						 struct dentry *debugfs_phy)
+						 struct dentry *debugfs_phy,
+						 struct ath_rx_stats *rx_stats)
 {
 }
 
diff --git a/drivers/net/wireless/ath/ath9k/debug.c b/drivers/net/wireless/ath/ath9k/debug.c
index 74a0134075cf..042a4f542a94 100644
--- a/drivers/net/wireless/ath/ath9k/debug.c
+++ b/drivers/net/wireless/ath/ath9k/debug.c
@@ -1389,7 +1389,8 @@ int ath9k_init_debug(struct ath_hw *ah)
 
 	ath9k_dfs_init_debug(sc);
 	ath9k_tx99_init_debug(sc);
-	ath9k_cmn_spectral_init_debug(&sc->spec_priv, sc->debug.debugfs_phy);
+	ath9k_cmn_spectral_init_debug(&sc->spec_priv, sc->debug.debugfs_phy,
+				      &sc->debug.stats.rxstats);
 
 	debugfs_create_devm_seqfile(sc->dev, "dma", sc->debug.debugfs_phy,
 				    read_file_dma);
diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_debug.c b/drivers/net/wireless/ath/ath9k/htc_drv_debug.c
index 9437d69877cc..9d354b1d929c 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_debug.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_debug.c
@@ -487,7 +487,8 @@ int ath9k_htc_init_debug(struct ath_hw *ah)
 	priv->debug.debugfs_phy = debugfs_create_dir(KBUILD_MODNAME,
 					     priv->hw->wiphy->debugfsdir);
 
-	ath9k_cmn_spectral_init_debug(&priv->spec_priv, priv->debug.debugfs_phy);
+	ath9k_cmn_spectral_init_debug(&priv->spec_priv, priv->debug.debugfs_phy,
+				      &priv->debug.rx_stats);
 
 	debugfs_create_file("tgt_int_stats", 0400, priv->debug.debugfs_phy,
 			    priv, &fops_tgt_int_stats);

base-commit: 1d8e73163ef933624341075f576e2f36ef9133f7
-- 
2.55.0


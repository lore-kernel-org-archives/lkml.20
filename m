Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AC14E13F4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451887; cv=none; b=nqYoyxYnJkLcQXDa/isiYUFlq/Ab3cu8cvQArnnqrxpwdikuURKC0W97SBzPVhktM4Wq0WsACxXEzkXTM2e/vknlV9LXKkNAaQyyF+41QvpRQohMW0j7pzyz8ypNRt7utRYu7WUdLDA6rOskxWoQaWsMR8MFc5T2y8Qe+TLEabU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451887; c=relaxed/simple;
	bh=2e6ifUArSTAVZC8ee9LF1aKiyq3i10LwIFnVfhebai0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YUGRzG3ZRy2SZAAa5gwJlNP4KpCNyqpXKvWSH8+QT7NAL7nEKOi1r+vDa+Q59B/4GnvNKCwErdY/g6BzS7H5HQ/BkJviLLyFqMy7eNII30l/ntvp+gTPRT2w0JtMZJBDBg4baTCidbBbqrkzofNYmZq7HQYx1ZGKBnG3hDqrxG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFPkwhci; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFPkwhci"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48441fa5c37so20794f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451884; x=1789056684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S2TGmDpaicmMMDJ7fqARGltuMmtVbbVcviZ6kiWpmxg=;
        b=JFPkwhcijjiCeWNUeuUtPALb/jmfhCI2qcf4/6520Dqts3njwXDfAsj9bSe1KQq81H
         4UNMIdUzBt4NMbXopWAymnETVWSINihGhmp/XaEbOZUe1viqaD7mhlFaavFTkK/I51MF
         O0t5CUOEvKkuj30EgXk4oJtD6J1ajb2ujuSVXTr4YQlp7xv2Z5cCZghvp7w0GLPJGIQ3
         lHJ6VKAuNQ6GmSvvV6giX9dIJr9TNWud8J2yDxkB1KnLrji0rTZksFjh8ZR+ZOxwE14k
         9/29g783lUx0C0/5HcOAOIswJYLtsJbu4tODcTYRSV52cMWJFVR1difqH045MrONhegK
         BVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451884; x=1789056684;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S2TGmDpaicmMMDJ7fqARGltuMmtVbbVcviZ6kiWpmxg=;
        b=YFtE3nFHMzxjkMgmGM4/lf1qkeKN98O8VO56SYC6gVw6zvxwacoOXSc/DldTxbsdiF
         EFhLSzI9O123fv+jgCoQuT4pbiUV/CbZeulekesU/jLwfGHjutATh16QQS7GemJ2BKgd
         bG4jh2v485SXKz4jAE3iiGN8V+06nU5pH7Hgk0C2OxtftfUelNsPZQ6wkZQO5ahCvFix
         TuCrecyCtDpoT8Pd5+dZG4rMOa0ZIVrZcr+hvtPBg8exAHcwGD7QaJCuqgkVEXB99mMO
         pOpWMLEVld1Q9UZUESC2d62WxrzB5ILaOYkJecdPiuQ9TuZTo7uE8umzwXxI0vfbivNO
         iQbw==
X-Forwarded-Encrypted: i=1; AKwUvBz7t8nTXsHtn68O0H6VxTI2QMYMfl9aoYNnwfLVw5aNlE+pfsZQM0Jt0+FJn05N7Gsnk9+VDlrZ/FT2kpY=@vger.kernel.org
X-Gm-Message-State: AFuF++nvNvYHZm/ew3XY2+Q2JhjzH65QXdaQXtMP+BLUSFGj2NdySiYF
	gzpw/sXz5S+Ei0Cz5XyqHU4AYLE6cFIHEW3qmxVrFfEXtNgcjzGWdmx+ADSb
X-Gm-Gg: AYBFou2h9oXDMYZ+y167dnDATDxJVh5wANcl8LkTuBcHNxov13Q5EIw/AskiYpLc3hT
	FXngG5mXfreug9wLhPXJTQ+5DUt7F/y5iErA3Mg/4MiKcmYYXyd1M+bzpjhKvPkqxuqPbN2j5pw
	08KHCQma+Z8/eS8kBYj9WTyU19WIHCw7sLe8L3vJFNv7ev4QzBVnTk/Z+awJAA+CZS2EVOFNx1K
	4iucZIfEvDRnwzZgaAWbRrzllf1jaOeJ/9eDSXUS9lLY+p6k0zGjeTj2STW0wpxajJIquPUBnY5
	vtsbz4sxD2HiS0+9vnMWV0fjqGJrQ7WpUIknP9aVPOm52+Nb5NMIl/MLWn5lkq0X0ITKlyujLeb
	ptWG+25H4cY10svzIaqcSaoyT5sFy9qE79bn3uHP8pV0ORxEoJh8z2v/7zfFUPKVSWbrzL9Ojir
	eZTyQmTwtRQPs3DDlRzFkV9s9XXx0mOtrUzZiSJqM4Towj9Biziqz6C8jmUSGFZwX9VFYKCRpcQ
	PCEqYEM0bLtodVHjNspHLUvyVPH0ambSBSAag1DD7fZHeAuDi71DYj6FelT4tYZ6Sl9yKE68hby
	IBeA
X-Received: by 2002:a05:6000:2512:b0:484:4153:11df with SMTP id ffacd0b85a97d-48587287d5bmr149335f8f.11.1788451883778;
        Thu, 03 Sep 2026 09:11:23 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e736a6sm14480539f8f.5.2026.09.03.09.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:11:23 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: Simon Wunderlich <sw@simonwunderlich.de>,
	Kalle Valo <kvalo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath9k: count spectral samples in the driver's own RX stats
Date: Thu,  3 Sep 2026 19:11:16 +0300
Message-ID: <20260903161116.1035795-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath_cmn_process_fft() is shared by ath9k and ath9k_htc, but it takes
common->priv for a struct ath_softc to reach the sample counters. On
ath9k_htc that pointer is a struct ath9k_htc_priv, 2664 bytes long, and
with CONFIG_ATH9K_DEBUGFS the increment lands 11912 bytes into it, well
past the end of the ieee80211_hw allocation, once for every FFT sample
the card delivers. Give the parser a pointer to the driver's own struct
ath_rx_stats instead, set when the debugfs files are created. Both
drivers keep one and both print it through the shared recv file, which
also makes the two counters count on ath9k_htc for the first time.

Fixes: 03224678c013 ("ath9k: add counters for good and errorneous FFT/spectral frames")
Cc: stable@vger.kernel.org
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
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

base-commit: ca800a9302764c445de0da0e84d2252400a770ee
-- 
2.55.0


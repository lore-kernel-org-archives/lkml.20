Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987117;
	b=l5IA94n3MHiVqGGKc+vukjhexMnoesd6qeXcQmCyr/Qv2m/xjreJtSXmlKOWuqMkZQiF
	 vNhs1vQMjTM+d7lf5Vd85jUNnLNBOJxIc8HzdPEQWHn+U30lRBXmqERsywUBkSwv2RHeR
	 iS4vXA/UR64tSeGcjH8h9FWB11tGHwODZC1ULHRpcdddnbnH47jJiCnk6rksDmxZeGg8D
	 7JA9ILGrT4wLRe8CBLJaziE3yCBmPS3+9RC/61S+UEZOjBiY2R7yb7Sc0mOdMcgRupLSS
	 E1uGVZPmsGsVmyoXC2DZK/VCBQy8Q8XQtnvlUAG4g5LlksZ0XS1TVSmclKGNhxyXqiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4CMPivMj5lPjl2wG/BuDRaWBDMCf5JHQJ05QDbYwmzA=;
	b=CHiNIoyZQ6flE5AGKh/OIz3GfZVhsloje0VUKbB4rLjp5W1AamW7XrQJ2HDyZgOyoALH
	 BU/3mCJQvGqT3UvKGcyxgnaqW9UvuMaP5a37N5CGWQWnbuWwhwwV4YUneNBKKGRPFAREi
	 +XZ5M0NC3Pdd0wvDroo7IJy5EUXbWqJhDx5rPN20Hpy2fYg7X4YSKpM0njWaNiFFnI7Ud
	 0zIE82Oh0YL5UdoNkxGoX6Sf0jS9fZ3a/0zamiZVJZ45/cH7cpFdpJzffbNJEUl25JjZw
	 ry+Lv57AcGo6ZMIswCVLuHYSVERQIyLh/C9unrEzwOeEcyASXQezRlkf7bLhF0ge9Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oCXOCegf;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DED606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52DED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oCXOCegf
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so6179783eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987116; x=1793591916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4CMPivMj5lPjl2wG/BuDRaWBDMCf5JHQJ05QDbYwmzA=;
        b=oCXOCegfXtSJnIur9YIJyxMDv7keBYCBjuq7AVdDTAh/4F6DAzfQQe0n8p4rb+Oa80
         Bkp74PGWnQ23Rb/jGswQChL2d8asovc1Di0c35Fc/OGdXZws9q5gL2wmZRXXkw1f+SfW
         jKJrBPiCQH9yp2HCr7KJqktINFKeAiY5pQdX2wU6VCmcRvE5ocu1B/9ue1L5awD+wn8T
         hhOEhDovFmwX/A8ghtMDNmApmra6ibY9XnaONvAhLnP5/wP3gKi1KYNQTwnN+rMjZidC
         ItAK+oCqTxdmqc9cjMUeHoRZRI6Q6YHTKEkfmPuRd5xUg01K3TNLQBvYWwF/t3ChVwWY
         W6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987116; x=1793591916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CMPivMj5lPjl2wG/BuDRaWBDMCf5JHQJ05QDbYwmzA=;
        b=Zudeuqdth5ZYm2mzkExP03zr15cgfSc3TASLuxrysZaFPoyHEnk9xF8qDTkVFIzNHP
         CU12LjxwZXakksYCfqGruCaU7dixM45ZUkPyb9Sc9q2dS+COH7MdTQLOGIi95/lfTtsV
         pqH35u9kc13REoXu9L5rAwgZRBEI3GfdAuUaBlogkFyhF2QHwVxPvzfNckG6Ja4QDEln
         j1YHIgegqI4u0Woej1DO465IzhB9vubBirVFpFyF6UxjKpNxarLwvyNe3oGU6jBRlkL9
         bTL/uRzBXI3qfFtlFsCAqFdaqdqNXHAwkMRfpA4unXnJ1/IxcosZrBYkAnippq7sfOaB
         NqCA==
X-Gm-Message-State: AFq9FYLxqB4sMB6Q/lgpg2Rxa0EPhnEdGra9UiTkWnl23fuvzHwEJvAD
	qtKVs5/wdzNGAApqsqnuFp7BvKukeCNbs942adEgSer0vrTsErEhdPoo
X-Gm-Gg: AYBFou3cpugm7rHLeRcW2uPb9h8DWaW9ADan4ASL0hvt4V6aHa5dYP+gt42RpOTNNHm
	+Ht9OP+A4PLS/x4gU5TK1+Q7jDqmtIce6wstJhUXvreeLaWXTXDD0odUp/AftCXnKGC37OlSHX+
	3aKFUkDS52QXOtjChQQHfex1oWIPmpvvIAfd62RjeH7AIQCn2ToUCQ3Y56F8+Lcbixm17hAAx62
	a4RTb/gz9l1hVsF04lVEQiinzIxlNUK2ROPufDv0sc2JvpCk7nvHt0AUyRFaN19BIkrj1yCowyV
	6Z8W8EBiFEMkH3tGt2uTTOKdPGVxVvD/lrrqJYuJyTy+eCLH2M992E4q5SQCtR5MxDjwfjsVNGc
	IrnJHytNhQwBB9etXLQGbzAp4l9OQb7LJCKlGtBHCMpKB4ibGNtiXuosG4G/dcp7oBL40k+veHN
	xzujYVWr5FSkilMRCW6JCiNJ0M5CizsGzUN6Zgcw7H+DeftSsK7tfY2umd7E2NfDIkq/0Yr9LTq
	ftGRU2Dr/IdKzqxqwnZFCokvbm6bt0zViCW1Tb9PVOb+g96DAWUHfB27jL+8s1jy7fQ3EfEdv6S
X-Received: by 2002:a05:7301:3a9c:b0:367:50ee:f7e0 with SMTP id 5a478bee46e88-369e86148fcmr8329355eec.39.1792987116386;
        Sun, 25 Oct 2026 20:58:36 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7e73sm21652837eec.20.2026.10.25.20.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:58:35 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next] wifi: cfg80211/mac80211: apply HE OBSS PD settings on beacon update
Date: Sun, 25 Oct 2026 20:58:03 -0700
Message-ID: <20261026035803.2630025-1-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
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

hostapd puts NL80211_ATTR_HE_OBSS_PD into NL80211_CMD_SET_BEACON as well
as NL80211_CMD_START_AP, but cfg80211 parses it only when the AP starts.
A change of the spatial reuse parameters therefore reaches the beacon
but not the driver, and the only way to apply it is to restart the AP,
which disconnects all stations.

Parse the attribute in the AP update path and apply it in
ieee80211_change_beacon() when it differs from the current settings.

Assisted-by: LLM
Signed-off-by: John Macias <dencity7@gmail.com>
---
Tested on OpenWrt (backports 7.2) with hostapd changing he_spr_sr_control and
he_spr_non_srg_obss_pd_max_offset at runtime (SET + UPDATE_BEACON):

- ath11k (IPQ8074): without the patch the driver is never called; with it,
  ath11k reprograms the OBSS PD threshold on every change.
- ath12k (IPQ5332 + QCN6432, and QCN9274): toggling non-SRG OBSS PD at
  runtime turns the firmware's spatial reuse on and off (htt_stats
  OBSS_PD_STATS: 0 -> 74 -> 0 non-SRG opportunities in 15 s runs).

 include/net/cfg80211.h | 3 +++
 net/mac80211/cfg.c     | 7 +++++++
 net/wireless/nl80211.c | 7 +++++++
 3 files changed, 17 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index f773856c1..e373fb32d 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -1668,12 +1668,15 @@ struct cfg80211_ap_settings {
  * @fils_discovery: FILS discovery transmission parameters
  * @unsol_bcast_probe_resp: Unsolicited broadcast probe response parameters
  * @s1g_short_beacon: S1G short beacon data
+ * @he_obss_pd: OBSS Packet Detection settings, applied if @he_obss_pd.enable
+ *	is set
  */
 struct cfg80211_ap_update {
 	struct cfg80211_beacon_data beacon;
 	struct cfg80211_fils_discovery fils_discovery;
 	struct cfg80211_unsol_bcast_probe_resp unsol_bcast_probe_resp;
 	struct cfg80211_s1g_short_beacon s1g_short_beacon;
+	struct ieee80211_he_obss_pd he_obss_pd;
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9608c07bc..619052ebd 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2118,6 +2118,13 @@ static int ieee80211_change_beacon(struct wiphy *wiphy, struct net_device *dev,
 		changed |= BSS_CHANGED_HE_BSS_COLOR;
 	}
 
+	if (params->he_obss_pd.enable && link_conf->he_support &&
+	    memcmp(&params->he_obss_pd, &link_conf->he_obss_pd,
+		   sizeof(params->he_obss_pd))) {
+		link_conf->he_obss_pd = params->he_obss_pd;
+		changed |= BSS_CHANGED_HE_OBSS_PD;
+	}
+
 	ieee80211_link_info_change_notify(sdata, link, changed);
 	return 0;
 }
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d790e204a..38a707aca 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -7708,6 +7708,13 @@ static int nl80211_parse_ap_update(struct cfg80211_registered_device *rdev,
 			return err;
 	}
 
+	attr = attrs[NL80211_ATTR_HE_OBSS_PD];
+	if (attr) {
+		err = nl80211_parse_he_obss_pd(attr, &params->he_obss_pd);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
 
-- 
2.47.3


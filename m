Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3034853E31B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918964; cv=none; b=msYEHKBTtKQNqqpTwdJfLEBFodoJftbHLDmANg5L3hjjAB1bSPy8lMU9Ntof3vZc9tZu+jGGKmZF4h9BwcuPUymuVMxOghqrGX+kHHnuRfjACMk8SJW+b9efdzqWHJ+kddsQKqGzGP9RjAbAHo2IR4JlprEou/JMOUMOjXU7GRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918964; c=relaxed/simple;
	bh=Da96R+zPW0YWB/TP8+fA7TNkzu0UByBi2AvOovFfMAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jB5d8IlBwFqtbL2wignXLm+yS9CbppC1NxXWVB86r9KXgKiI0H9FkGFOrsl7tl/I+zPkQP+9OJ4MFpgBKRHC5apvvAe3nvjjfxG5x0xLDyEh8feUz2Zl3CEsio6UeqZHjUH0lSSv76nvm7eUZtszu5TZ/vuNt+MAsgH4lfPzJsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfP6iwfB; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfP6iwfB"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49ff9833fedso8703675e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791918960; x=1792523760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdcJdPVK9+I5ZWIyZV6AA95lxASUqFlBpjIiNY93CZs=;
        b=rfP6iwfB3m0HyKouJ3RqAsu9id7ltC02gU9MSHq/PwNcpdFnM4tWzoJtKpIX/HPpz4
         dDUHMjiBgesFmr4aWkaKQMvRo+7fffPWROjs9AXL7vnHufFCnKv6D2pVG6+lNfylOA9Q
         GLw9CeBxsf3t9TDqFNA3o7zE0YP0zvlch6BNcamlg4sLvg1ZXo4+GznQaQmB2Bzm4Huu
         fhey5iLWgR7qBozsN2RO8odrYmlmcZlCMUfsJbMB7BZwGThsJRzYs8lEJgZf+Sg3jD0n
         CP4XEcFGlVZbyt1N+z/LiTwyj8u8fHMyN0QwepU87zELoZTw1MItVrCAIHADG8PwDLW9
         nh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918960; x=1792523760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fdcJdPVK9+I5ZWIyZV6AA95lxASUqFlBpjIiNY93CZs=;
        b=uBheO4aUle2fiOEbrAZUBerk/skTlU1/LQAG3/dz26kY8lyoDRylZgJAJcdqSDHu+C
         N7VKKiz++vQdOfvrXmrrT0uZ2Uk0MsNDHD5zTYzpgg223rdEEQp89iiKgYovulBXpnDd
         F3X/8XeIQETH2rrH54DAj6oNx4p+p81otVtFC7My3n/61PHxis8CfoBVT7a2MHeq58ct
         VF3DbZ8K7ye1vhvMEvanoZ2SDEprNxFh9ojVGNlz93ffV0JpQZ3Xopaschr2PDq9DBcO
         AqtQf2G6+BXvG4H8aPHh7x319QnsrZoaQ4fIPS4sDYO1opA1VvQFUfhkfQ5JdLZbHHLg
         F8Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxQW8HVJiA4TePLwsww342EgiP3hBXCvGFjN7zVscbSyRZULK+o4U5F3s7nnoFJ9skNOmf00JbMETc5FF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCZt3DVZJ3vq/cWZWX7Khw4q4skflhLtWdrMoZ5bIRexiZrddS
	MyEtaRWrFLInIhdvu/+S6Op6aMXo2zVfqumbfLiavwXW21eEFSSD3KOi
X-Gm-Gg: AYBFou0832lTf0U6VMvIVDXzvDLBqbgCUoApB0kZEcDdWPEzd0wGVgp4M+xh8Tb5Nuy
	c1DhLhzZ/pVHia6klKMS3vUarmsyV3WR6ADAtE5pclu0LpUds3A2RUvbqlgLqpiVv1nTFAqbxzT
	Too4tdF5V7Juhth07lvtU0balk6ziPQHt1Qd+aefv3C3wBgZBOYMU8SrvACYno6nk2vJUXWqImy
	ju/PAxZ/dTRjKDhZ2yuqpQDQkkwf3T+qRPV8k1b/oTiLGqdFv6NK3dNd/Ir2N7WUhve5QQcb1nB
	loh9GKhqpWphFu1Wmrqrs8zP+DEeHBeUYwgLYvKq2Aw0mD8W8DmUZcXetE9G/aCLx+LxJSwT00Q
	tdZBkEW5LZqBmpy2xMcd10ZW5tLEeYuOfy+jmyw9joXZ9W/gtPgpXCG9SH01HETlQ+sCPbyC0EO
	bH+YaZzPvpdawePdVS3wKAwBB3As0XpBVT9odOm7zsyFV/PGbpUgTQPsbwOK46C/aCI+vfgw==
X-Received: by 2002:a05:600c:19ca:b0:4a0:2484:2800 with SMTP id 5b1f17b1804b1-4a18e4464famr258730665e9.3.1791918960237;
        Tue, 13 Oct 2026 12:16:00 -0700 (PDT)
Received: from fedora41 ([37.168.42.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2fc4724sm7229275e9.2.2026.10.13.12.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:15:59 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	guojy.bj@gmail.com,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v5 1/2] staging: rtl8723bs: rename struct phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.
Date: Tue, 13 Oct 2026 21:15:02 +0200
Message-ID: <20261013191503.152056-2-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013191503.152056-1-timo.joannin@gmail.com>
References: <20261013191503.152056-1-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct identifier references the 8192CD chip while being in a
rtl8723bs codebase. Additionally, the identifier uses the _t suffix,
while being generally reserved for typedef identifiers.

Rename the struct to rtl8723bs_phy_status_rpt
across the rtl8723bs codebase to accurately
reflect the driver and clean up the naming.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 210 ++++++++++++-------
 1 file changed, 129 insertions(+), 81 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 173ef3f437b9..fb3a19da5de3 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -10,23 +10,22 @@
 static u8 odm_query_rx_pwr_percentage(s8 ant_power)
 {
 	if ((ant_power <= -100) || (ant_power >= 20))
-		return	0;
+		return 0;
 	else if (ant_power >= 0)
-		return	100;
+		return 100;
 	else
 		return 100 + ant_power;
-
 }
 
 s32 odm_signal_scale_mapping(struct dm_odm_t *dm_odm, s32 curr_sig)
 {
 	s32 ret_sig = 0;
 
-	if (dm_odm->SupportInterface  == ODM_ITRF_SDIO) {
+	if (dm_odm->SupportInterface == ODM_ITRF_SDIO) {
 		if (curr_sig >= 51 && curr_sig <= 100)
 			ret_sig = 100;
 		else if (curr_sig >= 41 && curr_sig <= 50)
-			ret_sig = 80 + ((curr_sig - 40)*2);
+			ret_sig = 80 + ((curr_sig - 40) * 2);
 		else if (curr_sig >= 31 && curr_sig <= 40)
 			ret_sig = 66 + (curr_sig - 30);
 		else if (curr_sig >= 21 && curr_sig <= 30)
@@ -71,8 +70,8 @@ static s8 odm_cck_rssi(u8 lna_idx, u8 vga_idx)
 	s8 rx_pwr_all = 0x00;
 
 	switch (lna_idx) {
-	/* 46  53 73 95 201301231630 */
-	/*  46 53 77 99 201301241630 */
+		/* 46  53 73 95 201301231630 */
+		/*  46 53 77 99 201301241630 */
 
 	case 6:
 		rx_pwr_all = -34 - (2 * vga_idx);
@@ -93,10 +92,11 @@ static s8 odm_cck_rssi(u8 lna_idx, u8 vga_idx)
 	return rx_pwr_all;
 }
 
-static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
-				      struct odm_phy_info *phy_info,
-				      struct rtl8723bs_phy_status_rpt *phy_sta_rpt,
-				      struct odm_packet_info *pkt_info)
+static void
+odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
+			  struct odm_phy_info *phy_info,
+			  struct rtl8723bs_phy_status_rpt *phy_sta_rpt,
+			  struct odm_packet_info *pkt_info)
 {
 	u8 i;
 	s8 rx_pwr[4], rx_pwr_all = 0;
@@ -127,7 +127,7 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 		 * 2011.11.28 LukeLee: 88E use different LNA & VGA gain table
 		 * The RSSI formula should be modified according to the gain table
 		 */
-		lna_idx = ((cck_agc_rpt & 0xE0)>>5);
+		lna_idx = ((cck_agc_rpt & 0xE0) >> 5);
 		vga_idx = (cck_agc_rpt & 0x1F);
 		rx_pwr_all = odm_cck_rssi(lna_idx, vga_idx);
 		pwdb_all = odm_query_rx_pwr_percentage(rx_pwr_all);
@@ -147,15 +147,15 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 			if (phy_info->rx_pwd_ba11 > 40 && !dm_odm->bInHctTest)
 				sq = 100;
 			else {
-				sq_rpt = phy_sta_rpt->cck_sig_qual_ofdm_pwdb_all;
+				sq_rpt =
+					phy_sta_rpt->cck_sig_qual_ofdm_pwdb_all;
 
 				if (sq_rpt > 64)
 					sq = 0;
 				else if (sq_rpt < 20)
 					sq = 100;
 				else
-					sq = ((64-sq_rpt) * 100) / 44;
-
+					sq = ((64 - sq_rpt) * 100) / 44;
 			}
 
 			phy_info->signal_quality = sq;
@@ -174,9 +174,11 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 			if (dm_odm->RFPathRxEnable & BIT(i))
 				rf_rx_num++;
 			/* else */
-				/* continue; */
+			/* continue; */
 
-			rx_pwr[i] = ((phy_sta_rpt->path_agc[i].gain & 0x3F) * 2) - 110;
+			rx_pwr[i] =
+				((phy_sta_rpt->path_agc[i].gain & 0x3F) * 2) -
+				110;
 
 			phy_info->rx_pwr[i] = rx_pwr[i];
 
@@ -187,15 +189,19 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 			phy_info->rx_mimo_signal_strength[i] = (u8)rssi;
 
 			/* Get Rx snr value in DB */
-			phy_info->rx_snr[i] = dm_odm->PhyDbgInfo.RxSNRdB[i] = (s32)(phy_sta_rpt->path_rxsnr[i]/2);
+			phy_info->rx_snr[i] = dm_odm->PhyDbgInfo.RxSNRdB[i] =
+				(s32)(phy_sta_rpt->path_rxsnr[i] / 2);
 		}
 
 		/*
 		 * (2)PWDB, Average PWDB calculated by hardware (for rate adaptive)
 		 */
-		rx_pwr_all = ((phy_sta_rpt->cck_sig_qual_ofdm_pwdb_all >> 1) & 0x7f) - 110;
+		rx_pwr_all = ((phy_sta_rpt->cck_sig_qual_ofdm_pwdb_all >> 1) &
+			      0x7f) -
+			     110;
 
-		pwdb_all_bt = pwdb_all = odm_query_rx_pwr_percentage(rx_pwr_all);
+		pwdb_all_bt = pwdb_all =
+			odm_query_rx_pwr_percentage(rx_pwr_all);
 
 		phy_info->rx_pwd_ba11 = pwdb_all;
 		phy_info->bt_rx_rssi_percentage = pwdb_all_bt;
@@ -215,7 +221,8 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 		 * is supposed to be negative) is not correct
 		 * anymore.
 		 */
-		evm = odm_evm_db_to_percentage(phy_sta_rpt->stream_rxevm[0]); /* dbm */
+		evm = odm_evm_db_to_percentage(
+			phy_sta_rpt->stream_rxevm[0]); /* dbm */
 
 		/*  Fill value in RFD, Get the first spatial stream only */
 		phy_info->signal_quality = (u8)(evm & 0xff);
@@ -231,19 +238,22 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	 * It is assigned to the BSS List in GetValueFromBeaconOrProbeRsp().
 	 */
 	if (is_cck_rate) {
-		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
+		phy_info->signal_strength =
+			(u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
 	} else {
 		if (rf_rx_num != 0)
-			phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
+			phy_info->signal_strength =
+				(u8)(odm_signal_scale_mapping(
+					dm_odm, total_rssi /= rf_rx_num));
 	}
 }
 
-static void odm_Process_RSSIForDM(
-	struct dm_odm_t *pDM_Odm, struct odm_phy_info *pPhyInfo, struct odm_packet_info *pPktinfo
-)
+static void odm_Process_RSSIForDM(struct dm_odm_t *pDM_Odm,
+				  struct odm_phy_info *pPhyInfo,
+				  struct odm_packet_info *pPktinfo)
 {
-
-	s32 UndecoratedSmoothedPWDB, UndecoratedSmoothedCCK, UndecoratedSmoothedOFDM, RSSI_Ave;
+	s32 UndecoratedSmoothedPWDB, UndecoratedSmoothedCCK,
+		UndecoratedSmoothedOFDM, RSSI_Ave;
 	u8 isCCKrate = 0;
 	u8 RSSI_max, RSSI_min, i;
 	u32 OFDM_pkt = 0;
@@ -269,7 +279,6 @@ static void odm_Process_RSSIForDM(
 
 	/* Statistic for antenna/path diversity------------------ */
 	if (pDM_Odm->SupportAbility & ODM_BB_ANT_DIV) {
-
 	}
 
 	/* Smart Antenna Debug Message------------------ */
@@ -279,76 +288,102 @@ static void odm_Process_RSSIForDM(
 	UndecoratedSmoothedPWDB = pEntry->rssi_stat.UndecoratedSmoothedPWDB;
 
 	if (pPktinfo->to_self || pPktinfo->is_beacon) {
-
 		if (!isCCKrate) { /* ofdm rate */
 			if (pPhyInfo->rx_mimo_signal_strength[RF_PATH_B] == 0) {
-				RSSI_Ave = pPhyInfo->rx_mimo_signal_strength[RF_PATH_A];
-				pDM_Odm->RSSI_A = pPhyInfo->rx_mimo_signal_strength[RF_PATH_A];
+				RSSI_Ave = pPhyInfo->rx_mimo_signal_strength
+						   [RF_PATH_A];
+				pDM_Odm->RSSI_A =
+					pPhyInfo->rx_mimo_signal_strength
+						[RF_PATH_A];
 				pDM_Odm->RSSI_B = 0;
 			} else {
-				pDM_Odm->RSSI_A =  pPhyInfo->rx_mimo_signal_strength[RF_PATH_A];
-				pDM_Odm->RSSI_B = pPhyInfo->rx_mimo_signal_strength[RF_PATH_B];
-
-				if (
-					pPhyInfo->rx_mimo_signal_strength[RF_PATH_A] >
-					pPhyInfo->rx_mimo_signal_strength[RF_PATH_B]
-				) {
-					RSSI_max = pPhyInfo->rx_mimo_signal_strength[RF_PATH_A];
-					RSSI_min = pPhyInfo->rx_mimo_signal_strength[RF_PATH_B];
+				pDM_Odm->RSSI_A =
+					pPhyInfo->rx_mimo_signal_strength
+						[RF_PATH_A];
+				pDM_Odm->RSSI_B =
+					pPhyInfo->rx_mimo_signal_strength
+						[RF_PATH_B];
+
+				if (pPhyInfo->rx_mimo_signal_strength[RF_PATH_A] >
+				    pPhyInfo->rx_mimo_signal_strength[RF_PATH_B]) {
+					RSSI_max =
+						pPhyInfo->rx_mimo_signal_strength
+							[RF_PATH_A];
+					RSSI_min =
+						pPhyInfo->rx_mimo_signal_strength
+							[RF_PATH_B];
 				} else {
-					RSSI_max = pPhyInfo->rx_mimo_signal_strength[RF_PATH_B];
-					RSSI_min = pPhyInfo->rx_mimo_signal_strength[RF_PATH_A];
+					RSSI_max =
+						pPhyInfo->rx_mimo_signal_strength
+							[RF_PATH_B];
+					RSSI_min =
+						pPhyInfo->rx_mimo_signal_strength
+							[RF_PATH_A];
 				}
 
-				if ((RSSI_max-RSSI_min) < 3)
+				if ((RSSI_max - RSSI_min) < 3)
 					RSSI_Ave = RSSI_max;
-				else if ((RSSI_max-RSSI_min) < 6)
+				else if ((RSSI_max - RSSI_min) < 6)
 					RSSI_Ave = RSSI_max - 1;
-				else if ((RSSI_max-RSSI_min) < 10)
+				else if ((RSSI_max - RSSI_min) < 10)
 					RSSI_Ave = RSSI_max - 2;
 				else
 					RSSI_Ave = RSSI_max - 3;
 			}
 
 			/* 1 Process OFDM RSSI */
-			if (UndecoratedSmoothedOFDM <= 0)	/*  initialize */
+			if (UndecoratedSmoothedOFDM <= 0) /*  initialize */
 				UndecoratedSmoothedOFDM = pPhyInfo->rx_pwd_ba11;
 			else {
-				if (pPhyInfo->rx_pwd_ba11 > (u32)UndecoratedSmoothedOFDM) {
+				if (pPhyInfo->rx_pwd_ba11 >
+				    (u32)UndecoratedSmoothedOFDM) {
+					UndecoratedSmoothedOFDM =
+						((UndecoratedSmoothedOFDM *
+						  (Rx_Smooth_Factor - 1)) +
+						 RSSI_Ave) /
+						Rx_Smooth_Factor;
 					UndecoratedSmoothedOFDM =
-							((UndecoratedSmoothedOFDM*(Rx_Smooth_Factor-1)) +
-							RSSI_Ave)/Rx_Smooth_Factor;
-					UndecoratedSmoothedOFDM = UndecoratedSmoothedOFDM + 1;
+						UndecoratedSmoothedOFDM + 1;
 				} else {
 					UndecoratedSmoothedOFDM =
-							((UndecoratedSmoothedOFDM*(Rx_Smooth_Factor-1)) +
-							RSSI_Ave)/Rx_Smooth_Factor;
+						((UndecoratedSmoothedOFDM *
+						  (Rx_Smooth_Factor - 1)) +
+						 RSSI_Ave) /
+						Rx_Smooth_Factor;
 				}
 			}
 
-			pEntry->rssi_stat.PacketMap = (pEntry->rssi_stat.PacketMap<<1) | BIT(0);
+			pEntry->rssi_stat.PacketMap =
+				(pEntry->rssi_stat.PacketMap << 1) | BIT(0);
 
 		} else {
 			RSSI_Ave = pPhyInfo->rx_pwd_ba11;
-			pDM_Odm->RSSI_A = (u8) pPhyInfo->rx_pwd_ba11;
+			pDM_Odm->RSSI_A = (u8)pPhyInfo->rx_pwd_ba11;
 			pDM_Odm->RSSI_B = 0;
 
 			/* 1 Process CCK RSSI */
-			if (UndecoratedSmoothedCCK <= 0)	/*  initialize */
+			if (UndecoratedSmoothedCCK <= 0) /*  initialize */
 				UndecoratedSmoothedCCK = pPhyInfo->rx_pwd_ba11;
 			else {
-				if (pPhyInfo->rx_pwd_ba11 > (u32)UndecoratedSmoothedCCK) {
+				if (pPhyInfo->rx_pwd_ba11 >
+				    (u32)UndecoratedSmoothedCCK) {
+					UndecoratedSmoothedCCK =
+						((UndecoratedSmoothedCCK *
+						  (Rx_Smooth_Factor - 1)) +
+						 pPhyInfo->rx_pwd_ba11) /
+						Rx_Smooth_Factor;
 					UndecoratedSmoothedCCK =
-							((UndecoratedSmoothedCCK*(Rx_Smooth_Factor-1)) +
-							pPhyInfo->rx_pwd_ba11)/Rx_Smooth_Factor;
-					UndecoratedSmoothedCCK = UndecoratedSmoothedCCK + 1;
+						UndecoratedSmoothedCCK + 1;
 				} else {
 					UndecoratedSmoothedCCK =
-							((UndecoratedSmoothedCCK*(Rx_Smooth_Factor-1)) +
-							pPhyInfo->rx_pwd_ba11)/Rx_Smooth_Factor;
+						((UndecoratedSmoothedCCK *
+						  (Rx_Smooth_Factor - 1)) +
+						 pPhyInfo->rx_pwd_ba11) /
+						Rx_Smooth_Factor;
 				}
 			}
-			pEntry->rssi_stat.PacketMap = pEntry->rssi_stat.PacketMap<<1;
+			pEntry->rssi_stat.PacketMap =
+				pEntry->rssi_stat.PacketMap << 1;
 		}
 
 		/* if (pEntry) */
@@ -360,32 +395,48 @@ static void odm_Process_RSSIForDM(
 				pEntry->rssi_stat.ValidBit++;
 
 			for (i = 0; i < pEntry->rssi_stat.ValidBit; i++)
-				OFDM_pkt += (u8)(pEntry->rssi_stat.PacketMap>>i)&BIT(0);
+				OFDM_pkt +=
+					(u8)(pEntry->rssi_stat.PacketMap >> i) &
+					BIT(0);
 
 			if (pEntry->rssi_stat.ValidBit == 64) {
-				Weighting = ((OFDM_pkt<<4) > 64)?64:(OFDM_pkt<<4);
-				UndecoratedSmoothedPWDB = (Weighting*UndecoratedSmoothedOFDM+(64-Weighting)*UndecoratedSmoothedCCK)>>6;
+				Weighting = ((OFDM_pkt << 4) > 64) ?
+						    64 :
+						    (OFDM_pkt << 4);
+				UndecoratedSmoothedPWDB =
+					(Weighting * UndecoratedSmoothedOFDM +
+					 (64 - Weighting) *
+						 UndecoratedSmoothedCCK) >>
+					6;
 			} else {
 				if (pEntry->rssi_stat.ValidBit != 0)
-					UndecoratedSmoothedPWDB = (OFDM_pkt*UndecoratedSmoothedOFDM+(pEntry->rssi_stat.ValidBit-OFDM_pkt)*UndecoratedSmoothedCCK)/pEntry->rssi_stat.ValidBit;
+					UndecoratedSmoothedPWDB =
+						(OFDM_pkt *
+							 UndecoratedSmoothedOFDM +
+						 (pEntry->rssi_stat.ValidBit -
+						  OFDM_pkt) *
+							 UndecoratedSmoothedCCK) /
+						pEntry->rssi_stat.ValidBit;
 				else
 					UndecoratedSmoothedPWDB = 0;
 			}
 
-			pEntry->rssi_stat.UndecoratedSmoothedCCK = UndecoratedSmoothedCCK;
-			pEntry->rssi_stat.UndecoratedSmoothedOFDM = UndecoratedSmoothedOFDM;
-			pEntry->rssi_stat.UndecoratedSmoothedPWDB = UndecoratedSmoothedPWDB;
+			pEntry->rssi_stat.UndecoratedSmoothedCCK =
+				UndecoratedSmoothedCCK;
+			pEntry->rssi_stat.UndecoratedSmoothedOFDM =
+				UndecoratedSmoothedOFDM;
+			pEntry->rssi_stat.UndecoratedSmoothedPWDB =
+				UndecoratedSmoothedPWDB;
 		}
-
 	}
 }
 
 /*  Endianness before calling this API */
-void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
+void odm_phy_status_query(struct dm_odm_t *dm_odm,
+			  struct odm_phy_info *phy_info,
 			  struct rtl8723bs_phy_status_rpt *phy_status,
 			  struct odm_packet_info *pkt_info)
 {
-
 	odm_rx_phy_status_parsing(dm_odm, phy_info, phy_status, pkt_info);
 
 	if (!dm_odm->RSSI_test)
@@ -394,11 +445,9 @@ void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info
 
 /*  If you want to add a new IC, Please follow below template and generate a new one. */
 
-void ODM_ConfigRFWithHeaderFile(
-	struct dm_odm_t *pDM_Odm,
-	enum ODM_RF_Config_Type ConfigType,
-	enum rf_path eRFPath
-)
+void ODM_ConfigRFWithHeaderFile(struct dm_odm_t *pDM_Odm,
+				enum ODM_RF_Config_Type ConfigType,
+				enum rf_path eRFPath)
 {
 	if (ConfigType == CONFIG_RF_RADIO)
 		ODM_ReadAndConfig_MP_8723B_RadioA(pDM_Odm);
@@ -412,9 +461,8 @@ void ODM_ConfigRFWithTxPwrTrackHeaderFile(struct dm_odm_t *pDM_Odm)
 		ODM_ReadAndConfig_MP_8723B_TxPowerTrack_SDIO(pDM_Odm);
 }
 
-void ODM_ConfigBBWithHeaderFile(
-	struct dm_odm_t *pDM_Odm, enum ODM_BB_Config_Type ConfigType
-)
+void ODM_ConfigBBWithHeaderFile(struct dm_odm_t *pDM_Odm,
+				enum ODM_BB_Config_Type ConfigType)
 {
 	if (ConfigType == CONFIG_BB_PHY_REG)
 		ODM_ReadAndConfig_MP_8723B_PHY_REG(pDM_Odm);
-- 
2.56.0


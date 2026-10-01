Received: from mail-ed2-f9.google.com (mail-ed2-f9.google.com [74.125.228.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65686522EED
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867912; cv=none; b=AQ5oxNB0W/RVUoO12wFdQvynzvhH2vQbLVpFBL3otsmbGbvhH5UVozAa2uPSzVuCMX9bp9DtvvhyKEaKTSNiNgiFTw5i1DqvYsJSB9txR+gEvEL4A8GXpRixInMxIeur/z62efQRn2s4vG3VBdZIc6Iax+m1nSZLbPFGrJ8a08M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867912; c=relaxed/simple;
	bh=/a5I0o0PXfY6fo//dcOVIvt+RZlHQAF4wYFHD6XTPm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T6n0MoOYSEyTHFoeld80xL9L8ScjH8Nuab/ElQlxcBOjfVAf0yRCuLrnL8L5VlPn95dj7TPr4yS+M7tcKfcd31jfDpbJqpNJshIZqcoxjMaDXicK0hELgb8mqVHXsJDh5ghtrXPu8LvXNHAHcm9JnxZYrEEsSEqJ9VozmR5lk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/folwTR; arc=none smtp.client-ip=74.125.228.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/folwTR"
Received: by mail-ed2-f9.google.com with SMTP id 4fb4d7f45d1cf-6aca84f7c74so1990743a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867908; x=1791472708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVJFHk55f/JB5gxQJXumCKsoBsmFGnW9ftl9dla0NlQ=;
        b=N/folwTRrqa0EQZY0MMlmJN1xLzHg20wPWnOJh+U2H9hAMIey8WQqXX2Z9HCGzvRyU
         T4zK2KuWKPV8AZ33UTzpd6rqIEFJ0lw5ky6K80RF1Q3+dwoF5SkILT+b7wM5GgMMhK0l
         LD8NxeW+uvUqt36Ke/gIt6PcIQ2n4CZ69AFa6SAF+2F8rWurLnzIFJPsEk/u4EAGFFSt
         OxGBBzq8f4lx1slQXWtrJeQygdDm/oMltlNMVQlEIMEDdJJikcwPfb3WbO+g5rdK2r9o
         i+LEpCkXUrPFlCTtzcy5QZQdg0B0C5ZGEs43CCzqre95hxJzyJviV+96mX8424hajfTI
         Eaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867908; x=1791472708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVJFHk55f/JB5gxQJXumCKsoBsmFGnW9ftl9dla0NlQ=;
        b=yLC6gWGh/y8Rg7g8wqt9MMRo+uuNPWWO84d1IOVPSGDddQ5aiSoN8YKbcRtbXDfY32
         BYHJQVRA05gRZCMXyScVC5JK2j7aoVGV0J6KrkhlXwhTzl/sFyVm2DXAZkoeFXEA3cHa
         3Ep7UMmXpSYNfRRloCOba0JmzknOhYxDWRcW7IcCtN0A8+NhIYexC/UxPUWXJtrP+5jQ
         GpFh4R2HBuQ+4hQoO8fOBss+VTRrSYzmMoweVeefE92lwugYwGroZ7ofoRpq/eQkjRqp
         F/BnQ3uH3PSkbajak2uuUVDpacUTJ4RkYdvBeZ67aE1mIgfAbEGy4ArS2XZFPdkAhHTF
         tXqw==
X-Forwarded-Encrypted: i=1; AKwUvBzgQ7mj9K6b3tsBFgAZT4WNNVW4rHP58cF3l/Peek1UW6bMxIsdLOkkqV8RVRcEt6OihQFxOV0/rBvU62Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAmoKRgOdQScfRDh7s/K2DWRj42z4w83BMONemWQQSZRrWRKYc
	wE8NzSZwSaDb0FKA3wdSuyLjR/7VlcFSMgRwyNVy+tmgJZtsnQpecQDd
X-Gm-Gg: AYBFou2qZ4fKDu1DYSm0qD0r3OH0X0y4heORfWt24tU7M/2q9YTOKKvBtioC48wNw+Y
	N4eSYj/BAr7FrVk3oCuE/lS+i05p/0/pKw3HdqSntl2BRJLOgDGKVGCcgm6Ge55i3gKJpR9f/ct
	3YyEsJE7uTUktprcq66Xw9vo0BF9WlY2R14yzsQJUBhF23SpDdO2B7ZeccF6DZ5gi1ammxEN5DR
	wXOMIegcBWSmw/XbswvcvRK61dk6pmbDgxm3jEzaIW2VYxyps0iYWvReKhfAfcOvxQxsV8Hoj71
	iw2HQ4OBfQTvlGcmjlnTMCzqOUfhgFCjCdkyNr3dEbyCPQzQnju36QWVtbRsvR5dxGbfNWouvDz
	LasOpRWnryLIrrHMJFUBN/Cm/ok0M7ZdL+mRM/O7bAgp4Hb3/XuSX1a7WeKRVYG3xwvEpQsI1A8
	f6JpdJeej+Y5TVyjYhDBB6MzTBWfI+EuLlm1hsWyuNnhvs8JVFN/Mqs8zIpA==
X-Received: by 2002:a05:6402:a0cc:b0:6ac:d86d:f709 with SMTP id 4fb4d7f45d1cf-6ae199333e7mr3746086a12.25.1790867908358;
        Thu, 01 Oct 2026 08:18:28 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6a3b7sm3881916f8f.41.2026.10.01.08.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:18:28 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: guojy.bj@gmail.com,
	m.steinmoetzger@gmail.com,
	atharvmargur@gmail.com,
	straube.linux@gmail.com,
	andriy.shevchenko@intel.com,
	s9430939@naver.com,
	qstrydom0@gmail.com,
	dev.lmmrtns@gmail.com,
	khomenkov@mailbox.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: rename phy_status_rpt_8192cd_t to rtl8723bs_phy_status_rpt.
Date: Thu,  1 Oct 2026 17:18:14 +0200
Message-ID: <20261001151814.157881-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Additionally, propagate the real structure type all the way
through the call chain to remove redundant casts to and from u8 *.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c   | 6 +++---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h   | 5 +++--
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 7 ++++---
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 34b0369a7936..c85194c8fe67 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -95,7 +95,7 @@ static s8 odm_cck_rssi(u8 lna_idx, u8 vga_idx)
 
 static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 				      struct odm_phy_info *phy_info,
-				      u8 *phy_status,
+				      struct rtl8723bs_phy_status_rpt *phy_sta_rpt,
 				      struct odm_packet_info *pkt_info)
 {
 	u8 i;
@@ -105,7 +105,6 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	bool is_cck_rate = false;
 	u8 rf_rx_num = 0;
 	u8 lna_idx, vga_idx;
-	struct phy_status_rpt_8192cd_t *phy_sta_rpt = (struct phy_status_rpt_8192cd_t *)phy_status;
 
 	is_cck_rate = pkt_info->data_rate <= DESC_RATE11M;
 	phy_info->rx_mimo_signal_quality[RF_PATH_A] = -1;
@@ -383,7 +382,8 @@ static void odm_Process_RSSIForDM(
 
 /*  Endianness before calling this API */
 void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
-			  u8 *phy_status, struct odm_packet_info *pkt_info)
+			  struct rtl8723bs_phy_status_rpt *phy_status,
+			  struct odm_packet_info *pkt_info)
 {
 
 	odm_rx_phy_status_parsing(dm_odm, phy_info, phy_status, pkt_info);
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index ca3380328a72..21182a880da3 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -18,7 +18,7 @@ struct phy_rx_agc_info_t {
 	#endif
 };
 
-struct phy_status_rpt_8192cd_t {
+struct rtl8723bs_phy_status_rpt {
 	struct phy_rx_agc_info_t path_agc[2];
 	u8 ch_corr[2];
 	u8 cck_sig_qual_ofdm_pwdb_all;
@@ -57,7 +57,8 @@ struct phy_status_rpt_8192cd_t {
 };
 
 void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
-			  u8 *phy_status, struct odm_packet_info *pkt_info);
+			  struct rtl8723bs_phy_status_rpt *phy_status,
+			  struct odm_packet_info *pkt_info);
 
 enum hal_status ODM_ConfigRFWithTxPwrTrackHeaderFile(struct dm_odm_t *pDM_Odm);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 304fda3a3b5c..a62b845c69f9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -73,7 +73,7 @@ static void update_recvframe_attrib(struct adapter *padapter,
  *precvframe->u.hdr.rx_data should be ready!
  */
 static void update_recvframe_phyinfo(union recv_frame *precvframe,
-				     struct phy_stat *pphy_status)
+				     struct rtl8723bs_phy_status_rpt *pphy_status)
 {
 	struct adapter *padapter = precvframe->u.hdr.adapter;
 	struct rx_pkt_attrib *pattrib = &precvframe->u.hdr.attrib;
@@ -125,7 +125,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 	pkt_info.data_rate = pattrib->data_rate;
 
 	odm_phy_status_query(&p_hal_data->odmpriv, p_phy_info,
-			   (u8 *)pphy_status, &(pkt_info));
+			   pphy_status, &(pkt_info));
 	if (psta)
 		psta->rssi = pattrib->phy_info.RecvSignalPower;
 	precvframe->u.hdr.psta = NULL;
@@ -317,7 +317,8 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 
 				if (pattrib->pkt_rpt_type == NORMAL_RX) { /* Normal rx packet */
 					if (pattrib->physt)
-						update_recvframe_phyinfo(precvframe, (struct phy_stat *)ptr);
+						update_recvframe_phyinfo(precvframe,
+							(struct rtl8723bs_phy_status_rpt *)ptr);
 
 					rtw_recv_entry(precvframe);
 				} else if (pattrib->pkt_rpt_type == C2H_PACKET) {
-- 
2.55.0


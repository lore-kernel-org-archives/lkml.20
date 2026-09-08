Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6D25A0ACA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894641; cv=none; b=e46miJ+avVS10OzMKrWi9LLYS/aA6kmuqG/hZjMGeyF72xzxybLaw2eIVdoQHZ/tXk5VwOgfXmKYNP09K2UA7TzqCCh5qEAKBBq83M1aPyBzhOaKIs86FkotwWu2IBKzNXcIMCH6etRMB3lcukEsIO9q4VfuqTRx8EwO7wmD480=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894641; c=relaxed/simple;
	bh=WBwiQBGR2LrtLFiA3Q1waD0ZFVGoS+U6TuCL2aPXlbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hM7FrNHW6lXefpeG1IwfkLlzNAZ7kUIeYKwAflmwcL/DkqvZcOSIrX7/1Zyu7DYDOHxzkN4ZI9Of+xdiZ4nGUGxUxpbtx5rsNlgulMgroC7JQBOQEgqx1GY757KHSgK9FPYgPn4+ORjdNFmOIawKfHctaNnH2pxVZzkZFKGtMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGv5SQR4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGv5SQR4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48589798dbbso4152290f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788894637; x=1789499437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vnb4aPseUEV8ohWOu5ZBIl2b/oTVsHc7B+obgyi63Dg=;
        b=LGv5SQR4gy27acpIwReMC10Ys1MdTPInusGF+eXqs+Za2pQqrKSaUVeIWVnUx6/Uy3
         cGC+AX9o+qCes4lMlM8z9QCZKaEo4OuI8dBjHbIo/GcJKXheqcwz48v8lHcTAbcdZRN2
         ZsVaM+GRwZBZNYq1Y5kL9pS48DFTIIUpmr1hXnTz7ZIZmnl/5U/rqRU2HnMkx0RkLi+A
         4IEboJST0gautvd9/lXiJKwkpTvS9QKMnxxdGlYADR/lHDmngvi0+sArHsz/b4QUUGjU
         +kHEikygPjH3ncXb6ZHNUXQtL9FSOGu9oEJCYTfJOgTuBkm7O4rIXge7Vo83PgalClGy
         LAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894637; x=1789499437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vnb4aPseUEV8ohWOu5ZBIl2b/oTVsHc7B+obgyi63Dg=;
        b=gOc3nyYk6HbIK3SAC+xY6Gn60zHltIPishycXTz5KLVdyAyh9WL0HfalJ92zTxVS3p
         uDiJH+SBe7JcarZ2nSDXMzNFyrkWPzv8E6IAksQjN/qj7dVowctdIc3q31pcrow7levD
         f+kYrmXiSyihsQB5BTDdAh87PiBMXCGLnVVRpGPXIitgDELuBSh2PgL3ehPeMixPHKMQ
         9jVyD8YkeL90MgL2zzJJ4X/MeS3HXIuEK8FStqydRIleS/Lei1idmg6f3t3msGwu3+S8
         Pw5E1uPxZVXL3sByYO5jCBJICaz8A5A95ifzL5WDKexkCZPBSrWjnxvWC5IS7unhwubA
         hjjQ==
X-Gm-Message-State: AFuF++mQsFe4kmoy1k+q8ssXJo2mZgM8mtC3c4tJge+oF7VKRz6TQXnC
	TvUWrTfMAw/K8QNtObTVdVyE44p7lJIm1guWBWykfJBcwylQn6uVF1np
X-Gm-Gg: AYBFou2Ym8WBL3ySFe7G1zk1n1R0tFpqkYLAtv9twTE9U75umXzVWvSJ9bIx2ZWXJvQ
	9nnQX6EsTBeQykpBlNBbFwqKfQKcwlLr8FQ5vtnrK5Gmu6K8fUoKeZ66WncDKmniPY3noUPnK9X
	mTt6dk5dsABEHYClWx1Em922CqzAE8d4vTiUHn9/SnWh9LL1Hu//M3QDVQ58m/AphOWNGw30CSP
	GJmJS9oYqnEWn2lhR07aJ3GYysPFZepByN31sWeoKCexk8RLZcfP6RsULbDokggYEsxNGnZOIxt
	PsaeQew69TprkLO69rPwhfOWe1bbX69PQdpRYaD36FmBKxNfIeHlm5kY/FdQ/CWL6f94+Nslj0y
	imwn++M/MjsH30j660PA2YN6a2Bb0Ml1zII3g8wEmVP4LNgBO9VdtIit76eX+DUi/sdvryBAsg8
	QbvL9d/S5agjHRA366093RMJLu77gE+1e7BLpvkDhJ7R/vLTa1OxMKym8OQjKuOpOBlBo=
X-Received: by 2002:a05:6000:1863:b0:485:8a46:704c with SMTP id ffacd0b85a97d-4858a46716bmr28866160f8f.30.1788894637018;
        Tue, 08 Sep 2026 12:10:37 -0700 (PDT)
Received: from predeASUS ([86.124.216.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm36778622f8f.16.2026.09.08.12.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:10:36 -0700 (PDT)
From: AJ39210 <predescuciprian99@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	AJ39210 <predescuciprian99@gmail.com>
Subject: [PATCH] staging: rtl8723bs: cleanup and style fixes
Date: Tue,  8 Sep 2026 22:10:31 +0300
Message-ID: <20260908191033.13798-1-predescuciprian99@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/rtl8723bs/TODO                | 27 ++++++++++-----
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  4 +--
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 16 ++++-----
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  2 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.h  |  2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 34 +++++++------------
 drivers/staging/rtl8723bs/include/hal_phy.h   |  5 ---
 drivers/staging/rtl8723bs/include/ieee80211.h |  2 +-
 .../staging/rtl8723bs/include/rtl8192c_recv.h | 33 ------------------
 .../staging/rtl8723bs/include/rtl8723b_recv.h | 16 ++++++++-
 drivers/staging/rtl8723bs/include/rtw_ht.h    |  1 -
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 19 +++++++----
 12 files changed, 70 insertions(+), 91 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/rtl8192c_recv.h

diff --git a/drivers/staging/rtl8723bs/TODO b/drivers/staging/rtl8723bs/TODO
index 8de062b474d6..eb71453e2b63 100644
--- a/drivers/staging/rtl8723bs/TODO
+++ b/drivers/staging/rtl8723bs/TODO
@@ -1,10 +1,19 @@
 TODO:
-- Partial: remove remaining code for other chips that is left over. Unused
-  non-8723B AMPDU burst enum values and unused 8188E ODM fields have been
-  removed, but more legacy code remains.
-- Partial: convert unusual variable types. The channel control APIs and rate
-  helpers now use kernel fixed-width types, but more legacy types remain.
-- Partial checkpatch.pl fixes: several overlong callback and scan-list lines
-  have been wrapped, but many warnings remain and will require refactoring.
-- Merge Realtek's bugfixes and new features into the driver.
-- Switch to use MAC80211.
+- Partial: remove remaining code for other chips that is left over. Removed
+  obsolete 8192C receive code, unused multi-chip constants, and an old 88C
+  firmware exception; more compatibility code remains.
+  
+- Partial: convert unusual variable types. The rate-set length helper now uses
+  kernel fixed-width types; channel-control APIs and more legacy types remain.
+
+- Partial checkpatch.pl fixes: the scan callback and scan-list operations have
+  been wrapped and simplified, but many warnings remain and will require
+  refactoring.
+
+- Merge Realtek's bugfixes and new features into the driver. This needs a
+  specific upstream commit or feature target before it can be reviewed safely.
+
+- Switch to use MAC80211. This requires replacing the vendor-owned netdev,
+  cfg80211 operations, MLME, Ethernet TX/RX conversion, and TX completion
+  paths with mac80211 ownership; do not register a second wiphy/netdev until
+  the station-mode TX/RX path has been ported.
\ No newline at end of file
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 4d211711f2ba..efa454a0a5de 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -278,9 +278,9 @@ void rtw_set_supported_rate(u8 *supported_rates, uint mode)
 	}
 }
 
-uint rtw_get_rateset_len(u8 *rateset)
+u8 rtw_get_rateset_len(u8 *rateset)
 {
-	uint i;
+	u8 i;
 
 	for (i = 0; i < 13; i++)
 		if (rateset[i] == 0)
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 6c5f56d5a1f4..4d96b28e967b 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -23,14 +23,12 @@
 
 /*---------------------------Define Local Constant---------------------------*/
 
-/* In the case that we fail to read TxPowerTrack.txt, we use the table for
- * 88E as the default table.
- */
-static u8 DeltaSwingTableIdx_2GA_N_8188E[] = {
+/* Default table used when TxPowerTrack.txt is unavailable. */
+static u8 DeltaSwingTableIdx_2GA_N[] = {
 	0, 0, 0, 2, 2, 3, 3, 4,  4,  4,  4,  5,  5,  6,  6,
 	7, 7, 7, 7, 8, 8, 9, 9, 10, 10, 10, 11, 11, 11, 11
 };
-static u8 DeltaSwingTableIdx_2GA_P_8188E[] = {
+static u8 DeltaSwingTableIdx_2GA_P[] = {
 	0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 4,
 	4, 4, 4, 5, 5, 7, 7, 8, 8, 8, 9, 9, 9, 9, 9
 };
@@ -313,10 +311,10 @@ static void GetDeltaSwingTable_8723B(
 			*TemperatureDOWN_B = pRFCalibrateInfo->DeltaSwingTableIdx_2GB_N;
 		}
 	} else {
-		*TemperatureUP_A   = (u8 *)DeltaSwingTableIdx_2GA_P_8188E;
-		*TemperatureDOWN_A = (u8 *)DeltaSwingTableIdx_2GA_N_8188E;
-		*TemperatureUP_B   = (u8 *)DeltaSwingTableIdx_2GA_P_8188E;
-		*TemperatureDOWN_B = (u8 *)DeltaSwingTableIdx_2GA_N_8188E;
+		*TemperatureUP_A   = DeltaSwingTableIdx_2GA_P;
+		*TemperatureDOWN_A = DeltaSwingTableIdx_2GA_N;
+		*TemperatureUP_B   = DeltaSwingTableIdx_2GA_P;
+		*TemperatureDOWN_B = DeltaSwingTableIdx_2GA_N;
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 1716252641d3..324ab84f92ee 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -107,7 +107,7 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	bool is_cck_rate = false;
 	u8 rf_rx_num = 0;
 	u8 lna_idx, vga_idx;
-	struct phy_status_rpt_8192cd_t *phy_sta_rpt = (struct phy_status_rpt_8192cd_t *)phy_status;
+	struct phy_status_rpt_8723b_t *phy_sta_rpt = (struct phy_status_rpt_8723b_t *)phy_status;
 
 	is_cck_rate = pkt_info->data_rate <= DESC_RATE11M;
 	phy_info->rx_mimo_signal_quality[RF_PATH_A] = -1;
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
index 615145812ed2..358eb62df45f 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
@@ -20,7 +20,7 @@ struct phy_rx_agc_info_t {
 	#endif
 };
 
-struct phy_status_rpt_8192cd_t {
+struct phy_status_rpt_8723b_t {
 	struct phy_rx_agc_info_t path_agc[2];
 	u8 ch_corr[2];
 	u8 cck_sig_qual_ofdm_pwdb_all;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 6a4a13544ca1..b3aff0dfdc62 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -250,34 +250,27 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 	return ret;
 }
 
-#define IS_FW_81xxC(padapter)	(((GET_HAL_DATA(padapter))->FirmwareSignature & 0xFFF0) == 0x88C0)
-
 void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 {
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u8 val;
 	u8 Delay = 100;
 
-	if (
-		!(IS_FW_81xxC(padapter) && ((pHalData->FirmwareVersion < 0x21) || (pHalData->FirmwareVersion == 0x21 && pHalData->FirmwareSubVersion < 0x01)))
-	) { /*  after 88C Fw v33.1 */
-		/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
-		rtw_write8(padapter, REG_HMETFR+3, 0x20);
+	/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
+	rtw_write8(padapter, REG_HMETFR+3, 0x20);
 
+	val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+	while (val & BIT(2)) {
+		Delay--;
+		if (Delay == 0)
+			break;
+		udelay(50);
 		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-		while (val & BIT(2)) {
-			Delay--;
-			if (Delay == 0)
-				break;
-			udelay(50);
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-		}
+	}
 
-		if (Delay == 0) {
-			/* force firmware reset */
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-			rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT(2)));
-		}
+	if (Delay == 0) {
+		/* force firmware reset */
+		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+		rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT(2)));
 	}
 }
 
@@ -1903,7 +1896,6 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 			rtw_write8(padapter, REG_BCN_CTRL, (DIS_TSF_UDT|EN_BCN_FUNCTION|EN_TXBCN_RPT|DIS_BCNQ_SUB));
 
 			/* SW_BCN_SEL - Port0 */
-			/* rtw_write8(Adapter, REG_DWBCN1_CTRL_8192E+2, rtw_read8(Adapter, REG_DWBCN1_CTRL_8192E+2) & ~BIT4); */
 			rtw_hal_set_hwreg(padapter, HW_VAR_DL_BCN_SEL, NULL);
 
 			/*  select BCN on port 0 */
diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index abc0f27fdaa4..a92ec3d0a34b 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -35,11 +35,6 @@ enum rf_path {
 
 #define	TX_1S			0
 #define	TX_2S			1
-#define	TX_3S			2
-#define	TX_4S			3
-
-#define	RF_PATH_MAX_92C_88E		2
-#define	RF_PATH_MAX_90_8812		4	/* Max RF number 90 support */
 
 enum wireless_mode {
 	WIRELESS_MODE_UNKNOWN = 0x00,
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9f421e4875b7..710bf99bb542 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -722,7 +722,7 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 	for (ie = (void *)buf; (((u8 *)ie) - ((u8 *)buf) + 1) < buf_len; \
 		ie = (void *)(((u8 *)ie) + *(((u8 *)ie) + 1) + 2))
 
-uint	rtw_get_rateset_len(u8 *rateset);
+u8	rtw_get_rateset_len(u8 *rateset);
 
 struct registry_priv;
 int rtw_generate_ie(struct registry_priv *pregistrypriv);
diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
deleted file mode 100644
index b63625ab4e45..000000000000
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#ifndef _RTL8192C_RECV_H_
-#define _RTL8192C_RECV_H_
-
-#define MAX_RECVBUF_SZ (10240)
-
-struct phy_stat {
-	unsigned int phydw0;
-
-	unsigned int phydw1;
-
-	unsigned int phydw2;
-
-	unsigned int phydw3;
-
-	unsigned int phydw4;
-
-	unsigned int phydw5;
-
-	unsigned int phydw6;
-
-	unsigned int phydw7;
-};
-
-/*  Rx smooth factor */
-#define	Rx_Smooth_Factor (20)
-
-#endif
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index e9ebecb224a6..31ad1182f0cf 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -7,7 +7,21 @@
 #ifndef __RTL8723B_RECV_H__
 #define __RTL8723B_RECV_H__
 
-#include <rtl8192c_recv.h>
+#define MAX_RECVBUF_SZ (10240)
+
+struct phy_stat {
+	unsigned int phydw0;
+	unsigned int phydw1;
+	unsigned int phydw2;
+	unsigned int phydw3;
+	unsigned int phydw4;
+	unsigned int phydw5;
+	unsigned int phydw6;
+	unsigned int phydw7;
+};
+
+/* Rx smooth factor */
+#define Rx_Smooth_Factor (20)
 
 struct rxreport_8723b {
 	/* DWORD 0 */
diff --git a/drivers/staging/rtl8723bs/include/rtw_ht.h b/drivers/staging/rtl8723bs/include/rtw_ht.h
index da3efba7112a..326b43905f8e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ht.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ht.h
@@ -51,7 +51,6 @@ enum {
 	RT_HT_CAP_USE_WOW = 0x8,
 	RT_HT_CAP_USE_SOFTAP = 0x10,
 	RT_HT_CAP_USE_92SE = 0x20,
-	RT_HT_CAP_USE_88C_92C = 0x40,
 	RT_HT_CAP_USE_AP_CLIENT_MODE = 0x80,	/*  AP team request to reserve this bit, by Emily */
 };
 
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 3468d4114f60..596f3b169bca 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1160,8 +1160,8 @@ static int rtw_cfg80211_set_probe_req_wpsp2pie(struct adapter *padapter, char *b
 	return ret;
 }
 
-static int cfg80211_rtw_scan(struct wiphy *wiphy
-	, struct cfg80211_scan_request *request)
+static int cfg80211_rtw_scan(struct wiphy *wiphy,
+			     struct cfg80211_scan_request *request)
 {
 	struct net_device *ndev = wdev_to_ndev(request->wdev);
 	int i;
@@ -1248,7 +1248,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	}
 
 	/* parsing channels, n_channels */
-	memset(ch, 0, sizeof(struct rtw_ieee80211_channel) * RTW_CHANNEL_SCAN_AMOUNT);
+	memset(ch, 0, sizeof(ch));
 	for (i = 0; i < request->n_channels && i < RTW_CHANNEL_SCAN_AMOUNT; i++) {
 		ch[i].hw_value = request->channels[i]->hw_value;
 		ch[i].flags = request->channels[i]->flags;
@@ -1257,13 +1257,18 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	spin_lock_bh(&pmlmepriv->lock);
 	if (request->n_channels == 1) {
 		for (i = 1; i < survey_times_for_one_ch; i++)
-			memcpy(&ch[i], &ch[0], sizeof(struct rtw_ieee80211_channel));
-		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT, ch, survey_times_for_one_ch);
+			memcpy(&ch[i], &ch[0], sizeof(ch[0]));
+		_status = rtw_sitesurvey_cmd(padapter, ssid,
+					     RTW_SSID_SCAN_AMOUNT, ch,
+					     survey_times_for_one_ch);
 	} else if (request->n_channels <= 4) {
 		for (j = request->n_channels - 1; j >= 0; j--)
 			for (i = 0; i < survey_times; i++)
-				memcpy(&ch[j * survey_times + i], &ch[j], sizeof(struct rtw_ieee80211_channel));
-		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT, ch, survey_times * request->n_channels);
+				memcpy(&ch[j * survey_times + i], &ch[j],
+				       sizeof(ch[0]));
+		_status = rtw_sitesurvey_cmd(padapter, ssid,
+					     RTW_SSID_SCAN_AMOUNT, ch,
+					     survey_times * request->n_channels);
 	} else {
 		_status = rtw_sitesurvey_cmd(padapter, ssid, RTW_SSID_SCAN_AMOUNT, NULL, 0);
 	}
-- 
2.55.0


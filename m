Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743780;
	b=Fw5Ked7PpSCLy71yzGpntAA/MWtYlM5SpkbppdDFSep6GVGOi6v7YxKRKua7oZ1AS48d
	 MpIMe7Vqf4eYarEUQZZPrGmPAx6cVxSCwQ678jIb8z0T4pX+WOSK1eTPBQWpB/Zpy1tvt
	 IgMERciSH7gFtM0LcTsfRgutN3Csd2vOxZCfI9+Xwy5zgBJRTJIiZJvwdkrGcEMR6rzBe
	 Kerfyz3XdTGLBvH5lT5kJugVqlsuLz6n8aom/8FK89lBnExr7Nq3Ag9rdrC6RL/5QN5cU
	 p0vGiR/qt4o8EVPA+p2Y5OKaQtV62vJ79wTYezc5EAY+XdKR3IiLSOCGSsf/tkaehjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W2vKZCmZg+O2Nxyw7f6Hngxn6AcFlY6WocbES4OvvUs=;
	b=nQG4/BRvNuU206DtDsSDDIrS+/y+Of0KNusXy0jIbGHOS5ISeAP5xrDVAquoN5YEkNVK
	 E65Q5WDGDO2shR1GQ4FOm+Uljx6oEOs8guZCQ9qTbE67FvmqrWJmgx95ogDEb30VtdzzF
	 2OE8ZFrFb9eo9wVeXCkELz5Yxtpoko3c/mbKuge9Vdsa0CIQmXoCkLkuiTOc6hz/8WNIn
	 t+GsiprHaohaP1hlYphe3dg9Q7KEYTnQfmqRCQ6Juu4LQ+/tmOcR4/tEoTcB1mpYtlrWR
	 pypyBvYaAqGUnEtMG7IESa/SFqwPK+yftHwLeYlLj3cDxE/oqhn5E4MIIoj0f0m6PiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BoPnW10v;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53341606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53341606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BoPnW10v
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1341404a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743780; x=1795348580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2vKZCmZg+O2Nxyw7f6Hngxn6AcFlY6WocbES4OvvUs=;
        b=BoPnW10vW+Z+OHHcWFjjEOUGmjrkS40gq658bhH62+ixEdAbYdc7aCglqYxGXsDCUt
         PY7uNts1nSsrGsIJTHBiIm2GBXag1fAV8GMNZmp2ol8WcZ8yYWnRlj2hZzvIs/PrdxJ+
         t3p2KHJCaQfpa2U/k+sMIDDU0KNs8pQ5QaJnymTUAJU79IpG3mc1TQtKyYIFMp6Llb9y
         gsg3Hy9HmU8zryHJ/wJCAPGfG1m/JXQgEH3CEhMGH7A74zP4DQcK4/2jlZHrQpmOZwmw
         8/qFp46Cpx6GP4R1As+U0UIff+JME1SgpwVTclv9K7q8B7WHyvDIXRIDk27uswFev8l6
         +c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743780; x=1795348580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2vKZCmZg+O2Nxyw7f6Hngxn6AcFlY6WocbES4OvvUs=;
        b=HoYB2wfTdEzop0DV/z0aD18pbeGU1rCdA2RbfF+NJoQ0avMRxWTF7QEjnnFvhtZrm9
         M9nP4jx8UzW0sJjP4/FxoFU/XOQPjeyZ87qRX8kHT+Z5KHc01qBT3wCqyJVu2lzjoz7j
         IUZjl0EkBi8ljGsWvpWZplO0FAtCYrU5do4bHuAYE3O9rDwRMCS0Ri1aT03QUUjwemct
         qWYKGexHqVKMWHxyw9fKkWe+T92qdLE1kgSXuOYFxSRR7EqnADO+SHXld84Xo4m/o/G/
         K/GdBEIjBrbWyCuU7XscAcqM/JRflezPB1/sAKsgMNc8FuQvJyx5MLiylJhL78m6QV4d
         CLxg==
X-Forwarded-Encrypted: i=1; AL+hErEd8SMrUNrMyOOdNZ4xGIkexAzu2GBlJi1lr7FDUOeYAO4vklmneBYHZS8IJY3Q+lm8sdRSfXIRCCvdYGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vgbE+vayc4AYM4omBP+to1a6c9Of/sTKCbV1P3wUujI1rbM1g
	vzFVKRt0+BEr24Q0WR27emu1wrGSthtMKqhycYxbQmaLTI80LW5NhOpW
X-Gm-Gg: AYBFou3X2wlq5gCp762gWj7w5uJ0t3FaodhMvJQ1bJiLxG5CGBdHnOEDi22EhxIF59V
	MQ57/lmJ7/8GtRSO8vx5vkzAUS9o6K0CVcdkjovL0MAjBCuJF5eS/c5KZh4S6kAblo/gEEFcLWw
	jcRERRlOJXYBTXgKKfC+agXfXxfiqATS/RfbAmSqR+1II592wqyV4ETKFmiVgVQOR4t26MEhxeo
	a/bufacmtoagO1AJGnxt72KYJMKlbFe/ngSRLXod85NB/ukMuHMIaMYBCkk4NTZ4MWpMRFHwEhd
	D9Emtnd3xWhywZtDasoqcnMBZXnw7m8opH9ppJO5MZ1NZBPikGVB2BGdGw9Yo9riOT3TEUjFC01
	9jLhMGLQndObjNI4BPekLI6K4DZCmzUHLqkPXEgbFq+BemRRm1kuqhOd/tejDu+Xd2RR2cOqYUJ
	kyB4svBJhKyBfYgvUWVKxkTw9C1dvBj6RMdFkBS9cikC1UAC8VzD7X+jI9g0r/7fAtGM0GYyC6B
	RXaGHnenjdzp2rC7Z1+e/1vTw7lBeoIXfGPYdnC9T2Pjsn1/LbeyscK/zY6/rUAKj9wTIFtMFmW
	X+KR4kLm6Bulqu4tX2ze4dEP10kHzMHK4YpfA/ZQU7R4OatjbA58bt7LlyPYokZK4i0/+VgzCVg
	N/QcQPHjwPE9MemvoI0y4fS6E9bz9vaTHOySy+wCTTms=
X-Received: by 2002:a17:90b:3c4a:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b1b0d34b9fmr5475277a91.37.1794743779543;
        Sun, 15 Nov 2026 03:56:19 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:56:18 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 4/7] wifi: rtw88: 88xxa: receive VHT SU beamformed transmissions
Date: Sun, 15 Nov 2026 19:43:30 +0800
Message-ID: <20261115114336.1739863-5-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115114336.1739863-1-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com>
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

Implement beamformee support for 88xxa since they have
support for it.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/bf.h       |  7 ++
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  3 +-
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 42 ++++++++++-
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  3 +-
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 73 +++++++++++++++++++
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |  2 +
 7 files changed, 126 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/bf.h b/drivers/net/wireless/realtek/rtw88/bf.h
index a5d3010e6b..3a53e69d01 100644
--- a/drivers/net/wireless/realtek/rtw88/bf.h
+++ b/drivers/net/wireless/realtek/rtw88/bf.h
@@ -12,9 +12,16 @@
 #define REG_ASSOCIATED_BFMER0_INFO	0x06E4
 #define REG_ASSOCIATED_BFMER1_INFO	0x06EC
 #define REG_TX_CSI_RPT_PARAM_BW20	0x06F4
+#define REG_TX_CSI_RPT_PARAM_BW40	0x06F8
+#define REG_TX_CSI_RPT_PARAM_BW80	0x06FC
 #define REG_SND_PTCL_CTRL		0x0718
+#define BIT_USE_NSTS			BIT(7)
 #define BIT_DIS_CHK_VHTSIGB_CRC		BIT(6)
 #define BIT_DIS_CHK_VHTSIGA_CRC		BIT(5)
+#define BIT_BFPARAM_SEL			BIT(4)
+#define BIT_CSISEQ_SEL			BIT(3)
+#define BIT_HT_NDPA_EN			BIT(1)
+#define BIT_VHT_NDPA_EN			BIT(0)
 #define BIT_MASK_BEAMFORM		(GENMASK(4, 0) | BIT(7))
 #define REG_MU_TX_CTL			0x14C0
 #define REG_MU_STA_GID_VLD		0x14C4
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index afcdb66fdb..f8ec1e2931 100644
--- a/drivers/net/wireless/realtek/rtw88/reg.h
+++ b/drivers/net/wireless/realtek/rtw88/reg.h
@@ -671,6 +671,7 @@
 #define REG_IQK_COM96		0x0984
 
 #define REG_FAS			0x09a4
+#define REG_CSI_CONTENT_VALUE	0x09b4
 #define REG_RXSB		0x0a00
 #define BIT_RXSB_ANA_DIV	BIT(15)
 #define REG_CCK_RX		0x0a04
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8812a.c b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
index 55f1d3d324..5d58dff4fc 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8812a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8812a.c
@@ -931,7 +931,7 @@ static const struct rtw_chip_ops rtw8812a_ops = {
 	.phy_calibration	= rtw8812a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
 	.pwr_track		= rtw8812a_pwr_track,
-	.config_bfee		= NULL,
+	.config_bfee		= rtw88xxa_bf_config_bfee,
 	.set_gid_table		= NULL,
 	.cfg_csi_rate		= NULL,
 	.led_set		= rtw8812a_led_set,
@@ -1084,6 +1084,7 @@ const struct rtw_chip_info rtw8812a_hw_spec = {
 	.old_datarate_fb_limit = true,
 	.usb_tx_agg_desc_num = 1,
 	.iqk_threshold = 8,
+	.bfer_su_max_num = 2,
 	.ampdu_density = IEEE80211_HT_MPDU_DENSITY_16,
 	.max_scan_ie_len = IEEE80211_MAX_DATA_LEN,
 
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
index e35c57c9d1..13c22d2e50 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
@@ -4,6 +4,7 @@
 
 #include <linux/usb.h>
 #include "main.h"
+#include "bf.h"
 #include "coex.h"
 #include "tx.h"
 #include "phy.h"
@@ -115,10 +116,13 @@ static void rtw8814a_init_hwcap(struct rtw_dev *rtwdev)
 			   BIT(RTW_CHANNEL_WIDTH_80);
 	efuse->hw_cap.ptcl = EFUSE_HW_CAP_PTCL_VHT;
 
-	if (hal->rf_type == RF_3T3R)
+	if (hal->rf_type == RF_3T3R) {
 		efuse->hw_cap.nss = 3;
-	else
+		hal->bfee_sts_cap = 2;
+	} else {
 		efuse->hw_cap.nss = 2;
+		hal->bfee_sts_cap = 1;
+	}
 
 	rtw_dbg(rtwdev, RTW_DBG_EFUSE,
 		"hw cap: hci=0x%02x, bw=0x%02x, ptcl=0x%02x, ant_num=%d, nss=%d\n",
@@ -2039,6 +2043,37 @@ static void rtw8814a_led_set(struct led_classdev *led,
 	rtw_write32(rtwdev, REG_GPIO_PIN_CTRL_2, led_gpio_cfg);
 }
 
+#define RTW_NDP_RX_STANDBY_TIME_8814A	0x40
+#define RTW_SND_CTRL_SOUNDING_8814A	(BIT_USE_NSTS | \
+					 BIT_DIS_CHK_VHTSIGB_CRC | \
+					 BIT_BFPARAM_SEL | BIT_CSISEQ_SEL | \
+					 BIT_HT_NDPA_EN | BIT_VHT_NDPA_EN)
+#define RTW_CSI_RPT_OFFSET_VHT_8814A	2
+#define RTW_CSI_RPT_OFFSET_HT_8814A	2
+
+static void rtw8814a_bf_enable_bfee_su(struct rtw_dev *rtwdev,
+				       struct rtw_vif *vif,
+				       struct rtw_bfee *bfee)
+{
+	rtw_bf_enable_bfee_su(rtwdev, vif, bfee);
+
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL + 1, RTW_CSI_RPT_OFFSET_VHT_8814A);
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL + 2, RTW_CSI_RPT_OFFSET_HT_8814A);
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL, RTW_SND_CTRL_SOUNDING_8814A);
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL + 3,
+		   RTW_NDP_RX_STANDBY_TIME_8814A);
+}
+
+static void rtw8814a_bf_config_bfee(struct rtw_dev *rtwdev,
+				    struct rtw_vif *vif,
+				    struct rtw_bfee *bfee, bool enable)
+{
+	if (enable)
+		rtw8814a_bf_enable_bfee_su(rtwdev, vif, bfee);
+	else
+		rtw_bf_remove_bfee_su(rtwdev, bfee);
+}
+
 static void rtw8814a_fill_txdesc_checksum(struct rtw_dev *rtwdev,
 					  struct rtw_tx_pkt_info *pkt_info,
 					  u8 *txdesc)
@@ -2068,7 +2103,7 @@ static const struct rtw_chip_ops rtw8814a_ops = {
 	.phy_calibration	= rtw8814a_phy_calibration,
 	.cck_pd_set		= rtw8814a_phy_cck_pd_set,
 	.pwr_track		= rtw8814a_pwr_track,
-	.config_bfee		= NULL,
+	.config_bfee		= rtw8814a_bf_config_bfee,
 	.set_gid_table		= NULL,
 	.cfg_csi_rate		= NULL,
 	.led_set		= rtw8814a_led_set,
@@ -2231,6 +2266,7 @@ const struct rtw_chip_info rtw8814a_hw_spec = {
 	.rfe_defs = rtw8814a_rfe_defs,
 	.rfe_defs_size = ARRAY_SIZE(rtw8814a_rfe_defs),
 	.iqk_threshold = 8,
+	.bfer_su_max_num = 2,
 	.max_scan_ie_len = IEEE80211_MAX_DATA_LEN,
 
 	.coex_para_ver = 0,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
index 6096d3b8e4..6d106ae70d 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8821a.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
@@ -877,7 +877,7 @@ static const struct rtw_chip_ops rtw8821a_ops = {
 	.phy_calibration	= rtw8821a_phy_calibration,
 	.cck_pd_set		= rtw_phy_cck_pd_set,
 	.pwr_track		= rtw8821a_pwr_track,
-	.config_bfee		= NULL,
+	.config_bfee		= rtw88xxa_bf_config_bfee,
 	.set_gid_table		= NULL,
 	.cfg_csi_rate		= NULL,
 	.led_set		= rtw8821a_led_set,
@@ -1188,6 +1188,7 @@ const struct rtw_chip_info rtw8821a_hw_spec = {
 	.old_datarate_fb_limit = true,
 	.usb_tx_agg_desc_num = 6,
 	.iqk_threshold = 8,
+	.bfer_su_max_num = 2,
 	.ampdu_density = IEEE80211_HT_MPDU_DENSITY_16,
 	.max_scan_ie_len = IEEE80211_MAX_DATA_LEN,
 
diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
index 5ffa29d181..9780999a9b 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
@@ -138,6 +138,7 @@ static void rtw88xxa_read_usb_type(struct rtw_dev *rtwdev)
 		efuse->hw_cap.nss = 1;
 	else
 		efuse->hw_cap.nss = 2;
+	hal->bfee_sts_cap = 1;
 
 	if (rtwdev->chip->id == RTW_CHIP_TYPE_8821A)
 		goto print_hw_cap;
@@ -197,6 +198,78 @@ static void rtw88xxa_read_usb_type(struct rtw_dev *rtwdev)
 		efuse->hw_cap.ant_num, efuse->hw_cap.nss);
 }
 
+#define RTW_NDP_RX_STANDBY_TIME_88XXA	0x50
+#define RTW_SND_CTRL_REMOVE_88XXA	(BIT_USE_NSTS | \
+					 BIT_DIS_CHK_VHTSIGB_CRC | \
+					 BIT_CSISEQ_SEL)
+#define RTW_SND_CTRL_SOUNDING_88XXA	(RTW_SND_CTRL_REMOVE_88XXA | \
+					 BIT_HT_NDPA_EN | BIT_VHT_NDPA_EN)
+/* REG_CSI_CONTENT_VALUE from the 8812a (2T2R) and 8821a (1T1R) bb tables */
+#define RTW_CSI_CONTENT_2T2R_88XXA	0x00000000
+#define RTW_CSI_CONTENT_1T1R_88XXA	0x01081008
+
+void rtw88xxa_bf_config_bfee(struct rtw_dev *rtwdev, struct rtw_vif *vif,
+			     struct rtw_bfee *bfee, bool enable)
+{
+	static const u32 csi_rpt_regs[] = {
+		REG_TX_CSI_RPT_PARAM_BW20,
+		REG_TX_CSI_RPT_PARAM_BW40,
+		REG_TX_CSI_RPT_PARAM_BW80,
+	};
+	struct rtw_bf_info *bf_info = &rtwdev->bf_info;
+	u8 nc_index = rtwdev->efuse.hw_cap.nss - 1;
+	u8 nr_index = 1, grouping = 0, codebookinfo = 1, coefficientsize = 0;
+	u8 slot = bfee->su_reg_index;
+	u32 addr_bfer_info;
+	u32 csi_param;
+	int i;
+
+	if (bfee->role != RTW_BFEE_SU || slot >= 2)
+		return;
+
+	addr_bfer_info = slot ? REG_ASSOCIATED_BFMER1_INFO :
+				REG_ASSOCIATED_BFMER0_INFO;
+
+	rtw_dbg(rtwdev, RTW_DBG_BF, "SU beamformee %s slot %u\n",
+		enable ? "enable" : "disable", slot);
+
+	if (!enable) {
+		rtw_write32(rtwdev, addr_bfer_info, 0);
+		rtw_write16(rtwdev, addr_bfer_info + 4, 0);
+
+		clear_bit(slot, bf_info->bfer_su_reg_maping);
+		bfee->su_reg_index = 0xff;
+
+		if (!bf_info->bfer_su_cnt)
+			rtw_write8(rtwdev, REG_SND_PTCL_CTRL,
+				   RTW_SND_CTRL_REMOVE_88XXA);
+		return;
+	}
+
+	if (rtwdev->efuse.hw_cap.nss == 2)
+		rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE,
+			    RTW_CSI_CONTENT_2T2R_88XXA);
+	else
+		rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE,
+			    RTW_CSI_CONTENT_1T1R_88XXA);
+
+	csi_param = (coefficientsize << 10) | (codebookinfo << 8) |
+		    (grouping << 6) | (nr_index << 3) | nc_index;
+	/* same parameters for both beamformer slots */
+	csi_param |= csi_param << 16;
+
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL, RTW_SND_CTRL_SOUNDING_88XXA);
+	for (i = 0; i < ETH_ALEN; i++)
+		rtw_write8(rtwdev, addr_bfer_info + i, bfee->mac_addr[i]);
+
+	for (i = 0; i < ARRAY_SIZE(csi_rpt_regs); i++)
+		rtw_write32(rtwdev, csi_rpt_regs[i], csi_param);
+
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL + 3,
+		   RTW_NDP_RX_STANDBY_TIME_88XXA);
+}
+EXPORT_SYMBOL(rtw88xxa_bf_config_bfee);
+
 int rtw88xxa_read_efuse(struct rtw_dev *rtwdev, u8 *log_map, u8 *phy_map)
 {
 	const struct rtw_chip_info *chip = rtwdev->chip;
diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.h b/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
index 6597ca0dfc..150e86ea74 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
@@ -170,5 +170,7 @@ bool rtw88xxa_iqk_finish(int average, int threshold,
 void rtw88xxa_phy_pwrtrack(struct rtw_dev *rtwdev,
 			   void (*do_lck)(struct rtw_dev *rtwdev),
 			   void (*do_iqk)(struct rtw_dev *rtwdev));
+void rtw88xxa_bf_config_bfee(struct rtw_dev *rtwdev, struct rtw_vif *vif,
+			     struct rtw_bfee *bfee, bool enable);
 
 #endif
-- 
2.53.0


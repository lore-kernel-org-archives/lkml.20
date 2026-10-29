Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793253165;
	b=W0rS6NoaNYWKdkXuCVcXwASM3CpQ3lW0C2hMzIXQAmL82HuSraYnptOZ0v7fl+wxNYDu
	 gDChpGaTmk1XuPIpym6xmDUUG8mMxSg6gYwKjZtTItdSGD8mSx/9WWw/SYhzQ3ZFKmUyK
	 sB/Y7So3mV//XvwK+B/AyNaogGPgwnTdfXS/nWBfAkNiKKCdCylappCn7z5JLlm4gTgv4
	 cdVUJgrkhkNfh1HKr35VfLft0OAaYzqvGLMfl1YYqaeJikTcygVadUE9jJEQGxzGMfjzb
	 RNDygg1rpYFGbcgjSkUsx0VJtt4qdOAx20c5gjCUu6IcQLijyad16ryhatZX1h5b41Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y66BxD5Z5wS+5TEcHG7AOSCl9NZgY7z5gVa29LDqJaM=;
	b=Fl0kVmSjkbCtaXe5MT3GpU/WB88AXyw0C6qK9YR+nt26XhaEP8Zm5P4M4fZbXUqdgMZ5
	 QMxTo4XUZoCiQVnxyr6/FgHjm0I1VGa0PHIDNLnSIHOXI+zoLwbmrME4UvUZHFL7eREDT
	 RLMzqPHZdcysGcZtqLPcLzlZlVvp86fNNLobSRogFT+pSkUIio32QCZT9cVu+xptmYRQ2
	 J7BbO7aDT6WECASK5faHnBlhbfL2AZNSiOGexdShS+lvUiLmR0yItPA4yft5H1g2au3Kc
	 robsqn4qnATFFQ1K05bI5qJLdU/x2CsS14QeZ8vKYI8m5EIEQhRafEv4L/TnqFPqQcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Quphqasq;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626B4606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Quphqasq
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1171283a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793253164; x=1793857964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y66BxD5Z5wS+5TEcHG7AOSCl9NZgY7z5gVa29LDqJaM=;
        b=QuphqasqlEWBh//wGxmQkwyHmxxYOd53ITEE6BxtuWaekKKhwdHDg7Tc+2Q3YqDV91
         nNZyb5bOF9clrHcgUwGVBIhrJ0qrDClPXNZE8uydArCrnVoLujQruzf6GbStb4nEZu8v
         h9F7HHYRS7DDRo0OcX9pf524tPh0N2/ni6wE+q9pDXYt7RPwh5j5l0MQAtYTfg6VjfbO
         b7wCjzildgGaIeguOXTcY7f+S9me27giXOpN/ZNT5RBK4vv+qXPFoLNT7UceDQh7pWLj
         X+G+eh0TqawcDIQEhHEzRtwtFRTTOx7CjWr4hSQlsrm+N2whqrEuiiZ9L4qzvdcoHSpj
         bj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253164; x=1793857964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y66BxD5Z5wS+5TEcHG7AOSCl9NZgY7z5gVa29LDqJaM=;
        b=fkOqOh/XukOa7E/AkYxqJwslP0HnTadDx/sOeKF5j+ZLd2ZKgtbOydfnh//saRRrxu
         ZaZyzgjRZdi4spqHjhHKk1Psy/UGDpdSm5NY7O5qMf1+ep+jFvvbpC+MIFky50KFTZZj
         Hw3nCIJN0GP2v0eV+eXIaZQ9+D0TiY52ziAetsloriUfjN7SvMdqBNLRCabuqEUpRPx2
         ccLTAVZBm8tSr1J9hKYMUQk/C4Jq/vkZ2xkylzKd/+eErWpAel6IxJTq14NN/fPoo8yD
         uEtJS2n+JGtnMUhun+Y+r05htVi2vWqfy8xIR1HLJwMdJSiPsvM3XwXK3J+9zvgay9e3
         fg+A==
X-Forwarded-Encrypted: i=1; AKwUvBw7dLJxCjqBai6z9fGD4CoWrwr9+w19+LnGNFJSwUsAevBx1lJVN+wN73zme4BtTIZuPYBDiuBXgLd564k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIISiSnZXmjGwxLcn14srRPh3yx6DLA2NhmiUfAXcVG25iCC3gd
	U7GF3iWlDYs5BvGfGndgC2nuf0hbgjINvXZS4QD4d64TkAV7mcGzyofp
X-Gm-Gg: AYBFou3q/47Tra1Qu91lauff95hobxwg7BsKuGyakQAMQvJUJ4dJkQbVMgnMR7ieiMM
	jZyFKIgn8lnoiFMIBClcyk1wRd6El6hrMfuoSTR8ptjWGxkMZeeqcZrXtIF71Xwu+Hf9ccysGmQ
	qwRGF5VR2ER4YYRu8wqluz9I5YJyFnIAes9F/xB0BFkNfaY7e+GHNdH8t2h2jRlNK1uhd7WcBhs
	UNHVBwmLzqy6VDCcRyPOg8t9VxT6nK0fddv+uxjyO0iMUyx5G/bnT3eUIJ5QQUyFeEHoRFE+IHj
	qS+5xJkXmMITXG31VjqLNE2BrNNdlO0harG29/uqnFo/vMOuwTrhTIiP4WhB71Og8nBDGbPT/OD
	aMujp1psQ+g797ByUxgm3p/gNL6mHYqcJrTtxLHu+5elwd1pEzDNaZrQ/lvQx9O8VI1TDJitSPD
	MkSpiSDCwEO/iB5jMGnDWFWxjG7hHDcvOnFVWU6fcHt5HqPRvjNFEkmdgZQorcI3oIiBx7CZoRt
	lTGjPMs8DCzo7pJzhKYPoOxl5asPYsNON+QtEkKN1JbnA1H5W+WcLM9sPFmdWizgQj38dmo+QDl
	Nb0D5L4tT7nV22yYRIgi2ohrizBxQdQ8s2sLkyR/Pz7er/Bi2qBNe/18N4lsjujYTIRUmtl3L4u
	m5BPz
X-Received: by 2002:a17:90b:5404:b0:3ad:870d:1bfa with SMTP id 98e67ed59e1d1-3ae5819bbe8mr3354054a91.23.1793253163618;
        Wed, 28 Oct 2026 22:52:43 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:65cc:625f:9c43:1e88])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm2523531a91.0.2026.10.28.22.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:52:43 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] wifi: rtw88: 88xxa: receive VHT SU beamformed transmissions
Date: Thu, 29 Oct 2026 13:52:04 +0800
Message-ID: <20261029055212.84711-3-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029055212.84711-1-hjf3108@gmail.com>
References: <20261029055212.84711-1-hjf3108@gmail.com>
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
 drivers/net/wireless/realtek/rtw88/bf.h       |  2 +
 drivers/net/wireless/realtek/rtw88/main.c     | 12 ++--
 drivers/net/wireless/realtek/rtw88/reg.h      |  1 +
 drivers/net/wireless/realtek/rtw88/rtw8812a.c |  3 +-
 drivers/net/wireless/realtek/rtw88/rtw8814a.c | 36 ++++++++++-
 drivers/net/wireless/realtek/rtw88/rtw8821a.c |  3 +-
 drivers/net/wireless/realtek/rtw88/rtw88xxa.c | 62 +++++++++++++++++++
 drivers/net/wireless/realtek/rtw88/rtw88xxa.h |  2 +
 8 files changed, 112 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/bf.h b/drivers/net/wireless/realtek/rtw88/bf.h
index a5d3010e6be6e..0aa78fb6a7e64 100644
--- a/drivers/net/wireless/realtek/rtw88/bf.h
+++ b/drivers/net/wireless/realtek/rtw88/bf.h
@@ -12,6 +12,8 @@
 #define REG_ASSOCIATED_BFMER0_INFO	0x06E4
 #define REG_ASSOCIATED_BFMER1_INFO	0x06EC
 #define REG_TX_CSI_RPT_PARAM_BW20	0x06F4
+#define REG_TX_CSI_RPT_PARAM_BW40	0x06F8
+#define REG_TX_CSI_RPT_PARAM_BW80	0x06FC
 #define REG_SND_PTCL_CTRL		0x0718
 #define BIT_DIS_CHK_VHTSIGB_CRC		BIT(6)
 #define BIT_DIS_CHK_VHTSIGA_CRC		BIT(5)
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7d7b66844862..0a1b5575b7299 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1605,6 +1605,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 			     struct ieee80211_sta_vht_cap *vht_cap)
 {
+	const struct rtw_chip_info *chip = rtwdev->chip;
 	struct rtw_efuse *efuse = &rtwdev->efuse;
 	u16 mcs_map = 0;
 	__le16 highest;
@@ -1623,10 +1624,13 @@ static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 		       0;
 	if (rtwdev->hal.rf_path_num > 1)
 		vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
-	vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
-			IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
-	vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
-			IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
+	if (rtw_bf_support && chip->bfer_su_max_num) {
+		vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
+		vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
+				IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
+	}
+	if (rtw_bf_support && chip->bfer_mu_max_num)
+		vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
 
 	if (rtw_chip_has_rx_ldpc(rtwdev))
 		vht_cap->cap |= IEEE80211_VHT_CAP_RXLDPC;
diff --git a/drivers/net/wireless/realtek/rtw88/reg.h b/drivers/net/wireless/realtek/rtw88/reg.h
index afcdb66fdb9a1..f8ec1e2931f63 100644
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
index 55f1d3d3240be..5d58dff4fcee7 100644
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
index 5bb55606f14a1..2db05a83766d6 100644
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
@@ -2039,6 +2043,31 @@ static void rtw8814a_led_set(struct led_classdev *led,
 	rtw_write32(rtwdev, REG_GPIO_PIN_CTRL_2, led_gpio_cfg);
 }
 
+#define RTW_NDP_RX_STANDBY_TIME_8814A	0x40
+#define RTW_SND_CTRL_SOUNDING_8814A	0xDB
+
+static void rtw8814a_bf_enable_bfee_su(struct rtw_dev *rtwdev,
+				       struct rtw_vif *vif,
+				       struct rtw_bfee *bfee)
+{
+	rtw_bf_enable_bfee_su(rtwdev, vif, bfee);
+
+	rtw_write16(rtwdev, REG_SND_PTCL_CTRL + 1, 0x0202);
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
@@ -2068,7 +2097,7 @@ static const struct rtw_chip_ops rtw8814a_ops = {
 	.phy_calibration	= rtw8814a_phy_calibration,
 	.cck_pd_set		= rtw8814a_phy_cck_pd_set,
 	.pwr_track		= rtw8814a_pwr_track,
-	.config_bfee		= NULL,
+	.config_bfee		= rtw8814a_bf_config_bfee,
 	.set_gid_table		= NULL,
 	.cfg_csi_rate		= NULL,
 	.led_set		= rtw8814a_led_set,
@@ -2231,6 +2260,7 @@ const struct rtw_chip_info rtw8814a_hw_spec = {
 	.rfe_defs = rtw8814a_rfe_defs,
 	.rfe_defs_size = ARRAY_SIZE(rtw8814a_rfe_defs),
 	.iqk_threshold = 8,
+	.bfer_su_max_num = 2,
 	.max_scan_ie_len = IEEE80211_MAX_DATA_LEN,
 
 	.coex_para_ver = 0,
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8821a.c b/drivers/net/wireless/realtek/rtw88/rtw8821a.c
index 6096d3b8e41be..6d106ae70d914 100644
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
index c298fa0fb2a6b..d3dd0ebfb4024 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
@@ -138,6 +138,7 @@ static void rtw88xxa_read_usb_type(struct rtw_dev *rtwdev)
 		efuse->hw_cap.nss = 1;
 	else
 		efuse->hw_cap.nss = 2;
+	hal->bfee_sts_cap = 1;
 
 	if (rtwdev->chip->id == RTW_CHIP_TYPE_8821A)
 		goto print_hw_cap;
@@ -197,6 +198,67 @@ static void rtw88xxa_read_usb_type(struct rtw_dev *rtwdev)
 		efuse->hw_cap.ant_num, efuse->hw_cap.nss);
 }
 
+#define RTW_NDP_RX_STANDBY_TIME_88XXA	0x50
+#define RTW_SND_CTRL_REMOVE_88XXA	0xC8
+#define RTW_SND_CTRL_SOUNDING_88XXA	0xCB
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
+	u8 slot = bfee->su_reg_index;
+	u32 addr_bfer_info;
+	u32 csi_param;
+	int i;
+
+	if (bfee->role != RTW_BFEE_SU || slot >= 2)
+		return;
+
+	addr_bfer_info = slot ? REG_ASSOCIATED_BFMER1_INFO :
+				      REG_ASSOCIATED_BFMER0_INFO;
+
+	rtw_dbg(rtwdev, RTW_DBG_BF, "chip %d SU beamformee %s slot %u\n",
+		rtwdev->chip->id, enable ? "enable" : "disable", slot);
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
+	if (hweight8(rtwdev->hal.antenna_rx) == 2) {
+		rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0);
+		csi_param = 0x01090109;
+	} else {
+		rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0x01081008);
+		csi_param = 0x01080108;
+	}
+
+	rtw_write8(rtwdev, REG_SND_PTCL_CTRL,
+		   RTW_SND_CTRL_SOUNDING_88XXA);
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
 int rtw88xxa_read_efuse(struct rtw_dev *rtwdev, u8 *log_map)
 {
 	const struct rtw_chip_info *chip = rtwdev->chip;
diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.h b/drivers/net/wireless/realtek/rtw88/rtw88xxa.h
index d9c8db58909ca..0aaf7aa4aafdd 100644
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
2.55.0


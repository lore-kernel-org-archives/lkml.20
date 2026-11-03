Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744095;
	b=AX3yvYmBhG30B4I0ngJSgkFKCUsu4vQjCCszqF4u0OTqX7Wo4rNRxYuKu8mfUpUCeW6n
	 I4xRMsI0V7FqjHRqTL5GERl9DNRx/rkna5/X2t7+lAvqPXc2TXXQkBNU0mc6pAxOCQmMC
	 IiZTrFbpXjTnBX0BL7DjTzoXeh2iOcVvv8DX+EO1ImcJsJMAM/9vR8cq3628wOD58m9e7
	 Nr4ArAH8HAN+kSunQew5LoictN3LWWvKkTEbU0a6ULAkuZhWElm1OUIkPyEBcx82IuyXo
	 sUdkjs/KhZrA0NqmZkG5jfTIRgBHewK9akTPsmVpvCJXyHlRdXPxBYS1s1wTU4YvbLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zNqhYjBcKhETEDzsIO3IaTabSTHJXJT4S3eZlXcYIeE=;
	b=UT8VkN8Fg2ZVVBMG5fjmwTG6rWHIrq2g+osLYtBS2Q8wrazeaBO3+WL9vNgkh7PkdWDU
	 Cv5jOV/hsvNT203SEQnRLAYDWeMuTC+k6MU8c6JFkH60Zwh7wyeehfAmUkJqHyoibs2dI
	 /SGXS7ncFPl72rwN/3r1KwbXcUHnLvjeMYVZc65jKjXjW7Tob4SQ9EdOmFsFge4b6r8vl
	 YG+Vi0cRdWP0h8+kAPzD1PYAcmk25Exr+lEYWPmSSk9gWzBjnImyXG+lPcS3opPGRuKoX
	 WAatqVbYYZl09ZnmCvrXCq9qQLqOM2ObtMee2NSuWp9nW+0AgkWFEmIvcawJ05U9GVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HrkiYa2d;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA71F606D810
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA71F606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HrkiYa2d
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48bbb06e746so34712f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744093; x=1794348893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zNqhYjBcKhETEDzsIO3IaTabSTHJXJT4S3eZlXcYIeE=;
        b=HrkiYa2d4x9SFCc0HMUqmbK87AFQiH4Yu4DXq/8RRl+NAn14nC/nOv+zQsJ4PkHv8s
         T1ZSZxp0HLSUkxzt0deIjkeWeWTZFCtLEZq+fCJC+fAXxjdhQ0L8S6Awqv957OoyJbom
         xF7jwfjae/qIx+1ZsIPUzodeHKBCfJJZCdFdPb552qO+y9YA0FER46FUiCwIkvJ6KgtW
         sRS0XCjwQnmCwSKB2BsSGnlPvk/Z+kyZz/huZL0mcXf4xHqtWM6LtccGffGSqPFVBmfF
         X9vz9cK2f1bh4AQ0Q+BmRWglpjV9GMu4bNagvN0qWbDmwFhCr9RkrJYD1rVNtxXbSRTs
         FJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744093; x=1794348893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zNqhYjBcKhETEDzsIO3IaTabSTHJXJT4S3eZlXcYIeE=;
        b=fZJMqsljYxOD/aRSJC/VztKVh/J4N/XxDj//c2yiDu8iDzPdugVHfUQBH+ca0vT25c
         JILgT4+kZKDyLekl7hA8zjkpucTRisPcTMVKr0P6EiPlfvGRFZZWJfcUQNVYeYYZXIEQ
         eWWEOCglAPXafmqi1SXXxPtez+zgXoXuguahTvgQuCqIusCkZh01xyQfyLX4csHBB0ZT
         GkbAtyBa3/cJVjCta6V1zpQUaQPUVtzlqzKmGq5NmI6kMzeAz9ZDG8F0WbT3AyBT71Xq
         3uUaxTVUCwuDhEmnHMy8Cs/DtaYXQQMmgMqs3Tniqxj7Q9FVjmvFP+XsRz4wQhUaufYe
         lKfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJFjNDzNjV6/LjTdF9srPhaIGQcBx+eG7Hi7uaSA2SjZHgUN2s4oyDMptYMqaZ3N0u73x4QiCJIp098RE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hIyFRsmUAqCJvav2BkOq7lqQfuKjVM36U+YRgtXrsij+TMkTv
	iQRJxKdksZI/QphGvRfjoc3kk6BP1B0tmpP26PhmAvOYjA4vC5+YhvrN
X-Gm-Gg: AYBFou3CME0Z75kOaMZS9GUx7ZroR9ceYIIhKW9hE3JywL72mLWEcbjk+umbkpVJwTw
	PB0RbZqCGgRnudna3K6Knhdj+098geazZUtqD6N0DM0P+K4NbuhY089jijSUcsxuK7GLsPxOk4s
	oYCOARC4DpiLskHHsPCz9/IFfIbgYoLsNtn61Xtef2Tbd9wC2MRbO85L6pUdVn9uYcOTDOW9gAw
	/Ki19oBPyx9VMhh8y5gHQwUEJauav95DduwfZCDiTmAjPq1SPgsI0Br1PIBcMrQzJb9kIrImQlX
	CGY7o52DFJfQGYmRsrPJ9AdMFAYAkJ8JL5c6IhAFhekRQFaeV3STTh0bBncIwgVYXvGegKmPnur
	X0iCEcw8hl2qDlhaeaa6kIC8XKsKUvdmpSO8qgtK2U6BroG0cgkpQdlC60SCMGFFuh4fDe7Kpx/
	i8TrXGPT6DhjWEv//EnnVtv8jal2xB5zrJ/XqG5qZG+NQmdcPCG7wElJE45KVy422O00Td3dRj7
	yGV+w8KnjFFFUhExn/hoM39o4n5kjIOSKyD+SaDNkK7SYMHAfU9BX9QWRQrXccalhAbMqObBDA/
	uKYiPwbQinKrOzZd/BiyT2vZZM57sWW4VsKj/FS0pUGeQIEuvD36tVdcbwqgH2jgOjCh03eAJ9z
	NnW2rTDzO+wiP5cx5HtHwWlpW7LzbcG6eElk=
X-Received: by 2002:adf:e003:0:20b0:48d:f14a:917d with SMTP id ffacd0b85a97d-48e6e2f293dmr24529953f8f.16.1793744093018;
        Tue, 03 Nov 2026 14:14:53 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm328556f8f.14.2026.11.03.14.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v4 2/6] net: phy: mediatek: move MTK GE SoC registers define to dedicated header
Date: Tue,  3 Nov 2026 23:14:33 +0100
Message-ID: <20261103221439.30502-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103221439.30502-1-ansuelsmth@gmail.com>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
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

In preparation for support of special Software Calibration for Airoha
PHY, move the MTK GE SoC registers define to a dedicated header.

This is to keep cleaner code and permit sharing these define in multiple
source code.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                           |   1 +
 drivers/net/phy/mediatek/mtk-ge-soc.c | 349 +------------------------
 drivers/net/phy/mediatek/mtk-ge-soc.h | 357 ++++++++++++++++++++++++++
 3 files changed, 359 insertions(+), 348 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 09713dc4c6a7..8add8b8cd306 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16990,6 +16990,7 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/phy/mediatek/mtk-2p5ge.c
 F:	drivers/net/phy/mediatek/mtk-ge-soc.c
+F:	drivers/net/phy/mediatek/mtk-ge-soc.h
 F:	drivers/net/phy/mediatek/mtk-phy-lib.c
 F:	drivers/net/phy/mediatek/mtk-ge.c
 F:	drivers/net/phy/mediatek/mtk.h
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 0041300d4f10..2b1e9923db98 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -11,331 +11,10 @@
 
 #include "../phylib.h"
 #include "mtk.h"
+#include "mtk-ge-soc.h"
 
 #define MTK_PHY_MAX_LEDS			2
 
-#define MTK_GPHY_ID_MT7981			0x03a29461
-#define MTK_GPHY_ID_MT7988			0x03a29481
-#define MTK_GPHY_ID_EN7528			0x03a29491
-#define MTK_GPHY_ID_AN7581			0x03a294c1
-#define MTK_GPHY_ID_AN7583			0xc0ff0420
-
-#define MTK_EXT_PAGE_ACCESS			0x1f
-#define MTK_PHY_PAGE_STANDARD			0x0000
-#define MTK_PHY_PAGE_EXTENDED_3			0x0003
-
-#define MTK_PHY_LPI_REG_14			0x14
-#define MTK_PHY_LPI_WAKE_TIMER_1000_MASK	GENMASK(8, 0)
-
-#define MTK_PHY_LPI_REG_1c			0x1c
-#define MTK_PHY_SMI_DET_ON_THRESH_MASK		GENMASK(13, 8)
-
-#define MTK_PHY_PAGE_EXTENDED_2A30		0x2a30
-
-/* Registers on Token Ring debug nodes */
-/* ch_addr = 0x0, node_addr = 0x7, data_addr = 0x15 */
-/* NormMseLoThresh */
-#define NORMAL_MSE_LO_THRESH_MASK		GENMASK(15, 8)
-
-/* ch_addr = 0x0, node_addr = 0xf, data_addr = 0x3c */
-/* RemAckCntLimitCtrl */
-#define REMOTE_ACK_COUNT_LIMIT_CTRL_MASK	GENMASK(2, 1)
-
-/* ch_addr = 0x1, node_addr = 0xd, data_addr = 0x20 */
-/* VcoSlicerThreshBitsHigh */
-#define VCO_SLICER_THRESH_HIGH_MASK		GENMASK(23, 0)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x0 */
-/* DfeTailEnableVgaThresh1000 */
-#define DFE_TAIL_EANBLE_VGA_TRHESH_1000		GENMASK(5, 1)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x1 */
-/* MrvlTrFix100Kp */
-#define MRVL_TR_FIX_100KP_MASK			GENMASK(22, 20)
-/* MrvlTrFix100Kf */
-#define MRVL_TR_FIX_100KF_MASK			GENMASK(19, 17)
-/* MrvlTrFix1000Kp */
-#define MRVL_TR_FIX_1000KP_MASK			GENMASK(16, 14)
-/* MrvlTrFix1000Kf */
-#define MRVL_TR_FIX_1000KF_MASK			GENMASK(13, 11)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x12 */
-/* VgaDecRate */
-#define VGA_DECIMATION_RATE_MASK		GENMASK(8, 5)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x17 */
-/* SlvDSPreadyTime */
-#define SLAVE_DSP_READY_TIME_MASK		GENMASK(22, 15)
-/* MasDSPreadyTime */
-#define MASTER_DSP_READY_TIME_MASK		GENMASK(14, 7)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x18 */
-/* EnabRandUpdTrig */
-#define ENABLE_RANDOM_UPDOWN_COUNTER_TRIGGER	BIT(8)
-
-/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x20 */
-/* ResetSyncOffset */
-#define RESET_SYNC_OFFSET_MASK			GENMASK(11, 8)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x0 */
-/* FfeUpdGainForceVal */
-#define FFE_UPDATE_GAIN_FORCE_VAL_MASK		GENMASK(9, 7)
-/* FfeUpdGainForce */
-#define FFE_UPDATE_GAIN_FORCE			BIT(6)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x3 */
-/* TrFreeze */
-#define TR_FREEZE_MASK				GENMASK(11, 0)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x6 */
-/* SS: Steady-state, KP: Proportional Gain */
-/* SSTrKp100 */
-#define SS_TR_KP100_MASK			GENMASK(21, 19)
-/* SSTrKf100 */
-#define SS_TR_KF100_MASK			GENMASK(18, 16)
-/* SSTrKp1000Mas */
-#define SS_TR_KP1000_MASTER_MASK		GENMASK(15, 13)
-/* SSTrKf1000Mas */
-#define SS_TR_KF1000_MASTER_MASK		GENMASK(12, 10)
-/* SSTrKp1000Slv */
-#define SS_TR_KP1000_SLAVE_MASK			GENMASK(9, 7)
-/* SSTrKf1000Slv */
-#define SS_TR_KF1000_SLAVE_MASK			GENMASK(6, 4)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x8 */
-/* clear this bit if wanna select from AFE */
-/* Regsigdet_sel_1000 */
-#define EEE1000_SELECT_SIGNAL_DETECTION_FROM_DFE	BIT(4)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0xd */
-/* RegEEE_st2TrKf1000 */
-#define EEE1000_STAGE2_TR_KF_MASK		GENMASK(13, 11)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0xf */
-/* RegEEE_slv_waketr_timer_tar */
-#define SLAVE_WAKETR_TIMER_MASK			GENMASK(20, 11)
-/* RegEEE_slv_remtx_timer_tar */
-#define SLAVE_REMTX_TIMER_MASK			GENMASK(10, 1)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x10 */
-/* RegEEE_slv_wake_int_timer_tar */
-#define SLAVE_WAKEINT_TIMER_MASK		GENMASK(10, 1)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x14 */
-/* RegEEE_trfreeze_timer2 */
-#define TR_FREEZE_TIMER2_MASK			GENMASK(9, 0)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x1c */
-/* RegEEE100Stg1_tar */
-#define EEE100_LPSYNC_STAGE1_UPDATE_TIMER_MASK	GENMASK(8, 0)
-
-/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x25 */
-/* REGEEE_wake_slv_tr_wait_dfesigdet_en */
-#define WAKE_SLAVE_TR_WAIT_DFE_DETECTION_EN	BIT(11)
-
-#define ANALOG_INTERNAL_OPERATION_MAX_US	20
-#define TXRESERVE_MIN				0
-#define TXRESERVE_MAX				7
-
-#define MTK_PHY_ANARG_RG			0x10
-#define   MTK_PHY_TCLKOFFSET_MASK		GENMASK(12, 8)
-
-/* Registers on MDIO_MMD_VEND1 */
-#define MTK_PHY_TXVLD_DA_RG			0x12
-#define   MTK_PHY_DA_TX_I2MPB_A_GBE_MASK	GENMASK(15, 10)
-#define   MTK_PHY_DA_TX_I2MPB_A_TBT_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_A2		0x16
-#define   MTK_PHY_DA_TX_I2MPB_A_HBT_MASK	GENMASK(15, 10)
-#define   MTK_PHY_DA_TX_I2MPB_A_TST_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_B1		0x17
-#define   MTK_PHY_DA_TX_I2MPB_B_GBE_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_B_TBT_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_B2		0x18
-#define   MTK_PHY_DA_TX_I2MPB_B_HBT_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_B_TST_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_C1		0x19
-#define   MTK_PHY_DA_TX_I2MPB_C_GBE_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_C_TBT_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_C2		0x20
-#define   MTK_PHY_DA_TX_I2MPB_C_HBT_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_C_TST_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_D1		0x21
-#define   MTK_PHY_DA_TX_I2MPB_D_GBE_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_D_TBT_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_TX_I2MPB_TEST_MODE_D2		0x22
-#define   MTK_PHY_DA_TX_I2MPB_D_HBT_MASK	GENMASK(13, 8)
-#define   MTK_PHY_DA_TX_I2MPB_D_TST_MASK	GENMASK(5, 0)
-
-#define MTK_PHY_RXADC_CTRL_RG7			0xc6
-#define   MTK_PHY_DA_AD_BUF_BIAS_LP_MASK	GENMASK(9, 8)
-
-#define MTK_PHY_RXADC_CTRL_RG9			0xc8
-#define   MTK_PHY_DA_RX_PSBN_TBT_MASK		GENMASK(14, 12)
-#define   MTK_PHY_DA_RX_PSBN_HBT_MASK		GENMASK(10, 8)
-#define   MTK_PHY_DA_RX_PSBN_GBE_MASK		GENMASK(6, 4)
-#define   MTK_PHY_DA_RX_PSBN_LP_MASK		GENMASK(2, 0)
-
-#define MTK_PHY_LDO_OUTPUT_V			0xd7
-
-#define MTK_PHY_RG_ANA_CAL_RG0			0xdb
-#define   MTK_PHY_RG_CAL_CKINV			BIT(12)
-#define   MTK_PHY_RG_ANA_CALEN			BIT(8)
-#define   MTK_PHY_RG_ZCALEN_A			BIT(0)
-
-#define MTK_PHY_RG_ANA_CAL_RG1			0xdc
-#define   MTK_PHY_RG_ZCALEN_B			BIT(12)
-#define   MTK_PHY_RG_ZCALEN_C			BIT(8)
-#define   MTK_PHY_RG_ZCALEN_D			BIT(4)
-#define   MTK_PHY_RG_TXVOS_CALEN		BIT(0)
-
-#define MTK_PHY_RG_ANA_CAL_RG5			0xe0
-#define   MTK_PHY_RG_REXT_TRIM_MASK		GENMASK(13, 8)
-
-#define MTK_PHY_RG_TX_FILTER			0xfe
-
-#define MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG120	0x120
-#define   MTK_PHY_LPI_SIG_EN_LO_THRESH1000_MASK	GENMASK(12, 8)
-#define   MTK_PHY_LPI_SIG_EN_HI_THRESH1000_MASK	GENMASK(4, 0)
-
-#define MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG122	0x122
-#define   MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK	GENMASK(7, 0)
-
-#define MTK_PHY_RG_TESTMUX_ADC_CTRL		0x144
-#define   MTK_PHY_RG_TXEN_DIG_MASK		GENMASK(5, 5)
-
-#define MTK_PHY_RG_CR_TX_AMP_OFFSET_A_B		0x172
-#define   MTK_PHY_CR_TX_AMP_OFFSET_A_MASK	GENMASK(13, 8)
-#define   MTK_PHY_CR_TX_AMP_OFFSET_B_MASK	GENMASK(6, 0)
-
-#define MTK_PHY_RG_CR_TX_AMP_OFFSET_C_D		0x173
-#define   MTK_PHY_CR_TX_AMP_OFFSET_C_MASK	GENMASK(13, 8)
-#define   MTK_PHY_CR_TX_AMP_OFFSET_D_MASK	GENMASK(6, 0)
-
-#define MTK_PHY_RG_AD_CAL_COMP			0x17a
-#define   MTK_PHY_AD_CAL_COMP_OUT_MASK		GENMASK(8, 8)
-
-#define MTK_PHY_RG_AD_CAL_CLK			0x17b
-#define   MTK_PHY_DA_CAL_CLK			BIT(0)
-
-#define MTK_PHY_RG_AD_CALIN			0x17c
-#define   MTK_PHY_DA_CALIN_FLAG			BIT(0)
-
-#define MTK_PHY_RG_DASN_DAC_IN0_A		0x17d
-#define   MTK_PHY_DASN_DAC_IN0_A_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN0_B		0x17e
-#define   MTK_PHY_DASN_DAC_IN0_B_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN0_C		0x17f
-#define   MTK_PHY_DASN_DAC_IN0_C_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN0_D		0x180
-#define   MTK_PHY_DASN_DAC_IN0_D_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN1_A		0x181
-#define   MTK_PHY_DASN_DAC_IN1_A_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN1_B		0x182
-#define   MTK_PHY_DASN_DAC_IN1_B_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN1_C		0x183
-#define   MTK_PHY_DASN_DAC_IN1_C_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DASN_DAC_IN1_D		0x184
-#define   MTK_PHY_DASN_DAC_IN1_D_MASK		GENMASK(9, 0)
-
-#define MTK_PHY_RG_DEV1E_REG19b			0x19b
-#define   MTK_PHY_BYPASS_DSP_LPI_READY		BIT(8)
-
-#define MTK_PHY_RG_LP_IIR2_K1_L			0x22a
-#define MTK_PHY_RG_LP_IIR2_K1_U			0x22b
-#define MTK_PHY_RG_LP_IIR2_K2_L			0x22c
-#define MTK_PHY_RG_LP_IIR2_K2_U			0x22d
-#define MTK_PHY_RG_LP_IIR2_K3_L			0x22e
-#define MTK_PHY_RG_LP_IIR2_K3_U			0x22f
-#define MTK_PHY_RG_LP_IIR2_K4_L			0x230
-#define MTK_PHY_RG_LP_IIR2_K4_U			0x231
-#define MTK_PHY_RG_LP_IIR2_K5_L			0x232
-#define MTK_PHY_RG_LP_IIR2_K5_U			0x233
-
-#define MTK_PHY_RG_DEV1E_REG234			0x234
-#define   MTK_PHY_TR_OPEN_LOOP_EN_MASK		GENMASK(0, 0)
-#define   MTK_PHY_LPF_X_AVERAGE_MASK		GENMASK(7, 4)
-#define   MTK_PHY_TR_LP_IIR_EEE_EN		BIT(12)
-
-#define MTK_PHY_RG_LPF_CNT_VAL			0x235
-
-#define MTK_PHY_RG_DEV1E_REG238			0x238
-#define   MTK_PHY_LPI_SLV_SEND_TX_TIMER_MASK	GENMASK(8, 0)
-#define   MTK_PHY_LPI_SLV_SEND_TX_EN		BIT(12)
-
-#define MTK_PHY_RG_DEV1E_REG239			0x239
-#define   MTK_PHY_LPI_SEND_LOC_TIMER_MASK	GENMASK(8, 0)
-#define   MTK_PHY_LPI_TXPCS_LOC_RCV		BIT(12)
-
-#define MTK_PHY_RG_DEV1E_REG27C			0x27c
-#define   MTK_PHY_VGASTATE_FFE_THR_ST1_MASK	GENMASK(12, 8)
-#define MTK_PHY_RG_DEV1E_REG27D			0x27d
-#define   MTK_PHY_VGASTATE_FFE_THR_ST2_MASK	GENMASK(4, 0)
-
-#define MTK_PHY_RG_DEV1E_REG2C7			0x2c7
-#define   MTK_PHY_MAX_GAIN_MASK			GENMASK(4, 0)
-#define   MTK_PHY_MIN_GAIN_MASK			GENMASK(12, 8)
-
-#define MTK_PHY_RG_DEV1E_REG2D1			0x2d1
-#define   MTK_PHY_VCO_SLICER_THRESH_BITS_HIGH_EEE_MASK	GENMASK(7, 0)
-#define   MTK_PHY_LPI_SKIP_SD_SLV_TR		BIT(8)
-#define   MTK_PHY_LPI_TR_READY			BIT(9)
-#define   MTK_PHY_LPI_VCO_EEE_STG0_EN		BIT(10)
-
-#define MTK_PHY_RG_DEV1E_REG323			0x323
-#define   MTK_PHY_EEE_WAKE_MAS_INT_DC		BIT(0)
-#define   MTK_PHY_EEE_WAKE_SLV_INT_DC		BIT(4)
-
-#define MTK_PHY_RG_DEV1E_REG324			0x324
-#define   MTK_PHY_SMI_DETCNT_MAX_MASK		GENMASK(5, 0)
-#define   MTK_PHY_SMI_DET_MAX_EN		BIT(8)
-
-#define MTK_PHY_RG_DEV1E_REG326			0x326
-#define   MTK_PHY_LPI_MODE_SD_ON		BIT(0)
-#define   MTK_PHY_RESET_RANDUPD_CNT		BIT(1)
-#define   MTK_PHY_TREC_UPDATE_ENAB_CLR		BIT(2)
-#define   MTK_PHY_LPI_QUIT_WAIT_DFE_SIG_DET_OFF	BIT(4)
-#define   MTK_PHY_TR_READY_SKIP_AFE_WAKEUP	BIT(5)
-
-#define MTK_PHY_LDO_PUMP_EN_PAIRAB		0x502
-#define MTK_PHY_LDO_PUMP_EN_PAIRCD		0x503
-
-#define MTK_PHY_DA_TX_R50_PAIR_A		0x53d
-#define MTK_PHY_DA_TX_R50_PAIR_B		0x53e
-#define MTK_PHY_DA_TX_R50_PAIR_C		0x53f
-#define MTK_PHY_DA_TX_R50_PAIR_D		0x540
-
-/* Registers on MDIO_MMD_VEND2 */
-#define MTK_PHY_LED1_DEFAULT_POLARITIES		BIT(1)
-
-/* LED basic control register, part of the same LED block as the LED0/LED1
- * control registers above. The air_en8811h driver describes the same
- * register as AIR_PHY_LED_BCR.
- */
-#define MTK_PHY_LED_BCR				0x21
-#define   MTK_PHY_LED_BCR_CLK_EN		BIT(3)
-#define   MTK_PHY_LED_BCR_EXT_CTRL		BIT(15)
-
-#define MTK_PHY_RG_BG_RASEL			0x115
-#define   MTK_PHY_RG_BG_RASEL_MASK		GENMASK(2, 0)
-
-/* 'boottrap' register reflecting the configuration of the 4 PHY LEDs */
-#define RG_GPIO_MISC_TPBANK0			0x6f0
-#define   RG_GPIO_MISC_TPBANK0_BOOTMODE		GENMASK(11, 8)
-
 /* These macro privides efuse parsing for internal phy. */
 #define EFS_DA_TX_I2MPB_A(x)			(((x) >> 0) & GENMASK(5, 0))
 #define EFS_DA_TX_I2MPB_B(x)			(((x) >> 6) & GENMASK(5, 0))
@@ -355,32 +34,6 @@
 #define EFS_RG_BG_RASEL(x)			(((x) >> 4) & GENMASK(2, 0))
 #define EFS_RG_REXT_TRIM(x)			(((x) >> 7) & GENMASK(5, 0))
 
-enum {
-	NO_PAIR,
-	PAIR_A,
-	PAIR_B,
-	PAIR_C,
-	PAIR_D,
-};
-
-enum calibration_mode {
-	EFUSE_K,
-	SW_K
-};
-
-enum CAL_ITEM {
-	REXT,
-	TX_OFFSET,
-	TX_AMP,
-	TX_R50,
-	TX_VCM
-};
-
-enum CAL_MODE {
-	EFUSE_M,
-	SW_M
-};
-
 struct mtk_socphy_shared {
 	u32			boottrap;
 	struct mtk_socphy_priv	priv[4];
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.h b/drivers/net/phy/mediatek/mtk-ge-soc.h
new file mode 100644
index 000000000000..008efd148a2c
--- /dev/null
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.h
@@ -0,0 +1,357 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _MTK_GE_SOC_H_
+#define _MTK_GE_SOC_H_
+
+#include <linux/bitfield.h>
+
+#define MTK_GPHY_ID_MT7981			0x03a29461
+#define MTK_GPHY_ID_MT7988			0x03a29481
+#define MTK_GPHY_ID_EN7528			0x03a29491
+#define MTK_GPHY_ID_AN7581			0x03a294c1
+#define MTK_GPHY_ID_AN7583			0xc0ff0420
+
+#define MTK_EXT_PAGE_ACCESS			0x1f
+#define MTK_PHY_PAGE_STANDARD			0x0000
+#define MTK_PHY_PAGE_EXTENDED_3			0x0003
+
+#define MTK_PHY_LPI_REG_14			0x14
+#define MTK_PHY_LPI_WAKE_TIMER_1000_MASK	GENMASK(8, 0)
+
+#define MTK_PHY_LPI_REG_1c			0x1c
+#define MTK_PHY_SMI_DET_ON_THRESH_MASK		GENMASK(13, 8)
+
+#define MTK_PHY_PAGE_EXTENDED_2A30		0x2a30
+
+/* Registers on Token Ring debug nodes */
+/* ch_addr = 0x0, node_addr = 0x7, data_addr = 0x15 */
+/* NormMseLoThresh */
+#define NORMAL_MSE_LO_THRESH_MASK		GENMASK(15, 8)
+
+/* ch_addr = 0x0, node_addr = 0xf, data_addr = 0x3c */
+/* RemAckCntLimitCtrl */
+#define REMOTE_ACK_COUNT_LIMIT_CTRL_MASK	GENMASK(2, 1)
+
+/* ch_addr = 0x1, node_addr = 0xd, data_addr = 0x20 */
+/* VcoSlicerThreshBitsHigh */
+#define VCO_SLICER_THRESH_HIGH_MASK		GENMASK(23, 0)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x0 */
+/* DfeTailEnableVgaThresh1000 */
+#define DFE_TAIL_EANBLE_VGA_TRHESH_1000		GENMASK(5, 1)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x1 */
+/* MrvlTrFix100Kp */
+#define MRVL_TR_FIX_100KP_MASK			GENMASK(22, 20)
+/* MrvlTrFix100Kf */
+#define MRVL_TR_FIX_100KF_MASK			GENMASK(19, 17)
+/* MrvlTrFix1000Kp */
+#define MRVL_TR_FIX_1000KP_MASK			GENMASK(16, 14)
+/* MrvlTrFix1000Kf */
+#define MRVL_TR_FIX_1000KF_MASK			GENMASK(13, 11)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x12 */
+/* VgaDecRate */
+#define VGA_DECIMATION_RATE_MASK		GENMASK(8, 5)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x17 */
+/* SlvDSPreadyTime */
+#define SLAVE_DSP_READY_TIME_MASK		GENMASK(22, 15)
+/* MasDSPreadyTime */
+#define MASTER_DSP_READY_TIME_MASK		GENMASK(14, 7)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x18 */
+/* EnabRandUpdTrig */
+#define ENABLE_RANDOM_UPDOWN_COUNTER_TRIGGER	BIT(8)
+
+/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x20 */
+/* ResetSyncOffset */
+#define RESET_SYNC_OFFSET_MASK			GENMASK(11, 8)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x0 */
+/* FfeUpdGainForceVal */
+#define FFE_UPDATE_GAIN_FORCE_VAL_MASK		GENMASK(9, 7)
+/* FfeUpdGainForce */
+#define FFE_UPDATE_GAIN_FORCE			BIT(6)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x3 */
+/* TrFreeze */
+#define TR_FREEZE_MASK				GENMASK(11, 0)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x6 */
+/* SS: Steady-state, KP: Proportional Gain */
+/* SSTrKp100 */
+#define SS_TR_KP100_MASK			GENMASK(21, 19)
+/* SSTrKf100 */
+#define SS_TR_KF100_MASK			GENMASK(18, 16)
+/* SSTrKp1000Mas */
+#define SS_TR_KP1000_MASTER_MASK		GENMASK(15, 13)
+/* SSTrKf1000Mas */
+#define SS_TR_KF1000_MASTER_MASK		GENMASK(12, 10)
+/* SSTrKp1000Slv */
+#define SS_TR_KP1000_SLAVE_MASK			GENMASK(9, 7)
+/* SSTrKf1000Slv */
+#define SS_TR_KF1000_SLAVE_MASK			GENMASK(6, 4)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x8 */
+/* clear this bit if wanna select from AFE */
+/* Regsigdet_sel_1000 */
+#define EEE1000_SELECT_SIGNAL_DETECTION_FROM_DFE	BIT(4)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0xd */
+/* RegEEE_st2TrKf1000 */
+#define EEE1000_STAGE2_TR_KF_MASK		GENMASK(13, 11)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0xf */
+/* RegEEE_slv_waketr_timer_tar */
+#define SLAVE_WAKETR_TIMER_MASK			GENMASK(20, 11)
+/* RegEEE_slv_remtx_timer_tar */
+#define SLAVE_REMTX_TIMER_MASK			GENMASK(10, 1)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x10 */
+/* RegEEE_slv_wake_int_timer_tar */
+#define SLAVE_WAKEINT_TIMER_MASK		GENMASK(10, 1)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x14 */
+/* RegEEE_trfreeze_timer2 */
+#define TR_FREEZE_TIMER2_MASK			GENMASK(9, 0)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x1c */
+/* RegEEE100Stg1_tar */
+#define EEE100_LPSYNC_STAGE1_UPDATE_TIMER_MASK	GENMASK(8, 0)
+
+/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x25 */
+/* REGEEE_wake_slv_tr_wait_dfesigdet_en */
+#define WAKE_SLAVE_TR_WAIT_DFE_DETECTION_EN	BIT(11)
+
+#define ANALOG_INTERNAL_OPERATION_MAX_US	20
+#define TXRESERVE_MIN				0
+#define TXRESERVE_MAX				7
+
+#define MTK_PHY_ANARG_RG			0x10
+#define   MTK_PHY_TCLKOFFSET_MASK		GENMASK(12, 8)
+
+/* Registers on MDIO_MMD_VEND1 */
+#define MTK_PHY_TXVLD_DA_RG			0x12
+#define   MTK_PHY_DA_TX_I2MPB_A_GBE_MASK	GENMASK(15, 10)
+#define   MTK_PHY_DA_TX_I2MPB_A_TBT_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_A2		0x16
+#define   MTK_PHY_DA_TX_I2MPB_A_HBT_MASK	GENMASK(15, 10)
+#define   MTK_PHY_DA_TX_I2MPB_A_TST_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_B1		0x17
+#define   MTK_PHY_DA_TX_I2MPB_B_GBE_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_B_TBT_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_B2		0x18
+#define   MTK_PHY_DA_TX_I2MPB_B_HBT_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_B_TST_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_C1		0x19
+#define   MTK_PHY_DA_TX_I2MPB_C_GBE_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_C_TBT_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_C2		0x20
+#define   MTK_PHY_DA_TX_I2MPB_C_HBT_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_C_TST_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_D1		0x21
+#define   MTK_PHY_DA_TX_I2MPB_D_GBE_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_D_TBT_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_TX_I2MPB_TEST_MODE_D2		0x22
+#define   MTK_PHY_DA_TX_I2MPB_D_HBT_MASK	GENMASK(13, 8)
+#define   MTK_PHY_DA_TX_I2MPB_D_TST_MASK	GENMASK(5, 0)
+
+#define MTK_PHY_RXADC_CTRL_RG7			0xc6
+#define   MTK_PHY_DA_AD_BUF_BIAS_LP_MASK	GENMASK(9, 8)
+
+#define MTK_PHY_RXADC_CTRL_RG9			0xc8
+#define   MTK_PHY_DA_RX_PSBN_TBT_MASK		GENMASK(14, 12)
+#define   MTK_PHY_DA_RX_PSBN_HBT_MASK		GENMASK(10, 8)
+#define   MTK_PHY_DA_RX_PSBN_GBE_MASK		GENMASK(6, 4)
+#define   MTK_PHY_DA_RX_PSBN_LP_MASK		GENMASK(2, 0)
+
+#define MTK_PHY_LDO_OUTPUT_V			0xd7
+
+#define MTK_PHY_RG_ANA_CAL_RG0			0xdb
+#define   MTK_PHY_RG_CAL_CKINV			BIT(12)
+#define   MTK_PHY_RG_ANA_CALEN			BIT(8)
+#define   MTK_PHY_RG_ZCALEN_A			BIT(0)
+
+#define MTK_PHY_RG_ANA_CAL_RG1			0xdc
+#define   MTK_PHY_RG_ZCALEN_B			BIT(12)
+#define   MTK_PHY_RG_ZCALEN_C			BIT(8)
+#define   MTK_PHY_RG_ZCALEN_D			BIT(4)
+#define   MTK_PHY_RG_TXVOS_CALEN		BIT(0)
+
+#define MTK_PHY_RG_ANA_CAL_RG5			0xe0
+#define   MTK_PHY_RG_REXT_TRIM_MASK		GENMASK(13, 8)
+
+#define MTK_PHY_RG_TX_FILTER			0xfe
+
+#define MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG120	0x120
+#define   MTK_PHY_LPI_SIG_EN_LO_THRESH1000_MASK	GENMASK(12, 8)
+#define   MTK_PHY_LPI_SIG_EN_HI_THRESH1000_MASK	GENMASK(4, 0)
+
+#define MTK_PHY_RG_LPI_PCS_DSP_CTRL_REG122	0x122
+#define   MTK_PHY_LPI_NORM_MSE_HI_THRESH1000_MASK	GENMASK(7, 0)
+
+#define MTK_PHY_RG_TESTMUX_ADC_CTRL		0x144
+#define   MTK_PHY_RG_TXEN_DIG_MASK		GENMASK(5, 5)
+
+#define MTK_PHY_RG_CR_TX_AMP_OFFSET_A_B		0x172
+#define   MTK_PHY_CR_TX_AMP_OFFSET_A_MASK	GENMASK(13, 8)
+#define   MTK_PHY_CR_TX_AMP_OFFSET_B_MASK	GENMASK(6, 0)
+
+#define MTK_PHY_RG_CR_TX_AMP_OFFSET_C_D		0x173
+#define   MTK_PHY_CR_TX_AMP_OFFSET_C_MASK	GENMASK(13, 8)
+#define   MTK_PHY_CR_TX_AMP_OFFSET_D_MASK	GENMASK(6, 0)
+
+#define MTK_PHY_RG_AD_CAL_COMP			0x17a
+#define   MTK_PHY_AD_CAL_COMP_OUT_MASK		GENMASK(8, 8)
+
+#define MTK_PHY_RG_AD_CAL_CLK			0x17b
+#define   MTK_PHY_DA_CAL_CLK			BIT(0)
+
+#define MTK_PHY_RG_AD_CALIN			0x17c
+#define   MTK_PHY_DA_CALIN_FLAG			BIT(0)
+
+#define MTK_PHY_RG_DASN_DAC_IN0_A		0x17d
+#define   MTK_PHY_DASN_DAC_IN0_A_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN0_B		0x17e
+#define   MTK_PHY_DASN_DAC_IN0_B_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN0_C		0x17f
+#define   MTK_PHY_DASN_DAC_IN0_C_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN0_D		0x180
+#define   MTK_PHY_DASN_DAC_IN0_D_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN1_A		0x181
+#define   MTK_PHY_DASN_DAC_IN1_A_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN1_B		0x182
+#define   MTK_PHY_DASN_DAC_IN1_B_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN1_C		0x183
+#define   MTK_PHY_DASN_DAC_IN1_C_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DASN_DAC_IN1_D		0x184
+#define   MTK_PHY_DASN_DAC_IN1_D_MASK		GENMASK(9, 0)
+
+#define MTK_PHY_RG_DEV1E_REG19b			0x19b
+#define   MTK_PHY_BYPASS_DSP_LPI_READY		BIT(8)
+
+#define MTK_PHY_RG_LP_IIR2_K1_L			0x22a
+#define MTK_PHY_RG_LP_IIR2_K1_U			0x22b
+#define MTK_PHY_RG_LP_IIR2_K2_L			0x22c
+#define MTK_PHY_RG_LP_IIR2_K2_U			0x22d
+#define MTK_PHY_RG_LP_IIR2_K3_L			0x22e
+#define MTK_PHY_RG_LP_IIR2_K3_U			0x22f
+#define MTK_PHY_RG_LP_IIR2_K4_L			0x230
+#define MTK_PHY_RG_LP_IIR2_K4_U			0x231
+#define MTK_PHY_RG_LP_IIR2_K5_L			0x232
+#define MTK_PHY_RG_LP_IIR2_K5_U			0x233
+
+#define MTK_PHY_RG_DEV1E_REG234			0x234
+#define   MTK_PHY_TR_OPEN_LOOP_EN_MASK		GENMASK(0, 0)
+#define   MTK_PHY_LPF_X_AVERAGE_MASK		GENMASK(7, 4)
+#define   MTK_PHY_TR_LP_IIR_EEE_EN		BIT(12)
+
+#define MTK_PHY_RG_LPF_CNT_VAL			0x235
+
+#define MTK_PHY_RG_DEV1E_REG238			0x238
+#define   MTK_PHY_LPI_SLV_SEND_TX_TIMER_MASK	GENMASK(8, 0)
+#define   MTK_PHY_LPI_SLV_SEND_TX_EN		BIT(12)
+
+#define MTK_PHY_RG_DEV1E_REG239			0x239
+#define   MTK_PHY_LPI_SEND_LOC_TIMER_MASK	GENMASK(8, 0)
+#define   MTK_PHY_LPI_TXPCS_LOC_RCV		BIT(12)
+
+#define MTK_PHY_RG_DEV1E_REG27C			0x27c
+#define   MTK_PHY_VGASTATE_FFE_THR_ST1_MASK	GENMASK(12, 8)
+#define MTK_PHY_RG_DEV1E_REG27D			0x27d
+#define   MTK_PHY_VGASTATE_FFE_THR_ST2_MASK	GENMASK(4, 0)
+
+#define MTK_PHY_RG_DEV1E_REG2C7			0x2c7
+#define   MTK_PHY_MAX_GAIN_MASK			GENMASK(4, 0)
+#define   MTK_PHY_MIN_GAIN_MASK			GENMASK(12, 8)
+
+#define MTK_PHY_RG_DEV1E_REG2D1			0x2d1
+#define   MTK_PHY_VCO_SLICER_THRESH_BITS_HIGH_EEE_MASK	GENMASK(7, 0)
+#define   MTK_PHY_LPI_SKIP_SD_SLV_TR		BIT(8)
+#define   MTK_PHY_LPI_TR_READY			BIT(9)
+#define   MTK_PHY_LPI_VCO_EEE_STG0_EN		BIT(10)
+
+#define MTK_PHY_RG_DEV1E_REG323			0x323
+#define   MTK_PHY_EEE_WAKE_MAS_INT_DC		BIT(0)
+#define   MTK_PHY_EEE_WAKE_SLV_INT_DC		BIT(4)
+
+#define MTK_PHY_RG_DEV1E_REG324			0x324
+#define   MTK_PHY_SMI_DETCNT_MAX_MASK		GENMASK(5, 0)
+#define   MTK_PHY_SMI_DET_MAX_EN		BIT(8)
+
+#define MTK_PHY_RG_DEV1E_REG326			0x326
+#define   MTK_PHY_LPI_MODE_SD_ON		BIT(0)
+#define   MTK_PHY_RESET_RANDUPD_CNT		BIT(1)
+#define   MTK_PHY_TREC_UPDATE_ENAB_CLR		BIT(2)
+#define   MTK_PHY_LPI_QUIT_WAIT_DFE_SIG_DET_OFF	BIT(4)
+#define   MTK_PHY_TR_READY_SKIP_AFE_WAKEUP	BIT(5)
+
+#define MTK_PHY_LDO_PUMP_EN_PAIRAB		0x502
+#define MTK_PHY_LDO_PUMP_EN_PAIRCD		0x503
+
+#define MTK_PHY_DA_TX_R50_PAIR_A		0x53d
+#define MTK_PHY_DA_TX_R50_PAIR_B		0x53e
+#define MTK_PHY_DA_TX_R50_PAIR_C		0x53f
+#define MTK_PHY_DA_TX_R50_PAIR_D		0x540
+
+/* Registers on MDIO_MMD_VEND2 */
+#define MTK_PHY_LED1_DEFAULT_POLARITIES		BIT(1)
+
+/* LED basic control register, part of the same LED block as the LED0/LED1
+ * control registers above. The air_en8811h driver describes the same
+ * register as AIR_PHY_LED_BCR.
+ */
+#define MTK_PHY_LED_BCR				0x21
+#define   MTK_PHY_LED_BCR_CLK_EN		BIT(3)
+#define   MTK_PHY_LED_BCR_EXT_CTRL		BIT(15)
+
+#define MTK_PHY_RG_BG_RASEL			0x115
+#define   MTK_PHY_RG_BG_RASEL_MASK		GENMASK(2, 0)
+
+/* 'boottrap' register reflecting the configuration of the 4 PHY LEDs */
+#define RG_GPIO_MISC_TPBANK0			0x6f0
+#define   RG_GPIO_MISC_TPBANK0_BOOTMODE		GENMASK(11, 8)
+
+enum CAL_ITEM {
+	REXT,
+	TX_OFFSET,
+	TX_AMP,
+	TX_R50,
+	TX_VCM,
+	RX_OFFSET,
+};
+
+enum {
+	NO_PAIR,
+	PAIR_A,
+	PAIR_B,
+	PAIR_C,
+	PAIR_D,
+};
+
+enum calibration_mode {
+	EFUSE_K,
+	SW_K
+};
+
+enum CAL_MODE {
+	EFUSE_M,
+	SW_M
+};
+
+#endif /* _MTK_GE_SOC_H_ */
-- 
2.55.0


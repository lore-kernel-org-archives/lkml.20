Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E5033F5BC;
	Wed, 14 Oct 2026 19:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792004698; cv=none; b=dpEDQtBSh72swPuAhxrIEA6FmUCnnAQb6jCNqJgpciXBhFjS++tRMA1wGlkniUuDIMpaqjt9Azcg+7P8/dj+LKWdbGmbPSo0u56AmHqyhmYC0qsore3GyJoFGygnM54Ax4jU0jmL+bUPkvR38SWJ2sXZKQmusxXfpEFCJYvR0pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792004698; c=relaxed/simple;
	bh=QCXFkdgdXcqrwyLt7SfjGws01rBozcZ/JRcWEZS8An0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WMCJ0mvP3qfNUUO2i+MOwfpr2viGW8fsCiynaksaxhHZYe22Pciv4MzFoXDaki+Dk8FUIFzAu7wLXu16FHSxBYfGFMXoZOQ/cYDr3gP3gMBHNNwyROoQD1+ipF9kstP0PKGKhCsgc0BL8Spngs7x4B5nLwpeOY4bkwR8CsxLYyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPF2kZsJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPF2kZsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 615C0C2BCC7;
	Wed, 14 Oct 2026 19:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792004697;
	bh=QCXFkdgdXcqrwyLt7SfjGws01rBozcZ/JRcWEZS8An0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=KPF2kZsJPDPzcdVC4ZlNCZuKEJnZ33qEVVrySet81WpcigPd+MUEki5O4YibNfwSA
	 /8Cr21D5xgoYTR+4g4XPWX3wDqDWfcsfdUOvyFJ8r1y3QguxltZ+J9+c2IJD7H8cV0
	 OXg8KCUxPOER+tbFeHwZr2D9kJOiPGa+FcX9DHMt67o+HCCZh2sNlpLkossksmQmrD
	 sWMU1M3jHf3gN1r1x/F46TqzKS1NRi1i+C/NrferPuKTqGNEg6biN9aJkYp19w75JF
	 jOILAu8ziQ37+RlVhvv3CuWeFJkZlpv87mxsCXcg/Umz5Y/mZAgOtzIEV1r4Ucke2z
	 E+cms6ScKr5QA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD5DCC6B2C;
	Wed, 14 Oct 2026 19:04:57 +0000 (UTC)
From: Kirill Repin via B4 Relay <devnull+krepin1001.gmail.com@kernel.org>
Date: Wed, 14 Oct 2026 22:04:51 +0300
Subject: [PATCH] staging: rtl8723bs: remove spaces before tabs in
 hal_com_reg.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-rtl8723bs-space-before-tab-v1-1-fbd73c6a995a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORtYO+nUX5Ed0ppqRLaRVBmM/
 fuqHt/lrWCswgaXZgXlj5hMY4U7NJAeNN4Z5VYNvvXBte6IWl6n3nfR0GZKjJHzpIyFInYUKGS
 mPocz1GBWzrL88uvwt73jk1P5jrBtO548kGh+AAAA
X-Change-ID: 20261014-rtl8723bs-space-before-tab-3a6a6fea7f69
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Kirill Repin <krepin1001@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792004694; l=7571;
 i=krepin1001@gmail.com; s=20261014; h=from:subject:message-id;
 bh=f1u8TicxrNViFLChs9Uz/TB5moNhBb+RK2ep1A6mIRg=;
 b=prG3oiQNTd4L6kN531OeRbxhZYs7sBR2qM77qcsTLQ5xKZcUivt7Ol8d4OTsG4Bn8sJVO90ja
 mqKfLGc/3+LA2mvJNTUh7Zhi9AnycEAowZJBqnDV78YmuR20OcOCPkX
X-Developer-Key: i=krepin1001@gmail.com; a=ed25519;
 pk=rWU8t1Pks/08DGSIExNWZcl3RVuDt09TRmfipRXF7cU=
X-Endpoint-Received: by B4 Relay for krepin1001@gmail.com/20261014 with
 auth_id=1181
X-Original-From: Kirill Repin <krepin1001@gmail.com>
Reply-To: krepin1001@gmail.com

From: Kirill Repin <krepin1001@gmail.com>

Remove spaces placed before tabs in comments to fix checkpatch warnings:

WARNING: please, no space before tabs

No functional change.

Signed-off-by: Kirill Repin <krepin1001@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_com_reg.h | 56 ++++++++++++-------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index 352280ed3..23803d48a 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -7,7 +7,7 @@
 #ifndef __HAL_COMMON_REG_H__
 #define __HAL_COMMON_REG_H__
 
-/* 	0x0000h ~ 0x00FFh	System Configuration */
+/*	0x0000h ~ 0x00FFh	System Configuration */
 #define REG_SYS_FUNC_EN				0x0002
 #define REG_APS_FSMCO					0x0004
 #define REG_SYS_CLKR					0x0008
@@ -32,7 +32,7 @@
 #define REG_SYS_CFG						0x00F0
 #define REG_GPIO_OUTSTS				0x00F4	/*  For RTL8723 only. */
 
-/* 	0x0100h ~ 0x01FFh	MACTOP General Configuration */
+/*	0x0100h ~ 0x01FFh	MACTOP General Configuration */
 #define REG_CR							0x0100
 #define REG_PBP							0x0104
 #define REG_TRXDMA_CTRL				0x010C
@@ -45,18 +45,18 @@
 #define REG_HMETFR						0x01CC
 #define REG_HMEBOX_0					0x01D0
 
-/* 	0x0200h ~ 0x027Fh	TXDMA Configuration */
+/*	0x0200h ~ 0x027Fh	TXDMA Configuration */
 #define REG_RQPN						0x0200
 #define REG_TDECTRL						0x0208
 #define REG_TXDMA_STATUS				0x0210
 #define REG_RQPN_NPQ					0x0214
 #define REG_AUTO_LLT					0x0224
 
-/* 	0x0280h ~ 0x02FFh	RXDMA Configuration */
+/*	0x0280h ~ 0x02FFh	RXDMA Configuration */
 #define REG_RXDMA_AGG_PG_TH			0x0280
 #define REG_RXPKT_NUM					0x0284
 
-/* 	0x0400h ~ 0x047Fh	Protocol Configuration */
+/*	0x0400h ~ 0x047Fh	Protocol Configuration */
 #define REG_TXPKT_EMPTY				0x041A
 #define REG_FWHW_TXQ_CTRL				0x0420
 #define REG_HWSEQ_CTRL					0x0423
@@ -71,7 +71,7 @@
 #define REG_MACID_SLEEP				0x04D4
 #define REG_NQOS_SEQ					0x04DC
 
-/* 	0x0500h ~ 0x05FFh	EDCA Configuration */
+/*	0x0500h ~ 0x05FFh	EDCA Configuration */
 #define REG_EDCA_VO_PARAM				0x0500
 #define REG_EDCA_VI_PARAM				0x0504
 #define REG_EDCA_BE_PARAM				0x0508
@@ -85,14 +85,14 @@
 #define REG_RD_CTRL						0x0524
 
 /*  Format for offset 540h-542h: */
-/* 	[3:0]:   TBTT prohibit setup in unit of 32us. The time for HW getting beacon content before TBTT. */
-/* 	[7:4]:   Reserved. */
-/* 	[19:8]:  TBTT prohibit hold in unit of 32us. The time for HW holding to send the beacon packet. */
-/* 	[23:20]: Reserved */
+/*	[3:0]:   TBTT prohibit setup in unit of 32us. The time for HW getting beacon content before TBTT. */
+/*	[7:4]:   Reserved. */
+/*	[19:8]:  TBTT prohibit hold in unit of 32us. The time for HW holding to send the beacon packet. */
+/*	[23:20]: Reserved */
 /*  Description: */
-/* 	              | */
+/*	              | */
 /*      |<--Setup--|--Hold------------>| */
-/* 	--------------|---------------------- */
+/*	--------------|---------------------- */
 /*                 | */
 /*                TBTT */
 /*  Note: We cannot update beacon content to HW or send any AC packets during the time between Setup and Hold. */
@@ -111,7 +111,7 @@
 #define REG_TSFTR						0x0560
 #define REG_ACMHWCTRL					0x05C0
 
-/* 	0x0600h ~ 0x07FFh	WMAC Configuration */
+/*	0x0600h ~ 0x07FFh	WMAC Configuration */
 #define REG_BWOPMODE					0x0603
 #define REG_TCR							0x0604
 #define REG_RCR							0x0608
@@ -129,11 +129,11 @@
 #define REG_ACKTO						0x0640
 
 /*  Note: */
-/* 	The NAV upper value is very important to WiFi 11n 5.2.3 NAV test. The default value is */
-/* 	always too small, but the WiFi TestPlan test by 25, 000 microseconds of NAV through sending */
-/* 	CTS in the air. We must update this value greater than 25, 000 microseconds to pass the item. */
-/* 	The offset of NAV_UPPER in 8192C Spec is incorrect, and the offset should be 0x0652. Commented */
-/* 	by SD1 Scott. */
+/*	The NAV upper value is very important to WiFi 11n 5.2.3 NAV test. The default value is */
+/*	always too small, but the WiFi TestPlan test by 25, 000 microseconds of NAV through sending */
+/*	CTS in the air. We must update this value greater than 25, 000 microseconds to pass the item. */
+/*	The offset of NAV_UPPER in 8192C Spec is incorrect, and the offset should be 0x0652. Commented */
+/*	by SD1 Scott. */
 /*  By Bruce, 2011-07-18. */
 #define REG_NAV_UPPER					0x0652	/*  unit of 128 */
 
@@ -152,7 +152,7 @@
 #define REG_RXFLTMAP2					0x06A4
 #define REG_BCN_PSR_RPT				0x06A8
 
-/* 	Redefine 8192C register definition for compatibility */
+/*	Redefine 8192C register definition for compatibility */
 #define EFUSE_CTRL				REG_EFUSE_CTRL		/*  E-Fuse Control. */
 #define EFUSE_TEST				REG_EFUSE_TEST		/*  E-Fuse Test. */
 #define MSR						(REG_CR + 2)		/*  Media Status register */
@@ -237,7 +237,7 @@
 #define RCR_APM					BIT(1)		/*  Accept physical match packet */
 
 
-/* 	0x0000h ~ 0x00FFh	System Configuration */
+/*	0x0000h ~ 0x00FFh	System Configuration */
 
 /* 2 SYS_FUNC_EN */
 #define FEN_BBRSTB				BIT(0)
@@ -294,7 +294,7 @@
 /* 2 REG_GPIO_OUTSTS (For RTL8723 only) */
 #define RF_RL_ID					(BIT(31)|BIT(30)|BIT(29)|BIT(28))
 
-/* 	0x0100h ~ 0x01FFh	MACTOP General Configuration */
+/*	0x0100h ~ 0x01FFh	MACTOP General Configuration */
 
 /* 2 Function Enable Registers */
 /* 2 CR */
@@ -337,7 +337,7 @@
 #define QUEUE_NORMAL			2
 #define QUEUE_HIGH				3
 
-/* 	0x0200h ~ 0x027Fh	TXDMA Configuration */
+/*	0x0200h ~ 0x027Fh	TXDMA Configuration */
 
 /* 2 RQPN */
 #define _HPQ(x)					((x) & 0xFF)
@@ -350,7 +350,7 @@
 /* 2 AUTO_LLT */
 #define BIT_AUTO_INIT_LLT BIT(16)
 
-/* 	0x0280h ~ 0x028Bh	RX DMA Configuration */
+/*	0x0280h ~ 0x028Bh	RX DMA Configuration */
 
 /* 2 REG_RXDMA_CONTROL, 0x0286h */
 /*  Write only. When this bit is set, RXDMA will decrease RX PKT counter by one. Before */
@@ -368,7 +368,7 @@
 #define	RXDMA_IDLE				BIT(17)
 #define	RW_RELEASE_EN			BIT(18)
 
-/* 	0x0400h ~ 0x047Fh	Protocol Configuration */
+/*	0x0400h ~ 0x047Fh	Protocol Configuration */
 
 /* 2 FWHW_TXQ_CTRL */
 #define EN_AMPDU_RTY_NEW			BIT(7)
@@ -382,7 +382,7 @@
 #define	RETRY_LIMIT_SHORT_SHIFT			8
 #define	RETRY_LIMIT_LONG_SHIFT			0
 
-/* 	0x0500h ~ 0x05FFh	EDCA Configuration */
+/*	0x0500h ~ 0x05FFh	EDCA Configuration */
 
 #define _LRL(x)					((x) & 0x3F)
 #define _SRL(x)					(((x) & 0x3F) << 8)
@@ -402,7 +402,7 @@
 #define AcmHw_ViqEn				BIT(2)
 #define AcmHw_VoqEn			BIT(3)
 
-/* 	0x0600h ~ 0x07FFh	WMAC Configuration */
+/*	0x0600h ~ 0x07FFh	WMAC Configuration */
 
 /* 2 TCR */
 #define TSFRST					BIT(0)
@@ -419,7 +419,7 @@
 #define SCR_RXBCUSEDK			BIT(7)			/*  Force Rx Broadcast packets Use Default Key */
 #define SCR_CHK_KEYID			BIT(8)
 
-/* 	SDIO Bus Specification */
+/*	SDIO Bus Specification */
 
 /*  I/O bus domain address mapping */
 #define SDIO_LOCAL_BASE		0x10250000
@@ -496,7 +496,7 @@
 /*  SDIO Tx FIFO related */
 #define SDIO_TX_FREE_PG_QUEUE			4	/*  The number of Tx FIFO free page */
 
-/* 	0xFE00h ~ 0xFE55h	USB Configuration */
+/*	0xFE00h ~ 0xFE55h	USB Configuration */
 
 /* 2REG_C2HEVT_CLEAR */
 #define C2H_EVT_HOST_CLOSE		0x00	/*  Set by driver and notify FW that the driver has read the C2H command message */

---
base-commit: cccafd0f36d8c30d4dcbdce26971dab15e8ab25b
change-id: 20261014-rtl8723bs-space-before-tab-3a6a6fea7f69

Best regards,
--  
Kirill Repin <krepin1001@gmail.com>



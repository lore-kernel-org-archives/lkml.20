Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022105.outbound.protection.outlook.com [52.101.126.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3378746D2B3;
	Fri,  9 Oct 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537969; cv=fail; b=sbypfYgZko1QvSM5Xa240PCxBCYLJcAj2bKsIb2ReGUKf4ljfJAD+glm8ZnGExWnZ0aS4Z6mVBAdoT7ZU66Z45j43PKSCwbJyl4NxTj4fNg7p3iDqTa8CTap2cGOOgCESJm2c3/4rBP+gzp8pMp6Rof0h9uoIgBoDDAY0vC9Fk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537969; c=relaxed/simple;
	bh=/VMAuTQ9XKFIHNg0W33Us5pzXzhSzNsr1w6nDhVg6fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QUu4eLEw7AxvIoj/89EsBvQG1xSyHJj6awL5+wgJopv17r5GlfQeOF6879XtilOE8Hpj+FoqAuEuWgMhT+VuqsnaXbMDyMlzQft/9Qv7/EAv7lpUI/iaeDIFxO9cf3gTiG7q7bZfJMZFowJnvIJAmO+OPH+LKN4f7dJZ36yVKlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dcydTaik/GGw1bkklezA6L+nO0Hh4Ygt1lu5h9jKNvAD1RL9e3g432QN36+TO/uLaKZbN84g3MNLJoGIuyKTRHDuE7TM0MdwyDfx57qdUfXaJW0R+RUEpNsCYhU2BR5bF3P3zC+vxD/vALG7SRvGHWJysUgyAqP+fNWt4p5tyKxiMM5IE2Vet5edoZZcvfz6c6vNslWbxj1A5FcoXOzVhyMMqPZ1V0NgZXzjfbtcC7Z09byB7BPQpHaZPzoLhAiTY4Q5vyDTNVo4hdbq+IjrihpTaw91NEELrCxrSISLwYjKu7bYrqouTkeir0UH6G6SKrcuSLxyemhfN/yNyYYq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WJ4U2teP3sAKFSY/V+/hyL8rDd0z2u9xqXjRWP7WOs=;
 b=VnTNw+g28/OpaxUXmrQFCavKHvig+RwvqkW/9W0VGlBohqJU2HOAYZUTf+Q2VE8z3muUnZGK3KxS23yLyaMZHpjf+aFVO62gEheVc6vFi0KSGGdcvuUg9i++HhDiXy2yxZpIqDudGKseqyOOT6NkXRenBk6RW8yQ2cTBG48j84bITJ+mFocCe4tqcnY/IQxcR/upAxm4Diah7yvJ4y4bAMyZw7cqtLWdBie0gUHwOK4xwZZ5lfFdMcd5ftstFs6YmGVdyh8qZaQScusraLQ2M2UWdtGbdMgHHJ5lSYDovtoZIa6zeqguJ6UlDrvqyYeJxFUt6hee9SKtqWLDXeeWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::15) by PUZPR06MB6008.apcprd06.prod.outlook.com
 (2603:1096:301:116::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 09:26:01 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:300:2d:cafe::66) by PS2PR01CA0003.outlook.office365.com
 (2603:1096:300:2d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 09:26:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 09:26:01 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 29BBE40920F6;
	Fri,  9 Oct 2026 17:26:00 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v3 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
Date: Fri,  9 Oct 2026 17:25:52 +0800
Message-ID: <20261009092552.2377960-5-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|PUZPR06MB6008:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4eb287b4-b172-4f47-c0ea-08df25e755bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|23010399003|6133799003|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	i/5i+EJN0UfYpp0CJdqgx7kWYvV9ZUjLEMktyFJXzG/QxN/68xhTVLTbwSJNzkd2mtkPZymlWNuy3dTndfRCaJ128YdTQ4OB9WJw8b81Rwre60yLLXAE4LEEP8lKMpRIGZdMZLylMvVRsrqHnivonlqqFBC8DzihtExM27WluF3i0uQNn24aNsX2h/3V4/FaQsCj+gIUfctrLY4ojf9emxEeuz3GKDXP/qI28yi5NpnavUKuCPny8p6wfOOMIR7rG0ksF+JyRZbHvR8YsOZ9bwPFHSXD9AKrpYbNER2i5o9sEaUIDv+RbttsidnjpKSLFMyFQE/ftlRwfn21UhHcwPy3hAxVvCcw0QydU+Bq2lBzcAcSpgyX1Q120e0TWJNnjRBcZAC1mRNfvYAIH0DjFR8YqIgqvTdniCf6e14G0W8ctNaxQbpCIMF4c/Ri69XyZ7FzbRwV9QL3s58DyvTrwGxJYB0kaypfwrhWze8XLF3WKB/CKLpr2Y43VGCZU477GCCH5n4hAn3CyDFpNbNR63zXOgNjWjH66zS1RPmrceb5BB/L9jcP5tO4iPoGuIKTWqXbno0eI0IO/QViPDvjWfwQy3iU7Za1cBwP2/r/RZNatEon5PqfKZ4K1Hzdk16KlFZZES64hZcGVx5ILiLjbQBkJkQ5TeYOjs2BBWwUCkVustcCflZL7ZziUuoiJ9590B5PZGNrtLBMkOx5k2llWA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RmHVG9pn68Y69rrfczzJQeheEme0G0B4pCDLclvfYnoZcOxOTbr/Y4BPmhQoKv+leVwhQaBrv54hC4dYb52ZH57vjrqozmrF5Fys4lXUBg910v9Z7OV4dI/2kSvjO1WtkXgfOUl0gvs+XAs7+pof+87zIQ1aeZEk9coWOvl0HNb+WxM/zCjo5tXMgBfh6JcACVdGv8pVaoJir2apa4JNE1QKrbK4uNLTk7p5siJLH782G1Gl/36E9P/gkfsQk29VIsU8DpYOC26ClwKuqwiMB+Lv5lU5RMh0NpOyh8yS187tc3UFaQeQEMQZv0mNiCSiSlstaJuaT3KrGVnLrMjyehubl0AFqjWxqaKwWC9Viva62NTw7ouZ6LJ0h2DeWwZjuX2jMisse/J4qeftLKPykxEO8IYp1fyCBcOSaXXxMelSVCHYv2ZOQsOGAPGpD0XJ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 09:26:01.2900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb287b4-b172-4f47-c0ea-08df25e755bc
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6008

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add support for the Cadence I2S-MC multi-channel controller found in
the CIX SKY1 audio subsystem.

The controller moves up to 16 channels through a configurable set of
its 8 data pins, each pin carrying two slots. Wired-out pins may sit
at any pin index and are described by cix,pin-out-num, cix,pin-rx-mask
and cix,pin-tx-mask. The driver exposes a transmit DAI and a receive
DAI which can act as clock provider or consumer independently, and
streams with fewer channels than the wired pins narrow the enabled
pin mask at runtime.

The driver registers the dmaengine PCM helper, selects the audio
reference clock parent for the 8 kHz or 11.025 kHz sample rate family
and keeps the minimum functional-clock to bit-clock ratio required
for safe clock domain crossing, with an extra margin cycle when the
bit clock is sourced externally. Runtime and system suspend/resume
restore the registers through the regcache.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
---
 sound/soc/cdns/Kconfig       |   10 +
 sound/soc/cdns/Makefile      |    3 +
 sound/soc/cdns/cdns-i2s-mc.c | 1127 ++++++++++++++++++++++++++++++++++
 3 files changed, 1140 insertions(+)
 create mode 100644 sound/soc/cdns/cdns-i2s-mc.c

diff --git a/sound/soc/cdns/Kconfig b/sound/soc/cdns/Kconfig
index 631e2e0764cb..aa5d35992a81 100644
--- a/sound/soc/cdns/Kconfig
+++ b/sound/soc/cdns/Kconfig
@@ -9,3 +9,13 @@ config SND_SOC_CDNS_I2S_SC
 	  controller found in the CIX SKY1 audio subsystem. It provides
 	  full-duplex stereo playback and capture in standard I2S and
 	  TDM modes with up to 16 slots.
+
+config SND_SOC_CDNS_I2S_MC
+	tristate "Cadence I2S-MC controller support"
+	depends on ARCH_CIX || COMPILE_TEST
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  Say Y or M if you want to add support for the Cadence I2S-MC
+	  multi-channel controller found in the CIX SKY1 audio subsystem.
+	  It provides multi-channel playback and capture through a
+	  configurable number of I2S data pins.
diff --git a/sound/soc/cdns/Makefile b/sound/soc/cdns/Makefile
index 6abfeef29e43..e440bb2bb5ca 100644
--- a/sound/soc/cdns/Makefile
+++ b/sound/soc/cdns/Makefile
@@ -2,3 +2,6 @@
 
 snd-soc-cdns-i2s-sc-y := cdns-i2s-sc.o
 obj-$(CONFIG_SND_SOC_CDNS_I2S_SC) += snd-soc-cdns-i2s-sc.o
+
+snd-soc-cdns-i2s-mc-y := cdns-i2s-mc.o
+obj-$(CONFIG_SND_SOC_CDNS_I2S_MC) += snd-soc-cdns-i2s-mc.o
diff --git a/sound/soc/cdns/cdns-i2s-mc.c b/sound/soc/cdns/cdns-i2s-mc.c
new file mode 100644
index 000000000000..e9a0880a0616
--- /dev/null
+++ b/sound/soc/cdns/cdns-i2s-mc.c
@@ -0,0 +1,1127 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright 2026 Cix Technology Group Co., Ltd.
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+/* Special Function Registers */
+/* Control Register */
+#define I2S_CTRL				0x00
+#define I2S_CTRL_RSYNC_LOOP_BACK		BIT(28)
+#define I2S_CTRL_TSYNC_LOOP_BACK		BIT(27)
+#define I2S_CTRL_RSYNC_RST			BIT(26)
+#define I2S_CTRL_TSYNC_RST			BIT(25)
+#define I2S_CTRL_RFIFO_RST			BIT(24)
+#define I2S_CTRL_TFIFO_RST			BIT(23)
+#define I2S_CTRL_R_MS				BIT(22)
+#define I2S_CTRL_T_MS				BIT(21)
+#define I2S_CTRL_SFR_RST			BIT(20)
+#define I2S_CTRL_LOOP_BACK_6_7			BIT(19)
+#define I2S_CTRL_LOOP_BACK_4_5			BIT(18)
+#define I2S_CTRL_LOOP_BACK_2_3			BIT(17)
+#define I2S_CTRL_LOOP_BACK_0_1			BIT(16)
+#define I2S_CTRL_TR_CFG				GENMASK(15, 8)
+#define I2S_CTRL_I2S_EN				GENMASK(7, 0)
+
+/* Interrupt Status Register */
+#define I2S_INTR_STAT				0x04
+#define I2S_INTR_STAT_RFIFO_AFULL		BIT(15)
+#define I2S_INTR_STAT_RFIFO_FULL		BIT(14)
+#define I2S_INTR_STAT_RFIFO_AEMPTY		BIT(13)
+#define I2S_INTR_STAT_RFIFO_EMPTY		BIT(12)
+#define I2S_INTR_STAT_TFIFO_AFULL		BIT(11)
+#define I2S_INTR_STAT_TFIFO_FULL		BIT(10)
+#define I2S_INTR_STAT_TFIFO_AEMPTY		BIT(9)
+#define I2S_INTR_STAT_TFIFO_EMPTY		BIT(8)
+#define I2S_INTR_STAT_OVERR_CODE		GENMASK(7, 5)
+#define I2S_INTR_STAT_RDATA_OVERR		BIT(4)
+#define I2S_INTR_STAT_UNDERR_CODE		GENMASK(3, 1)
+#define I2S_INTR_STAT_TDATA_UNDERR		BIT(0)
+
+/* Sample Rate And Resolution Control Register */
+#define I2S_SRR					0x08
+#define I2S_SRR_RRESOLUTION			GENMASK(31, 27)
+#define I2S_SRR_RSAMPLE_RATE			GENMASK(26, 16)
+#define I2S_SRR_TRESOLUTION			GENMASK(15, 11)
+#define I2S_SRR_TSAMPLE_RATE			GENMASK(10, 0)
+
+/* Clock Strobes And Interrupt Masks Control Register */
+#define I2S_CID_CTRL				0x0c
+#define I2S_CID_CTRL_RFIFO_AFULL_MASK		BIT(31)
+#define I2S_CID_CTRL_RFIFO_FULL_MASK		BIT(30)
+#define I2S_CID_CTRL_RFIFO_AEMPTY_MASK		BIT(29)
+#define I2S_CID_CTRL_RFIFO_EMPTY_MASK		BIT(28)
+#define I2S_CID_CTRL_TFIFO_AFULL_MASK		BIT(27)
+#define I2S_CID_CTRL_TFIFO_FULL_MASK		BIT(26)
+#define I2S_CID_CTRL_TFIFO_AEMPTY_MASK		BIT(25)
+#define I2S_CID_CTRL_TFIFO_EMPTY_MASK		BIT(24)
+#define I2S_CID_CTRL_I2S_MASK			GENMASK(23, 16)
+#define I2S_CID_CTRL_INTREQ_MASK		BIT(15)
+#define I2S_CID_CTRL_STROBE_RS			BIT(9)
+#define I2S_CID_CTRL_STROBE_TS			BIT(8)
+#define I2S_CID_CTRL_I2S_STROBE			GENMASK(7, 0)
+
+/* Transmit FIFO Level Status Register, read only */
+#define I2S_TFIFO_STAT				0x10
+
+/* Receive FIFO Level Status Register, read only */
+#define I2S_RFIFO_STAT				0x14
+
+/* Transmit FIFO Thresholds Control Register */
+#define I2S_TFIFO_CTRL				0x18
+#define I2S_TFIFO_CTRL_TAFULL_THRESHOLD		GENMASK(31, 16)
+#define I2S_TFIFO_CTRL_TAEMPTY_THRESHOLD	GENMASK(15, 0)
+
+/* Receive FIFO Thresholds Control Register */
+#define I2S_RFIFO_CTRL				0x1c
+#define I2S_RFIFO_CTRL_RAFULL_THRESHOLD		GENMASK(31, 16)
+#define I2S_RFIFO_CTRL_RAEMPTY_THRESHOLD	GENMASK(15, 0)
+
+/* Device Configuration Register */
+#define I2S_DEV_CONF				0x20
+#define I2S_DEV_CONF_REC_WS_DSP_MODE		BIT(11)
+#define I2S_DEV_CONF_REC_DATA_WS_DEL		BIT(10)
+#define I2S_DEV_CONF_REC_I2S_ALIGN_LR		BIT(9)
+#define I2S_DEV_CONF_REC_APB_ALIGN_LR		BIT(8)
+#define I2S_DEV_CONF_REC_WS_POLAR		BIT(7)
+#define I2S_DEV_CONF_REC_SCK_POLAR		BIT(6)
+#define I2S_DEV_CONF_TRAN_WS_DSP_MODE		BIT(5)
+#define I2S_DEV_CONF_TRAN_DATA_WS_DEL		BIT(4)
+#define I2S_DEV_CONF_TRAN_I2S_ALIGN_LR		BIT(3)
+#define I2S_DEV_CONF_TRAN_APB_ALIGN_LR		BIT(2)
+#define I2S_DEV_CONF_TRAN_WS_POLAR		BIT(1)
+#define I2S_DEV_CONF_TRAN_SCK_POLAR		BIT(0)
+
+/* Status Register, read only */
+#define I2S_POLL_STAT				0x24
+#define I2S_POLL_STAT_RX_OVERRUN		BIT(6)
+#define I2S_POLL_STAT_RX_AFULL			BIT(5)
+#define I2S_POLL_STAT_RX_FULL			BIT(4)
+#define I2S_POLL_STAT_TX_UNDERRUN		BIT(2)
+#define I2S_POLL_STAT_TX_AEMPTY			BIT(1)
+#define I2S_POLL_STAT_TX_EMPTY			BIT(0)
+
+/* Transmit And Recevie FIFOs Address */
+#define I2S_FIFO_ADDRESS			0x3c
+
+/*
+ * The I2S functional clock must run at a minimum ratio above the audio
+ * bit clock to safely cross clock domains; a bit clock sourced
+ * externally (slave mode) needs one more cycle of margin. See the
+ * controller reference manual, section 3.3 "Clocks and Clock Domain
+ * Crossing".
+ */
+#define I2S_CLK_RATIO_MIN_MASTER		6
+#define I2S_CLK_RATIO_MIN_SLAVE			7
+
+#define DRV_NAME	"cdns-i2s-mc"
+
+enum {
+	AUDIO_CLK0,
+	AUDIO_CLK2,
+	AUDIO_CLK_NUM,
+};
+
+static const char *cdns_i2s_mc_clk_pll_names[AUDIO_CLK_NUM] = {
+	[AUDIO_CLK0] = "audio-clk0",
+	[AUDIO_CLK2] = "audio-clk2",
+};
+
+enum {
+	I2S_MC_AIF1,
+	I2S_MC_AIF2,
+};
+
+struct cdns_i2s_mc_devtype_data {
+	u32 data_width;
+	u32 rfifo_aempty_threshold;
+	u32 rfifo_afull_threshold;
+	u32 tfifo_aempty_threshold;
+	u32 tfifo_afull_threshold;
+};
+
+struct cdns_i2s_mc_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct reset_control *i2s_rst;
+
+	int irq;
+
+	struct clk *clk_hst;
+	struct clk *clk_i2s;
+	struct clk *clks[AUDIO_CLK_NUM];
+
+	struct snd_dmaengine_dai_dma_data capture_dma_data;
+	struct snd_dmaengine_dai_dma_data playback_dma_data;
+
+	const struct cdns_i2s_mc_devtype_data *devtype_data;
+
+	u8 pin_out_num;
+	u8 pin_rx_mask;
+	u8 pin_rx_mask_adjust;
+	u8 pin_tx_mask;
+	u8 pin_tx_mask_adjust;
+};
+
+static int cdns_i2s_mc_clks_enable(struct cdns_i2s_mc_priv *i2s_mc_priv)
+{
+	int ret;
+
+	ret = clk_prepare_enable(i2s_mc_priv->clk_hst);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(i2s_mc_priv->clk_i2s);
+	if (ret)
+		clk_disable_unprepare(i2s_mc_priv->clk_hst);
+
+	return ret;
+}
+
+static void cdns_i2s_mc_clks_disable(struct cdns_i2s_mc_priv *i2s_mc_priv)
+{
+	clk_disable_unprepare(i2s_mc_priv->clk_i2s);
+	clk_disable_unprepare(i2s_mc_priv->clk_hst);
+}
+
+static void cdns_i2s_mc_adjust_pin_config(u8 *pin_mask, u32 slots)
+{
+	u8 mask = 0, num = 0;
+	int i;
+
+	/*
+	 * Wired-out pins may sit at any index among the 8 data pins, so
+	 * scan the whole mask and keep the lowest pins until enough slots
+	 * are covered.
+	 */
+	for (i = 0; i < BITS_PER_BYTE; i++) {
+		if (*pin_mask & (0x1 << i)) {
+			mask |= (0x1 << i);
+			if (++num == slots / 2) {
+				*pin_mask = mask;
+				break;
+			}
+		}
+	}
+}
+
+static void cdns_i2s_mc_rxtx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on,
+				    u8 pin_mask, u32 strobe, u32 sync_rst)
+{
+	u32 irq_mask = 0, clk_mask = 0, i2s_mask = 0;
+
+	irq_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_MASK, pin_mask);
+
+	clk_mask |= FIELD_PREP(I2S_CID_CTRL_I2S_STROBE, pin_mask) | strobe;
+
+	i2s_mask |= FIELD_PREP(I2S_CTRL_I2S_EN, pin_mask);
+
+	if (on) {
+		/* Data underrun/overrun interrupt unmask */
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, irq_mask);
+
+		/* Data pins clock enable */
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, 0);
+
+		/*
+		 * Transmitter or receiver enable
+		 * Synchronizing unit out of reset
+		 */
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
+				   i2s_mask | sync_rst,
+				   i2s_mask | sync_rst);
+	} else {
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
+				   i2s_mask | sync_rst, 0);
+
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, clk_mask, clk_mask);
+
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL, irq_mask, 0);
+	}
+}
+
+static void cdns_i2s_mc_tx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on)
+{
+	cdns_i2s_mc_rxtx_config(i2s_mc_priv, on, i2s_mc_priv->pin_tx_mask_adjust,
+				I2S_CID_CTRL_STROBE_TS, I2S_CTRL_TSYNC_RST);
+}
+
+static void cdns_i2s_mc_rx_config(struct cdns_i2s_mc_priv *i2s_mc_priv, bool on)
+{
+	cdns_i2s_mc_rxtx_config(i2s_mc_priv, on, i2s_mc_priv->pin_rx_mask_adjust,
+				I2S_CID_CTRL_STROBE_RS, I2S_CTRL_RSYNC_RST);
+}
+
+static irqreturn_t cdns_i2s_mc_isr(int irq, void *devid)
+{
+	struct cdns_i2s_mc_priv *i2s_mc_priv = (struct cdns_i2s_mc_priv *)devid;
+	struct device *dev = i2s_mc_priv->dev;
+	u32 stat;
+
+	if (regmap_read(i2s_mc_priv->regmap, I2S_INTR_STAT, &stat))
+		return IRQ_NONE;
+
+	stat &= I2S_INTR_STAT_TDATA_UNDERR | I2S_INTR_STAT_RDATA_OVERR;
+	if (!stat)
+		return IRQ_NONE;
+
+	/* Clear the status */
+	regmap_update_bits(i2s_mc_priv->regmap, I2S_INTR_STAT, stat, 0);
+
+	/* Transmitter status */
+	if (stat & I2S_INTR_STAT_TDATA_UNDERR)
+		dev_dbg(dev, "isr: tx data underrun\n");
+
+	/* Receiver status */
+	if (stat & I2S_INTR_STAT_RDATA_OVERR)
+		dev_dbg(dev, "isr: rx data overrun\n");
+
+	return IRQ_HANDLED;
+}
+
+static int cdns_i2s_mc_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
+{
+	struct cdns_i2s_mc_priv *i2s_mc_priv = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = i2s_mc_priv->dev;
+	u32 ctrl = 0, dev_conf = 0;
+
+	dev_dbg(dev, "fmt = 0x%x\n", fmt);
+
+	/*
+	 * Configure the data pin channel directions, shared by both DAIs:
+	 * a set TR_CFG bit marks the pin as a transmitter channel, a clear
+	 * one as a receiver channel. Program the combined value so the
+	 * write is idempotent and independent of the set_fmt call order.
+	 */
+	ctrl |= FIELD_PREP(I2S_CTRL_TR_CFG,
+			   i2s_mc_priv->pin_tx_mask |
+			   (u8)~i2s_mc_priv->pin_rx_mask);
+
+	if (cpu_dai->id == I2S_MC_AIF1) {
+		/* DAI hardware signal polarity */
+		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+		case SND_SOC_DAIFMT_NB_NF:
+			/* both normal clocks */
+			dev_conf |= I2S_DEV_CONF_TRAN_SCK_POLAR;
+			dev_conf &= ~I2S_DEV_CONF_TRAN_WS_POLAR;
+			break;
+		case SND_SOC_DAIFMT_NB_IF:
+			/* invert frame clock */
+			dev_conf |= I2S_DEV_CONF_TRAN_SCK_POLAR;
+			dev_conf |= I2S_DEV_CONF_TRAN_WS_POLAR;
+			break;
+		case SND_SOC_DAIFMT_IB_NF:
+			/* invert bit clock */
+			dev_conf &= ~I2S_DEV_CONF_TRAN_SCK_POLAR;
+			dev_conf &= ~I2S_DEV_CONF_TRAN_WS_POLAR;
+			break;
+		case SND_SOC_DAIFMT_IB_IF:
+			/* invert both clocks */
+			dev_conf &= ~I2S_DEV_CONF_TRAN_SCK_POLAR;
+			dev_conf |= I2S_DEV_CONF_TRAN_WS_POLAR;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		/* DAI hardware audio formats */
+		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+		case SND_SOC_DAIFMT_I2S:
+			dev_conf |= I2S_DEV_CONF_TRAN_I2S_ALIGN_LR;
+			dev_conf &= ~(I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
+				      I2S_DEV_CONF_TRAN_DATA_WS_DEL |
+				      I2S_DEV_CONF_TRAN_WS_DSP_MODE);
+			break;
+		case SND_SOC_DAIFMT_RIGHT_J:
+			dev_conf |= I2S_DEV_CONF_TRAN_DATA_WS_DEL;
+			dev_conf &= ~(I2S_DEV_CONF_TRAN_I2S_ALIGN_LR |
+				      I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
+				      I2S_DEV_CONF_TRAN_WS_DSP_MODE);
+			break;
+		case SND_SOC_DAIFMT_LEFT_J:
+			dev_conf |= I2S_DEV_CONF_TRAN_I2S_ALIGN_LR | I2S_DEV_CONF_TRAN_DATA_WS_DEL;
+			dev_conf &= ~(I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
+				      I2S_DEV_CONF_TRAN_WS_DSP_MODE);
+			break;
+		case SND_SOC_DAIFMT_DSP_A:
+			dev_conf |= I2S_DEV_CONF_TRAN_I2S_ALIGN_LR | I2S_DEV_CONF_TRAN_DATA_WS_DEL |
+				    I2S_DEV_CONF_TRAN_WS_DSP_MODE;
+			dev_conf &= ~I2S_DEV_CONF_TRAN_APB_ALIGN_LR;
+			break;
+		case SND_SOC_DAIFMT_DSP_B:
+			dev_conf |= I2S_DEV_CONF_TRAN_I2S_ALIGN_LR | I2S_DEV_CONF_TRAN_WS_DSP_MODE;
+			dev_conf &= ~(I2S_DEV_CONF_TRAN_APB_ALIGN_LR |
+				      I2S_DEV_CONF_TRAN_DATA_WS_DEL);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		/* DAI hardware clock masters */
+		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+		case SND_SOC_DAIFMT_CBC_CFC:
+			ctrl &= ~I2S_CTRL_T_MS;
+			break;
+		case SND_SOC_DAIFMT_CBP_CFP:
+			ctrl |= I2S_CTRL_T_MS;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_DEV_CONF,
+				   I2S_DEV_CONF_TRAN_SCK_POLAR | I2S_DEV_CONF_TRAN_WS_POLAR |
+				   I2S_DEV_CONF_TRAN_APB_ALIGN_LR | I2S_DEV_CONF_TRAN_I2S_ALIGN_LR |
+				   I2S_DEV_CONF_TRAN_DATA_WS_DEL |
+				   I2S_DEV_CONF_TRAN_WS_DSP_MODE, dev_conf);
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
+				   I2S_CTRL_T_MS | I2S_CTRL_TR_CFG, ctrl);
+	} else if (cpu_dai->id == I2S_MC_AIF2) {
+		/* DAI hardware signal polarity */
+		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+		case SND_SOC_DAIFMT_NB_NF:
+			/* both normal clocks */
+			dev_conf |= I2S_DEV_CONF_REC_SCK_POLAR;
+			dev_conf &= ~I2S_DEV_CONF_REC_WS_POLAR;
+			break;
+		case SND_SOC_DAIFMT_NB_IF:
+			/* invert frame clock */
+			dev_conf |= I2S_DEV_CONF_REC_SCK_POLAR;
+			dev_conf |= I2S_DEV_CONF_REC_WS_POLAR;
+			break;
+		case SND_SOC_DAIFMT_IB_NF:
+			/* invert bit clock */
+			dev_conf &= ~I2S_DEV_CONF_REC_SCK_POLAR;
+			dev_conf &= ~I2S_DEV_CONF_REC_WS_POLAR;
+			break;
+		case SND_SOC_DAIFMT_IB_IF:
+			/* invert both clocks */
+			dev_conf &= ~I2S_DEV_CONF_REC_SCK_POLAR;
+			dev_conf |= I2S_DEV_CONF_REC_WS_POLAR;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		/* DAI hardware audio formats */
+		switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+		case SND_SOC_DAIFMT_I2S:
+			dev_conf |= I2S_DEV_CONF_REC_I2S_ALIGN_LR;
+			dev_conf &= ~(I2S_DEV_CONF_REC_APB_ALIGN_LR | I2S_DEV_CONF_REC_DATA_WS_DEL |
+				      I2S_DEV_CONF_REC_WS_DSP_MODE);
+			break;
+		case SND_SOC_DAIFMT_RIGHT_J:
+			dev_conf |= I2S_DEV_CONF_REC_DATA_WS_DEL;
+			dev_conf &= ~(I2S_DEV_CONF_REC_I2S_ALIGN_LR |
+				      I2S_DEV_CONF_REC_APB_ALIGN_LR |
+				      I2S_DEV_CONF_REC_WS_DSP_MODE);
+			break;
+		case SND_SOC_DAIFMT_LEFT_J:
+			dev_conf |= I2S_DEV_CONF_REC_I2S_ALIGN_LR | I2S_DEV_CONF_REC_DATA_WS_DEL;
+			dev_conf &= ~(I2S_DEV_CONF_REC_APB_ALIGN_LR | I2S_DEV_CONF_REC_WS_DSP_MODE);
+			break;
+		case SND_SOC_DAIFMT_DSP_A:
+			dev_conf |= I2S_DEV_CONF_REC_I2S_ALIGN_LR | I2S_DEV_CONF_REC_DATA_WS_DEL |
+				    I2S_DEV_CONF_REC_WS_DSP_MODE;
+			dev_conf &= ~I2S_DEV_CONF_REC_APB_ALIGN_LR;
+			break;
+		case SND_SOC_DAIFMT_DSP_B:
+			dev_conf |= I2S_DEV_CONF_REC_I2S_ALIGN_LR | I2S_DEV_CONF_REC_WS_DSP_MODE;
+			dev_conf &= ~(I2S_DEV_CONF_REC_APB_ALIGN_LR | I2S_DEV_CONF_REC_DATA_WS_DEL);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		/* DAI hardware clock masters */
+		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+		case SND_SOC_DAIFMT_CBC_CFC:
+			ctrl &= ~I2S_CTRL_R_MS;
+			break;
+		case SND_SOC_DAIFMT_CBP_CFP:
+			ctrl |= I2S_CTRL_R_MS;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_DEV_CONF,
+				   I2S_DEV_CONF_REC_SCK_POLAR | I2S_DEV_CONF_REC_WS_POLAR |
+				   I2S_DEV_CONF_REC_APB_ALIGN_LR | I2S_DEV_CONF_REC_I2S_ALIGN_LR |
+				   I2S_DEV_CONF_REC_DATA_WS_DEL |
+				   I2S_DEV_CONF_REC_WS_DSP_MODE, dev_conf);
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
+				   I2S_CTRL_R_MS | I2S_CTRL_TR_CFG, ctrl);
+	} else {
+		dev_err(i2s_mc_priv->dev, "Invalid dai id\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cdns_i2s_mc_prepare(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *cpu_dai)
+{
+	struct cdns_i2s_mc_priv *i2s_mc_priv = snd_soc_dai_get_drvdata(cpu_dai);
+	u32 ctrl = 0, fifo = 0;
+
+	/*
+	 * FIFO reset should meet two requirements
+	 * 1) after strobe_ts and strobe_rs clock on
+	 * 2) before dma ready to receive trigger
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		/* Transmitter clock enable */
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL,
+				   I2S_CID_CTRL_STROBE_TS, 0);
+
+		/*
+		 * Transmitter FIFO reset
+		 * When '0', transmit FIFO pointers are reset to zero. Threshold level for
+		 * this FIFO is unchanged. This bit is automatically set to '1' after one
+		 * clock cycle if TX FIFO reset has been acknowledged.
+		 * Deassert then assert this bit here, since I2S_CTRL register is not
+		 * volatile, would not read from hardware any longer. If not, it would
+		 * clear tx fifo every time when write this register.
+		 */
+		ctrl &= ~I2S_CTRL_TFIFO_RST;
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
+				   I2S_CTRL_TFIFO_RST, ctrl);
+		ctrl |= I2S_CTRL_TFIFO_RST;
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
+				   I2S_CTRL_TFIFO_RST, ctrl);
+
+		/* Transmitter FIFO threshold set */
+		fifo |= FIELD_PREP(I2S_TFIFO_CTRL_TAEMPTY_THRESHOLD,
+				   i2s_mc_priv->devtype_data->tfifo_aempty_threshold) |
+			FIELD_PREP(I2S_TFIFO_CTRL_TAFULL_THRESHOLD,
+				   i2s_mc_priv->devtype_data->tfifo_afull_threshold);
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_TFIFO_CTRL,
+				   I2S_TFIFO_CTRL_TAEMPTY_THRESHOLD |
+				   I2S_TFIFO_CTRL_TAFULL_THRESHOLD, fifo);
+	} else {
+		/* Receiver clock enable */
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL,
+				   I2S_CID_CTRL_STROBE_RS, 0);
+
+		/*
+		 * Receiver FIFO reset
+		 * When '0', receive FIFO pointers are reset to zero. Threshold level for
+		 * this FIFO is unchanged. This bit is automatically set to '1' after one
+		 * clock cycle if RX FIFO reset has been acknowledged.
+		 * Deassert then assert this bit here, since I2S_CTRL register is not
+		 * volatile, would not read from hardware any longer. If not, it would
+		 * clear rx fifo every time when write this register.
+		 */
+		ctrl &= ~I2S_CTRL_RFIFO_RST;
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
+				   I2S_CTRL_RFIFO_RST, ctrl);
+		ctrl |= I2S_CTRL_RFIFO_RST;
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL,
+				   I2S_CTRL_RFIFO_RST, ctrl);
+
+		/* Receiver FIFO threshold set */
+		fifo |= FIELD_PREP(I2S_RFIFO_CTRL_RAEMPTY_THRESHOLD,
+				   i2s_mc_priv->devtype_data->rfifo_aempty_threshold) |
+			FIELD_PREP(I2S_RFIFO_CTRL_RAFULL_THRESHOLD,
+				   i2s_mc_priv->devtype_data->rfifo_afull_threshold);
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_RFIFO_CTRL,
+				   I2S_RFIFO_CTRL_RAEMPTY_THRESHOLD |
+				   I2S_RFIFO_CTRL_RAFULL_THRESHOLD, fifo);
+	}
+
+	/*
+	 * Enable global interrupt mask, for both transmitter and receiver, use
+	 * individual interrupt masks
+	 */
+	regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL,
+			   I2S_CID_CTRL_INTREQ_MASK, I2S_CID_CTRL_INTREQ_MASK);
+
+	return 0;
+}
+
+static int cdns_i2s_mc_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *cpu_dai)
+{
+	struct cdns_i2s_mc_priv *i2s_mc_priv = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = i2s_mc_priv->dev;
+	u32 rate, sample_rate = 0;
+	u32 slots, slot_width, resolution, ctrl;
+	unsigned long i2s_clk_rate;
+	u8 pin_tx_num, pin_rx_num;
+	struct clk *clk_parent;
+	bool is_master_mode;
+	int ret;
+
+	rate = params_rate(params);
+	slot_width = i2s_mc_priv->devtype_data->data_width;
+	dev_dbg(dev, "rate = %d, slot_width = %d\n", rate, slot_width);
+
+	/* switch clk mux to select the appropriate clk parent */
+	if (rate % 8000 == 0) {
+		/* Sampling rate is a multiple of 8KHz, select "audio-clk0" */
+		clk_parent = i2s_mc_priv->clks[AUDIO_CLK0];
+
+		ret = clk_set_parent(i2s_mc_priv->clk_i2s, clk_parent);
+	} else if (rate % 11025 == 0) {
+		/* Sampling rate is a multiple of 11.025KHz, select "audio-clk2" */
+		clk_parent = i2s_mc_priv->clks[AUDIO_CLK2];
+
+		ret = clk_set_parent(i2s_mc_priv->clk_i2s, clk_parent);
+	} else {
+		dev_err(i2s_mc_priv->dev, "Invalid sample rate\n");
+		return -EINVAL;
+	}
+	if (ret) {
+		dev_err(i2s_mc_priv->dev, "Failed to set i2s clock parent\n");
+		return ret;
+	}
+
+	i2s_clk_rate = clk_get_rate(i2s_mc_priv->clk_i2s);
+	dev_dbg(dev, "i2s clk rate = %lu\n", i2s_clk_rate);
+
+	regmap_read(i2s_mc_priv->regmap, I2S_CTRL, &ctrl);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		is_master_mode = ctrl & I2S_CTRL_T_MS;
+	else
+		is_master_mode = ctrl & I2S_CTRL_R_MS;
+
+	if (is_master_mode) {
+		if (i2s_clk_rate < rate * 2 * slot_width * I2S_CLK_RATIO_MIN_MASTER) {
+			dev_err(i2s_mc_priv->dev,
+				"clk freq %lu is too low, must >= (%d * %d * %d * %d = %d)\n",
+				i2s_clk_rate, rate, slot_width, 2, I2S_CLK_RATIO_MIN_MASTER,
+				rate * slot_width * 2 * I2S_CLK_RATIO_MIN_MASTER);
+			return -EINVAL;
+		}
+
+		sample_rate = DIV_ROUND_CLOSEST(i2s_clk_rate, (rate * 2 * slot_width));
+	} else {
+		if (i2s_clk_rate < rate * 2 * slot_width * I2S_CLK_RATIO_MIN_SLAVE) {
+			dev_err(i2s_mc_priv->dev,
+				"clk freq %lu is too low, must >= (%d * %d * %d * %d = %d)\n",
+				i2s_clk_rate, rate, slot_width, 2, I2S_CLK_RATIO_MIN_SLAVE,
+				rate * slot_width * 2 * I2S_CLK_RATIO_MIN_SLAVE);
+			return -EINVAL;
+		}
+	}
+
+	slots = params_channels(params);
+	resolution = params_width(params);
+	dev_dbg(dev, "slots = %d, resolution = %d\n", slots, resolution);
+
+	/* Each data pin carries two slots, so the channel count must be even */
+	if (slots % 2) {
+		dev_err(i2s_mc_priv->dev, "Channel number must be a multiple of two\n");
+		return -EINVAL;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		i2s_mc_priv->pin_tx_mask_adjust = i2s_mc_priv->pin_tx_mask;
+
+		pin_tx_num = hweight8(i2s_mc_priv->pin_tx_mask);
+		if (slots > 2 * pin_tx_num) {
+			dev_warn(i2s_mc_priv->dev,
+				 "Transmit channel number is larger than hardware config\n");
+			return -EOPNOTSUPP;
+		} else if (slots < 2 * pin_tx_num) {
+			cdns_i2s_mc_adjust_pin_config(&i2s_mc_priv->pin_tx_mask_adjust, slots);
+		}
+
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_SRR, I2S_SRR_TSAMPLE_RATE,
+				   FIELD_PREP(I2S_SRR_TSAMPLE_RATE, sample_rate));
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_SRR, I2S_SRR_TRESOLUTION,
+				   FIELD_PREP(I2S_SRR_TRESOLUTION, (resolution - 1)));
+	} else {
+		i2s_mc_priv->pin_rx_mask_adjust = i2s_mc_priv->pin_rx_mask;
+
+		pin_rx_num = hweight8(i2s_mc_priv->pin_rx_mask);
+		if (slots > 2 * pin_rx_num) {
+			dev_warn(i2s_mc_priv->dev,
+				 "Receive channel number is larger than hardware config\n");
+			return -EOPNOTSUPP;
+		} else if (slots < 2 * pin_rx_num) {
+			cdns_i2s_mc_adjust_pin_config(&i2s_mc_priv->pin_rx_mask_adjust, slots);
+		}
+
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_SRR, I2S_SRR_RSAMPLE_RATE,
+				   FIELD_PREP(I2S_SRR_RSAMPLE_RATE, sample_rate));
+		regmap_update_bits(i2s_mc_priv->regmap, I2S_SRR, I2S_SRR_RRESOLUTION,
+				   FIELD_PREP(I2S_SRR_RRESOLUTION, (resolution - 1)));
+	}
+
+	return 0;
+}
+
+static int cdns_i2s_mc_trigger(struct snd_pcm_substream *substream,
+			       int cmd, struct snd_soc_dai *cpu_dai)
+{
+	struct cdns_i2s_mc_priv *i2s_mc_priv = snd_soc_dai_get_drvdata(cpu_dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			cdns_i2s_mc_tx_config(i2s_mc_priv, true);
+		else
+			cdns_i2s_mc_rx_config(i2s_mc_priv, true);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			cdns_i2s_mc_tx_config(i2s_mc_priv, false);
+		else
+			cdns_i2s_mc_rx_config(i2s_mc_priv, false);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int cdns_i2s_mc_dai_probe(struct snd_soc_dai *cpu_dai)
+{
+	struct cdns_i2s_mc_priv *i2s_mc_priv = snd_soc_dai_get_drvdata(cpu_dai);
+	u32 ctrl = 0, cid_ctrl = 0;
+
+	/*
+	 * Transceiver disable
+	 * Transceiver clock disable
+	 * All interrupts masked
+	 * Reset for transmitter synchronizing unit
+	 * Reset for receiver synchronizing unit
+	 */
+	ctrl |= FIELD_PREP(I2S_CTRL_I2S_EN, 0);
+	ctrl &= ~(I2S_CTRL_TSYNC_RST | I2S_CTRL_RSYNC_RST);
+	cid_ctrl |= I2S_CID_CTRL_STROBE_TS | I2S_CID_CTRL_STROBE_RS;
+	cid_ctrl &= ~I2S_CID_CTRL_INTREQ_MASK;
+
+	regmap_update_bits(i2s_mc_priv->regmap, I2S_CTRL, I2S_CTRL_I2S_EN, ctrl);
+	regmap_update_bits(i2s_mc_priv->regmap, I2S_CID_CTRL,
+			   I2S_CID_CTRL_STROBE_TS | I2S_CID_CTRL_STROBE_RS |
+			   I2S_CID_CTRL_INTREQ_MASK, cid_ctrl);
+
+	snd_soc_dai_init_dma_data(cpu_dai, &i2s_mc_priv->playback_dma_data,
+				  &i2s_mc_priv->capture_dma_data);
+
+	snd_soc_dai_set_drvdata(cpu_dai, i2s_mc_priv);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops cdns_i2s_mc_dai_ops = {
+	.probe = cdns_i2s_mc_dai_probe,
+	.set_fmt = cdns_i2s_mc_set_fmt,
+	.hw_params = cdns_i2s_mc_hw_params,
+	.prepare = cdns_i2s_mc_prepare,
+	.trigger = cdns_i2s_mc_trigger,
+};
+
+static struct snd_soc_dai_driver cdns_i2s_mc_dai[] = {
+	{
+		.name = "i2s-mc-aif1",
+		.id = I2S_MC_AIF1,
+		.playback = {
+			.stream_name = "I2S-MC-Playback",
+			.channels_min = 2,
+			.channels_max = 16,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = (SNDRV_PCM_FMTBIT_S16_LE |
+				    SNDRV_PCM_FMTBIT_S24_LE |
+				    SNDRV_PCM_FMTBIT_S32_LE),
+		},
+		.ops = &cdns_i2s_mc_dai_ops,
+	},
+	{
+		.name = "i2s-mc-aif2",
+		.id = I2S_MC_AIF2,
+		.capture = {
+			.stream_name = "I2S-MC-Capture",
+			.channels_min = 2,
+			.channels_max = 16,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = (SNDRV_PCM_FMTBIT_S16_LE |
+				    SNDRV_PCM_FMTBIT_S24_LE |
+				    SNDRV_PCM_FMTBIT_S32_LE),
+		},
+		.ops = &cdns_i2s_mc_dai_ops,
+	},
+};
+
+static const struct snd_soc_component_driver cdns_i2s_mc_component = {
+	.name = DRV_NAME,
+	.legacy_dai_naming = 1,
+};
+
+static const struct reg_default cdns_i2s_mc_reg_defaults[] = {
+	{ I2S_CTRL, 0x01900000 },
+	{ I2S_INTR_STAT, 0x00003300 },
+	{ I2S_SRR, 0x00000000 },
+	{ I2S_CID_CTRL, 0x00000000 },
+	{ I2S_TFIFO_STAT, 0x00000000 },
+	{ I2S_RFIFO_STAT, 0x00000000 },
+	{ I2S_TFIFO_CTRL, 0x000f0000 },
+	{ I2S_RFIFO_CTRL, 0x000f0000 },
+	{ I2S_DEV_CONF, 0x00000208 },
+	{ I2S_POLL_STAT, 0x00000003 },
+};
+
+static bool cdns_i2s_mc_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case I2S_CTRL:
+	case I2S_INTR_STAT:
+	case I2S_SRR:
+	case I2S_CID_CTRL:
+	case I2S_TFIFO_STAT:
+	case I2S_RFIFO_STAT:
+	case I2S_TFIFO_CTRL:
+	case I2S_RFIFO_CTRL:
+	case I2S_DEV_CONF:
+	case I2S_POLL_STAT:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool cdns_i2s_mc_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case I2S_CTRL:
+	case I2S_INTR_STAT:
+	case I2S_SRR:
+	case I2S_CID_CTRL:
+	case I2S_TFIFO_CTRL:
+	case I2S_RFIFO_CTRL:
+	case I2S_DEV_CONF:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool cdns_i2s_mc_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case I2S_INTR_STAT:
+	case I2S_TFIFO_STAT:
+	case I2S_RFIFO_STAT:
+	case I2S_POLL_STAT:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config cdns_i2s_mc_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+
+	.max_register = I2S_POLL_STAT,
+	.reg_defaults = cdns_i2s_mc_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(cdns_i2s_mc_reg_defaults),
+	.readable_reg = cdns_i2s_mc_readable_reg,
+	.writeable_reg = cdns_i2s_mc_writeable_reg,
+	.volatile_reg = cdns_i2s_mc_volatile_reg,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static int cdns_i2s_get_pin_config(struct platform_device *pdev,
+				   struct cdns_i2s_mc_priv *i2s_mc_priv)
+{
+	u8 rxtx_mask;
+	int ret;
+
+	ret = device_property_read_u8(&pdev->dev,
+				      "cix,pin-out-num", &i2s_mc_priv->pin_out_num);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get pin-out-num: %d\n", ret);
+		return ret;
+	}
+
+	if (!i2s_mc_priv->pin_out_num || i2s_mc_priv->pin_out_num > BITS_PER_BYTE) {
+		dev_err(&pdev->dev, "Pin out number should be in range [1, 8]\n");
+		return -EINVAL;
+	}
+
+	ret = device_property_read_u8(&pdev->dev,
+				      "cix,pin-rx-mask", &i2s_mc_priv->pin_rx_mask);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get pin-rx-mask: %d\n", ret);
+		return ret;
+	}
+
+	ret = device_property_read_u8(&pdev->dev,
+				      "cix,pin-tx-mask", &i2s_mc_priv->pin_tx_mask);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get pin-tx-mask: %d\n", ret);
+		return ret;
+	}
+
+	rxtx_mask = i2s_mc_priv->pin_rx_mask & i2s_mc_priv->pin_tx_mask;
+	if (rxtx_mask) {
+		dev_err(&pdev->dev, "Pin configuration for transmitter and receiver is conflict\n");
+		return -EINVAL;
+	}
+
+	rxtx_mask = i2s_mc_priv->pin_rx_mask | i2s_mc_priv->pin_tx_mask;
+	if (hweight8(rxtx_mask) > i2s_mc_priv->pin_out_num) {
+		dev_err(&pdev->dev, "Pin configuration is out of range\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void cdns_i2s_mc_rst(struct cdns_i2s_mc_priv *i2s_mc_priv)
+{
+	/* reset */
+	reset_control_assert(i2s_mc_priv->i2s_rst);
+
+	usleep_range(1, 2);
+
+	/* release reset */
+	reset_control_deassert(i2s_mc_priv->i2s_rst);
+}
+
+static int cdns_i2s_mc_probe(struct platform_device *pdev)
+{
+	struct cdns_i2s_mc_priv *i2s_mc_priv;
+	struct resource *res;
+	void __iomem *base;
+	int i, irq, ret;
+
+	i2s_mc_priv = devm_kzalloc(&pdev->dev, sizeof(*i2s_mc_priv), GFP_KERNEL);
+	if (!i2s_mc_priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, i2s_mc_priv);
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	i2s_mc_priv->dev = &pdev->dev;
+	i2s_mc_priv->devtype_data = device_get_match_data(&pdev->dev);
+	if (!i2s_mc_priv->devtype_data)
+		return -ENODEV;
+
+	i2s_mc_priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
+						    &cdns_i2s_mc_regmap_config);
+	if (IS_ERR(i2s_mc_priv->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s_mc_priv->regmap),
+				     "Failed to initialize managed register map\n");
+
+	i2s_mc_priv->clk_hst = devm_clk_get(&pdev->dev, "hst");
+	if (IS_ERR(i2s_mc_priv->clk_hst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s_mc_priv->clk_hst),
+				     "Failed to get hst clock\n");
+
+	i2s_mc_priv->clk_i2s = devm_clk_get(&pdev->dev, "i2s");
+	if (IS_ERR(i2s_mc_priv->clk_i2s))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s_mc_priv->clk_i2s),
+				     "Failed to get i2s clock\n");
+
+	for (i = 0; i < AUDIO_CLK_NUM; i++) {
+		i2s_mc_priv->clks[i] = devm_clk_get(&pdev->dev,
+						    cdns_i2s_mc_clk_pll_names[i]);
+		if (IS_ERR(i2s_mc_priv->clks[i]))
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2s_mc_priv->clks[i]),
+					     "Failed to get %s clock\n",
+					     cdns_i2s_mc_clk_pll_names[i]);
+	}
+
+	i2s_mc_priv->i2s_rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(i2s_mc_priv->i2s_rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2s_mc_priv->i2s_rst),
+				     "Failed to get reset control\n");
+
+	ret = cdns_i2s_get_pin_config(pdev, i2s_mc_priv);
+	if (ret)
+		return ret;
+
+	i2s_mc_priv->playback_dma_data.addr = res->start + I2S_FIFO_ADDRESS;
+	/* Buswidth will be set by framework at runtime */
+	i2s_mc_priv->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_UNDEFINED;
+	i2s_mc_priv->playback_dma_data.maxburst = 4;
+
+	i2s_mc_priv->capture_dma_data.addr = res->start + I2S_FIFO_ADDRESS;
+	/* Buswidth will be set by framework at runtime */
+	i2s_mc_priv->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_UNDEFINED;
+	i2s_mc_priv->capture_dma_data.maxburst = 4;
+
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to register dmaengine component\n");
+
+	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		return dev_err_probe(&pdev->dev, ret, "Failed to enable runtime PM\n");
+	}
+
+	ret = cdns_i2s_mc_clks_enable(i2s_mc_priv);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		return dev_err_probe(&pdev->dev, ret, "Failed to enable clocks\n");
+	}
+
+	cdns_i2s_mc_rst(i2s_mc_priv);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ret = irq;
+		goto err_disable_clks;
+	}
+	i2s_mc_priv->irq = irq;
+
+	ret = devm_request_irq(&pdev->dev, irq, cdns_i2s_mc_isr, 0,
+			       dev_name(&pdev->dev), i2s_mc_priv);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to request irq: %d\n", ret);
+		goto err_disable_clks;
+	}
+
+	/*
+	 * Let pm_runtime_put_sync() disable the clocks, and take regcache effect.
+	 * If CONFIG_PM is not enabled, the clock will stay powered.
+	 */
+	pm_runtime_put_sync(&pdev->dev);
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &cdns_i2s_mc_component,
+					      cdns_i2s_mc_dai, ARRAY_SIZE(cdns_i2s_mc_dai));
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to register soc component\n");
+
+	return 0;
+
+err_disable_clks:
+	cdns_i2s_mc_clks_disable(i2s_mc_priv);
+	pm_runtime_put_noidle(&pdev->dev);
+	return ret;
+}
+
+static int cdns_i2s_mc_runtime_suspend(struct device *dev)
+{
+	struct cdns_i2s_mc_priv *i2s_mc_priv = dev_get_drvdata(dev);
+
+	/*
+	 * Disable the IRQ before switching the regcache to cache-only, so an
+	 * in-flight handler can never access the registers through a
+	 * cache-only regmap. disable_irq() waits for the handler to finish.
+	 */
+	disable_irq(i2s_mc_priv->irq);
+	regcache_cache_only(i2s_mc_priv->regmap, true);
+	cdns_i2s_mc_clks_disable(i2s_mc_priv);
+
+	return 0;
+}
+
+static int cdns_i2s_mc_runtime_resume(struct device *dev)
+{
+	struct cdns_i2s_mc_priv *i2s_mc_priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = cdns_i2s_mc_clks_enable(i2s_mc_priv);
+	if (ret) {
+		dev_err(dev, "Failed to enable clocks:%d\n", ret);
+		return ret;
+	}
+
+	cdns_i2s_mc_rst(i2s_mc_priv);
+
+	regcache_cache_only(i2s_mc_priv->regmap, false);
+	regcache_mark_dirty(i2s_mc_priv->regmap);
+
+	ret = regcache_sync(i2s_mc_priv->regmap);
+	if (ret) {
+		dev_err(dev, "Failed to sync regcache: %d\n", ret);
+		regcache_cache_only(i2s_mc_priv->regmap, true);
+		cdns_i2s_mc_clks_disable(i2s_mc_priv);
+		return ret;
+	}
+
+	/* Enable the IRQ only after the regcache is back in sync */
+	enable_irq(i2s_mc_priv->irq);
+
+	return 0;
+}
+
+static int cdns_i2s_mc_system_suspend(struct device *dev)
+{
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	return 0;
+}
+
+static int cdns_i2s_mc_system_resume(struct device *dev)
+{
+	int ret;
+
+	pinctrl_pm_select_default_state(dev);
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct dev_pm_ops cdns_i2s_mc_pm_ops = {
+	RUNTIME_PM_OPS(cdns_i2s_mc_runtime_suspend, cdns_i2s_mc_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(cdns_i2s_mc_system_suspend, cdns_i2s_mc_system_resume)
+};
+
+static const struct cdns_i2s_mc_devtype_data sky1_devtype_data = {
+	.data_width = 32,
+	.rfifo_aempty_threshold = 4,
+	.rfifo_afull_threshold = 12,
+	.tfifo_aempty_threshold = 4,
+	.tfifo_afull_threshold = 12,
+};
+
+static const struct of_device_id cdns_i2s_mc_of_match[] = {
+	{ .compatible = "cix,sky1-i2s-mc", .data = &sky1_devtype_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cdns_i2s_mc_of_match);
+
+static struct platform_driver cdns_i2s_mc_driver = {
+	.probe = cdns_i2s_mc_probe,
+	.driver = {
+		.name = DRV_NAME,
+		.pm = pm_ptr(&cdns_i2s_mc_pm_ops),
+		.of_match_table = cdns_i2s_mc_of_match,
+	},
+};
+module_platform_driver(cdns_i2s_mc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Joakim Zhang <joakim.zhang@cixtech.com>");
+MODULE_DESCRIPTION("Cadence I2S-MC Controller Driver");
-- 
2.50.1


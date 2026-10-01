Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D703947B0;
	Thu,  1 Oct 2026 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866734; cv=fail; b=Ib6+fZ12on/HeRIkr1pqAWcjgtvonfd/jkUhtlVvy3XmNUbD59F/BMTvKI3w8XUzEEZWX7OxV5NtvXjmUK4kipKghkgXpAkx6/qOBWoOF0JzM9i9WlA1Q6X6kd+TvIQgjvXvlpbTzd/u1z7qI2PGOV5sZJRroyoQBbG02DbnO90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866734; c=relaxed/simple;
	bh=xy4Utec899TdinLzXm4sIuT8iWdZknBuJSHTx5IfeE0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SiuYUV2pX9DdjLYDXRv7UYQKYTvl3b8/7g+ClgoVYK2njX8xfooc8LMMmDib2069kkGbacsUWnsDYD4FNrFMdTKA2zMqbjzb5yI0nMsItk8IAGAC+VrBwRycIn9GL71cFvzwRFBi45QRROMJE+klPmAvlJkze/+TfyLXgXhiSRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LnWeZiFm; arc=fail smtp.client-ip=52.101.69.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LnWeZiFm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdQ3lYzjKHa+eJF7xPYdBko8CPjlukM84+sXRLT2R8WCMrLVrJ8MLubAKJC7ygL3P0TM5bNPmeil6fhDA/VNaRsfdHuf+5AMAyQ97KWntgFG683vUEs3M6fGi210seuJrVF5YAFZKSJASqRMj+l5XEAdZeocD7iWZGF6h1eei/GUbAbKBMNsG7VaaM6FL+sOmi/GI5W+61HXjwmW+E9WcDS/f6ZJPzDyvwZNI2NMo4MYypdRHcsIe5NRc8nMI5xk774HhCaq6cBi85lYFjsQcZLouBmHsHFgZfa/O3lGZppJIipcrWduyn6NOQ7OrJrI9nkDY1tyhqhw6RIEP0qjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dACkqLYQAyFlEzN2/ep9oEYuw02aa8vx40BTkDMIpZc=;
 b=q9l1LcRqYVywyVioUtWDf1b9IyNkmI8KRnDxJLvQjpWvCbshS26TmWoAjYFybZ8hz9+jsyFND0+cqHKPl0PIO7N6H7pSnN239YlsbeQw+/V0fSsdFeNztXxs8nBw6zrJ2dgVM+J/DZAJwaYM3DZuR50wfeSuc0l6iM2gSZ8eBNtcP0dZW5S2TdA7i1mRD0iX6pDQ1+jaSy35ptoEJyxd+9kEB4nIByK7fJaeLMfhD/oxRTxSGXYO6AguVYFJjob3woKqVFNo4FmBqlJHBovv1NG5lkwiRJbCrK8NNjZJdoBXGOMrODmTMeX5jFj7EFvqtK6QeiHSCE7S5UJ0grhSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dACkqLYQAyFlEzN2/ep9oEYuw02aa8vx40BTkDMIpZc=;
 b=LnWeZiFmykFVUzc4JwoBdAcgar06AsOA2yfU67JHCRLSt0QtN3jv9EqAjbgYWnHzmPlQ4FeW5zN2FdNNPGRlQGUz3QHvnYMtJgQqzXtxWs18irRt/sBOPqnIv0m3Kc59gaiUKymUMKjr6Iw0xzN0VB6ZGalCa3fxmA1xIg9kLsYLE2o3xFGswFx0Fg2FfM3Fb7rE9Rgkl7aAyDm7S7JL2j0pAIRSwMrTKGtEUuevDEi4EkZ0S9gmL9qqqc61h+hq1HaQTLjB9Z+E5mCG/rb3g4P7a/8NOmpOTcEtjiqqQ3oZIrTa7Kqp/pj/kxM5nv+gWEBYXuTgwzDfhaeHGeI/cQ==
Received: from AS4P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::16)
 by DBAPR10MB4073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1ca::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 14:58:42 +0000
Received: from AMS1EPF00000090.eurprd05.prod.outlook.com
 (2603:10a6:20b:5da:cafe::6d) by AS4P192CA0009.outlook.office365.com
 (2603:10a6:20b:5da::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 14:58:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000090.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 14:58:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 1 Oct
 2026 17:05:14 +0200
Received: from localhost (10.48.87.64) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 1 Oct
 2026 16:58:41 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/3] ASoC: stm32: add mdf dai support
Date: Thu, 1 Oct 2026 16:56:47 +0200
Message-ID: <20261001145702.2628429-4-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
References: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000090:EE_|DBAPR10MB4073:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d572629-c5bc-4386-c5b8-08df1fcc7c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|11063799006|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	t6UW4Y+QlmXNDgg5IUBF4VMJOMGKObLqHoRXXi28866QVtkUBDrbcSOZX5xBd2Ygn98rNmuzxtnRoSqRVpJMoTnaw2DC6kC9iZrqLTSRGOuFWCoehtWFOlv59gMn4uG+tdm7Xy50dzE6751HfnRiKYadQq8b4rRlqCKL9uAuLLamO/FNayf4YPOr2HtbTM7Zhr/0Usn7IF3l38z6xeaIiKgj3xDBUI5GpjvlEoSWiX6rZGn3aQYCnbs7fKlmZRqYWSWUkTESY5IQb7B1SbbIrhnXrNBtG7lLw9zQ1sKCrWRiJU7t/JZp/6+X/92EEHFzgoiloeyx2uDaj8rjaY4P4IAPEbWGbuHtqjx0ekPSXzbYPk5/yZscWkykSBI+SMjJRQnqXIIRbcuLUhY6JiZLJJmOYAZuO9Hegj8XJb/xIMrfAk0UZM71EptQ/z3oHYPvBatN8MDa1lgo8IKcKKVm55Dpsh58bgtxzSl30KBKkkrLaZuNf1jQ/9GbzXppdR8qCcvlbI5/1quocH+qrzVNwXqFjlM3Bx5uHlxlYAQfX+QEBTk2WlOSaB/6c78HpzmZ8zWJ8Z11lnL1Q2473SMANPty9Bbc9kD43ypZLd/sqtMAwImPfRr85st4pU6Ez3olv2jwuf5djTBZILmKheyyNjbLpZfFfDJosrKPqjdlhFwbGiYOMIhPk2D+VzLKJwtR1Yk19r+TX5slh8XbNWGW5w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PPZc3XjmGqJXARGiQ8Teg9hvv6ZZk0erOE77PU2Cm5YS61wJHMGJL8wiLHm8D+ysT4sWKOfvzJtrA9gnTNdYQJ7i4Uko6kp3P4CJSrg5L4/aRGEW6bJj4Igv0cF+WSQZ6dcDpdvpir1vGRBga1c7fDyoA4uwfsvX2e0MBCwb9GguRSQUfMYRppONxn4KNEXWL4ulXNSTcK+YY8RBUxlhtMBwcTF4bI4j0g/Vu24vLksWux471IuoDV5cWEJvp410x1BrPRgBPd2j3753lvQm/vc0jqaM7q636HjNCOMsrtb6m8VCY/SelD7VZC6z0pVrWMXJ2A6NX0Pu6wG9Hyrb9kFSlH4MrQkpwqcSxTFVThY/mJ7Kfdlo0IA1obpKbzbK9BB/WsILUQjczo2q2jpCdkY+vY8OSVeMYNeT7Mo2m9Xd2BzupW7cQf6/b0s24+8O
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:58:42.3250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d572629-c5bc-4386-c5b8-08df1fcc7c00
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000090.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4073

Add driver to handle DAI interface for PDM microphones connected
to MDF STM32 IP.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 sound/soc/stm/Kconfig      |  15 ++
 sound/soc/stm/Makefile     |   3 +
 sound/soc/stm/stm32_amdf.c | 376 +++++++++++++++++++++++++++++++++++++
 3 files changed, 394 insertions(+)
 create mode 100644 sound/soc/stm/stm32_amdf.c

diff --git a/sound/soc/stm/Kconfig b/sound/soc/stm/Kconfig
index 2753d6c2a826..6661b3a8e4f8 100644
--- a/sound/soc/stm/Kconfig
+++ b/sound/soc/stm/Kconfig
@@ -44,4 +44,19 @@ config SND_SOC_STM32_DFSDM
 	  Select this option to enable the STM32 Digital Filter
 	  for Sigma Delta Modulators (DFSDM) driver used
 	  in various STM32 series for digital microphone capture.
+
+config SND_SOC_STM32_MDF
+	tristate "SoC Audio support for STM32 MDF"
+	depends on ARCH_STM32 || COMPILE_TEST
+	depends on SND_SOC
+	depends on STM32_MDF_ADC
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_SOC_DMIC
+	select IIO_BUFFER_CB
+	help
+	  Select this option to enable the STM32 Multi-function
+	  Digital Filter (MDF) driver used in STM32MP2 series for
+	  digital microphone capture.
+
+	  Module name is stm32_amdf when the driver is built as a module.
 endmenu
diff --git a/sound/soc/stm/Makefile b/sound/soc/stm/Makefile
index 3372432faa09..4e1b3f943a44 100644
--- a/sound/soc/stm/Makefile
+++ b/sound/soc/stm/Makefile
@@ -16,3 +16,6 @@ obj-$(CONFIG_SND_SOC_STM32_SPDIFRX) += snd-soc-stm32-spdifrx.o
 
 #DFSDM
 obj-$(CONFIG_SND_SOC_STM32_DFSDM) += stm32_adfsdm.o
+
+#MDF
+obj-$(CONFIG_SND_SOC_STM32_MDF) += stm32_amdf.o
diff --git a/sound/soc/stm/stm32_amdf.c b/sound/soc/stm/stm32_amdf.c
new file mode 100644
index 000000000000..c946edbc2343
--- /dev/null
+++ b/sound/soc/stm/stm32_amdf.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * This file is part of STM32 MDF ASoC DAI driver
+ *
+ * Copyright (C) 2023, STMicroelectronics.
+ * Author: Olivier Moysan <olivier.moysan@foss.st.com>.
+ */
+
+#include <linux/clk.h>
+#include <linux/iio/adc/stm32-mdf-adc.h>
+#include <linux/iio/consumer.h>
+#include <linux/iio/iio.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include <sound/pcm.h>
+#include <sound/soc.h>
+
+#define STM32_AMDF_DRV_NAME "stm32-amdf"
+
+#define MDF_MAX_PERIOD_SIZE	(PAGE_SIZE / 2)
+#define MDF_MAX_PERIODS	6
+
+struct stm32_amdf_priv {
+	struct snd_soc_dai_driver dai_drv;
+	struct snd_pcm_substream *substream;
+	struct device *dev;
+
+	/* IIO */
+	struct iio_channel *iio_ch;
+	struct iio_cb_buffer *iio_cb;
+	bool iio_active;
+
+	/* PCM buffer */
+	unsigned char *pcm_buff;
+	unsigned int pos;
+
+	struct mutex lock; /* protect against race condition on iio state */
+};
+
+static const struct snd_pcm_hardware stm32_amdf_pcm_hw = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_PAUSE,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE,
+
+	.channels_min = 1,
+	.channels_max = 1,
+
+	.periods_min = 2,
+	.periods_max = MDF_MAX_PERIODS,
+
+	.period_bytes_max = MDF_MAX_PERIOD_SIZE,
+	.buffer_bytes_max = MDF_MAX_PERIODS * MDF_MAX_PERIOD_SIZE
+};
+
+static void stm32_amdf_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct stm32_amdf_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	mutex_lock(&priv->lock);
+	if (priv->iio_active) {
+		iio_channel_stop_all_cb(priv->iio_cb);
+		priv->iio_active = false;
+	}
+	mutex_unlock(&priv->lock);
+}
+
+static int stm32_amdf_dai_prepare(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct stm32_amdf_priv *priv = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	mutex_lock(&priv->lock);
+	if (priv->iio_active) {
+		iio_channel_stop_all_cb(priv->iio_cb);
+		priv->iio_active = false;
+	}
+
+	ret = iio_write_channel_attribute(priv->iio_ch,
+					  substream->runtime->rate, 0,
+					  IIO_CHAN_INFO_SAMP_FREQ);
+	if (ret < 0) {
+		dev_err(dai->dev, "%s: Failed to set %d sampling rate\n",
+			__func__, substream->runtime->rate);
+		goto out;
+	}
+
+	if (!priv->iio_active) {
+		ret = iio_channel_start_all_cb(priv->iio_cb);
+		if (!ret)
+			priv->iio_active = true;
+		else
+			dev_err(dai->dev, "%s: IIO channel start failed (%d)\n",
+				__func__, ret);
+	}
+
+out:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static const struct snd_soc_dai_ops stm32_amdf_dai_ops = {
+	.shutdown = stm32_amdf_shutdown,
+	.prepare = stm32_amdf_dai_prepare,
+};
+
+static const struct snd_soc_dai_driver stm32_amdf_dai = {
+	.capture = {
+		    .channels_min = 1,
+		    .channels_max = 1,
+		    .formats = SNDRV_PCM_FMTBIT_S16_LE |
+			       SNDRV_PCM_FMTBIT_S32_LE,
+		    .rates = SNDRV_PCM_RATE_CONTINUOUS,
+		    .rate_min = 8000,
+		    .rate_max = 48000,
+		    },
+	.ops = &stm32_amdf_dai_ops,
+};
+
+static const struct snd_soc_component_driver stm32_amdf_dai_component = {
+	.name = "stm32_mdf_audio",
+};
+
+static void stm32_memcpy_32to16(void *dest, const void *src, size_t n)
+{
+	unsigned int i = 0;
+	u16 *d = (u16 *)dest, *s = (u16 *)src;
+
+	s++;
+	for (i = n >> 1; i > 0; i--) {
+		*d++ = *s++;
+		s++;
+	}
+}
+
+static int stm32_afsdm_pcm_cb(const void *data, size_t size, void *private)
+{
+	struct stm32_amdf_priv *priv = private;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(priv->substream);
+	u8 *pcm_buff = priv->pcm_buff;
+	u8 *src_buff = (u8 *)data;
+	unsigned int old_pos = priv->pos;
+	size_t buff_size = snd_pcm_lib_buffer_bytes(priv->substream);
+	size_t period_size = snd_pcm_lib_period_bytes(priv->substream);
+	size_t cur_size, src_size = size;
+	snd_pcm_format_t format = priv->substream->runtime->format;
+
+	if (format == SNDRV_PCM_FORMAT_S16_LE)
+		src_size >>= 1;
+	cur_size = src_size;
+
+	dev_dbg(rtd->dev, "%s: buff_add :%pK, pos = %d, size = %zu\n",
+		__func__, &pcm_buff[priv->pos], priv->pos, src_size);
+
+	if ((priv->pos + src_size) > buff_size) {
+		if (format == SNDRV_PCM_FORMAT_S16_LE)
+			stm32_memcpy_32to16(&pcm_buff[priv->pos], src_buff, buff_size - priv->pos);
+		else
+			memcpy(&pcm_buff[priv->pos], src_buff, buff_size - priv->pos);
+		cur_size -= buff_size - priv->pos;
+		priv->pos = 0;
+	}
+
+	if (format == SNDRV_PCM_FORMAT_S16_LE)
+		stm32_memcpy_32to16(&pcm_buff[priv->pos], &src_buff[src_size - cur_size], cur_size);
+	else
+		memcpy(&pcm_buff[priv->pos], &src_buff[src_size - cur_size], cur_size);
+
+	priv->pos = (priv->pos + cur_size) % buff_size;
+
+	if (cur_size != src_size || (old_pos && (old_pos % period_size < size)))
+		snd_pcm_period_elapsed(priv->substream);
+
+	return 0;
+}
+
+static int stm32_amdf_trigger(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct stm32_amdf_priv *priv =
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		priv->pos = 0;
+		return stm32_mdf_get_buff_cb(priv->iio_ch->indio_dev, stm32_afsdm_pcm_cb, priv);
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		return stm32_mdf_release_buff_cb(priv->iio_ch->indio_dev);
+	}
+
+	return -EINVAL;
+}
+
+static int stm32_amdf_pcm_open(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct stm32_amdf_priv *priv = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
+	int ret;
+
+	ret =  snd_soc_set_runtime_hwparams(substream, &stm32_amdf_pcm_hw);
+	if (!ret)
+		priv->substream = substream;
+
+	return ret;
+}
+
+static int stm32_amdf_pcm_close(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct stm32_amdf_priv *priv =
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
+
+	priv->substream = NULL;
+
+	return 0;
+}
+
+static snd_pcm_uframes_t stm32_amdf_pcm_pointer(struct snd_soc_component *component,
+						struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct stm32_amdf_priv *priv =
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
+
+	return bytes_to_frames(substream->runtime, priv->pos);
+}
+
+static int stm32_amdf_pcm_hw_params(struct snd_soc_component *component,
+				    struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct stm32_amdf_priv *priv =
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
+
+	priv->pcm_buff = substream->runtime->dma_area;
+
+	return iio_channel_cb_set_buffer_watermark(priv->iio_cb,
+						   params_period_size(params));
+}
+
+static int stm32_amdf_pcm_new(struct snd_soc_component *component,
+			      struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_pcm *pcm = rtd->pcm;
+	struct stm32_amdf_priv *priv =
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
+	unsigned int size = MDF_MAX_PERIODS * MDF_MAX_PERIOD_SIZE;
+
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       priv->dev, size, size);
+
+	return 0;
+}
+
+static int stm32_amdf_dummy_cb(const void *data, void *private)
+{
+	/*
+	 * This dummy callback is requested by iio_channel_get_all_cb() API,
+	 * but the stm32_mdf_get_buff_cb() API is used instead, to optimize
+	 * DMA transfers.
+	 */
+	return 0;
+}
+
+static void stm32_amdf_cleanup(void *data)
+{
+	iio_channel_release_all_cb(data);
+}
+
+static const struct snd_soc_component_driver stm32_amdf_soc_platform = {
+	.open		= stm32_amdf_pcm_open,
+	.close		= stm32_amdf_pcm_close,
+	.hw_params	= stm32_amdf_pcm_hw_params,
+	.trigger	= stm32_amdf_trigger,
+	.pointer	= stm32_amdf_pcm_pointer,
+	.pcm_new	= stm32_amdf_pcm_new,
+	.debugfs_prefix	= "pcm",
+};
+
+static const struct of_device_id stm32_amdf_of_match[] = {
+	{.compatible = "st,stm32mp25-mdf-dai"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, stm32_amdf_of_match);
+
+static int stm32_amdf_probe(struct platform_device *pdev)
+{
+	struct stm32_amdf_priv *priv;
+	unsigned int channels_max;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+	priv->dai_drv = stm32_amdf_dai;
+	priv->dai_drv.name = dev_name(&pdev->dev);
+	mutex_init(&priv->lock);
+
+	dev_set_drvdata(&pdev->dev, priv);
+
+	/* Associate iio channel */
+	priv->iio_ch  = devm_iio_channel_get_all(&pdev->dev);
+	if (IS_ERR(priv->iio_ch)) {
+		dev_err(&pdev->dev, "Failed to get IIO channels %ld\n", PTR_ERR(priv->iio_ch));
+		return PTR_ERR(priv->iio_ch);
+	}
+
+	priv->iio_cb = iio_channel_get_all_cb(&pdev->dev, &stm32_amdf_dummy_cb, NULL);
+	if (IS_ERR(priv->iio_cb)) {
+		dev_err(&pdev->dev, "Failed to get IIO callbacks %ld\n", PTR_ERR(priv->iio_cb));
+		return PTR_ERR(priv->iio_cb);
+	}
+
+	ret = devm_add_action_or_reset(&pdev->dev, stm32_amdf_cleanup, priv->iio_cb);
+	if (ret < 0)  {
+		dev_err(&pdev->dev, "Unable to add action\n");
+		return ret;
+	}
+
+	channels_max = stm32_mdf_get_sub_channels_nb(priv->iio_ch->indio_dev);
+	priv->dai_drv.capture.channels_max = channels_max;
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &stm32_amdf_dai_component,
+					      &priv->dai_drv, 1);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register %s\n", stm32_amdf_dai_component.name);
+		return ret;
+	}
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &stm32_amdf_soc_platform,
+					      NULL, 0);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register PCM platform\n");
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	return ret;
+}
+
+static void stm32_amdf_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+}
+
+static struct platform_driver stm32_amdf_driver = {
+	.driver = {
+		   .name = STM32_AMDF_DRV_NAME,
+		   .of_match_table = stm32_amdf_of_match,
+		   },
+	.probe = stm32_amdf_probe,
+	.remove = stm32_amdf_remove,
+};
+
+module_platform_driver(stm32_amdf_driver);
+
+MODULE_DESCRIPTION("stm32 MDF DAI driver");
+MODULE_AUTHOR("Olivier Moysan <olivier.moysan@foss.st.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" STM32_AMDF_DRV_NAME);
+MODULE_IMPORT_NS("IIO_CONSUMER");
-- 
2.43.0


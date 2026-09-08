Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5721E5221C1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858309; cv=none; b=N/5qOYS0Wh5eicITyKH9KSLDiwI8TJhW0PTAGjjwiS+aEHmLz8Z/m0O+glpKeq4HgCvGJEjxhS9WRAsBufvzGgL9y8m4lraNA+bpm0Qfgnokpm1oGK7xRnIFPaJ/GJichtGfLRvDU9jS4PABEWRnyLHroMSSnQj0KmLIQQHMKxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858309; c=relaxed/simple;
	bh=OsawkstsVjYgerVm/53M8tCSZTwywunSzKtRJfCIYxE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1n98+mm+9P6++N8v7HbHvF8LKLkKsk4697NJ4sohMDnPHjRo1eehxikhH3Zh1GL2uEWF2r5Uju+qmUS/7HcOvF/tzEL5LZMXVwiJP4ZZMnj3sWxEXkuQA7Ep4aXMuik/uIv8is/uXT+mSQiMHU5OuhXWTr5aiTMtXOgL4fmsgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKAO+6If; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKAO+6If"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so308311f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858303; x=1789463103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TBt1+MvMUyhjfrZRMIFJhbFWr7xZ7mudkOkw/qsyFuY=;
        b=CKAO+6IfePJbPM3BmjUYFqmQj9XCW+AKsxAmy5A+eTrS7ttTR+7v3cEywD06MgQtRs
         K4sY8tsethGeJIOHVDOz01DOkOc7sN2q/o/oAjSmA+wHC7lf6VONp5CPCIZ0Jl1K+gBa
         qOmutTPjFLWR5mKlv4AbCoLiGk+h5PAmRfip7I4D8lQcPnN9MfAdvXkJuc6qkDEvZ2NI
         J24gV9xYN4z5cQctwd5k+kkS+4x4Ty+TYDULCcHAbdnQqWJcEmLvOBjX62oC32t1DAsn
         Q0Y8/jZrRtisNI+1JjbRFq2/FQ3u0UZr3Ft0CtxXs/5tRGNgv2SSviMSYWtQ/f73cGq2
         rJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858303; x=1789463103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TBt1+MvMUyhjfrZRMIFJhbFWr7xZ7mudkOkw/qsyFuY=;
        b=T3HPDGC+QdYAG6MyMWBLhYZI8OkRLvoP5WJ2M/xSzfUQytbOtaUGR+HbQdiUV8+Vab
         hApajNMLwUpc7xWiQGu/lrSGbx1e3zMCEMe1ZFUfpfOFcZp0dgZyGmEi8ILtosveMEY9
         FZ3s8daRTnj3TbSXmMdcWysR4mEsh+HBzOjy66NIDmdDkm2zrX+69jEAu4y762q5drcy
         /FMg4eUoBKvf4JyuIE0iKv0yw8DJUEUT4sE/xas0ftC9ld5GWDtEfX7Lph3HRbz1q/4D
         2S6T1UP/wPSWxS6J9TlmPuhWxEsReBGb+iD4lyVaVQAjbUxE5dpgl1JGTnkPgZS8AyRI
         MOSw==
X-Forwarded-Encrypted: i=1; AKwUvBzK9oJIjHmoJZa6IpqEXAMwIPU1jS7Hbm2wtwOmL8wA+Hs8cCEpYBUL9HjNBgxzw1p9qJM8GdoEN0yQuiA=@vger.kernel.org
X-Gm-Message-State: AFuF++lqWlNlzIkn+/1Ns4OAw7Lshp7nN79wRs37oczqMl0n8gdNKpSt
	nwBLi/FID3VyY9EyKFaJ1jhKhr7GM+gLOLcDptMscqntg6MlHyddkufl
X-Gm-Gg: AYBFou2NkrvlzNX78UboMaihJENKMpywALwkfqeKlguiTNZQBfI/ePLjM6q2cQ5UwUq
	1M8HotqVgcFVEDmFsRtsFLmEwoeVNfgXRaBfBdyhJGRY0GLpjudOAhCkiHL7KbwvreNKeFnxGcf
	JivhOYZzfG3qiFsW7zGlb8VPv3ybxhmifT6PxWWllCRvvdMxrtOS87IU1uTTIoNkMPQSRRZQgPV
	VgBtr5c4ltfOqx9f7qMbWHNy61DVTjZcVejn4VQ/QnZr+BT2vS71hs3NQVWX0r+6YANRXg0TeLe
	O6u+1I3UT+HyD1Vsv7poq3xaWdbo8Mr2klXygbijc+QmYySA0SwpeKUEPAgY0xfO9EyHvtrF1Di
	qXcJx+Yb9BLcGWHTjC3dCabP8QyVuPBgI8nuB1lA6tC4eHJr6XU0CIjVQ3ZyLXK4TNyRjop6Ii6
	OIcqvr77CNJfmzIjyoZSqlk6lcTjMxsZTXN60+6hnSNTkWzishCnOc6wDHDEmJ3dNbmTGmXhlaY
	jfLSmphcyqrNu9k6R1I7xJG61YfPC+vvAt/gNQoPeyYUQ2uyyc1
X-Received: by 2002:a05:6000:658:b0:485:9908:91b5 with SMTP id ffacd0b85a97d-485a23e1fe0mr5069511f8f.10.1788858303318;
        Tue, 08 Sep 2026 02:05:03 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:05:02 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 4/5] ASoC: airoha: Add AFE driver for Airoha AN7581
Date: Tue,  8 Sep 2026 11:04:46 +0200
Message-ID: <20260908090448.3332-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Sound system present on Airoha AN7581 SoC. This is
based on the Mediatek AFE drivers and adds the PCM and the ETDM driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  17 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   8 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  49 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 515 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 433 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 8 files changed, 1144 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f72058a2f2..e3b7be8ad2dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -768,6 +768,14 @@ F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
 F:	drivers/phy/phy-airoha-pcie-regs.h
 F:	drivers/phy/phy-airoha-pcie.c
 
+AIROHA SOUND DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
+F:	Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
+F:	sound/soc/mediatek/an7581/*
+
 AIROHA SPI SNFI DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 M:	Ray Liu <ray.liu@airoha.com>
diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 224746e7664f..eb6f2a443b23 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -1,10 +1,25 @@
 # SPDX-License-Identifier: GPL-2.0-only
-menu "Mediatek"
 
 config SND_SOC_MEDIATEK
 	tristate
 	select REGMAP_MMIO
 
+menu "Airoha"
+
+config SND_SOC_AN7581
+	tristate "ASoC support for Airoha AN7581 chip"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC platform driver support for Airoha AN7581 chip
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+endmenu
+
+menu "Mediatek"
+
 config SND_SOC_MT2701
 	tristate "ASoC support for Mediatek MT2701 chip"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
index a6815a3c5988..54522e1fa016 100644
--- a/sound/soc/mediatek/Makefile
+++ b/sound/soc/mediatek/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_SND_SOC_MEDIATEK) += common/
+obj-$(CONFIG_SND_SOC_AN7581) += an7581/
 obj-$(CONFIG_SND_SOC_MT2701) += mt2701/
 obj-$(CONFIG_SND_SOC_MT6797) += mt6797/
 obj-$(CONFIG_SND_SOC_MT7986) += mt7986/
diff --git a/sound/soc/mediatek/an7581/Makefile b/sound/soc/mediatek/an7581/Makefile
new file mode 100644
index 000000000000..d6de5ee1668e
--- /dev/null
+++ b/sound/soc/mediatek/an7581/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# platform driver
+snd-soc-an7581-afe-y := \
+	an7581-afe-pcm.o \
+	an7581-dai-etdm.o
+
+obj-$(CONFIG_SND_SOC_AN7581) += snd-soc-an7581-afe.o
diff --git a/sound/soc/mediatek/an7581/an7581-afe-common.h b/sound/soc/mediatek/an7581/an7581-afe-common.h
new file mode 100644
index 000000000000..ebc8e2f7fec4
--- /dev/null
+++ b/sound/soc/mediatek/an7581/an7581-afe-common.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * an7581-afe-common.h  --  Airoha AN7581 audio driver definitions
+ */
+
+#ifndef _AN7581_AFE_COMMON_H_
+#define _AN7581_AFE_COMMON_H_
+
+#include <linux/atomic.h>
+#include <linux/list.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#include "../../mediatek/common/mtk-base-afe.h"
+
+enum {
+	AN7581_MEMIF_DL1,
+	AN7581_MEMIF_UL1,
+	AN7581_MEMIF_NUM,
+	AN7581_DAI_ETDM = AN7581_MEMIF_NUM,
+	AN7581_DAI_NUM,
+};
+
+enum {
+	AN7581_IRQ_0,
+	AN7581_IRQ_1,
+	AN7581_IRQ_NUM,
+};
+
+struct an7581_memif_irq_desc {
+	u8 irq;
+	u32 status_bit;
+	u32 clear_reg;
+};
+
+struct an7581_afe_private {
+	unsigned int users;
+	/* protect concurrent ETDM user tracking */
+	struct mutex user_lock;
+
+	void *dai_priv[AN7581_DAI_NUM];
+};
+
+unsigned int an7581_afe_rate_transform(struct device *dev,
+				       unsigned int rate);
+
+int an7581_dai_etdm_register(struct mtk_base_afe *afe);
+
+#endif
diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
new file mode 100644
index 000000000000..a1d742362538
--- /dev/null
+++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
@@ -0,0 +1,515 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Airoha ALSA SoC AFE platform driver for AN7581
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include "an7581-afe-common.h"
+#include "an7581-reg.h"
+#include "../common/mtk-afe-platform-driver.h"
+#include "../common/mtk-afe-fe-dai.h"
+
+enum {
+	ARH_AFE_RATE_8K = 0,
+	ARH_AFE_RATE_12K = 1,
+	ARH_AFE_RATE_16K = 2,
+	ARH_AFE_RATE_24K = 3,
+	ARH_AFE_RATE_32K = 4,
+	ARH_AFE_RATE_48K = 5,
+	ARH_AFE_RATE_96K = 6,
+	ARH_AFE_RATE_192K = 7,
+	ARH_AFE_RATE_384K = 8,
+	ARH_AFE_RATE_7K = 16,
+	ARH_AFE_RATE_11K = 17,
+	ARH_AFE_RATE_14K = 18,
+	ARH_AFE_RATE_22K = 19,
+	ARH_AFE_RATE_29K = 20,
+	ARH_AFE_RATE_44K = 21,
+	ARH_AFE_RATE_88K = 22,
+	ARH_AFE_RATE_176K = 23,
+	ARH_AFE_RATE_352K = 24,
+};
+
+unsigned int an7581_afe_rate_transform(struct device *dev, unsigned int rate)
+{
+	switch (rate) {
+	case 7350:
+		return ARH_AFE_RATE_7K;
+	case 8000:
+		return ARH_AFE_RATE_8K;
+	case 11025:
+		return ARH_AFE_RATE_11K;
+	case 12000:
+		return ARH_AFE_RATE_12K;
+	case 14700:
+		return ARH_AFE_RATE_14K;
+	case 16000:
+		return ARH_AFE_RATE_16K;
+	case 22050:
+		return ARH_AFE_RATE_22K;
+	case 24000:
+		return ARH_AFE_RATE_24K;
+	case 29400:
+		return ARH_AFE_RATE_29K;
+	case 32000:
+		return ARH_AFE_RATE_32K;
+	case 44100:
+		return ARH_AFE_RATE_44K;
+	case 48000:
+		return ARH_AFE_RATE_48K;
+	case 88200:
+		return ARH_AFE_RATE_88K;
+	case 96000:
+		return ARH_AFE_RATE_96K;
+	case 176400:
+		return ARH_AFE_RATE_176K;
+	case 192000:
+		return ARH_AFE_RATE_192K;
+	case 352800:
+		return ARH_AFE_RATE_352K;
+	case 384000:
+		return ARH_AFE_RATE_384K;
+	default:
+		dev_warn_ratelimited(dev, "%s(), rate %u invalid, using %d!\n",
+				     __func__, rate, ARH_AFE_RATE_48K);
+		return ARH_AFE_RATE_48K;
+	}
+}
+
+static const struct an7581_memif_irq_desc an7581_memif_irq_descs[AN7581_MEMIF_NUM] = {
+	[AN7581_MEMIF_DL1] = {
+		.irq = AN7581_IRQ_0,
+		.status_bit = AFE_IRQ_STS_PLAY,
+		.clear_reg = AFE_IRQ_CON0,
+	},
+	[AN7581_MEMIF_UL1] = {
+		.irq = AN7581_IRQ_1,
+		.status_bit = AFE_IRQ_STS_RECORD,
+		.clear_reg = AFE_IRQ1_CON0,
+	},
+};
+
+static const struct snd_pcm_hardware an7581_afe_hardware = {
+	.info = SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_MMAP_VALID,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE |
+		   SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+	.period_bytes_min = 512,
+	.period_bytes_max = 128 * 1024,
+	.periods_min = 2,
+	.periods_max = 256,
+	.buffer_bytes_max = 256 * 1024,
+};
+
+static int an7581_memif_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+
+	return an7581_afe_rate_transform(afe->dev, rate);
+}
+
+static int an7581_afe_fe_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	ret = mtk_afe_fe_startup(substream, dai);
+	if (ret < 0)
+		return ret;
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		ret = snd_pcm_hw_constraint_minmax(runtime,
+						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+						   0x2000, UINT_MAX);
+		if (ret < 0)
+			dev_err(afe->dev, "hw_constraint_minmax failed\n");
+	}
+
+	return ret;
+}
+
+const struct snd_soc_dai_ops an7581_afe_fe_ops = {
+	.startup	= an7581_afe_fe_startup,
+	.shutdown	= mtk_afe_fe_shutdown,
+	.hw_params	= mtk_afe_fe_hw_params,
+	.hw_free	= mtk_afe_fe_hw_free,
+	.prepare	= mtk_afe_fe_prepare,
+	.trigger	= mtk_afe_fe_trigger,
+};
+
+#define ARH_PCM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver an7581_memif_dai_driver[] = {
+	/* FE DAIs: memory intefaces to CPU */
+	{
+		.name = "DL1",
+		.id = AN7581_MEMIF_DL1,
+		.playback = {
+			.stream_name = "DL1",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = ARH_PCM_FORMATS,
+		},
+		.ops = &an7581_afe_fe_ops,
+	},
+	{
+		.name = "UL1",
+		.id = AN7581_MEMIF_UL1,
+		.capture = {
+			.stream_name = "UL1",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = ARH_PCM_FORMATS,
+		},
+		.ops = &an7581_afe_fe_ops,
+	},
+};
+
+static const struct snd_soc_dapm_widget an7581_memif_widgets[] = {
+	/* DL */
+	SND_SOC_DAPM_MIXER("I032", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I033", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	/* UL */
+	SND_SOC_DAPM_MIXER("O018", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("O019", SND_SOC_NOPM, 0, 0, NULL, 0),
+};
+
+static const struct snd_soc_dapm_route an7581_memif_routes[] = {
+	{"I032", NULL, "DL1"},
+	{"I033", NULL, "DL1"},
+	{"UL1", NULL, "O018"},
+	{"UL1", NULL, "O019"},
+	{"O018", NULL, "I150"},
+	{"O019", NULL, "I151"},
+};
+
+static const struct snd_soc_component_driver an7581_afe_pcm_dai_component = {
+	.name = "an7581-afe-pcm-dai",
+};
+
+static const struct mtk_base_memif_data memif_data[AN7581_MEMIF_NUM] = {
+	[AN7581_MEMIF_DL1] = {
+		.name = "DL1",
+		.id = AN7581_MEMIF_DL1,
+		.reg_ofs_base = AFE_DL1_BASE,
+		.reg_ofs_cur = AFE_DL1_CUR,
+		.reg_ofs_end = AFE_DL1_END,
+		.fs_reg = -1,
+		.fs_shift = -1,
+		.fs_maskbit = -1,
+		.mono_reg = -1,
+		.mono_shift = -1,
+		.hd_reg = AFE_DL1_CON0,
+		.hd_shift = AFE_HD_SHIFT,
+		.hd_align_reg = -1,
+		.hd_align_mshift = -1,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = AFE_DL1_ENABLE_SHIFT,
+		.msb_reg = -1,
+		.msb_shift = -1,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+	},
+	[AN7581_MEMIF_UL1] = {
+		.name = "UL1",
+		.id = AN7581_MEMIF_UL1,
+		.reg_ofs_base = AFE_UL1_BASE,
+		.reg_ofs_cur = AFE_UL1_CUR,
+		.reg_ofs_end = AFE_UL1_END,
+		.fs_reg = -1,
+		.fs_shift = -1,
+		.fs_maskbit = -1,
+		.mono_reg = -1,
+		.mono_shift = -1,
+		.hd_reg = AFE_UL1_CON0,
+		.hd_shift = AFE_HD_SHIFT,
+		.hd_align_reg = AFE_UL1_CON0,
+		.hd_align_mshift = AFE_HD_ALIGN_SHIFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = AFE_UL1_ENABLE_SHIFT,
+		.msb_reg = -1,
+		.msb_shift = -1,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+	},
+};
+
+static const struct mtk_base_irq_data irq_data[AN7581_IRQ_NUM] = {
+	[AN7581_IRQ_0] = {
+		.id = AN7581_IRQ_0,
+		.irq_cnt_reg = AFE_IRQ_CNT,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_en_reg = AFE_IRQ_CON0,
+		.irq_en_shift = AFE_IRQ_ON_SHIFT,
+		.irq_fs_reg = -1,
+		.irq_fs_shift = -1,
+		.irq_fs_maskbit = -1,
+		.irq_clr_reg = -1,
+		.irq_clr_shift = -1,
+	},
+	[AN7581_IRQ_1] = {
+		.id = AN7581_IRQ_1,
+		.irq_cnt_reg = AFE_IRQ1_CNT,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_en_reg = AFE_IRQ1_CON0,
+		.irq_en_shift = AFE_IRQ_ON_SHIFT,
+		.irq_fs_reg = -1,
+		.irq_fs_shift = -1,
+		.irq_fs_maskbit = -1,
+		.irq_clr_reg = -1,
+		.irq_clr_shift = -1,
+	},
+};
+
+static const struct regmap_config an7581_afe_regmap_config = {
+	.name = "afe",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = AFE_MAX_REGISTER,
+};
+
+static const struct regmap_config an7581_afe_irq1_regmap_config = {
+	.name = "afe_irq1",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = AFE_IRQ1_MAX_REGISTER,
+};
+
+static irqreturn_t an7581_afe_irq_handler(int irq_id, void *dev)
+{
+	const struct an7581_memif_irq_desc *irq_desc;
+	struct mtk_base_afe *afe = dev;
+	u32 status = 0;
+	int i;
+
+	regmap_read(afe->regmap, AFE_IRQ_STS, &status);
+
+	for (i = 0; i < AN7581_MEMIF_NUM; i++) {
+		struct mtk_base_afe_memif *memif = &afe->memif[i];
+
+		if (!memif->substream)
+			continue;
+
+		if (memif->irq_usage < 0)
+			continue;
+
+		irq_desc = &an7581_memif_irq_descs[i];
+		if (status & irq_desc->status_bit)
+			snd_pcm_period_elapsed(memif->substream);
+	}
+
+	for (i = 0; i < AN7581_MEMIF_NUM; i++) {
+		struct regmap *irq_regmap;
+
+		irq_desc = &an7581_memif_irq_descs[i];
+		if (!(status & irq_desc->status_bit))
+			continue;
+
+		irq_regmap = afe->irqs[irq_desc->irq].regmap;
+		regmap_set_bits(irq_regmap, irq_desc->clear_reg,
+				BIT(AFE_IRQ_CLR_SHIFT));
+		regmap_clear_bits(irq_regmap, irq_desc->clear_reg,
+				  BIT(AFE_IRQ_CLR_SHIFT));
+
+		regmap_set_bits(irq_regmap, irq_desc->clear_reg,
+				BIT(AFE_IRQ_MISS_FLG_CLR_SHIFT));
+		regmap_clear_bits(irq_regmap, irq_desc->clear_reg,
+				  BIT(AFE_IRQ_MISS_FLG_CLR_SHIFT));
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int an7581_dai_memif_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = an7581_memif_dai_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(an7581_memif_dai_driver);
+
+	dai->dapm_widgets = an7581_memif_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(an7581_memif_widgets);
+	dai->dapm_routes = an7581_memif_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(an7581_memif_routes);
+
+	return 0;
+}
+
+typedef int (*dai_register_cb)(struct mtk_base_afe *);
+static const dai_register_cb dai_register_cbs[] = {
+	an7581_dai_etdm_register,
+	an7581_dai_memif_register,
+};
+
+static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
+{
+	struct an7581_afe_private *afe_priv;
+	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
+	struct mtk_base_afe *afe;
+	int i, irq_id, ret;
+	void *base;
+
+	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
+	if (!afe)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, afe);
+
+	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv),
+					  GFP_KERNEL);
+	if (!afe->platform_priv)
+		return -ENOMEM;
+
+	afe->irqs_size = AN7581_IRQ_NUM;
+	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
+				 GFP_KERNEL);
+	if (!afe->irqs)
+		return -ENOMEM;
+
+	afe->memif_size = AN7581_MEMIF_NUM;
+	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
+				  GFP_KERNEL);
+	if (!afe->memif)
+		return -ENOMEM;
+
+	afe_priv = afe->platform_priv;
+	mutex_init(&afe_priv->user_lock);
+	afe->dev = &pdev->dev;
+
+	reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(reset))
+		return PTR_ERR(reset);
+
+	/* Global reset I2S */
+	reset_control_assert(reset);
+	usleep_range(10, 20);
+	reset_control_deassert(reset);
+
+	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(afe->base_addr))
+		return PTR_ERR(afe->base_addr);
+
+	base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
+					    &an7581_afe_regmap_config);
+	if (IS_ERR(afe->regmap))
+		return PTR_ERR(afe->regmap);
+
+	mutex_init(&afe->irq_alloc_lock);
+
+	/* irq initialize */
+	for (i = 0; i < afe->irqs_size; i++)
+		afe->irqs[i].irq_data = &irq_data[i];
+
+	afe->irqs[AN7581_IRQ_0].regmap = afe->regmap;
+	afe->irqs[AN7581_IRQ_1].regmap = devm_regmap_init_mmio(&pdev->dev, base,
+							       &an7581_afe_irq1_regmap_config);
+	if (IS_ERR(afe->irqs[AN7581_IRQ_1].regmap))
+		return PTR_ERR(afe->irqs[AN7581_IRQ_1].regmap);
+
+	/* request irq */
+	irq_id = platform_get_irq(pdev, 0);
+	if (irq_id < 0)
+		return irq_id;
+
+	/* init memif */
+	for (i = 0; i < afe->memif_size; i++) {
+		int sel_irq = an7581_memif_irq_descs[i].irq;
+
+		afe->memif[i].data = &memif_data[i];
+		afe->memif[i].irq_usage = sel_irq;
+		afe->memif[i].const_irq = 1;
+		afe->irqs[sel_irq].irq_occupyed = true;
+	}
+
+	/* init sub_dais */
+	INIT_LIST_HEAD(&afe->sub_dais);
+
+	ret = devm_request_irq(dev, irq_id, an7581_afe_irq_handler,
+			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request irq for asys-isr\n");
+
+	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
+		ret = dai_register_cbs[i](afe);
+		if (ret)
+			return dev_err_probe(dev, ret, "DAI register failed, i: %d\n", i);
+	}
+
+	/* init dai_driver and component_driver */
+	ret = mtk_afe_combine_sub_dai(afe);
+	if (ret)
+		return dev_err_probe(dev, ret, "mtk_afe_combine_sub_dai fail\n");
+
+	afe->mtk_afe_hardware = &an7581_afe_hardware;
+	afe->memif_fs = an7581_memif_irq_fs;
+	afe->irq_fs = an7581_memif_irq_fs;
+
+	/* register component */
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &mtk_afe_pcm_platform,
+					      NULL, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register AFE component\n");
+
+	ret = devm_snd_soc_register_component(afe->dev,
+					      &an7581_afe_pcm_dai_component,
+					      afe->dai_drivers,
+					      afe->num_dai_drivers);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register PCM DAI component\n");
+
+	return 0;
+}
+
+static const struct of_device_id an7581_afe_pcm_dt_match[] = {
+	{ .compatible = "airoha,an7581-afe" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an7581_afe_pcm_dt_match);
+
+static struct platform_driver an7581_afe_pcm_driver = {
+	.driver = {
+		   .name = "an7581-audio",
+		   .of_match_table = an7581_afe_pcm_dt_match,
+	},
+	.probe = an7581_afe_pcm_dev_probe,
+};
+module_platform_driver(an7581_afe_pcm_driver);
+
+MODULE_DESCRIPTION("Airoha SoC AFE platform driver for ALSA AN7581");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/mediatek/an7581/an7581-dai-etdm.c b/sound/soc/mediatek/an7581/an7581-dai-etdm.c
new file mode 100644
index 000000000000..7fbfd8fe1836
--- /dev/null
+++ b/sound/soc/mediatek/an7581/an7581-dai-etdm.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Airoha ALSA SoC Audio DAI eTDM Control
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include "an7581-afe-common.h"
+#include "an7581-reg.h"
+
+#define HOPPING_CLK  0
+#define APLL_CLK     1
+#define MTK_DAI_ETDM_FORMAT_I2S   0
+#define MTK_DAI_ETDM_FORMAT_DSPA  4
+#define MTK_DAI_ETDM_FORMAT_DSPB  5
+
+enum {
+	MTK_ETDM_RATE_8K = 0,
+	MTK_ETDM_RATE_12K = 1,
+	MTK_ETDM_RATE_16K = 2,
+	MTK_ETDM_RATE_24K = 3,
+	MTK_ETDM_RATE_32K = 4,
+	MTK_ETDM_RATE_48K = 5,
+	MTK_ETDM_RATE_96K = 6,
+	MTK_ETDM_RATE_192K = 7,
+	MTK_ETDM_RATE_384K = 8,
+	MTK_ETDM_RATE_7K = 16,
+	MTK_ETDM_RATE_11K = 17,
+	MTK_ETDM_RATE_14K = 18,
+	MTK_ETDM_RATE_22K = 19,
+	MTK_ETDM_RATE_29K = 20,
+	MTK_ETDM_RATE_44K = 21,
+	MTK_ETDM_RATE_88K = 22,
+	MTK_ETDM_RATE_176K = 23,
+	MTK_ETDM_RATE_352K = 24,
+};
+
+struct mtk_dai_etdm_priv {
+	bool bck_inv;
+	bool lrck_inv;
+	bool slave_mode;
+	unsigned int format;
+};
+
+static unsigned int an7581_etdm_rate_transform(struct device *dev, unsigned int rate)
+{
+	switch (rate) {
+	case 7350:
+		return MTK_ETDM_RATE_7K;
+	case 8000:
+		return MTK_ETDM_RATE_8K;
+	case 11025:
+		return MTK_ETDM_RATE_11K;
+	case 12000:
+		return MTK_ETDM_RATE_12K;
+	case 14700:
+		return MTK_ETDM_RATE_14K;
+	case 16000:
+		return MTK_ETDM_RATE_16K;
+	case 22050:
+		return MTK_ETDM_RATE_22K;
+	case 24000:
+		return MTK_ETDM_RATE_24K;
+	case 29400:
+		return MTK_ETDM_RATE_29K;
+	case 32000:
+		return MTK_ETDM_RATE_32K;
+	case 44100:
+		return MTK_ETDM_RATE_44K;
+	case 48000:
+		return MTK_ETDM_RATE_48K;
+	case 88200:
+		return MTK_ETDM_RATE_88K;
+	case 96000:
+		return MTK_ETDM_RATE_96K;
+	case 176400:
+		return MTK_ETDM_RATE_176K;
+	case 192000:
+		return MTK_ETDM_RATE_192K;
+	case 352800:
+		return MTK_ETDM_RATE_352K;
+	case 384000:
+		return MTK_ETDM_RATE_384K;
+	default:
+		dev_warn_ratelimited(dev, "%s(), rate %u invalid, using %d!\n",
+				     __func__, rate, MTK_ETDM_RATE_48K);
+		return MTK_ETDM_RATE_48K;
+	}
+}
+
+static int get_etdm_wlen(unsigned int bitwidth)
+{
+	return bitwidth <= 16 ? 16 : 32;
+}
+
+static const struct snd_soc_dapm_widget mtk_dai_etdm_widgets[] = {
+	/* DL */
+	SND_SOC_DAPM_MIXER("I150", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("I151", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	/* UL */
+	SND_SOC_DAPM_MIXER("O124", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("O125", SND_SOC_NOPM, 0, 0, NULL, 0),
+};
+
+static const struct snd_soc_dapm_route mtk_dai_etdm_routes[] = {
+	{"I150", NULL, "ETDM Capture"},
+	{"I151", NULL, "ETDM Capture"},
+	{"ETDM Playback", NULL, "O124"},
+	{"ETDM Playback", NULL, "O125"},
+	{"O124", NULL, "I032"},
+	{"O125", NULL, "I033"},
+};
+
+/* dai ops */
+static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct an7581_afe_private *afe_priv = afe->platform_priv;
+
+	guard(mutex)(&afe_priv->user_lock);
+
+	if (!afe_priv->users)
+		regmap_set_bits(afe->regmap, AFE_DAC_CON0,
+				BIT(AFE_AFE_ENABLE_SHIFT));
+	afe_priv->users++;
+
+	return 0;
+}
+
+static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct an7581_afe_private *afe_priv = afe->platform_priv;
+
+	guard(mutex)(&afe_priv->user_lock);
+
+	afe_priv->users--;
+	if (!afe_priv->users)
+		regmap_clear_bits(afe->regmap, AFE_DAC_CON0,
+				  BIT(AFE_AFE_ENABLE_SHIFT));
+}
+
+static unsigned int get_etdm_ch_fixup(unsigned int channels)
+{
+	if (channels > 16)
+		return 24;
+
+	if (channels > 8)
+		return 16;
+
+	if (channels > 4)
+		return 8;
+
+	if (channels > 2)
+		return 4;
+
+	return 2;
+}
+
+static int mtk_dai_etdm_config(struct mtk_base_afe *afe,
+			       struct snd_pcm_hw_params *params,
+			       struct snd_soc_dai *dai,
+			       int stream)
+{
+	struct an7581_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_etdm_priv *etdm_data = afe_priv->dai_priv[dai->id];
+	unsigned int rate = params_rate(params);
+	unsigned int etdm_rate = an7581_etdm_rate_transform(afe->dev, rate);
+	unsigned int bit_width = params_width(params);
+	unsigned int mask, mask1;
+	unsigned int val, val1;
+
+	dev_dbg(afe->dev, "%s(), stream %d, rate %u, bitwidth %u\n",
+		__func__, stream, rate, params_width(params));
+
+	/* CON0 */
+	mask = ETDM_SLAVE_MODE | ETDM_BIT_LEN | ETDM_WRD_LEN |
+	       ETDM_FMT | ETDM_CH_NUM;
+	val = FIELD_PREP(ETDM_BIT_LEN, params_width(params) - 1) |
+	      FIELD_PREP(ETDM_WRD_LEN, get_etdm_wlen(bit_width) - 1) |
+	      FIELD_PREP(ETDM_FMT, etdm_data->format) |
+	      FIELD_PREP(ETDM_CH_NUM,
+			 get_etdm_ch_fixup(params_channels(params)) - 1);
+	if (etdm_data->slave_mode)
+		val |= ETDM_SLAVE_MODE;
+
+	/* CON1 */
+	mask1 = EDTM_LRCK_AUTO_MODE | EDTM_CKEN_SEL | EDTM_LRCK_AUTO_OFF |
+		 EDTM_INITIAL_POINT | EDTM_INITIAL_COUNT;
+	val1 = EDTM_LRCK_AUTO_MODE | EDTM_CKEN_SEL | EDTM_LRCK_AUTO_OFF |
+		FIELD_PREP(EDTM_INITIAL_POINT, 14) | FIELD_PREP(EDTM_INITIAL_COUNT, 14);
+
+	switch (stream) {
+	case SNDRV_PCM_STREAM_PLAYBACK:
+		regmap_update_bits(afe->regmap, ETDM_OUT1_CON0, mask, val);
+
+		mask1 |= EDTM_DIRECT_INPUT_MASTER_BCK;
+		val1 |= EDTM_DIRECT_INPUT_MASTER_BCK;
+
+		regmap_update_bits(afe->regmap, ETDM_OUT1_CON1, mask1, val1);
+
+		regmap_update_bits(afe->regmap, ETDM_OUT1_CON4, OUT_SEL_FS,
+				   FIELD_PREP(OUT_SEL_FS, etdm_rate));
+
+		regmap_update_bits(afe->irqs[AN7581_IRQ_0].regmap,
+				   afe->irqs[AN7581_IRQ_0].irq_data->irq_en_reg,
+				   AFE_IRQ_EN_SEL, AFE_IRQ_EN_SEL_I2SOUT);
+		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		regmap_update_bits(afe->regmap, ETDM_IN1_CON0, mask, val);
+
+		regmap_update_bits(afe->regmap, ETDM_IN1_CON1, mask1, val1);
+
+		regmap_update_bits(afe->regmap, ETDM_IN1_CON3, IN_SEL_FS,
+				   FIELD_PREP(IN_SEL_FS, etdm_rate));
+
+		regmap_update_bits(afe->irqs[AN7581_IRQ_1].regmap,
+				   afe->irqs[AN7581_IRQ_1].irq_data->irq_en_reg,
+				   AFE_IRQ_EN_SEL, AFE_IRQ_EN_SEL_I2SIN);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mtk_dai_etdm_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	unsigned int rate = params_rate(params);
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	regmap_update_bits(afe->regmap, ETDM_COWORK_CON0,
+			   EDTM_IN1_SLAVE_SEL,
+			   EDTM_IN1_SLAVE_FROM_ETDMIN1_SLAVE);
+	regmap_update_bits(afe->regmap, ETDM_COWORK_CON0,
+			   EDTM_OUT1_SLAVE_SEL,
+			   EDTM_OUT1_SLAVE_FROM_ETDMOUT1_SLAVE);
+	regmap_update_bits(afe->regmap, ETDM_COWORK_CON1,
+			   EDTM_IN1_SDATA0_SEL,
+			   EDTM_IN1_SDATA0_FROM_PAD);
+
+	switch (rate) {
+	case 7350:
+	case 8000:
+	case 11025:
+	case 12000:
+	case 14700:
+	case 16000:
+	case 22050:
+	case 24000:
+	case 29400:
+	case 32000:
+	case 44100:
+	case 48000:
+	case 88200:
+	case 96000:
+	case 176400:
+	case 192000:
+	case 352800:
+	case 384000:
+		return mtk_dai_etdm_config(afe, params, dai, substream->stream);
+	default:
+		dev_err(afe->dev, "Sample rate %d invalid\n", rate);
+		return -EINVAL;
+	}
+}
+
+static int mtk_dai_etdm_trigger(struct snd_pcm_substream *substream, int cmd,
+				struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	dev_dbg(afe->dev, "%s(), cmd %d, dai id %d\n", __func__, cmd, dai->id);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			regmap_set_bits(afe->regmap, ETDM_OUT1_CON0,
+					ETDM_OUT_EN);
+
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			regmap_set_bits(afe->regmap, ETDM_IN1_CON0,
+					ETDM_IN_EN);
+
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			regmap_clear_bits(afe->regmap, ETDM_OUT1_CON0,
+					  ETDM_OUT_EN);
+
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			regmap_clear_bits(afe->regmap, ETDM_IN1_CON0,
+					  ETDM_IN_EN);
+
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mtk_dai_etdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct an7581_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_dai_etdm_priv *etdm_data;
+	void *priv_data;
+
+	priv_data = devm_kzalloc(afe->dev, sizeof(struct mtk_dai_etdm_priv),
+				 GFP_KERNEL);
+	if (!priv_data)
+		return -ENOMEM;
+
+	afe_priv->dai_priv[dai->id] = priv_data;
+	etdm_data = afe_priv->dai_priv[dai->id];
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		etdm_data->format = MTK_DAI_ETDM_FORMAT_I2S;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		etdm_data->format = MTK_DAI_ETDM_FORMAT_DSPA;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		etdm_data->format = MTK_DAI_ETDM_FORMAT_DSPB;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		etdm_data->bck_inv = false;
+		etdm_data->lrck_inv = false;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		etdm_data->bck_inv = false;
+		etdm_data->lrck_inv = true;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		etdm_data->bck_inv = true;
+		etdm_data->lrck_inv = false;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		etdm_data->bck_inv = true;
+		etdm_data->lrck_inv = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
+		etdm_data->slave_mode = false;
+		break;
+	case SND_SOC_DAIFMT_BC_FC:
+		etdm_data->slave_mode = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
+	.startup = mtk_dai_etdm_startup,
+	.shutdown = mtk_dai_etdm_shutdown,
+	.hw_params = mtk_dai_etdm_hw_params,
+	.trigger = mtk_dai_etdm_trigger,
+	.set_fmt = mtk_dai_etdm_set_fmt,
+};
+
+/* dai driver */
+#define MTK_ETDM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			  SNDRV_PCM_FMTBIT_S24_LE |\
+			  SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
+	{
+		.name = "ETDM",
+		.id = AN7581_DAI_ETDM,
+		.capture = {
+			.stream_name = "ETDM Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = MTK_ETDM_FORMATS,
+		},
+		.playback = {
+			.stream_name = "ETDM Playback",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = MTK_ETDM_FORMATS,
+		},
+		.ops = &mtk_dai_etdm_ops,
+		.symmetric_rate = 1,
+		.symmetric_sample_bits = 1,
+	},
+};
+
+int an7581_dai_etdm_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_etdm_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_etdm_driver);
+
+	dai->dapm_widgets = mtk_dai_etdm_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_etdm_widgets);
+	dai->dapm_routes = mtk_dai_etdm_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_etdm_routes);
+
+	return 0;
+}
diff --git a/sound/soc/mediatek/an7581/an7581-reg.h b/sound/soc/mediatek/an7581/an7581-reg.h
new file mode 100644
index 000000000000..a6ada3ca97ab
--- /dev/null
+++ b/sound/soc/mediatek/an7581/an7581-reg.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * an7581-reg.h  --  Airoha AN7581 audio driver reg definition
+ */
+
+#ifndef _AN7581_REG_H_
+#define _AN7581_REG_H_
+
+#define AFE_DAC_CON0			0x0
+#define   AFE_DL1_ENABLE_SHIFT		17
+#define   AFE_UL1_ENABLE_SHIFT		1
+#define   AFE_AFE_ENABLE_SHIFT		0
+
+#define ETDM_COWORK_CON0		0x4c
+#define   EDTM_IN1_SLAVE_SEL		GENMASK(27, 24)
+#define     EDTM_IN1_SLAVE_FROM_ETDMIN1_SLAVE FIELD_PREP_CONST(EDTM_IN1_SLAVE_SEL, 0x1)
+#define     EDTM_IN1_SLAVE_FROM_ETDMIN2_MASTER FIELD_PREP_CONST(EDTM_IN1_SLAVE_SEL, 0x2)
+#define     EDTM_IN1_SLAVE_FROM_ETDMIN2_SLAVE FIELD_PREP_CONST(EDTM_IN1_SLAVE_SEL, 0x3)
+#define     EDTM_IN1_SLAVE_FROM_ETDMOUT1_MASTER FIELD_PREP_CONST(EDTM_IN1_SLAVE_SEL, 0x8)
+#define     EDTM_IN1_SLAVE_FROM_ETDMOUT1_SLAVE FIELD_PREP_CONST(EDTM_IN1_SLAVE_SEL, 0x9)
+#define     EDTM_IN1_SLAVE_FROM_ETDMOUT2_MASTER FIELD_PREP_CONST(EDTM_IN1_SLAVE_SEL, 0xa)
+#define     EDTM_IN1_SLAVE_FROM_ETDMOUT2_SLAVE FIELD_PREP_CONST(EDTM_IN1_SLAVE_SEL, 0xb)
+#define   EDTM_OUT1_SLAVE_SEL		GENMASK(11, 8)
+#define     EDTM_OUT1_SLAVE_FROM_ETDMIN1_MASTER FIELD_PREP_CONST(EDTM_OUT1_SLAVE_SEL, 0x0)
+#define     EDTM_OUT1_SLAVE_FROM_ETDMIN1_SLAVE FIELD_PREP_CONST(EDTM_OUT1_SLAVE_SEL, 0x1)
+#define     EDTM_OUT1_SLAVE_FROM_ETDMIN2_MASTER FIELD_PREP_CONST(EDTM_OUT1_SLAVE_SEL, 0x2)
+#define     EDTM_OUT1_SLAVE_FROM_ETDMIN2_SLAVE FIELD_PREP_CONST(EDTM_OUT1_SLAVE_SEL, 0x3)
+#define     EDTM_OUT1_SLAVE_FROM_ETDMOUT1_SLAVE FIELD_PREP_CONST(EDTM_OUT1_SLAVE_SEL, 0x9)
+#define     EDTM_OUT1_SLAVE_FROM_ETDMOUT2_MASTER FIELD_PREP_CONST(EDTM_OUT1_SLAVE_SEL, 0xa)
+#define     EDTM_OUT1_SLAVE_FROM_ETDMOUT2_SLAVE FIELD_PREP_CONST(EDTM_OUT1_SLAVE_SEL, 0xb)
+#define ETDM_COWORK_CON1		0x50
+#define   EDTM_IN1_SDATA0_SEL		GENMASK(3, 0)
+#define     EDTM_IN1_SDATA0_FROM_PAD FIELD_PREP_CONST(EDTM_IN1_SDATA0_SEL, 0x0)
+#define     EDTM_IN1_SDATA0_FROM_ETDMIN2 FIELD_PREP_CONST(EDTM_IN1_SDATA0_SEL, 0x2)
+#define     EDTM_IN1_SDATA0_FROM_ETDMOUT1 FIELD_PREP_CONST(EDTM_IN1_SDATA0_SEL, 0x8)
+#define     EDTM_IN1_SDATA0_FROM_ETDMOUT2 FIELD_PREP_CONST(EDTM_IN1_SDATA0_SEL, 0xa)
+#define ETDM_IN1_CON0			0x5c
+#define   ETDM_CH_NUM			GENMASK(26, 23)
+#define   ETDM_WRD_LEN			GENMASK(20, 16)
+#define   ETDM_BIT_LEN			GENMASK(15, 11)
+#define   ETDM_FMT			GENMASK(8, 6)
+#define   ETDM_SLAVE_MODE		BIT(5)
+#define   ETDM_IN_EN			BIT(0)
+#define ETDM_IN1_CON1			0x60
+#define   EDTM_LRCK_AUTO_MODE		BIT(29)
+#define   EDTM_DIRECT_INPUT_MASTER_BCK	BIT(30)
+#define   EDTM_CKEN_SEL			BIT(12)
+#define   EDTM_LRCK_AUTO_OFF		BIT(10)
+#define   EDTM_INITIAL_POINT		GENMASK(9, 5)
+#define   EDTM_INITIAL_COUNT		GENMASK(4, 0)
+#define ETDM_IN1_CON2			0x64
+#define   IN_CLK_SRC			GENMASK(12, 10)
+#define ETDM_IN1_CON3			0x68
+#define   IN_SEL_FS			GENMASK(30, 26)
+#define ETDM_IN1_CON4			0x6c
+#define   IN_RELATCH			GENMASK(24, 20)
+#define   IN_CLK_INV			BIT(18)
+#define ETDM_IN1_CON5			0x70
+#define ETDM_IN1_CON6			0x74
+#define ETDM_OUT1_CON0			0x7c
+#define   ETDM_SYNC_MODE		BIT(1)
+#define   ETDM_OUT_EN			BIT(0)
+#define ETDM_OUT1_CON1			0x80
+#define ETDM_OUT1_CON2			0x84
+#define ETDM_OUT1_CON3			0x88
+#define ETDM_OUT1_CON4			0x8c
+#define   OUT_RELATCH			GENMASK(28, 24)
+#define   OUT_CLK_SRC			GENMASK(8, 6)
+#define   OUT_SEL_FS			GENMASK(4, 0)
+#define ETDM_OUT1_CON5			0x90
+#define   ETDM_CLK_DIV			BIT(12)
+#define   OUT_CLK_INV			BIT(9)
+#define ETDM_OUT1_CON6			0x94
+#define ETDM_OUT1_CON7			0x98
+
+#define AFE_DL1_BASE			0xa8
+#define AFE_DL1_END			0xb0
+#define AFE_DL1_CUR			0xac
+#define AFE_DL1_CON0			0xb4
+#define   AFE_PBUF_SIZE_SHIFT		16
+#define   AFE_PBUF_SIZE_MASK		GENMASK(1, 0)
+#define   AFE_MINLEN_SHIFT		8
+#define   AFE_MINLEN_MASK		GENMASK(3, 0)
+#define   AFE_HD_SHIFT			5
+
+#define AFE_UL1_BASE			0xc4
+#define AFE_UL1_END			0xc8
+#define AFE_UL1_CUR			0xcc
+#define AFE_UL1_CON0			0xd0
+#define   AFE_HD_ALIGN_SHIFT		6
+
+#define AFE_IRQ_CON0			0xe4
+#define   AFE_IRQ_EN_SEL		BIT(4)
+#define   AFE_IRQ_EN_SEL_I2SIN		FIELD_PREP_CONST(AFE_IRQ_EN_SEL, 0x0)
+#define   AFE_IRQ_EN_SEL_I2SOUT		FIELD_PREP_CONST(AFE_IRQ_EN_SEL, 0x1)
+#define   AFE_IRQ_MISS_FLG_CLR_SHIFT	3
+#define   AFE_IRQ_CLR_SHIFT		2
+#define   AFE_IRQ_ON_SHIFT		0
+#define AFE_IRQ_CNT			0xe8
+#define   AFE_IRQ_CNT_SHIFT		0
+#define   AFE_IRQ_CNT_MASK		GENMASK(31, 0)
+
+#define AFE_IRQ_STS			0xf8
+#define  AFE_IRQ_STS_PLAY		BIT(1)
+#define  AFE_IRQ_STS_RECORD		BIT(0)
+
+#define AFE_MAX_REGISTER		AFE_IRQ_STS
+
+#define AFE_IRQ1_CON0			0x0
+#define AFE_IRQ1_CNT			0x4
+
+#define AFE_IRQ1_MAX_REGISTER		AFE_IRQ1_CNT
+
+#endif
-- 
2.53.0


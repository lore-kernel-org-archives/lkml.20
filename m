Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5DC35C696
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815528; cv=none; b=Il6nX6gKQWlz4jnWNHFvGQu3Nl8rLypBvqC3fP2Sq1qhI3uskd9q4XZmWSltfUNavSz20rT+5t93HkAdfmDYXbjErI4eHtLwYRQhzHc73LjaYy2iIrw8DmmhB8aJ69i3JbhO4z//b7kFARxYUlMoR9aC4BYQn2L3yHaNe+CK4yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815528; c=relaxed/simple;
	bh=ZzZ9aBiOZceiJMfN/t/U/EDJ8n1M9J5LenpGJ0XDra4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEcfh7wUlRSAAq+lEZd4tLA0zAY+Q0rvOODsjYLRac89LoClgqMHaOuwJ8rOLJlCms/T9Wjs/v6OfVkmlkyA0cURIQZsQKbl7cI3lj1qrQhGYPpiHzHv6e4BFUmWtVHf6yu2Ie/i5mWw4H6zoKx0H8DJ4COUW/D0BdKMTlO1gkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSyozFEz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSyozFEz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1388500f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815523; x=1788420323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7OpcRAneG/1dJTHO5Z7g6Oc3pH9Zsv+TEoBFPqsd3Ts=;
        b=aSyozFEzj83UneIZBR34klC37b/VVmnT1KkWkNy+Id3lETdx2vPxc8/xDyDHaL5ZDc
         oOZqdoRdNbx98pCWWt5lhO9O/5qqxWyoTbMsv6LpQg0ESyCjybD7GDXIiercEQXMFQTy
         SJOScMj5lry1l/b2sie2Yk0wIaLmgE/licR8LhuG86cCubtBRtknORFVq1BcYqKGneGp
         0FxbpGMxtHqxZmb+pIQlY2iRzZXDCGBOtpT8QBtrsBl72JjUbyY+/VKMv+R2Ebs5HOhe
         FMQ45AQBKMufS0C+zFi9HtRwhVKCrIk3DvJ0EVrn49xG72nUsa9kL6d4G/oQ4tIKoLL9
         Yk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815523; x=1788420323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7OpcRAneG/1dJTHO5Z7g6Oc3pH9Zsv+TEoBFPqsd3Ts=;
        b=DUqdc5K3ugCI9A284ftL4Ax/1AvIeuF4QRzmeYzu2NyNgiYiM1d+KVGc4OF7URCqwJ
         ouZym3ajilSOdcRpmVT5GtERqfLtSnBk5fmaQYsmm2mn6mi9zEasS7tnblDPv2z6W0dE
         pKyrDWf9L7eRDJge6hJZ5m9zSfjKYz3+2UpxUVBE3jHBJijJtKJCZtLTiIv9BGfDxUVW
         In50ol9B37qskBBHGjAsihuBw75kyJJcPUoK5YCvGonBFcKP9d2782wvaa2hfbg34qRh
         OFQrIVCXY9x16Bnp2vT0UIWzFEwbZ6cazSzS0hHRKTp7ExVsJLBih/yx85bq9lTYHMDC
         iTXw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1cohfA1/xCExNQclHmiU+5n4egZ+Uc1WDt/FRxD18ZKLJYcoXo6zyTjqI+iV6EhofMF6WC9oxD5/BiYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kIn3Ojez2DJ551Xm+BQsI7fr27NMV2IDRf0eSI11Wzt5GYBKrU
	s+urT1FFjzBOaz1G0AYbahhAMNK+NLL/qrB78ym+8E2cgTT8NboJCjBW
X-Gm-Gg: AR+sD12KnzJb/Ywsh5wtVVEFxspTr0bFfOXvDE8XbP4S7zjaYFcNNx7VXYJvOtT387L
	lhUB9XU0PWpTXY1eYwCpNAlgFK9Vji4KbEv5MMojeXz+PlgB5LwAalZfIAvnM3HzDucsoT7fb4B
	mEv6mYr7694OtD5gexd3quNhVheQyMTdeoVUFh2O6FYRTkD/rTG8mnlB6TnICg+DV0J/DF1Yyd+
	zwwGO959TK8dfc5pEhdXSBQ5iTXj8XYHqp1rgeIH3cZDRSoVSNX0fRnZsqMfxiXvaufKfwn1c+K
	oF8j1zBWReQ9tanICebqeY4zZxddmPtJJG7gnsuVaGs5zLDrMW/Q1INgGATCMHRN1wxg3icAtu9
	EB9WsoXYRAxZVjEHK0mMY382+2p69hQYyKK7sAl7l/PtM4UCHJQRigx+uZXQBE/dN1x7O3Mlbi9
	+wpuFhpeYSVSCTiStuP70X3B3I2pPHw4VjLW/mBQ16KG8npexX1YeNvcj4DsneGupdDZ64mNw5b
	LxiYJsZVCqrLim43zp1wnd4mZbjgceeIMKyuGAOwsFI
X-Received: by 2002:a05:600c:8b85:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-499dc6a2cbfmr130173265e9.0.1787815522528;
        Thu, 27 Aug 2026 00:25:22 -0700 (PDT)
Received: from 1Z10 ([78.211.107.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbe1dsm7270686f8f.22.2026.08.27.00.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:25:22 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 1/2] ASoC: Intel: Add Cherry Trail RT5677 machine driver
Date: Thu, 27 Aug 2026 09:25:16 +0200
Message-ID: <20260827072517.1401173-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
References: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91F/L uses the Cherry Trail SSP2 link with
an RT5677 codec and a TS3A227E headset detector. Its amplifiers and
headphone path also need board-specific GPIO sequencing.

Add a Cherry Trail RT5677 machine driver derived from Yauhen
Kharuzhy's GPL-2.0 implementation. Clone the card, DAI links and link
components per device so probing never mutates global templates, and
allocate jack storage with the device lifetime. Support SST and SOF
parent naming, MCLK and PLL setup, jack buttons, microphones, and output
controls.

Link: https://github.com/jekhor/yogabook-linux-kernel/commit/4e41d0ff72c1d1fd8d5c59dda247e4ca8a1da999

Link: https://lore.kernel.org/linux-sound/20260611-asoc-yogabook-v2-v3-3-3128447b67b6@gmail.com/

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>

Assisted-by: Codex:gpt-5.6-sol sparse
---
 sound/soc/intel/boards/Kconfig      |  14 +
 sound/soc/intel/boards/Makefile     |   2 +
 sound/soc/intel/boards/cht_rt5677.c | 611 ++++++++++++++++++++++++++++
 3 files changed, 627 insertions(+)
 create mode 100644 sound/soc/intel/boards/cht_rt5677.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index cddbd2aa424e..33b2b409f150 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -161,6 +161,20 @@ config SND_SOC_INTEL_CHT_BSW_RT5672_MACH
 	  Say Y or m if you have such a device. This is a recommended option.
 	  If unsure select "N".
 
+config SND_SOC_INTEL_CHT_RT5677_MACH
+	tristate "Cherrytrail with RT5677 codec"
+	depends on I2C && ACPI
+	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
+	select SND_SOC_ACPI
+	select SND_SOC_RT5677
+	select SND_SOC_TS3A227E
+	help
+	  This adds support for Cherry Trail platforms with an RT5677 codec
+	  and TS3A227E headset-jack detector. It currently supports the
+	  Lenovo Yoga Book YB1-X91F/L.
+	  Say Y or m if you have such a device. If unsure select "N".
+
 config SND_SOC_INTEL_CHT_BSW_RT5645_MACH
 	tristate "Cherrytrail & Braswell with RT5645/5650 codec"
 	depends on I2C && ACPI
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 25a1a9066cbf..28940ca02aa7 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -9,6 +9,7 @@ snd-soc-sst-bytcr-rt5640-y := bytcr_rt5640.o
 snd-soc-sst-bytcr-rt5651-y := bytcr_rt5651.o
 snd-soc-sst-bytcr-wm5102-y := bytcr_wm5102.o
 snd-soc-sst-cht-bsw-rt5672-y := cht_bsw_rt5672.o
+snd-soc-sst-cht-rt5677-y := cht_rt5677.o
 snd-soc-sst-cht-bsw-rt5645-y := cht_bsw_rt5645.o
 snd-soc-sst-cht-bsw-max98090_ti-y := cht_bsw_max98090_ti.o
 snd-soc-sst-cht-bsw-nau8824-y := cht_bsw_nau8824.o
@@ -41,6 +42,7 @@ obj-$(CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH) += snd-soc-sst-bytcr-rt5640.o
 obj-$(CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH) += snd-soc-sst-bytcr-rt5651.o
 obj-$(CONFIG_SND_SOC_INTEL_BYTCR_WM5102_MACH) += snd-soc-sst-bytcr-wm5102.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_RT5672_MACH) += snd-soc-sst-cht-bsw-rt5672.o
+obj-$(CONFIG_SND_SOC_INTEL_CHT_RT5677_MACH) += snd-soc-sst-cht-rt5677.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_RT5645_MACH) += snd-soc-sst-cht-bsw-rt5645.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH) += snd-soc-sst-cht-bsw-max98090_ti.o
 obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_NAU8824_MACH) += snd-soc-sst-cht-bsw-nau8824.o
diff --git a/sound/soc/intel/boards/cht_rt5677.c b/sound/soc/intel/boards/cht_rt5677.c
new file mode 100644
index 000000000000..da39d4cb62f1
--- /dev/null
+++ b/sound/soc/intel/boards/cht_rt5677.c
@@ -0,0 +1,611 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  cht_rt5677.c - ASoC machine driver for Cherry Trail with RT5677
+ *
+ *  Copyright (C) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
+ *
+ *  Based on the mainline cht_bsw_rt5672.c driver and Lenovo's
+ *  cht_bl_dpcm_rt5677.c Android driver.
+ */
+
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "../../codecs/rt5677.h"
+#include "../../codecs/ts3a227e.h"
+#include "../atom/sst-atom-controls.h"
+
+#define RT5677_I2C	"i2c-rt5677"
+
+/* Platform clock 3 provides the codec's 19.2 MHz I2S master clock. */
+#define CHT_PLAT_CLK_3_HZ	19200000
+#define CHT_CODEC_DAI	"rt5677-aif1"
+
+struct cht_rt5677_private {
+	char codec_name[SND_ACPI_I2C_ID_LEN];
+	struct clk *mclk;
+	struct gpio_desc *gpio_spk_en1;
+	struct gpio_desc *gpio_spk_en2;
+	struct gpio_desc *gpio_hp_en;
+};
+
+static int cht_rt5677_platform_clock_enable(struct snd_soc_card *card,
+					    struct snd_soc_dai *codec_dai)
+{
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	ret = clk_prepare_enable(ctx->mclk);
+	if (ret) {
+		dev_err(card->dev, "enabling MCLK failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5677_PLL1_S_MCLK,
+				  CHT_PLAT_CLK_3_HZ, 48000 * 512);
+	if (ret) {
+		dev_err(card->dev, "setting codec PLL failed: %d\n", ret);
+		goto disable_mclk;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1,
+				     48000 * 512, SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(card->dev, "setting codec sysclk failed: %d\n", ret);
+		goto disable_mclk;
+	}
+
+	return 0;
+
+disable_mclk:
+	clk_disable_unprepare(ctx->mclk);
+	return ret;
+}
+
+static void cht_rt5677_platform_clock_disable(struct snd_soc_card *card,
+					      struct snd_soc_dai *codec_dai)
+{
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_RCCLK,
+				     48000 * 512, SND_SOC_CLOCK_IN);
+	if (ret)
+		dev_warn(card->dev, "setting codec idle sysclk failed: %d\n", ret);
+
+	clk_disable_unprepare(ctx->mclk);
+}
+
+static int cht_rt5677_platform_clock_control(struct snd_soc_dapm_widget *w,
+					     struct snd_kcontrol *kctl,
+					     int event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct snd_soc_dai *codec_dai;
+
+	codec_dai = snd_soc_card_get_codec_dai(card, CHT_CODEC_DAI);
+	if (!codec_dai) {
+		dev_err(card->dev, "codec DAI not found\n");
+		return -EIO;
+	}
+
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		return cht_rt5677_platform_clock_enable(card, codec_dai);
+
+	cht_rt5677_platform_clock_disable(card, codec_dai);
+
+	return 0;
+}
+
+static int cht_rt5677_hp_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kctl, int event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
+
+	gpiod_set_value_cansleep(ctx->gpio_hp_en, SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+static int cht_rt5677_spk_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kctl, int event)
+{
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
+
+	gpiod_set_value_cansleep(ctx->gpio_spk_en1, SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value_cansleep(ctx->gpio_spk_en2, SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget cht_rt5677_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", cht_rt5677_hp_event),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+	SND_SOC_DAPM_SPK("Speaker", cht_rt5677_spk_event),
+	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
+			    cht_rt5677_platform_clock_control,
+			    SND_SOC_DAPM_PRE_PMU |
+			    SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route cht_rt5677_map[] = {
+	{"IN1P", NULL, "Headset Mic"},
+	{"IN1N", NULL, "Headset Mic"},
+	{"DMIC L1", NULL, "Int Mic"},
+	{"DMIC R1", NULL, "Int Mic"},
+	{"Headphone", NULL, "LOUT1"},
+	{"Headphone", NULL, "LOUT2"},
+	{"Speaker", NULL, "LOUT1"},
+	{"Speaker", NULL, "LOUT2"},
+
+	{"AIF1 Playback", NULL, "ssp2 Tx"},
+	{"ssp2 Tx", NULL, "codec_out0"},
+	{"ssp2 Tx", NULL, "codec_out1"},
+	{"codec_in0", NULL, "ssp2 Rx"},
+	{"codec_in1", NULL, "ssp2 Rx"},
+	{"ssp2 Rx", NULL, "AIF1 Capture"},
+	{"Headphone", NULL, "Platform Clock"},
+	{"Speaker", NULL, "Platform Clock"},
+	{"Headset Mic", NULL, "Platform Clock"},
+	{"Int Mic", NULL, "Platform Clock"},
+};
+
+static const struct snd_kcontrol_new cht_rt5677_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static int cht_rt5677_aif1_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	int ret;
+
+	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5677_PLL1_S_MCLK,
+				  CHT_PLAT_CLK_3_HZ, params_rate(params) * 512);
+	if (ret) {
+		dev_err(rtd->dev, "setting codec PLL failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1,
+				     params_rate(params) * 512,
+				     SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(rtd->dev, "setting codec sysclk failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_fmt(codec_dai,
+				  SND_SOC_DAIFMT_DSP_B |
+				  SND_SOC_DAIFMT_IB_NF |
+				  SND_SOC_DAIFMT_CBC_CFC);
+	if (ret) {
+		dev_err(codec_dai->dev, "setting TDM format failed: %d\n", ret);
+		return ret;
+	}
+
+	/* Four 25-bit DSP_B slots carry 24-bit samples; the codec uses slots 0 and 1. */
+	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 0x3, 4, 25);
+	if (ret) {
+		dev_err(rtd->dev, "setting codec TDM slots failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int cht_rt5677_codec_init(struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(runtime->card);
+	int ret;
+
+	/*
+	 * The codec derives its asynchronous sample-rate conversion clocks from
+	 * I2S1 while the SSP link runs from the Cherry Trail platform clock.
+	 */
+	rt5677_sel_asrc_clk_src(component, RT5677_DA_STEREO_FILTER |
+					    RT5677_AD_STEREO1_FILTER |
+					    RT5677_I2S1_SOURCE,
+				     RT5677_CLK_SEL_I2S1_ASRC);
+
+	/* Mono ADC L uses the codec system clock rather than the I2S1 clock. */
+	rt5677_sel_asrc_clk_src(component, RT5677_AD_MONO_L_FILTER, RT5677_CLK_SEL_SYS2);
+
+	/* Firmware may leave MCLK enabled without updating the CCF count. */
+	ret = clk_prepare_enable(ctx->mclk);
+	if (ret) {
+		dev_err(runtime->dev, "preparing MCLK failed: %d\n", ret);
+		return ret;
+	}
+	clk_disable_unprepare(ctx->mclk);
+
+	ret = clk_set_rate(ctx->mclk, CHT_PLAT_CLK_3_HZ);
+	if (ret) {
+		dev_err(runtime->dev, "setting MCLK rate failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int cht_rt5677_codec_fixup(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate = hw_param_interval(params,
+			SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+						SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	/* The DSP will convert the FE rate to 48k, stereo, 24bits */
+	rate->min = 48000;
+	rate->max = 48000;
+	channels->min = 2;
+	channels->max = 2;
+
+	/*
+	 * Configure SSP2 for the 24-bit format expected by the codec. The SST
+	 * ssp2-port front end still advertises S16_LE and converts the stream.
+	 */
+	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+
+	return 0;
+}
+
+static struct snd_soc_jack_pin cht_rt5677_jack_pins[] = {
+	{
+		.pin = "Headphone",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
+static int cht_rt5677_headset_init(struct snd_soc_component *component)
+{
+	struct snd_soc_card *card = component->card;
+	struct snd_soc_jack *jack;
+	int jack_type;
+	int ret;
+
+	jack = devm_kzalloc(card->dev, sizeof(*jack), GFP_KERNEL);
+	if (!jack)
+		return -ENOMEM;
+
+	/*
+	 * TI supports four headset buttons:
+	 * KEY_MEDIA
+	 * KEY_VOICECOMMAND
+	 * KEY_VOLUMEUP
+	 * KEY_VOLUMEDOWN
+	 */
+	jack_type = SND_JACK_HEADPHONE | SND_JACK_MICROPHONE |
+		    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+		    SND_JACK_BTN_2 | SND_JACK_BTN_3;
+
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", jack_type,
+					 jack, cht_rt5677_jack_pins,
+					 ARRAY_SIZE(cht_rt5677_jack_pins));
+	if (ret) {
+		dev_err(card->dev, "creating headset jack failed: %d\n", ret);
+		return ret;
+	}
+
+	return ts3a227e_enable_jack_detect(component, jack);
+}
+
+static int cht_rt5677_aif1_startup(struct snd_pcm_substream *substream)
+{
+	return snd_pcm_hw_constraint_single(substream->runtime,
+			SNDRV_PCM_HW_PARAM_RATE, 48000);
+}
+
+static const struct snd_soc_ops cht_rt5677_aif1_ops = {
+	.startup = cht_rt5677_aif1_startup,
+};
+
+static const struct snd_soc_ops cht_rt5677_be_ssp2_ops = {
+	.hw_params = cht_rt5677_aif1_hw_params,
+};
+
+static const struct snd_soc_aux_dev cht_rt5677_headset_dev = {
+	.dlc = COMP_AUX("i2c-ts3a227e"),
+	.init = cht_rt5677_headset_init,
+};
+
+SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(media, DAILINK_COMP_ARRAY(COMP_CPU("media-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(deepbuffer, DAILINK_COMP_ARRAY(COMP_CPU("deepbuffer-cpu-dai")));
+
+SND_SOC_DAILINK_DEF(ssp2_port, DAILINK_COMP_ARRAY(COMP_CPU("ssp2-port")));
+SND_SOC_DAILINK_DEF(ssp2_codec, DAILINK_COMP_ARRAY(COMP_CODEC(RT5677_I2C, CHT_CODEC_DAI)));
+
+SND_SOC_DAILINK_DEF(platform, DAILINK_COMP_ARRAY(COMP_PLATFORM("sst-mfld-platform")));
+
+static const struct snd_soc_dai_link cht_rt5677_dailink[] = {
+	/* Front End DAI links */
+	[MERR_DPCM_AUDIO] = {
+		.name = "Audio Port",
+		.stream_name = "Audio",
+		.nonatomic = true,
+		.dynamic = 1,
+		.ops = &cht_rt5677_aif1_ops,
+		SND_SOC_DAILINK_REG(media, dummy, platform),
+	},
+	[MERR_DPCM_DEEP_BUFFER] = {
+		.name = "Deep-Buffer Audio Port",
+		.stream_name = "Deep-Buffer Audio",
+		.nonatomic = true,
+		.dynamic = 1,
+		.playback_only = 1,
+		.ops = &cht_rt5677_aif1_ops,
+		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
+	},
+
+	/* Back End DAI links */
+	{
+		/* SSP2 - Codec */
+		.name = "SSP2-Codec",
+		.id = 0,
+		.no_pcm = 1,
+		.nonatomic = true,
+		.init = cht_rt5677_codec_init,
+		.be_hw_params_fixup = cht_rt5677_codec_fixup,
+		.ops = &cht_rt5677_be_ssp2_ops,
+		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
+	},
+};
+
+/* SoC card */
+static const struct snd_soc_card cht_rt5677_card = {
+	.owner = THIS_MODULE,
+	.num_links = ARRAY_SIZE(cht_rt5677_dailink),
+	.num_aux_devs = 1,
+	.dapm_widgets = cht_rt5677_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(cht_rt5677_widgets),
+	.dapm_routes = cht_rt5677_map,
+	.num_dapm_routes = ARRAY_SIZE(cht_rt5677_map),
+	.controls = cht_rt5677_controls,
+	.num_controls = ARRAY_SIZE(cht_rt5677_controls),
+};
+
+static const struct acpi_gpio_params speaker_enable_gpio = { 2, 0, false };
+static const struct acpi_gpio_mapping cht_rt5677_gpios[] = {
+	{ "speaker-enable-gpios", &speaker_enable_gpio, 1 },
+	{ }
+};
+
+#define SOF_CARD_NAME "cht yogabook"
+#define SOF_DRIVER_NAME "SOF"
+
+#define CARD_NAME "cht-rt5677"
+#define DRIVER_NAME NULL
+
+static void cht_rt5677_gpiod_put(void *data)
+{
+	gpiod_put(data);
+}
+
+static void cht_rt5677_remove_driver_gpios(void *data)
+{
+	acpi_dev_remove_driver_gpios(data);
+}
+
+static int cht_rt5677_get_gpio(struct device *dev, struct device *codec_dev,
+			       const char *con_id, struct gpio_desc **gpio)
+{
+	int ret;
+
+	*gpio = gpiod_get(codec_dev, con_id, GPIOD_OUT_LOW);
+	if (IS_ERR(*gpio)) {
+		ret = PTR_ERR(*gpio);
+		return dev_err_probe(dev, ret, "getting %s GPIO failed\n", con_id);
+	}
+
+	ret = devm_add_action_or_reset(dev, cht_rt5677_gpiod_put, *gpio);
+	if (ret)
+		return dev_err_probe(dev, ret, "registering %s GPIO cleanup failed\n",
+				     con_id);
+
+	return 0;
+}
+
+static int cht_rt5677_clone_dai_links(struct device *dev, struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link_component *components;
+	struct snd_soc_dai_link *links;
+	size_t size;
+	int i;
+
+	links = devm_kmemdup(dev, cht_rt5677_dailink,
+			     sizeof(cht_rt5677_dailink), GFP_KERNEL);
+	if (!links)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(cht_rt5677_dailink); i++) {
+		if (links[i].num_cpus) {
+			size = sizeof(*components) * links[i].num_cpus;
+			components = devm_kmemdup(dev, links[i].cpus, size, GFP_KERNEL);
+			if (!components)
+				return -ENOMEM;
+			links[i].cpus = components;
+		}
+
+		if (links[i].num_codecs) {
+			size = sizeof(*components) * links[i].num_codecs;
+			components = devm_kmemdup(dev, links[i].codecs, size, GFP_KERNEL);
+			if (!components)
+				return -ENOMEM;
+			links[i].codecs = components;
+		}
+
+		if (links[i].num_platforms) {
+			size = sizeof(*components) * links[i].num_platforms;
+			components = devm_kmemdup(dev, links[i].platforms, size, GFP_KERNEL);
+			if (!components)
+				return -ENOMEM;
+			links[i].platforms = components;
+		}
+	}
+
+	card->dai_link = links;
+	return 0;
+}
+
+static int snd_cht_rt5677_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cht_rt5677_private *ctx;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
+	struct snd_soc_aux_dev *aux_dev;
+	struct snd_soc_dai_link *dai_links;
+	struct snd_soc_card *card;
+	const char *platform_name;
+	struct acpi_device *adev;
+	struct device *codec_dev;
+	bool sof_parent;
+	int ret;
+	int i;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	card = devm_kmemdup(dev, &cht_rt5677_card, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	ret = cht_rt5677_clone_dai_links(dev, card);
+	if (ret)
+		return ret;
+	dai_links = card->dai_link;
+
+	aux_dev = devm_kmemdup(dev, &cht_rt5677_headset_dev,
+			       sizeof(cht_rt5677_headset_dev), GFP_KERNEL);
+	if (!aux_dev)
+		return -ENOMEM;
+
+	card->aux_dev = aux_dev;
+
+	strscpy(ctx->codec_name, RT5677_I2C, sizeof(ctx->codec_name));
+
+	/* Use the ACPI-enumerated codec name when firmware describes the codec. */
+	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
+	if (adev) {
+		snprintf(ctx->codec_name, sizeof(ctx->codec_name),
+			 "i2c-%s", acpi_dev_name(adev));
+
+		acpi_dev_put(adev);
+		for (i = 0; i < card->num_links; i++) {
+			if (dai_links[i].codecs->name &&
+			    !strcmp(dai_links[i].codecs->name,
+				    RT5677_I2C)) {
+				dai_links[i].codecs->name = ctx->codec_name;
+				break;
+			}
+		}
+	}
+
+	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
+					    ctx->codec_name);
+	if (!codec_dev)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for codec %s\n", ctx->codec_name);
+
+	adev = ACPI_COMPANION(codec_dev);
+	if (adev) {
+		ret = acpi_dev_add_driver_gpios(adev, cht_rt5677_gpios);
+		if (ret) {
+			dev_err_probe(dev, ret, "adding codec GPIO mappings failed\n");
+			goto out_put_codec;
+		}
+
+		ret = devm_add_action_or_reset(dev, cht_rt5677_remove_driver_gpios, adev);
+		if (ret) {
+			dev_err_probe(dev, ret, "registering GPIO mapping cleanup failed\n");
+			goto out_put_codec;
+		}
+	}
+
+	ret = cht_rt5677_get_gpio(dev, codec_dev, "speaker-enable", &ctx->gpio_spk_en1);
+	if (ret)
+		goto out_put_codec;
+
+	ret = cht_rt5677_get_gpio(dev, codec_dev, "speaker-enable2", &ctx->gpio_spk_en2);
+	if (ret)
+		goto out_put_codec;
+
+	ret = cht_rt5677_get_gpio(dev, codec_dev, "headphone-enable", &ctx->gpio_hp_en);
+	if (ret)
+		goto out_put_codec;
+
+	put_device(codec_dev);
+
+	card->dev = dev;
+	platform_name = mach->mach_params.platform;
+
+	ret = snd_soc_fixup_dai_links_platform_name(card, platform_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "fixing DAI link platform name failed\n");
+
+	ctx->mclk = devm_clk_get(dev, "pmc_plt_clk_3");
+	if (IS_ERR(ctx->mclk))
+		return dev_err_probe(dev, PTR_ERR(ctx->mclk), "getting MCLK failed\n");
+
+	snd_soc_card_set_drvdata(card, ctx);
+
+	sof_parent = snd_soc_acpi_sof_parent(dev);
+
+	if (sof_parent) {
+		card->name = SOF_CARD_NAME;
+		card->driver_name = SOF_DRIVER_NAME;
+	} else {
+		card->name = CARD_NAME;
+		card->driver_name = DRIVER_NAME;
+	}
+
+	ret = devm_snd_soc_register_card(dev, card);
+	if (ret)
+		return dev_err_probe(dev, ret, "registering sound card failed\n");
+
+	return 0;
+
+out_put_codec:
+	put_device(codec_dev);
+	return ret;
+}
+
+static struct platform_driver snd_cht_rt5677_driver = {
+	.driver = {
+		.name = "cht-rt5677",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = snd_cht_rt5677_probe,
+};
+
+module_platform_driver(snd_cht_rt5677_driver);
+
+MODULE_DESCRIPTION("Cherry Trail RT5677 machine driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:cht-rt5677");
-- 
2.53.0


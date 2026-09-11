Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE583C9EEB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164919; cv=none; b=jJpGnlAJ1JnkCSjXp11mkoF+Of2vDzXwS+qNCVuYmiy0fAvuL/QgElimC8plg46wlehvM8KuhLTzRAApusN2pMisPo2XTCHAweflDgEOsio2GlTorWTvU45GZCXkFtwAODwwdq/ZqppRLNyqRI4tRF/qBnmzAbmao3HUVg/TSKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164919; c=relaxed/simple;
	bh=vNQyBJeBZc6hUUZzJuEKw9fG/gfnPN3fY7SmjWA8aIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOj8dkl1cgVsjOYCG3gNzOjH20M/gV+yBcSZJ/AQYWgJyho+D0H3syXSk/mIw8NYLy6tI/a3z0VIu+loUllvxgkO9CUIIP4siB/1Jt8zYcHbOJ912ULTraQHpIXEYPjO+fwxNesYvKYs+7zQ1v9Q81obl9di0BUg/AAzxqPdwoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oUQphLrL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oUQphLrL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49e6bad7b79so2050175e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164914; x=1789769714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8cTBryyPok9u5hgBBgTaMVbOGx+U65ZrgXcISbAXk8=;
        b=oUQphLrLqXL243t3uTRLpqvbgb6VzWt6aqIASDQhL+/FrC/C4LbzfGHU5m3pJhdKQd
         nEj2kQcRmvN9GXyLEDYx2VfjQeWDRl4EcjWhENU2ooO35gPNXkDX1NRkgp8w6ErL1syT
         x0R+kVI8P1WJsiAnR/OvU6/cwqP8VPJ1AZLvjFHuKgfgsHaU9mocnIfx8fYZGbfRkB4N
         dWYf6P6FwOSqrrdKd0yP6TuRlm+7B/T/rN1Bypo1s4USYcq/W9z+T2+LiJ4L4GqJkn+K
         xCeY15mez2gS5+6Luz6emQH0TfkX94RR76D7aMfygC2CU8X55FOIEAoS89J9GRyq4SzB
         iIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164914; x=1789769714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8cTBryyPok9u5hgBBgTaMVbOGx+U65ZrgXcISbAXk8=;
        b=c7yq43JrmNpSW7GyJV7oU8Ao9Qe8wwVvkYk8KoWueXTgtJlIS4ijHASoV3d/xEJpWp
         CHnzVFgh4TldyqOMkyjaJk0+57CQD2ItaSdi9L2Yyuawd4qxPGwEx+JPDE2bKuEYIVf3
         kNOjU7+K+DpzeIt/CeYj/tD3okpjkICxpuSZFKRlnMrZMHMAYLeb+1VlS9Xgs/5tEjqi
         hRMc6viYwIi1A7dy3i5mqJyMmH0+5jtckurqIdbrcV6Kmgsw7bfnETFKlBZ0oulBN/Ux
         ww5HI6HW8+yWt/fUnXklSphz/0LP6k/BOxgZD6N6qyjgqiPJA83QD3NlhSfju8e8a9Jb
         aAew==
X-Forwarded-Encrypted: i=1; AKwUvBzWtHafZo/5+xVedJSEv8QvOCUd2cqnG//WBi+wndz2dQlu0mupUO3KktNBQVjhPtCryjh6mchJeNCOQrI=@vger.kernel.org
X-Gm-Message-State: AFuF++mTxmwyv2kYdGt0JFZEqvvSqczwSQpeh/2nPQle5Z3DgemqxJuV
	a8ErtUlRS90+9JzCzfM0mN/kxJRUpB/snpdti4Bo7BmRI/4neqzRuKr8SFcXa4Un90E=
X-Gm-Gg: AYBFou2jFFYU2VbujZWIj4ZoX/B15SX2CWnM+EzniTreBvEPUVR8fkVd6lzXgxGykef
	gApVOj3geaD+M1fKaHFztThcAsiJ2ovK3it/1JHaP5MqYTO9hVXwVGOCG4VfQbQ2uGzI3RQadaJ
	288UQyB/8MRpWWD6j8mbfGcxvi+comm/85ZjE0ryZrxjCQPaKaZjurI5HhOrYm2sqGcwI8z+4Kp
	791r1CZtp6RqEbN/cwadsJZNVc/WvjX2FkyqaXn5XhlLUFuGgpUlo43jjtgQ35uNJj/c7Mcf4wv
	FIMrh/XBx/HpfJcQu7TbZFihOFS7trzgaOQ05Ui/Kdae2Vs/e9QquVBPGn8KtbSiIEnot/iEZW7
	Ee/cOwNHOi7gh3XQM+ujg5IoqN0T5LM1Jv/O0t1MN+ZGtloYYsyPsyQqcyIeII942Oj5JF4eerC
	uYssdeOGXMYbLC6lSFV5Z6BAh/peGBeprjIvxdvKx6mmws2PxRmCi1wqfUcAcbda1EVQ==
X-Received: by 2002:a05:600d:444c:20b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49e6198d09bmr54562695e9.13.1789164914076;
        Fri, 11 Sep 2026 15:15:14 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:13 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:33 +0200
Subject: [PATCH 3/6] ASoC: meson: add audin FIFO driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-audin-v1-3-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17768; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=vNQyBJeBZc6hUUZzJuEKw9fG/gfnPN3fY7SmjWA8aIo=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanN7Qt2zRZMeb2ebcC7lY2hV5FK2huM/Ve+3nVQ3d
 3i1/lJaRykLgxgXg6yYIgvL9Hu/C0rVHhonnCyAmcPKBDKEgYtTACbyrp2RYepD4dMe211WdEhn
 hqb4+NWvnPn6mmzQjDl/X7x1NTMVfMrIcJXDfdkefmmlyWfXzGmP1RKwDk4/ZyCmEcjtF+3jd+w
 TLwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Add support for the frontend DAI of the capture interface which is in
charge of receiving decoded data from "audin-formatter-i2s" and move them
to an internal FIFO before they are block-transferred to RAM.

This component could ideally handle multiple input sources (SPDIF, I2S,
PCM, HDMI), but for the time being only I2S is added and has been tested.

Note: due to register configuration, at boot "Input Source" is set to
"SPDIF". In order to be able to test I2S it must be switched to "I2S".

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig      |   5 +
 sound/soc/meson/Makefile     |   2 +
 sound/soc/meson/audin-fifo.c | 466 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 473 insertions(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index f6e54615fc73..b83c7c15d1e9 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -16,10 +16,15 @@ config SND_MESON_AUDIN
 	tristate "Amlogic AUDIN"
 	select REGMAP_MMIO
 	select SND_MESON_AIU
+	select SND_MESON_AUDIN_FIFO
 	help
 	  Select Y or M to add support for the audio input subsystem found
 	  in the Amlogic GX SoC family. Currently only I2S input is supported.
 
+config SND_MESON_AUDIN_FIFO
+	tristate
+	select REGMAP_MMIO
+
 config SND_MESON_AXG_FIFO
 	tristate
 	select REGMAP_MMIO
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 6a06a7b26e61..3e373bd27645 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -12,6 +12,7 @@ snd-soc-meson-aiu-y += aiu-fifo-i2s.o
 snd-soc-meson-aiu-y += aiu-fifo-spdif.o
 snd-soc-meson-audin-y := audin.o
 snd-soc-meson-audin-y += audin-formatter-i2s.o
+snd-soc-meson-audin-fifo-y := audin-fifo.o
 snd-soc-meson-axg-fifo-y := axg-fifo.o
 snd-soc-meson-axg-frddr-y := axg-frddr.o
 snd-soc-meson-axg-toddr-y := axg-toddr.o
@@ -32,6 +33,7 @@ snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
 obj-$(CONFIG_SND_MESON_AUDIN) += snd-soc-meson-audin.o
+obj-$(CONFIG_SND_MESON_AUDIN_FIFO) += snd-soc-meson-audin-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
 obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o
diff --git a/sound/soc/meson/audin-fifo.c b/sound/soc/meson/audin-fifo.c
new file mode 100644
index 000000000000..7029bd6a464a
--- /dev/null
+++ b/sound/soc/meson/audin-fifo.c
@@ -0,0 +1,466 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <linux/dma-mapping.h>
+#include <linux/hrtimer.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/wordpart.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+/* FIFO registers */
+#define AUDIN_FIFO_START	0x00
+#define AUDIN_FIFO_END		0x04
+#define AUDIN_FIFO_PTR		0x08
+
+/* FIFOx CTRL registers and bits */
+#define AUDIN_FIFO_CTRL			0x14
+#define  AUDIN_FIFO_CTRL_EN		BIT(0)
+#define  AUDIN_FIFO_CTRL_RST		BIT(1)
+#define  AUDIN_FIFO_CTRL_LOAD		BIT(2)
+#define  AUDIN_FIFO_CTRL_DIN_SEL_OFF	3
+#define  AUDIN_FIFO_CTRL_ENDIAN_MASK	GENMASK(10, 8)
+#define  AUDIN_FIFO_CTRL_CHAN_MASK	GENMASK(14, 11)
+#define  AUDIN_FIFO_CTRL_UG		BIT(15)
+
+/* FIFOx_CTRL1 registers and bits */
+#define AUDIN_FIFO_CTRL1			0x18
+#define  AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK	GENMASK(3, 2)
+#define  AUDIN_FIFO_CTRL1_DIN_POS_01_MASK	GENMASK(1, 0)
+
+/* When the FIFO is full the data is bulk transferred to memory. */
+#define AUDIN_FIFO_LANE_SIZE		8 /* bytes */
+#define AUDIN_FIFO_I2S_BLOCK		(AUDIN_FIFO_LANE_SIZE * 32) /* 256 bytes */
+
+static const struct snd_pcm_hardware audin_fifo_pcm_hw = {
+	.info = (SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_MMAP |
+		 SNDRV_PCM_INFO_MMAP_VALID |
+		 SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		 SNDRV_PCM_INFO_PAUSE),
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	.rate_min = 5512,
+	.rate_max = 192000,
+	.channels_min = 2,
+	.channels_max = 2,
+	/*
+	 * The FIFO only moves data to the memory once it is full, so its pointer
+	 * progresses one block at a time.
+	 */
+	.period_bytes_min = 2 * AUDIN_FIFO_I2S_BLOCK,
+	.period_bytes_max = UINT_MAX, /* Bounded by buffer_bytes_max */
+	.periods_min = 2,
+	.periods_max = UINT_MAX,
+	/*
+	 * It's 1 MB. There is no physical constraint for this; it's only meant to
+	 * provide some decently large buffer size where to store incoming data
+	 * and fit various period_bytes requests.
+	 */
+	.buffer_bytes_max = 4096 * AUDIN_FIFO_I2S_BLOCK,
+};
+
+struct audin_fifo_dai_data {
+	/*
+	 * The AUDIN peripheral has an IRQ to signal when data is received, but
+	 * it cannot grant a periodic behavior. The reason is that the register
+	 * which holds the address which triggers the IRQ must be updated
+	 * continuously. This creates a risk of overflow if for any reason the
+	 * ISR execution is delayed. Using a periodic timer is therefore simpler
+	 * and more reliable.
+	 */
+	struct hrtimer polling_timer;
+	struct snd_soc_component *component;
+	struct snd_pcm_substream *substream;
+	unsigned int period_bytes;
+	unsigned int byte_rate;
+	unsigned int last_pos; /* Position inside the allocated read buffer. */
+	bool running;
+};
+
+static unsigned int audin_fifo_pos(struct snd_soc_component *component,
+				   struct snd_pcm_runtime *runtime)
+{
+	unsigned int ptr = snd_soc_component_read(component, AUDIN_FIFO_PTR);
+
+	return ptr - lower_32_bits(runtime->dma_addr);
+}
+
+static ktime_t audin_fifo_bytes_to_ns(struct audin_fifo_dai_data *data,
+				      unsigned int bytes)
+{
+	return div_u64((u64)bytes * NSEC_PER_SEC, data->byte_rate);
+}
+
+static int audin_fifo_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				  struct snd_soc_dai *dai)
+{
+	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
+	struct snd_soc_component *component = dai->component;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+					      AUDIN_FIFO_CTRL_EN,
+					      AUDIN_FIFO_CTRL_EN);
+		WRITE_ONCE(data->running, true);
+		hrtimer_start(&data->polling_timer,
+			      audin_fifo_bytes_to_ns(data, data->period_bytes),
+			      HRTIMER_MODE_REL);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		WRITE_ONCE(data->running, false);
+		/*
+		 * PCM stream lock is held here. If the timer callback is running
+		 * (i.e. it cannot be stopped) there is also hrtimer_cancel()
+		 * in hw_free().
+		 */
+		hrtimer_try_to_cancel(&data->polling_timer);
+		snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+					      AUDIN_FIFO_CTRL_EN, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int audin_fifo_dai_prepare(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
+	struct snd_soc_component *component = dai->component;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	dma_addr_t dma_end = runtime->dma_addr + runtime->dma_bytes - AUDIN_FIFO_LANE_SIZE;
+	unsigned int val;
+
+	data->last_pos = 0;
+
+	/*
+	 * Setup memory boundaries.
+	 * Note: DMA has a 32-bit mask, so it's OK to take lower 32 bits.
+	 */
+	snd_soc_component_write(component, AUDIN_FIFO_START, lower_32_bits(runtime->dma_addr));
+	snd_soc_component_write(component, AUDIN_FIFO_PTR, lower_32_bits(runtime->dma_addr));
+	snd_soc_component_write(component, AUDIN_FIFO_END, lower_32_bits(dma_end));
+
+	/* Load new addresses (both LOAD and UG are self-clearing). */
+	val = AUDIN_FIFO_CTRL_LOAD | AUDIN_FIFO_CTRL_UG;
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL, val, val);
+
+	/* Reset (RST is self-clearing). */
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+				      AUDIN_FIFO_CTRL_RST,
+				      AUDIN_FIFO_CTRL_RST);
+
+	return 0;
+}
+
+static int audin_fifo_dai_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params,
+				    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
+	unsigned int val;
+
+	if (params_width(params) != 16) {
+		dev_err(dai->dev, "Unsupported width %u\n", params_width(params));
+		return -EINVAL;
+	}
+
+	/*
+	 * The I2S input decoder passes 24 bits of left-justified data
+	 * but for the time being we only support 16 bit formatted samples
+	 * which means that we drop the LSB.
+	 */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_POS_01_MASK, 1);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL1,
+				      AUDIN_FIFO_CTRL1_DIN_POS_01_MASK,
+				      val);
+
+	/* Set sample size to 2 bytes (16 bit) */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK, 1);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL1,
+				      AUDIN_FIFO_CTRL1_DIN_BYTE_NUM_MASK,
+				      val);
+
+	/*
+	 * This is a bit counterintuitive. Even though the platform has a single
+	 * pin for I2S input which would mean that we can only support 2
+	 * channels, doing so would cause samples to be stored in a weird way
+	 * into the FIFO: all the samples from the 1st channel on the 1st half
+	 * of the FIFO, then samples from the 2nd channel in the other half. Of
+	 * course extra work would be required to properly interleave them
+	 * before returning to the userspace.
+	 * Setting a single channel mode instead solves the problem: samples
+	 * from 1st and 2nd channel are stored interleaved and sequentially in
+	 * the FIFO.
+	 */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL_CHAN_MASK, 1);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+				      AUDIN_FIFO_CTRL_CHAN_MASK, val);
+
+	/*
+	 * FIFO is filled line by line and each of them is 8 bytes. The
+	 * problem is that each line is filled starting from the end,
+	 * so we need to properly reorder them before moving to the
+	 * RAM. This is the value required to properly re-order samples stored
+	 * in 16 bit format.
+	 */
+	val = FIELD_PREP(AUDIN_FIFO_CTRL_ENDIAN_MASK, 6);
+	snd_soc_component_update_bits(component, AUDIN_FIFO_CTRL,
+				      AUDIN_FIFO_CTRL_ENDIAN_MASK, val);
+
+	/* Used by the polling timer to convert a byte count into a delay. */
+	data->period_bytes = params_period_bytes(params);
+	data->byte_rate = params_rate(params) * params_channels(params) *
+			  params_physical_width(params) / BITS_PER_BYTE;
+
+	data->substream = substream;
+
+	return 0;
+}
+
+static int audin_fifo_dai_hw_free(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct audin_fifo_dai_data *data = snd_soc_dai_dma_data_get_capture(dai);
+
+	WRITE_ONCE(data->running, false);
+	hrtimer_cancel(&data->polling_timer);
+
+	return 0;
+}
+
+static int audin_fifo_dai_startup(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	int ret;
+
+	snd_soc_set_runtime_hwparams(substream, &audin_fifo_pcm_hw);
+
+	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 AUDIN_FIFO_I2S_BLOCK);
+	if (ret < 0) {
+		dev_err(dai->dev, "Failed to set constraint on buffer_bytes %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_step(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+					 AUDIN_FIFO_I2S_BLOCK);
+	if (ret < 0) {
+		dev_err(dai->dev, "Failed to set constraint on period_bytes %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int audin_fifo_dai_pcm_new(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = dma_coerce_mask_and_coherent(dai->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(dai->dev, "Failed to set DMA mask %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+					     dai->dev,
+					     audin_fifo_pcm_hw.buffer_bytes_max,
+					     audin_fifo_pcm_hw.buffer_bytes_max);
+	if (ret) {
+		dev_err(dai->dev, "Failed to set PCM managed buffer %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static enum hrtimer_restart audin_fifo_timer_cb(struct hrtimer *timer)
+{
+	struct audin_fifo_dai_data *data =
+		container_of(timer, struct audin_fifo_dai_data, polling_timer);
+	struct snd_pcm_runtime *runtime = data->substream->runtime;
+	unsigned int curr_pos, delta, sleep_time;
+
+	if (!READ_ONCE(data->running))
+		return HRTIMER_NORESTART;
+
+	curr_pos = audin_fifo_pos(data->component, runtime);
+	delta = (curr_pos >= data->last_pos) ?
+		curr_pos - data->last_pos :
+		(runtime->dma_bytes - data->last_pos) + curr_pos;
+
+	/* Report only when the period is completed. */
+	if (delta >= data->period_bytes) {
+		data->last_pos = curr_pos;
+		delta = delta % data->period_bytes;
+		snd_pcm_period_elapsed(data->substream);
+	}
+
+	/* Sleep until the period is completed. */
+	sleep_time = round_up(data->period_bytes - delta, AUDIN_FIFO_I2S_BLOCK);
+	hrtimer_forward_now(timer, audin_fifo_bytes_to_ns(data, sleep_time));
+
+	return HRTIMER_RESTART;
+}
+
+static int audin_fifo_dai_probe(struct snd_soc_dai *dai)
+{
+	struct audin_fifo_dai_data *data;
+
+	data = kzalloc_obj(*data);
+	if (!data)
+		return -ENOMEM;
+
+	data->component = dai->component;
+
+	hrtimer_setup(&data->polling_timer, audin_fifo_timer_cb, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
+
+	snd_soc_dai_dma_data_set_capture(dai, data);
+
+	return 0;
+}
+
+static int audin_fifo_dai_remove(struct snd_soc_dai *dai)
+{
+	kfree(snd_soc_dai_dma_data_get_capture(dai));
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops audin_fifo_dai_ops = {
+	.trigger	= audin_fifo_dai_trigger,
+	.prepare	= audin_fifo_dai_prepare,
+	.hw_params	= audin_fifo_dai_hw_params,
+	.hw_free	= audin_fifo_dai_hw_free,
+	.startup	= audin_fifo_dai_startup,
+	.pcm_new	= audin_fifo_dai_pcm_new,
+	.probe		= audin_fifo_dai_probe,
+	.remove		= audin_fifo_dai_remove,
+};
+
+static struct snd_soc_dai_driver audin_fifo_dai_drv[] = {
+	{
+		.name = "FIFO",
+		.capture = {
+			.stream_name	= "Capture",
+			.channels_min	= 2,
+			.channels_max	= 2,
+			.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+			.rate_min	= 5512,
+			.rate_max	= 192000,
+			.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+		},
+		.ops = &audin_fifo_dai_ops,
+	},
+};
+
+static snd_pcm_uframes_t
+audin_fifo_component_pointer(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	return bytes_to_frames(runtime, audin_fifo_pos(component, runtime));
+}
+
+static const char * const audin_fifo_input_sel_texts[] = {
+	"SPDIF", "I2S", "PCM", "HDMI", "Demodulator"
+};
+
+static SOC_ENUM_SINGLE_DECL(audin_fifo_input_sel_enum, AUDIN_FIFO_CTRL,
+			    AUDIN_FIFO_CTRL_DIN_SEL_OFF,
+			    audin_fifo_input_sel_texts);
+
+static const struct snd_kcontrol_new audin_fifo_input_sel_mux =
+	SOC_DAPM_ENUM("Input Source", audin_fifo_input_sel_enum);
+
+static const struct snd_soc_dapm_widget audin_fifo_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("I2S IN", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX("SRC SEL", SND_SOC_NOPM, 0, 0,
+			 &audin_fifo_input_sel_mux),
+};
+
+static const struct snd_soc_dapm_route audin_fifo_dapm_routes[] = {
+	{ "SRC SEL", "I2S", "I2S IN" },
+	{ "Capture", NULL, "SRC SEL" },
+};
+
+static const struct snd_soc_component_driver audin_fifo_component = {
+	.dapm_widgets		= audin_fifo_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(audin_fifo_dapm_widgets),
+	.dapm_routes		= audin_fifo_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(audin_fifo_dapm_routes),
+	.pointer		= audin_fifo_component_pointer,
+};
+
+static const struct regmap_config audin_fifo_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x18,
+};
+
+static int audin_fifo_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *regs;
+	struct regmap *map;
+	int ret;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return dev_err_probe(dev, PTR_ERR(regs), "Error ioremapping resource\n");
+
+	map = devm_regmap_init_mmio(dev, regs, &audin_fifo_regmap_cfg);
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map), "Failed to init regmap\n");
+
+	ret = devm_snd_soc_register_component(dev, &audin_fifo_component,
+					      audin_fifo_dai_drv,
+					      ARRAY_SIZE(audin_fifo_dai_drv));
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register component\n");
+
+	return 0;
+}
+
+static const struct of_device_id audin_fifo_of_match[] = {
+	{ .compatible = "amlogic,meson-gxbb-audin-fifo" },
+	{ .compatible = "amlogic,meson-gxl-audin-fifo" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, audin_fifo_of_match);
+
+static struct platform_driver audin_fifo_pdrv = {
+	.probe = audin_fifo_probe,
+	.driver = {
+		.name = "meson-gx-audin-fifo",
+		.of_match_table = audin_fifo_of_match,
+	},
+};
+module_platform_driver(audin_fifo_pdrv);
+
+MODULE_DESCRIPTION("Meson GX AUDIN FIFO driver");
+MODULE_AUTHOR("Valerio Setti <vsetti@baylibre.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3


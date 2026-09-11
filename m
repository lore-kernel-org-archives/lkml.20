Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A353A6B6C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164917; cv=none; b=IN0QmZSyH03oHZdDj/COAyg7EoOohaACt9PMJ8JNNWFd7ljG1NX/ZWd6B2z4QDBNggxRTrTNfAXZh8GCBjrM1PJ7ryQ5NGoImnFDaxC20S886UO3QYXBdQzOZ91DCpMBD8NmY/8/zfz4Wuz/rbSzrEXQi6lXNMh2Z0JQ9Vv9PO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164917; c=relaxed/simple;
	bh=U38KIW8l3Mu//XwcIMEecEk/1YyGnT9t7x5OqfJMhJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NinzLZYkg4yo7dCvh5Jbj6GQsUFcHcGCXkS9r/eELwE/i2z9s1hnADWQcR4a6nJNt6u8pVfUws3lSma1sq1+ZDai/hMuKmXPFfuml/VymLZoFqvD+/4LjXy5N5exJMCMb24AT3GUCA7VSr4yphit+bubsglNI5RjMcSHNgJewsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=o1vh+fWa; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="o1vh+fWa"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so2222715e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164913; x=1789769713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuapJCTCH4Mm1Cl2su8mwhuXka1tyaCJMFc8XSqcx9k=;
        b=o1vh+fWaQA0CnDOVV3d4t9bWJEieVp3qBNBSXanPuGcPn7xowE+7XBR1/UwZVcfFAZ
         xdLBf6IhsFRpFfUZMR72A84S9dJmOJBetEXllZTIaJmqv1aB0Fcy73aFdbP3GT0Py2kF
         nYiuWbolFMb3nWfhTQcDprBhBWMH7cFnYude9Kyhfe8xvk6MxUIdZlsj8Uhl80n2F/wR
         R06cnRKkuN78h2ikJuBvSwCq1D2jTHI91eUQudgT0ZpZy0hYUr/8JK6DW0osmNnoNvhC
         5opF8HFFj3nkOoNG4jxfW0E1WVXxacCc+VFmoHTaQ8d/RS3sYPpFd7st0lDAYT1206DQ
         GWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164913; x=1789769713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EuapJCTCH4Mm1Cl2su8mwhuXka1tyaCJMFc8XSqcx9k=;
        b=E+LfvJL9XWtlBQgTUHOB7vmXHYGvuQqEwPTU+l7KONZULHngMmxeKIXtIvbvlJaF7I
         +wgcP28HSxQ7z4wpruUVvP0OnqsP8P6owYJKp7I0XMGChFAVoNk5K5vISoypzANs6or7
         a6eaYhDBk5NKtNCytMYDpogufhYxn1PbZSYHqkQJN42rrrcxt08r0eL8Zm1IZ2rIS71N
         1sLrQjftalWfu0nBhDCmFbJddFrUXu8n+412hBx3oGJWFCpMGxCsDDh5xgxhJEqlKhk2
         20GQT1Dj7dM+ZQASmwPGFRDfFE0xsAQ6Ff2keBQ3qJodVo4EFCkHv4aR4qnniYHyTFix
         oUfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmbobHBkneaKqS7eiub9i/qtjc/9G1ubNs26i7bcW8nkIbxPYO/WNJvmtqdXZGxUIWjyLp47z+Ro63+9s=@vger.kernel.org
X-Gm-Message-State: AFuF++mLijqJE6fx5kxSTaugi4ig7hpaer94uwqfWJqnapPHBwtFjNTR
	Symh8MS+yCfvi4SuQhAmMv4WZRocmY50nRJzwfinBw4eXKfs6AH1mNP/4Eh+fpJt7iU=
X-Gm-Gg: AYBFou1rgENueS6C0G9+V8qPqdTXk5YEd/FTKqAnsOA1NG6tXP83S2BTQjiL4SVT+7e
	hTTK8KGkx0wZomiKxkQMPYiRzvGyMAQTBW+IlR4UoK5WRyb7+It3bGfeWMXblYo3HUOqs5u2030
	DIxBMJH7Qhkrcu5t/H+3voGukEW8IA2/3fVvdii2d9iJiUWM9DdCcHlvzLsQ/Wy70Eaew8pu2OJ
	EWxrLcB6K5fEv3vlH8zHMnTynOo+tmC4qgCeLCN+s0UqVmaAasbRPPShwxnpRkvszjpTonEFt1j
	gOOuGlmuE1TL7Y8bkRNxfhUxhHhqiZMO3i/WwPVn3NbNzLakVy/1BBsaCZnF2ByLprkL0cr5uB3
	Hz4wzzfI3GyBqQlFOb02mDB6+k0JldACLsG3NSzGFr/zSGL6zJHYSs/s+HBDn0fp6vhknnBxVaQ
	9yFhMkLzC6rFWcB5Cih5WkZcbzakoaG/y5aVmTBkkYkcqEOV0wUMQ1qt3Fq+47YcfO2A==
X-Received: by 2002:a05:600c:540e:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49e66922810mr91970045e9.2.1789164913122;
        Fri, 11 Sep 2026 15:15:13 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:12 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:32 +0200
Subject: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260912-audin-v1-2-7fbefe928711@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12397; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=U38KIW8l3Mu//XwcIMEecEk/1YyGnT9t7x5OqfJMhJs=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanP94l+c3PBA9/DU6+57ct2rOvMaV3Qe2OyfpKHmz
 dLEULe+o5SFQYyLQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABP5f4jhf63FF8HcSQ/epJuf
 uGtT8jNz2k55Jr1jS9xdLD8krD7h+4fhf7m3ULHFoWIDC76Gxl8fv7GXLo91Xi68/NXPVa1edwP
 3sQIA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Audin is the main component that provides audio input support to the Amlogic
GX based platforms (GXBB/GXL). From a functional point of view it's pretty
simple:
- It provides input data formatters as sound widgets. Currently only I2S
  is supported, but other interfaces can be added in the future.
- It enables the shared clock that's being used from all the components,
  i.e. formatters and FIFO.
- It triggers the parsing of its DT child nodes that implement FIFOs.
  Note: the parent intentionally does not claim its register window so
  that the FIFO children can claim theirs.

'audin-formatter-i2s' is also added here implementing the functionalities
required for the widget that's part of the audin audio component.

The overall design is identical to what has been done for AIU module.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig               |   9 ++
 sound/soc/meson/Makefile              |   3 +
 sound/soc/meson/audin-formatter-i2s.c | 174 ++++++++++++++++++++++++++++++++++
 sound/soc/meson/audin.c               | 109 +++++++++++++++++++++
 sound/soc/meson/audin.h               |  14 +++
 5 files changed, 309 insertions(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a..f6e54615fc73 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -12,6 +12,14 @@ config SND_MESON_AIU
 	  Select Y or M to add support for the Audio output subsystem found
 	  in the Amlogic Meson8, Meson8b and GX SoC families
 
+config SND_MESON_AUDIN
+	tristate "Amlogic AUDIN"
+	select REGMAP_MMIO
+	select SND_MESON_AIU
+	help
+	  Select Y or M to add support for the audio input subsystem found
+	  in the Amlogic GX SoC family. Currently only I2S input is supported.
+
 config SND_MESON_AXG_FIFO
 	tristate
 	select REGMAP_MMIO
@@ -108,6 +116,7 @@ config SND_MESON_GX_SOUND_CARD
 	tristate "Amlogic GX Sound Card Support"
 	select SND_MESON_CARD_UTILS
 	imply SND_MESON_AIU
+	imply SND_MESON_AUDIN
 	help
 	  Select Y or M to add support for the GXBB/GXL SoC sound card
 
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index f9ec0ebb01f0..6a06a7b26e61 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -10,6 +10,8 @@ snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
 snd-soc-meson-aiu-y += aiu-fifo-spdif.o
+snd-soc-meson-audin-y := audin.o
+snd-soc-meson-audin-y += audin-formatter-i2s.o
 snd-soc-meson-axg-fifo-y := axg-fifo.o
 snd-soc-meson-axg-frddr-y := axg-frddr.o
 snd-soc-meson-axg-toddr-y := axg-toddr.o
@@ -29,6 +31,7 @@ snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
 snd-soc-meson-t9015-y := t9015.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
+obj-$(CONFIG_SND_MESON_AUDIN) += snd-soc-meson-audin.o
 obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
 obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
 obj-$(CONFIG_SND_MESON_AXG_TODDR) += snd-soc-meson-axg-toddr.o
diff --git a/sound/soc/meson/audin-formatter-i2s.c b/sound/soc/meson/audin-formatter-i2s.c
new file mode 100644
index 000000000000..8bbb5cdb52dc
--- /dev/null
+++ b/sound/soc/meson/audin-formatter-i2s.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/bitfield.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "audin.h"
+#include "gx-formatter.h"
+
+/* I2SIN_CTRL register and bits */
+#define AUDIN_I2SIN_CTRL			0x40
+#define  AUDIN_I2SIN_CTRL_I2SIN_DIR		BIT(0)
+#define  AUDIN_I2SIN_CTRL_I2SIN_CLK_SEL		BIT(1)
+#define  AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SEL	BIT(2)
+#define  AUDIN_I2SIN_CTRL_I2SIN_BCLK_INV	BIT(3)
+#define  AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK	GENMASK(6, 4)
+#define  AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV	BIT(7)
+#define  AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK	GENMASK(9, 8)
+#define  AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK	GENMASK(13, 10)
+#define  AUDIN_I2SIN_CTRL_I2SIN_EN		BIT(15)
+
+static struct snd_soc_dai *
+audin_formatter_i2s_get_be(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p;
+	struct snd_soc_dai *be;
+
+	snd_soc_dapm_widget_for_each_source_path(w, p) {
+		if (!p->connect)
+			continue;
+
+		if (p->source->id == snd_soc_dapm_dai_out)
+			return (struct snd_soc_dai *)p->source->priv;
+
+		be = audin_formatter_i2s_get_be(p->source);
+		if (be)
+			return be;
+	}
+
+	return NULL;
+}
+
+static struct gx_stream *
+audin_formatter_i2s_get_stream(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dai *be = audin_formatter_i2s_get_be(w);
+
+	if (!be)
+		return NULL;
+
+	return snd_soc_dai_dma_data_get_capture(be);
+}
+
+static void audin_formatter_i2s_enable(struct regmap *map)
+{
+	regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+			   AUDIN_I2SIN_CTRL_I2SIN_EN,
+			   AUDIN_I2SIN_CTRL_I2SIN_EN);
+}
+
+static void audin_formatter_i2s_disable(struct regmap *map)
+{
+	regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+			   AUDIN_I2SIN_CTRL_I2SIN_EN, 0);
+}
+
+static int audin_formatter_i2s_prepare(struct regmap *map,
+				       const struct gx_formatter_hw *quirks,
+				       struct gx_stream *ts)
+{
+	unsigned int val;
+	int ret;
+
+	/*
+	 * I2S decoder always outputs 24 bits to the FIFO according to the
+	 * manual. The only thing we can change through
+	 * AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK is the following:
+	 * - 0 -> output[23:0] = {original[23:8],8’d0}
+	 * - 1 -> output[23:0] = {original[23:6],6’d0}
+	 * - 2 -> output[23:0] = {original[23:4],4’d0}
+	 * - 3 -> output[23:0] = {original[23:0]}
+	 *
+	 * We use 3 here and, in case of 16 bit format, we filter unnecessary
+	 * bytes at FIFO stage.
+	 * Note: data is left-justified, so in case of 16 bits samples, this
+	 *       means that the LSB is to be discarded at FIFO level and the
+	 *       relevant part is in bits [23:8].
+	 */
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK, 3);
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_SIZE_MASK, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * The manual claims that this platform supports up to 4 streams
+	 * (8 channels), but currently only 1 stream (2 channels) has been
+	 * tested and it's supported.
+	 */
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK, 1);
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_CHAN_EN_MASK, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Use clocks from AIU and not from the pads since we only want to
+	 * support master mode.
+	 */
+	val = AUDIN_I2SIN_CTRL_I2SIN_CLK_SEL |
+	      AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SEL |
+	      AUDIN_I2SIN_CTRL_I2SIN_DIR;
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL, val, val);
+	if (ret)
+		return ret;
+
+	switch (ts->iface->fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_IB_NF:
+		val = AUDIN_I2SIN_CTRL_I2SIN_BCLK_INV;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		val = AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		val = AUDIN_I2SIN_CTRL_I2SIN_BCLK_INV | AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV;
+		break;
+	case SND_SOC_DAIFMT_NB_NF:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_LRCLK_INV |
+				 AUDIN_I2SIN_CTRL_I2SIN_BCLK_INV, val);
+	if (ret)
+		return ret;
+
+	switch (ts->iface->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		val = 1;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		val = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = FIELD_PREP(AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK, val);
+	ret = regmap_update_bits(map, AUDIN_I2SIN_CTRL,
+				 AUDIN_I2SIN_CTRL_I2SIN_LRCLK_SKEW_MASK,
+				 val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct gx_formatter_ops audin_formatter_i2s_ops = {
+	.get_stream	= audin_formatter_i2s_get_stream,
+	.prepare	= audin_formatter_i2s_prepare,
+	.enable		= audin_formatter_i2s_enable,
+	.disable	= audin_formatter_i2s_disable,
+};
+
+const struct gx_formatter_driver audin_formatter_i2s_drv = {
+	.ops		= &audin_formatter_i2s_ops,
+};
diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
new file mode 100644
index 000000000000..e8071323432b
--- /dev/null
+++ b/sound/soc/meson/audin.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <sound/soc.h>
+
+#include "audin.h"
+#include "gx-formatter.h"
+
+static struct snd_soc_dapm_widget audin_dapm_widgets[] = {
+	SND_SOC_DAPM_PGA_E("I2S Formatter", SND_SOC_NOPM, 0, 0, NULL, 0,
+			   gx_formatter_event,
+			   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
+};
+
+static const struct snd_soc_component_driver audin_component = {
+	.dapm_widgets		= audin_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(audin_dapm_widgets),
+};
+
+static const struct regmap_config audin_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x304,
+};
+
+static int meson_gx_audin_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *mmio;
+	struct regmap *regmap;
+	struct clk *clk;
+	int ret;
+
+	ret = device_reset(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to reset device\n");
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return dev_err_probe(dev, -EINVAL, "Failed to get memory resource\n");
+
+	/*
+	 * Do not use devm_platform_ioremap_resource() here: it would claim the
+	 * whole AUDIN window exclusively and the FIFO children would then fail
+	 * to request their own sub-ranges.
+	 */
+	mmio = devm_ioremap(dev, res->start, resource_size(res));
+	if (!mmio)
+		return dev_err_probe(dev, -ENOMEM, "Failed to remap memory\n");
+
+	regmap = devm_regmap_init_mmio(dev, mmio, &audin_regmap_cfg);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
+
+	ret = gx_formatter_create(dev, &audin_dapm_widgets[0], &audin_formatter_i2s_drv, regmap);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to allocate formatter\n");
+
+	ret = devm_snd_soc_register_component(dev, &audin_component, NULL, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register component\n");
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to probe child nodes\n");
+
+	return 0;
+}
+
+static void meson_gx_audin_remove(struct platform_device *pdev)
+{
+	gx_formatter_free(&audin_dapm_widgets[0]);
+}
+
+static const struct of_device_id meson_gx_audin_of_match[] = {
+	{ .compatible = "amlogic,meson-gxbb-audin" },
+	{ .compatible = "amlogic,meson-gxl-audin" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, meson_gx_audin_of_match);
+
+static struct platform_driver meson_gx_audin_driver = {
+	.driver = {
+		.name = "meson-gx-audin",
+		.of_match_table = meson_gx_audin_of_match,
+	},
+	.probe = meson_gx_audin_probe,
+	.remove = meson_gx_audin_remove,
+};
+module_platform_driver(meson_gx_audin_driver);
+
+MODULE_DESCRIPTION("Meson GX AUDIN driver");
+MODULE_AUTHOR("Valerio Setti <vsetti@baylibre.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/meson/audin.h b/sound/soc/meson/audin.h
new file mode 100644
index 000000000000..29961e18190f
--- /dev/null
+++ b/sound/soc/meson/audin.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2026 BayLibre, SAS.
+ * Author: Valerio Setti <vsetti@baylibre.com>
+ */
+
+#ifndef _MESON_AUDIN_H
+#define _MESON_AUDIN_H
+
+#include "gx-formatter.h"
+
+extern const struct gx_formatter_driver audin_formatter_i2s_drv;
+
+#endif

-- 
2.47.3


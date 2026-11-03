Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691692;
	b=YOZblyNXY0nQcuBSwZHfovBd+czwdghj1KdOYvlU/DtEhn46e94jSACEttXieUNsg8ui
	 4dWjBthowg6ouO/L2f8+NTlY1pE4p/lxlPXixxIDNZsBTxrTnlsuw+PHLUVYT77FjRn3o
	 U5e4C73B0NUNe8TQNG1tXKewHx90iOqDc/22VNvBQ2kOEEalaiTKMYMb9HmQ3k/Uxy4GN
	 xuvBKysssClO5PxSLjzJqGV/aCVgTqSOvHkP8HLaf2DHQCgbLhA1lqWsJF9JmuUwPdzqx
	 tHF3j83yBXsSPDVanbsC9Rd2h6gr4CJK1T32ZgyphFRmgwDngWWMyP2+w0hWCgsV9mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sGbYv2kmYkAQr0+anrPrQ3eUw/mSAcMY6fbipylE5p0=;
	b=U1XNwq1xef9Jj0o4TYFQbV364gcdyKUj1hVVDzk7p6AL39KWh8gqzomD8yVuujdq/0WR
	 3l0D67Jaas4Eu6lpN8FnTdA/UoBYvMNZdVAdbl76/m2YzbdJFYQ1MccMjgaUQvh113E1h
	 ypns/32iqtc3S8s0vM0tw9u4g38+2865i1YW0AHwBF8wQP17NkCCIUxVC6Jw/ItxOYLzs
	 HtqObPy2hmGni7L91fvFya+RFog02yIiWreHGq0vKC3FR828x1udaJVBQgf5wLSQFgAwy
	 NqYNHF7iFdW8OkgEF64SnZMmeCLBoBLcne4GtHW1AZ1zj1NjUEKmPGl+Q3MqLvVSpZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=reXDKKz2;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D5A606A335
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D5A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=reXDKKz2
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc758830601so2337714a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691690; x=1794296490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGbYv2kmYkAQr0+anrPrQ3eUw/mSAcMY6fbipylE5p0=;
        b=reXDKKz2i5CMLYNY2pFNKwUO+voAoiVD9VXl8ZiMscimQFsBJW0hCcS3PFK5hiamv2
         4Z9UXS+xm9Gk+E9Ojjq3yX+vS8Poqv/CFoS90jvPpLVh86XnzvUp1vVmZx8ug9eO0SGY
         a3bzJjikY0Yk/N/saJVi+il6Yqn3hDoQRZkY5vdkfkYS9fjsB1JodEpo2aOhwgTUwRLc
         Y8SydE0KL+UhdsfwjplLYQXIcHnXcPuBWVWLeWi88LmovyaxGNV44L1vieOr8gI+GxHZ
         6VqFsqkedxnfyaaLgRNxNnhBte2/bCaAr6XXAhNqBF375USYq0exlXfIAABosQKQTSh7
         3xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691690; x=1794296490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGbYv2kmYkAQr0+anrPrQ3eUw/mSAcMY6fbipylE5p0=;
        b=znF/GwoTT/X3nS2mwbgtU3sM2geYTT4IyD7+vbASnUpaskUdhtSMwHPMC0BYlTFown
         41YcjQ/V2uZ2unot+dUQj4Xx+6QgDUzHY902S+0sK1ItuRgarMjQcbOH2H1/1G5DqSmQ
         5LuWemW6dPzbsaESc5heNpxuaAnf5cbM5DRs+sSjTh45grAth205sENLtqVCLt6ygVpl
         WtrCSwhML0PLIg5VloZy+ktHthQtO06yUbAyUw0wpVqxPQMxuqy/ivZeaGrFD8tyKPSc
         dnuUfdKc2d0dsXM0X4TjpXsq9tD8vRRrdfJRhx2+rTdRdfTFHWJpEcLmv39ZTaPiRbe8
         wAJQ==
X-Forwarded-Encrypted: i=1; AKwUvByjZl+dWmYhYskt2USfehDsBH6VFFAMxgFeq63+gEBhtZmNuMKHtBNhiWpYgMgtvxaMz1mCn1lH/P/dPd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9jbghW2ngKns3SBQhAYSkvg92d5vCn68XX+c3olqkh8+JxvM1
	eYCszCojaJIBWQMIX+QNAMqSWc4ZdFqMgm1NPNjb9QSMEB90NQpxDMWA
X-Gm-Gg: AYBFou2S3WtFzDQcok60GCnRKbc5E1yGuIfcvPWwHMSb1EeqOrsXLzKJpGxaEERS5FG
	5InkDdE7yMUCLajxmRbuy54uc0BdhnxwMgn4dI2bi2pPkny3zFYExdy4FzhgCbhOB1MS/sUAmWw
	c3PcSBYgwfcTZfg2OdsJu27k5rfQJt5d4mbgSupyekXGBQ/hYbZB4bQ48W4A1l4i/u1UwS/GUNd
	wQqclAevz0+yUvIz3MUgIJf4GdEbrry9n3ZFxtASEIV3ZQqw3iCSWivT/SSXVvFiawJG/wzP9nE
	DpYYJFJyCiX1liTLiRLwl7NQajB37NUkzvMqo88ahSWN41+ikgXFAs6o+AKIwIfezXjbVURUGxh
	SHNSJ8VJC58UGucK7b6MavjQGQUIAaungntaFib7OyNgZXIcRu99Pw1J3hyytY/frevb5XSHkGI
	fwQPyjwmiWnfyAUwRe7DV5myEAsDTNIzJcT4buX0J65avAB3c+8xueOYXXk+C96IsweLEufYvQN
	2h5+0tN1FdQlVzghcmPI0UA8UaXT7H6G+Op4pw6KpZWegxrA6LF06nJ6/rPk/zziVybZWOgySRg
	827O96sAbA4Md/DVe9KVsnhGrA9K+AMQ2904fY1nvrfJmDXkMB/jAE3lHkfo/PIEulHlye3lqzf
	1d4cTNVFJCzJe4gziraoG+JE6pS4UfKpK9BWkMZquwD+R5V58yG7QurnOr0Paf3KZ8c8HKAlB12
	+He7s=
X-Received: by 2002:a17:90b:4c81:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3ae897c85e6mr10095797a91.18.1793691689288;
        Mon, 02 Nov 2026 23:41:29 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:28 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:57 +1000
Subject: [PATCH v4 09/22] ASoC: apple: Add macaudio machine driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-9-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=55925;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=t7txJK06pj26nyzQptKzNqaLNReTslgZH+wMpmGGnmc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89p+7msyJQwvTd3xS05rbxtXLoFV88yaOlPsteYF
 SDrLd/VMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOpXrxn+ik5d8JjV90ONVsZ/jr+vlzzc1CsUxuvTNiswpfhlXkQwB8N/z9c/X07
 Z/dEr8pDrReG4FGdfnQtNVatt95a+715nxV7BBgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Apple Silicon Macs have a complex audio subsystem consisting
of an I2S peripheral (MCA) and multiple codecs of various
models and capabilities. Some machines have a basic mono
speaker with hardware downmix, while others have a very
intricate stereo system consisting of multiple codecs and
drivers per L/R channel. Some machines report voice coil
voltage and current information back to the SoC, and others
do not. All machines have a headset jack.

Add an ASoC machine driver for this platform.

To express all of this sanely, we initialise the correct
combinations of codecs/I2S ports as DAI backends and link
them to a synthetic frontend. Each frontend is linked to
a PCM, one for the headset codec and one for the speaker
system on the target machine.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/Kconfig    |   18 +
 sound/soc/apple/Makefile   |    4 +
 sound/soc/apple/macaudio.c | 1734 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 1756 insertions(+)

diff --git a/sound/soc/apple/Kconfig b/sound/soc/apple/Kconfig
index f1d071a99fbf..549a5f4906c5 100644
--- a/sound/soc/apple/Kconfig
+++ b/sound/soc/apple/Kconfig
@@ -9,4 +9,22 @@ config SND_SOC_APPLE_MCA
 	  This option enables an ASoC platform driver for MCA peripherals found
 	  on Apple Silicon SoCs.
 
+config SND_SOC_APPLE_MACAUDIO
+	tristate "Sound support for Apple Silicon Macs"
+	depends on ARCH_APPLE || COMPILE_TEST
+	select SND_SOC_APPLE_MCA
+	select APPLE_ADMAC if DMADEVICES
+	select COMMON_CLK_APPLE_NCO if COMMON_CLK
+	select SND_SOC_TAS2764 if I2C
+	select SND_SOC_TAS2770 if I2C
+	select SND_SOC_CS42L83 if I2C
+	select SND_SOC_CS42L84 if I2C
+	help
+	  This option enables an ASoC machine-level driver for Apple Silicon Macs
+	  and it also enables the required SoC and codec drivers for overall
+	  sound support on these machines. Say Y here if you have an Apple Silicon
+	  Mac.
+
+	  This driver can also be compiled as a module. If so, it will be called
+	  snd-soc-macaudio.
 endmenu
diff --git a/sound/soc/apple/Makefile b/sound/soc/apple/Makefile
index 252ba5fc18cb..90ad83adc588 100644
--- a/sound/soc/apple/Makefile
+++ b/sound/soc/apple/Makefile
@@ -2,3 +2,7 @@
 snd-soc-apple-mca-y	:= mca.o
 
 obj-$(CONFIG_SND_SOC_APPLE_MCA)	+= snd-soc-apple-mca.o
+
+snd-soc-macaudio-y	:= macaudio.o
+
+obj-$(CONFIG_SND_SOC_APPLE_MACAUDIO)	+= snd-soc-macaudio.o
diff --git a/sound/soc/apple/macaudio.c b/sound/soc/apple/macaudio.c
new file mode 100644
index 000000000000..2baabf5f3016
--- /dev/null
+++ b/sound/soc/apple/macaudio.c
@@ -0,0 +1,1734 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// ASoC machine driver for Apple Silicon Macs
+//
+// Copyright (C) The Asahi Linux Contributors
+//
+// Based on sound/soc/qcom/{sc7180.c|common.c}
+// Copyright (c) 2018, Linaro Limited.
+// Copyright (c) 2020, The Linux Foundation. All rights reserved.
+//
+//
+// The platform driver has independent frontend and backend DAIs with the
+// option of routing backends to any of the frontends. The platform
+// driver configures the routing based on DPCM couplings in ASoC runtime
+// structures, which in turn are determined from DAPM paths by ASoC. But the
+// platform driver doesn't supply relevant DAPM paths and leaves that up for
+// the machine driver to fill in. The filled-in virtual topology can be
+// anything as long as any backend isn't connected to more than one frontend
+// at any given time. (The limitation is due to the unsupported case of
+// reparenting of live BEs.)
+
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/simple_card_utils.h>
+#include <sound/soc.h>
+#include <sound/soc-jack.h>
+#include <uapi/linux/input-event-codes.h>
+
+#define DRIVER_NAME "snd-soc-macaudio"
+
+/*
+ * CPU side is bit and frame clock provider
+ * I2S has both clocks inverted
+ */
+#define MACAUDIO_DAI_FMT	(SND_SOC_DAIFMT_I2S | \
+				 SND_SOC_DAIFMT_CBC_CFC | \
+				 SND_SOC_DAIFMT_GATED | \
+				 SND_SOC_DAIFMT_IB_IF)
+#define MACAUDIO_JACK_MASK	(SND_JACK_HEADSET | SND_JACK_HEADPHONE)
+#define MACAUDIO_SLOTWIDTH	32
+/*
+ * Maximum BCLK frequency
+ *
+ * Codec maximums:
+ *  CS42L42  26.0 MHz
+ *  TAS2770  27.1 MHz
+ *  TAS2764  24.576 MHz
+ */
+#define MACAUDIO_MAX_BCLK_FREQ	24576000
+
+#define SPEAKER_MAGIC_VALUE ((s32)0xdec1be15)
+/* milliseconds */
+#define SPEAKER_LOCK_TIMEOUT 250
+
+enum macaudio_amp_type {
+	AMP_NONE,
+	AMP_TAS5770,
+	AMP_SN012776,
+	AMP_SSM3515,
+};
+
+enum macaudio_spkr_config {
+	SPKR_NONE,	/* No speakers */
+	SPKR_1W,	/* 1 woofer / ch */
+	SPKR_2W,	/* 2 woofers / ch */
+	SPKR_1W1T,	/* 1 woofer + 1 tweeter / ch */
+	SPKR_2W1T,	/* 2 woofers + 1 tweeter / ch */
+};
+
+struct macaudio_platform_cfg {
+	bool enable_speakers;
+	enum macaudio_amp_type amp;
+	enum macaudio_spkr_config speakers;
+	bool stereo;
+	int amp_gain;
+	int safe_vol;
+};
+
+static const char * const volume_control_names[] = {
+	[AMP_TAS5770] = "Speaker Playback Volume",
+	[AMP_SN012776] = "Speaker Volume",
+	[AMP_SSM3515] = "DAC Playback Volume",
+};
+
+#define SN012776_0DB 201
+#define SN012776_DB(x) (SN012776_0DB + 2 * (x))
+/* Same as SN012776 */
+#define TAS5770_0DB SN012776_0DB
+#define TAS5770_DB(x) SN012776_DB(x)
+
+#define SSM3515_0DB (255 - 64) /* +24dB max, steps of 3/8 dB */
+#define SSM3515_DB(x) (SSM3515_0DB + (8 * (x) / 3))
+
+struct ma_codec_idle {
+	int idle_mode;
+	u32 idle_mask;
+};
+
+struct macaudio_snd_data {
+	struct snd_soc_card card;
+	struct snd_soc_jack jack;
+	int jack_plugin_state;
+
+	const struct macaudio_platform_cfg *cfg;
+	bool has_speakers;
+	bool has_sense;
+	bool has_safety;
+	unsigned int max_channels;
+
+	struct macaudio_link_props {
+		/* frontend props */
+		unsigned int bclk_ratio;
+		bool is_sense;
+
+		/* backend props */
+		bool is_speakers;
+		bool is_headphones;
+		unsigned int tdm_mask;
+		struct ma_codec_idle *codecs;
+	} *link_props;
+
+	int speaker_sample_rate;
+	struct snd_kcontrol *speaker_sample_rate_kctl;
+
+	struct mutex be_link_mutex;
+
+	struct mutex volume_lock_mutex;
+	bool speaker_volume_unlocked;
+	bool speaker_volume_was_locked;
+	struct snd_kcontrol *speaker_lock_kctl;
+	u64 bes_active;
+	bool speaker_lock_timeout_enabled;
+	ktime_t speaker_lock_timeout;
+	ktime_t speaker_lock_remain;
+	struct delayed_work lock_timeout_work;
+	struct work_struct lock_update_work;
+
+};
+
+SND_SOC_DAILINK_DEFS(primary,
+	DAILINK_COMP_ARRAY(COMP_CPU("mca-pcm-0")), // CPU
+	DAILINK_COMP_ARRAY(COMP_DUMMY()), // CODEC
+	DAILINK_COMP_ARRAY(COMP_EMPTY())); // platform (filled at runtime)
+
+SND_SOC_DAILINK_DEFS(secondary,
+	DAILINK_COMP_ARRAY(COMP_CPU("mca-pcm-1")), // CPU
+	DAILINK_COMP_ARRAY(COMP_DUMMY()), // CODEC
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(sense,
+	DAILINK_COMP_ARRAY(COMP_CPU("mca-pcm-2")), // CPU
+	DAILINK_COMP_ARRAY(COMP_DUMMY()), // CODEC
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link macaudio_fe_links[] = {
+	{
+		.name = "Primary",
+		.stream_name = "Primary",
+		.dynamic = 1,
+		.dpcm_merged_rate = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_format = 1,
+		.dai_fmt = MACAUDIO_DAI_FMT,
+		SND_SOC_DAILINK_REG(primary),
+	},
+	{
+		.name = "Secondary",
+		.stream_name = "Secondary",
+		.dynamic = 1,
+		.dpcm_merged_rate = 1,
+		.dpcm_merged_chan = 1,
+		.dpcm_merged_format = 1,
+		.dai_fmt = MACAUDIO_DAI_FMT,
+		.playback_only = 1,
+		.nonatomic = 1,
+		SND_SOC_DAILINK_REG(secondary),
+	},
+	{
+		.name = "Speaker Sense",
+		.stream_name = "Speaker Sense",
+		.capture_only = 1,
+		.dynamic = 1,
+		.dai_fmt = (SND_SOC_DAIFMT_I2S |
+			    SND_SOC_DAIFMT_CBP_CFP |
+			    SND_SOC_DAIFMT_GATED |
+			    SND_SOC_DAIFMT_IB_IF),
+		.nonatomic = 1,
+		SND_SOC_DAILINK_REG(sense),
+	},
+};
+
+static struct macaudio_link_props macaudio_fe_link_props[] = {
+	{
+		/*
+		 * Primary FE
+		 *
+		 * The bclk ratio at 64 for the primary frontend is important
+		 * to ensure that the headphones codec's idea of left and right
+		 * in a stereo stream over I2S fits in nicely with everyone else's.
+		 * (This is until the headphones codec's driver supports
+		 * set_tdm_slot.)
+		 *
+		 * The low bclk ratio precludes transmitting more than two
+		 * channels over I2S, but that's okay since there is the secondary
+		 * FE for speaker arrays anyway.
+		 */
+		.bclk_ratio = 64,
+	},
+	{
+		/*
+		 * Secondary FE
+		 *
+		 * Here we want frames plenty long to be able to drive all
+		 * those fancy speaker arrays.
+		 */
+		.bclk_ratio = 256,
+	},
+	{
+		.is_sense = 1,
+	}
+};
+
+static void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool unlock)
+{
+	int ret, max;
+	struct snd_kcontrol *kctl;
+	const char *suffix = volume_control_names[ma->cfg->amp];
+	size_t suffixlen;
+
+	if (!suffix) {
+		WARN_ON_ONCE(1);
+		return;
+	}
+
+	suffixlen = strlen(suffix);
+
+	switch (ma->cfg->amp) {
+	case AMP_NONE:
+		WARN_ON_ONCE(1);
+		return;
+	case AMP_TAS5770:
+		if (unlock)
+			max = TAS5770_0DB;
+		else
+			max = TAS5770_DB(ma->cfg->safe_vol);
+		break;
+	case AMP_SN012776:
+		if (unlock)
+			max = SN012776_0DB;
+		else
+			max = SN012776_DB(ma->cfg->safe_vol);
+		break;
+	case AMP_SSM3515:
+		if (unlock)
+			max = SSM3515_0DB;
+		else
+			max = SSM3515_DB(ma->cfg->safe_vol);
+		break;
+	}
+
+	/* The caller has already taken the rw semaphore as necessary */
+	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
+		const char *suffix_start;
+		size_t namelen = strlen(kctl->id.name);
+
+		if (namelen < suffixlen)
+			continue;
+
+		suffix_start = kctl->id.name + namelen - suffixlen;
+
+		if (strncmp(suffix_start, suffix, suffixlen))
+			continue;
+
+		ret = snd_soc_limit_volume(&ma->card, kctl->id.name, max);
+		if (ret < 0)
+			dev_err(ma->card.dev, "Failed to %slock volume %s: %d\n",
+				unlock ? "un" : "", kctl->id.name, ret);
+	}
+}
+
+static void macaudio_vlimit_update(struct macaudio_snd_data *ma, bool take_rwsem)
+{
+	bool unlock = true;
+	const char *reason;
+
+	/* Do nothing if there is no safety configured */
+	if (!ma->has_safety)
+		return;
+
+	/* Check that the control has been pinged within the timeout */
+	if (ma->speaker_lock_remain <= 0) {
+		reason = "Lock timeout";
+		unlock = false;
+	}
+
+	/*
+	 * If this has been called from either of the safety interlock
+	 * workqueues, the core API has not taken controls_rwsem for us.
+	 * Take the write semaphore since macaudio_vlimit_unlock writes
+	 * to the kcontrols.
+	 */
+	if (take_rwsem)
+		down_write(&ma->card.snd_card->controls_rwsem);
+
+	if (unlock != ma->speaker_volume_unlocked) {
+		if (unlock) {
+			dev_info(ma->card.dev, "Speaker volumes unlocked\n");
+		} else  {
+			dev_info(ma->card.dev, "Speaker volumes locked: %s\n", reason);
+			ma->speaker_volume_was_locked = true;
+		}
+
+		macaudio_vlimit_unlock(ma, unlock);
+		ma->speaker_volume_unlocked = unlock;
+		snd_ctl_notify(ma->card.snd_card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &ma->speaker_lock_kctl->id);
+	}
+
+	if (take_rwsem)
+		up_write(&ma->card.snd_card->controls_rwsem);
+}
+
+static void macaudio_vlimit_enable_timeout(struct macaudio_snd_data *ma)
+{
+	guard(mutex)(&ma->volume_lock_mutex);
+
+	if (ma->speaker_lock_timeout_enabled) {
+		return;
+	}
+
+	if (ma->speaker_lock_remain > 0) {
+		ma->speaker_lock_timeout = ktime_add(ktime_get(), ma->speaker_lock_remain);
+		schedule_delayed_work(&ma->lock_timeout_work,
+				      usecs_to_jiffies(ktime_to_us(ma->speaker_lock_remain)));
+		dev_dbg(ma->card.dev, "Enabling volume limit timeout: %ld us left\n",
+			(long)ktime_to_us(ma->speaker_lock_remain));
+	}
+
+	macaudio_vlimit_update(ma, true);
+
+	ma->speaker_lock_timeout_enabled = true;
+}
+
+static void macaudio_vlimit_disable_timeout(struct macaudio_snd_data *ma)
+{
+	ktime_t now;
+
+	guard(mutex)(&ma->volume_lock_mutex);
+
+	if (!ma->speaker_lock_timeout_enabled) {
+		return;
+	}
+
+	now = ktime_get();
+
+	cancel_delayed_work(&ma->lock_timeout_work);
+
+	if (ktime_after(now, ma->speaker_lock_timeout))
+		ma->speaker_lock_remain = 0;
+	else if (ma->speaker_lock_remain > 0)
+		ma->speaker_lock_remain = ktime_sub(ma->speaker_lock_timeout, now);
+
+	dev_dbg(ma->card.dev, "Disabling volume limit timeout: %ld us left\n",
+		(long)ktime_to_us(ma->speaker_lock_remain));
+
+	macaudio_vlimit_update(ma, true);
+
+	ma->speaker_lock_timeout_enabled = false;
+}
+
+static void macaudio_vlimit_timeout_work(struct work_struct *wrk)
+{
+	struct macaudio_snd_data *ma = container_of(to_delayed_work(wrk),
+						    struct macaudio_snd_data, lock_timeout_work);
+
+	guard(mutex)(&ma->volume_lock_mutex);
+	ma->speaker_lock_remain = 0;
+	macaudio_vlimit_update(ma, true);
+}
+
+static void macaudio_vlimit_update_work(struct work_struct *wrk)
+{
+	struct macaudio_snd_data *ma = container_of(wrk,
+						    struct macaudio_snd_data, lock_update_work);
+
+	guard(mutex)(&ma->be_link_mutex);
+
+	if (ma->bes_active)
+		macaudio_vlimit_enable_timeout(ma);
+	else
+		macaudio_vlimit_disable_timeout(ma);
+}
+
+static int macaudio_copy_link(struct device *dev, struct snd_soc_dai_link *target,
+			       struct snd_soc_dai_link *source)
+{
+	memcpy(target, source, sizeof(struct snd_soc_dai_link));
+
+	target->cpus = devm_kmemdup(dev, target->cpus,
+				sizeof(*target->cpus) * target->num_cpus,
+				GFP_KERNEL);
+	target->codecs = devm_kmemdup(dev, target->codecs,
+				sizeof(*target->codecs) * target->num_codecs,
+				GFP_KERNEL);
+	target->platforms = devm_kmemdup(dev, target->platforms,
+				sizeof(*target->platforms) * target->num_platforms,
+				GFP_KERNEL);
+
+	if (!target->cpus || !target->codecs || !target->platforms)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int macaudio_parse_of_component(struct device_node *node, int index,
+				struct snd_soc_dai_link_component *comp)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	ret = of_parse_phandle_with_args(node, "sound-dai", "#sound-dai-cells",
+						index, &args);
+	if (ret)
+		return ret;
+	comp->of_node = args.np;
+	return snd_soc_get_dai_name(&args, &comp->dai_name);
+}
+
+/*
+ * Parse one DPCM backend from the devicetree. This means taking one
+ * of the CPU DAIs and combining it with one or more CODEC DAIs.
+ */
+static int macaudio_parse_of_be_dai_link(struct snd_soc_card *card,
+				struct snd_soc_dai_link *link,
+				int be_index, int ncodecs_per_be,
+				struct device_node *cpu,
+				struct device_node *codec)
+{
+	struct snd_soc_dai_link_component *comp;
+	struct device *dev = card->dev;
+	int codec_base = be_index * ncodecs_per_be;
+	int ret, i;
+
+	link->no_pcm = 1;
+
+	link->dai_fmt = MACAUDIO_DAI_FMT;
+
+	link->num_codecs = ncodecs_per_be;
+	link->codecs = devm_kcalloc(dev, ncodecs_per_be,
+				    sizeof(*comp), GFP_KERNEL);
+	link->num_cpus = 1;
+	link->cpus = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
+
+	if (!link->codecs || !link->cpus)
+		return -ENOMEM;
+
+	link->num_platforms = 0;
+
+	for_each_link_codecs(link, i, comp) {
+		ret = macaudio_parse_of_component(codec, codec_base + i, comp);
+		if (ret)
+			return dev_err_probe(card->dev, ret,
+					     "parsing CODEC DAI of link '%s' at %pOF\n",
+					     link->name, codec);
+	}
+
+	ret = macaudio_parse_of_component(cpu, be_index, link->cpus);
+	if (ret)
+		return dev_err_probe(card->dev, ret, "parsing CPU DAI of link '%s' at %pOF\n",
+				     link->name, cpu);
+
+	link->name = link->cpus[0].dai_name;
+
+	return 0;
+}
+
+static int macaudio_get_codec_idle_props(struct device *dev, struct device_node *np,
+					 struct ma_codec_idle *idle, int i, int be_index,
+					 int ncodecs_per_cpu)
+{
+	char propname[32];
+	const char *idle_mode;
+	int ret;
+	/* DT codec index depends on DAI BE index */
+	int sys_codec = i + (be_index * ncodecs_per_cpu);
+
+	snprintf(propname, 32, "dai-tdm-idle-mode-%d", sys_codec);
+	ret = of_property_read_string(np, propname, &idle_mode);
+	if (ret) {
+		dev_dbg(dev, "Codec %d has no idle mode property\n", sys_codec);
+		return ret;
+	}
+
+	if (!strncmp(idle_mode, "zero", 5))
+		idle->idle_mode = SND_SOC_DAI_TDM_IDLE_ZERO;
+	else if (!strncmp(idle_mode, "pulldown", 9))
+		idle->idle_mode = SND_SOC_DAI_TDM_IDLE_PULLDOWN;
+	else {
+		dev_err(dev, "Codec %d has unsupported idle mode %s\n", sys_codec, idle_mode);
+		return -EINVAL;
+	}
+
+	snprintf(propname, 32, "dai-tdm-slot-tx-idle-mask-%d", sys_codec);
+	/*
+	 * Some codecs do not need a mask configured, so we don't care if
+	 * this fails
+	 */
+	of_property_read_u32(np, propname, &idle->idle_mask);
+
+	return 0;
+}
+
+static int macaudio_parse_of(struct macaudio_snd_data *ma, struct snd_soc_card *card)
+{
+	struct device_node *codec = NULL;
+	struct device_node *cpu = NULL;
+	struct device_node *np = NULL;
+	struct device_node *platform = NULL;
+	struct snd_soc_dai_link *link = NULL;
+	struct device *dev = card->dev;
+	struct macaudio_link_props *link_props;
+	int ret, num_links, i;
+
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret) {
+		dev_err_probe(dev, ret, "parsing card name\n");
+		return ret;
+	}
+
+	/*
+	 * Set long_name to prevent snd_soc_set_dmi_name() from setting one from
+	 * make believe data u-boot provides in its SMBIOS emulation.
+	 */
+	card->long_name = card->name;
+
+	/* Populate links, start with the fixed number of FE links */
+	num_links = ARRAY_SIZE(macaudio_fe_links);
+
+	/* Now add together the (dynamic) number of BE links */
+	for_each_available_child_of_node(dev->of_node, np) {
+		int num_cpus;
+
+		cpu = of_get_child_by_name(np, "cpu");
+		if (!cpu) {
+			ret = dev_err_probe(dev, -EINVAL,
+				"missing CPU DAI node at %pOF\n", np);
+			goto err_free;
+		}
+
+		num_cpus = of_count_phandle_with_args(cpu, "sound-dai",
+						"#sound-dai-cells");
+
+		if (num_cpus <= 0) {
+			ret = dev_err_probe(card->dev, -EINVAL,
+				"missing sound-dai property at %pOF\n", cpu);
+			goto err_free;
+		}
+		of_node_put(cpu);
+		cpu = NULL;
+
+		/* Each CPU specified counts as one BE link */
+		num_links += num_cpus;
+	}
+
+	/* Allocate the DAI link array */
+	card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	ma->link_props = devm_kcalloc(dev, num_links, sizeof(*ma->link_props), GFP_KERNEL);
+	if (!card->dai_link || !ma->link_props)
+		return -ENOMEM;
+
+	link = card->dai_link;
+	link_props = ma->link_props;
+
+	for (i = 0; i < ARRAY_SIZE(macaudio_fe_links); i++) {
+		ret = macaudio_copy_link(dev, link, &macaudio_fe_links[i]);
+		if (ret)
+			goto err_free;
+
+		memcpy(link_props, &macaudio_fe_link_props[i], sizeof(struct macaudio_link_props));
+		link++; link_props++;
+	}
+
+	for (i = 0; i < num_links; i++)
+		card->dai_link[i].id = i;
+
+	/* We might disable the speakers, so count again */
+	num_links = ARRAY_SIZE(macaudio_fe_links);
+
+	/* Fill in the BEs */
+	for_each_available_child_of_node(dev->of_node, np) {
+		const char *link_name;
+		bool speakers;
+		int be_index, num_codecs, num_bes, ncodecs_per_cpu, nchannels;
+		unsigned int left_mask, right_mask;
+
+		ret = of_property_read_string(np, "link-name", &link_name);
+		if (ret) {
+			dev_err_probe(card->dev, ret, "missing link name\n");
+			goto err_free;
+		}
+
+		dev_dbg(card->dev, "parsing link '%s'\n", link_name);
+
+		speakers = !!(str_has_prefix(link_name, "Speaker"));
+		if (speakers) {
+			if (!ma->cfg->enable_speakers) {
+				dev_err(card->dev, "Driver can't assure safety on this model, disabling speakers\n");
+				continue;
+			}
+			ma->has_speakers = 1;
+			if (ma->cfg->amp != AMP_SSM3515 && ma->cfg->safe_vol != 0)
+				ma->has_sense = 1;
+		}
+
+		cpu = of_get_child_by_name(np, "cpu");
+		codec = of_get_child_by_name(np, "codec");
+
+		if (!codec || !cpu) {
+			ret = dev_err_probe(dev, -EINVAL,
+				"missing DAI specifications for '%s'\n", link_name);
+			goto err_free;
+		}
+
+		num_bes = of_count_phandle_with_args(cpu, "sound-dai",
+						     "#sound-dai-cells");
+		if (num_bes <= 0) {
+			ret = dev_err_probe(card->dev, -EINVAL,
+				"missing sound-dai property at %pOF\n", cpu);
+			goto err_free;
+		}
+
+		num_codecs = of_count_phandle_with_args(codec, "sound-dai",
+							"#sound-dai-cells");
+		if (num_codecs <= 0) {
+			ret = dev_err_probe(card->dev, -EINVAL,
+				"missing sound-dai property at %pOF\n", codec);
+			goto err_free;
+		}
+
+		dev_dbg(card->dev, "link '%s': %d CPUs %d CODECs\n",
+			link_name, num_bes, num_codecs);
+
+		if (num_codecs % num_bes != 0) {
+			ret = dev_err_probe(card->dev, -EINVAL,
+				"bad combination of CODEC (%d) and CPU (%d) number at %pOF\n",
+				num_codecs, num_bes, np);
+			goto err_free;
+		}
+
+		/*
+		 * Now parse the cpu/codec lists into a number of DPCM backend links.
+		 * In each link there will be one DAI from the cpu list paired with
+		 * an evenly distributed number of DAIs from the codec list. (As is
+		 * the binding semantics.)
+		 */
+		ncodecs_per_cpu = num_codecs / num_bes;
+		nchannels = num_codecs * (speakers ? 1 : 2);
+
+		/* Save the max number of channels on the platform */
+		if (nchannels > ma->max_channels)
+			ma->max_channels = nchannels;
+
+		/*
+		 * If there is a single speaker, assign two channels to it, because
+		 * it can do downmix.
+		 */
+		if (nchannels < 2)
+			nchannels = 2;
+
+		left_mask = 0;
+		for (i = 0; i < nchannels; i += 2)
+			left_mask = left_mask << 2 | 1;
+		right_mask = left_mask << 1;
+
+		num_links += num_bes;
+
+		for (be_index = 0; be_index < num_bes; be_index++) {
+			/*
+			 * Set initial link name to be overwritten by a BE-specific
+			 * name later so that we can use at least use the provisional
+			 * name in error messages.
+			 */
+			link->name = link_name;
+
+			ret = macaudio_parse_of_be_dai_link(card, link, be_index,
+							    ncodecs_per_cpu, cpu, codec);
+			if (ret)
+				goto err_free;
+
+			link->nonatomic = link_props->is_speakers = speakers;
+			link_props->is_headphones = !speakers;
+
+			link_props->codecs = devm_kcalloc(dev, ncodecs_per_cpu,
+							  sizeof(struct ma_codec_idle), GFP_KERNEL);
+			if (!link_props->codecs) {
+				ret = -ENOMEM;
+				goto err_free;
+			}
+
+			for (i = 0; i < ncodecs_per_cpu; i++) {
+				ret = macaudio_get_codec_idle_props(dev, np, &link_props->codecs[i],
+								    i, be_index, ncodecs_per_cpu);
+
+				/* Not every codec's bus keeper will be configured */
+				if (ret)
+					dev_dbg(card->dev, "Codec has bad idle props. Skipping.\n");
+			}
+
+			if (num_bes == 2)
+				/* This sound peripheral is split between left and right BE */
+				link_props->tdm_mask = be_index ? right_mask : left_mask;
+			else
+				/* One BE covers all of the peripheral */
+				link_props->tdm_mask = left_mask | right_mask;
+
+			/* Steal platform OF reference for use in FE links later */
+			platform = link->cpus->of_node;
+
+			link++; link_props++;
+		}
+
+		of_node_put(codec);
+		of_node_put(cpu);
+		cpu = codec = NULL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(macaudio_fe_links); i++)
+		card->dai_link[i].platforms->of_node = platform;
+
+	/* Skip the speaker sense PCM link if this amp has no sense (or no speakers) */
+	if (!ma->has_sense) {
+		for (i = 0; i < ARRAY_SIZE(macaudio_fe_links); i++) {
+			if (ma->link_props[i].is_sense) {
+				memmove(&card->dai_link[i], &card->dai_link[i + 1],
+					(num_links - i - 1) * sizeof(struct snd_soc_dai_link));
+				num_links--;
+				break;
+			}
+		}
+	}
+
+	card->num_links = num_links;
+
+	return 0;
+
+err_free:
+	of_node_put(codec);
+	of_node_put(cpu);
+	of_node_put(np);
+
+	if (!card->dai_link)
+		return ret;
+
+	for (i = 0; i < num_links; i++) {
+		snd_soc_of_put_dai_link_codecs(&card->dai_link[i]);
+		snd_soc_of_put_dai_link_cpus(&card->dai_link[i]);
+	}
+
+	return ret;
+}
+
+static int macaudio_get_runtime_bclk_ratio(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dpcm *dpcm;
+
+	/*
+	 * If this is a FE, look it up in link_props directly.
+	 * If this is a BE, look it up in the respective FE.
+	 */
+	if (!rtd->dai_link->no_pcm)
+		return ma->link_props[rtd->dai_link->id].bclk_ratio;
+
+	for_each_dpcm_fe(rtd, substream->stream, dpcm) {
+		int fe_id = dpcm->fe->dai_link->id;
+
+		return ma->link_props[fe_id].bclk_ratio;
+	}
+
+	return 0;
+}
+
+static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_interval *rate = hw_param_interval(params,
+						      SNDRV_PCM_HW_PARAM_RATE);
+	int bclk_ratio = macaudio_get_runtime_bclk_ratio(substream);
+	int i;
+
+	if (props->is_sense) {
+		/*
+		 * The sense FE is opened exclusively by speakersafetyd in blocking
+		 * mode. At the time of opening, this sample rate may be 0 if the
+		 * speaker BE is not running. This does not matter, as speakersafetyd
+		 * only cares about the active sample rate exported to the virtual
+		 * sample rate kcontrol below.
+		 */
+		rate->min = rate->max = cpu_dai->symmetric_rate;
+		return 0;
+	}
+
+	/* Speakers BE */
+	if (props->is_speakers) {
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+			/* Sense PCM: keep the existing BE rate (0 if not already running) */
+			rate->min = rate->max = cpu_dai->symmetric_rate;
+
+			return 0;
+		}
+
+		/*
+		 * Set the sense PCM rate control to inform userspace of the
+		 * new sample rate.
+		 */
+		ma->speaker_sample_rate = params_rate(params);
+		snd_ctl_notify(rtd->card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &ma->speaker_sample_rate_kctl->id);
+	}
+
+	if (bclk_ratio) {
+		struct snd_soc_dai *dai;
+		int mclk = params_rate(params) * bclk_ratio;
+
+		for_each_rtd_codec_dais(rtd, i, dai) {
+			snd_soc_dai_set_sysclk(dai, 0, mclk, SND_SOC_CLOCK_IN);
+			snd_soc_dai_set_bclk_ratio(dai, bclk_ratio);
+		}
+
+		snd_soc_dai_set_sysclk(cpu_dai, 0, mclk, SND_SOC_CLOCK_OUT);
+		snd_soc_dai_set_bclk_ratio(cpu_dai, bclk_ratio);
+	}
+
+	return 0;
+}
+
+static int macaudio_fe_startup(struct snd_pcm_substream *substream)
+{
+
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+	int max_rate, ret;
+
+	if (props->is_sense) {
+		/*
+		 * Sense stream will not return data while playback is inactive,
+		 * so do not time out.
+		 */
+		substream->wait_time = MAX_SCHEDULE_TIMEOUT;
+		return 0;
+	}
+
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS,
+					   0, ma->max_channels);
+	if (ret < 0)
+		return ret;
+
+	max_rate = MACAUDIO_MAX_BCLK_FREQ / props->bclk_ratio;
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, max_rate);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int macaudio_fe_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *be;
+	struct snd_soc_dpcm *dpcm;
+
+	be = NULL;
+	for_each_dpcm_be(rtd, substream->stream, dpcm) {
+		be = dpcm->be;
+		break;
+	}
+
+	if (!be) {
+		dev_err(rtd->dev, "opening PCM device '%s' with no audio route configured by the user\n",
+				rtd->dai_link->name);
+		return -EINVAL;
+	}
+
+	return macaudio_dpcm_hw_params(substream, params);
+}
+
+
+static void macaudio_dpcm_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *dai;
+	int bclk_ratio = macaudio_get_runtime_bclk_ratio(substream);
+	int i;
+
+	if (bclk_ratio) {
+		for_each_rtd_codec_dais(rtd, i, dai)
+			snd_soc_dai_set_sysclk(dai, 0, 0, SND_SOC_CLOCK_IN);
+
+		snd_soc_dai_set_sysclk(cpu_dai, 0, 0, SND_SOC_CLOCK_OUT);
+	}
+}
+
+static int macaudio_be_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+	struct snd_soc_dai *dai;
+	int i;
+
+	if (props->is_speakers && substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		/*
+		 * Clear the DAI rates, so the next open can change the sample rate.
+		 * This won't happen automatically if the sense PCM is open.
+		 */
+		for_each_rtd_dais(rtd, i, dai) {
+			dai->symmetric_rate = 0;
+		}
+
+		/* Notify userspace that the speakers are closed */
+		ma->speaker_sample_rate = 0;
+		snd_ctl_notify(rtd->card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE,
+			       &ma->speaker_sample_rate_kctl->id);
+	}
+
+	return 0;
+}
+
+static int macaudio_be_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+
+	/* Speaker link is marked nonatomic */
+	if (props->is_speakers && substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		scoped_guard(mutex, &ma->be_link_mutex) {
+			switch (cmd) {
+			case SNDRV_PCM_TRIGGER_START:
+			case SNDRV_PCM_TRIGGER_RESUME:
+			case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+				ma->bes_active |= BIT(rtd->dai_link->id);
+				break;
+			case SNDRV_PCM_TRIGGER_SUSPEND:
+			case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+			case SNDRV_PCM_TRIGGER_STOP:
+				ma->bes_active &= ~BIT(rtd->dai_link->id);
+				break;
+			default:
+				return -EINVAL;
+			}
+		}
+
+		if (ma->has_safety)
+			schedule_work(&ma->lock_update_work);
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops macaudio_fe_ops = {
+	.startup	= macaudio_fe_startup,
+	.shutdown	= macaudio_dpcm_shutdown,
+	.hw_params	= macaudio_fe_hw_params,
+};
+
+static const struct snd_soc_ops macaudio_be_ops = {
+	.hw_free	= macaudio_be_hw_free,
+	.shutdown	= macaudio_dpcm_shutdown,
+	.hw_params	= macaudio_dpcm_hw_params,
+	.trigger	= macaudio_be_trigger,
+};
+
+static int macaudio_be_assign_tdm(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+	struct snd_soc_dai *dai;
+	unsigned int mask;
+	int nslots, ret, i;
+
+	if (!props->tdm_mask)
+		return 0;
+
+	mask = props->tdm_mask;
+	nslots = __fls(mask) + 1;
+
+	if (rtd->dai_link->num_codecs == 1) {
+		dai = snd_soc_rtd_to_codec(rtd, 0);
+		ret = snd_soc_dai_set_tdm_slot(dai, mask, 0, nslots, MACAUDIO_SLOTWIDTH);
+
+		/*
+		 * Headphones get a pass on -ENOTSUPP (see the comment
+		 * around bclk_ratio value for primary FE).
+		 */
+		if (ret == -ENOTSUPP && props->is_headphones)
+			return 0;
+
+		if (props->codecs[0].idle_mode) {
+			ret = snd_soc_dai_set_tdm_idle(dai, props->codecs[0].idle_mask,
+						       0, props->codecs[0].idle_mode, 0);
+			if (ret) {
+				dev_err(card->dev, "Failed to set idle props for codec\n");
+				return ret;
+			}
+
+		}
+
+		return ret;
+	}
+
+	for_each_rtd_codec_dais(rtd, i, dai) {
+		int slot = __ffs(mask);
+
+		mask &= ~(1 << slot);
+		ret = snd_soc_dai_set_tdm_slot(dai, 1 << slot, 0, nslots,
+					       MACAUDIO_SLOTWIDTH);
+		if (ret)
+			return ret;
+
+		if (props->codecs[i].idle_mode) {
+			ret = snd_soc_dai_set_tdm_idle(dai, props->codecs[i].idle_mask,
+						       0, props->codecs[i].idle_mode, 0);
+			if (ret) {
+				dev_err(card->dev, "Failed to set idle props for codec %d\n", i);
+				return ret;
+			}
+
+		}
+	}
+
+	return 0;
+}
+
+static int macaudio_be_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+	struct snd_soc_dai *dai;
+	int i, ret;
+
+	ret = macaudio_be_assign_tdm(rtd);
+	if (ret < 0)
+		return ret;
+
+	if (props->is_headphones) {
+		for_each_rtd_codec_dais(rtd, i, dai)
+			snd_soc_component_set_jack(dai->component, &ma->jack, NULL);
+	}
+
+	return 0;
+}
+
+static void macaudio_be_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+	struct snd_soc_dai *dai;
+	int i;
+
+	if (props->is_headphones) {
+		for_each_rtd_codec_dais(rtd, i, dai)
+			snd_soc_component_set_jack(dai->component, NULL, NULL);
+	}
+}
+
+static int macaudio_fe_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+	int nslots = props->bclk_ratio / MACAUDIO_SLOTWIDTH;
+
+	if (props->is_sense)
+		return snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0, 0xffff, 16, 16);
+
+	return snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), (1 << nslots) - 1,
+					(1 << nslots) - 1, nslots, MACAUDIO_SLOTWIDTH);
+}
+
+static struct snd_soc_jack_pin macaudio_jack_pins[] = {
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
+static int macaudio_probe(struct snd_soc_card *card)
+{
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	ret = snd_soc_card_jack_new_pins(card, "Headphone Jack",
+			SND_JACK_HEADSET | SND_JACK_HEADPHONE,
+			&ma->jack, macaudio_jack_pins,
+			ARRAY_SIZE(macaudio_jack_pins));
+	if (ret < 0) {
+		dev_err(card->dev, "jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int macaudio_add_backend_dai_route(struct snd_soc_card *card, struct snd_soc_dai *dai,
+					  bool is_speakers)
+{
+	struct snd_soc_dapm_route routes[2];
+	struct snd_soc_dapm_route *r;
+	int nroutes = 0;
+	int ret;
+
+	memset(routes, 0, sizeof(routes));
+
+	dev_dbg(card->dev, "adding routes for '%s'\n", dai->name);
+
+	r = &routes[nroutes++];
+	if (is_speakers)
+		r->source = "Speaker Playback";
+	else
+		r->source = "Headphone Playback";
+	r->sink = dai->stream[SNDRV_PCM_STREAM_PLAYBACK].widget->name;
+
+	/* If headphone jack, add capture path */
+	if (!is_speakers) {
+		r = &routes[nroutes++];
+		r->source = dai->stream[SNDRV_PCM_STREAM_CAPTURE].widget->name;
+		r->sink = "Headset Capture";
+	}
+
+	/* If speakers, add sense capture path */
+	if (is_speakers) {
+		r = &routes[nroutes++];
+		r->source = dai->stream[SNDRV_PCM_STREAM_CAPTURE].widget->name;
+		r->sink = "Speaker Sense Capture";
+	}
+
+	ret = snd_soc_dapm_add_routes(card->dapm, routes, nroutes);
+	if (ret)
+		dev_err(card->dev, "failed adding dynamic DAPM routes for %s\n",
+			dai->name);
+	return ret;
+}
+
+static int macaudio_add_pin_routes(struct snd_soc_card *card, struct snd_soc_component *component,
+				   bool is_speakers)
+{
+	struct snd_soc_dapm_route routes[2];
+	struct snd_soc_dapm_route *r;
+	int nroutes = 0;
+	char buf[32];
+	int ret;
+
+	memset(routes, 0, sizeof(routes));
+
+	/* Connect the far ends of CODECs to pins */
+	if (is_speakers) {
+		r = &routes[nroutes++];
+		r->source = "OUT";
+		if (component->name_prefix) {
+			snprintf(buf, sizeof(buf) - 1, "%s OUT", component->name_prefix);
+			r->source = buf;
+		}
+		r->sink = "Speaker";
+	} else {
+		r = &routes[nroutes++];
+		r->source = "Jack HP";
+		r->sink = "Headphone";
+		r = &routes[nroutes++];
+		r->source = "Headset Mic";
+		r->sink = "Jack HS";
+	}
+
+	ret = snd_soc_dapm_add_routes(card->dapm, routes, nroutes);
+	if (ret)
+		dev_err(card->dev, "failed adding dynamic DAPM routes for %s\n",
+			component->name);
+	return ret;
+}
+
+#define CHECK(call, pattern, value)                                            \
+	{                                                                      \
+		int ret = call(card, pattern, value);                          \
+		if (ret < 0) {                                                 \
+			dev_err(card->dev, "%s on '%s': %d\n", #call, pattern, \
+				ret);                                          \
+			return ret;                                            \
+		} else {                                                       \
+			dev_dbg(card->dev, "%s on '%s': %d\n", #call,          \
+				pattern, ret);                                 \
+		}                                                              \
+	}
+
+#define CHECK_CONCAT(call, suffix, value)                           \
+	{                                                           \
+		snprintf(buf, sizeof(buf), "%s%s", prefix, suffix); \
+		CHECK(call, buf, value);                            \
+	}
+
+static int macaudio_set_speaker(struct snd_soc_card *card, const char *prefix, bool tweeter)
+{
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	char buf[256];
+
+	if (!ma->has_speakers)
+		return 0;
+
+	switch (ma->cfg->amp) {
+	case AMP_TAS5770:
+		if (ma->cfg->stereo) {
+			CHECK_CONCAT(snd_soc_set_enum_kctl, "ASI1 Sel", "Left");
+			CHECK_CONCAT(snd_soc_ctl_activate, "ASI1 Sel", 0);
+		}
+
+		CHECK_CONCAT(snd_soc_limit_volume, "Amp Gain Volume", ma->cfg->amp_gain);
+		break;
+	case AMP_SN012776:
+		if (ma->cfg->stereo) {
+			CHECK_CONCAT(snd_soc_set_enum_kctl, "ASI1 Sel", "Left");
+			CHECK_CONCAT(snd_soc_ctl_activate, "ASI1 Sel", 0);
+		}
+
+		CHECK_CONCAT(snd_soc_limit_volume, "Amp Gain Volume", ma->cfg->amp_gain);
+		CHECK_CONCAT(snd_soc_set_enum_kctl, "HPF Corner Frequency",
+			     tweeter ? "800 Hz" : "2 Hz");
+
+		CHECK_CONCAT(snd_soc_ctl_activate, "HPF Corner Frequency", 0);
+
+		CHECK_CONCAT(snd_soc_set_enum_kctl, "OCE Handling", "Retry");
+		CHECK_CONCAT(snd_soc_ctl_activate, "OCE Handling", 0);
+		break;
+	case AMP_SSM3515:
+		/* TODO: check */
+		CHECK_CONCAT(snd_soc_set_enum_kctl, "DAC Analog Gain Select", "8.4 V Span");
+
+		CHECK_CONCAT(snd_soc_ctl_activate, "DAC Analog Gain Select", 0);
+
+		/* TODO: HPF, needs new call to set */
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int macaudio_fixup_controls(struct snd_soc_card *card)
+{
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	const char *p;
+
+	/* Set the card ID early to avoid races with udev */
+	p = strrchr(card->name, ' ');
+	if (p) {
+		snprintf(card->snd_card->id, sizeof(card->snd_card->id),
+			 "Apple%s", p + 1);
+	}
+
+	if (!ma->has_speakers)
+		return 0;
+
+	switch (ma->cfg->speakers) {
+	case SPKR_NONE:
+		return -EINVAL;
+	case SPKR_1W:
+		if (ma->cfg->stereo) {
+			CHECK(macaudio_set_speaker, "Left ", false);
+			CHECK(macaudio_set_speaker, "Right ", false);
+		} else {
+			CHECK(macaudio_set_speaker, "", false);
+		}
+		break;
+	case SPKR_2W:
+		CHECK(macaudio_set_speaker, "Left Front ", false);
+		CHECK(macaudio_set_speaker, "Right Front ", false);
+		CHECK(macaudio_set_speaker, "Left Rear ", false);
+		CHECK(macaudio_set_speaker, "Right Rear ", false);
+		break;
+	case SPKR_1W1T:
+		CHECK(macaudio_set_speaker, "Left Tweeter ", true);
+		CHECK(macaudio_set_speaker, "Right Tweeter ", true);
+		CHECK(macaudio_set_speaker, "Left Woofer ", false);
+		CHECK(macaudio_set_speaker, "Right Woofer ", false);
+		break;
+	case SPKR_2W1T:
+		CHECK(macaudio_set_speaker, "Left Tweeter ", true);
+		CHECK(macaudio_set_speaker, "Right Tweeter ", true);
+		CHECK(macaudio_set_speaker, "Left Woofer 1 ", false);
+		CHECK(macaudio_set_speaker, "Right Woofer 1 ", false);
+		CHECK(macaudio_set_speaker, "Left Woofer 2 ", false);
+		CHECK(macaudio_set_speaker, "Right Woofer 2 ", false);
+		break;
+	}
+
+	return 0;
+}
+
+static const char * const macaudio_spk_mux_texts[] = {
+	/* TODO: Allow speaker array on primary FE */
+	/* "Primary",  */
+	"Secondary",
+};
+
+SOC_ENUM_SINGLE_VIRT_DECL(macaudio_spk_mux_enum, macaudio_spk_mux_texts);
+
+static const struct snd_kcontrol_new macaudio_spk_mux =
+	SOC_DAPM_ENUM("Speaker Playback Mux", macaudio_spk_mux_enum);
+
+static const char * const macaudio_hp_mux_texts[] = {
+	"Primary",
+	/* TODO: Allow headphone codec on secondary FE */
+	/* "Secondary", */
+};
+
+SOC_ENUM_SINGLE_VIRT_DECL(macaudio_hp_mux_enum, macaudio_hp_mux_texts);
+
+static const struct snd_kcontrol_new macaudio_hp_mux =
+	SOC_DAPM_ENUM("Headphone Playback Mux", macaudio_hp_mux_enum);
+
+static const struct snd_soc_dapm_widget macaudio_snd_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+
+	SND_SOC_DAPM_MUX("Speaker Playback Mux", SND_SOC_NOPM, 0, 0, &macaudio_spk_mux),
+	SND_SOC_DAPM_MUX("Headphone Playback Mux", SND_SOC_NOPM, 0, 0, &macaudio_hp_mux),
+
+	SND_SOC_DAPM_AIF_OUT("Speaker Playback", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("Headphone Playback", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("Headset Capture", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("Speaker Sense Capture", NULL, 0, SND_SOC_NOPM, 0, 0),
+};
+
+static int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 192000;
+
+	return 0;
+}
+
+static int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
+{
+	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+
+	/*
+	 * TODO: Check if any locking is in order here. I would
+	 * assume there is some ALSA-level lock, but DAPM implementations
+	 * of kcontrol ops do explicit locking, so look into it.
+	 */
+	uvalue->value.integer.value[0] = ma->speaker_sample_rate;
+
+	return 0;
+}
+
+static int macaudio_slk_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = INT_MIN;
+	uinfo->value.integer.max = INT_MAX;
+
+	return 0;
+}
+
+static int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
+{
+	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+
+	guard(mutex)(&ma->volume_lock_mutex);
+
+	if (uvalue->value.integer.value[0] != SPEAKER_MAGIC_VALUE) {
+		return -EINVAL;
+	}
+
+	/* Serves as a notification that the lock was lost at some point */
+	if (ma->speaker_volume_was_locked) {
+		ma->speaker_volume_was_locked = false;
+		return -ETIMEDOUT;
+	}
+
+	cancel_delayed_work(&ma->lock_timeout_work);
+
+	ma->speaker_lock_remain = ms_to_ktime(SPEAKER_LOCK_TIMEOUT);
+	ma->speaker_lock_timeout = ktime_add(ktime_get(), ma->speaker_lock_remain);
+	macaudio_vlimit_update(ma, false);
+
+	if (ma->speaker_lock_timeout_enabled) {
+		dev_dbg(card->dev, "Volume limit timeout ping: %ld us left\n",
+			(long)ktime_to_us(ma->speaker_lock_remain));
+		schedule_delayed_work(&ma->lock_timeout_work,
+				      usecs_to_jiffies(ktime_to_us(ma->speaker_lock_remain)));
+	}
+
+	return 0;
+}
+
+static int macaudio_slk_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
+{
+	struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+
+	uvalue->value.integer.value[0] = ma->speaker_volume_unlocked ? 1 : 0;
+
+	return 0;
+}
+
+/*
+ * Speaker limit controls go last. We only drop the unlock control,
+ * leaving sample rate, since that can be useful for safety
+ * bring-up before the kernel-side caps are ready.
+ */
+#define MACAUDIO_NUM_SPEAKER_LIMIT_CONTROLS 1
+/*
+ * If there are no speakers configured at all, we can drop both
+ * controls.
+ */
+#define MACAUDIO_NUM_SPEAKER_CONTROLS 2
+
+static const struct snd_kcontrol_new macaudio_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.name = "Speaker Sample Rate",
+		.info = macaudio_sss_info, .get = macaudio_sss_get,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.access = SNDRV_CTL_ELEM_ACCESS_READ |
+			SNDRV_CTL_ELEM_ACCESS_WRITE |
+			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.name = "Speaker Volume Unlock",
+		.info = macaudio_slk_info,
+		.put = macaudio_slk_put, .get = macaudio_slk_get,
+	},
+};
+
+static const struct snd_soc_dapm_route macaudio_dapm_routes[] = {
+	/* Playback paths */
+	/* { "Speaker Playback Mux", "Primary", "PCM0 TX" }, */
+	{ "Speaker Playback Mux", "Secondary", "PCM1 TX" },
+	{ "Speaker Playback", NULL, "Speaker Playback Mux"},
+
+	{ "Headphone Playback Mux", "Primary", "PCM0 TX" },
+	/* { "Headphone Playback Mux", "Secondary", "PCM1 TX" }, */
+	{ "Headphone Playback", NULL, "Headphone Playback Mux"},
+	/*
+	 * Additional paths (to specific I2S ports) are added dynamically.
+	 */
+
+	/* Capture paths */
+	{ "PCM0 RX", NULL, "Headset Capture" },
+
+	/* Sense paths */
+	{ "PCM2 RX", NULL, "Speaker Sense Capture" },
+};
+
+static int macaudio_late_probe(struct snd_soc_card *card)
+{
+	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *dai;
+	int ret, i;
+
+	/* Add the dynamic DAPM routes */
+	for_each_card_rtds(card, rtd) {
+		struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
+
+		if (!rtd->dai_link->no_pcm)
+			continue;
+
+		for_each_rtd_cpu_dais(rtd, i, dai) {
+			ret = macaudio_add_backend_dai_route(card, dai, props->is_speakers);
+
+			if (ret)
+				return ret;
+		}
+
+		for_each_rtd_codec_dais(rtd, i, dai) {
+			ret = macaudio_add_pin_routes(card, dai->component,
+						      props->is_speakers);
+
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (ma->has_speakers)
+		ma->speaker_sample_rate_kctl = snd_soc_card_get_kcontrol(card,
+									 "Speaker Sample Rate");
+
+	if (ma->has_safety) {
+		ma->speaker_lock_kctl = snd_soc_card_get_kcontrol(card,
+								  "Speaker Volume Unlock");
+
+		guard(mutex)(&ma->volume_lock_mutex);
+		macaudio_vlimit_unlock(ma, false);
+	}
+
+	return 0;
+}
+
+/*	enable	amp		speakers	stereo	gain	safe_vol */
+static const struct macaudio_platform_cfg macaudio_j180_cfg = {
+	false,	AMP_SN012776,	SPKR_1W1T,	false,	10,	-20,
+};
+static const struct macaudio_platform_cfg macaudio_j274_cfg = {
+	true,	AMP_TAS5770,	SPKR_1W,	false,	20,	-20,
+};
+static const struct macaudio_platform_cfg macaudio_j293_cfg = {
+	true,	AMP_TAS5770,	SPKR_2W,	true,	15,	-20,
+};
+
+static const struct macaudio_platform_cfg macaudio_j313_cfg = {
+	true,	AMP_TAS5770,	SPKR_1W,	true,	10,	-20,
+};
+
+static const struct macaudio_platform_cfg macaudio_j314_cfg = {
+	true,	AMP_SN012776,	SPKR_2W1T,	true,	15,	-20,
+};
+
+static const struct macaudio_platform_cfg macaudio_j37x_j47x_cfg = {
+	true,	AMP_SN012776,	SPKR_1W,	false,	20,	-20,
+};
+
+static const struct macaudio_platform_cfg macaudio_j413_cfg = {
+	true,	AMP_SN012776,	SPKR_1W1T,	true,	15,	-20,
+};
+
+static const struct macaudio_platform_cfg macaudio_j45x_cfg = {
+	false,	AMP_SSM3515,	SPKR_1W1T,	true,	9,	-20, /* TODO: gain?? */
+};
+
+static const struct macaudio_platform_cfg macaudio_j493_cfg = {
+	true,	AMP_SN012776,	SPKR_2W,	true,	15,	-20,
+};
+
+static const struct macaudio_platform_cfg macaudio_fallback_cfg = {
+	false,	AMP_NONE,	SPKR_NONE,	false,	0,	0,
+};
+
+/*
+ * DT compatible/ID table rules:
+ *
+ * 1. Machines with **identical** speaker configurations (amps, models, chassis)
+ *    are allowed to declare compatibility with the first model (chronologically),
+ *    and are not enumerated in this array.
+ *
+ * 2. Machines with identical amps and speakers (=identical speaker protection
+ *    rules) but a different chassis must use different compatibles, but may share
+ *    the private data structure here. They are explicitly enumerated.
+ *
+ * 3. Machines with different amps or speaker layouts must use separate
+ *    data structures.
+ *
+ * 4. Machines with identical speaker layouts and amps (but possibly different
+ *    speaker models/chassis) may share the data structure, since only userspace
+ *    cares about that (assuming our general -20dB safe level standard holds).
+ */
+static const struct of_device_id macaudio_snd_device_id[]  = {
+	/* Model   ID      Amp         Gain    Speakers */
+	/* j180    AID19   sn012776    10      1× 1W+1T */
+	{ .compatible = "apple,j180-macaudio", .data = &macaudio_j180_cfg },
+	/* j274    AID6    tas5770     20      1× 1W */
+	{ .compatible = "apple,j274-macaudio", .data = &macaudio_j274_cfg },
+	/* j293    AID3    tas5770     15      2× 2W */
+	{ .compatible = "apple,j293-macaudio", .data = &macaudio_j293_cfg },
+	/* j313    AID4    tas5770     10      2× 1W */
+	{ .compatible = "apple,j313-macaudio", .data = &macaudio_j313_cfg },
+	/* j314    AID8    sn012776    15      2× 2W+1T */
+	{ .compatible = "apple,j314-macaudio", .data = &macaudio_j314_cfg },
+	/* j316    AID9    sn012776    15      2× 2W+1T */
+	{ .compatible = "apple,j316-macaudio", .data = &macaudio_j314_cfg },
+	/* j375    AID10   sn012776    20      1× 1W */
+	{ .compatible = "apple,j375-macaudio", .data = &macaudio_j37x_j47x_cfg },
+	/* j413    AID13   sn012776    15      2× 1W+1T */
+	{ .compatible = "apple,j413-macaudio", .data = &macaudio_j413_cfg },
+	/* j414    AID14   sn012776    15      2× 2W+1T Compat: apple,j314-macaudio */
+	/* j415    AID27   sn012776    15      2× 2W+1T */
+	{ .compatible = "apple,j415-macaudio", .data = &macaudio_j314_cfg },
+	/* j416    AID15   sn012776    15      2× 2W+1T Compat: apple,j316-macaudio */
+	/* j456    AID5    ssm3515     15      2× 1W+1T */
+	{ .compatible = "apple,j456-macaudio", .data = &macaudio_j45x_cfg },
+	/* j457    AID7    ssm3515     15      2× 1W+1T Compat: apple,j456-macaudio */
+	/* j473    AID12   sn012776    20      1× 1W */
+	{ .compatible = "apple,j473-macaudio", .data = &macaudio_j37x_j47x_cfg },
+	/* j474    AID26   sn012776    20      1× 1W    Compat: apple,j473-macaudio */
+	/* j475    AID25   sn012776    20      1× 1W    Compat: apple,j375-macaudio */
+	/* j493    AID18   sn012776    15      2× 2W */
+	{ .compatible = "apple,j493-macaudio", .data = &macaudio_j493_cfg },
+	/* Fallback, jack only */
+	{ .compatible = "apple,macaudio"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, macaudio_snd_device_id);
+
+static void macaudio_devm_release(void *data)
+{
+	struct macaudio_snd_data *ma = data;
+
+	cancel_work_sync(&ma->lock_update_work);
+	cancel_delayed_work_sync(&ma->lock_timeout_work);
+}
+
+static int macaudio_snd_platform_probe(struct platform_device *pdev)
+{
+	struct macaudio_snd_data *data;
+	struct device *dev = &pdev->dev;
+	struct snd_soc_dai_link *link;
+	const struct of_device_id *of_id;
+	int ret;
+	int i;
+
+	of_id = of_match_device(macaudio_snd_device_id, dev);
+	if (!of_id)
+		return -EINVAL;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->card.owner = THIS_MODULE;
+	data->card.driver_name = "macaudio";
+	data->card.dapm_widgets = macaudio_snd_widgets;
+	data->card.num_dapm_widgets = ARRAY_SIZE(macaudio_snd_widgets);
+	data->card.dapm_routes = macaudio_dapm_routes;
+	data->card.num_dapm_routes = ARRAY_SIZE(macaudio_dapm_routes);
+	data->card.controls = macaudio_controls;
+	data->card.num_controls = ARRAY_SIZE(macaudio_controls);
+	data->card.probe = macaudio_probe;
+	data->card.late_probe = macaudio_late_probe;
+	data->card.component_chaining = true;
+	data->card.fully_routed = true;
+	data->card.fixup_controls = macaudio_fixup_controls;
+
+	snd_soc_card_set_drvdata(&data->card, data);
+	dev_set_drvdata(&pdev->dev, data);
+	mutex_init(&data->volume_lock_mutex);
+	mutex_init(&data->be_link_mutex);
+
+	data->card.dev = dev;
+
+	if (of_id->data)
+		data->cfg = of_id->data;
+	else
+		data->cfg = &macaudio_fallback_cfg;
+
+	ret = macaudio_parse_of(data, &data->card);
+	if (ret)
+		return ret;
+
+	/* Remove useless controls */
+	if (!data->has_speakers) /* No speakers, remove both */
+		data->card.num_controls -= MACAUDIO_NUM_SPEAKER_CONTROLS;
+	else if (!data->cfg->safe_vol) /* No safety, remove unlock */
+		data->card.num_controls -= MACAUDIO_NUM_SPEAKER_LIMIT_CONTROLS;
+	else /* Speakers with safety, mark us as such */
+		data->has_safety = true;
+
+	for_each_card_prelinks(&data->card, i, link) {
+		if (link->no_pcm) {
+			link->ops = &macaudio_be_ops;
+			link->init = macaudio_be_init;
+			link->exit = macaudio_be_exit;
+		} else {
+			link->ops = &macaudio_fe_ops;
+			link->init = macaudio_fe_init;
+		}
+	}
+
+	INIT_WORK(&data->lock_update_work, macaudio_vlimit_update_work);
+	INIT_DELAYED_WORK(&data->lock_timeout_work, macaudio_vlimit_timeout_work);
+
+	ret = devm_add_action(dev, macaudio_devm_release, data);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_soc_register_card(dev, &data->card);
+	if (ret) {
+		for_each_card_prelinks(&data->card, i, link) {
+			snd_soc_of_put_dai_link_codecs(link);
+			snd_soc_of_put_dai_link_cpus(link);
+		}
+
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver macaudio_snd_driver = {
+	.probe = macaudio_snd_platform_probe,
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = macaudio_snd_device_id,
+		.pm = &snd_soc_pm_ops,
+	},
+};
+module_platform_driver(macaudio_snd_driver);
+
+MODULE_AUTHOR("Martin Povišer <povik+lin@cutebit.org>");
+MODULE_DESCRIPTION("Apple Silicon Macs machine-level sound driver");
+MODULE_LICENSE("GPL");

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021058;
	b=D1h/k5DQH2EHqOOsie1j5v9YpM7mRdXUPkzhG1zD3JRvbxOe9r/04eWkYilsH6fy3kua
	 ZB1nj7qJIz7gLjIF7Gta17DRGPvdWtukSafzFHhkbfBDIqqXqisN22uZXRJiBoCjyHkRk
	 Dj9eljr2i2hFhW/0DC/jlsjG53giIGgxmbRK5eSmFm1hKoHE7QY5daD1LPJDJsSgUMiW6
	 ZPWVUViwjMBCvagdso8KVBU8eRVsm+Z/Oykn2ZEzARdy3sF3zVED3XEH/6KH8Hc4hvzHO
	 VdcAQe/SbUrRTR8HLCDDYhf4jPrJWUzuzlFBJCgrWejmQztJYnb0OZSZ5iNHMBHHFAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021058;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g6ZbTk3GyJuMwncUbVZUaHb/E+qnEkM2l/dKqurizHM=;
	b=VAOqFXgkpQ8o3B+F6lbiHtcQK00Y74ia5ZA+IaakgOqGpc3o8iVtvRZtEUYU0LdC1Y1j
	 7A0xHtBwejom9XhINTzG3lonhcEV2uiDlFmnZa5b2aDwa9HbrwgZyWUZ8Tfua97puH2JV
	 bOY6ewurP2U3mexoXv+Ub/67ifGlrgwImD5ZIon+oBPhzd+tLWWLyFLVuJYZools7u4bT
	 y9I3HF4GZ1yj1VIxym2G+Y6rY4ZZFQbkqpHF8F0ujEaQQvAwbkXDrWj/mVmIVYJq8vWS9
	 mtf6Vh53PI8nqTlmsD7nP25tGtGwn1BN6+KRqTwVRvJMTfpMKW8orm4/9WULShNoh2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0WHyBX3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A95606A31B;
	Mon, 26 Oct 2026 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0WHyBX3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A04E1F01825;
	Mon, 26 Oct 2026 13:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793021057;
	bh=g6ZbTk3GyJuMwncUbVZUaHb/E+qnEkM2l/dKqurizHM=;
	h=From:To:Cc:Subject:Date;
	b=e0WHyBX3EmIxpNiOVPgIo4/qyau2Z9JxzpwmSPxedayxs1ThXnw8O/QpdStK1pgUV
	 thk+/Qw7IPboivPyXyxh5Mt+tXGNL6ZUeh6qIHmbf/XaxU5XcwU2gBXKJsUj6BGxvL
	 y2DxhjEnlVG/7Mo0J3o2opYXu7gn/dQs3WY6/AKwbDWRszQUF/pFVGPttLxz5Hml2W
	 JtPAWRp3oYo0u+JSw8Pxxwq2AQbg/Q8whAOEdDNIm+/Ricd+w9jjYQLLVNx3dvcYKd
	 5fx0IqTpEFC2+PrnUT1EysVrWVWnr7qEAQD7Ka/yN2cnel+yY6Ac91NVjBRuC09fLQ
	 3HJCaup/vV1cQ==
From: Imre Kaloz <kaloz@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: Add driver for SGI RAD1 audio
Date: Mon, 26 Oct 2026 14:23:04 +0100
Message-ID: <20261026132305.16375-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
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

The RAD1 is the SGI Octane's PCI audio controller. Add a driver for
analog and AES3 I/O, AES3 only on digital-only boards. It binds every
10a9:0005 device; only the Octane's built-in RAD1 is tested.

Playback DMA saturates samples not sign-extended from bit 23; it
plays a sign-extended copy.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 MAINTAINERS        |   6 +
 sound/pci/Kconfig  |  10 +
 sound/pci/Makefile |   2 +
 sound/pci/rad1.c   | 995 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 1013 insertions(+)
 create mode 100644 sound/pci/rad1.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a5c7dbd7529c..37d6310c84ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24937,6 +24937,12 @@ F:	include/linux/phylink.h
 F:	include/linux/sfp.h
 K:	phylink\.h|struct\s+phylink|\.phylink|>phylink_|phylink_(autoneg|clear|connect|create|destroy|disconnect|ethtool|helper|mac|mii|of|set|start|stop|test|validate)
 
+SGI RAD1 AUDIO DRIVER
+M:	Imre Kaloz <kaloz@kernel.org>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	sound/pci/rad1.c
+
 SHARED MEMORY COMMUNICATIONS (SMC) SOCKETS
 M:	D. Wythe <alibuda@linux.alibaba.com>
 M:	Dust Li <dust.li@linux.alibaba.com>
diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index 6366f72b3667..e913d8bfe9a7 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -779,6 +779,16 @@ config SND_PCXHR
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-pcxhr.
 
+config SND_RAD1
+	tristate "SGI RAD1"
+	select SND_PCM
+	help
+	  Say Y here to include support for the SGI RAD1 audio controller
+	  found in SGI Octane workstations.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-rad1.
+
 config SND_RIPTIDE
 	tristate "Conexant Riptide"
 	depends on HAS_IOPORT
diff --git a/sound/pci/Makefile b/sound/pci/Makefile
index 9d5e8e12ae73..43551d474f81 100644
--- a/sound/pci/Makefile
+++ b/sound/pci/Makefile
@@ -22,6 +22,7 @@ snd-fm801-y := fm801.o
 snd-intel8x0-y := intel8x0.o
 snd-intel8x0m-y := intel8x0m.o
 snd-maestro3-y := maestro3.o
+snd-rad1-y := rad1.o
 snd-rme32-y := rme32.o
 snd-rme96-y := rme96.o
 snd-sis7019-y := sis7019.o
@@ -48,6 +49,7 @@ obj-$(CONFIG_SND_FM801) += snd-fm801.o
 obj-$(CONFIG_SND_INTEL8X0) += snd-intel8x0.o
 obj-$(CONFIG_SND_INTEL8X0M) += snd-intel8x0m.o
 obj-$(CONFIG_SND_MAESTRO3) += snd-maestro3.o
+obj-$(CONFIG_SND_RAD1) += snd-rad1.o
 obj-$(CONFIG_SND_RME32) += snd-rme32.o
 obj-$(CONFIG_SND_RME96) += snd-rme96.o
 obj-$(CONFIG_SND_SIS7019) += snd-sis7019.o
diff --git a/sound/pci/rad1.c b/sound/pci/rad1.c
new file mode 100644
index 000000000000..0419b95cd03f
--- /dev/null
+++ b/sound/pci/rad1.c
@@ -0,0 +1,995 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SGI RAD1 audio driver
+ *
+ * Copyright (C) 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
+ * Copyright (C) 2026 Imre Kaloz <kaloz@kernel.org>
+ */
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/gcd.h>
+#include <linux/hrtimer.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/spinlock.h>
+
+#include <sound/asoundef.h>
+#include <sound/control.h>
+#include <sound/core.h>
+#include <sound/initval.h>
+#include <sound/pcm.h>
+#include <sound/pcm-indirect.h>
+
+#define RAD1_CHIP_STATUS0	0x3c
+#define RAD1_ADAT_RX_CTL	0x44
+#define RAD1_AES_RX_CTL		0x48
+#define RAD1_ATOD_CTL		0x4c
+#define RAD1_ADAT_TX_CTL	0x50
+#define RAD1_AES_TX_CTL		0x54
+#define RAD1_DTOA_CTL		0x58
+#define RAD1_MISC_CTL		0x70
+#define RAD1_PCI_HOLDOFF	0x74
+#define RAD1_PCI_ARB_CTL	0x78
+#define RAD1_VOLUME		0x7c
+#define RAD1_SYNC_MUX		0x7c	/* digital-only board */
+#define RAD1_RESET		0x80
+#define RAD1_GPIO(n)		(0x84 + 4 * (n))
+#define RAD1_CLOCKGEN_ICTL	0xa0
+#define RAD1_CLOCKGEN_REM	0xa4
+#define RAD1_FREQ_SYNTH_MUX(n)	(0xa8 + 4 * (n))
+#define RAD1_MPLL_LOCK_CTL(n)	(0xb8 + 4 * (n))
+#define RAD1_DESC_LO(n)		(0x400 + 12 * (n))
+#define RAD1_DESC_HI(n)		(0x404 + 12 * (n))
+#define RAD1_DESC_CTL(n)	(0x408 + 12 * (n))
+#define RAD1_RUN_LO(n)		(0x4c0 + 8 * (n))
+#define RAD1_RUN_CTL(n)		(0x4c4 + 8 * (n))
+#define RAD1_RUN_HI(n)		(0x508 + 4 * (n))
+#define RAD1_AES_TX_SUBCODE	0x1100
+#define RAD1_AES_TX_SUBCODE_LEN	0x120
+
+/* DMA pipe numbers, also the descriptor index of each pipe */
+#define RAD1_DMA_AES_RX		1
+#define RAD1_DMA_ATOD		2
+#define RAD1_DMA_AES_TX		6
+#define RAD1_DMA_DTOA		7
+
+#define RAD1_CTL_DMA_EN		BIT(0)
+#define RAD1_CTL_CLOCKGEN(n)	((n) << 29)	/* clock generator of the pipe */
+#define RAD1_ATOD_MIC		0x03000000
+#define RAD1_ATOD_LINE		0x05000000
+#define RAD1_AES_RX_OPTICAL	0x18
+#define RAD1_AES_RX_COAX	0x10
+#define RAD1_ADAT_RX_OFF	0xa0000000
+#define RAD1_ADAT_RX_COAX	0xa0000008
+#define RAD1_MISC_AES_OPTICAL	0x1040
+#define RAD1_MISC_AES_OPTICAL_OFF	0x1440
+#define RAD1_MISC_MUTE		BIT(8)
+
+#define RAD1_RESET_RUN		0xffe20000
+#define RAD1_RESET_CG(n)	(0x100 << (n))
+
+/* a CLOCKGEN_ICTL word that sets the DtoA divider, not a clock generator */
+#define RAD1_CLOCKGEN_DTOA_DIV(n)	(0x02000000 | ((n) - 2))
+
+/* DMA lengths are counted in 128-byte blocks. */
+#define RAD1_DMA_ALIGN		128
+#define RAD1_DMA_START_TRIES	6
+
+/*
+ * One 24-bit sample per 32-bit word, in CPU byte order: the low 24 bits
+ * carry the sample.
+ */
+#define RAD1_FORMATS		SNDRV_PCM_FMTBIT_S24
+
+static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
+static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
+static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;
+
+module_param_array(index, int, NULL, 0444);
+MODULE_PARM_DESC(index, "Index value for SGI RAD1 audio.");
+module_param_array(id, charp, NULL, 0444);
+MODULE_PARM_DESC(id, "ID string for SGI RAD1 audio.");
+module_param_array(enable, bool, NULL, 0444);
+MODULE_PARM_DESC(enable, "Enable SGI RAD1 audio.");
+
+enum {
+	RAD1_PCM_DTOA,
+	RAD1_PCM_ATOD,
+	RAD1_PCM_AES_TX,
+	RAD1_PCM_AES_RX,
+	RAD1_NUM_PCMS
+};
+
+struct snd_rad1_pcm_desc {
+	const char *name;
+	int stream;
+	unsigned int dma;
+	unsigned int ctl_reg;
+	u32 ctl;
+	int clockgen;		/* -1: clocked by the AES input */
+};
+
+static const struct snd_rad1_pcm_desc snd_rad1_pcms[RAD1_NUM_PCMS] = {
+	[RAD1_PCM_DTOA] = {
+		"RAD1 DtoA", SNDRV_PCM_STREAM_PLAYBACK,
+		RAD1_DMA_DTOA, RAD1_DTOA_CTL, RAD1_CTL_CLOCKGEN(1), 1,
+	},
+	[RAD1_PCM_ATOD] = {
+		"RAD1 AtoD", SNDRV_PCM_STREAM_CAPTURE,
+		RAD1_DMA_ATOD, RAD1_ATOD_CTL, RAD1_ATOD_MIC, 0,
+	},
+	[RAD1_PCM_AES_TX] = {
+		"RAD1 AES Tx", SNDRV_PCM_STREAM_PLAYBACK,
+		RAD1_DMA_AES_TX, RAD1_AES_TX_CTL, RAD1_CTL_CLOCKGEN(2), 2,
+	},
+	[RAD1_PCM_AES_RX] = {
+		"RAD1 AES Rx", SNDRV_PCM_STREAM_CAPTURE,
+		RAD1_DMA_AES_RX, RAD1_AES_RX_CTL, RAD1_AES_RX_OPTICAL, -1,
+	},
+};
+
+/* The digital-only board clocks AES Tx from clock generator 0. */
+static const struct snd_rad1_pcm_desc snd_rad1_dig_aes_tx = {
+	"RAD1 AES Tx", SNDRV_PCM_STREAM_PLAYBACK,
+	RAD1_DMA_AES_TX, RAD1_AES_TX_CTL, RAD1_CTL_CLOCKGEN(0), 0,
+};
+
+struct snd_rad1;
+
+struct snd_rad1_pipe {
+	struct snd_rad1 *chip;
+	const struct snd_rad1_pcm_desc *desc;
+	struct snd_pcm_substream *substream;
+	struct hrtimer timer;
+	ktime_t poll_time;
+	unsigned int buffer_bytes;
+	unsigned int period_bytes;
+	unsigned int period;
+	unsigned int start_tries;
+	u32 ctl;
+	bool running;
+	bool starting;
+	struct snd_dma_buffer ring;	/* playback: what the DMA plays */
+	struct snd_pcm_indirect rec;	/* playback: buffer to ring copy */
+};
+
+enum {
+	RAD1_ROUTE_ATOD,
+	RAD1_ROUTE_AES_RX,
+	RAD1_NUM_ROUTES
+};
+
+struct snd_rad1 {
+	void __iomem *regs;
+	spinlock_t lock;	/* pipe state and shared registers */
+	struct snd_rad1_pipe pipes[RAD1_NUM_PCMS];
+	u32 volume;
+	unsigned int route[RAD1_NUM_ROUTES];
+	u32 sync_mux;
+	bool aes_tx_optical;
+	bool mute;
+	bool digital_only;
+};
+
+static void snd_rad1_write(struct snd_rad1 *chip, unsigned int reg, u32 val)
+{
+	writel(val, chip->regs + reg);
+}
+
+static u32 snd_rad1_read(struct snd_rad1 *chip, unsigned int reg)
+{
+	return readl(chip->regs + reg);
+}
+
+/*
+ * A clock generator divides a 176.4 kHz or 192 kHz reference by
+ * div + rem / den, with 16-bit rem and den.
+ */
+static void snd_rad1_set_clockgen(struct snd_rad1 *chip, int cg,
+				  unsigned int rate)
+{
+	unsigned int ref = 176400 % rate ? 192000 : 176400;
+	unsigned int div = ref / rate;
+	unsigned int rem = ref % rate;
+	unsigned int g = gcd(rem, rate);
+	unsigned int den = rate / g;
+
+	rem /= g;
+	snd_rad1_write(chip, RAD1_RESET, RAD1_RESET_RUN | RAD1_RESET_CG(cg));
+	snd_rad1_write(chip, RAD1_FREQ_SYNTH_MUX(3 - cg), ref == 192000);
+	/* the digital-only board wants n in sync mux field n with generator n */
+	if (chip->digital_only) {
+		chip->sync_mux |= cg << (2 * cg);
+		snd_rad1_write(chip, RAD1_SYNC_MUX, chip->sync_mux);
+	}
+	snd_rad1_write(chip, RAD1_CLOCKGEN_REM, rem << 16 | (-den & 0xffff));
+	snd_rad1_write(chip, RAD1_CLOCKGEN_ICTL,
+		       (2 * rem < den ? 0x600 : 0x200) |
+		       (0x10000000U << cg) | (div - 1));
+	snd_rad1_write(chip, RAD1_RESET, RAD1_RESET_RUN);
+}
+
+/* MISC bit 8 mutes the analog output; the digital-only board keeps it set. */
+static void snd_rad1_write_misc(struct snd_rad1 *chip)
+{
+	snd_rad1_write(chip, RAD1_MISC_CTL,
+		       (chip->aes_tx_optical ? RAD1_MISC_AES_OPTICAL :
+					       RAD1_MISC_AES_OPTICAL_OFF) |
+		       (chip->mute ? RAD1_MISC_MUTE : 0));
+}
+
+/* The meaning of most bits written here is not documented. */
+static void snd_rad1_hw_init(struct snd_rad1 *chip)
+{
+	bool dig = chip->digital_only;
+	int cg, n;
+
+	snd_rad1_write(chip, RAD1_RESET, 0xffffffff);
+	usleep_range(1000, 2000);
+	snd_rad1_write(chip, RAD1_RESET, 0xffe3cffe);
+	snd_rad1_write(chip, RAD1_PCI_HOLDOFF, 0x08000010);
+	snd_rad1_write(chip, RAD1_PCI_ARB_CTL, 0x00fac688);
+	snd_rad1_write(chip, RAD1_ATOD_CTL, dig ? RAD1_ATOD_LINE : RAD1_ATOD_MIC);
+	snd_rad1_write(chip, RAD1_DTOA_CTL, RAD1_CTL_CLOCKGEN(1));
+	snd_rad1_write(chip, RAD1_AES_RX_CTL, RAD1_AES_RX_OPTICAL);
+	snd_rad1_write(chip, RAD1_AES_TX_CTL, RAD1_CTL_CLOCKGEN(dig ? 0 : 2));
+	snd_rad1_write(chip, RAD1_ADAT_RX_CTL, RAD1_ADAT_RX_OFF);
+	snd_rad1_write(chip, RAD1_ADAT_TX_CTL, RAD1_CTL_CLOCKGEN(dig ? 1 : 3));
+	if (dig) {
+		for (n = 3; n >= 0; n--)
+			snd_rad1_write(chip, RAD1_GPIO(n), 0);
+		snd_rad1_write(chip, RAD1_SYNC_MUX, 0);
+	} else {
+		/* 18-bit DAC input words */
+		snd_rad1_write(chip, RAD1_GPIO(3), 0x00000003);
+	}
+	snd_rad1_write(chip, RAD1_MISC_CTL, 0x00001500);
+	snd_rad1_write(chip, RAD1_MPLL_LOCK_CTL(0), 0x9fffffff);
+	snd_rad1_write(chip, RAD1_MPLL_LOCK_CTL(1), 0x9fffffff);
+	snd_rad1_write(chip, RAD1_RESET, 0xffe3c0fe);
+	usleep_range(1000, 2000);
+	snd_rad1_write(chip, RAD1_CLOCKGEN_ICTL, RAD1_CLOCKGEN_DTOA_DIV(3));
+	snd_rad1_write(chip, RAD1_RESET, 0xffe24070);
+	usleep_range(1000, 2000);
+	snd_rad1_write(chip, RAD1_RESET, RAD1_RESET_RUN);
+	if (!dig) {
+		snd_rad1_write(chip, RAD1_GPIO(2), 0x00000002);
+		snd_rad1_write(chip, RAD1_VOLUME, chip->volume);
+	}
+	usleep_range(1000, 2000);
+	snd_rad1_write_misc(chip);
+
+	/* set the clock generators the board uses to 48 kHz */
+	for (cg = 0; cg < (dig ? 2 : 4); cg++)
+		snd_rad1_set_clockgen(chip, cg, 48000);
+
+	if (dig)
+		return;
+
+	/* hold the output muted while the DAC settles, against a pop */
+	msleep(1000);
+	chip->mute = false;
+	snd_rad1_write_misc(chip);
+	snd_rad1_write(chip, RAD1_GPIO(1), 0x00000003);
+	usleep_range(10000, 11000);
+}
+
+/* The DtoA mixes left and right below 29.4 kHz unless its divider is raised. */
+static void snd_rad1_set_dtoa_div(struct snd_rad1 *chip, unsigned int rate)
+{
+	unsigned int n;
+
+	if (rate > 29400)
+		n = 3;
+	else if (rate > 14700)
+		n = 6;
+	else if (rate > 7350)
+		n = 12;
+	else
+		n = 24;
+
+	snd_rad1_write(chip, RAD1_CLOCKGEN_ICTL, RAD1_CLOCKGEN_DTOA_DIV(n));
+}
+
+/*
+ * Consumer channel status: status byte n goes to bits 8n+7..8n of the
+ * first subcode word of each channel.
+ */
+static void snd_rad1_set_aes_tx_status(struct snd_rad1 *chip,
+				       unsigned int rate)
+{
+	unsigned int bank, i;
+	u32 cs;
+
+	switch (rate) {
+	case 32000:
+		cs = IEC958_AES3_CON_FS_32000;
+		break;
+	case 44100:
+		cs = IEC958_AES3_CON_FS_44100;
+		break;
+	default:
+		cs = IEC958_AES3_CON_FS_48000;
+		break;
+	}
+	cs = (cs | IEC958_AES3_CON_CLOCK_50PPM) << 24 |
+	     IEC958_AES1_CON_IEC908_CD << 8 | IEC958_AES0_CON_NOT_COPYRIGHT;
+
+	for (i = 0; i < RAD1_AES_TX_SUBCODE_LEN; i += 4)
+		snd_rad1_write(chip, RAD1_AES_TX_SUBCODE + i, 0);
+
+	/* channel numbers 1 and 2 in byte 2 of the left and right status */
+	for (bank = 0; bank < 0x100; bank += 0x80) {
+		snd_rad1_write(chip, RAD1_AES_TX_SUBCODE + bank + 0x18,
+			       cs | 0x10 << 16);
+		snd_rad1_write(chip, RAD1_AES_TX_SUBCODE + bank + 0x60,
+			       cs | 0x20 << 16);
+	}
+}
+
+static void snd_rad1_write_ctl(struct snd_rad1 *chip,
+			       struct snd_rad1_pipe *pipe)
+{
+	snd_rad1_write(chip, pipe->desc->ctl_reg,
+		       pipe->ctl | (pipe->running ? RAD1_CTL_DMA_EN : 0));
+}
+
+/* The running count is the negated number of bytes left in the ring. */
+static unsigned int snd_rad1_hw_pos(struct snd_rad1_pipe *pipe)
+{
+	u32 count = snd_rad1_read(pipe->chip, RAD1_RUN_CTL(pipe->desc->dma));
+
+	return (pipe->buffer_bytes + (count & ~(RAD1_DMA_ALIGN - 1))) %
+	       pipe->buffer_bytes;
+}
+
+/*
+ * A DMA that has not moved by a poll, the first one half a period after
+ * the start, is enabled again, up to RAD1_DMA_START_TRIES times.
+ */
+static void snd_rad1_check_start(struct snd_rad1_pipe *pipe, unsigned int pos)
+{
+	struct snd_rad1 *chip = pipe->chip;
+
+	if (pos || pipe->start_tries == RAD1_DMA_START_TRIES) {
+		pipe->starting = false;
+		if (!pos)
+			dev_warn(pipe->substream->pcm->card->dev,
+				 "%s: DMA did not start\n", pipe->desc->name);
+		return;
+	}
+
+	pipe->start_tries++;
+	guard(spinlock_irqsave)(&chip->lock);
+	if (pipe->running) {
+		snd_rad1_write(chip, pipe->desc->ctl_reg, pipe->ctl);
+		snd_rad1_write_ctl(chip, pipe);
+	}
+}
+
+/* The RAD1 raises no interrupt for DMA progress; poll the position. */
+static enum hrtimer_restart snd_rad1_poll(struct hrtimer *timer)
+{
+	struct snd_rad1_pipe *pipe = container_of(timer, struct snd_rad1_pipe,
+						  timer);
+	unsigned int pos, period;
+
+	if (!READ_ONCE(pipe->running))
+		return HRTIMER_NORESTART;
+
+	pos = snd_rad1_hw_pos(pipe);
+	if (pipe->starting)
+		snd_rad1_check_start(pipe, pos);
+
+	period = pos / pipe->period_bytes;
+	if (period != pipe->period) {
+		pipe->period = period;
+		snd_pcm_period_elapsed(pipe->substream);
+	}
+
+	hrtimer_forward_now(timer, pipe->poll_time);
+	return HRTIMER_RESTART;
+}
+
+static const struct snd_pcm_hardware snd_rad1_hw = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_BLOCK_TRANSFER,
+	.formats = RAD1_FORMATS,
+	.rates = SNDRV_PCM_RATE_CONTINUOUS | SNDRV_PCM_RATE_8000_48000,
+	.rate_min = 4000,
+	.rate_max = 48000,
+	.channels_min = 2,
+	.channels_max = 2,
+	.buffer_bytes_max = SZ_1M,
+	.period_bytes_min = 1024,
+	.period_bytes_max = SZ_64K,
+	.periods_min = 2,
+	.periods_max = 1024,
+};
+
+static const unsigned int snd_rad1_aes_rx_rates[8] = {
+	0, 48000, 44100, 32000, 48000, 44100, 44056, 32000
+};
+
+static int snd_rad1_pcm_open(struct snd_pcm_substream *substream)
+{
+	struct snd_rad1_pipe *pipe = snd_pcm_substream_chip(substream);
+	struct snd_rad1 *chip = pipe->chip;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned int rate;
+	u32 status;
+
+	runtime->hw = snd_rad1_hw;
+
+	switch (pipe->desc->dma) {
+	case RAD1_DMA_AES_TX:
+		runtime->hw.rates = SNDRV_PCM_RATE_32000 |
+				    SNDRV_PCM_RATE_44100 |
+				    SNDRV_PCM_RATE_48000;
+		runtime->hw.rate_min = 32000;
+		break;
+	case RAD1_DMA_AES_RX:
+		/* bits 26:24 hold the locked rate, 0 without a carrier */
+		status = snd_rad1_read(chip, RAD1_CHIP_STATUS0);
+		rate = snd_rad1_aes_rx_rates[(status >> 24) & 7];
+		if (!rate) {
+			rate = 48000;
+			dev_warn(substream->pcm->card->dev,
+				 "AES input not locked, assuming %u Hz\n",
+				 rate);
+		}
+		runtime->hw.rates = SNDRV_PCM_RATE_CONTINUOUS;
+		runtime->hw.rate_min = rate;
+		runtime->hw.rate_max = rate;
+		break;
+	}
+
+	/* samples reach the DMA ring only through snd_rad1_pcm_ack() */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		runtime->hw.info |= SNDRV_PCM_INFO_SYNC_APPLPTR;
+
+	pipe->substream = substream;
+
+	return snd_pcm_hw_constraint_step(runtime, 0,
+					  SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+					  RAD1_DMA_ALIGN);
+}
+
+static int snd_rad1_pcm_close(struct snd_pcm_substream *substream)
+{
+	struct snd_rad1_pipe *pipe = snd_pcm_substream_chip(substream);
+
+	pipe->substream = NULL;
+
+	return 0;
+}
+
+static int snd_rad1_pcm_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_rad1_pipe *pipe = snd_pcm_substream_chip(substream);
+
+	if (pipe->ring.area) {
+		snd_dma_free_pages(&pipe->ring);
+		pipe->ring.area = NULL;
+	}
+
+	return 0;
+}
+
+static int snd_rad1_pcm_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_rad1_pipe *pipe = snd_pcm_substream_chip(substream);
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
+	snd_rad1_pcm_hw_free(substream);
+
+	return snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, substream->pcm->card->dev,
+				   params_buffer_bytes(params), &pipe->ring);
+}
+
+static int snd_rad1_pcm_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_rad1_pipe *pipe = snd_pcm_substream_chip(substream);
+	struct snd_rad1 *chip = pipe->chip;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	const struct snd_rad1_pcm_desc *desc = pipe->desc;
+	dma_addr_t addr = runtime->dma_addr;
+	u32 ctl;
+
+	pipe->buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
+	pipe->period_bytes = snd_pcm_lib_period_bytes(substream);
+	pipe->period = 0;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		addr = pipe->ring.addr;
+		memset(pipe->ring.area, 0, pipe->buffer_bytes);
+		memset(&pipe->rec, 0, sizeof(pipe->rec));
+		pipe->rec.hw_buffer_size = pipe->buffer_bytes;
+		pipe->rec.sw_buffer_size = pipe->buffer_bytes;
+	}
+	/* poll twice per period */
+	pipe->poll_time = ns_to_ktime(div_u64((u64)runtime->period_size *
+					      NSEC_PER_SEC, runtime->rate * 2));
+	ctl = (-pipe->buffer_bytes & ~(RAD1_DMA_ALIGN - 1)) | desc->dma << 3;
+
+	guard(spinlock_irqsave)(&chip->lock);
+
+	snd_rad1_write_ctl(chip, pipe);
+	if (desc->clockgen >= 0)
+		snd_rad1_set_clockgen(chip, desc->clockgen, runtime->rate);
+	if (desc->dma == RAD1_DMA_DTOA)
+		snd_rad1_set_dtoa_div(chip, runtime->rate);
+	if (desc->dma == RAD1_DMA_AES_TX)
+		snd_rad1_set_aes_tx_status(chip, runtime->rate);
+
+	snd_rad1_write(chip, RAD1_DESC_HI(desc->dma), upper_32_bits(addr));
+	snd_rad1_write(chip, RAD1_DESC_LO(desc->dma), lower_32_bits(addr));
+	snd_rad1_write(chip, RAD1_DESC_CTL(desc->dma), ctl);
+	snd_rad1_write(chip, RAD1_RUN_HI(desc->dma), upper_32_bits(addr));
+	snd_rad1_write(chip, RAD1_RUN_LO(desc->dma), lower_32_bits(addr));
+	snd_rad1_write(chip, RAD1_RUN_CTL(desc->dma), ctl);
+
+	return 0;
+}
+
+static int snd_rad1_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_rad1_pipe *pipe = snd_pcm_substream_chip(substream);
+	struct snd_rad1 *chip = pipe->chip;
+
+	guard(spinlock_irqsave)(&chip->lock);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		WRITE_ONCE(pipe->running, true);
+		pipe->starting = true;
+		pipe->start_tries = 0;
+		snd_rad1_write_ctl(chip, pipe);
+		hrtimer_start(&pipe->timer, pipe->poll_time, HRTIMER_MODE_REL);
+		return 0;
+	case SNDRV_PCM_TRIGGER_STOP:
+		WRITE_ONCE(pipe->running, false);
+		snd_rad1_write_ctl(chip, pipe);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int snd_rad1_pcm_sync_stop(struct snd_pcm_substream *substream)
+{
+	struct snd_rad1_pipe *pipe = snd_pcm_substream_chip(substream);
+
+	hrtimer_cancel(&pipe->timer);
+
+	return 0;
+}
+
+static snd_pcm_uframes_t
+snd_rad1_pcm_pointer(struct snd_pcm_substream *substream)
+{
+	struct snd_rad1_pipe *pipe = snd_pcm_substream_chip(substream);
+	unsigned int pos = snd_rad1_hw_pos(pipe);
+	unsigned int start = pipe->rec.hw_io;
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		return bytes_to_frames(substream->runtime, pos);
+
+	/*
+	 * Clear what the DMA has played before the application may refill
+	 * it, so that an underrun or the end of a drain plays silence.
+	 */
+	if (pos < start) {
+		memset(pipe->ring.area + start, 0, pipe->buffer_bytes - start);
+		start = 0;
+	}
+	memset(pipe->ring.area + start, 0, pos - start);
+
+	return snd_pcm_indirect_playback_pointer(substream, &pipe->rec, pos);
+}
+
+/*
+ * The playback DMA saturates a word whose top byte is not the sign
+ * extension of bit 23, but S24 leaves that byte unspecified.
+ */
+static void snd_rad1_pcm_copy(struct snd_pcm_substream *substream,
+			      struct snd_pcm_indirect *rec, size_t bytes)
+{
+	struct snd_rad1_pipe *pipe = snd_pcm_substream_chip(substream);
+	const u32 *src = (const u32 *)(substream->runtime->dma_area +
+				       rec->sw_data);
+	u32 *dst = (u32 *)(pipe->ring.area + rec->hw_data);
+	size_t i;
+
+	for (i = 0; i < bytes / 4; i++)
+		dst[i] = sign_extend32(src[i], 23);
+}
+
+/* Copy again from the DMA position, which hw_ptr is at. */
+static void snd_rad1_pcm_resync(struct snd_rad1_pipe *pipe,
+				snd_pcm_uframes_t hw_ptr)
+{
+	pipe->rec.appl_ptr = hw_ptr;
+	pipe->rec.hw_data = pipe->rec.hw_io;
+	pipe->rec.sw_data = pipe->rec.sw_io;
+	pipe->rec.hw_ready = 0;
+}
+
+static int snd_rad1_pcm_ack(struct snd_pcm_substream *substream)
+{
+	struct snd_rad1_pipe *pipe = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_pcm_indirect *rec = &pipe->rec;
+	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
+	snd_pcm_uframes_t frames;
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
+	/* a rewind moves appl_ptr back over samples already in the ring */
+	frames = appl_ptr - rec->appl_ptr;
+	if (appl_ptr < rec->appl_ptr)
+		frames += runtime->boundary;
+	if (frames > runtime->buffer_size)
+		snd_rad1_pcm_resync(pipe, runtime->status->hw_ptr);
+
+	return snd_pcm_indirect_playback_transfer(substream, rec,
+						  snd_rad1_pcm_copy);
+}
+
+/* A reset moves appl_ptr to hw_ptr without calling .ack. */
+static int snd_rad1_pcm_ioctl(struct snd_pcm_substream *substream,
+			      unsigned int cmd, void *arg)
+{
+	struct snd_rad1_pipe *pipe = snd_pcm_substream_chip(substream);
+	int err = snd_pcm_lib_ioctl(substream, cmd, arg);
+
+	if (err || cmd != SNDRV_PCM_IOCTL1_RESET ||
+	    substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		return err;
+
+	guard(pcm_stream_lock_irqsave)(substream);
+	snd_rad1_pcm_resync(pipe, substream->runtime->status->hw_ptr);
+
+	return 0;
+}
+
+static const struct snd_pcm_ops snd_rad1_pcm_ops = {
+	.open = snd_rad1_pcm_open,
+	.close = snd_rad1_pcm_close,
+	.ioctl = snd_rad1_pcm_ioctl,
+	.hw_params = snd_rad1_pcm_hw_params,
+	.hw_free = snd_rad1_pcm_hw_free,
+	.prepare = snd_rad1_pcm_prepare,
+	.trigger = snd_rad1_pcm_trigger,
+	.sync_stop = snd_rad1_pcm_sync_stop,
+	.pointer = snd_rad1_pcm_pointer,
+	.ack = snd_rad1_pcm_ack,
+};
+
+static int snd_rad1_volume_info(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 2;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 255;
+
+	return 0;
+}
+
+static int snd_rad1_volume_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_rad1 *chip = snd_kcontrol_chip(kcontrol);
+	unsigned int shift = kcontrol->private_value;
+
+	guard(spinlock_irqsave)(&chip->lock);
+	ucontrol->value.integer.value[0] = chip->volume >> shift & 0xff;
+	ucontrol->value.integer.value[1] = chip->volume >> (shift + 8) & 0xff;
+
+	return 0;
+}
+
+static int snd_rad1_volume_put(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_rad1 *chip = snd_kcontrol_chip(kcontrol);
+	unsigned int shift = kcontrol->private_value;
+	long l = ucontrol->value.integer.value[0];
+	long r = ucontrol->value.integer.value[1];
+	u32 volume;
+
+	if (l < 0 || l > 255 || r < 0 || r > 255)
+		return -EINVAL;
+
+	guard(spinlock_irqsave)(&chip->lock);
+	volume = chip->volume & ~(0xffffU << shift);
+	volume |= (u32)(l | r << 8) << shift;
+	if (volume == chip->volume)
+		return 0;
+	chip->volume = volume;
+	snd_rad1_write(chip, RAD1_VOLUME, volume);
+
+	return 1;
+}
+
+static int snd_rad1_route_info(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_info *uinfo)
+{
+	static const char * const atod[] = { "Mic", "Line" };
+	static const char * const aes[] = { "Optical", "Coaxial" };
+
+	return snd_ctl_enum_info(uinfo, 1, 2,
+				 kcontrol->private_value == RAD1_ROUTE_ATOD ?
+				 atod : aes);
+}
+
+static int snd_rad1_route_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_rad1 *chip = snd_kcontrol_chip(kcontrol);
+
+	guard(spinlock_irqsave)(&chip->lock);
+	ucontrol->value.enumerated.item[0] =
+		chip->route[kcontrol->private_value];
+
+	return 0;
+}
+
+static int snd_rad1_route_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_rad1 *chip = snd_kcontrol_chip(kcontrol);
+	unsigned int route = kcontrol->private_value;
+	unsigned int val = ucontrol->value.enumerated.item[0];
+	struct snd_rad1_pipe *pipe;
+
+	if (val > 1)
+		return -EINVAL;
+
+	guard(spinlock_irqsave)(&chip->lock);
+	if (chip->route[route] == val)
+		return 0;
+	chip->route[route] = val;
+
+	switch (route) {
+	case RAD1_ROUTE_ATOD:
+		pipe = &chip->pipes[RAD1_PCM_ATOD];
+		pipe->ctl = val ? RAD1_ATOD_LINE : RAD1_ATOD_MIC;
+		snd_rad1_write_ctl(chip, pipe);
+		break;
+	case RAD1_ROUTE_AES_RX:
+		pipe = &chip->pipes[RAD1_PCM_AES_RX];
+		pipe->ctl = val ? RAD1_AES_RX_COAX : RAD1_AES_RX_OPTICAL;
+		snd_rad1_write_ctl(chip, pipe);
+		snd_rad1_write(chip, RAD1_ADAT_RX_CTL,
+			       val ? RAD1_ADAT_RX_COAX : RAD1_ADAT_RX_OFF);
+		break;
+	}
+
+	return 1;
+}
+
+static int snd_rad1_optical_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_rad1 *chip = snd_kcontrol_chip(kcontrol);
+
+	guard(spinlock_irqsave)(&chip->lock);
+	ucontrol->value.integer.value[0] = chip->aes_tx_optical;
+
+	return 0;
+}
+
+/* The coaxial output is always driven; this switches the optical one. */
+static int snd_rad1_optical_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_rad1 *chip = snd_kcontrol_chip(kcontrol);
+	bool on = ucontrol->value.integer.value[0];
+
+	guard(spinlock_irqsave)(&chip->lock);
+	if (chip->aes_tx_optical == on)
+		return 0;
+	chip->aes_tx_optical = on;
+	snd_rad1_write_misc(chip);
+
+	return 1;
+}
+
+/* the analog controls come first */
+#define RAD1_NUM_ANALOG_CONTROLS	3
+
+static const struct snd_kcontrol_new snd_rad1_controls[] = {
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Master Playback Volume",
+		.info = snd_rad1_volume_info,
+		.get = snd_rad1_volume_get,
+		.put = snd_rad1_volume_put,
+		.private_value = 16,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Capture Volume",
+		.info = snd_rad1_volume_info,
+		.get = snd_rad1_volume_get,
+		.put = snd_rad1_volume_put,
+		.private_value = 0,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Capture Source",
+		.info = snd_rad1_route_info,
+		.get = snd_rad1_route_get,
+		.put = snd_rad1_route_put,
+		.private_value = RAD1_ROUTE_ATOD,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "IEC958 Capture Routing",
+		.info = snd_rad1_route_info,
+		.get = snd_rad1_route_get,
+		.put = snd_rad1_route_put,
+		.private_value = RAD1_ROUTE_AES_RX,
+	},
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "IEC958 Optical Playback Switch",
+		.info = snd_ctl_boolean_mono_info,
+		.get = snd_rad1_optical_get,
+		.put = snd_rad1_optical_put,
+	},
+};
+
+static void snd_rad1_free(struct snd_card *card)
+{
+	struct snd_rad1 *chip = card->private_data;
+
+	guard(spinlock_irqsave)(&chip->lock);
+	/* against a pop, mute and take GPIO1 down in two steps first */
+	if (!chip->digital_only) {
+		chip->mute = true;
+		snd_rad1_write_misc(chip);
+		snd_rad1_write(chip, RAD1_GPIO(1), 0x00000002);
+		snd_rad1_write(chip, RAD1_GPIO(1), 0x00000000);
+	}
+	snd_rad1_write(chip, RAD1_RESET, 0xffffffff);
+}
+
+static int snd_rad1_create(struct snd_card *card, struct pci_dev *pci)
+{
+	struct snd_rad1 *chip = card->private_data;
+	struct snd_pcm *pcm;
+	int i, dev = 0, err;
+
+	err = pcim_enable_device(pci);
+	if (err < 0)
+		return err;
+
+	/* the DMA engine takes 64-bit bus addresses */
+	err = dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(64));
+	if (err < 0)
+		return err;
+
+	chip->regs = pcim_iomap_region(pci, 0, card->driver);
+	if (IS_ERR(chip->regs))
+		return PTR_ERR(chip->regs);
+
+	pci_set_master(pci);
+	spin_lock_init(&chip->lock);
+	chip->digital_only = pci->revision >> 4 == 0xd;
+	if (chip->digital_only)
+		dev_info(&pci->dev, "digital-only board\n");
+	chip->volume = 0xd6d6d6d6;
+	chip->aes_tx_optical = true;
+	chip->mute = true;
+	snd_rad1_hw_init(chip);
+	card->private_free = snd_rad1_free;
+
+	for (i = 0; i < RAD1_NUM_PCMS; i++) {
+		const struct snd_rad1_pcm_desc *desc = &snd_rad1_pcms[i];
+		struct snd_rad1_pipe *pipe = &chip->pipes[i];
+		bool playback = desc->stream == SNDRV_PCM_STREAM_PLAYBACK;
+
+		if (chip->digital_only) {
+			if (i == RAD1_PCM_DTOA || i == RAD1_PCM_ATOD)
+				continue;
+			if (i == RAD1_PCM_AES_TX)
+				desc = &snd_rad1_dig_aes_tx;
+		}
+
+		pipe->chip = chip;
+		pipe->desc = desc;
+		pipe->ctl = desc->ctl;
+		hrtimer_setup(&pipe->timer, snd_rad1_poll, CLOCK_MONOTONIC,
+			      HRTIMER_MODE_REL);
+
+		err = snd_pcm_new(card, desc->name, dev++, playback, !playback,
+				  &pcm);
+		if (err < 0)
+			return err;
+		pcm->private_data = pipe;
+		strscpy(pcm->name, desc->name);
+		snd_pcm_set_ops(pcm, desc->stream, &snd_rad1_pcm_ops);
+		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+					       &pci->dev, SZ_64K, SZ_1M);
+	}
+
+	i = chip->digital_only ? RAD1_NUM_ANALOG_CONTROLS : 0;
+	for (; i < ARRAY_SIZE(snd_rad1_controls); i++) {
+		err = snd_ctl_add(card, snd_ctl_new1(&snd_rad1_controls[i],
+						     chip));
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+static int snd_rad1_probe(struct pci_dev *pci,
+			  const struct pci_device_id *pci_id)
+{
+	static int dev;
+	struct snd_card *card __free(snd_card_free) = NULL;
+	int err;
+
+	if (dev >= SNDRV_CARDS)
+		return -ENODEV;
+	if (!enable[dev]) {
+		dev++;
+		return -ENOENT;
+	}
+
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_rad1), &card);
+	if (err < 0)
+		return err;
+
+	strscpy(card->driver, "RAD1");
+	strscpy(card->shortname, "SGI RAD1");
+	sprintf(card->longname, "%s at 0x%llx", card->shortname,
+		(unsigned long long)pci_resource_start(pci, 0));
+
+	err = snd_rad1_create(card, pci);
+	if (err < 0)
+		return err;
+
+	err = snd_card_register(card);
+	if (err < 0)
+		return err;
+
+	pci_set_drvdata(pci, card);
+	card = NULL;
+	dev++;
+	return 0;
+}
+
+static void snd_rad1_shutdown(struct pci_dev *pci)
+{
+	snd_rad1_free(pci_get_drvdata(pci));
+}
+
+static const struct pci_device_id snd_rad1_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_SGI, 0x0005) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, snd_rad1_ids);
+
+static struct pci_driver snd_rad1_driver = {
+	.name = KBUILD_MODNAME,
+	.id_table = snd_rad1_ids,
+	.probe = snd_rad1_probe,
+	.shutdown = snd_rad1_shutdown,
+};
+module_pci_driver(snd_rad1_driver);
+
+MODULE_AUTHOR("Stanislaw Skowronek <skylark@unaligned.org>");
+MODULE_AUTHOR("Imre Kaloz <kaloz@kernel.org>");
+MODULE_DESCRIPTION("SGI RAD1 audio driver");
+MODULE_LICENSE("GPL");

base-commit: b3c345c860de8d763a212da8a4d42bf0a509f74e
-- 
2.47.3


Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87F94C6F04
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544441; cv=none; b=coxcnLWI4UiguLbasLXR/6wamPsGhV3NH93Tx9UfG4GZHN5IeiBG8OvMfyvgiUtWygDy722H8XN8Il5bXAzDBdAIS5z79pppzGo7e7Oz0BJhE/enE736YVN0l77ivvBBAve9/UmaQmahMDt/p+UlNMmr9Ob8iERwXU2dklBH8Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544441; c=relaxed/simple;
	bh=aAY+S3lXdwrmyL83C4mHmsqIWr828hewr0vbMZxqp9k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gcv04bimY4qbpFaG7PIQlU1sL/o6Zj1P/FjZ2Ri+IuwDXTJWEsMqAQCFc+aqz4UqYlk6Xv0tpW1dUQNUUy2hOZehn7gEgF5zL2dP0Rxkx0N6oNFbqyoxv8v4U+dhpg20hswPjcqKN/+aFja2QnKhqsewfiZyF0aD0dJlptksDVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/jYpdq7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/jYpdq7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso19249695e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544428; x=1792149228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QuUA3AuZcONVx3AiGYxnL2PcSfLjyaUoAI8N88OORog=;
        b=h/jYpdq7lsN7/Ex+4MVxVZKUgBQfCI67rpttBczBAtlCnde3azZfaAzr//d9o0DiC4
         1nBELg8SmHHolUFzlNLyxuyhLHxt9rRAXN2YpTDigKaHE66qGycrAerYWAWE65JZ+tqH
         34g1c0Epj9QQUKv0t43lZca4fYUYwjvBGVmx8AKYWW3UJTHhnSWzMB846mf08VZoC41i
         stxTwr9TBKyRj8oJosLnQhikrYacz0aoMIOdtMdhOrSnF5xZV7fHMj3VbKk33oLBs0po
         p3ZszGvjMbgElQkv3BtOYpH+sNrJpSK7Fvh7H7dgnN1e6DGPgZZuhygtY1jyHOVf3rtA
         1Cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544428; x=1792149228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QuUA3AuZcONVx3AiGYxnL2PcSfLjyaUoAI8N88OORog=;
        b=rwos5MaepMVx3jiILl31Hj3nWK8PbVbCvTRXCdOj3o3lqxXBJ9sMKxnQY8aOdfVNMP
         ipG2YvsOXqbeK/5c2ZdYR62cb38GISQJTWe9B25EPBF6du+UKba2n9gLeowtkDFfvY88
         K2sSrHfE4XZ1fHNflKbJ+aciKsRiFV01YfWL7aHSDX2WY8yYCT3RKFdHog5fgcmI9g9M
         DQ+Tw+w5i9BZsppGcnD+sn8aHXbjXfyf8LKoPplqjH14G3GS2nMcXfp75YU9JKQHCZwx
         uQyMGNEBw/5KmEcQGHgX/ZbDROI8wVXZCkKKoJStghmHzshkX1SJdKFXdb7xnTjPIq20
         /qBQ==
X-Forwarded-Encrypted: i=1; AKwUvBze5lRee5SNsR8OvsCumNVNiYxCP+CetPdC/t+5Zzbuawd6fwg1/UNW+1qEoI1u8fJO61V/9PCJHJnSVL8=@vger.kernel.org
X-Gm-Message-State: AFuF++kKiUib1vAWXjwraC1VT0LQpnJSwxa4SUk/glHOrRdeJdtZbxx5
	FGX3WCESezRZcXImQvI63fNxGGtyfwNXfKvLuAB+pNgtqbDKTZotI6hG
X-Gm-Gg: AYBFou3pxi8BLsfEm+eEvPR3ugQ3GFJXZT7icxZH3mnZtf9utL7aAZHpjZF8dPvFD+F
	/OudziaDM/cE0Vb4T4PxRE9NkmoTxtic7nue8jVrDhiLKi/e2gwQcefEUzDkqAfVQUYprdIS69I
	8MQsjLWDyIMOqoiWrTz0/RONl7GbFHVDhHaZkH65ZDop98Il2uE08aMYjoGD0gbSGA7c6BrGx6/
	8nod9s+W41esN9rqORqmfdYlXSDM+ziTQjYPPcOA9ELFeciKDMC3NRUdHWo38vXY7RJxwNXeGwP
	7Z1O/T1Gog3EtGyOL1EdPXk0xPsVILYoTIcFTKPMpbwrVdPVcOMbJWFzFqh+BCqkEayTH9hX5jP
	T2xBCsLbr2NMbLDNHDuIddPWaOWra1/UkVNjx1UOKz2uiJZOoNNQH9fNcdChH4//PO8/0WgPHm5
	8ztYFcn30S5ntUK4pQSI3nRbPsE6F6Pxv3WcGEXDXmmf+AyGweRpnB85sjAy5LLhrfHN+eqnbyn
	URYd2Fw5tf3cHJeA3LoNydi3Y9/wY29CE5Uf54oU37EMC1DcBUkdC+t2MNj7Rj9REm6c2xokqTU
	gV/Ujw7DpxQ4JQPSiM5rBYZ68Aw=
X-Received: by 2002:a05:600c:4708:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4a18e4a6ea5mr28402995e9.13.1791544427507;
        Fri, 09 Oct 2026 04:13:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm45503605e9.5.2026.10.09.04.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:13:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] ASoC: airoha: Add support for AN7581 PCM driver
Date: Fri,  9 Oct 2026 13:13:32 +0200
Message-ID: <20261009111334.23522-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009111334.23522-1-ansuelsmth@gmail.com>
References: <20261009111334.23522-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Add an ASoC platform driver for the AN7581 PCM controller configured for
ZSI attached voice chip.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                   |   7 +
 sound/soc/Kconfig             |   1 +
 sound/soc/Makefile            |   1 +
 sound/soc/airoha/Kconfig      |  10 +
 sound/soc/airoha/Makefile     |   3 +
 sound/soc/airoha/an7581-pcm.c | 910 ++++++++++++++++++++++++++++++++++
 6 files changed, 932 insertions(+)
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5c57cbb68060..6d81a7c5d672 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -776,6 +776,13 @@ F:	Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 F:	Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 F:	sound/soc/mediatek/an7581/*
 
+AIROHA PCM CONTROLLER DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
+F:	sound/soc/airoha/*
+
 AIROHA SPI SNFI DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 M:	Ray Liu <ray.liu@airoha.com>
diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index edfdcbf734fe..27fc13e11b77 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -103,6 +103,7 @@ config SND_SOC_USB
 
 # All the supported SoCs
 source "sound/soc/adi/Kconfig"
+source "sound/soc/airoha/Kconfig"
 source "sound/soc/amd/Kconfig"
 source "sound/soc/apple/Kconfig"
 source "sound/soc/atmel/Kconfig"
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 21d8406767fc..ea581930bb3d 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_SND_SOC)	+= codecs/
 obj-$(CONFIG_SND_SOC)	+= generic/
 obj-$(CONFIG_SND_SOC)	+= apple/
 obj-$(CONFIG_SND_SOC)	+= adi/
+obj-$(CONFIG_SND_SOC)	+= airoha/
 obj-$(CONFIG_SND_SOC)	+= amd/
 obj-$(CONFIG_SND_SOC)	+= atmel/
 obj-$(CONFIG_SND_SOC)	+= au1x/
diff --git a/sound/soc/airoha/Kconfig b/sound/soc/airoha/Kconfig
new file mode 100644
index 000000000000..20c9211430c9
--- /dev/null
+++ b/sound/soc/airoha/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config SND_SOC_AN7581_PCM
+	tristate "PCM support for Airoha AN7581 chip"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	help
+	  This adds PCM driver for Airoha AN7581 boards
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
diff --git a/sound/soc/airoha/Makefile b/sound/soc/airoha/Makefile
new file mode 100644
index 000000000000..2522fe705d9a
--- /dev/null
+++ b/sound/soc/airoha/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_SND_SOC_AN7581_PCM) += an7581-pcm.o
diff --git a/sound/soc/airoha/an7581-pcm.c b/sound/soc/airoha/an7581-pcm.c
new file mode 100644
index 000000000000..51e5264fe801
--- /dev/null
+++ b/sound/soc/airoha/an7581-pcm.c
@@ -0,0 +1,910 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Airoha ALSA SoC PCM platform driver for AN7581
+ *
+ * Copyright (C) 2026 Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/dma-mapping.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/pinctrl/consumer.h>
+#include <sound/soc.h>
+
+#define AN7581_PCM_PICR				0x0
+#define   AN7581_PCM_CFG_VALID			BIT(26)
+#define   AN7581_PCM_LPBK_ENABLE		BIT(25)
+#define   AN7581_PCM_SOFT_RESET			BIT(24)
+#define   AN7581_PCM_FRAME_COUNT		GENMASK(22, 18)
+#define   AN7581_PCM_BIT_ORDER			BIT(16)
+#define   AN7581_PCM_ONE_BIT_DELAY		BIT(12)
+#define   AN7581_PCM_FS_EDGE			BIT(10)
+#define   AN7581_PCM_FS_LEN			GENMASK(9, 8)
+#define     AN7581_PCM_FS_LEN_8			FIELD_PREP_CONST(AN7581_PCM_FS_LEN, 0x2)
+#define     AN7581_PCM_FS_LEN_16		FIELD_PREP_CONST(AN7581_PCM_FS_LEN, 0x3)
+#define   AN7581_PCM_SAMPLE_CLK			BIT(4)
+#define     AN7581_PCM_SAMPLE_CLK_8KHZ		FIELD_PREP_CONST(AN7581_PCM_SAMPLE_CLK, 0x0)
+#define     AN7581_PCM_SAMPLE_CLK_16KHZ		FIELD_PREP_CONST(AN7581_PCM_SAMPLE_CLK, 0x1)
+#define   AN7581_PCM_BIT_CLK			GENMASK(3, 1)
+#define     AN7581_PCM_BIT_CLK_256KHZ		FIELD_PREP_CONST(AN7581_PCM_BIT_CLK, 0x0)
+#define     AN7581_PCM_BIT_CLK_512KHZ		FIELD_PREP_CONST(AN7581_PCM_BIT_CLK, 0x1)
+#define     AN7581_PCM_BIT_CLK_1024KHZ		FIELD_PREP_CONST(AN7581_PCM_BIT_CLK, 0x2)
+#define     AN7581_PCM_BIT_CLK_2048HZ		FIELD_PREP_CONST(AN7581_PCM_BIT_CLK, 0x3)
+#define     AN7581_PCM_BIT_CLK_4096KHZ		FIELD_PREP_CONST(AN7581_PCM_BIT_CLK, 0x4)
+#define     AN7581_PCM_BIT_CLK_8192KHZ		FIELD_PREP_CONST(AN7581_PCM_BIT_CLK, 0x5)
+#define   AN7581_PCM_BIT_MSTSLV_MODE		BIT(0)
+#define     AN7581_PCM_BIT_MSTSLV_MODE_MASTER	FIELD_PREP_CONST(AN7581_PCM_BIT_MSTSLV_MODE, 0x0)
+#define     AN7581_PCM_BIT_MSTSLV_MODE_SLAVE	FIELD_PREP_CONST(AN7581_PCM_BIT_MSTSLV_MODE, 0x1)
+/* Same bitmap for all TX timeslot reg */
+#define AN7581_PCM_PTTSCR0			0x4
+#define   AN7581_PCM_TXTS1_BW			BIT(28)
+#define     AN7581_PCM_TXTS1_BW_8BIT		FIELD_PREP_CONST(AN7581_PCM_TXTS1_BW, 0x0)
+#define     AN7581_PCM_TXTS1_BW_16BIT		FIELD_PREP_CONST(AN7581_PCM_TXTS1_BW, 0x1)
+#define   AN7581_PCM_TXTS1_START		GENMASK(25, 16)
+#define   AN7581_PCM_TXTS0_BW			BIT(12)
+#define     AN7581_PCM_TXTS0_BW_8BIT		FIELD_PREP_CONST(AN7581_PCM_TXTS0_BW, 0x0)
+#define     AN7581_PCM_TXTS0_BW_16BIT		FIELD_PREP_CONST(AN7581_PCM_TXTS0_BW, 0x1)
+#define   AN7581_PCM_TXTS0_START		GENMASK(9, 0)
+#define AN7581_PCM_PTTSCR1			0x8
+#define AN7581_PCM_PTTSCR2			0xc
+#define AN7581_PCM_PTTSCR3			0x10
+/* Same bitmap for all RX timeslot reg */
+#define AN7581_PCM_PRTSCR0			0x14
+#define   AN7581_PCM_RXTS1_BW			BIT(28)
+#define     AN7581_PCM_RXTS1_BW_8BIT		FIELD_PREP_CONST(AN7581_PCM_RXTS1_BW, 0x0)
+#define     AN7581_PCM_RXTS1_BW_16BIT		FIELD_PREP_CONST(AN7581_PCM_RXTS1_BW, 0x1)
+#define   AN7581_PCM_RXTS1_START		GENMASK(25, 16)
+#define   AN7581_PCM_RXTS0_BW			BIT(12)
+#define     AN7581_PCM_RXTS0_BW_8BIT		FIELD_PREP_CONST(AN7581_PCM_RXTS0_BW, 0x0)
+#define     AN7581_PCM_RXTS0_BW_16BIT		FIELD_PREP_CONST(AN7581_PCM_RXTS0_BW, 0x1)
+#define   AN7581_PCM_RXTS0_START		GENMASK(9, 0)
+#define AN7581_PCM_PRTSCR1			0x18
+#define AN7581_PCM_PRTSCR2			0x1c
+#define AN7581_PCM_PRTSCR3			0x20
+#define AN7581_PCM_ISR				0x24
+#define AN7581_PCM_IMR				0x28
+#define   AN7581_PCM_IMR_ISI2_INT		BIT(16)
+#define   AN7581_PCM_IMR_ZSI2_INT		BIT(15)
+#define   AN7581_PCM_IMR_SLIC_INT		BIT(14)
+#define   AN7581_PCM_IMR_SFC_INT		BIT(13)
+#define   AN7581_PCM_IMR_ISI1_INT		BIT(12)
+#define   AN7581_PCM_IMR_ZSI1_INT		BIT(11)
+#define   AN7581_PCM_IMR_HUNT_OVERTIME_INT	BIT(10)
+#define   AN7581_PCM_IMR_HUNT_ERR_INT		BIT(9)
+#define   AN7581_PCM_IMR_AHB_BUS_ERR_INT	BIT(8)
+#define   AN7581_PCM_IMR_RBUF_OVERRUN_INT	BIT(7)
+#define   AN7581_PCM_IMR_TBUF_UNDERRUN_INT	BIT(6)
+#define   AN7581_PCM_IMR_RDESC_END_INT		BIT(5)
+#define   AN7581_PCM_IMR_TDESC_END_INT		BIT(4)
+#define   AN7581_PCM_IMR_RDESC_UPDATE_INT	BIT(3)
+#define   AN7581_PCM_IMR_TDESC_UPDATE_INT	BIT(2)
+#define   AN7581_PCM_IMR_TXRX_FB_INT		BIT(0)
+#define AN7581_PCM_TPDR				0x2c
+#define   AN7581_PCM_TX_POLLING			BIT(0)
+#define AN7581_PCM_RPDR				0x30
+#define   AN7581_PCM_RX_POLLING			BIT(0)
+#define AN7581_PCM_TDRBAR			0x34
+#define   AN7581_TDESC_BASE			GENMASK(31, 0)
+#define AN7581_PCM_RDRBAR			0x38
+#define   AN7581_RDESC_BASE			GENMASK(31, 0)
+#define AN7581_PCM_TRDRSR			0x3c
+#define   AN7581_DESC_OFFSET			GENMASK(7, 4)
+#define   AN7581_DESC_SIZE			GENMASK(3, 0)
+#define AN7581_PCM_TRDCR			0x40
+#define   AN7581_PCM_DMA_POLICY			GENMASK(3, 2)
+#define   AN7581_PCM_DMA_POLICY_RR		FIELD_PREP_CONST(AN7581_PCM_DMA_POLICY, 0x0)
+#define   AN7581_PCM_DMA_POLICY_RSVD		FIELD_PREP_CONST(AN7581_PCM_DMA_POLICY, 0x1)
+#define   AN7581_PCM_DMA_POLICY_TX_PRIORITY	FIELD_PREP_CONST(AN7581_PCM_DMA_POLICY, 0x2)
+#define   AN7581_PCM_DMA_POLICY_RX_PRIORITY	FIELD_PREP_CONST(AN7581_PCM_DMA_POLICY, 0x3)
+#define   AN7581_PCM_RXDMA_ENABLE		BIT(1)
+#define   AN7581_PCM_TXDMA_ENABLE		BIT(0)
+#define AN7581_PCM_PTTSCR4			0x48
+#define AN7581_PCM_PTTSCR5			0x4c
+#define AN7581_PCM_PTTSCR6			0x50
+#define AN7581_PCM_PTTSCR7			0x54
+#define AN7581_PCM_PTTSCR8			0x58
+#define AN7581_PCM_PTTSCR9			0x5c
+#define AN7581_PCM_PTTSCR10			0x60
+#define AN7581_PCM_PTTSCR11			0x64
+#define AN7581_PCM_PTTSCR12			0x68
+#define AN7581_PCM_PTTSCR13			0x6c
+#define AN7581_PCM_PTTSCR14			0x70
+#define AN7581_PCM_PTTSCR15			0x74
+#define AN7581_PCM_PTTSCR(chan)			((chan) < 8 ? \
+						 (AN7581_PCM_PTTSCR0 + ((chan) / 2) * 4) : \
+						 (AN7581_PCM_PTTSCR4 + (((chan) - 8) / 2) * 4))
+#define   AN7581_PCM_TXTS_BW(chan)		((chan) % 2 ? AN7581_PCM_TXTS1_BW : AN7581_PCM_TXTS0_BW)
+#define     AN7581_PCM_TXTS_BW_8BIT		0x0
+#define     AN7581_PCM_TXTS_BW_16BIT(chan)	AN7581_PCM_TXTS_BW(chan)
+#define   AN7581_PCM_TXTS_START(chan)		((chan) % 2 ? AN7581_PCM_TXTS1_START : AN7581_PCM_TXTS0_START)
+#define AN7581_PCM_PRTSCR4			0x78
+#define AN7581_PCM_PRTSCR5			0x7c
+#define AN7581_PCM_PRTSCR6			0x80
+#define AN7581_PCM_PRTSCR7			0x84
+#define AN7581_PCM_PRTSCR8			0x88
+#define AN7581_PCM_PRTSCR9			0x8c
+#define AN7581_PCM_PRTSCR10			0x90
+#define AN7581_PCM_PRTSCR11			0x94
+#define AN7581_PCM_PRTSCR12			0x98
+#define AN7581_PCM_PRTSCR13			0x9c
+#define AN7581_PCM_PRTSCR14			0xa0
+#define AN7581_PCM_PRTSCR15			0xa4
+#define AN7581_PCM_PRTSCR(chan)			((chan) < 8 ? \
+						 (AN7581_PCM_PRTSCR0 + ((chan) / 2) * 4) : \
+						 (AN7581_PCM_PRTSCR4 + (((chan) - 8) / 2) * 4))
+#define   AN7581_PCM_RXTS_BW(chan)		((chan) % 2 ? AN7581_PCM_RXTS1_BW : AN7581_PCM_RXTS0_BW)
+#define     AN7581_PCM_RXTS_BW_8BIT		0x0
+#define     AN7581_PCM_RXTS_BW_16BIT(chan)	AN7581_PCM_RXTS_BW(chan)
+#define   AN7581_PCM_RXTS_START(chan)		((chan) % 2 ? AN7581_PCM_RXTS1_START : AN7581_PCM_RXTS0_START)
+#define AN7581_PCM_CHBFOSR			0xa8
+#define   AN7581_PCM_DESC_CHBF_OFFSET		GENMASK(15, 0)
+#define AN7581_PCM_DCHENR			0xac
+/* Each channel correspond to a bit.
+ * Example:
+ * BIT(0) -> chan 0
+ * BIT(1) -> chan 1
+ * ...
+ *
+ * Notice that it's expected the channel are sequential
+ * aka it's not possible to have empty channel in between.
+ * (example BIT(0) | BIT(2))
+ */
+#define   AN7581_PCM_CHAN_EN			GENMASK(31, 0)
+
+#define AN7581_PCM_MAX_CHANNELS			32
+#define AN7581_PCM_TX_DESCRIPTORS		15
+#define AN7581_PCM_RX_DESCRIPTORS		15
+#define AN7581_PCM_DESCRIPTORS			(AN7581_PCM_TX_DESCRIPTORS + AN7581_PCM_RX_DESCRIPTORS)
+#define AN7581_PCM_FRAMES_PER_DESC		80
+#define AN7581_PCM_MAX_SAMPLE_BYTES		2
+#define AN7581_PCM_MAX_PERIOD_BYTES		(AN7581_PCM_FRAMES_PER_DESC * \
+						 AN7581_PCM_MAX_CHANNELS * \
+						 AN7581_PCM_MAX_SAMPLE_BYTES)
+#define AN7581_PCM_MAX_BUFFER_BYTES		(AN7581_PCM_MAX_PERIOD_BYTES * \
+						 AN7581_PCM_TX_DESCRIPTORS)
+
+#define AN7581_PCM_DESC_STATUS_OWNERSHIP	BIT(31)
+#define AN7581_PCM_DESC_STATUS_OWNERSHIP_CPU	FIELD_PREP_CONST(AN7581_PCM_DESC_STATUS_OWNERSHIP, 0x0)
+#define AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA	FIELD_PREP_CONST(AN7581_PCM_DESC_STATUS_OWNERSHIP, 0x1)
+#define AN7581_PCM_DESC_STATUS_SAMPLE_SIZE	GENMASK(9, 0)
+
+struct an7581_pcm_desc {
+	u32 status;
+	u32 channel_mask;
+	u32 dma_addr;
+} __packed;
+
+struct an7581_pcm_priv {
+	struct regmap *map;
+	struct reset_control *reset;
+
+	/* Cached current stream for IRQ */
+	struct snd_pcm_substream *stream[SNDRV_PCM_STREAM_LAST + 1];
+
+	/* Protect descriptor idx */
+	spinlock_t desc_lock;
+	/* Protect configuration shared by playback and capture. */
+	struct mutex user_lock;
+	unsigned int users;
+	unsigned int current_rate;
+	unsigned int current_channels;
+
+	struct an7581_pcm_desc *tx_descs;
+	int tx_desc_idx;
+	dma_addr_t tx_dma;
+
+	struct an7581_pcm_desc *rx_descs;
+	int rx_desc_idx;
+	dma_addr_t rx_dma;
+
+	unsigned int tx_pos;
+	unsigned int rx_pos;
+};
+
+static const struct snd_pcm_hardware an7581_pcm_hardware = {
+	.info			= SNDRV_PCM_INFO_MMAP |
+				  SNDRV_PCM_INFO_MMAP_VALID |
+				  SNDRV_PCM_INFO_INTERLEAVED,
+	.formats		= SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_U16_LE,
+
+	.period_bytes_min = AN7581_PCM_FRAMES_PER_DESC,
+	.period_bytes_max = AN7581_PCM_MAX_PERIOD_BYTES,
+
+	.buffer_bytes_max = AN7581_PCM_MAX_BUFFER_BYTES,
+
+	.periods_min = AN7581_PCM_TX_DESCRIPTORS,
+	.periods_max = AN7581_PCM_TX_DESCRIPTORS,
+};
+
+static int an7581_pcm_setup_time_slot(struct an7581_pcm_priv *priv,
+				      int direction, int bit_width)
+{
+	int bit_counter = 0;
+	int chan;
+
+	for (chan = 0; chan < AN7581_PCM_MAX_CHANNELS; chan++) {
+		u32 mask, val;
+		u32 reg;
+
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			reg = AN7581_PCM_PTTSCR(chan);
+			mask = AN7581_PCM_TXTS_BW(chan) |
+			       AN7581_PCM_TXTS_START(chan);
+
+			if (bit_width == 8)
+				val = AN7581_PCM_TXTS_BW_8BIT;
+			else
+				val = AN7581_PCM_TXTS_BW_16BIT(chan);
+			val |= bit_counter << __bf_shf(AN7581_PCM_TXTS_START(chan));
+		} else {
+			reg = AN7581_PCM_PRTSCR(chan);
+			mask = AN7581_PCM_RXTS_BW(chan) |
+			       AN7581_PCM_RXTS_START(chan);
+
+			if (bit_width == 8)
+				val = AN7581_PCM_RXTS_BW_8BIT;
+			else
+				val = AN7581_PCM_RXTS_BW_16BIT(chan);
+			val |= bit_counter << __bf_shf(AN7581_PCM_RXTS_START(chan));
+		}
+
+		regmap_update_bits(priv->map, reg, mask, val);
+
+		bit_counter += bit_width;
+	}
+
+	return 0;
+}
+
+static int an7581_pcm_fe_startup(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct an7581_pcm_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	int ret;
+
+	/* Cache stream substream for IRQ handling */
+	priv->stream[substream->stream] = substream;
+
+	/* On open mask interrupt and disable DMA */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
+				  AN7581_PCM_IMR_TDESC_UPDATE_INT);
+		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
+				  AN7581_PCM_TXDMA_ENABLE);
+	} else {
+		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
+				  AN7581_PCM_IMR_RDESC_UPDATE_INT);
+		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
+				  AN7581_PCM_RXDMA_ENABLE);
+	}
+
+	usleep_range(10000, 20000);
+
+	mutex_lock(&priv->user_lock);
+	if (!priv->users) {
+		regmap_clear_bits(priv->map, AN7581_PCM_PICR,
+				  AN7581_PCM_CFG_VALID);
+
+		usleep_range(5000, 10000);
+	}
+	mutex_unlock(&priv->user_lock);
+
+	snd_soc_set_runtime_hwparams(substream, &an7581_pcm_hardware);
+
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					   AN7581_PCM_FRAMES_PER_DESC,
+					   AN7581_PCM_FRAMES_PER_DESC);
+	if (ret < 0) {
+		dev_err(rtd->card->dev, "failed to constrain period to 80 frames\n");
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		dev_err(rtd->card->dev, "snd_pcm_hw_constraint_integer failed\n");
+
+	return ret;
+}
+
+static void an7581_pcm_fe_shutdown(struct snd_pcm_substream *substream,
+				   struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct an7581_pcm_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+
+	/* On close mask interrupt and disable DMA */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
+				  AN7581_PCM_IMR_TDESC_UPDATE_INT);
+		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
+				  AN7581_PCM_TXDMA_ENABLE);
+	} else {
+		regmap_clear_bits(priv->map, AN7581_PCM_IMR,
+				  AN7581_PCM_IMR_RDESC_UPDATE_INT);
+		regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
+				  AN7581_PCM_RXDMA_ENABLE);
+	}
+
+	priv->stream[substream->stream] = NULL;
+
+	usleep_range(10000, 20000);
+
+	mutex_lock(&priv->user_lock);
+
+	if (priv->users)
+		priv->users--;
+
+	if (!priv->users)
+		regmap_clear_bits(priv->map, AN7581_PCM_PICR,
+				  AN7581_PCM_CFG_VALID);
+
+	mutex_unlock(&priv->user_lock);
+}
+
+static int an7581_pcm_fe_prepare(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct an7581_pcm_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct an7581_pcm_desc *desc;
+	unsigned int period_bytes;
+	int num_desc, i;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		priv->tx_pos = 0;
+		priv->tx_desc_idx = 0;
+		desc = priv->tx_descs;
+		num_desc = AN7581_PCM_TX_DESCRIPTORS;
+	} else {
+		priv->rx_pos = 0;
+		priv->rx_desc_idx = 0;
+		desc = priv->rx_descs;
+		num_desc = AN7581_PCM_RX_DESCRIPTORS;
+	}
+
+	period_bytes = frames_to_bytes(runtime, AN7581_PCM_FRAMES_PER_DESC);
+	for (i = 0; i < num_desc; i++) {
+		desc->status |= AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
+		desc->dma_addr = runtime->dma_addr + i * period_bytes;
+		desc++;
+	}
+
+	return 0;
+}
+
+static int an7581_pcm_fe_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct an7581_pcm_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	unsigned int channels = params_channels(params);
+	unsigned int rate = params_rate(params);
+	int bit_width = params_width(params);
+	struct an7581_pcm_desc *desc;
+	int num_desc, i;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		desc = priv->tx_descs;
+		num_desc = AN7581_PCM_TX_DESCRIPTORS;
+	} else {
+		desc = priv->rx_descs;
+		num_desc = AN7581_PCM_RX_DESCRIPTORS;
+	}
+
+	mutex_lock(&priv->user_lock);
+	if (priv->users &&
+	    (priv->current_rate != rate ||
+	     priv->current_channels != channels)) {
+		dev_err(rtd->card->dev, "playback/capture rates/channels must match in full-duplex mode\n");
+		mutex_unlock(&priv->user_lock);
+		return -EBUSY;
+	}
+
+	if (!priv->users) {
+		/* one bit delay for ZSI */
+		regmap_set_bits(priv->map, AN7581_PCM_PICR, AN7581_PCM_ONE_BIT_DELAY);
+
+		regmap_update_bits(priv->map, AN7581_PCM_PICR,
+				   AN7581_PCM_BIT_MSTSLV_MODE,
+				   AN7581_PCM_BIT_MSTSLV_MODE_MASTER);
+
+		regmap_update_bits(priv->map, AN7581_PCM_PICR,
+				   AN7581_PCM_BIT_CLK,
+				   AN7581_PCM_BIT_CLK_2048HZ);
+
+		regmap_update_bits(priv->map, AN7581_PCM_PICR,
+				   AN7581_PCM_SAMPLE_CLK,
+				   (rate == 16000 ? AN7581_PCM_SAMPLE_CLK_16KHZ :
+				   AN7581_PCM_SAMPLE_CLK_8KHZ));
+
+		regmap_update_bits(priv->map, AN7581_PCM_PICR,
+				   AN7581_PCM_FS_LEN,
+				   AN7581_PCM_FS_LEN_16);
+
+		regmap_set_bits(priv->map, AN7581_PCM_PICR, AN7581_PCM_BIT_ORDER);
+
+		regmap_clear_bits(priv->map, AN7581_PCM_PICR, AN7581_PCM_FS_EDGE);
+	}
+
+	/* Setup timeslot */
+	an7581_pcm_setup_time_slot(priv, substream->stream, bit_width);
+
+	if (!priv->users) {
+		/* Setup Descriptor size and number */
+		regmap_update_bits(priv->map, AN7581_PCM_TRDRSR,
+				   AN7581_DESC_OFFSET | AN7581_DESC_SIZE,
+				   FIELD_PREP(AN7581_DESC_OFFSET, sizeof(*desc) / sizeof(u32)) |
+				   FIELD_PREP(AN7581_DESC_SIZE, num_desc));
+
+		regmap_update_bits(priv->map, AN7581_PCM_CHBFOSR,
+				   AN7581_PCM_DESC_CHBF_OFFSET,
+				   FIELD_PREP(AN7581_PCM_DESC_CHBF_OFFSET,
+					      AN7581_PCM_FRAMES_PER_DESC * bit_width / 8));
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		regmap_write(priv->map, AN7581_PCM_TDRBAR, priv->tx_dma);
+	else
+		regmap_write(priv->map, AN7581_PCM_RDRBAR, priv->rx_dma);
+
+	/* Configure descriptors for DMA ownership and sample size */
+	for (i = 0; i < num_desc; i++) {
+		/* Assign to each descriptor the dma_addr + offset of period bytes */
+		desc[i].status = FIELD_PREP(AN7581_PCM_DESC_STATUS_SAMPLE_SIZE,
+					    AN7581_PCM_FRAMES_PER_DESC);
+
+		desc[i].channel_mask = GENMASK(channels - 1, 0);
+	}
+
+	if (!priv->users) {
+		/* Enable channels */
+		regmap_update_bits(priv->map, AN7581_PCM_DCHENR,
+				   AN7581_PCM_CHAN_EN,
+				   FIELD_PREP(AN7581_PCM_CHAN_EN, GENMASK(channels - 1, 0)));
+
+		/* Signal PCM configuration is now valid */
+		regmap_set_bits(priv->map, AN7581_PCM_PICR,
+				AN7581_PCM_CFG_VALID);
+	}
+
+	priv->current_rate = rate;
+	priv->current_channels = channels;
+	priv->users++;
+
+	mutex_unlock(&priv->user_lock);
+
+	return 0;
+}
+
+static int an7581_pcm_fe_trigger(struct snd_pcm_substream *substream, int cmd,
+				 struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct an7581_pcm_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		/* Trigger PCM to POLL new descriptor */
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			regmap_set_bits(priv->map, AN7581_PCM_TRDCR,
+					AN7581_PCM_TXDMA_ENABLE);
+
+			regmap_set_bits(priv->map, AN7581_PCM_IMR,
+					AN7581_PCM_IMR_TDESC_UPDATE_INT);
+
+			regmap_write(priv->map, AN7581_PCM_TPDR,
+				     AN7581_PCM_TX_POLLING);
+		} else {
+			regmap_set_bits(priv->map, AN7581_PCM_TRDCR,
+					AN7581_PCM_RXDMA_ENABLE);
+
+			regmap_set_bits(priv->map, AN7581_PCM_IMR,
+					AN7581_PCM_IMR_RDESC_UPDATE_INT);
+
+			regmap_write(priv->map, AN7581_PCM_RPDR,
+				     AN7581_PCM_RX_POLLING);
+		}
+
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			regmap_clear_bits(priv->map, AN7581_PCM_IMR,
+					  AN7581_PCM_IMR_TDESC_UPDATE_INT);
+			regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
+					  AN7581_PCM_TXDMA_ENABLE);
+		} else {
+			regmap_clear_bits(priv->map, AN7581_PCM_IMR,
+					  AN7581_PCM_IMR_RDESC_UPDATE_INT);
+			regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
+					  AN7581_PCM_RXDMA_ENABLE);
+		}
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops an7581_pcm_fe_ops = {
+	.startup = an7581_pcm_fe_startup,
+	.shutdown = an7581_pcm_fe_shutdown,
+	.hw_params = an7581_pcm_fe_hw_params,
+	.prepare = an7581_pcm_fe_prepare,
+	.trigger = an7581_pcm_fe_trigger,
+};
+
+static struct snd_soc_dai_driver an7581_pcm_dai_driver[] = {
+	{
+		.name = "DLPCM",
+		.id = 0,
+		.playback = {
+			.stream_name = "DLPCM",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_U16_LE,
+		},
+		.ops = &an7581_pcm_fe_ops,
+	},
+	{
+		.name = "ULPCM",
+		.id = 1,
+		.capture = {
+			.stream_name = "ULPCM",
+			.channels_min = 1,
+			.channels_max = 32,
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_U16_LE,
+		},
+		.ops = &an7581_pcm_fe_ops,
+	},
+};
+
+static const struct snd_soc_component_driver an7581_pcm_dai_component = {
+	.name = "an7581-pcm-dai",
+};
+
+static snd_pcm_uframes_t an7581_pcm_pointer(struct snd_soc_component *component,
+					    struct snd_pcm_substream *substream)
+{
+	struct snd_soc_card *card = component->card;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct an7581_pcm_priv *priv;
+	unsigned long flags;
+	unsigned int pos;
+
+	priv = snd_soc_card_get_drvdata(card);
+
+	spin_lock_irqsave(&priv->desc_lock, flags);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		pos = bytes_to_frames(runtime, priv->tx_pos);
+	else
+		pos = bytes_to_frames(runtime, priv->rx_pos);
+	spin_unlock_irqrestore(&priv->desc_lock, flags);
+
+	return pos % runtime->buffer_size;
+}
+
+static int an7581_pcm_new(struct snd_soc_component *component,
+			  struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_pcm *pcm = rtd->pcm;
+
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev,
+				       0,
+				       AN7581_PCM_MAX_BUFFER_BYTES);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver an7581_pcm_platform = {
+	.name = "an7581-pcm-audio",
+	.pointer = an7581_pcm_pointer,
+	.pcm_construct = an7581_pcm_new,
+};
+
+SND_SOC_DAILINK_DEFS(playback,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DLPCM")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ULPCM")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link an7581_pcm_dai_links[] = {
+	/* FE */
+	{
+		.name = "an7581-playback",
+		.stream_name = "an7581-playback",
+		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
+			    SND_SOC_DPCM_TRIGGER_POST},
+		.playback_only = 1,
+		SND_SOC_DAILINK_REG(playback),
+	},
+	{
+		.name = "an7581-capture",
+		.stream_name = "an7581-capture",
+		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
+			    SND_SOC_DPCM_TRIGGER_POST},
+		.capture_only = 1,
+		SND_SOC_DAILINK_REG(capture),
+	},
+};
+
+static struct snd_soc_card an7581_pcm_card = {
+	.name = "an7581-pcm",
+	.owner = THIS_MODULE,
+	.dai_link = an7581_pcm_dai_links,
+	.num_links = ARRAY_SIZE(an7581_pcm_dai_links),
+};
+
+static irqreturn_t an7581_pcm_irq_handler(int irq, void *data)
+{
+	struct snd_pcm_substream *substream;
+	struct an7581_pcm_priv *priv = data;
+	unsigned long flags;
+	u32 status, isr = 0;
+
+	regmap_read(priv->map, AN7581_PCM_ISR, &isr);
+
+	/* Scan descriptor on receiving RX desc update interrupt */
+	if (isr & AN7581_PCM_IMR_RDESC_UPDATE_INT) {
+		struct snd_pcm_runtime *runtime;
+		struct an7581_pcm_desc *desc;
+		unsigned int sample_size;
+		bool rx_poll = false;
+		int i;
+
+		substream = priv->stream[SNDRV_PCM_STREAM_CAPTURE];
+		if (!substream)
+			goto handle_tx;
+
+		runtime = substream->runtime;
+
+		for (i = 0; i < AN7581_PCM_RX_DESCRIPTORS; i++) {
+			spin_lock_irqsave(&priv->desc_lock, flags);
+
+			desc = &priv->rx_descs[priv->rx_desc_idx];
+			status = desc->status;
+			if ((status & AN7581_PCM_DESC_STATUS_OWNERSHIP) ==
+			    AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA) {
+				spin_unlock_irqrestore(&priv->desc_lock,
+						       flags);
+				break;
+			}
+
+			sample_size = FIELD_GET(AN7581_PCM_DESC_STATUS_SAMPLE_SIZE,
+						status);
+
+			priv->rx_pos += frames_to_bytes(runtime, sample_size);
+			priv->rx_desc_idx++;
+			if (priv->rx_desc_idx == AN7581_PCM_RX_DESCRIPTORS)
+				priv->rx_desc_idx = 0;
+
+			spin_unlock_irqrestore(&priv->desc_lock, flags);
+
+			snd_pcm_period_elapsed(substream);
+
+			desc->status |= AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
+
+			if (snd_pcm_capture_hw_avail(runtime) < runtime->period_size)
+				goto handle_tx;
+
+			rx_poll = true;
+		}
+
+		if (rx_poll)
+			regmap_write(priv->map, AN7581_PCM_RPDR, AN7581_PCM_RX_POLLING);
+	}
+
+handle_tx:
+	/* Scan descriptor on receiving TX desc update interrupt */
+	if (isr & AN7581_PCM_IMR_TDESC_UPDATE_INT) {
+		struct snd_pcm_runtime *runtime;
+		struct an7581_pcm_desc *desc;
+		unsigned int sample_size;
+		bool tx_poll = false;
+		int i;
+
+		substream = priv->stream[SNDRV_PCM_STREAM_PLAYBACK];
+		if (!substream)
+			return IRQ_HANDLED;
+
+		runtime = substream->runtime;
+
+		for (i = 0; i < AN7581_PCM_TX_DESCRIPTORS; i++) {
+			spin_lock_irqsave(&priv->desc_lock, flags);
+
+			desc = &priv->tx_descs[priv->tx_desc_idx];
+			status = desc->status;
+			if ((status & AN7581_PCM_DESC_STATUS_OWNERSHIP) ==
+			    AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA) {
+				spin_unlock_irqrestore(&priv->desc_lock,
+						       flags);
+				break;
+			}
+
+			sample_size = FIELD_GET(AN7581_PCM_DESC_STATUS_SAMPLE_SIZE,
+						status);
+
+			priv->tx_pos += frames_to_bytes(runtime, sample_size);
+			priv->tx_desc_idx++;
+			if (priv->tx_desc_idx == AN7581_PCM_TX_DESCRIPTORS)
+				priv->tx_desc_idx = 0;
+
+			spin_unlock_irqrestore(&priv->desc_lock, flags);
+
+			snd_pcm_period_elapsed(substream);
+
+			desc->status |= AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
+
+			if (snd_pcm_playback_hw_avail(runtime) < runtime->period_size)
+				return IRQ_HANDLED;
+
+			tx_poll = true;
+		}
+
+		if (tx_poll)
+			regmap_write(priv->map, AN7581_PCM_TPDR,
+				     AN7581_PCM_TX_POLLING);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int an7581_pcm_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &an7581_pcm_card;
+	struct snd_soc_dai_link *dai_link;
+	struct device *dev = &pdev->dev;
+	struct an7581_pcm_priv *priv;
+	const char *connection_type;
+	int irq;
+	int ret;
+	int i;
+
+	card->dev = dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	snd_soc_card_set_drvdata(card, priv);
+
+	priv->map = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(priv->map))
+		return PTR_ERR(priv->map);
+
+	priv->reset = devm_reset_control_get_exclusive(dev, "pcm1");
+	if (IS_ERR(priv->reset))
+		return PTR_ERR(priv->reset);
+
+	irq = of_irq_get(dev_of_node(dev), 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(dev, irq, an7581_pcm_irq_handler,
+					NULL, IRQF_ONESHOT, dev_name(dev), priv);
+	if (ret)
+		return ret;
+
+	spin_lock_init(&priv->desc_lock);
+	mutex_init(&priv->user_lock);
+
+	/* Reset the PCM interface */
+	reset_control_assert(priv->reset);
+	usleep_range(5000, 10000);
+	reset_control_deassert(priv->reset);
+	usleep_range(5000, 10000);
+
+	ret = dma_set_mask(dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
+
+	priv->tx_descs = dma_alloc_coherent(dev, sizeof(struct an7581_pcm_desc) *
+					    AN7581_PCM_TX_DESCRIPTORS, &priv->tx_dma,
+					    GFP_KERNEL);
+	if (!priv->tx_descs)
+		return -ENOMEM;
+
+	priv->rx_descs = dma_alloc_coherent(dev, sizeof(struct an7581_pcm_desc) *
+					    AN7581_PCM_RX_DESCRIPTORS, &priv->rx_dma,
+					    GFP_KERNEL);
+	if (!priv->rx_descs) {
+		ret = -ENOMEM;
+		goto err_free_tx;
+	}
+
+	for_each_card_prelinks(card, i, dai_link)
+		dai_link->platforms->of_node = dev->of_node;
+
+	ret = devm_snd_soc_register_component(dev,
+					      &an7581_pcm_platform,
+					      NULL, 0);
+	if (ret) {
+		dev_err_probe(dev, ret, "Cannot register PCM component\n");
+		goto err_free_rx;
+	}
+
+	ret = devm_snd_soc_register_component(dev,
+					      &an7581_pcm_dai_component,
+					      an7581_pcm_dai_driver,
+					      ARRAY_SIZE(an7581_pcm_dai_driver));
+	if (ret) {
+		dev_err_probe(dev, ret, "Cannot register PCM DAI component\n");
+		goto err_free_rx;
+	}
+
+	ret = devm_snd_soc_register_card(dev, card);
+	if (ret) {
+		dev_err_probe(dev, ret, "%s snd_soc_register_card fail\n", __func__);
+		goto err_free_rx;
+	}
+
+	return 0;
+
+err_free_rx:
+	dma_free_coherent(dev, sizeof(struct an7581_pcm_desc) *
+			  AN7581_PCM_RX_DESCRIPTORS, priv->rx_descs, priv->rx_dma);
+err_free_tx:
+	dma_free_coherent(dev, sizeof(struct an7581_pcm_desc) *
+			  AN7581_PCM_TX_DESCRIPTORS, priv->tx_descs, priv->tx_dma);
+
+	return ret;
+}
+
+static void an7581_pcm_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &an7581_pcm_card;
+	struct device *dev = &pdev->dev;
+	struct an7581_pcm_priv *priv;
+
+	priv = snd_soc_card_get_drvdata(card);
+	regmap_clear_bits(priv->map, AN7581_PCM_IMR,
+			  AN7581_PCM_IMR_TDESC_UPDATE_INT |
+			  AN7581_PCM_IMR_RDESC_UPDATE_INT);
+	regmap_clear_bits(priv->map, AN7581_PCM_TRDCR,
+			  AN7581_PCM_TXDMA_ENABLE |
+			  AN7581_PCM_RXDMA_ENABLE);
+
+	dma_free_coherent(dev, sizeof(struct an7581_pcm_desc) *
+			  AN7581_PCM_RX_DESCRIPTORS, priv->rx_descs, priv->rx_dma);
+	dma_free_coherent(dev, sizeof(struct an7581_pcm_desc) *
+			  AN7581_PCM_TX_DESCRIPTORS, priv->tx_descs, priv->tx_dma);
+}
+
+static const struct of_device_id an7581_pcm_dt_match[] = {
+	{ .compatible = "airoha,an7581-pcm" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an7581_pcm_dt_match);
+
+static struct platform_driver an7581_pcm_driver = {
+	.driver = {
+		   .name = "an7581-pcm",
+		   .of_match_table = an7581_pcm_dt_match,
+	},
+	.probe = an7581_pcm_probe,
+	.remove = an7581_pcm_remove,
+};
+module_platform_driver(an7581_pcm_driver);
+
+MODULE_DESCRIPTION("Airoha SoC PCM platform driver for ALSA AN7581");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736445;
	b=bwVFPpBLwuz5GAhsgXrR/WPkzRh2LRM13qDoTDaGmP97g7ZgHnk56ARBliKf/fM7yBBe
	 GyG86StUIRlAYM5BeAkWUksC+PgMQFVtnltcZxN2bd2syCvHhVQr7ypZx/I0C9V1cvSRa
	 kzYRs3Ek/xKSux/gEuzp/TyoeOQ73EFwgLJtREVRE3PfivsDveg2E+X6p5Hw6TNpEGzgM
	 9JMaGVq1Wb1u9jqmBb+Mu7vb8grFumKuGVbM7sxye/RCZ1St72e7LPFjIiNx5jizPEQDR
	 2pScxLhUg85myoumgZ/JylZrJKITAoqgc1x1VGNrvMaIJxxra8IjN8dtxnrqhn3VrKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736445;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Djp7fxIvWGZFaV0DbzEZyakJG4BafUd57S34IbT5aLo=;
	b=UJnRnGKxDw533fRrNXDNBSYceATpeok54UiHtPSzIXJuAvqrVAyUh2RefHipjd8YURhi
	 U2ikNOAV6wGIXzqlug2Jwus9AlyLy/Gbj4PfS/9EDh/rROuAvaZif70c2/9Pn/zZdpxcW
	 SSxKUuouapCK9lCOJ7fFdPh3aSuADHVpZC/AG0nktRUu3uJqRAufY+KA/hT/+mvELNuZ9
	 Jp8zqlJ6GR9rY+prIkFMb3V8qFm5QUycEcJvTedRWiuhq+Iic7SfmX4WLGvDVLFz9T540
	 jMBcesBAiBtFFOrn4G3+YfWqzqRbvxIVwnuVp2lDYRBrjdFFOghSGPzXnIIyRXPwMqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JKiHUjlx;
	arc=none smtp.remote-ip=95.215.58.225
Received: from mta1.migadu.com (out-225.mta1.migadu.com [95.215.58.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D28606EE84
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D28606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JKiHUjlx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+HBh9PCDoOVSgniwVzdp064w1if1mJ10eg0q78SkfXI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793736442; v=1; x=1794341242;
 b=JKiHUjlxQinO8oW9vB04u469qYYq4s5Hq+cjCf/v0prr7PqlsqGgKIfpUlh7Fif+YGr4LVMl
 SiOpRU3ciGYrakDAfinmi6u2sgmtN+vKi6/qrlTam+WoJ5xoLuimakR+FBL0YPvHRVEM4FJv1ON
 psTHG4yZQ5GLYBT11hm7EcOg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8a98e208986c0b77;
	Tue, 03 Nov 2026 20:07:22 +0000
X-Mizu-Trace-ID: 8a98e208986c0b77
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] ASoC: rt721-sdca: wait for PDEs to reach PS0 after powering them up
Date: Tue,  3 Nov 2026 12:05:39 -0800
Message-ID: <20261103200540.3863272-6-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
References: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
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

The PDE event handlers write REQUESTED_PS and return, so DAPM unmutes
the feature unit and the stream starts while the power domain is still
transitioning. On the ASUS ROG Xbox Ally X20 the first headset mic
capture after the capture path powers down starts with about 0.45 s
pinned at full scale, and the DisCo tables give the jack function PDEs
up to 500 ms to reach PS0.

Poll ACTUAL_PS with sdca_asoc_pde_poll_actual_ps() after each power up,
like rt722 does since its DMIC pop noise fix, and use the 500 ms maximum
for the jack function PDEs. Power down is left alone because ACTUAL_PS
can stay at PS0 while the data port is still running.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/soc/codecs/Kconfig          |  1 +
 sound/soc/codecs/rt721-sdca-sdw.c | 17 ++++++++++++++++
 sound/soc/codecs/rt721-sdca.c     | 33 +++++++++++++++++++++++++++++++
 sound/soc/codecs/rt721-sdca.h     |  1 +
 4 files changed, 52 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ba59dabeeccde..133f397cc6e96 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1978,6 +1978,7 @@ config SND_SOC_RT712_SDCA_DMIC_SDW
 config SND_SOC_RT721_SDCA_SDW
 	tristate "Realtek RT721 SDCA Codec - SDW"
 	depends on SOUNDWIRE
+	depends on SND_SOC_SDCA
 	select REGMAP_SOUNDWIRE
 	select REGMAP_SOUNDWIRE_MBQ
 
diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index fc34a0537d5fb..44cf9ca866c94 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -39,6 +39,14 @@ static bool rt721_sdca_readable_register(struct device *dev, unsigned int reg)
 		RT721_SDCA_CTL_HIDTX_CURRENT_OWNER, 0) ... SDW_SDCA_CTL(FUNC_NUM_HID,
 		RT721_SDCA_ENT_HID01, RT721_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
 	case RT721_BUF_ADDR_HID1 ... RT721_BUF_ADDR_HID2:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE12,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE40,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_PDE2A,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE41,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT0,
 		RT721_SDCA_CTL_FUNC_STATUS, 0):
 		return true;
@@ -64,6 +72,14 @@ static bool rt721_sdca_volatile_register(struct device *dev, unsigned int reg)
 		RT721_SDCA_CTL_HIDTX_CURRENT_OWNER, 0) ... SDW_SDCA_CTL(FUNC_NUM_HID,
 		RT721_SDCA_ENT_HID01, RT721_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
 	case RT721_BUF_ADDR_HID1 ... RT721_BUF_ADDR_HID2:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE12,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE40,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_PDE2A,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE41,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT0,
 		RT721_SDCA_CTL_FUNC_STATUS, 0):
 		return true;
@@ -595,3 +611,4 @@ module_sdw_driver(rt721_sdca_sdw_driver);
 MODULE_DESCRIPTION("ASoC RT721 SDCA SDW driver");
 MODULE_AUTHOR("Jack Yu <jack.yu@realtek.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("SND_SOC_SDCA");
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 9f567caecb70a..db4bf367011ec 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -21,6 +21,9 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/slab.h>
 #include <sound/soc-dapm.h>
+#include <sound/sdca.h>
+#include <sound/sdca_asoc.h>
+#include <sound/sdca_function.h>
 #include <sound/sdw.h>
 #include <sound/tlv.h>
 
@@ -1482,6 +1485,32 @@ static int rt721_sdca_fu36_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+/* The DisCo tables give the jack function PDEs up to 500 ms for PS3 to PS0 */
+static const struct sdca_pde_delay rt721_jack_pde_delays[] = {
+	{ .from_ps = SDCA_PDE_PS3, .to_ps = SDCA_PDE_PS0, .us = 500000 },
+};
+
+/* REQUESTED_PS only starts the transition, so wait for ACTUAL_PS to reach PS0 */
+static void rt721_sdca_pde_wait_ps0(struct rt721_sdca_priv *rt721,
+				    unsigned char func, unsigned char entity)
+{
+	const struct sdca_pde_delay *delays = NULL;
+	int num_delays = 0;
+	int ret;
+
+	if (func == FUNC_NUM_JACK_CODEC) {
+		delays = rt721_jack_pde_delays;
+		num_delays = ARRAY_SIZE(rt721_jack_pde_delays);
+	}
+
+	ret = sdca_asoc_pde_poll_actual_ps(rt721->regmap, func, entity,
+					   SDCA_PDE_PS3, SDCA_PDE_PS0,
+					   delays, num_delays);
+	if (ret)
+		dev_warn(&rt721->slave->dev, "PDE 0x%x did not reach PS0: %d\n",
+			 entity, ret);
+}
+
 static int rt721_sdca_pde47_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
@@ -1495,6 +1524,7 @@ static int rt721_sdca_pde47_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt721->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE40,
 				RT721_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt721_sdca_pde_wait_ps0(rt721, FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE40);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt721->regmap,
@@ -1518,6 +1548,7 @@ static int rt721_sdca_pde41_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt721->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE41,
 				RT721_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt721_sdca_pde_wait_ps0(rt721, FUNC_NUM_AMP, RT721_SDCA_ENT_PDE41);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt721->regmap,
@@ -1541,6 +1572,7 @@ static int rt721_sdca_pde11_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt721->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_PDE2A,
 				RT721_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt721_sdca_pde_wait_ps0(rt721, FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_PDE2A);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt721->regmap,
@@ -1564,6 +1596,7 @@ static int rt721_sdca_pde34_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt721->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE12,
 				RT721_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt721_sdca_pde_wait_ps0(rt721, FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE12);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt721->regmap,
diff --git a/sound/soc/codecs/rt721-sdca.h b/sound/soc/codecs/rt721-sdca.h
index cc3bce0ba5178..2ae68ce3fde28 100644
--- a/sound/soc/codecs/rt721-sdca.h
+++ b/sound/soc/codecs/rt721-sdca.h
@@ -260,6 +260,7 @@ struct rt721_sdca_dmic_kctrl_priv {
 #define RT721_SDCA_CTL_XUV				0x34
 #define RT721_SDCA_CTL_FU_CH_GAIN			0x0b
 #define RT721_SDCA_CTL_FUNC_STATUS			0x10
+#define RT721_SDCA_CTL_ACTUAL_POWER_STATE		0x10
 
 /* RT721 SDCA channel */
 #define CH_L	0x01
-- 
2.56.0


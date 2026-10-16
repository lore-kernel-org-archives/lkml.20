Received: from mta0.migadu.com (out-138.mta0.migadu.com [91.218.175.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F7C3B7B98
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792193102; cv=none; b=dyRUiROpvK9gNUwM7r9bkz9bFtyUZTd4egUXdp/sngOKR8b1MwUzXZsxWi45b1PtgzBJXFLz668UzEMXlrYzO1bxOc0e8Ggavtq1B99JZfrku+KeH2Tm3EdqPdfNBSyHYbiXrXO+2MUZ81qxACLdj7aZwjBTyV1nVE/Miop1DFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792193102; c=relaxed/simple;
	bh=+HBh9PCDoOVSgniwVzdp064w1if1mJ10eg0q78SkfXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvLNhX1kartQMc8RjR9k8MTgnAPIcyvs5fWtGkrbru1sJCpreb9ITD6lLkkhR7u9cUmJljm076ADQp9HbxEtP1JDo+EbNsfwgZ+8vLo7rXH7xGC4HMBiFLPQAcIqox1mEqbSMeYT+xN6in3AFytd7hJBnlYwVkD717gG4vpYF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gQrAxdU0; arc=none smtp.client-ip=91.218.175.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gQrAxdU0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+HBh9PCDoOVSgniwVzdp064w1if1mJ10eg0q78SkfXI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792193098; v=1; x=1792797898;
 b=gQrAxdU0KerXlrAGindWr54a7qrHC2dePCfYgnpSMGD382W3uprpJ1avutWkXKNJScAm/azS
 eHysWL6/1LhVMzaw5un2ciUzy6L9Qv+IJCgygT8gfVUx+VPv16lLEeb7IcENW73n6fiovRysGwj
 R5cR1VizaJu+wFOa3LZ0jotg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dd4bccc0454df3a2;
	Fri, 16 Oct 2026 23:24:58 +0000
X-Mizu-Trace-ID: dd4bccc0454df3a2
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
Subject: [PATCH 5/5] ASoC: rt721-sdca: wait for PDEs to reach PS0 after powering them up
Date: Fri, 16 Oct 2026 16:24:15 -0700
Message-ID: <20261016232416.2628603-6-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
References: <20261016232416.2628603-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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


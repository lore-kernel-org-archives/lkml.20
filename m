Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBF741CB31;
	Fri, 25 Sep 2026 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322451; cv=none; b=BEdYr8crKxJU5VdiI+Y/kNrsM4PH0Ih6+Wa7PqDph7Zzupozhv97GiE6SAE5e5Rshf+EVdeA32IU/caTO+xvKUEbuBbbBnbU5+n6DakwpdXlW8rQds/vSo6WTadFN4nqrAaMI+vDrDZ0UuV7Wy8Ta2g9L0CeEEWz7Bm35HvRNxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322451; c=relaxed/simple;
	bh=jWeNjJqfdbaMlN7IXSMDSvpH8Qf4b6wYCglIWEa8f6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKgUB+KgDOGlMkPLKgs5TxalGTW0JyGWkkZDC/SwASWzKwzY+m2Tc0RsGFErNfPapSP1796r4a2uccr7MHF/vu0TqoR9c6qNQtbIF7Xd3wYInFHeTxsnAa29CwCYmO+M+dTxFg26gHQfKYNhqvpvseuddGWdM9UmjB5U5r+jL1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blKyXOC1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blKyXOC1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0409EC2BCF7;
	Fri, 25 Sep 2026 07:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790322451;
	bh=jWeNjJqfdbaMlN7IXSMDSvpH8Qf4b6wYCglIWEa8f6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=blKyXOC1iiyyYFQ6RkkghRjjDA2GTnBjZtTgM3y3ZTmMLktCWdUjEWw/yyg22Q+79
	 U439sxywu7I+ce8U3jO54l/Ho5GQWISEqv5KEJhtrlHQQetdNHsRadLThtTOzeZus9
	 tDAGCrocOhrKmLWaunX77hifuokkjhICFzhps+l7FGKS4Lp4dvBJDFi8/ngTbyyOA3
	 o56qN1mkQNrNRQb7wlKxsYKGbvjHP5tprk2OK4c9dJfVoPEJn+p35WuFjMUA7T3Iyb
	 3Co7pn1XCANvgsNp2aun12lBNd4of8zV7bpZVjJZ5Ux4Wo5xyiGqD7GJGjaRFRSJv+
	 AaIihB3eNtHuQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CE1C9830E;
	Fri, 25 Sep 2026 07:47:30 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 25 Sep 2026 02:47:30 -0500
Subject: [PATCH 2/6] ASoC: codecs: aw88166: add TDM support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-aw88166-cleanup-v1-2-11f74cb5fe28@gmail.com>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
In-Reply-To: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Val Packett <val@packett.cool>, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790322449; l=8987;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=tfGg+gbmR1wTDH3bnClADh1N75XgFSpxuSsHm9PykiU=;
 b=s8nWKJY4hWsKU4XbV0D9rOkJ0+jhkE5O1+vKuEcUBlXiG9e4frUKR3et5sxDGn7dE+lXej2l8
 dajXH6qIaWJCHXo/2BKm4DmbAfADBmvwycVxB6kSZZWRl+yNJ2P4csu
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This amp supports TDM mode, so implement the set_tdm_slot operation to
let the SoC driver configure the TDM slot number, width, and masks.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 sound/soc/codecs/aw88166.c | 123 ++++++++++++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/aw88166.h |  50 ++++++++++++++++++
 2 files changed, 171 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 89608118cac6c..cd8773e316b90 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
@@ -38,8 +39,14 @@ struct aw88166 {
 	unsigned int fs_value;
 	unsigned int bck_value;
 	unsigned int bck_inv_value;
+	unsigned int tdm_bck_value;
 	unsigned int md_value;
 
+	unsigned int slot_num_value;
+	unsigned int tx_slotvld_mask;
+	unsigned int rxl_slotvld_mask;
+	unsigned int rxr_slotvld_mask;
+
 	bool phase_sync;
 };
 
@@ -125,11 +132,35 @@ static int aw88166_dev_check_pll(struct aw_device *aw_dev)
 	return -EPERM;
 }
 
-static int aw88166_dev_configure_syspll(struct aw88166 *aw88261)
+static int aw88166_dev_configure_syspll(struct aw88166 *aw88166)
 {
 	struct aw_device *aw_dev = aw88166->aw_pa;
 	int ret;
 
+	/* Configure TDM slots (I2S is represented as no slots) */
+	ret = regmap_update_bits(aw_dev->regmap, AW88166_I2SCTRL2_REG,
+			~AW88166_SLOT_NUM_MASK, aw88166->slot_num_value);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(aw_dev->regmap, AW88166_I2SCTRL2_REG,
+			~AW88166_I2S_TX_SLOTVLD_MASK,
+			aw88166->tx_slotvld_mask);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(aw_dev->regmap, AW88166_I2SCTRL2_REG,
+			~AW88166_I2S_RXL_SLOTVLD_MASK,
+			aw88166->rxl_slotvld_mask);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(aw_dev->regmap, AW88166_I2SCTRL2_REG,
+			~AW88166_I2S_RXR_SLOTVLD_MASK,
+			aw88166->rxr_slotvld_mask);
+	if (ret)
+		return ret;
+
 	/* PLL divider must be used for 8/16/32 kHz modes */
 	ret = regmap_update_bits(aw_dev->regmap, AW88166_PLLCTRL1_REG,
 			~AW88166_CCO_MUX_MASK, aw88166->cco_mux_value);
@@ -144,7 +175,9 @@ static int aw88166_dev_configure_syspll(struct aw88166 *aw88261)
 
 	/* The bit clock (BCK) defines the length of a frame */
 	ret = regmap_update_bits(aw_dev->regmap, AW88166_I2SCTRL1_REG,
-			~AW88166_I2SBCK_MASK, aw88166->bck_value);
+			~AW88166_I2SBCK_MASK,
+			(aw88166->tdm_bck_value != AW88166_TDM_BCK_UNSET)
+			? aw88166->tdm_bck_value : aw88166->bck_value);
 	if (ret)
 		return ret;
 
@@ -1260,9 +1293,11 @@ static int aw88166_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
+	case SND_SOC_DAIFMT_DSP_A:
 		aw88166->md_value = AW88166_I2SMD_PHILIPS_STANDARD_VALUE;
 		break;
 	case SND_SOC_DAIFMT_MSB:
+	case SND_SOC_DAIFMT_DSP_B:
 		aw88166->md_value = AW88166_I2SMD_MSB_JUSTIFIED_VALUE;
 		break;
 	case SND_SOC_DAIFMT_LSB:
@@ -1369,9 +1404,90 @@ static int aw88166_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int aw88166_set_tdm_slot(struct snd_soc_dai *dai,
+	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
+	int chan;
+
+	switch (slots) {
+	case 0:
+		/* Just reset everything TDM related to I2S values */
+		aw88166->slot_num_value = AW88166_SLOT_NUM_I2S_MODE_VALUE;
+		aw88166->tdm_bck_value = AW88166_TDM_BCK_UNSET;
+		aw88166->tx_slotvld_mask = 0 << AW88166_I2S_TX_SLOTVLD_START_BIT;
+		aw88166->rxl_slotvld_mask = 0 << AW88166_I2S_RXL_SLOTVLD_START_BIT;
+		aw88166->rxr_slotvld_mask = 1 << AW88166_I2S_RXR_SLOTVLD_START_BIT;
+		return 0;
+	case 1:
+		aw88166->slot_num_value = AW88166_SLOT_NUM_TDM1S_VALUE;
+		break;
+	case 2:
+		aw88166->slot_num_value = AW88166_SLOT_NUM_TDM2S_VALUE;
+		break;
+	case 4:
+		aw88166->slot_num_value = AW88166_SLOT_NUM_TDM4S_VALUE;
+		break;
+	case 6:
+		aw88166->slot_num_value = AW88166_SLOT_NUM_TDM6S_VALUE;
+		break;
+	case 8:
+		aw88166->slot_num_value = AW88166_SLOT_NUM_TDM8S_VALUE;
+		break;
+	case 16:
+		aw88166->slot_num_value = AW88166_SLOT_NUM_TDM16S_VALUE;
+		break;
+	default:
+		dev_err(aw88166->aw_pa->dev, "unsupported slot count %d\n", slots);
+		return -EINVAL;
+	}
+
+	switch (slot_width) {
+	case 16:
+		aw88166->tdm_bck_value = AW88166_I2SBCK_32FS_VALUE;
+		break;
+	case 20:
+	case 24:
+		aw88166->tdm_bck_value = AW88166_I2SBCK_48FS_VALUE;
+		break;
+	case 32:
+		aw88166->tdm_bck_value = AW88166_I2SBCK_64FS_VALUE;
+		break;
+	default:
+		dev_err(aw88166->aw_pa->dev, "unsupported slot width %d\n",
+			slot_width);
+		return -EINVAL;
+	}
+
+	if (tx_mask != 0) {
+		if ((chan = __ffs(tx_mask)) > 16)
+			return -EINVAL;
+
+		aw88166->tx_slotvld_mask = chan << AW88166_I2S_TX_SLOTVLD_START_BIT;
+	}
+
+	if (rx_mask != 0) {
+		if ((chan = __ffs(rx_mask)) > 16)
+			return -EINVAL;
+
+		aw88166->rxl_slotvld_mask = chan << AW88166_I2S_RXL_SLOTVLD_START_BIT;
+	}
+
+	if ((rx_mask & ~BIT(chan)) != 0) {
+		if ((chan = __ffs(rx_mask & ~BIT(chan))) > 16)
+			return -EINVAL;
+
+		aw88166->rxr_slotvld_mask = chan << AW88166_I2S_RXR_SLOTVLD_START_BIT;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops aw88166_dai_ops = {
 	.set_fmt = aw88166_set_fmt,
 	.hw_params = aw88166_hw_params,
+	.set_tdm_slot = aw88166_set_tdm_slot,
 };
 
 static struct snd_soc_dai_driver aw88166_dai[] = {
@@ -1891,12 +2007,15 @@ static int aw88166_i2c_probe(struct i2c_client *i2c)
 		return -ENOMEM;
 
 	/* set defaults */
+	aw88166->slot_num_value = AW88166_SLOT_NUM_I2S_MODE_VALUE;
 	aw88166->sr_value = AW88166_I2SSR_48KHZ_VALUE;
 	aw88166->cco_mux_value = AW88166_CCO_MUX_BYPASS_VALUE;
 	aw88166->fs_value = AW88166_I2SFS_24_BITS_VALUE;
 	aw88166->bck_value = AW88166_I2SBCK_64FS_VALUE;
 	aw88166->bck_inv_value = AW88166_BCKINV_NOT_INVERT_VALUE;
+	aw88166->tdm_bck_value = AW88166_TDM_BCK_UNSET;
 	aw88166->md_value = AW88166_I2SMD_PHILIPS_STANDARD_VALUE;
+	aw88166->rxr_slotvld_mask = 1 << AW88166_I2S_RXR_SLOTVLD_START_BIT;
 
 	mutex_init(&aw88166->lock);
 
diff --git a/sound/soc/codecs/aw88166.h b/sound/soc/codecs/aw88166.h
index 0aa92b3b6c3b8..377a733447e70 100644
--- a/sound/soc/codecs/aw88166.h
+++ b/sound/soc/codecs/aw88166.h
@@ -437,6 +437,8 @@
 #define AW88166_I2SBCK_64FS_VALUE	\
 	(AW88166_I2SBCK_64FS << AW88166_I2SBCK_START_BIT)
 
+#define AW88166_TDM_BCK_UNSET			UINT_MAX
+
 #define AW88166_I2SSR_START_BIT			(0)
 #define AW88166_I2SSR_BITS_LEN			(4)
 #define AW88166_I2SSR_MASK				\
@@ -476,6 +478,54 @@
 #define AW88166_I2SSR_192KHZ_VALUE		\
 	(AW88166_I2SSR_192KHZ << AW88166_I2SSR_START_BIT)
 
+#define AW88166_SLOT_NUM_START_BIT	(12)
+#define AW88166_SLOT_NUM_BITS_LEN	(3)
+#define AW88166_SLOT_NUM_MASK	\
+	(~(((1<<AW88166_SLOT_NUM_BITS_LEN)-1) << AW88166_SLOT_NUM_START_BIT))
+
+#define AW88166_SLOT_NUM_I2S_MODE	(0)
+#define AW88166_SLOT_NUM_I2S_MODE_VALUE	\
+	(AW88166_SLOT_NUM_I2S_MODE << AW88166_SLOT_NUM_START_BIT)
+
+#define AW88166_SLOT_NUM_TDM1S	(1)
+#define AW88166_SLOT_NUM_TDM1S_VALUE	\
+	(AW88166_SLOT_NUM_TDM1S << AW88166_SLOT_NUM_START_BIT)
+
+#define AW88166_SLOT_NUM_TDM2S	(2)
+#define AW88166_SLOT_NUM_TDM2S_VALUE	\
+	(AW88166_SLOT_NUM_TDM2S << AW88166_SLOT_NUM_START_BIT)
+
+#define AW88166_SLOT_NUM_TDM4S	(3)
+#define AW88166_SLOT_NUM_TDM4S_VALUE	\
+	(AW88166_SLOT_NUM_TDM4S << AW88166_SLOT_NUM_START_BIT)
+
+#define AW88166_SLOT_NUM_TDM6S	(4)
+#define AW88166_SLOT_NUM_TDM6S_VALUE	\
+	(AW88166_SLOT_NUM_TDM6S << AW88166_SLOT_NUM_START_BIT)
+
+#define AW88166_SLOT_NUM_TDM8S	(5)
+#define AW88166_SLOT_NUM_TDM8S_VALUE	\
+	(AW88166_SLOT_NUM_TDM8S << AW88166_SLOT_NUM_START_BIT)
+
+#define AW88166_SLOT_NUM_TDM16S	(6)
+#define AW88166_SLOT_NUM_TDM16S_VALUE	\
+	(AW88166_SLOT_NUM_TDM16S << AW88166_SLOT_NUM_START_BIT)
+
+#define AW88166_I2S_TX_SLOTVLD_START_BIT	(8)
+#define AW88166_I2S_TX_SLOTVLD_BITS_LEN	(4)
+#define AW88166_I2S_TX_SLOTVLD_MASK	\
+	(~(((1<<AW88166_I2S_TX_SLOTVLD_BITS_LEN)-1) << AW88166_I2S_TX_SLOTVLD_START_BIT))
+
+#define AW88166_I2S_RXR_SLOTVLD_START_BIT	(4)
+#define AW88166_I2S_RXR_SLOTVLD_BITS_LEN	(4)
+#define AW88166_I2S_RXR_SLOTVLD_MASK	\
+	(~(((1<<AW88166_I2S_RXR_SLOTVLD_BITS_LEN)-1) << AW88166_I2S_RXR_SLOTVLD_START_BIT))
+
+#define AW88166_I2S_RXL_SLOTVLD_START_BIT	(0)
+#define AW88166_I2S_RXL_SLOTVLD_BITS_LEN	(4)
+#define AW88166_I2S_RXL_SLOTVLD_MASK	\
+	(~(((1<<AW88166_I2S_RXL_SLOTVLD_BITS_LEN)-1) << AW88166_I2S_RXL_SLOTVLD_START_BIT))
+
 #define AW88166_CCO_MUX_START_BIT	(8)
 #define AW88166_CCO_MUX_BITS_LEN	(1)
 #define AW88166_CCO_MUX_MASK		\

-- 
2.54.0



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69CB4A842C;
	Thu,  3 Sep 2026 18:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460003; cv=none; b=HZx7W9eCz91I4wflqCTR/m2XPenxIzAAagP0s+Z57YLsFLd+Pwk7EsCO6pD+wmrVUL+YVlHzGB7vrDcImBytL8uKWRRsOFEet78nBm6wgVg+fq2UqI0TaymCfkWHajS6V70/5ZHZGuxNE+bpIdAelMG7o5s+QimGIyx9mawrCMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460003; c=relaxed/simple;
	bh=D46BWG2qTVt1t0AiaUNt4R05+bK4fA19/1UAlFczTXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTigpxG6r6SAgGlnlcCsHcjDK6A8KekzXTOwzXnTnIFrkTUXjEOsVLjtGUD6kj3T5SrHUXs7VLtrMZCi0V03sVs77Xvp3EzuQLss9s+7yE0q596905KDFaDKWc8Tm+fucFp8DG97dPkkN/hl0oQDDRORCV4tNzSnXjlF7wYw4JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNyY/fJI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNyY/fJI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 421D3C2BCF7;
	Thu,  3 Sep 2026 18:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788460003;
	bh=D46BWG2qTVt1t0AiaUNt4R05+bK4fA19/1UAlFczTXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iNyY/fJI4cmb4/14HRAwZ2TpVvl5ldxia4RNHA30PZd6td5Ssmx9Up2x7Mh44lEul
	 pkM16cEak9VfRayGTyNpoLhidcra2JhH68cP1oX+i1jLk/DWSdPK6RYhOpcb2ewhq4
	 odl+aTHt9OFryeMmafkpavLUJmpf74LZK5H3d9ylf9S/hPjfM4Pgqa/QB9Lg4dfSM5
	 M2uVIpEcfpMsjIWesbA6RRlqwZxUa4Kz5XAOKVp8+Fm6d2D0+hPWPwawGDRnQAErIF
	 +jiuWMzsxvRH0fYBn1syzh6qM+O56LuzRqb0LZBUWjRffkzOC7jEjG0bX0DmYPxwk4
	 67+87Vh4e6GHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2166BC61DD3;
	Thu,  3 Sep 2026 18:26:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 03 Sep 2026 20:26:37 +0200
Subject: [PATCH RFC v2 1/6] ASoC: qcom: sdm845: Demystify TDM masks a bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-pixel3-audio-v2-1-7c22ed915291@ixit.cz>
References: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
In-Reply-To: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=cPwrEY4ZNqiKfvbC0ASAoVk96Jl21/NzxFU+I7j9SBQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqmbvhxwq/202EQUg7sPGfMmY8UagSnnoYZN3nW
 tFBAMgI0qmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapm74QAKCRBgAj/E00kg
 chwgEACEFfcVpyGEbKOWWdYcMAyngylTuHsY9hAchAakiWMg8mNUjb+G4VdoSIagaaGKzRhrZ/d
 EHSBe5JLdxart/C98n0J49NYtRt2z85WmaIpRXkhBRCV8x0IS5M/ROCppr7gFkO6CtizuavP1rP
 rB+WnwEHyAM07oeZPVeNvz+KOhyK7n/eY76kQuIds+3K+62UVRvrcivSE/fPqhmk8xuzmm15NmD
 7yfIZWCB8Mq1DWqgtOHYhmIWqoTN5cbuAXom5Ul/ij1EtjIgUJZH+cj9CZAmQBM2237g61iyUQG
 Mw86EXqHXBDi38NR8RsO7W0vgrrcn73Y+VV6bFxYbqT08EsbzPPgm1xJrEc822lYhYS4pFCc2Qx
 hrcvnrM+dASSiI4858sDotZCs4U8++MFWJFuMHTwryd3ucEuqHx2mO8UZpzbHU9O7Kobl0y5/No
 yIJ/5EMYJoF3y1DQ0JJ0gx9zVEEFHuC3bcyAcjXdb+0YF+SfVTOIxW07QIWvMJrT7wjkjYUQkEm
 oF2AmKkrpKff/MKX0ZQdIfwfkstiu2azEpycpoCVKSySGhCQmxZ7AKXwggg3/4zSZt/zfJFyYHa
 dnr8veLLOqxMUe8lQf7tst0igh3F4HiDhL7WiQmO6Cfu1+14EmK+oTo9kTiO4ExsoZYNjXtDXG8
 eRWpU1OnOCCwhCQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Describe the mask with the bits used for each RX/TX.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 sound/soc/qcom/sdm845.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 6843ab8ba017e..0ce8265ab1c1f 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -18,19 +18,24 @@
 #include "sdw.h"
 #include "../codecs/rt5663.h"
 
 #define DRIVER_NAME	"sdm845"
 #define DEFAULT_SAMPLE_RATE_48K		48000
 #define DEFAULT_MCLK_RATE		24576000
 #define TDM_BCLK_RATE		6144000
 #define MI2S_BCLK_RATE		1536000
-#define LEFT_SPK_TDM_TX_MASK    0x30
-#define RIGHT_SPK_TDM_TX_MASK   0xC0
-#define SPK_TDM_RX_MASK         0x03
+#define LEFT_SPK_TDM_RX_MASK	BIT(0)
+#define RIGHT_SPK_TDM_RX_MASK	BIT(1)
+#define SPK_TDM_RX_MASK		(LEFT_SPK_TDM_RX_MASK | RIGHT_SPK_TDM_RX_MASK)
+#define MIC1_TDM_RX_MASK	BIT(2)
+#define MIC2_TDM_RX_MASK	BIT(3)
+#define MIC_TDM_RX_MASK		(MIC1_TDM_RX_MASK | MIC2_TDM_RX_MASK)
+#define LEFT_SPK_TDM_TX_MASK	(BIT(4) | BIT(5))
+#define RIGHT_SPK_TDM_TX_MASK	(BIT(6) | BIT(7))
 #define NUM_TDM_SLOTS           8
 #define SLIM_MAX_TX_PORTS 16
 #define SLIM_MAX_RX_PORTS 13
 #define WCD934X_DEFAULT_MCLK_RATE	9600000
 
 struct sdm845_snd_data {
 	struct snd_soc_jack jack;
 	bool jack_setup;
@@ -107,34 +112,36 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 	default:
 		dev_err(rtd->dev, "%s: invalid param format 0x%x\n",
 				__func__, params_format(params));
 		return -EINVAL;
 	}
 
 	channels = params_channels(params);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3,
-				8, slot_width);
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, SPK_TDM_RX_MASK,
+					       NUM_TDM_SLOTS, slot_width);
 		if (ret < 0) {
 			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
 					__func__, ret);
 			goto end;
 		}
 
 		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
 				channels, tdm_slot_offset);
 		if (ret < 0) {
 			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
 					__func__, ret);
 			goto end;
 		}
 	} else {
-		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
-				8, slot_width);
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai,
+					       SPK_TDM_RX_MASK |
+					       MIC_TDM_RX_MASK, 0,
+					       NUM_TDM_SLOTS, slot_width);
 		if (ret < 0) {
 			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
 					__func__, ret);
 			goto end;
 		}
 
 		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
 				tdm_slot_offset, 0, NULL);

-- 
2.55.0



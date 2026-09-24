Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4489448380C;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256252; cv=none; b=hYQ0b4eDveUKf06BBnCZrnWthQQNTriR5kG23Nfjgsgc1o9wM2k46m2pRTcay1PYerp6FNS731qI3ZHrD6AROC2xTmOBeg/0BasOW7HagW+ymsdv55QFm/PlH+4FvBHm4ekK3RBtgic82efPV3cfi2SjHawSdzQukPld1jZLMs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256252; c=relaxed/simple;
	bh=D46BWG2qTVt1t0AiaUNt4R05+bK4fA19/1UAlFczTXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kKGAh95fcMpznGzWacoOcucqWLL77E9J19heYNUhiBOrJr2X9Eg6jV3vjDBpZ04roa5eHBO+3A/t3/huUlE+CP5pZLn7aVBCUG3U1upwD70q9L7dGQvEPFbgMfODuEU3XtJ69FpoRESqkHIrqxYTXW6swDL4Wgv0nVWA8Sn8y1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIIm8jlL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIIm8jlL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 740FEC2BCF7;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790256251;
	bh=D46BWG2qTVt1t0AiaUNt4R05+bK4fA19/1UAlFczTXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uIIm8jlLv9xkIw1gb0gFU/SGvP76jtpbIGz48/zZR6dzMyoVzHxyrejf9PQKygGVY
	 Bfpfpa4kkmrbWj5uvvoFZTOT53+IBf6vILqlKVvq7JUnmkGc4IWdNbvgec/CLntvoz
	 5dFDJYlrhzR1Lr/fgIEoVMxqr3Kzf6WtFT3/229d6FuBrFjIz2sh0Y0hXeTmeVQ7mh
	 lry2x2knC2tdQq2mg3Q/NfPjU7hijeR1ZzVAsjriQqY9k5eK5Nw6ZsB0ByqrS5tSwX
	 9Bq6o824a0Lda0C7fp/6BKzGY+sLyMaJ5Fh1GQ2TfT8Em7qla6XFvhaNBB05v+XVZA
	 1oX/kG3lhH0bQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A7AC98317;
	Thu, 24 Sep 2026 13:24:11 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 15:24:06 +0200
Subject: [PATCH v4 1/8] ASoC: qcom: sdm845: Demystify TDM masks a bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-pixel3-audio-v4-1-85b5d133aa5e@ixit.cz>
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
In-Reply-To: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtSR4CdXPX4fxfrnimtJp4etwH8+O17yUrxJVI
 8WIsEP0ddWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUkeAAKCRBgAj/E00kg
 clWDD/0Sd3LJ+PT0/UTmsZUocLrgsYHAzq5DzXV68p84rNdFSOSYLFx+uhkRwKd2F/ZdiVkKNrT
 4ZxOzHP3lRFw5KA33eR5kr8DchuFeP4l4o1d/CQIc++sDTJD/Bz5Nt4+BNLEopU4g0ipT4cJ2yY
 PRE/pRYoOBZgtNsoCPjIjKWY/csu8COvq9SfaHIgFOhSdWKH0lFux+9kocZO8hi546ikwYkJbdC
 b7HIJwvSInquu2ehVY82ilO7VHb4dAbxi/bkDOm0Y/MCQEIqMp15u2i/pOxS5LtzqqCpFB80jMO
 oDAgxIqEW8CLixiPb3e6Sh+KAduN6K4B7pVAoK2chep4zxx38rkkR8nK/7WJWDJIB3jPRNAIJrk
 TeAcvLZiLZRS+b1B5l/XU6KVcQvv5kjrEOf08zz8wnD/AAnEgTQjkbOan08kv0zrF/2pe8CG+iW
 hcObixWXxTVdorWo7ce8lkJ/Wajr+gXW61QMtroJAtpRXFwuoj2oPh4Qu2wUqZK3Eaud6Hh9PHe
 CVrmrXAp6Le+LCNiGTIV4kmbJwZ/qMlNWSILR17ss84NygaIxXAvRKgGgSm4ikJPsrvqXbocI3Y
 +nkCcyTCdpQ30ElzGokcU0CJCfZS7cKeyBO9xyytzhsAA6HvG07oGBTxULR7CIE6iVPRHlAVIlO
 FpnFpcYaSQnXQfQ==
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



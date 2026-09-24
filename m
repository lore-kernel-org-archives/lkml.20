Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A5445D5C2;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254011; cv=none; b=Np3l2/CvsMt6xjilXwRXszTTo1r6LrMbMyGoD06vKgKHWcXzHB4/qmjSreIeX5GDc6XtjHKjbkWRjOM1SFTdypbo+yi4Lj2Otn6EbALluM7shllspwd1jjGte4Y+XLZ7LqAceaWloFqlaRJG/MhGyPnwIlLclo39zdZ2XdCwhyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254011; c=relaxed/simple;
	bh=D46BWG2qTVt1t0AiaUNt4R05+bK4fA19/1UAlFczTXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0AJlW8bSmRJvbzydc29dfmJ4obhIFQSmSsr+EhdCcN3N+GOzeUygy3pn7Mv6IJL2aytX4jZZrF7aTteSgZ2nhqwnj+/gGYvntxIhBeZUZZzgIkQC1XKvtoCSOEMCB35REdMVvXymav5FjwQaxID1Fm8asMRZeeN0B4pZ7XKaEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKGTb37f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKGTb37f"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F96FC2BCF7;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790254010;
	bh=D46BWG2qTVt1t0AiaUNt4R05+bK4fA19/1UAlFczTXU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XKGTb37fhd1RpNLlsZcmyF+KSsdDqSZKSSWlE6+oMsxHVPjjdIO8h9jUjEW1cxZAe
	 PE9uzvg0jUExRStSmkQ9i5I2t2GVwfNcaeidgfjP2wKZZg21Qv8Ls7rN1iSe+XZNJ+
	 Lo9y/9e3dVmev6P/ynwhWvl82WF2LRpgGTweMuRHV662uCqWwDzjPMvZRWEiIi5f+o
	 BxvceeGzfa2MapqAy8iWChDIYb+ujjSWZbDYkd3TWOyKs415qWo34qByLgYPxK0E/y
	 y8IFXz9Duu1/KJMYOwntx3ppUQqb5ZFsVptWUpAaqAo7A6PWqWaWpAs3MdvEu57owa
	 hkk+NGdtLh8+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E394C98317;
	Thu, 24 Sep 2026 12:46:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 14:46:45 +0200
Subject: [PATCH v3 1/8] ASoC: qcom: sdm845: Demystify TDM masks a bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-pixel3-audio-v3-1-5d06460fc8a9@ixit.cz>
References: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
In-Reply-To: <20260924-pixel3-audio-v3-0-5d06460fc8a9@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtRu4Iel1MP6lYrgnnakRY7gcsWr9ncDCNbDg3
 ts5wSQY+0KJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUbuAAKCRBgAj/E00kg
 ck3aD/9VIwTCSVSNqfKG4saJ1RYNffPZ1YhmDah6L799/So1orLi8zF2DLxHtXSBOSD333veZz0
 5UuiaEJ7LH7rutU9e49bYd/lxa8UNJapbuHscfylIrUBhzjEAD5PZ/A5oPPu+4C/PqyJPa6e4NE
 lXEGqZrC3uhWAj476/BXYz4gVV9Quou/9nNXl3s0va4sB5gfaVqnPiccmyHyx5nFA1QBzVSMWeQ
 faZyNgTuhJaUHR8cJC0zeo/QEr+OvLQrPwwrvAL4azInMhNlHprqqZh9pZ8zKkwr0UgxVk6mj3j
 hGaYV15rNBrYsPUrBIlTm+P42/BF7KhWNCDUIdBzUdqzOxmxaV2RcY2wUvClGFo9/QCanPgO510
 PjR5PUYe0Rjjusj6sJK7nf1u3DDNIOMF1XmvkcH3zCMa2D53LAqDw22d/K4PEdUgbpFzOutLmuq
 7uE+w+Q66H3r4u1r7btOcKfQPMraAS6rk5oJ0KLjWh8/v3I0FE5Wf8QKGTvRv6k+xmITANaleLR
 agmXul5kYeDVyx7O78CkoZgMZNRlncBG+vj1FZFkJCDgVqPHV4jWdjX+IEy0OvY3cC2M3yk0a/W
 9BwAYhF8QKcelscDGFDvfneG3V2fl8RRkzpp/JNBC9/xldgvOpFenqZAeok2zENCdk9mqKqLEfN
 SxEqN4vt15BCVpw==
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



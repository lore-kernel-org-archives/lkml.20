Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793560180;
	b=lfO8OUmjQPOeUhPyG9ksVZbbziOwUA987icmBSW/OyvIXWi/2HLJy+Vz6no9rff83XCB
	 9A3SDfbaVmDZQe8Jwg8axMbDAKW4gC1iH86RBeBIymHxECwoGL1+fkPfyx9PW2shTfSQn
	 pBAErxRy3j+hEtsac0thd+4jRncQHVpQSWPTy15SIG1ycmeWu/IjWQPimC5aQn44tpQTK
	 albPkERCQM0Q+ffW8cQmnZ8IP+hPFd8vpCsqIy4ZUi1f94K8FhEz/96DZBtHc6MnRgEDp
	 dPFN+JMFp4Ot5mASCHc9elQBILdvg933W9SW/X0QerSQ7n9sHDA7WmEJaBiG+ErKQjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793560180;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=LA4MOBGnH7WOPJ3v5WtMa3hrQfPYQiY2vki2Q7WBKBk=;
	b=PPqLpS1GoYfEeVUpydhcVH/M3AGjKx9XtW/xw3L7ZrNfGUX5l1iB8tcBQ9FjDLfFJPEJ
	 C75ePH/Z2x0YgwOQCi3xC45MGONyC92h2Nx3X9BLRi9qu9qy2Io0VmQq/ScRZ/PINcR1C
	 2drhTCpGV8mG1VCFaJKx2mm5VHh0iHb1vS/OZ3mH2Xdev+n8istLO9BttIlJnKw6w8B9S
	 iAmOsvxwRlGbwwalgcbQQn4vTkGNjuJ714lfzG2E8CE4gHafCG3iJNGIWTJkDl8fL/eUM
	 HZT4bNaL/nZwPDeQ4QM7wt/JYa2WkfT7mXQ3PJt/op5iCIWxWzvTJpG43YNVxOXSpsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Oo59QWws;
	arc=none smtp.remote-ip=109.224.244.108
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0575606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 19:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0575606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Oo59QWws
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793560176; x=1793819376;
	bh=LA4MOBGnH7WOPJ3v5WtMa3hrQfPYQiY2vki2Q7WBKBk=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Oo59QWwsn6DOx+vKWEP+KJTo3iSzN+4tSy4IbHEsEy5suIQ9jzImkBCL+Q+dmKRUv
	 JBoxAZtI2YfppKFRkcQl54B3Sy/rD/Z7iRwDL0HoyuePPjkIY2nkPR15wb5Ch1WOyf
	 aqo6VL9+/33/m/nE1f5PrW6JTfJP51mD6D3s2oAYCz86k9Qg2INGVv2NsSGXm3zprD
	 midkrvc/O6ydfdTuUnUJKne5ZMohfMGIP5sPapozHiB9si5cjvB0cWb3ug1U+3nNPC
	 LiGdD2sdjbOszgHYCZE0MX/ouojhlnzmsVKaoQ/0OGRK8AInPNQvIiQTE4RbBSDjYm
	 hYwqJ7j48rb1A==
X-Pm-Submission-Id: 4jHksn6L9Tz1DFSp
From: Michael McAllister <me@michaelmcallister.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Michael McAllister <me@michaelmcallister.org>
Subject: [PATCH] ASoC: qcom: q6asm: Correct the 24-bit capture format
Date: Sun, 01 Nov 2026 19:05:33 +0000
Message-ID: <179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Recording in S24_LE on my Moto G10 produces badly scaled samples that
wrap at full scale. The PCM V2 DSP interface places 24-bit samples in
bits 31:8 of each 32-bit word, but ALSA S24_LE expects bits 23:0.

Replace S24_LE with S32_LE for capture and constrain it to 24
significant bits. Keep the DSP configured for 24-bit samples. This
matches its native layout without converting samples in the kernel.
Playback is unchanged.

Translate S32_LE back to S24_LE in the APQ8096 and SC7180 backend
fixups so that routing and the physical audio ports keep their 24-bit
width. The other Q6ASM machine drivers already set the backend format.

Tested on the Moto G10 with direct ALSA and PipeWire capture at 48 kHz,
using 16-bit and 32-bit containers, reopening the stream, and recording
after suspend. ALSA reports 24 significant bits for S32_LE. S24_LE
capture through ALSA's plug conversion also works.

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
Hi,

I found this while getting the microphone working on my Moto G10
(SM4250). This fixes the incorrect sample format for 24-bit capture;
I've tested it with ALSA and PipeWire, including after suspend.

The APQ8096 and SC7180 changes have only been build-tested, so testing
on those boards would be appreciated.

Thanks,
Michael

 sound/soc/qcom/apq8096.c         |  8 ++++++++
 sound/soc/qcom/qdsp6/q6asm-dai.c | 12 ++++++++++--
 sound/soc/qcom/sc7180.c          |  8 ++++++++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index cfd6438db..25f2f0c0e 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -6,6 +6,7 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include "common.h"
 
 #define SLIM_MAX_TX_PORTS 16
@@ -19,10 +20,17 @@ static int apq8096_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
+	/* Keep the backend at 24 bits despite the 32-bit capture container. */
+	if (params_format(params) == SNDRV_PCM_FORMAT_S32_LE) {
+		snd_mask_none(fmt);
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+	}
+
 	return 0;
 }
 
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4261c3048..4bed05f0d 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -90,7 +90,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
 				SNDRV_PCM_INFO_INTERLEAVED |
 				SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE |
-				SNDRV_PCM_FMTBIT_S24_LE),
+				SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
 	.rate_min =             8000,
 	.rate_max =             48000,
@@ -151,7 +151,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 				  SNDRV_PCM_RATE_12000 |		\
 				  SNDRV_PCM_RATE_24000),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
-				    SNDRV_PCM_FMTBIT_S24_LE),		\
+				    SNDRV_PCM_FMTBIT_S32_LE),		\
 			.channels_min = 1,				\
 			.channels_max = 4,				\
 			.rate_min =     8000,				\
@@ -377,6 +377,13 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 
 	stream_id = cpu_dai->driver->id;
 
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		/* The DSP stores 24-bit samples in the high bits of 32-bit words. */
+		ret = snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+		if (ret < 0)
+			return ret;
+	}
+
 	pdata = snd_soc_component_get_drvdata(component);
 	if (!pdata) {
 		dev_err(dev, "Drv data not found ..\n");
@@ -506,6 +513,7 @@ static int q6asm_dai_hw_params(struct snd_soc_component *component,
 		prtd->bits_per_sample = 16;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
+	case SNDRV_PCM_FORMAT_S32_LE:
 		prtd->bits_per_sample = 24;
 		break;
 	}
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index bc5a18883..9e4bd9855 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -13,6 +13,7 @@
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <uapi/linux/input-event-codes.h>
 
@@ -425,10 +426,17 @@ static int sc7180_qdsp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
+	/* Keep the backend at 24 bits despite the 32-bit capture container. */
+	if (params_format(params) == SNDRV_PCM_FORMAT_S32_LE) {
+		snd_mask_none(fmt);
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+	}
+
 	return 0;
 }
 

base-commit: 46fec1c3029b552ec63b2d01af9d43a386f043ea
-- 
2.39.5


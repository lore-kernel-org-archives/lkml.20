Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794161057;
	b=x3JmRHF8mAxFmvhDwOq0E6cNwzdADL/7PaTGAQeE+74K3JVU4tEh4PBTT5imQCejFPpu
	 PX1qgVmBfjidO4ct6K5PcDy+sURtNsCdWbuIUhgBLCrOAi5GlpAU/euo5aCgmt90iFv6f
	 9f3pvTtnyDitQIS1PUl87xKXSY6L7jySX9R9ed0DgFnFXZstN/IyB0Z5iVNxHKjeFDMHj
	 H+9xcGCv1UMpvT3+2qD1vQVpg5OPuRTwmjiVi1/wd0h6S6YqFCdn0UmLc2DuUD0P/KiBP
	 dK+xuFVKAGcn1QCIx2Lxf2r9q1u9bz9BJvPPn/inLXaljZpeVyHLdflFC8htOCsdrKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161057;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+BO7ggl62Lj+oozFUYv9tkz0XO5F9DqJdq0SI4BgX/c=;
	b=QbhfSsR0vHukVcoTQJlzTqteNpLAcN3CG7TSlUdhRXyH2PuEpD3Q3rcYln22C2jC9Yt0
	 A/XfbzUNl0VQSyodomiZ+KdQZD7xqPxyDorr/ns0YvBUZCxsmI2p5fW0vAX9gglNrGNGo
	 ADI2RDjvA9e+riSgN0izGTVVZHAtONCci1JThFqAK/wJDQ2SsT08mlnyUPdYOyOZhgZjh
	 VxbtZ9jwmI2JR+kJIOXPxCbGc1rRJk1XUMqY1UiMSmrMTyMw1XUilEb9m/rxk5apLVqrK
	 tCJ9SNSXE7iECwlTOUrqKm3vlIEFpmuZpn88H2nXXz9CIGrUyhX1iVrXKxhHZ2QSxvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=3Rimm+Oh;
	arc=none smtp.remote-ip=79.135.106.111
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34672606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34672606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=3Rimm+Oh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794161052; x=1794420252;
	bh=+BO7ggl62Lj+oozFUYv9tkz0XO5F9DqJdq0SI4BgX/c=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=3Rimm+OhVNZ4nKZbGzi96fchiXSVcX33zdEXWjKyBWgLUyAt6mHATgmLei4/An9h2
	 YQBoskvYZFCsthArQAf5SnMpaHaSm8IUlRy/FLwjVK9VXCMmSkULMrSRxQDv2rHOgU
	 79mOLS1fiSlVKmj9BQV7NC89TR4r2gUOIMCnhVgr1Aqfmtw7eKjHS31S+tXmJnhFae
	 5sOKSiAFK/qvS2Yez3fk5rLJV1tv78mILubgpfbXniqCZbKk0fq02qd9/EjShg1ENF
	 x9MaGxihw+jnqlZ3t/Sd62+zMw9UHJNoOaSKfSnYy6xvSJOpgeFtzqjVImSl/CM/wO
	 MAinw+L8lX/lA==
X-Pm-Submission-Id: 4jN1544Vyjz1DFF0
From: Michael McAllister <me@michaelmcallister.org>
To: Demeter Barna <me@fromdisposition.org>,
 Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, me@michaelmcallister.org
Date: Sun, 08 Nov 2026 18:03:42 +0000
Subject: [PATCH v2] ASoC: qcom: q6asm: Correct the 24-bit PCM format
Message-ID: <179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org>
In-Reply-To: <f3485a790ffdafe635b84b5d68730dad@fromdisposition.org>
References: <179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org>
 <f3485a790ffdafe635b84b5d68730dad@fromdisposition.org>
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

Recording in S24_LE on the Moto G10 produces badly scaled samples that
wrap at full scale. Playback has the same layout problem and comes out
barely audible. The PCM V2 DSP interface uses bits 31:8 of each 32-bit
word for 24-bit samples, but ALSA S24_LE expects bits 23:0.

Replace S24_LE with S32_LE for playback and capture and constrain it
to 24 significant bits. Keep the DSP configured for 24-bit samples.
This matches its native layout without converting samples in the kernel.

Translate S32_LE back to S24_LE in the APQ8096 and SC7180 backend
fixups so that routing and the physical audio ports keep their 24-bit
width. The other Q6ASM machine drivers already set the backend format.

Raw S24_LE requests are no longer supported. Applications using that
format need S32_LE or a converting PCM device such as plughw.

Tested on the Moto G10 with direct ALSA and PipeWire playback/capture
at 48 kHz, including reopening streams and testing after suspend.
Direct S32_LE playback now matches the S16_LE level, ALSA reports
24 significant bits, and S24_LE through plug conversion works.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Reported-by: Demeter Barna <me@fromdisposition.org>
Closes: https://lore.kernel.org/f3485a790ffdafe635b84b5d68730dad@fromdisposition.org/

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
Hi, thanks Demeter! I was able to reproduce this too, and I've included
a fix for playback in v2.

Changes in v2:
- Cover playback as well as capture.
- Remove the unused S24_LE case and update the backend comments.
- Add Fixes and Reported-by, and document the raw-format change.
- Rebase onto sound/for-next.

v1: https://lore.kernel.org/179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org/

 sound/soc/qcom/apq8096.c         |  8 ++++++++
 sound/soc/qcom/qdsp6/q6asm-dai.c | 15 ++++++++++-----
 sound/soc/qcom/sc7180.c          |  8 ++++++++
 3 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index cfd6438db..b7030f7ef 100644
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
 
+	/* Keep the backend at 24 bits despite the 32-bit PCM container. */
+	if (params_format(params) == SNDRV_PCM_FORMAT_S32_LE) {
+		snd_mask_none(fmt);
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+	}
+
 	return 0;
 }
 
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4261c3048..cd97ba2ff 100644
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
@@ -113,7 +113,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 				SNDRV_PCM_INFO_INTERLEAVED |
 				SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE |
-				SNDRV_PCM_FMTBIT_S24_LE),
+				SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
 	.rate_min =             8000,
 	.rate_max =             192000,
@@ -139,7 +139,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 				  SNDRV_PCM_RATE_176400 |		\
 				  SNDRV_PCM_RATE_192000),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
-					SNDRV_PCM_FMTBIT_S24_LE),	\
+					SNDRV_PCM_FMTBIT_S32_LE),	\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min =     8000,				\
@@ -151,7 +151,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 				  SNDRV_PCM_RATE_12000 |		\
 				  SNDRV_PCM_RATE_24000),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
-				    SNDRV_PCM_FMTBIT_S24_LE),		\
+				    SNDRV_PCM_FMTBIT_S32_LE),		\
 			.channels_min = 1,				\
 			.channels_max = 4,				\
 			.rate_min =     8000,				\
@@ -377,6 +377,11 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 
 	stream_id = cpu_dai->driver->id;
 
+	/* The DSP uses the high 24 bits of each 32-bit word. */
+	ret = snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
+	if (ret < 0)
+		return ret;
+
 	pdata = snd_soc_component_get_drvdata(component);
 	if (!pdata) {
 		dev_err(dev, "Drv data not found ..\n");
@@ -505,7 +510,7 @@ static int q6asm_dai_hw_params(struct snd_soc_component *component,
 	case SNDRV_PCM_FORMAT_S16_LE:
 		prtd->bits_per_sample = 16;
 		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
+	case SNDRV_PCM_FORMAT_S32_LE:
 		prtd->bits_per_sample = 24;
 		break;
 	}
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index bc5a18883..dd0f8eb99 100644
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
 
+	/* Keep the backend at 24 bits despite the 32-bit PCM container. */
+	if (params_format(params) == SNDRV_PCM_FORMAT_S32_LE) {
+		snd_mask_none(fmt);
+		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+	}
+
 	return 0;
 }
 

base-commit: c937f492dd40a8398d955cf0f4f9e11d7268bcb5
-- 
2.39.5


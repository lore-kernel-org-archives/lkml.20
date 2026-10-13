Received: from morty.yoxcu.de (morty.yoxcu.de [194.36.144.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B426552930;
	Tue, 13 Oct 2026 20:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.36.144.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924358; cv=none; b=eK94B6CVsw+gCM38wQyBnT1FdwM9MzjPj4Quf3bY6wXeS/E8knMlQQFW0GcI1bzxp3VB5PKhzSIVQWjI+DLYox3n+Hlj1G6p3ghj0w6BltP5zRCSYNR4jHaaxLj7X0sYca1jC3MYDXeI2IC2HIsUj0qUPO5j3+B4LJxid9vgdJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924358; c=relaxed/simple;
	bh=ADbQ3LYE7yRgR2UyeY8uguMRNwPs43ZJiNu103wWYeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z95NVZdeYQ/E9HIFckDgO//SmtBQAQUGbntkRRfm8ddDfyMDI8bTRAOjRRMCRHwVBiXi+glmCMdfGuWW3z2pd/K4P0+kt3O8NJoh9FSK/kLSGSqMGkXgrVywelAuohco63eOp7lo4KffaiLMjCjh2levtkC3TiaFwygDo0xHa1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de; spf=pass smtp.mailfrom=yoxcu.de; dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.b=iv/k+rXO; arc=none smtp.client-ip=194.36.144.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.b="iv/k+rXO"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B6451D811EC;
	Tue, 13 Oct 2026 22:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1791924353; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=6EfA02eGKBl6UwnoAG0Nozb6+TP2ebB7B9g5XbcXIFk=;
	b=iv/k+rXOX7g3DrqVEmGjR0hH4/dlsOCenJAmoJsReJy4OjF/T2dmZ+nrEHhrhhbe1Ya4FP
	wtxf37HOox4SiObHDzhQ70WbvseUpzC9CQdfVEt+uqTY4u046kSRTtXSNKx69CnbLUv1ro
	+IabD0b9CVT7QVs0T+p1j0zZG0UZaKR24Og4OH01yF2YM9kJxKxnYedIo+CeMYocRdWysH
	c+FNCtz6COtmHo9XIHATlfgwWqLv3OnMoX32slzT1oTEnwWjU6xhgHzPDhJR5cIqBtoKNM
	V8KipS1ZVSLaDxWd3Oq3qnezlfioFTZjXqzscWvzhH/toIcN9do373aP7HuNNg==
From: yoxcu <mick@yoxcu.de>
To: Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Auer <mick@yoxcu.de>
Subject: [PATCH] ASoC: qcom: sdm845: Disable the quaternary MI2S bit clock on shutdown
Date: Tue, 13 Oct 2026 22:45:49 +0200
Message-ID: <20261013204549.3115830-1-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Michael Auer <mick@yoxcu.de>

sdm845_snd_startup() enables the quaternary MI2S bit clock in the ADSP,
but sdm845_snd_shutdown() never disables it. After the first stream on
this port the clock stays on.

On the OnePlus 6 the speaker amplifier is on this port. After the first
playback the ADSP no longer power collapses: it slept under 9 s in 5
hours. With this change it sleeps again when audio is idle (about 40 s
of 45 s).

Refcount the clock like the other MI2S and TDM ports and disable it
when the last user is gone.

Fixes: 5caf64c633a3 ("ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga")
Assisted-by: LLM
Signed-off-by: Michael Auer <mick@yoxcu.de>
---
Tested on a OnePlus 6 with an sdm845-mainline 7.1-rc1 based kernel:
the bit clock is set at stream start and set to 0 when the stream is
closed, and the ADSP power collapses again. On sound/for-next it was
only build tested (W=1). Not tested on the other boards that use QUAT
MI2S (DB845c HDMI, Xiaomi beryllium and polaris).

 sound/soc/qcom/sdm845.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index f0fbec9c8df2..85951397cb2b 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -43,6 +43,7 @@ struct sdm845_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	uint32_t pri_mi2s_clk_count;
 	uint32_t sec_mi2s_clk_count;
+	uint32_t quat_mi2s_clk_count;
 	uint32_t quat_tdm_clk_count;
 };
 
@@ -372,9 +373,11 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		break;
 	case QUATERNARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
-		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
-			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		if (++(data->quat_mi2s_clk_count) == 1) {
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
+				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		}
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
@@ -483,8 +486,16 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 				0, SNDRV_PCM_STREAM_PLAYBACK);
 		}
 		break;
-	case SLIMBUS_0_RX...SLIMBUS_6_TX:
+
 	case QUATERNARY_MI2S_RX:
+		if (--(data->quat_mi2s_clk_count) == 0) {
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+		}
+		break;
+
+	case SLIMBUS_0_RX...SLIMBUS_6_TX:
 		break;
 
 	default:

base-commit: 631a161db2c5168dd836242571724baba3561a1f
-- 
2.43.0


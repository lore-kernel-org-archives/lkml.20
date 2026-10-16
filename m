Received: from mta1.migadu.com (out-33.mta1.migadu.com [95.215.58.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F6B434988
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135949; cv=none; b=DdYC41kQubCJqKAmQ4xhFc09TJzd0iBD8nyrjr9BPBnJNzb4knv8bqwyQ9aKtQGx59lxknOZZnQwJRCmSBzFgVc5cN4o9EXTWujSvohMTELXVFyqFgl94O8p3bFeb33usjnu5710anIpQiDhIVnO/N0sXkf2wCUz+cI2CCT/W70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135949; c=relaxed/simple;
	bh=uoepJvXISmIjqYPIf2Q03pMfONUOfhRuqa6ZzU3hlrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNgs6HlhXKfl1RL7affLP5z2be9xySc7e2ooeeqdVvZll6HipDxjXZbCRVAs0bWEtVe4hdAE6Vk3vgVEvk7EzPuF3RErgu+qCsOptTB3IFc9ZOyhG4q9+6dWguGQ8GbxBwf0ApJ0vYA2X429qF7BGoVWDu6jrKUHrGF15kCVhNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=jiiQBoL4; arc=none smtp.client-ip=95.215.58.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="jiiQBoL4"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uoepJvXISmIjqYPIf2Q03pMfONUOfhRuqa6ZzU3hlrQ=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792135945; v=1; x=1792740745;
 b=jiiQBoL4lhB9JZodnEGfoRHd9Ui7YZhq5H5JKEzG8Wxlzxdx4MJx0odMoluPfWxQRYAgEOBR
 e/8S6Q3U4VAgafA7PTohUjwspvTATZCHOsYqUl4kLCggUokulANo6d7i53Ik8GGi8yEbEoOf5FK
 LCipdbCL2QJwXtHDUkBWSALft38ahccc1WIFZ7QAlQT7RkMboGg6U02mogvYKpCCd1sj9aC1uM5
 T/kSOHR4t+tY/+TJECvHlncp0zBe8GJli1xwdcb8c+5MjXnIgtBIOYKXpx2NEvjlUFMmXt56TU3
 gfMhR1A47ra7Xl3iTTtjGBhPRJdyPmP+yrwREjO1zpWOg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e6a5e2a85d742452;
	Fri, 16 Oct 2026 07:32:25 +0000
X-Mizu-Trace-ID: e6a5e2a85d742452
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/5] ASoC: qcom: sm8250: add Senary MI2S RX support
Date: Fri, 16 Oct 2026 04:31:50 -0300
Message-ID: <20261016073157.611956-3-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016073157.611956-1-val@packett.cool>
References: <20261016073157.611956-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the SENARY_MI2S_RX DAI which is used on some devices to
send audio data to speaker amplifiers.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 76dc3a3f4a31..2d49b04cb1f6 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -112,6 +112,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case SENARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	case LPI_MI2S_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
-- 
2.55.0


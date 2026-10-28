Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182098;
	b=uYQaHLR+DgY4Cl84/rVugD4zc557kLl4BIB1QOumSsvA4VTT5zlcsceSSJtpYTKwoBA1
	 riPi9DKVSloQmkal07vyYLuAgWh+3B1wv7N/LrcW0+jzHeoySKEOuJ5Tk4lFaJxvKxrDG
	 /sqS7iPL3hRd+wIXVxaBIRL1qY8jRdndBasglxIBTRfyOqOgLhLC+KPMVc+Ft2Zyakf0C
	 fgZaWHqeLh37tdgLdvgY4B+Djd/lCyAYCWIT5xMFolyl2M5Sf/K8/7zKSP0Rmq0sZE+kd
	 NyFGtQ96lOLjNDoD6yd3BBnkKj5TryIvrOMwO269uyQLngZtccKCcvnp5ssj2RRDLYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yw7pE9Jfr5b4VeVQuAsVUZi1Dy0jJV/jL5g1YIwpO3Y=;
	b=jqw+nN8sqf5jH9sFMBMlcNnCeA2XSTOPTwthrbamXLnQp9V0akPK9rcxFXuygM7ZJuwv
	 HfgZzbOuvuHW7zyVWLujSsCZG0DQuX+lxxKIW3Hg8Z4otqh7DDFynUuPQ0PUqAYtOH+RA
	 CWdrEHi3WqI2UBHRnsyoXmkZUlwQtmoiG9sTuwwPm/Xgg1usDMK2hiAq9ARsQfgw7gmvS
	 qG+IxtKESOVAeqyLnooZ8aIcF7tLvUcsmo8/XMgJSfLpw8lvMoH0M0Upht8Nri7q0mt95
	 f+0X35+ikbQ2KJROgsST2Ks3sQ1OoIf+Wlfom3lPByEYM2DJ1HJMy6wwfDU2UhjAGig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fielding.dev;
	spf=pass smtp.mailfrom=fieldingdsp.com;
	dkim=pass header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fm5lcbI6;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01C8606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01C8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fielding.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fieldingdsp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fieldingdsp-com.20260707.gappssmtp.com header.i=@fieldingdsp-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fm5lcbI6
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso122791166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fieldingdsp-com.20260707.gappssmtp.com; s=20260707; t=1793182096; x=1793786896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yw7pE9Jfr5b4VeVQuAsVUZi1Dy0jJV/jL5g1YIwpO3Y=;
        b=fm5lcbI6HWmtkh9Xqi1j3jnaaS6voph8kCnlEwBe1SCnkbabeBPmMuJpSo1VegBOtw
         BhQ8Da6SN/mWaauLGWaxGNpLJLFplEsrWJjxMdrNhkYlQb6JWgKpDDf8DdTeEjy2bywq
         HHoqdJIwr7vWjLSjeAKLCMfolPdmnDmZQyvCrKWJ/Qg/pOdbcf3/qODTdfDy4+Y0Rdd7
         xCNTRvfZvjSIhUYx92qhPIaZ2uBX78rYlGPKxuDZGJWn7nM2HSzx8SUVQPzY9Yptcz2h
         qzYmmR0+WR11CtD3JKwY1NnBZqi8TJdacgNZqh8yeEhz+6uMHlZGMkEuX3WYCq6ItJmF
         OUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182096; x=1793786896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yw7pE9Jfr5b4VeVQuAsVUZi1Dy0jJV/jL5g1YIwpO3Y=;
        b=Yt6pgAPa+gC1A+4D/GKk7eZfHjvGNh8AaAAfnx6bK4MGpDKVC1sznBOaBhJ5bZbSHO
         zZ4wdFTmOIlSs+ZdNOsKqI8wio7ySWsbdd1Zc8oUjrJsF3fX6+XJMfXV2PaKWiThW2FT
         J3pP9s90hhigOqmhA13Ur+Lkz5Jm523Kiz8Qp+Td8Vy0eTRXnkFzfvJqoUwmk0MTlq3z
         ET+ry1wZF/0Gji/9NOhGPC03rfuqW/aBs/eQhJOi3PZTYdzp35Y4oTPTbrbxaiuc2VFr
         SKl3W2AcFY1VmhpeJR5gTJZTdo/A+i/t9fEsQgjCviOVE91cg3gQxphf/uWn5eQAZiUH
         j0fw==
X-Forwarded-Encrypted: i=1; AKwUvBzgG80YvABhgiiLjArkn9MJ7T6Nvo+0x1WOUblbVyNo6zsPC6vogsC64jOesDA8gnOhVRGzQJLgwntzsII=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/+rglQtgvGMknWLa43jscCy+tmRrqOWdM1BrYYKOh30ZIohVJ
	hAHu87BO4u1atbkCnnHcytUw9m3lGdqWa+PbvJ6DIRPMbrp7oKTTPzrLZynGXdPRCaE=
X-Gm-Gg: AYBFou2UwMOwfdLSho63+iwP7kaQYo3OLPozm9shjFTYk4nSKJa+BlBjcymYi58Mddt
	yGN8sVM8HorNpPmPEN16Ti52WGRlaV09+xoenIgA3i3bBSuXidb5M6ikMMQw5d3i5cXWfZbk9HB
	HlDLrEicNJMShr05bK0SFNjCsjSE4WLrDDhkpQ3yYSAD15uXFldOF0b4PNtI682mzM7RHpOuJ00
	FyfUjMkMkLPMeHLLBHcGZ5CgxAT4Bwy+u4N/BX4ibbCq3gwOE0IBPNWMR0nSF0QoxM6vP+z0YLX
	mp49RnpohBcwE+dqWdr7OltDtpaKjxlTZba9eJ9UDTd9og2OVM4MHBw2xw7ClvsNMhGNHE0vrR8
	InZOt0+Wr7YaVQCskmrCJMTXQZCisHyWXq87hdT3xEwM059VwVeD7urD+QDRIrN/SBhPd2uw2b4
	kQrsdm/rOHzW1zkJSHlLIs6ylqx8rr+L1LAaJhmAVRM2vz4t/ZHYWTkdwCTV/T/DFZn7vjCY5bp
	EsbEnYauH7NuyfoWMpppgGffT5blzaB4sjyjs1LaeLFs3FCS+NtBgj0rtscMZKOZO2RX7tplvhN
	gxa37akVRHIqtusvpaob38K8n8pSEY9wmB3lhTuG5LCEic3hVROmtrtdzNIgP0PX7vzA7yQ/g72
	Vom/pGpzZHN5Xb2TGD4yeH8s7pYZZXPKGUPjNa9rCSrOPaKJf
X-Received: by 2002:a17:907:3f11:b0:c3f:c878:7c1d with SMTP id a640c23a62f3a-c49bdf2b6ddmr158720666b.9.1793182095755;
        Wed, 28 Oct 2026 03:08:15 -0700 (PDT)
Received: from kneiselgnabe.duckdns.org (p5b03fe53.dip0.t-ipconnect.de. [91.3.254.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7975b2sm588434366b.73.2026.10.28.03.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:08:15 -0700 (PDT)
From: Fabian Renn-Giles <fabian@fielding.dev>
To: srini@kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	neil.armstrong@linaro.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabian Renn-Giles <fabian@fielding.dev>
Subject: [PATCH] ASoC: qcom: qdsp6: clear stale channel_map entries
Date: Wed, 28 Oct 2026 11:07:08 +0100
Message-ID: <20261028100708.6808-1-fabian@fielding.dev>
X-Mailer: git-send-email 2.55.0
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

Since commit c663014e452d ("ASoC: qcom: audioreach: compute active
channel maps from channel_map"), the codec DMA active_channels_mask is
built from the non-zero entries of the channel_map instead of from
num_channels.

audioreach_set_default_channel_mapping() only writes the first
num_channels entries, and q6dma_set_channel_map() only the first
tx_num/rx_num entries. The per-DAI module_config in q6apm-lpass-dais is
persistent, so entries written by an earlier, wider configuration
survive a later narrower one. E.g. after a 4 channel setup, a 2 channel
capture on VA_CODEC_DMA_TX_0 keeps the map 01 02 04 05 and sends
active_channels_mask = 0xf with num_channels = 2. The DSP rejects the
graph start:

  qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
  q6apm-lpass-dais ...: Failed to start APM port 110
  MultiMedia4 Capture: ASoC error (-22): at dpcm_be_dai_trigger()

which breaks the built-in DMIC capture on the Lenovo Yoga Slim 7x
(X1E80100).

Clear the whole channel_map before filling it in both places.

Note: this is my very first contribution to the linux kernel so I
may be new to some of the processes. I apologize in advance.

Fixes: c663014e452d ("ASoC: qcom: audioreach: compute active channel maps from channel_map")
Signed-off-by: Fabian Renn-Giles <fabian@fielding.dev>
Assisted-by: Claude:claude-sonnet-5-5
---
Tested on a Lenovo Yoga Slim 7x (X1E80100): built-in DMIC capture on
VA_CODEC_DMA_TX_0 (MultiMedia4 Capture) failed with the DSP error above;
with this patch repeated arecord runs work. Based on broonie/sound.git
for-next (d34a818a331f).

 sound/soc/qcom/qdsp6/audioreach.c       | 6 ++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index d2dc5d37bccf..4ac65d9b5543 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -308,6 +308,12 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
 
 void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
 {
+	/*
+	 * The active channel mask is derived from the non-zero entries, so
+	 * stale entries from a previous, wider configuration must not survive.
+	 */
+	memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
+
 	if (num_channels == 1) {
 		ch_map[0] =  PCM_CHANNEL_FL;
 	} else if (num_channels == 2) {
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 83f2711bceea..12f139af8ca0 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -99,6 +99,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				tx_num);
 			return -EINVAL;
 		}
+		memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
 		for (i = 0; i < tx_num; i++)
 			cfg->channel_map[i] = tx_ch_mask[i];
 
@@ -123,6 +124,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				rx_num);
 			return -EINVAL;
 		}
+		memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
 		for (i = 0; i < rx_num; i++)
 			cfg->channel_map[i] = rx_ch_mask[i];
 

base-commit: d34a818a331f7e270fa9dc3db3d96f6a0d4fa7ab
-- 
2.55.0


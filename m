Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F63A1A0BF1
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792361455; cv=none; b=WS37Hw9/rLapfcRiVtw9jpaB+rDvffBC2a2zFq5SUL5b7SR02XASWYZ1H44YBxIfCsjXPB62OlVR53G7Zr8USVgrVZPFLMY7Y0gaFyeEVFYQeKXt+khi8rbGbhlgaVAmYN0Qy8p30tNEoyjCodBQTd1AeXcYqcd6E7anVtQuuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792361455; c=relaxed/simple;
	bh=bc3ypj6NPkdr3YDpTha1rqolAwQtDj2mmFjEDfaCjXU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L+3oVWJ2anF6Jp2U9zpEkVokRZDJMR/+e5rsYGr3em0PoBPm9gK1yXcb00NmOB2wFjj/6tg2WM6IL3hFRQG1C0JE72Zi30LIFG+jW+9x88DByjKkRNac5yQJ2/VuJ97APvA0BBtFXvFVNYG1PqzmchIkOu6KCUfW0O/UBysxi+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Qs8+S75r; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Qs8+S75r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792361446; x=1792620646;
	bh=zr/0kwnMQPJza4kMI+4PgYVBG2o2yG+P+fXE/Cl5i8M=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Qs8+S75rqiiqhyM9gQBp8xHcQzqYA/HGgNYpihrZzPYPIoN0kmMuFPGFOj6WMRf6R
	 KxKco9+MX/vg9t3d1Hk639IYFul6S8DX5c6TX99eK2IWh9RbuPhQbWX2FzaQOH4Ptx
	 WgHOtrNEzX8fYqx+PZuUmAf4ue7n4VT+vCyHP/1T73GRb7FZub3npPW8BqymI/KiMW
	 hG/I0x2WUZrJRVD5z2knoAq9GTI6K51Ui2+bRpIklqAgBNrSL9QGpT7qt/Y3GpX1ep
	 HvMI1qGez1BomOYWkpxuuw639eDkSnR+5/qrBX8rub72Z049mqcj6n7YfIaKCSavUu
	 vs98Wl7TpBR8g==
Date: Sun, 18 Oct 2026 22:10:41 +0000
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm-lpass-dais: Reset the codec DMA channel map in hw_params
Message-ID: <20261018220857.16819-1-birk.skyum@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 7380a9d5bd8463919b93461000f582c0001d4f7f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Since commit c663014e452d ("ASoC: qcom: audioreach: compute active
channel maps from channel_map"), the codec DMA active channel mask is
built from the port's channel map instead of its channel count.
q6dma_hw_params() fills that map with
audioreach_set_default_channel_mapping(), but the map lives in the
DAI's module config for as long as the device exists and is never
cleared, and the default mapping only covers one, two and four
channels. Entries left from an earlier stream, or entries the default
mapping does not fill, give a mask that does not match the channel
count, and the DSP refuses to start the port. On the Lenovo Yoga Slim
7x every capture from the digital microphones fails with

  q6apm-lpass-dais ...: Failed to start APM port 110

Clear the map before filling it, and map any channel the default
mapping leaves out. With this, capture through PipeWire and direct
captures with two, four and two channels in a row work again.

Fixes: c663014e452d ("ASoC: qcom: audioreach: compute active channel maps f=
rom channel_map")
Signed-off-by: Birk Skyum <birk.skyum@pm.me>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6=
/q6apm-lpass-dais.c
index e204fd5..403fe83 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -173,11 +173,16 @@ static int q6dma_hw_params(struct snd_pcm_substream *=
substream,
 =09struct q6apm_lpass_dai_data *dai_data =3D dev_get_drvdata(dai->dev);
 =09struct audioreach_module_config *cfg =3D &dai_data->module_config[dai->=
id];
 =09int channels =3D hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNEL=
S)->max;
+=09int i;
=20
 =09cfg->bit_width =3D params_width(params);
 =09cfg->sample_rate =3D params_rate(params);
 =09cfg->num_channels =3D channels;
+=09memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
 =09audioreach_set_default_channel_mapping(cfg->channel_map, channels);
+=09for (i =3D 0; i < channels && i < AR_PCM_MAX_NUM_CHANNEL; i++)
+=09=09if (!cfg->channel_map[i])
+=09=09=09cfg->channel_map[i] =3D i + 1;
=20
 =09return 0;
 }
--=20
2.53.0


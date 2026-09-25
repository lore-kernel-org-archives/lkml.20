Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D929A3C944A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311859; cv=none; b=LyCxwbWHzTVPueL5qrdp+0KuEz/Ge0KU3LFfR9CLEzWOXyEcI8ynCA4lmFyAXl/aHnpsWNFku7DxS9Cq6B9eR5qdpBwdBBKlg8NOarIWse9WmaSt1FRKg5NbEvR++WLy7bCcUVaTW4UJJUdIIeXyJkUVeNHqhyEt6UadqWzZKhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311859; c=relaxed/simple;
	bh=d1blBm1Hzmm7Po+juQSeLUZW1RgbslTJX1nk3YK/wzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BeeocCD+K2I/boQgDicWsbpBOCQVC/jWmIWf40WCjtUqB+fkwq+sk3lHmCJ+1dDogaevXtwVWVPX77PDua0DXcs6UWl7NgHS5b6JRIV7GZnOwOzSj7vO9C2elymh8hHAT81s3aMKUlCkrd+MhYBlKL6vb3fbMCaBSCfIqpFEkxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/9/9vj+; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/9/9vj+"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0abca97c0so302947a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311852; x=1790916652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=n/9/9vj+ZzXN6wazkBzaj8qmD8oholi2GnmzxGjiNcW0UMIjR9VnX27T4WMWFDq/4E
         Itst6lRjpcFJ5K7FFKbTrBCwC72O3/6XjLE5TfuYS8a4cnFvaRc3weE4ACoslSD5f7Cc
         hZGsIotg4EYaddaShH0d6aY+tHabPmEoLHsCpT3zKQRP33hVDHN+Bfk6SiDaAy1XFdeX
         ldYJyiV/qAHIgpPFjxDrlGs2C6t9n0QcdM94eLSFsCvyMnlKuIjOY0IxJ1n+VsQHZt3w
         pThEYzSvVj4G1PDqY94UFNsXwEdd8cL1VbE2zHSTtpHb35PcpDotBPBUwhLEQniVbkGN
         WFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311852; x=1790916652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=yAbDPTEfAG7XoJurZ73TEXfpkfYC2zGLxdxY9IVeBxSVDQbj+8I0UMmu2yknBv2N2J
         YiicfuC5HiAZlWM0i98LGFQrCWPtAh5MF//xJCi5OXSbEDxlHMaLpZ3pgTnsXvPuYoSq
         RzI5VzjdbEMC/2Mv959HfC9uQs4EyQuZhtoRiQjGiVMnIKeLsLxFgobbAr2VxZDIEcnq
         9pGatbzYYyPlYA3NyzDVkpdiqNkeWPSVW6ebMtJjOs6QyrZsZHMJ2xdYcs6s/yPW943P
         b7kjhpS0Xx+OeRiaCjQdWOODy07uHOnGjdB+d19zDjfpS9qaaqDvi582s4VQQX8CSRAY
         oI8A==
X-Forwarded-Encrypted: i=1; AKwUvBzy1XOCD8EHjBgHj0mpPkGD7OjuGYg4jHdR1Hev1GwHVc6mZAtVg6i100xF1v1cHt1f8PCrvZObSw/FvQY=@vger.kernel.org
X-Gm-Message-State: AFuF++l+On5CqvRt7EsKOyEsp1MgXUJw5KtJ4OgO4HruwyBvFdGB2EyG
	kGeEK1JTXM9+RM9YZ7ZXw9gw4lAFqUxbRJgBhbSI0qy6gciRZOEgecwx
X-Gm-Gg: AYBFou3OYYLCzIS2v6o0XGnWfRqkMfQfaj2iFAYv55zTAQ25jS8Li2oyJPu/K0UXRFr
	yfThIKpsSb8gmQDPnMm+zarR6FL0v3Khzyxj0GykSp8emoQJ8KoLAnuqhXYoE1UxmYS79ZQLR8x
	oiNTBe/gxFKTM1FjX7IGzBnA2jFXBXooRwbRSfUUTBROEa/teklC7jr8f0etyhbzYg+pyxH0A/f
	L14SUcCREQA/PMr5GQoIAUHwdABKJRg95c1El6LrjkAqwv9MSs0SfP2RliIvuBPPHHciFA6L+fH
	t8V7+umDa8xh63YtQvshbNJhy+ABrlAXjw89uE7ACaBCrBTENoWUAisOtpjyYvbVun6yOAx8s/w
	XFFJZjDo0gga5dpmDQTOtwOQgIZpZnhxc5oaSj9vTX1pD/548Yia5qfcbMSvf4BIiSVWfqngDTj
	MEHKDz6vlfXMwbur4qlRyVvg8enB9CYb5WzjRH5TocaC4VBWWSItBEmwt9C2YP8qbhdJskIKjFh
	3nBXXPS1W/Y6Xm+Sg7BpilOsSMSIaMPuGEGaKeH314U2jpg6djqn2dWbzh7rhLhIXBJ3QNNeAL8
	3/9FEC9jARLXV7jIm1WU+qND
X-Received: by 2002:a17:90b:17c6:b0:3a0:516d:9f88 with SMTP id 98e67ed59e1d1-3a098761df2mr3859051a91.26.1790311852041;
        Thu, 24 Sep 2026 21:50:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 13/14] ASoC: mediatek: mt8195: Fix ETDM probe error handling
Date: Fri, 25 Sep 2026 11:49:07 +0700
Message-ID: <20260925044908.450775-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use pm_runtime_resume_and_get() to properly handle runtime PM errors
during ETDM probe.

Propagate errors from MCLK configuration and enabling instead of
ignoring them.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 27 ++++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 11317cdd14ab..8fa830a57502 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2503,6 +2503,7 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
+	int ret;
 
 	dev_dbg(dai->dev, "%s id %d\n", __func__, dai->id);
 
@@ -2510,15 +2511,23 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai->id];
-	if (etdm_data->mclk_freq) {
-		dev_dbg(afe->dev, "MCLK always on, rate %d\n",
-			etdm_data->mclk_freq);
-		pm_runtime_get_sync(afe->dev);
-		mtk_dai_etdm_mclk_configure(afe, dai->id);
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
-		pm_runtime_put_sync(afe->dev);
-	}
-	return 0;
+	if (!etdm_data->mclk_freq)
+		return 0;
+
+	dev_dbg(afe->dev, "MCLK always on, rate %d\n",
+		etdm_data->mclk_freq);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return ret;
+	ret = mtk_dai_etdm_mclk_configure(afe, dai->id);
+	if (ret)
+		goto err_put_pm;
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+
+err_put_pm:
+	pm_runtime_put_sync(afe->dev);
+
+	return ret;
 }
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
-- 
2.43.0


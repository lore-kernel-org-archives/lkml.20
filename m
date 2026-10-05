Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE7346D560
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198259; cv=none; b=SocC8aoU0xpyJw/wU4kno4REU7mITVAicJxeEgUuAXj1YF0oieeI6kWupJVEZ6J+zwVZ51hjemeOCd88Oh9eHISq8mgkpRH2JckSX7paK4LsM0h4abIwI0G51iM3R3hoaNdtmmmPiRW4Y964vp8iX6JCG5knOUeYqaeA9XUvpWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198259; c=relaxed/simple;
	bh=d1blBm1Hzmm7Po+juQSeLUZW1RgbslTJX1nk3YK/wzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mV6kZASCnQd/GX/3qJYOjc0/NyrbWc99YdKO3CjyD1GMU1RfnfMDfksqfdAYPao8iwMwE7s7llK0hoiDsgwxJ+01EPUVSd6uRArbeim+uE39n7VRs62n3Y3oEQw+6PJEy4PGJpoHqHUpB3WIQ3UINMUFtGIdl/XMaHMbOIzUcrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3/eu36n; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3/eu36n"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so446590a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198257; x=1791803057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=D3/eu36n2qxeetlv37K22q0BCSvBLFpEnQXIIR/5VBTPe5SnoUjxOp5VIOiJbS7yVm
         2MzG+Bv045nrauHHpk1RyY08m2rS40MZ291uMX7AfcEoBYTmLd+2v29aWMNa6BHU0fsl
         PAYgFe5Um2pqPFeWLN4eBxHkWou03MLCDyiZdNgMkfdWZD2Tz5VzEHIm/06cB20opboC
         BW5NvbL+3dZtdKGNZ0JGl5yZ1WN80+7Bt3KlXnN5DqN8AQF2YIfcOavKd7cC3BBqQbgG
         cc6CPZqLM6Qi3IQVrPOin86MTh2t0raohekroSAiKAaBPpmu+F4CrNCOuY0/IUUkrhtt
         Pj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198257; x=1791803057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=CdZdEVKwn0H2mxTLfS6ifW25ps9N8thOL4E+juUh3xBJ+DfMlr1aoj/44FIrpO/1ms
         Xo+CvDUAv0GSocaFaMkySTpcx13J4oM3eKXjqq0pSZ/YANx3eJmOhAiep0y/+DVimFTr
         vcETOYIejvldo3ehM+7x6BP7WP9lW/ZS2DXxpq1RiZWSKqJW5SKicif2aU4nWD2kmBop
         tSgqiBGOl/OxUl9P6R2BP6AZT72MmhbPXmSiWvfzNEwkajfmzVA2mMLkjcSwNpz4bs9/
         hAl3iOQj1U/qOGeu3hKhFiAjcXsBWBYRPa4E9lOZ1MDMS/UaorCl71Ez9ocKi5WEj3ug
         qvWw==
X-Forwarded-Encrypted: i=1; AKwUvBy8Tr2IWFC47mzEVgdcwxjzn49m6eFVChNYOZQtCnmWuCkBiwDnRRzYUtnpHc51mybSF47Rb0ajhePy0gU=@vger.kernel.org
X-Gm-Message-State: AFuF++nkIydhIWfQGBw+o5Uch/0LueoMDpelX3dANdDUAdMQpqWk7LeX
	xm7qfoWryWdUhY93Svqc9UF3Um0SQqoiuKjhWFwqKezn64Od2hG5pa33
X-Gm-Gg: AYBFou17glxeOJxAxY0QaR5gkUlyyKW6Cy79N8g/ycg3kL96fiWy3nU8BNpSnMFB95h
	WkKa0jK9/sHb6r8d59YcmA8EK/MTW0Ts+6XRkOtqIFOMgmjy7IG7PZGReZwSw9zWvkINA5cQFJB
	IRJ8bmi3RaIQP9DhkS3o9cINYdBXGFlxD7Iu5i4+ishK96a+TQFQrY39AQRvqKEpqRAYVApSIWy
	CtgZiJA5KZOS3aHxm2raENXWfKe575RjEAYHYQoLO2exXe5uL6bEOKAv1JUYxh5/8qXQFecUVJP
	7tRszmxeE8+BOHoyu9Eho62RQfjotQziY0PCD967cg7Ic5anonzhuziLDqtRcx8Y3iheReIKJgM
	JMuSPtaGUAFwu8gc4SgmKuczzhiFNApUTx5bNz3oCOsb0HkCyQYkcDoj96NqBwllEOqEo1FaQ2M
	cu8rcLR8YAz5Q5PE3HgZtGPkStS3j8OBEP99am5O/iBgNZco6pMbP+Wigazm4AmO7P4kAuZvyfB
	P9hI3ZtbxW78zJV3DizBF+k7R3u5kkzBU0Zpjuaq1W4z1oWL1UXvXKAAxO0g3Bax0kvEf/AZLV9
	HfJn6zl1S3qXhw==
X-Received: by 2002:a05:6a21:6f16:b0:3dd:a195:fa1c with SMTP id adf61e73a8af0-3e0d6d2f55cmr6485653637.65.1791198257419;
        Mon, 05 Oct 2026 04:04:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:17 -0700 (PDT)
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
Subject: [PATCH v2 13/14] ASoC: mediatek: mt8195: Fix ETDM probe error handling
Date: Mon,  5 Oct 2026 18:02:56 +0700
Message-ID: <20261005110257.50145-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
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


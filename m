Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0448947D456
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198207; cv=none; b=ky9JKvbobjBTSLMl73/snJcCmb3pTPdnnkQaKcdGPVg3V1fL4Azj7e4sy5Mq+isqsbyB4CjW8OSE4D92/MYnWQBcFJgtyKT+LI6hzBsac/y8+wyAnv7WtFco4AC0i39L40g11XPi9IOOGfiSg789TU5J6uK1bkMOCakZAV0755I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198207; c=relaxed/simple;
	bh=3XxECfTsUmdCi+zRvqz0zN2fUbeWSo65SVUzmGYUP40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rWY4PBGu/OBoGnPQ9lQV9yP96zQ4HcHWIpU0tRwZc7jOfTMunmBRgpKGSG0Q8ONLkdVzgYpMw5FtQlO4T7WIp1YyZz0FsznTwF5+WV2I9aUIiv9uk7uaMgQJLmd4jVuDBKAVXzuNk6ugJkKwzAXe2V7KCYSCCEQbXPBHS8BmjXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSmQiYkM; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSmQiYkM"
Received: by mail-pz2-f36.google.com with SMTP id d2e1a72fcca58-88a9f57bd42so636338b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198204; x=1791803004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=eSmQiYkMo+knCC8IlNEdFYYV9VqQq7n3NOQJ8yD3dKBg2liTEmzwb+UrrxmED45Gih
         mYrYdcINbpGSsgAuWWVrAZO0n8P6mDLFNrTYPe+XeGuvCXNdFQXJ/VTKahrPb+iVNREI
         S+4G7V8L9r3Mw2g2xJpsKQlEyhWMVdJ0OV+pWtlIyh9QHkeH2fHbIOQ2OXLvxagpbidX
         ZRqUuly4wHh3jZ+J1ojSChuWo2a02o6SdNMQKqHSnLwfslkl8vD29pPXvy3Xxi+/nZ3G
         eoPyiAMAOdaQgW1uSMsmEsble2a0DVzoDBpcjbElFt11efR98adajh1M6XTEcNfHISY6
         HqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198204; x=1791803004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=U1+XSHLZJWBP8BZ+FzZVuu5EHiuv1qvYW72q/qaSYPQkBrayRBjtfdnxhOSzH/wacs
         4Mjwn+6x5bt+YIQ4ILHD22e4VsBXGVkaajmxicpOzwwBo9pg5TBxycoBVvij7Pk1V0bM
         ZbFavesveUqqEBpVICF9zAROrMi/3dKPsxBPLG73ViEhd14VfbqcKSAlOskZiABOnzer
         aX//gCr20q9+dhWdVo0zqIskIuyMVenA+uGa6F/sBypu53bNYDbBY3E6/xV7SN9m0sbl
         6vf5KeE0NaROa/v5z5oVGhyrdrjNCGbR+3gJbYopngAdV5Whz7Bq4N4B95dIQ+I2QQwp
         Zzvg==
X-Forwarded-Encrypted: i=1; AKwUvBzldoQ4u1sqP+teGMPqBt+gVetqo/dWEcQG22vgOJbmjggp68n1ODK4r8Q6EGoGlAXdTJDAFVEPNT5LCas=@vger.kernel.org
X-Gm-Message-State: AFuF++no4RhZh+2guHJvhTwrAF8/Lcujop5UtHXsa2Lapwy09iaWF5bm
	7Lxuac8Jw/hD8N/+dZ6W4g0fhEYwShVpYuBtC0sXk9GYH8fJavpG878+
X-Gm-Gg: AYBFou16Mfa0v8H9aocO2W0XxkLQ1GO4+M26q/prlNG8l+N46azx4/f23+KY2aoc3z8
	c5U1NnhpdS71gu/eAvvfUsH10bcIpzFLIVkym05A0tydZRw9fiSAw+7CsI3ulCPmftj8RPrP754
	zCbujgTe+y6oKub+xzKfCrd+DXyaYAk9hmJvRATwODEGCfmH2wuLPODUxvywKo1GVlGtJUXYBtU
	ufIUmXycK+Z23pXwW0ahcr1C+DJs3AnFU5J4ULKOO4/VvBXLCEFJhVSiGJ7zibAbdSXbf97M8Xk
	cpT8ePD6WcwYc7ZePkuAW+I5tQ2m30XQYUlyguLPquSFtoc7gH+z8HWHRS0rciaMONIiCwXkgK8
	Is6mQevSHCBx+a0JC+M0gxB48VycDn+9/TOFZslwyhoyK0h8Y4WBc7uZ5scWLIDRH1BpxPLZ0yn
	Npb+6UCb6GwSL7PkOk8isMnU/uGp3PHU9v9gxBT/H13mQi1Yar1cm4jRM9Gz5Chl1roWt1B8dxp
	LJFo/lq1F6tIoMg116YvN66O75dJVqFwkNxlBhwmhTMZCcTkjDlIOWfpSPEDVohxUJQ7+owPUUe
	knSP58I3hQu9mQ==
X-Received: by 2002:a05:6a20:9c95:b0:3e0:da23:8746 with SMTP id adf61e73a8af0-3e0da2392f7mr6761110637.18.1791198204336;
        Mon, 05 Oct 2026 04:03:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:23 -0700 (PDT)
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
Subject: [PATCH v2 02/14] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Mon,  5 Oct 2026 18:02:45 +0700
Message-ID: <20261005110257.50145-3-phucduc.bui@gmail.com>
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index ec1ea5b988ff..12d8159338be 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8195_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
-- 
2.43.0


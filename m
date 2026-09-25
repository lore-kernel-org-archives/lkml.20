Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB7C3CAA50
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311853; cv=none; b=T9zmjdYSlO26r+DJeqLWGlm1uW8SKD6W9Nr+qIpcGo+oHgrkAaAcAbf+D62vILLiCeEd3rbIJMYfEY316EEfLRSHTjQ3oMwj9Y3dVGDt0gXI9RkRlcEJfcSIzyafRmwNJwybpu/nXr6wZJ1Q88afe4lrV0vvfgAK32jE58HFymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311853; c=relaxed/simple;
	bh=MMm6LoBTkeAomP+0/fA2vfNONTNnzG8MpauClEVrS+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUu9Vqbswq2chDhm8hJiFziPp9loNCQFBCgjwoLz+Mx/Uh2jmOk4WSllnVidM7vON6ewRyZ97J2bssG7GDmhj1ZJ8HXkyUT3raR2bFAmqDIU1tDrKDQ4qacNMr2bdRFu1/PbK3nbyheQkvu18eZyAwgV2XUlhMJmYZD4GolIGJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnHexfpC; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnHexfpC"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a147688bso384016a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311848; x=1790916648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=hnHexfpCQsOKHDUAlHnQ0U/+1FFmb7rgo2erz6co7i8Nq6Zq5pLE+1l7JNb594jyTt
         +2vyvWKGFOndBQMHCfBeaboMHG+cpgDu/uI753Fc/IdykjskGQEa7fo704aaEcHYaL2A
         wUH07I+uJzP/GKzjM2wIALh9y/8d2FB4spxPB/9LtWvSZYoesPYOXA2z+evKsctzVWNS
         BaeOMqcF9IIXDZcloxCJW0XeIYmdhvub221zZrDlrcizMq6WM05ZfSP95TfyFXcrNel5
         aHdTZJjbRLkUl+8OgDovuBOU8TtJq4aNzmpeoXZkgrnMoZD+R6qfONl1JtODRnuapUZD
         frMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311848; x=1790916648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMNn1l9smvshEEs2IzaD7z/sVzU8/2Okzf/aYOfP2ok=;
        b=wI4x7dnSEA/kWVoR6PAf46PGBAYsOOwIS1Ax9Pn2jp/95ULbRvZLLivr05nekvO7JX
         wnb5YB5tUKa7279kjP4UwmYKBKF9V3o2HK8YcOUEGYEtULZfGhnkU4szp5zB8KPJ/pvN
         JcsvUa0ZunqfAjIiDsDT1V+5eO8qu1hyBgBj+qVA/7rCq2TbyW5aA2RzqLQvFybMz6JN
         g9RLehspwwW1kcFA0+D6DdwEMWXbtfefhPpIroht4lydCGKrqSFnie4zVNTQz91GLD/3
         G9re8uHhIjhGkYaOL89ddSQowrPEM0iluWV3cCU80eJTZoMJEAkd4U9Rp/Ry0TQBsqIS
         BS/w==
X-Forwarded-Encrypted: i=1; AKwUvBxh6sumEueldqUgoFTax5f/zF+5URHJ7vB1Fw+7EzoxWIJathgKl72suhSr81Zg6O4MWawaDywZuSpie0A=@vger.kernel.org
X-Gm-Message-State: AFuF++ksnHNHqf2U+eHk9kpZkFJaXzqodvMb9G9YH21CwYaunYg70tl5
	gqAX6z3+JXDKTGKV4ytfTEoTUe2sV8LknyFb3DV15aavEEzdk6FPPKYi
X-Gm-Gg: AYBFou0INj97P7feYZx3Z2EEkiC1GAHpGWek7EzuRfXwRlnu0J2ZNSvCGGutJSUWx+2
	WHwd+Ko2qiM1DbqvsFhYwL/Cemw0lLBa5CDmAlRljOh8sZy/Cq2MJiDSo4qeOIsJuWURMpTInA7
	wKh4ji4+DM+fRmJp4gnuI6YlZIkbicc+VWO+ybGJ0JSLsM1UzgjlLr6jTN119cyGCmLehlX5sxN
	f9adklE7dwudJxafYDr3FnoBEi1Sz7LwKExspM93idcbAY5+GIlkqih2B44bB0MQtknA/KIe1r+
	kLIYXy/1CX5IAZNAPEdKlv2FGvSzclKfqunvJmdp2U6OdBSf9p0l0GrQ+h4GeH10Nr+6/a2vqF2
	auRO7VMpKfx1hy5Lepw9fZp5yth7BFWj6S1xy6x3dhn/zi4Y1v16TB3+eVVITpnvwPBHQTBGgXj
	4bwzqOKdxKeDhuqQWTxj1FpE1bIqQw8DtwWItT0YZVG9NdRdG8/a4KiyXEYSBuYGzOetHtjrWW1
	Uyqjc/1XzJqlaquIaFM1yJunzaWZz7KJTYEG/xcS6HtDsNTZO8p4sTufPMyIvl2vDUm4Pem0Ygv
	sDbULuYCpDy5/A==
X-Received: by 2002:a17:90b:3dc6:b0:39e:24ab:9fb0 with SMTP id 98e67ed59e1d1-3a098d43b17mr4135466a91.6.1790311847757;
        Thu, 24 Sep 2026 21:50:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:47 -0700 (PDT)
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
Subject: [PATCH 12/14] ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
Date: Fri, 25 Sep 2026 11:49:06 +0700
Message-ID: <20260925044908.450775-13-phucduc.bui@gmail.com>
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

Check and propagate errors when enabling the clock gate and MCLK
during HDMI TX/DP TX startup.

If MCLK enabling fails, disable the clock gate that was already
enabled before returning the error.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1270fcac6b3f..11317cdd14ab 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2321,13 +2321,25 @@ static int mtk_dai_hdmitx_dptx_startup(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+	int ret;
 
-	if (cg_id >= 0)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+	if (cg_id >= 0) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (ret)
+			return ret;
+	}
 
-	mtk_dai_etdm_enable_mclk(afe, dai->id);
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+	if (ret)
+		goto err_disable_cg_clk;
 
 	return 0;
+
+err_disable_cg_clk:
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+	return ret;
 }
 
 static void mtk_dai_hdmitx_dptx_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0


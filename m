Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F8751598B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738843; cv=none; b=IkKBF5G+McmBjqAdfieNAgYimkVggoGw2qHQTDetzTz23JUiI0psmhr3lAoi1FNUvIOHy3zSqGjzsCjy8t4YIKRktqKI4GYOvjfQ3GfYiC7kQqEEAZSQCYmZTFe/vWxW/30/jjkBTgCTZhz/QPPbVwiZ5mfZQJ3/LrSRTYRISs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738843; c=relaxed/simple;
	bh=GObvMR34S+suMBhhF9UYVJy/XM+sIoJ+XQeVtyhccSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR83zLTz0femLgj5EtrhgBJY+FGpSWGfcpLaX67hj6zjtwgDcRTMgpl8D0MNSbIT58ZWq7NOvv2qdf3XAtBOOGgy04loZLj9YWbXFSrgdbrs58XJntcRzVSvP8OyafFifkgFFI5p7AnWhFkxGtVWFdtd//2Ztq2+Bb4nsflei94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROpP1MaL; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROpP1MaL"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so667608a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738841; x=1790343641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21pMHDsV/Fd9QFDutbYYXowTkN17HxIRjn27KJEcxhQ=;
        b=ROpP1MaLRl4+XASKwxXWp4GM/YwcWusLOFYCSK1t96rMMPH5ZlR+aH7jKBAweqVupM
         JOyHecmYIqW6dc0ZqSouX0+uTWxTE5rUM3Zoe/yP2jUmECoBx8rbw4I6csaw/Hlw8/Xa
         22+dFu+jPCWwLlX/sTw0a5QwaQPJQQ1ZINmzCeYA9kUdLvP/1tjVkPI9zM+KgA/LB14a
         E5A39ujijP5ETGFIa8PdfGowfRWuaqDSfKDK31q8lLa5ngMRLvNDeRJ2NOQapR1KZ84s
         jHDnP7owzL+IPc9Oi+/Vw+XVpY646BB37dFECmxDkRXtN/Y5RILZ8sVCAQ/tBwHW3iiA
         Tf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738841; x=1790343641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=21pMHDsV/Fd9QFDutbYYXowTkN17HxIRjn27KJEcxhQ=;
        b=Cn2DA7hJxtgmnXdxFOqHt3YRgLkpuSWv9mqDg1W4Y9d+RCJY0gkuZgrY0jcvGOBYOI
         I8X5n3w2KEZRk2AD1JFULKfWqXbSCO2/0y863Zyu2yBFAI21M17VFvfpjCdBdLRadypB
         lHkvrP28zwg9QYd5qrL71vWUjTHTJhDVVz/E5uUSP1fIvbb9SD11q/cARJmd2wIV4xuL
         7gUCuxJTr0IDiDiNuIHsh+bez7rf4IN94+5ST/vRSk+bXuW5FNgIt6l9/kTomtFReX3D
         2h59kQdLk/Yf/0oO6gl6XSLyqwFrsCCWZiL9VW21aIvPxmBaphhnsRnYozzrUkGD/eVK
         itEA==
X-Forwarded-Encrypted: i=1; AKwUvBw7V4Ooc5HkrBHeJcAMAkJUe7SlAKmc0vzxJday36IGDtrWYVqZZINkZXMvWnnWODbPbyTwNojz7bIZPU0=@vger.kernel.org
X-Gm-Message-State: AFuF++nr7DlCl+AFXF9A4f3DCMETLNbl0VuqexP7jn6QTZTFqi9cRyDe
	Bb0ckNyyFRTr0/3JgR0dv3Azx97rH04/BLOziJ//vzOg79KKFvp2Z6VL
X-Gm-Gg: AYBFou0fa4KKmitdZueiPjSoF4ToGvDopB/wsZlB+fwEFH99THyttIK3t4R2MoIrwEl
	zB4JRFrXZPvrVLUDGQl8mSDqM9XpX0gUkwfjTZEmbKZQMxFlsAdsv3slWcg+/kFQPy7xlQwMILd
	izAqjOgZ8K5jsT3f4CR6leWvqeZbOqxlWhTFV5LUzO4+L9GXVWegX2XYty+vNY0J9R8887DaEPl
	54iuwWQStLPEHawgwq5RDRF+4Tx1IF39Qp53jS4zL+qgn/h7oFdz0wbchGhBg2fa2vT1GOxnO0Q
	XZIe+N9jWE8AdPNUR72ovKAhBE2Az4DjnIznetOpcqFhWFtFp1ZpmEThAJyClQVgGFuzEfEqwvr
	cHnLM9R30b0QXvZtz4MLtAhzqNUCAjZoRvUacmbGPoj3n+pYfzc1nmh2SJ13VVQW09npOiHF6RO
	HccKnTCb5KpvB4eUCZrb7hPdtPrAYT9lIOVmbW/bc7/l+GaNzydkDx4uvDDrX1QDFvuzbCjQSMM
	saCDurVcRMRm70Eym2+GGZM7UtQRHLhPHXZMUOl446nFiAgTIsPy0zZm5L+drJtm/Hp3RFduejU
	4wY/ggSvEtHGOg==
X-Received: by 2002:a17:90b:48d0:b0:39d:ec24:5ffe with SMTP id 98e67ed59e1d1-39e54d1115amr6173759a91.9.1789738840001;
        Fri, 18 Sep 2026 06:40:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 12/15] ASoC: mediatek: mt8192: Propagate mt8192_afe_gpio_request() errors in ADDA DAI
Date: Fri, 18 Sep 2026 20:39:08 +0700
Message-ID: <20260918133912.133799-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, DAPM event handlers in mt8192-dai-adda.c ignore the return
value of mt8192_afe_gpio_request(). If GPIO configuration fails during
PRE_PMU or POST_PMD events, the error is silently ignored.

Fix this by checking and propagating error codes from
mt8192_afe_gpio_request() in all ADDA DAPM event handlers.

Fixes: 607ac4859564 ("ASoC: mediatek: mt8192: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 44 +++++++++++++++------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index f8cb84621d38..c5c726a6e423 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -218,10 +218,13 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_dmic = afe_priv->mtkaif_dmic;
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
+		if (ret)
+			return ret;
 
 		/* update setting to dmic */
 		if (mtkaif_dmic) {
@@ -239,7 +242,9 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
@@ -257,11 +262,14 @@ static int mtk_adda_ch34_ul_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_dmic = afe_priv->mtkaif_dmic_ch34;
 	int mtkaif_adda6_only = afe_priv->mtkaif_adda6_only;
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
-					1);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
+					      1);
+		if (ret)
+			return ret;
 
 		/* update setting to dmic */
 		if (mtkaif_dmic) {
@@ -291,8 +299,10 @@ static int mtk_adda_ch34_ul_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
-					1);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
+					      1);
+		if (ret)
+			return ret;
 
 		/* reset dmic */
 		afe_priv->mtkaif_dmic_ch34 = 0;
@@ -446,15 +456,20 @@ static int mtk_adda_dl_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
@@ -469,17 +484,22 @@ static int mtk_adda_ch34_dl_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
-					0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
+					      0);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-		mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
-					0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34,
+					      0);
+		if (ret)
+			return ret;
 		break;
 	default:
 		break;
-- 
2.43.0


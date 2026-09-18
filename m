Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A967B516159
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738847; cv=none; b=IZYr9G+6n5gOOXI5TjdPYv3XTJpmn6bstuDIAhimdFXrsqU+HaDve0tf7CbsKCDDgIJMoyJPIBDazf1U1UAFfcH9udWFDFdo6uAJJoqUhJdErw3DomPNL9QofYGhv+D46Z5ZXaJGzKmcZ3AYAq85Esn0uKmhdAIcEv5yHRGCmxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738847; c=relaxed/simple;
	bh=8g4WrDy90/pF7rQXXIw1GlF7pmzu/PdyF1rB5UGBrnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4kZMne9EFha4ZC3q537deFSEy4P//XWR3Lb+ORF5ThZavVMz611b6S4oLLgQlDFIit3knGxcnfR/rGfTwSRCIp1pxV/4mL9D/4P77o58URwgQzf0gDbWYFlglZli3mzTqhyiyWXzKcgyraDIDehf5AyoR7p0GG6bPpus/7nOh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wvi7H5mf; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wvi7H5mf"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso767428a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738845; x=1790343645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yu2yiSMdwWefg76VPpSvIXsYKQxHtzBfgnHJNkHdg8c=;
        b=Wvi7H5mfckiZiWPMA5VRcRS3X2KOoq4sZLRDX81RW3/V724++LY2EWZf9DQIm47LXd
         5kZT0MPnMlj7BEjzYfQX5Yg033RLyzTC8fCJVnLuJq1g7yQiP/oeBjs9zhvzMGk/GnWO
         IWeLeyb35lflQr7YagMVwusa0qWbZSeb2XQeIrA2i3+0mBdtYUUJKpCUmKa+/hufPwLl
         zLqNTRp2KHflDGyIkf+qmWJZSJTzu7QnVIL8qGZFDKIzmAr3PK7f3YxHKExpiDOVHp6A
         xTsDT/4ge2mtOG1/NrLIWvHgqKtHFI1Oewo+dRqYmJ2MxCRiym6BteDrDF3n/bmQxJ2h
         dCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738845; x=1790343645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yu2yiSMdwWefg76VPpSvIXsYKQxHtzBfgnHJNkHdg8c=;
        b=WkOprpyI5JUtqc0gb2dYRQ8HynVywncfYvoYx6sgYFpl39sxK4MW5oS6nONsrIRy30
         SbS0gq5kDu7S0VVG6CaxUIiks9ky2a3hxMynrChTFbLbQL7ff/I5BhwbjCPQOXjh1s0i
         i5YStS5En7eR+drvCY5HH0gTv40iRt1xRRJkJaY7JSuCGR6mcfc5Ld32zP73HpAuK7ZE
         nYNCXJh2p2yh+Mp4Ccis6eQu/DRnCCby0wFe20BlK+6yqG6dLJgNqH79nogkfIUtQN3y
         ZvVlFVbvTudj0zk84mHEJDxK+zfM2aTB+fmKQcEUeqGXcwvY6uQZRfoleIXfNPZmL6tf
         Gpvg==
X-Forwarded-Encrypted: i=1; AKwUvBwAZnO9LfU2Zhve24aZkKMci/qxiyqqEww/B8JCzjqpDo06PBoGTUI+O5Hnh+Afg+uvCp3UXeVa7EUAluE=@vger.kernel.org
X-Gm-Message-State: AFuF++l1KnF+q4DDrFFvm8cJr7Cn07O8iLxjOI568teurbu/ohZ1aUM1
	THaeXmXPMigLU7QE0P+MGIxfQI4EnTkL/dN6UztdjJv5euoYimx9Mu9Z
X-Gm-Gg: AYBFou1V2h47Ev2vzhU9xhijCmr2qx4iqb80Aq1wZ9RpaZSi51fhJK37C9pqB9EUQEN
	epwD5+vCZ4525Mx5LUCRZmTxe1ttNqLNji0Y0NYjwJpurmitcKGq3Zn6jK6QBjfRfaEam/WE6xT
	sUuOhfbFxNO/jo0IYItGBErwGlq47XeygMr0kxR/j/keiDycJC3KlVW3VVU02DKKUBU0qIgPY/g
	GWsRj6x+y1ZmcFWcix2k8oUhaFzY0kfKU/C5CsSjRfS6GnuVnGkzTFF29dzUX7hC2Bfnn0Hxk3A
	ffWHk1j+ZdKqGsC+GPPD/Xw6B4ReTLnMYVBKtpJawdx2dU7VHCnTEt6UClL80OC0YYVfAscHRP+
	ENfHRoX3+gAffSHcYB7hfUUYr0ZMa90FrkNlod4F+yN+CxvqaIZTya66If7svpGEUL7BBEyiWkj
	yJ4i9YhfIObOpGkLabI3tE2/hMUgkg/1rZq3tzH+Q0o4bfLuFWJdiAUTnFWrHif/L14/wp04146
	YA4rZuJHpRSGGoZ3mYlp25ULTBr4AQQSlmJCqxhY/lC6KjorvDN/5+stTJ9eNLc9Dw6BjiDVlkc
	4QbjJMjMcWGk6NoQntMAdO2/
X-Received: by 2002:a17:90b:5588:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-39e54cbb4a5mr6454551a91.1.1789738844971;
        Fri, 18 Sep 2026 06:40:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:44 -0700 (PDT)
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
Subject: [PATCH 13/15] ASoC: mediatek: mt8192: Propagate errors in TDM DAI DAPM event handlers
Date: Fri, 18 Sep 2026 20:39:09 +0700
Message-ID: <20260918133912.133799-14-phucduc.bui@gmail.com>
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

Currently, DAPM event handlers in mt8192-dai-tdm.c ignore return values
from mt8192_afe_gpio_request() and mt8192_mck_enable().
If GPIO configuration or master clock setup fails during DAPM events,
the error is silently ignored.

Fix this by checking and propagating error codes properly in all
TDM DAI DAPM event handlers.

Fixes: 52fcd65414ab ("ASoC: mediatek: mt8192: support tdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index 49440db370af..36fa0f32ed1c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -250,6 +250,7 @@ static int mtk_tdm_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -261,16 +262,17 @@ static int mtk_tdm_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_afe_gpio_request(afe->dev, true, tdm_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, true, tdm_priv->id, 0);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8192_afe_gpio_request(afe->dev, false, tdm_priv->id, 0);
+		ret = mt8192_afe_gpio_request(afe->dev, false, tdm_priv->id, 0);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
@@ -282,6 +284,7 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -293,7 +296,9 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8192_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		mt8192_mck_disable(afe, tdm_priv->bck_id);
@@ -314,6 +319,7 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	if (!tdm_priv) {
 		dev_warn(afe->dev, "%s(), tdm_priv == NULL", __func__);
@@ -325,7 +331,9 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8192_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8192_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-- 
2.43.0


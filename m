Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ABB3BE17E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534899; cv=none; b=MdC7uZwGGD89zQVvbmlm/52jiGlE0icR7Z6fsFjnGXagZxSpyo8c296u8iivalFgag2FZacryVv/G8lvH8YQjoOaSR9LzfEkXmIwVF8CR1mrpE4l5m03UACH7FwvK2lMSTq4z0uSXxEjuxmC5exSEEonyohcTGfIWBZWrrinGRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534899; c=relaxed/simple;
	bh=lIeCLIr2sVuwfKmGBusqVfb4nxMq6QbYAHerlA3l9mU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHKpxD6AM280oMJUJKDE/pcPSenKL6MzGZWLe68DG5D81g3xhz1j5EO0Bb9U94G9eYa3dS4lASFypr6sRuSk1vrQHUgj0cW/DCfZKa//0WnmpeeqwPWi5Lh/NqsxUs0lpYStbaoDnI1ioWI7E5TCpW8XTV5TpI0oIA/t9WStCVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyWj4ZCh; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyWj4ZCh"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c0776592e3so317186b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534895; x=1790139695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvZwvf16j3ZKmO5l7pN+WcP86Sh39SLeqVvmvvinM4o=;
        b=fyWj4ZChlbTn6Y+OkZC7WyXHiiAO+KhS14zLUgrDBl2bocmp9SdZLLs/xrNnvpyELT
         h/fW0PHL4KiSCTC5hL6CuNGwWb2L1h9bR3a0MdUruQglhHnFT54H3VfHM6gMkh78HpTN
         uBloUBN0oAh85FIEfyJ5OaRpgnAG1ruvaavhV5MjOX/hhJBgDN1NjtAazawYjUYqJXyh
         2qroDNYLNn/rbAcKUdPauAJd3YM6PO6RlCX0xNxoG6QczQ8TPpLi99y8yBF+6rXdT9sa
         m6XNJIo9xA34pgvM4DC6Ct0lc5htuK3MAcCH93nmndz/Arx1rajl5jJUStOqcLV3Y9FO
         fGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534895; x=1790139695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvZwvf16j3ZKmO5l7pN+WcP86Sh39SLeqVvmvvinM4o=;
        b=lcOskgQMagThDjxbeZVSBrZfuJhkIy/IeQKmhNlL+x0OqyudS2kBPW2ZhK1u3Sz8Mr
         RQGtCgVAaizlq0dVRO3Nd7PNjpWiI5hMYgz0qSeUhUflVXvd5rX+urQCr3/YnLNxtF/N
         R9QBlihS1PfbtBL3tjPP/Ci++0oRThuHUHLg5UsDp7QRFzr/n+50V6HQdqYqc3/0mJFo
         7Om0QGhanhuQB49IrnnxWf9VZ5QyBgSnIzKWEm3xWcI7obDzQp+LsATNriaoL+z9HNgB
         eGT/GcEupj2nX3OJSFs1Ptccw+Y/Zm7pPUy7ktlMKbGnQtZhf2XfUYIEqhVjAyh7ducz
         TL9A==
X-Forwarded-Encrypted: i=1; AKwUvBzKtYmQG2GaJrDaqeOWObvuTGvejfV1bJxPYUz/IIgxT9AVfWbhaL3gBQU9M5FHaD8BItyE6dJv5n9jeRw=@vger.kernel.org
X-Gm-Message-State: AFuF++m/T4/q7Sk4k0dCss4HYuHp9U/GWQfljTwBDEBVjdJWnbXw9CST
	sJSTqUifbEyx/PYnhSArj0dW+PKpl+60adXPlUoWBlvY/XBkgsXHO+S9gZA5qQ==
X-Gm-Gg: AYBFou1hWf9Cnp4OkuZtvpxEmfjLxvXcjFPTXtfO5v/JIPAyCPKABA3yQVHWOZS5meX
	b393fJFjorh5ohq1AxbhxjzyBbJn2Wx6EToyVufltY8pdzG746Ev4h05XExWC9zB2WjNQCgIRib
	/+v8WXOhRR9eu+uZ3Jtz633BpWf4fVHOMTVGi0ytE3GWC37vWbplN1xqQzqd5KDrsIH9cJwnApA
	MgYGq6t9+0uB9TJ8XAkczkX25u+LNvjKTjC2zT84h7qrYbmDn8sPmH1YP9TfHJ1XOVgt/3fJI2D
	EmcMjKQZJrnCuOIpyIYG60UFsSP6y5zSsrwgz/d/sq8jZ1AyL85gZEVZ4Cj+UZinj7k4c5sTrqg
	Hojy4mEOBZah8iHUMQdTboYesPnGQZO4KcvfIn82cxDdbVgFxzBMGCmhZZ2y9vk9tsM5d/YIWtD
	hgSoA1zu6YhPRQwTvqNaHbE+/L68iauFCSLekhsCC9xrYhYslfvGdBGaGaUiLMEimGGMNBTVV5p
	d1GQmbw/2G86Ifpt4kxV7u0UWogPooumxS96O2HoKKbXuVNJaHoaxj5rLytJMXW57hfOBETtjj4
	4GCi7lvzOJsursw=
X-Received: by 2002:a05:6808:1783:b0:4c5:d2a5:3caa with SMTP id 5614622812f47-4ca497b172fmr1584357b6e.8.1789534895474;
        Tue, 15 Sep 2026 22:01:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 11/12] ASoC: mediatek: mt8189: Propagate TDM clock errors
Date: Wed, 16 Sep 2026 12:00:18 +0700
Message-ID: <20260916050020.14575-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_tdm_bck_en_event() and mtk_tdm_mck_en_event() currently ignore
errors returned by the MCK enable and disable functions.

Propagate these errors.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Do not pre-initialize ret; set ret = 0 in the default case.

 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 5d68a55ccc45..9aebd0320614 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -261,22 +261,24 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, bck: %d\n",
 		w->name, event, dai_id, tdm_priv->bck_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		mt8189_mck_disable(afe, tdm_priv->bck_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->bck_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
@@ -288,23 +290,25 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	int dai_id = get_tdm_id_by_name(w->name);
 	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int ret;
 
 	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d, mclk %d\n",
 		w->name, event, dai_id, tdm_priv->mclk_rate);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		tdm_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, tdm_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, tdm_priv->mclk_id);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] = {
-- 
2.43.0


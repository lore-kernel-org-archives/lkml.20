Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022844C65C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782625; cv=none; b=IrYG/tjQ9xK1D/RAUNx+P7qr6HdK3W2W6ThtRrg3cYV8UgZoXLCksgkdGgxXQ6VsxQ/x9eS5cYb+SzrIy+5c9JD8+v2y0myWVyJm915MikPKWhP0GarE9TH3U/FXleilDVCteINsk+0FEVunJlDJMvxIw6CI5Q+UrXGK1gDTuuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782625; c=relaxed/simple;
	bh=ht28FDJd62sIVqArBKyNm8KvUqEKJhifE3cS4QkTo8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HoBGjSmbGu/bw0WUYAI2IlcN4fFGd0+ia2wO6vBFe0ZW6GbsrDR42jpyBw5GdWSpNWyyTXgDb8xhf69ecAjUNv6DCX7/W46hG/6HTyQwDm9QM+2x5F32Us3qWeYL1WtLtuQTQoG5H5uvHSGFtgdvZ+RALRH48PtywWrfZC9iBOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q60wGK22; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q60wGK22"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39682983a0fso3738574a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782623; x=1789387423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Do7a7ymRYAh80Ie6O6Ei22SbBIZZ1+J+po/v0yFfkwI=;
        b=q60wGK22hd4GaiPP9BXilA3CHaA5TO5LDeMbDL5KX1MMa/KBL15PpzMz0HBYNVNIGp
         9PuVjV7Sm6ID8q/hKGY/2oZXMct+QkGk1eN+3KS1MVAu5Jfz10LNQaE4ArxQcSs/KwSs
         Kcs5Mrr9z0eSEpI272I3sp1aZfyQR7KoVZVKDzqCzeSVTZTCwzYd9Y77LGmqB8Yk1Hn1
         khojlW0ENcA5L2jKsrHJCaroNDmfY411p2WUKDhC/pInsKOrgKg4OLHyd0P79R68EFRi
         O8X93EJx2KuQNkTsGxGxKpMLESc7x8lsb4Cp8M2Clfn53h5bdxk9+JeXGFv/+mvACPHJ
         J7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782623; x=1789387423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Do7a7ymRYAh80Ie6O6Ei22SbBIZZ1+J+po/v0yFfkwI=;
        b=cHjCs4+BB+UJ/hptcmPQjPNqEBc48HRNZZkjEe4Yrje/ev2xSodwafd9vqxkEjNv47
         Jsy5DPS5nm3elFuLDa+H3A11hzXgp0hyTvrkLtr6jcDTHEpB/1WuN8kEjG3nlrX/nfov
         JIaMgO35BobJRT9N/8MGQWYghk29yDOidA/OlxMRh3hES89Z2Kned/fLXSJuZZUiRkBQ
         aUMn7HHGBfVKgV9mO1C+oJhIY5+H0JxHWFdkxBmQKtsxoTm3fMK/cOXfkabZt5hXtPKl
         55fPRMKd15u2SGS5UNJbUfEO8cP15ObWqjRE/9a6WFIlIgc5QBuut52K41tWW5nrVesb
         vlaA==
X-Forwarded-Encrypted: i=1; AKwUvBz5OXYDc50oOiqcouQdBak00+g7XHYCH7YhuuQQ/lY6dXM7jrO69fAxV1XjWHfs4qm2w7LCAU7xzGe0A24=@vger.kernel.org
X-Gm-Message-State: AFuF++nfSKmeLEELbQzWYlo5cCjDvyTRLdZFhPx03cIruhzmDF17g2DD
	d8pnhhvKXYqX/NDdebId9sZoKatnlXLpn9CCrD9HOqkffofLeastvfVc
X-Gm-Gg: AYBFou27t3LMQ5qQ6Z36lUXXDNKIRaE8enA3iSCRaMCkBHjoqqD9YAUdzHgiV5AmAB0
	ovvRT3kcj0ENSxBi7qvVPSTLnbXq+SS8eppd6OfygBsD8Q4D7u/KXAFqbMG9SsPy1ZfuijuGUkR
	gxnlJzp51A/lXxuKRIuK3bINpYXqH/6zdARc4FUFruaDxQLFs1Vvcc9uwV2sfn2RK6Oyaq328zS
	WvakXBrDONB4k0Gk6UOZIZ+f2HCDzoM77tK+ml/6xqMlhaz9hXTDQAXy+N4cP00qsc4+5m3a6++
	R9Hed19k+VNuvOw47UkQN9l4YUGS49Uv5Bkdzc4XHarHG/uXXfKc9pUGh/36wi06fUrDjlJ1nLd
	wEgbDb6WOTLf4qav2z5SGKwjHff/+lLHN0VXI01FDzq0x8UzwmHbV03HUJG3e+67/qkY0PwAM1P
	YpakWVfxBzRkqQruL586K4ABlwFzv2/M58LdpjV6gkFGDGTWuBTKVQBj6sPcAW48sZO1hqHpFb7
	fXyW868BKZSjr1TuqZVR7j8LW/f1aSm3vj70X0YeW+l8eLNDLEjgaWC7hpRv/EX0eQG7B/h+MiA
	Gm84
X-Received: by 2002:a17:90b:3c05:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39b26106c44mr34312637a91.10.1788782623126;
        Mon, 07 Sep 2026 05:03:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/7] ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate clock initialization errors
Date: Mon,  7 Sep 2026 19:03:04 +0700
Message-ID: <20260907120310.135693-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() to handle clock lookup errors without printing
redundant messages for deferred probe.
Propagate the original error from tuner initialization instead of
returning -EINVAL.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
index fc6cb3f0469e..42878c8a6529 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
@@ -416,12 +416,9 @@ int mt8188_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8188_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
@@ -430,7 +427,7 @@ int mt8188_afe_init_clock(struct mtk_base_afe *afe)
 		if (ret) {
 			dev_info(afe->dev, "%s(), init apll_tuner%d failed",
 				 __func__, (i + 1));
-			return -EINVAL;
+			return ret;
 		}
 	}
 
-- 
2.43.0


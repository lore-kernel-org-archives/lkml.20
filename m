Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346EE489FDE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045110; cv=none; b=rMxbxz9Bmj6a2sGnAP4rUvH678ykA9IAHOpkkhUUq18jfRA5WCisRXrkKpNSyPyVeXEvlZYeiO18jQJIf0/FOxEkEnhsqOb1R7yypDRcScZZoBlzQO7fLEULXnmejTJ+CQeX54ndKSecabaUc238PL2lh+GShgBNJk06/mNVrks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045110; c=relaxed/simple;
	bh=7mTmQqvMAJspHqMWjJADF5TkGnCYRTyK2h8zGqfXvsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQHXbu9WW/ZAAvAwtXusNftEy/MoxrIKVY8ynyRPkC26kKxQ9ldwNfrIQM6N6wyU50Bb/QPhmr+SbDy1Ly30a4tWBev4cnCV+MgBjFfki/AV+tpOb4tVNyecAPgd5KOVX/bQd1J1rOpgTO7ATRnjMQXDOJa7lOe6E99nt69r7NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBEwYEHl; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBEwYEHl"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1368050a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045108; x=1789649908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=;
        b=lBEwYEHlRt6twxxo35hJCWSo8eh/hQrmPGa1Ibm2BtCCJONxqJI3TwijaWTwi3tTRc
         KdZEsJ0MmcgnF4+OfykSqr+xtJ8dLUmAFSVJf9UlBYKXyS6ty48SNwYeDcHfy63iM9ER
         nXR/oQW/PCfd2oA0A3hcqjNryeQyb7lWnKpq9zAFE/pu8qKNXp0njv67CB0X8QrKnzHE
         OmdDR/EBC0CPCNE+UH1ZPFkIHjCseIDr4K6LXTihV6eTeAPzUc0P3R/hbt9eK8XDMTxp
         eb2j382vx4yJVQmjzLg1ZdkHrQMt16ACDAwbKIOdTu6UcRJS6o10o8FsBKyOjg+RlUky
         eEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045108; x=1789649908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsPHanuPYhLkAJkeLkxT04CaUhRH1BSXCePDlxHKnc4=;
        b=gscKPb8s1v7RbFwoMMiJZZS46/Fb47gIKPCXfZH2/fHApVVQVYPyTzf0lYDVq1HVTM
         8ynBycdjni+yvIy3U/QrTVYwr+VZaG78A/7+F6mba2GT/ML2Z3Uch4n7Bq3DWFXLDkiA
         9ciUHYmnb/jNgiQfziFNlYuFYKLGUVSRV9HRjA3E6lPdsTLy3nA/DWgKqtiFV3wx174z
         QVeYwIm1MPzGeEu8+R6RJEc561g3X7kcW0P14CAPJgRFQORlPC6F/Y83uatV50f96/wJ
         hNQGpp3f56kIlPuo6NpDnR6Qvi7puD5lhIccVeETyY+aPu+3W7+IOG1JvBfbZt1BCKdd
         S9ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxak8xW1jMblkSPWAeg/suHm3hYBgeG/L0PT58+2CnKwR56KoBHa1Qz5gaWov9oJF2TOmoaHtFH7ysNfwk=@vger.kernel.org
X-Gm-Message-State: AFuF++lrnXOdk5ofXgIXm6+xmT868nm3EjcdJRPpY/Vr0iAxX1TFkjj0
	MEbXRURvrGId21go8fJ2aYHJFHbYOhOBjjvF32On/4Xk1SPnGHSg46xd
X-Gm-Gg: AYBFou1ZVujzvcQXh87rGf8rVsTdka0dr1YWGGIGYYWxyH97tqP8zKIW3ChYh1qFMrl
	LHb94tqFexm4xsbucMyjsapYjP5WxC5w5Gj+wfT89+dQFwFWKsxdIPi7D/s4SlXgguAdpTwEXij
	JklnxJ5djMo0WS5v7f0KWtJ6T14HxsXtTJiQNJLSnyVb9saDjpFaRnVcfMW2Kd2CT7wHWS81aHS
	YDXGtQm7UzUOIIMUMFPCxnU/0FyicgLjZGJYxub3c9vEUqNrr/pgFcweyK9VkfT1sIzpua5TP6U
	XnUUpkQ0vy/W8IqMGHxaDOFLOEVms9VBsoFqnYAmHvwxCjZEMZeV0DBrDU77qt/71KY/ddMZWGw
	fl5hZl71ZzDH2RCwxgjeOW2tWeGG6r1DDMYTxVOiqRfOxAkXz2hfCfJvkdACjjFZeGJQA7t3fSa
	nycTUw4A4z/mf/rLrVkMFR78JunyEz9P23C6V4soCN4yd/Iuk4h50b63fOrKsxRXDT/z9EXLPC1
	hbVDuR7NXS4HL7nPAzbT0vXaP+xAlWAE6QQJt2fR0f+fq5u8wIJJJWMstHKpYq+KS+byNnkunuU
	GYscGQEYyhXWGQ4=
X-Received: by 2002:a17:90b:5292:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39d70b7d864mr10327996a91.24.1789045108156;
        Thu, 10 Sep 2026 05:58:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:27 -0700 (PDT)
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
Subject: [PATCH 06/13] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Thu, 10 Sep 2026 19:57:35 +0700
Message-ID: <20260910125742.150902-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 435914aafb44..4997031cbcab 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -793,10 +793,9 @@ int mt8189_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8189_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	ret = mt8189_afe_disable_apll(afe);
-- 
2.43.0


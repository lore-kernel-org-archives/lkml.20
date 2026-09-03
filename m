Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6462309EF2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411185; cv=none; b=DibO5rmpA2w5L19gqEQsu+6tP/S0tC450EL6otBB5S83mpKgaQBx9ztEHs4pYIOT23iVgu1Y/KrNtcLp4s4QSY+QzNDNv4S2PHGPKv6JayjQocrS1JEAsPzUFtPy7oq4+2hAIxUcX6iEiED2pWi7CNeZ2BtH2VqACIq3XAmHG4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411185; c=relaxed/simple;
	bh=LZvlbcsgGaGSFhVc9VXtl4EgwIRrrp1Uij6NVG3vb9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyRpmY5UT65DM8OH05tIk0neJjHVOYcSS281c61Y9IHGdEDmftofiVnVdbh32HJAK6e1/OI4m73pRWSGg6+6nSXDdscvLavbTIti+JZ79I6G87N6jALh3qtJy9mog4DSw+9IFEv/MowF2aJmzYModXnbZf54SmqUD8VT983SG1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RX3CoRwk; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RX3CoRwk"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so583266a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 21:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411183; x=1789015983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flo82f6nJyQV/amkHfEW5LTC13dBqnuwC2IX8NNo5OA=;
        b=RX3CoRwknFAO+CrG4DmVQpch18D1wocZFeIg77g9ineHqyvO/smYB9bxk1dRFz8+qf
         1gX/t9Q0+SFBe70xHKhlqu3cXMZyTxuYzl38Pj6lSV17ufmrqNRv53l6Tkzo9490OV7e
         ZR94HvmEYkzbQGjlD1mjs+0NwgsSAxRO6goXCZTdYsNmabpJT+O03o9WKmBn2GLSeONn
         7AqUoocCKcBZeRjQObVpzPj2u8ua5s0zYPsc+ODX9+AcWNwZO+323URFMtk8GBqf1CIX
         GtnAA88mIN+Pjd0hBG0PgjpUCQseAsln8AqxZJpdqBFZwWRMJA5/zrm0g9oku0ng4z4B
         Gq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411183; x=1789015983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flo82f6nJyQV/amkHfEW5LTC13dBqnuwC2IX8NNo5OA=;
        b=b09C/06HdV2xzD4Pt9KLlCJ8FS+FJXtPZpvs2w9rVZPFIc6p2BZHMqePAbR4l0SxMZ
         MW4ld0JGprkE6+UB3JPQDgqHCkI0ZHsCP/3g7lo+XeaemuMtFxUBYY4WWAabHL42FRU5
         j0NNZo9EjyjOQ4kXx7iSNYq+A0V6w/+rnudOKJ1bbJrrids79u8IWl5C4dmQW1PJ2kJM
         7yxVr7HM1MmxdNsIqNbO80ODcPiEyMIVnM9j7yklDokyIpjBJfmB0fXAf0PTDnTi9gdX
         H3f+3mbPBzPoz5mQCd8mFutSJ1bm6DHULDLRPdM9q1xjnVnA/1OtNsh4tRo9xN3WH2th
         Ag+w==
X-Forwarded-Encrypted: i=1; AKwUvByRQ/4WcoAXvHCzyUXyPewjzraLRttsTvQQpD3zUaNMFnFHJylb4VQ6yJkVJNf321Y6tc6Xsh23862VXpo=@vger.kernel.org
X-Gm-Message-State: AFuF++lhfXnLQhAQ1PE+wv4NhYTMllNE5bibFaEQ1rqCcC5sPse6kCT9
	+Mk6PTdrmcOYfwq6YNmkV7Tevq2h1GERQBcj3G9aOiEuZfgZTjoJTRQ3
X-Gm-Gg: AYBFou1JsTgHU3AqQRoK5BjN/DQeM8Ek1SqSWBnhA4g14YKMG4Y9KeZ2XhXxVDvJgAW
	tzbWApA0arwxfliqN/p9HAGxGI8Cgf9rIKUL/Aa0tzUJLkYwKuHHrvCaEJtfCJQW1rkWHKdyAIA
	+bbSfq8MN9RtYHGta2SPjLnKeEN9khEEUy1na7XTMlaLQiLo5zxY0t+aRfeDdo9iGaHeCjS6bP3
	0/Xx4vtyiiaKLnaH8ZQEptpG63baWw7bhKoHvs8l8p3xUhLH6tGC9sFqcS7wOj9eHwPNk61bHh9
	dqVYXQCU68VaLVrFjxwxspNe+qMotm6bKko38u7rewfJrKhAZoI+BnUkyczjBktS/2zw+jjGRds
	PAflPT/FETMcaKp3xeq1dTTvbvs1rPYyOQIH45ycT23YCOsue/UiGIeBOKEhCDTfXd9w9C4/DgM
	50iY2/3rsvCszMP+YelsitclKJ0550vK3M/IS1oVTHT1c4DSNqG0h+vKRVYQrYy0CDDH9AcL4oC
	BxCOfPE7K5DWsCN4+hQmQ5PO8VNZm6SgdjL8nKi89mBkrhQy2IoJtSVhd+3nZQgXXPKFUDxEjlG
	Skk8
X-Received: by 2002:a17:90b:2c87:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b133026e6mr1191332a91.15.1788411183106;
        Wed, 02 Sep 2026 21:53:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:53:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 4/5] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Thu,  3 Sep 2026 11:52:02 +0700
Message-ID: <20260903045203.175337-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 06556689976d..40f9afcdaa16 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
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
 
 	return 0;
-- 
2.43.0


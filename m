Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026CF3C1D41
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787893569; cv=none; b=I4VS0uwnuKyAa87md7sJePd6oZyDs0HZNlY7bQp60wSVkNwmI919xPl7fQkx3d71X4gc1MD3ZWIB6gV9snduydejuFi+TxEFI8WhN0qQiIz/F75woidm2idkeBDapD+ug4Wm2lflYkRjsnu5zy711syHt9HHSqE83GYDhnqfF2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787893569; c=relaxed/simple;
	bh=cLd+n7EV3Kp2AMYVFp+K6eTGdRe62zWUaZ55f+Rfna4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfRyWkL2fzQz/m8Jitg5hC7ParlBWJ8LgDtDmorh5Cy6JcTcDDcwSfswJkYQQjgJxg3rP4GRS3pm8A9ccAqOZKZEGPlgWQU9iRfpvcQnM2F6AoAfDaNEKjGG63D38TX+fenNnu8TYZOtj8eLfZiV5majFADlOTNfHVBLrnzzhiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctMcMJsY; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctMcMJsY"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so509401a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893567; x=1788498367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ENiToKs4o7nUJ1ZfI4T9iIUcH0bdIn9rzCQXrLjT1k=;
        b=ctMcMJsYBYkJ1KhZnzc7bQjPaDpJ0Akde/UrMJl/QE7O8osayY9TTQlnNt4iHOSgwT
         iGJa5vLdBVZu9TgHc3IL6DSy9Sl+nGEyQf3QS4IMswkYF6xEQd2FPtw9apL9/CrsdGbf
         fXRC2fE3anb4oa7iTAhNO3Xb7NQbz/n3mLkMqNRJUdrqwrAfUYI89j6j7t0XR6VbdEqm
         3Yu5k7pOB8tkjTMddVvNYChX+G+rXswrE9BtwZyHtluFsnccuJ/B+UvP6OZt/5I5HcDY
         6BVSpE3Zjuw5UMSU5UsINGz+8Jzj/Fm9DkCOtzKiFP7zQbE2ZKVtbY6tQ5LIwlZUEfCf
         pz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893567; x=1788498367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ENiToKs4o7nUJ1ZfI4T9iIUcH0bdIn9rzCQXrLjT1k=;
        b=cej2T1zT818fJKqa28L+UD/OEedbGjCCpLSzWgsgsVg319eCnWxrGGNAgx0ZT8aG9u
         MIe/kMY9FvzI3PTamEFoatJ11fNytrrhpPULdf4XWD7cYEYfWDi0Zg0FL+uIOUVKUF4r
         +iN9d9yoOliegf6u3w7z7Ax1OHl/hiM9LAixlH1Jb0NkMGJfYplJwwMMt6MhxhCE4zhf
         CV8HC9tpVyTwOkpDKg3Ip3MhTjOWnSrIN5QrUl8JzLOCTxZM/XFeOuILpVesw2r09i56
         Wk5lwZM10LpfVnnVhZrY5/5c7rs5dRcKZ178ZgS9k48UucqU2GWtVZ/8U35xk01aFDr9
         /1+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoqhO79vKR1OE5FRaHwX55czZrKkwr8Sqzs2fLb7E5FGNmV5hndHqhYG0yY+Q67xp8qzMU44T5kc67rLps=@vger.kernel.org
X-Gm-Message-State: AFuF++lIUKTawxp5g+6tW2et7hE2oy4+GJ5X7PEEpqAEm9wzJ+ZHyXUh
	DWZmHPD64V5QTDSZBvQa/DolzFfQH+8Kdm9GQXI/kg2fB4++2rpCUvJc
X-Gm-Gg: AR+sD122UoAFem/34JHiaAi5yKUQ5d6u18UA8QuF44t+9QCi3DoOG3qQ9pjlekoZAHu
	8l3rLjZWegdJQjjOLPXoWe0Pd9lIBMgjYm0S/m9dsC07typMW05TvHjDr40s8pVTDoS7RchI8JV
	uA6cDeasfQmu7QlUp9Kjj6uZ71QaFwZzV3QroVGgJ3d5z85LJ0hWAG+td5Mgjyp3M8vlt9lICP1
	U54+eokguIjlJaO+T5TdkehUozedxf/SdxczqpJF4OvhlyNkKA6ZxuVE3ts+JzCQNlaazxOoGQj
	Bbd+Zb5lqeI37QQCYTdlWPDtG+IMdxpPfQgk7VkRxYgO16j4x6aI6qYRLXp7EP/r+gNdCVUe0sR
	SEZ3lyrgGj3L6jVXfsIT7nmUI2n4gtGG7Eo//yq6KcMXczj390bYCIfDLOA6DE0oDZtGY1DyiOV
	clVSRFYdShx67ylE/0TRxN42ZvEV+RP+ghRe6tsyXG+6lS/FKitLXt/AWlsH7BhYECNdqPqTi8I
	QZCkDGUKB9fPbvtblBSNLvv3HsPfC1AI1Vnt5jhF/4cwkNoQtxLrBq4PbkcECdUPimTodYIxJ8u
	FJFc4g==
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr8743391a91.14.1787893567319;
        Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:06:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 4/5] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Fri, 28 Aug 2026 12:05:25 +0700
Message-ID: <20260828050526.590761-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
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
index 43d5898357dd..c67424bed329 100644
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


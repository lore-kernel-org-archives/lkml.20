Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9905239479B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789338629; cv=none; b=VKZnGzIQgeuFJlsceL7Hr11TabJb8ONgMpZ+Z21SokOyJTRifuCyCmup4zjY4L9PzZOeWiSubiVUAO1o96gqtcEBeZzHm8XuR8GIqlF0HeXNIDDm5W6kMcDm5emugxyqQKjWa2+HExFmYcUCcS8G447EKn6QkpRbwMfP5iunqmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789338629; c=relaxed/simple;
	bh=d9fm+vSN1fGQfF2tGDGAlWm/3lPRJwHHSfYoL0F8JzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IvR1v5PGkE31YyWT9R2JRlD+Xdje1aQFSs7OGCNJ5QPu53r1VhHTd34Yc/GArYdu+Qp9mI2wJbzFhWYY911auzRI+Tcervw5z9zRqjr/8BTe+55eG/OqXKKDYC1dd1MfcvFO3qGHKHGli63Vx9oO8IJ0wO/mroR3tioYvicsGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mb7bbZhK; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mb7bbZhK"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910704e63a9so6503246d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789338626; x=1789943426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0bAI9mmXm3rd1fs6JBz3Pfb/OV3Rxah7vPEmWuwzOx0=;
        b=mb7bbZhK1S70j76v+0ljdt6dsdKrtKyQQ693lUClrUTu+yshFTwskVBmUUZFyYyQCH
         +a3fEyTFfrLfyUjYIdZo+Jtz3f7lw7BtaIWD/VSa4w2TNcNUVA0rsnOxa3pgDmE6LGoQ
         OFxxJ7uo0az6U2Nr1aTqw3QeOM8uPx7GBKuR2c+GGWu7muzo6xqUR792iJ0EKaQ1e9Cr
         JoWta/bjZgYWHchzM+XgrC1CJBvAkvQH6B1R1kRnm/7LPW0hL0HJIYnztakhktNgbmQU
         3mQYb7841nhTuHe1vc17lEQaVGZP5W3RtfeZ6y2cKsmD46dJ8PrCIDWKxmkTpFiiBUmb
         cxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338626; x=1789943426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0bAI9mmXm3rd1fs6JBz3Pfb/OV3Rxah7vPEmWuwzOx0=;
        b=gsoKQKdv/45VDC2DgxHkdew0tcAQDAqo7oSjVa15dNr1a7c/Yp3I+s5CS2ldo5WzWS
         YRJBl7pbxxyO9FtdeRjzsgYDWNVVnBLoSFcGZcRmZishLE2nWTK2S4yn7189XYMxTJPv
         t+mUTfwHJmQyvDIvQs8gUH45l0QHUhJHOrQlBW6YbHZNwRQuqVJxaVAI+UWyO1sBlT7h
         L8YXUMYzMG+MGwSjlSkPhSoUy48v8FNAFcjhXSHEYcjk3BDiovYpb4ey5axMxUYtJqgy
         LUoF8BppwZ2Xz5shbebSI2oJVPRUAEuUOt4gSK9MueyUtciTblEs3NDpJWwYys/IsRdF
         cRRg==
X-Forwarded-Encrypted: i=1; AKwUvByd+pltCPkvG1Kl1iJlAsJmDEMj55cZ0PhvyPCm+PTVOBbzhMWLttlVqNUviL2Egesn+X5gZlzTf+cw+6s=@vger.kernel.org
X-Gm-Message-State: AFuF++kijefmE4Fah3mRSKdIfPz82n26CPytgSV92ay2hNK3BIXDgVrB
	yO9EhqV2CEwEMVIY0KWFa93lILCoy3B5LWGsHsrp3oWVSJIyQZGuj7g=
X-Gm-Gg: AYBFou2bhxDY1/L1JWba7ETOFAIWKClRYAMC8MfFoKULpcBSqhmQeFA1pFoJlGyaPsI
	pSUM8+F4FCyeAuY6rraAGcsjs/lbLKdcfoi6wSZW45ZHt7MlYkRnQJBmoqEzhdoUXoXPerYFr+S
	pREKJlRAtzPvXQ+CoiekJXoIzEfunYM5YmJpOpzme0SQ3eGyUDRlezSBy1ktqeV9xs64jO4+8Ow
	2I9PJ2VwhP2qjA2ayk0ClCCML9BAyKgrWLVYj6LdR+dM126mxceybn9Jt1Lo9duVFrqP1KJStKq
	8A4Wwm1mod5qQ6kOsib6B//GvI6OblobVZiXMtDw3IUXUI0KLYR0kld0W72hbIuU1GRexbGEbJ3
	V8xpqP0+FaYgXdrkoXp38kEZ070+UkJxQEWh0NsmFpkRJB7s4sMjB/mUXf9YZltgz1qxb46/BiM
	dX+RDvW2fp/CLGyJZK3oHoF6W66gUWTwJcg7EJk9QaoYSBisKewpxm9sexhRfQAplcKHCjwXV6q
	BAxJ0Xz94Lc650vbJsiTTsRdetxF//Fv2pfjNy5/52ioRTi3Hg8kSxdgZo4ZWIeEOt+FAdebbQh
	8wEED6PkJ3G8mucSCUph5AQtPuiexP8s8KGReCbBmXXO
X-Received: by 2002:ad4:4ea4:0:b0:911:2a7e:abbb with SMTP id 6a1803df08f44-91226b71087mr49832196d6.14.1789338626502;
        Sun, 13 Sep 2026 15:30:26 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120ef650a6sm80587576d6.0.2026.09.13.15.30.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:30:25 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	linux-aspeed@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/aspeed: Balance the display clock enable on teardown
Date: Sun, 13 Sep 2026 18:30:19 -0400
Message-ID: <20260913223019.89651-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

aspeed_gfx_load() enables the display clock without checking the return
value and never disables it on probe failure or removal. devm_clk_get()
only releases the clock reference, leaving the enable unbalanced.

Use devm_clk_get_enabled() to handle enable failures and automatically
disable and unprepare the clock on probe failure or removal.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 4f2a8f5898ec ("drm: Add ASPEED GFX driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime, clock-failure injection or unbind testing was done.

 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index d4577663a..aa36b79d0 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -189,13 +189,12 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	}
 	reset_control_deassert(priv->rst);
 
-	priv->clk = devm_clk_get(drm->dev, NULL);
+	priv->clk = devm_clk_get_enabled(drm->dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(&pdev->dev,
-			"missing or invalid clk device tree entry");
+			"failed to get and enable clock\n");
 		return PTR_ERR(priv->clk);
 	}
-	clk_prepare_enable(priv->clk);
 
 	/* Sanitize control registers */
 	writel(0, priv->base + CRT_CTRL1);

Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8A83E51FE
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789295187; cv=none; b=WqgcbMqWkrKGVGboIS/iryRSDFxg6vtO5CxC5dbxQnphwMiof6Y9Kj171IGNVLhclBDQLs2UZBx5D9+/AVvqtY6kIXTBC1wVVZtlCXOIcP4eCddJ8T9yutPLvZ8Cq2Ui7G4SD2g9sQu7HOQ9kG+O2bRS2nTF1RqMI7yBJvfNGPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789295187; c=relaxed/simple;
	bh=dodaNv2L2esAPPf9gI7/H+1Xw77ZgMMMPPmKP2CNrp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CvNgUtpOeZwzgWpATnMRfZLbrrJB4Ke0N6xNRKM3TGePlPYHJsrpGWiZf3EwEPDtrEf5DT3+C70CzbKczPHeLuBzC54jg9sLtIR84CdXzMvoW4K5/hpIjhbGUy5ScSPS0s8AeOJl3o+mBOvoTVuaz+34MRwFkrEWJX1tDcN79jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4hnu30F; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4hnu30F"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a8568e9so790184b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 03:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789295179; x=1789899979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5H60KqbS+ROq5wCtUl6A8wMpEemlazNnMi16ohCbfuQ=;
        b=S4hnu30FBNpxCQMtMg1CTkGcP7Iry+Xd4G8pSi7Br6q/UJsSkjVB5UiAIMYiL+wYdt
         2YHNo4Wo+Rrpqx445iBpwrLSrH/QnOafI0PEXUIGuAjm5AGWdGjG1Bmeim2cUrDRi1pg
         7jBSrgR9bye5AtC5TmD4vuBjOEovMNfBgIyp4GTTxceCBlcq5JaEU/VIi8pzwcuy0S9w
         69mr552E9KqzgM+ZZwStkW9IjIiuzt4FNTXboTpDXcD7juEXRMaY1ZpQNHkyN4//BKpY
         UUqs/oJJiqz9ziLMxUXM0g4Tcs2Nqe9WHA1QBwtuJCNM05yCnqG6dUT5fDr3/jly2V+n
         mXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789295179; x=1789899979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5H60KqbS+ROq5wCtUl6A8wMpEemlazNnMi16ohCbfuQ=;
        b=m5c5vfOg/SvN0A6Z1yDmTpysGj2dHwvN/79szkPS0ajM+RUColHOoyCnkvQ2HZjtKa
         7p6YjsuCw5/cC4fB5XVYh3TK/vU7OtJcwir9l1EkFXp31XsfwZimyJrNf3YXLSw6z8k9
         Q+C4U3T2XfpmnAYufMJE7bdPrJMVep43zzc96VI1pLIu2zitkd6ACbCdrYy7zAG+I5Gr
         wZBvmeCopQDrlOOy5JgfXvpi3h1vjh6gjDh7XoM6/pS1KI/zEA2aoniXgYhrG0/bpWyA
         UshvAe1gquhRHfFgmVb1LW/vEBeb7rUZSxPfRa04JeiK778DCIdWwpt0lCF9PjjE9Ipy
         OTsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkgyRyNJt5wALC1ZtGP+MlulvWDCp7G5DHrtFI6bbaw8evCBQAaZuU1tFcUgJapo3iA+hCK9eSc0F5rX0=@vger.kernel.org
X-Gm-Message-State: AFuF++nHDB7H84hD+o1dD/z6OzY3CNCvjuGQ2rCcfo5Vgdhn84ShOQ0l
	Q9SGp+r+eDumssHa6V99lyAZQ4rhxsH3l566QCjRI+cSG6i1NAzyVn42
X-Gm-Gg: AYBFou1qMjvV3mQgWWTbOfp3fl6qrNdWY3FxddY2qoLr9iKKvZszdPQECl8fSRqjHTf
	5te0zcKiqsdWBfoAgE2mQ5ivpoD+VRecNEjL0JP9HHrJWToKJY63ksYCnFmbfyTCA+unyKPkLrS
	yPSPi9GKjmTls1XDTtQHBz9kqCRSF2sFT1FZyfIg2RK8uwjKZYvS8FLUiaXHRLY+J0f8VWVOH5v
	AN6V5mqx/uNOyGo14sdd7s8PzBjiNZJkySiwud/wSM2FgnLxBODFWIedaoFGyfd6hy4JGagkdCH
	AXAHtB3GYBNC1m3tWeJxSlySga//D6iq2t4XKIrXzx6gexZU7s6qXCM8YHEfDxEWJX6MSPo5k9F
	+CMOTWDGV4ny8OLJpV2dQahIgu9hk4NnbpO99jMlng68e7r1eaIWHpCa/rJ4T4fSHib4Kr0rtOK
	BePk7SYhQrSHZdytXgGnokOEDMEzsAd7ATa2maGNDiMLy6cv0X77apcg==
X-Received: by 2002:a05:6a00:3d01:b0:85c:2d83:bbf1 with SMTP id d2e1a72fcca58-86ccb44e113mr10352414b3a.20.1789295178771;
        Sun, 13 Sep 2026 03:26:18 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb760sm3126567b3a.46.2026.09.13.03.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 03:26:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linusw@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/panel: ilitek-ili9881c: fix panel cleanup on attach failure
Date: Sun, 13 Sep 2026 18:26:08 +0800
Message-ID: <20260913102608.1526916-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ili9881c_dsi_probe() registers the panel with drm_panel_add() before
attaching the DSI device. If mipi_dsi_attach() fails, probe returns the
error without removing the panel registration.

Since the remove callback is not called after a failed probe, the
panel remains registered and keeps an additional reference after the
devm-managed allocation is released, leaking the panel registration
and its reference.

Use devm_drm_panel_add() so that the panel registration is
automatically removed both on probe failure and on driver teardown.
Remove the now redundant drm_panel_remove() from the remove callback.

This issue was found by manual code inspection.

Fixes: 26aec25593c2 ("drm/panel: Add Ilitek ILI9881c panel driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index c3d5ab67121d..1a52f92e2963 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -2594,7 +2594,9 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
-	drm_panel_add(&ctx->panel);
+	ret = devm_drm_panel_add(&dsi->dev, &ctx->panel);
+	if (ret)
+		return dev_err_probe(&dsi->dev, ret, "Failed to add panel\n")
 
 	dsi->mode_flags = ctx->desc->mode_flags;
 	dsi->format = MIPI_DSI_FMT_RGB888;
@@ -2605,10 +2607,7 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 
 static void ili9881c_dsi_remove(struct mipi_dsi_device *dsi)
 {
-	struct ili9881c *ctx = mipi_dsi_get_drvdata(dsi);
-
 	mipi_dsi_detach(dsi);
-	drm_panel_remove(&ctx->panel);
 }
 
 static const struct ili9881c_desc lhr050h41_desc = {
-- 
2.43.0


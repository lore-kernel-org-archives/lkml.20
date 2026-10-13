Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D033D48EC9E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866160; cv=none; b=cv0YgQs18WjxyjeEOnFnwUFKNV7AerGDhmAUCdlvDMCpOF6z50jNJrI/ReKJdEOenzPuqA36lQkurgZcThqhX+nV56cMgJprtg6e3sIZchAqK34gzhAzOtzXET95K9xnHq9oKumaRLTlY0/uW7sJLmDSPnMZP4j9rLMUhl6hjG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866160; c=relaxed/simple;
	bh=YXIz+TQf464FyqwRWctHqCwl1SrqoAwr2aZpxV5U8Zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QfhxrEaehlSaS02T6AfNVN4LZzp8pE46ep0BHc3RXlv87zMl9oMsNV3JqBjiEjkXAOV8wXHC2EezgCd8D08gC5V53C2q/qJfpWNLmVL150Ncl2Epfa85oUt9BtfRRMX4FdESdFnvWxmPDKvGZAWtd1dh2/86WHY2qHNw8LQpmIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtZEtvsQ; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtZEtvsQ"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0af2aae63so8454697b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866158; x=1792470958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWBafGepq5jprFkNrEdJl0mPwThaR4s3Yj/sMZVg9k8=;
        b=MtZEtvsQG0BfAvBw6NarN8qCWS9OCEFxnEWuwRmjV0FBTIdHZXU4Qt1bTDo4MG1GSN
         u8ru/EPL0ZwgeMGEwkhr5xq5QWaX70XlwReDKdNnoD4/7i3AC/6DWlFEmVFPzdQlHe2B
         +BTk9u2TXQyMG7axqBT0/dzj5oX0zI/pIvXqFq08j8iftHMaS5QxIaE/FweUIPNQ+KDF
         px6U+H8vA2sozu3AryKsk5tavoQmmp/jjXk5erE2pHUHD5K3OFy+TGwkeWS6ZPpCAHEG
         z0PAJzEH+HMX3W9huZSnz7yYrxa2XAoPWsNDEjtlCKGy3PrbqyGrpiw5vZyXn00OGKkW
         1mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866158; x=1792470958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWBafGepq5jprFkNrEdJl0mPwThaR4s3Yj/sMZVg9k8=;
        b=zCTZsmTSNBlcRfP2M9GApnerKLWY1H5QxAIeTypCJ0Zv/euJx5+bBuKaeZ//Z6Bx7B
         IBeaVI0mBQ2kZSzaBRDlqDjLYw66a9ll2r1lNRb/HDLoBN+q50UT4EEB3bw4LSxsmhab
         ydm48mWBnU4sVinsJFVoXhVhgFxNPA4IZDmpB8TpyFHTGRvDjtlOpMHi2jLbap2vNMCQ
         huZuVNFLVoyQXLBz4nkuLCyFPI51jZNm/J82xA/hUEg+QXx+RHDhkfEz7AzBDi8xqLE5
         OLTvv+gJCzu17ojAzhklADO15mU6AFD0eTw+eEn4ZpFlXVriT0ntd/LvHf3v34BVpFvn
         AiHg==
X-Forwarded-Encrypted: i=1; AKwUvBwvpOSdhGmBbs2erSS7e6wBjiNnZLE7ambmSoWRO3e/gRnNsm10pzkuIQ1EiaJXP0XjMw/CL9rtdQPSVnQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR948XaZfTlodaPCyr3EoYNjIc9BDaAiV8c4v+YVI2mOvMa25n
	kO8tf2QdMSAUmxr+ErSdrTaHvez+J8LeyG7v7nZSloJX3dvItdDTqrvq
X-Gm-Gg: AYBFou1DNQp7JqdklFEntLtJKLK/2MO9TV6hd7frNBPqDjH6fZKDDymq+fv4vaxr+qI
	vKtjIjxbKAbic3ZSwDNaUdrq2SVf6X8Rl+k3NyCPF5e32u3q133nVSByQBWRUkPWL+1eKW0smei
	px4xOuP5jhKGvJxSPNwuJSCsFFyMLRStyaA57DmjG8+4l1jW7cCet5FLCuAxzQzD0IPPxjSlEEu
	JO4DHBzn2BVinI0+LiGQVmsxfM2hvMebAg6JxJPhh9jmSMA35itS8jTFhECfbElqNiI2eChAQCP
	BJWqbPE/LUUyulgojtty2IeEF43dc08YBFdUo/k5ayhgAqlJbjEYo/utaRBKE9zG2BTZqQGvgns
	8VxdhWDNC7JG/aeeSkPh0M69fv00xbwinQxSH0F1PtdYy/5PNeujiJfiSut+npEfV5Ane8QwMSM
	o+L6s/gvOejWKO8aDzwu4wrG4VQnCqKHomLDHvcrp1poZIQScA8NIFo0LOQhUPbGURbMQ2Iamyd
	WdihzZDWEC4r54=
X-Received: by 2002:a05:690e:14c8:b0:677:c9c1:25a2 with SMTP id 956f58d0204a3-67958f083dbmr2300112d50.26.1791866157808;
        Mon, 12 Oct 2026 21:35:57 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67935606f5esm4448152d50.4.2026.10.12.21.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:35:57 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Date: Mon, 12 Oct 2026 23:34:39 -0500
Subject: [PATCH 4/4] drm/panel: newvision-nv3051d: Use mipi_dsi_*_multi();
 fix minor bugs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-mipi-multi-series-v1-4-6a29add1ec92@gmail.com>
References: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com>
In-Reply-To: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com>
To: Doug Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akash Sukhavasi <akash.sukhavasi@gmail.com>, 
 Chris Morgan <macromorgan@hotmail.com>
X-Mailer: b4 0.14.3

The mipi_dsi_dcs_*() functions used by this driver are deprecated in
favour of their _multi() counterparts, as noted in
Documentation/gpu/todo.rst. The _multi() variants record the first
error in a context structure and skip subsequent calls once an error
is set, removing the need to check the return value after each command.
They also log failures internally, making the per-call dev_err() calls
redundant.

Convert prepare() and unprepare() to use the _multi() equivalents.

In prepare(), use mipi_dsi_msleep() and mipi_dsi_usleep_range() instead
of plain msleep()/usleep_range() for delays between DSI commands, so
they are skipped on prior error since the function will clean up via the
existing disable_vdd label anyway.

In unprepare(), keep plain msleep() and usleep_range() since the
hardware delays must execute regardless of any prior DSI error. The
original code logged a set_display_off() failure and still attempted
enter_sleep_mode(), so clear accum_err after set_display_off_multi()
to keep that behaviour.

This also fixes a bug where a failure in enter_sleep_mode would return
early, skipping the post-sleep delay, reset GPIO assertion, and
regulator disable, leaving the panel stuck in a prepared state. Because
drm_panel_unprepare() does not clear panel->prepared when the callback
returns an error, drm_panel_prepare() would return early on the next
call, leaving the panel unable to be re-initialised.

Cc: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
Compile tested only, no hardware available. checkpatch and a W=1
build are clean.
---
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c | 36 +++++++++----------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index 22560384e48e..7dc25102a773 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -247,19 +247,14 @@ static int panel_nv3051d_unprepare(struct drm_panel *panel)
 {
 	struct panel_nv3051d *ctx = panel_to_panelnv3051d(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	/* Reset error to continue power-down sequence even if display off failed */
+	dsi_ctx.accum_err = 0;
 	msleep(20);
-
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
-		return ret;
-	}
+	/* Enter sleep mode; error does not prevent power-off */
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	usleep_range(10000, 15000);
 
@@ -274,6 +269,7 @@ static int panel_nv3051d_prepare(struct drm_panel *panel)
 {
 	struct panel_nv3051d *ctx = panel_to_panelnv3051d(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	int ret;
 
 	dev_dbg(ctx->dev, "Resetting the panel\n");
@@ -295,22 +291,16 @@ static int panel_nv3051d_prepare(struct drm_panel *panel)
 		goto disable_vdd;
 	}
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
-		goto disable_vdd;
-	}
-
-	msleep(200);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 200);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 15000);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
+	if (dsi_ctx.accum_err) {
+		ret = dsi_ctx.accum_err;
 		goto disable_vdd;
 	}
 
-	usleep_range(10000, 15000);
-
 	return 0;
 
 disable_vdd:

-- 
2.56.0


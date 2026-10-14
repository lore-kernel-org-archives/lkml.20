Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CAC5349BF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985850; cv=none; b=C1ODSWbNltotPnp05uSZJmFkPmBgv2s7HLvOhwq9KYaS12rft/yuKctUBbYyPJmff5fjF20PZUv4veId3fhcMqf01f/OJTxoFm3DuLOxFCkDibFdXB4I9sT0Tx0/nrzieN10fKfELqLsN4rGsqDa4j+BcmZhRVO3m5X54xGU0Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985850; c=relaxed/simple;
	bh=vwviTOqU7S++2QMkBIB4dchgin2HVlP3bJdPWYSRyTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9q3qPyPm2dQ3r4Ttq//PiquNDr1LKDuDkZYI0TnJLGfZj3FbJ6dOlAwa6JiGTA+9YThXLy8/f9lh1NIV7Rl9a31adUJuLZa3T8ZcUO3OVCiYPa3DNQxBaQ5Pz0/iAd+Pg7y1nhOZU6w+b+sYVeLoWrJEZUP5Tdp0G30klHUAWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vl0qhODz; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vl0qhODz"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4ca696de6so2256122a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985848; x=1792590648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=24RQVoLsUurrQma53DK6RaZwJpCvuTQH/vyoxxKrEHQ=;
        b=Vl0qhODzkgJWelo3NlSLfquvl9g8uZq1AXghQoMKBXc+D3MYxdKbauTt5wkf21V4NF
         JdvbqCMJHLMC2ZJcTuG+ADReIrqnJ+OXql8ZiY7xJgWloLiMBK5kOi91R+MMlSbImhxR
         iylWTbCafrEvoyqneA7YRpao1GyLiqlez8LJdCgDq8mOnKQZmSvNZdpm+6y+/JMlVSNS
         9a7K8TfHQs2c4HZxIxK2v1qJa1hZCrGoyCg4bRTnS5nCYzmbvfj5gJ76YRZDd+XPColJ
         YaXffSGpagxUY1s+SjszHn8s71pYVxBsW2z11Y7gYxREl05GVTeLRd69cwHUTFqGvqC8
         uTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985848; x=1792590648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=24RQVoLsUurrQma53DK6RaZwJpCvuTQH/vyoxxKrEHQ=;
        b=bUXq7vyICvejh+AbCk226C9hbgl+CNNJDVb5kVivXg3tJhl2uZ8+PDZKQyrbj2HfNZ
         CAOe+NGz3PdHxkl/aWLk10P6CYQC70RdS7Q60KSRYajeenveF56KgVwrqVjVqNr5f8tV
         GjoezpE00eCAMJTjnOQl+B1qdR00Hy1ZTv7x7eiI9BBv/uC/hUGwa2pPnlRL6qMTQ5SY
         suaJLTDiSgItwzoUQvjjinroTvqCsMicYDq811Ogeo7/xolf6wLG7XKtavoMObbLUey6
         NDRLr5L95c7eBac0apyf5nkGBBIdaKZxByQCk25IgcAgWX0cwY5AQW7UiKv2tXOd7oRq
         z25A==
X-Forwarded-Encrypted: i=1; AKwUvBw4ffTMcBZpkJXV5okXEewdGBdLb4WHZ2sRmNvW2j6CYcMhDjZKADuVy8vJbvNqn02HMsqJfo5sccFXKkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL4tD5wOb5hJS4Sy2ZAqPyjwgIuPWslYQPNsV1BtNo3VJPg5pk
	BuchfNrHdUX9GywK2EKmDW1W9+pILfRWNlt42sl/G0w/TgbB14aEWJ2E
X-Gm-Gg: AYBFou1+RrALahj+8Ll1KqFWWYX3D9Zvp8AWITR+1e8EX86PDL2IUbEOtTecCPKCooy
	L5oJ71eVwsavlt+bpQvNNtaJVVLceoQ8EsIXoF9onsPA0PdhEuwH9FMwfrVfpOslsPikLkfsA2m
	iWsVGzy84XKrmTuyJJeMhjHZTLoyfAgWUF7CCyLEI4f35axWfchkkQgem6ZFCyZGJ7fy7VEs1EK
	OgJfKFIWoiCxEABVgpFg6FmRbOijT0U87UZ2o7FCIECkGBmzqMcGuM04zlYqzdBvFYUVNkpXwOB
	gv3ub3wnyXSX65mHVE9DYXrxXFKi+gdY+Yzwx59vPvkUExN/RZ73f6GgSZp+WVk+Hj316jH/JmP
	xBDNVM8j307gupeI2G+DKVdht17A+sex2ozGdFfCUIMgCmUctxiip2QUh4JDGik68hlQkGTnj9d
	zeSCjCCIJ6jopbvznyfhH4xTpHzUf/cuyrFYor+BWVlel1Y2ulGsaadcSSzsdCLNCO9IiC5fSnr
	wGrQCPEs6gdQBiRo83Uu2A5yPJUeEXhEiav6KXtjrmf7+65d49y2AW/krD8nifIP5WUIR+HVhKa
	c3GYmEUr1ABuJIA5TlDuj43KoYEwShdYupdfSRU10G5cXA==
X-Received: by 2002:a05:6a21:3289:b0:3e1:c2e4:217a with SMTP id adf61e73a8af0-3e1c2e434a6mr5231397637.69.1791985847807;
        Wed, 14 Oct 2026 06:50:47 -0700 (PDT)
Received: from NB150512.ADVANTECH.CORP (2001-b011-6c00-3d72-751d-cebe-164a-ae70.dynamic-ip6.hinet.net. [2001:b011:6c00:3d72:751d:cebe:164a:ae70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804e514bsm1168418b3a.41.2026.10.14.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:50:46 -0700 (PDT)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com
Cc: jagan@amarulasolutions.com,
	osama.abdelkader@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH 1/3] drm/panel: feiyang-fy07024di26a30d: Use mipi_dsi_*_multi() functions
Date: Wed, 14 Oct 2026 21:50:26 +0800
Message-ID: <20261014135028.1438841-2-hungen3108@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014135028.1438841-1-hungen3108@gmail.com>
References: <20261014135028.1438841-1-hungen3108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated MIPI DSI DCS helpers with their _multi variants,
as suggested in Documentation/gpu/todo.rst. Also convert
mipi_dsi_dcs_write_buffer() for consistency.

In prepare(), the first failed command prevents subsequent DSI transfers
and its error is returned, as before. The new helper also logs the error.

In unprepare(), clear accum_err between commands so that ENTER_SLEEP_MODE
is still attempted if SET_DISPLAY_OFF fails, preserving the original
error handling behavior.

In disable(), ignore SET_DISPLAY_OFF errors to allow drm_panel_disable()
to clear panel->enabled, avoiding a stale enabled state after the panel
is powered off. This follows commit 00efe8a68565 ("drm/panel:
ronbo-rb070d30: Ignore DCS errors in disable()"). Command failures
remain logged by the helper.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 .../drm/panel/panel-feiyang-fy07024di26a30d.c | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index c1d8ca5ca6e1..24934b9d430b 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -46,7 +46,7 @@ static const struct feiyang_init_cmd feiyang_init_cmds[] = {
 static int feiyang_prepare(struct drm_panel *panel)
 {
 	struct feiyang *ctx = panel_to_feiyang(panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 	unsigned int i;
 	int ret;
 
@@ -81,44 +81,51 @@ static int feiyang_prepare(struct drm_panel *panel)
 		const struct feiyang_init_cmd *cmd =
 						&feiyang_init_cmds[i];
 
-		ret = mipi_dsi_dcs_write_buffer(dsi, cmd->data,
+		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, cmd->data,
 						FEIYANG_INIT_CMD_LEN);
-		if (ret < 0)
-			return ret;
 	}
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int feiyang_enable(struct drm_panel *panel)
 {
 	struct feiyang *ctx = panel_to_feiyang(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
 	/* T12 (video & logic signal rise + backlight rise) T12 >= 200ms */
 	msleep(200);
 
-	return mipi_dsi_dcs_set_display_on(ctx->dsi);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
 }
 
 static int feiyang_disable(struct drm_panel *panel)
 {
 	struct feiyang *ctx = panel_to_feiyang(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
-	return mipi_dsi_dcs_set_display_off(ctx->dsi);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+
+	/*
+	 * Returning an error would leave panel->enabled set, causing the
+	 * next enable to be skipped even after unprepare powers off the panel.
+	 * The helper above already logs any command failure.
+	 */
+	return 0;
 }
 
 static int feiyang_unprepare(struct drm_panel *panel)
 {
 	struct feiyang *ctx = panel_to_feiyang(panel);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(ctx->dsi);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
+	/* Attempt to enter sleep mode even if display off failed. */
+	dsi_ctx.accum_err = 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	/* T13 (backlight fall + video & logic signal fall) T13 >= 200ms */
 	msleep(200);
-- 
2.43.0


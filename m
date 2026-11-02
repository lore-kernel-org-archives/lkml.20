Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593954;
	b=LWH5gtisALUfxwLa3PLn+dhv5R6+6DfFNr5EqJWhW/sCzrnqrAsD6BgoAkS/DOPM4NcO
	 md1o3orpvHjR9NZlGirZKU9cVZE6nRanTaRFFhyJId056cTyns5CsxaVM2qPh7Q2zkA9j
	 BxRYRWBrCmg5TkhQ6Lmo646eA1bAQ2N7EIOwxPTK7cma94ZqsHqj19XR82I08dZbqJV0x
	 O0ZFt1FICfAT7LoO33rxmarCuYPXAkjqADT0WWN/V+B0pAArOjb+nzOQY8US9P5EQ1jJ3
	 ABFS8LSkCApscNhOfAfJFE1CCjQcysqFm01dZm83Oan7ha7KSb9FdVMKvjI2GedAijw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=urssvPG3HxZMZLTOqJI/oNPuF6G5AsBo3NCrXStBrUE=;
	b=MFVUob7kQT7bdFaCdD8f4IxMU34eh9IycKWyMgwYZSYyIVM+pAhek0qMAGyZJSy6uAWR
	 p/VQoSgqArytex74xKV//exacKHmgsiIdEo9jkqfIlMeG47G7kHMjJfW0Xz9X6vffWxGA
	 c51I3ALTyegn/GP1szbpOZqpMHpb4sHgnKuMidvBNo+kMwtyLN1pXkaomNy2vOIBBtKWK
	 LwoQawPsk3qhaOW9vZ3wsgAKP1ZxTSU4S5BFAKx9bp4KuEKP3t/8JOTv4SPFjob939Amr
	 SsGkKSBYm/+MWmLPamcoeiQGKcxO/w1vx2eP0yUDWQcgwGGQH0tLA26vaZIl8cIsgcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CgHQUxbf;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1097D606A333
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1097D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CgHQUxbf
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso4564541eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793593953; x=1794198753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urssvPG3HxZMZLTOqJI/oNPuF6G5AsBo3NCrXStBrUE=;
        b=CgHQUxbfWNRPTMxJhQJKO1pMtzjN18ZvowBLSruKL6kayXJ+K+59BUCN9Bq+JlkO1W
         vTlUcECRIlm+GLOFRN/rQxYR2OQHTfGkQnWRxMdwRiEXFArJmR8cojJa6xwFroyp2h+C
         ZtHUZv7Mu3oA07z6/pNsiORWMQRztm8eioYp6IjiujDeUWUYv9QhvhQCwA4mjKqMeiqI
         2BrFelmp8CYCu0MS6O/aBNwu0/xhA/JizKzsyx9iVti6tq608JjYsAtQ69WZpAN48vpN
         TlDY2X0ZKBwU7Pr0wr8qU+danOAcYaKv4ZSij9ROKQn6eIeQZ2pzYnsEP2lUUEhadlYm
         gAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593953; x=1794198753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urssvPG3HxZMZLTOqJI/oNPuF6G5AsBo3NCrXStBrUE=;
        b=cmjvGuyw+OHUf2Q3pCjLar0txk40yOUeDUeFkwJ6bR7Z1X29XD6yMLgktcfPLno4tc
         MKSK+M7GH7iSWi9ZEM4d5ytjQMCbALzPB6ym9Dei8EN5JrTHZdT3Z/wyLmiQH6pTP2Uz
         UObxEk0HKIAt9J+Eqal1dmyNzDY2m8NmeaiMA9or2TOZQTlUGvYB3kk5sEn3495stvx/
         Kd5309R79jISxW/vaMgH7Z3jIxCVhGqahPsk7p3oynohCX9BjKeQFZA5RcqQHzRWPzOE
         TWUeadTyEqGVNOtSD9T74WPWB1llHdSHDP1JmFH6qOrKqLFvILB6yn9H45FHYxmKcNFo
         J0Uw==
X-Forwarded-Encrypted: i=1; AKwUvBzMniOgaqQTgkQW4xqiItbcRw0GNqg2S75wUyP5FEsRt4/dAsxkVhdEoalqz70fQKshz6YwvyLb9qB/AJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AMb+Rnj3Pz3fZkuWjxlWLsXH/A3ZChsPnJSe8B/5stp54Ss2r
	5JXhoR+5rXbMFikv+lYRNMReKVQl4zpvJAumdN4n/KSZ5AzfrgoEQREm
X-Gm-Gg: AYBFou2JJ0U0Ep4BiA54nL3Y8gex61zxOO6wgzsE0uq9yXpfcHEYg4m2/Sd/RYmQi+v
	zpk7ks37S0yGNUsm+PVD/OeRkwWwRLLOtbwAGDwm4cHDJ6SL+0fKJGzRfJwtGIkzp4oMPEv43XR
	TxOBRGNoTHzqSzH0TVoWtgxVFdY3jjm9B1TgfMRT9lbmerT+F5zX+88PWpeIMoNiz3t+gzAQq2d
	b76yenZElVUSYGUxtQyhsV0z997pIn/J9n2qvvyXsAZ3lRYc5fW7NJmHA000LuVdbIl/l/A2Lky
	yygyvjwv3RT26p+Aknw2wHv4Azy/2yrBJFg0NTp1ozzvrj/OQ61ONOndW/s6oSKmLm98JrxnAOo
	rACl2TrJb3ZbCvkHYQHvZfKFQnji5GidpA+6jSRJxR3wiaWrIZHFfRJqES64TiJcDZ48xDKSyk1
	V5CfNmp+i5LLxJ6vDGlz0DxcVtQ32G7LkvHOzfFGJEkn9yo7CFBn7Mglw/HM4pVJEN6paL/ZIdX
	XEtPNMlqd1VZfKsOwHj/tJdG7pSlAaDGeyJJvP2dqyzaO5kNspD2ZD19/foQlCVuPCg0B4Suwht
	WjfR5DHnDFq2WaJuYTVS1auhQJvFJ+llSpwK3jnFfUgzX2wnJQheG7IBuUSk+Zg4cePnCS/nepw
	g4d/MAwD/ZWLytB75J8B3AMLcLrcDeUbEGg92zUg=
X-Received: by 2002:a05:7300:c00e:20b0:36a:2289:c599 with SMTP id 5a478bee46e88-36a4243a674mr17385958eec.29.1793593952793;
        Sun, 01 Nov 2026 20:32:32 -0800 (PST)
Received: from NB150512.ADVANTECH.CORP (118-163-147-185.hinet-ip.hinet.net. [118.163.147.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm38581063eec.26.2026.11.01.20.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:32:32 -0800 (PST)
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
Subject: [PATCH v2 3/5] drm/panel: feiyang-fy07024di26a30d: Use mipi_dsi_*_multi() functions
Date: Mon,  2 Nov 2026 12:32:13 +0800
Message-ID: <20261102043215.990351-4-hungen3108@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102043215.990351-1-hungen3108@gmail.com>
References: <20261102043215.990351-1-hungen3108@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated MIPI DSI DCS helpers with their _multi variants,
as suggested in Documentation/gpu/todo.rst.

Replace the initialization command table and loop with seven direct
mipi_dsi_dcs_write_seq_multi() calls. Preserve the original command
order and values, using lowercase hexadecimal literals.

In prepare(), the first failed DCS write prevents subsequent transfers
and its error is propagated through the cleanup path added by the
preceding patch. The helpers also log command failures.

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

Notes:
    Changes in v2:
    - Replace the initialization command table with direct
      mipi_dsi_dcs_write_seq_multi() calls, as suggested by Doug.
    - Route initialization errors through the cleanup path added in 1/5.
    - Convert initialization command values to lowercase hex.
    - Drop the previous Reviewed-by tag due to the initialization rework.
    
    The seven initialization commands were checked against the original
    table; their order and values are unchanged.

 .../drm/panel/panel-feiyang-fy07024di26a30d.c | 68 +++++++++----------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index bb4cc1ea2ece..fa304eb7453b 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -13,8 +13,6 @@
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
 
-#define FEIYANG_INIT_CMD_LEN	2
-
 struct feiyang {
 	struct drm_panel	panel;
 	struct mipi_dsi_device	*dsi;
@@ -29,25 +27,21 @@ static inline struct feiyang *panel_to_feiyang(struct drm_panel *panel)
 	return container_of(panel, struct feiyang, panel);
 }
 
-struct feiyang_init_cmd {
-	u8 data[FEIYANG_INIT_CMD_LEN];
-};
-
-static const struct feiyang_init_cmd feiyang_init_cmds[] = {
-	{ .data = { 0x80, 0x58 } },
-	{ .data = { 0x81, 0x47 } },
-	{ .data = { 0x82, 0xD4 } },
-	{ .data = { 0x83, 0x88 } },
-	{ .data = { 0x84, 0xA9 } },
-	{ .data = { 0x85, 0xC3 } },
-	{ .data = { 0x86, 0x82 } },
-};
+static void feiyang_init(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x80, 0x58);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x81, 0x47);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x82, 0xd4);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x83, 0x88);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x84, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x85, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x86, 0x82);
+}
 
 static int feiyang_prepare(struct drm_panel *panel)
 {
 	struct feiyang *ctx = panel_to_feiyang(panel);
-	struct mipi_dsi_device *dsi = ctx->dsi;
-	unsigned int i;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 	int ret;
 
 	ret = regulator_enable(ctx->dvdd);
@@ -77,15 +71,10 @@ static int feiyang_prepare(struct drm_panel *panel)
 	/* T12 (video & logic signal rise + backlight rise) T12 >= 200ms */
 	msleep(200);
 
-	for (i = 0; i < ARRAY_SIZE(feiyang_init_cmds); i++) {
-		const struct feiyang_init_cmd *cmd =
-						&feiyang_init_cmds[i];
-
-		ret = mipi_dsi_dcs_write_buffer(dsi, cmd->data,
-						FEIYANG_INIT_CMD_LEN);
-		if (ret < 0)
-			goto assert_reset;
-	}
+	feiyang_init(&dsi_ctx);
+	ret = dsi_ctx.accum_err;
+	if (ret < 0)
+		goto assert_reset;
 
 	return 0;
 
@@ -104,32 +93,41 @@ static int feiyang_prepare(struct drm_panel *panel)
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
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	return mipi_dsi_dcs_set_display_off(ctx->dsi);
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


Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6533E5349A2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985858; cv=none; b=KUwLF4wAkYDt+9UJogTFNeeqpZfdyy5QG0oXiM7ZcLaAQnRFYAJRuZu+cYkABP9P5GglfIrZtoMSrqnrJYq20KfF7bgR3QrN9YmWLp0mtrt+Wzg58uDdK/c+yEry10juzHEXC/6aUb7L5xAo0D031Jw9FOaUSAYIRl2Hiqqtqys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985858; c=relaxed/simple;
	bh=51+Kk9n6Rl5Vl26DTFHKS2ch9+wFn+KeacyVj+a8BS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRscMULINtqMBf6UxfhIYGSZJ3TnRrEcUbaCCSqpwPm+IEWVogMdAGD1q6cILR2RdrJPefN1qZXNFnMmZ5C1KiXo3pqFkmAkDCY+AjU4YZ6XGDDER/M0iUMuZ3EmV1xy9qV2I6aikM9NtuaRcvu40ZONEdoeROfiXAvcDn8rQqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgXcyCnz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgXcyCnz"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8874539bccbso260031b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985855; x=1792590655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaUwVp3Ya5wdUvPU7xx88a7pYBhQ8NFTqrTmi8kBeUY=;
        b=fgXcyCnz7hcEIY9XBrzvP4uzQlam3LJ+k5EgKWpPfHCOe9pLAeBSLpzoKU1AnQ1PM2
         VR7TtIcnyPe3iJa0X9ub6dKNbjEyuTdB8RqXu9YfY1P8pMNrHsNcRnrKUOBwLMhc4IBt
         sKn97Uf9u2rSsw3VOvh1dwJmbkat8jvd5gKITilv9e6Q1pIgd0yapw5cVlbTEbCiRiep
         Rc4yBzIPWL7tJkxzz8wnVxQu5LJHfhaJgoB60polzbJ/9tY9keu63WsTcJF9UpWgW98i
         lHTHdA/k6kR0KM8LxL8MIFnz1YuvBG28Oi6kxIYl67uecA55X3uxwN+a+0L1pNsPfbDs
         iQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985855; x=1792590655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yaUwVp3Ya5wdUvPU7xx88a7pYBhQ8NFTqrTmi8kBeUY=;
        b=ub4T0/ZezjKm1MGI0DGTT0jj+n+YLKYJrOovvGnU0VDMVSwMOBlmeP9MD2rFg2cAUQ
         cnFu4Szo1S4kjw9gvpcBwqWC0rOtjELm4rbB4pK2VGfXm6f1N+87Wi1xeBswfe/kMGWz
         2IbO9nDErKflEgLcjkYOVHylrbySDL3YPkpcBv4OPpbtBJQFHqUpOn8V6z5NVqk5annC
         wtGEn9Q84BLIoXIODoT8WE63Lp64GBPoaMvCtMSdkPoDu3xCyaMgm3WrC15HZBLLZaIY
         CEyKgWBXHCJbPdNVZTYKw7iHxi1XkP6Y4e8nvXgBaNSuqf4wT3OKyyb11wQBpS2f4ASq
         ilPA==
X-Forwarded-Encrypted: i=1; AKwUvBySHVQ39+Vl74cycipa8KJROMcje0sSrBY5393QxtRxbi0237MJpfDe9ARUSWWbsJNMFoyvfDFNoqnaf/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvOj69LhQzE1v+NmOx/dOxUWgYz4l6bevQrDliYKhXENeWx/zv
	Gin3JEyUMUXT86zxA5OK8uTsmL5nnGMBd7hQxZg+SAS3k+NeFNESoTAZ
X-Gm-Gg: AYBFou0fp5DhFb8JeVEttfpbopOKz6gSQFCBvFpWvrhG9yIXotg1Riz8//ClwGp0cPg
	NqpE5hovka6uYm4j6ix3pSzabVAoATAqFVYiHL/r43YkzRsFdci4Sy3xwO0XnQ1S7f5mprrflEk
	2FH8ReZKOZh9rjyo8yRMm8nTmiErZaHNL5s2Cwot3Fbl/51+qOTQLZ8G/gYoGXSEVZu7aCqT1gl
	nboRDoQSTw8NaC3DTNSmpn12eONQ57L+2UzC/2XD2gap408eOhTkb6xSOerq7I4KbgP/w5uhHIr
	oLE/Yj1h6BqdRM6CWnMcDqFkUJotmOgox9r0KJq6Mkz/YcZJN1tGeNgxJeu1afGMIR8vzygSyGV
	vkTVKMExb2ef9pbu6X8703v65yq1T1qRY4LGpKtNztIijd4yfy/cg3v9sFuIX1dkp03VSl0Ks5k
	rmemvler4bP+l35Xn4Frpig8Gxq1WbQEmb4CeO2yEPPKDV5RgAfkfExCWDzRnCo6oKlJ8TmNx1B
	SfqcBLwn3swVco32VTqovWAt50eUMYoz7fLIHemS7YPNutvUJ3UGy/R+/PWkF+OE+qJrOZ+i8PZ
	IvnqssHVwvxLUCdkGuJLPIoGH54QOAMaPtCm2JQkBXR4XrY=
X-Received: by 2002:a05:6a00:13a6:b0:886:7d7d:cfb4 with SMTP id d2e1a72fcca58-897c86a4052mr14416514b3a.59.1791985854725;
        Wed, 14 Oct 2026 06:50:54 -0700 (PDT)
Received: from NB150512.ADVANTECH.CORP (2001-b011-6c00-3d72-751d-cebe-164a-ae70.dynamic-ip6.hinet.net. [2001:b011:6c00:3d72:751d:cebe:164a:ae70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804e514bsm1168418b3a.41.2026.10.14.06.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:50:53 -0700 (PDT)
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
Subject: [PATCH 3/3] drm/panel: raydium-rm68200: Use multi-context helpers for init sequence
Date: Wed, 14 Oct 2026 21:50:28 +0800
Message-ID: <20261014135028.1438841-4-hungen3108@gmail.com>
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

Replace the custom DCS write helpers with mipi_dsi_dcs_write_seq_multi()
and mipi_dsi_dcs_write_var_seq_multi(), preserving individual DCS
transactions for registers that do not support auto-increment.

Previously, initialization failures were only logged, allowing prepare()
to report success despite incomplete initialization. Share the
multi-context with prepare() so that after the first failed write,
subsequent DCS commands and delays are skipped, and the error is
propagated to prepare().

The new helpers log errors without rate limiting.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 184 ++++++++----------
 1 file changed, 80 insertions(+), 104 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index 971d075bb060..a01b2db55c7f 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -98,134 +98,110 @@ static inline struct rm68200 *panel_to_rm68200(struct drm_panel *panel)
 	return container_of(panel, struct rm68200, panel);
 }
 
-static void rm68200_dcs_write_buf(struct rm68200 *ctx, const void *data,
-				  size_t len)
-{
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int err;
-
-	err = mipi_dsi_dcs_write_buffer(dsi, data, len);
-	if (err < 0)
-		dev_err_ratelimited(ctx->dev, "MIPI DSI DCS write buffer failed: %d\n", err);
-}
-
-static void rm68200_dcs_write_cmd(struct rm68200 *ctx, u8 cmd, u8 value)
-{
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int err;
-
-	err = mipi_dsi_dcs_write(dsi, cmd, &value, 1);
-	if (err < 0)
-		dev_err_ratelimited(ctx->dev, "MIPI DSI DCS write failed: %d\n", err);
-}
-
-#define dcs_write_seq(ctx, seq...)				\
-({								\
-	static const u8 d[] = { seq };				\
-								\
-	rm68200_dcs_write_buf(ctx, d, ARRAY_SIZE(d));		\
-})
-
 /*
  * This panel is not able to auto-increment all cmd addresses so for some of
  * them, we need to send them one by one...
+ *
+ * Use arr instead of d to avoid shadowing the local d[] declared by
+ * mipi_dsi_dcs_write_var_seq_multi().
  */
-#define dcs_write_cmd_seq(ctx, cmd, seq...)			\
-({								\
-	static const u8 d[] = { seq };				\
-	unsigned int i;						\
-								\
-	for (i = 0; i < ARRAY_SIZE(d) ; i++)			\
-		rm68200_dcs_write_cmd(ctx, cmd + i, d[i]);	\
-})
-
-static void rm68200_init_sequence(struct rm68200 *ctx)
+#define dcs_write_cmd_seq(dsi_ctx, cmd, seq...)			\
+	do {								\
+		static const u8 arr[] = { seq };			\
+		unsigned int i;						\
+									\
+		for (i = 0; i < ARRAY_SIZE(arr); i++)		\
+			mipi_dsi_dcs_write_var_seq_multi(dsi_ctx,	\
+							(cmd) + i, arr[i]); \
+	} while (0)
+
+static void rm68200_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
 {
 	/* Enter CMD2 with page 0 */
-	dcs_write_seq(ctx, MCS_CMD_MODE_SW, MCS_CMD2_P0);
-	dcs_write_cmd_seq(ctx, MCS_EXT_PWR_IC, 0xC0, 0x53, 0x00);
-	dcs_write_seq(ctx, MCS_BT2CTR, 0xE5);
-	dcs_write_seq(ctx, MCS_SETAVDD, 0x0A);
-	dcs_write_seq(ctx, MCS_SETAVEE, 0x0A);
-	dcs_write_seq(ctx, MCS_SGOPCTR, 0x52);
-	dcs_write_seq(ctx, MCS_BT3CTR, 0x53);
-	dcs_write_seq(ctx, MCS_BT4CTR, 0x5A);
-	dcs_write_seq(ctx, MCS_INVCTR, 0x00);
-	dcs_write_seq(ctx, MCS_STBCTR, 0x0A);
-	dcs_write_seq(ctx, MCS_SDCTR, 0x06);
-	dcs_write_seq(ctx, MCS_VCMCTR, 0x56);
-	dcs_write_seq(ctx, MCS_SETVGN, 0xA0, 0x00);
-	dcs_write_seq(ctx, MCS_SETVGP, 0xA0, 0x00);
-	dcs_write_seq(ctx, MCS_SW_CTRL, 0x11); /* 2 data lanes, see doc */
-
-	dcs_write_seq(ctx, MCS_CMD_MODE_SW, MCS_CMD2_P2);
-	dcs_write_seq(ctx, GOA_VSTV1, 0x05);
-	dcs_write_seq(ctx, 0x02, 0x0B);
-	dcs_write_seq(ctx, 0x03, 0x0F);
-	dcs_write_seq(ctx, 0x04, 0x7D, 0x00, 0x50);
-	dcs_write_cmd_seq(ctx, GOA_VSTV2, 0x05, 0x16, 0x0D, 0x11, 0x7D, 0x00,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P0);
+	dcs_write_cmd_seq(dsi_ctx, MCS_EXT_PWR_IC, 0xC0, 0x53, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT2CTR, 0xE5);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVDD, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETAVEE, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SGOPCTR, 0x52);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT3CTR, 0x53);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_BT4CTR, 0x5A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_INVCTR, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_STBCTR, 0x0A);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SDCTR, 0x06);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_VCMCTR, 0x56);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGN, 0xA0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SETVGP, 0xA0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_SW_CTRL, 0x11); /* 2 data lanes, see doc */
+
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P2);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_VSTV1, 0x05);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x02, 0x0B);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x03, 0x0F);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x04, 0x7D, 0x00, 0x50);
+	dcs_write_cmd_seq(dsi_ctx, GOA_VSTV2, 0x05, 0x16, 0x0D, 0x11, 0x7D, 0x00,
 			  0x50);
-	dcs_write_cmd_seq(ctx, GOA_VCLK1, 0x07, 0x08, 0x01, 0x02, 0x00, 0x7D,
+	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK1, 0x07, 0x08, 0x01, 0x02, 0x00, 0x7D,
 			  0x00, 0x85, 0x08);
-	dcs_write_cmd_seq(ctx, GOA_VCLK2, 0x03, 0x04, 0x05, 0x06, 0x00, 0x7D,
+	dcs_write_cmd_seq(dsi_ctx, GOA_VCLK2, 0x03, 0x04, 0x05, 0x06, 0x00, 0x7D,
 			  0x00, 0x85, 0x08);
-	dcs_write_seq(ctx, GOA_VCLK_OPT1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-		      0x00, 0x00, 0x00, 0x00);
-	dcs_write_cmd_seq(ctx, GOA_BICLK1, 0x07, 0x08);
-	dcs_write_seq(ctx, 0x2D, 0x01);
-	dcs_write_seq(ctx, 0x2F, 0x02, 0x00, 0x40, 0x05, 0x08, 0x54, 0x7D,
-		      0x00);
-	dcs_write_cmd_seq(ctx, GOA_BICLK2, 0x03, 0x04, 0x05, 0x06, 0x00);
-	dcs_write_seq(ctx, 0x3D, 0x40);
-	dcs_write_seq(ctx, 0x3F, 0x05, 0x08, 0x54, 0x7D, 0x00);
-	dcs_write_seq(ctx, GOA_BICLK3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-		      0x00, 0x00, 0x00, 0x00, 0x00);
-	dcs_write_seq(ctx, GOA_BICLK4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-		      0x00, 0x00);
-	dcs_write_seq(ctx, 0x58, 0x00, 0x00, 0x00);
-	dcs_write_seq(ctx, GOA_BICLK_OPT1, 0x00, 0x00, 0x00, 0x00, 0x00);
-	dcs_write_seq(ctx, GOA_BICLK_OPT2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-		      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	dcs_write_seq(ctx, MCS_GOA_GPO1, 0x00, 0x00, 0x00, 0x00);
-	dcs_write_seq(ctx, MCS_GOA_GPO2, 0x00, 0x20, 0x00);
-	dcs_write_seq(ctx, MCS_GOA_EQ, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
-		      0x00, 0x00);
-	dcs_write_seq(ctx, MCS_GOA_CLK_GALLON, 0x00, 0x00);
-	dcs_write_cmd_seq(ctx, MCS_GOA_FS_SEL0, 0xBF, 0x02, 0x06, 0x14, 0x10,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_VCLK_OPT1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00);
+	dcs_write_cmd_seq(dsi_ctx, GOA_BICLK1, 0x07, 0x08);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2D, 0x01);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x2F, 0x02, 0x00, 0x40, 0x05, 0x08, 0x54, 0x7D,
+				     0x00);
+	dcs_write_cmd_seq(dsi_ctx, GOA_BICLK2, 0x03, 0x04, 0x05, 0x06, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3D, 0x40);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x3F, 0x05, 0x08, 0x54, 0x7D, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x58, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK_OPT1, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, GOA_BICLK_OPT2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_GPO1, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_GPO2, 0x00, 0x20, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_EQ, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_GOA_CLK_GALLON, 0x00, 0x00);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL0, 0xBF, 0x02, 0x06, 0x14, 0x10,
 			  0x16, 0x12, 0x08, 0x3F);
-	dcs_write_cmd_seq(ctx, MCS_GOA_FS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0C,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0C,
 			  0x0A, 0x0E, 0x3F, 0x3F, 0x00);
-	dcs_write_cmd_seq(ctx, MCS_GOA_FS_SEL2, 0x04, 0x3F, 0x3F, 0x3F, 0x3F,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL2, 0x04, 0x3F, 0x3F, 0x3F, 0x3F,
 			  0x05, 0x01, 0x3F, 0x3F, 0x0F);
-	dcs_write_cmd_seq(ctx, MCS_GOA_FS_SEL3, 0x0B, 0x0D, 0x3F, 0x3F, 0x3F,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_FS_SEL3, 0x0B, 0x0D, 0x3F, 0x3F, 0x3F,
 			  0x3F);
-	dcs_write_cmd_seq(ctx, 0xA2, 0x3F, 0x09, 0x13, 0x17, 0x11, 0x15);
-	dcs_write_cmd_seq(ctx, 0xA9, 0x07, 0x03, 0x3F);
-	dcs_write_cmd_seq(ctx, MCS_GOA_BS_SEL0, 0x3F, 0x05, 0x01, 0x17, 0x13,
+	dcs_write_cmd_seq(dsi_ctx, 0xA2, 0x3F, 0x09, 0x13, 0x17, 0x11, 0x15);
+	dcs_write_cmd_seq(dsi_ctx, 0xA9, 0x07, 0x03, 0x3F);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL0, 0x3F, 0x05, 0x01, 0x17, 0x13,
 			  0x15, 0x11, 0x0F, 0x3F);
-	dcs_write_cmd_seq(ctx, MCS_GOA_BS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0B,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL1, 0x3F, 0x3F, 0x3F, 0x3F, 0x0B,
 			  0x0D, 0x09, 0x3F, 0x3F, 0x07);
-	dcs_write_cmd_seq(ctx, MCS_GOA_BS_SEL2, 0x03, 0x3F, 0x3F, 0x3F, 0x3F,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL2, 0x03, 0x3F, 0x3F, 0x3F, 0x3F,
 			  0x02, 0x06, 0x3F, 0x3F, 0x08);
-	dcs_write_cmd_seq(ctx, MCS_GOA_BS_SEL3, 0x0C, 0x0A, 0x3F, 0x3F, 0x3F,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL3, 0x0C, 0x0A, 0x3F, 0x3F, 0x3F,
 			  0x3F, 0x3F, 0x0E, 0x10, 0x14);
-	dcs_write_cmd_seq(ctx, MCS_GOA_BS_SEL4, 0x12, 0x16, 0x00, 0x04, 0x3F);
-	dcs_write_seq(ctx, 0xDC, 0x02);
-	dcs_write_seq(ctx, 0xDE, 0x12);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GOA_BS_SEL4, 0x12, 0x16, 0x00, 0x04, 0x3F);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDC, 0x02);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xDE, 0x12);
 
-	dcs_write_seq(ctx, MCS_CMD_MODE_SW, 0x0E); /* No documentation */
-	dcs_write_seq(ctx, 0x01, 0x75);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, 0x0E); /* No documentation */
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x01, 0x75);
 
-	dcs_write_seq(ctx, MCS_CMD_MODE_SW, MCS_CMD2_P3);
-	dcs_write_cmd_seq(ctx, MCS_GAMMA_VP, 0x00, 0x0C, 0x12, 0x0E, 0x06,
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD2_P3);
+	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VP, 0x00, 0x0C, 0x12, 0x0E, 0x06,
 			  0x12, 0x0E, 0x0B, 0x15, 0x0B, 0x10, 0x07, 0x0F,
 			  0x12, 0x0C, 0x00);
-	dcs_write_cmd_seq(ctx, MCS_GAMMA_VN, 0x00, 0x0C, 0x12, 0x0E, 0x06,
+	dcs_write_cmd_seq(dsi_ctx, MCS_GAMMA_VN, 0x00, 0x0C, 0x12, 0x0E, 0x06,
 			  0x12, 0x0E, 0x0B, 0x15, 0x0B, 0x10, 0x07, 0x0F,
 			  0x12, 0x0C, 0x00);
 
 	/* Exit CMD2 */
-	dcs_write_seq(ctx, MCS_CMD_MODE_SW, MCS_CMD1_UCS);
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MCS_CMD_MODE_SW, MCS_CMD1_UCS);
 }
 
 static int rm68200_unprepare(struct drm_panel *panel)
@@ -272,7 +248,7 @@ static int rm68200_prepare(struct drm_panel *panel)
 		msleep(100);
 	}
 
-	rm68200_init_sequence(ctx);
+	rm68200_init_sequence(&dsi_ctx);
 
 	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
-- 
2.43.0


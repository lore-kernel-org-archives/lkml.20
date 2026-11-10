Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302497;
	b=BAWv5Pv4HxDWxxUrStAz/mtZvKWkJba5oLezfGVGSBl82AeoiaQ7huze/qkHTAFc3HGX
	 I+4plJb15ib6+HZZ60aDcDcZUEB/Y9cJyPiXNQKeLW5VVlV20TBW13C36CrwGmpAto6/i
	 CGsI/PYn5h5wOmoHGkvF6pP7qDoIqY3PziRMRAmVBfBtRJuQJhaV9XlxhTOxP2aZZGG4E
	 3sBIQfO6HHEZB0t/GBuVXcBWLuedLLjIBo9SocLrCK9xwo79EaiVTvRpY6JH8RwhDuMuS
	 zZwmmGsOuKXkkP5QDRw5iZs41QVTSxG7kU97rIK5ztL6SFE3S0Ye+JKNxGbqn6JwZZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l1QfgrbnbtJPWPrv6Vkv+oigt5sBIAOXszw1RRjXWG0=;
	b=y1W3KGKjwshDynjNfUZ3o6Hn4y54xImN4HQs7EbRkhzH8M0J42FYxTdOPK1fdf9sHCdn
	 nDjOaUFjNSS7fLh2Nst9CVD1WKHuji/fQvSe3Xj7iPrlk+zMjo4X/ByXKnbfWDZqT8N6x
	 2815OfY45xpYYVGN7qP3jqCWlQUIdZ4Na3sfi2MBTRDcIdRkbLbzeRQMwquLS6GNY3ePD
	 RLlwdtbZGEyMJ7F1BCdyebUT7RSOSpmGJfATI8GPrjv/V87QpZoWN4PomgiwSOK9h39Hd
	 28i/rHTTfLHVEeMvHBRzN+f0H2kQ18nx/JI4svy44rzcLdIPbxtHYCYt0UJOp494g3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEJAUVeq;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB69606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB69606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEJAUVeq
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so3542018eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794302496; x=1794907296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1QfgrbnbtJPWPrv6Vkv+oigt5sBIAOXszw1RRjXWG0=;
        b=pEJAUVeqsHC7SnMjxL1z+PBFGkdPLF8o27Skhthf2MrG5pNmDc1htW+S4zufD1G+zg
         1mnl0iQb/vDsZTRxjOwq5+uHwREb4dBsQ4Zz7LYW1Jk/BKCxk/AX/7MsAL33ECmW+oBO
         g1dElPBrl9lfJkNaN3yPVcI73uC+AOXF15/m0VW+7bQfB84+BFzFbgwOBwdhjBGPb8FP
         R+SquZHnpWeS8M0/AVItgTntGRiMtf5GPpqTm+z89OrWLnepcsOJQ9MRU7kKGXjRaQ1Q
         Fxuk3o6SQwNohpyPVuPa99Xy7j7BbqXLV97JX0qJdWSPGuFd7P81/KxS6ptY9JDtFYBp
         DGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302496; x=1794907296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1QfgrbnbtJPWPrv6Vkv+oigt5sBIAOXszw1RRjXWG0=;
        b=yQAkfHqcna2r+ZdY9S6YBEJ9S8CORv6wFUEjEiegXTJM6oTmZLUR9RzXfW5CGBu5Gr
         tPa16Uhx3tPCSYL0B7uwrqa7XTRAe4mqz0V5TNkCWPXxf7oAHeVwA0rx+x3OvS2DVlra
         75SgCpVyc64jW5xMQwaYbMXa1HXSqXNz80cbSAQ14helHy8d7P1q5ml61sSOrgfB3vy7
         ZcFFmOA2Ln1AA1Im2YH8GJuGS+LolFea+G2TTL/6dfcP7yaiOnp3vTeRLthd9uwEVba/
         6URIxhAi7E3G1pZ9LCYFUB5/ieXnL8BOzeb4JqsPHKW/nLhBEIDoqsQD6M4Xn85hHGBm
         t7hQ==
X-Forwarded-Encrypted: i=1; AL+hErHNw4txLy5zgyIGHcUlCRun86JvteDT51NfeKBJAEs5tN65QMAh+V4mtKcM0HyRo5KiZ274dNrzt6DxDGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q9b1kwQR0ADDAQR5bRsJwM+FDmSgk1IqrIpm9SymM2WspDE7t
	Xk6HJdTat6+NqRmm2XdKB/wfNbeAC1yEd2nX8p2zpvmBA1yuIYRTEYk8
X-Gm-Gg: AYBFou3wYxs3dRB5/LBFVA8R5j+swrMaDws6m00zWxy0YQNQK5mya4VDOeFxD6URc9D
	+h0ZHnQpM1hHOIYrV7YuNq5Pb1thD6zWRibkXscGwqVyUBi1wtj6qlu5OM1DdujAtjy7R4Aqsic
	WP/aFIKgXOwJevTjJ/cCcosXgy789z0qpo0jTLtrx/0EJiaZ2m0Sk+xjXhQiNn+OPg/ZpV4yaMm
	lJ4udZxKz6rYWPSQELtKGIOqHo/hbaJru8MWqbEDDftVztXRZbDt9xAiuRoRUvzyGo0bh0NXWoQ
	smYopUGHscVo64UVzPHmxK/DHby0rdEBQbxMxZD6k1/dZzyutn1JLtJFa260edywucWQY8qBEMw
	FVJoPJk1PY+MvNjKpVn/fOIuo0iGKchpDTPlGi26sVNgUbdI6VQXyukc3Pp0iv8MXxKXM0RF1FH
	xnJ3CAdEQwm4HedrEKgXyGW9UKfrJ1Nx0CG3etUBeUrtu8rGEmdUdyaVZJ5ABhDnCrfGU+SbeUg
	vTnsstVqBOlxK8vlb9t8s8nlrUOvMXyaKf/E8w2rzmGMNfY4yyUjWbNaTblnfjqT9PkHnXyzDeD
	MeOSNaPolM7/r4Qrm2z0Sz8NDgFC2YmLfUHbQx7YVeNF
X-Received: by 2002:a05:7022:e881:b0:176:a225:e364 with SMTP id a92af1059eb24-1b3b6026851mr2714089c88.35.1794302495694;
        Tue, 10 Nov 2026 01:21:35 -0800 (PST)
Received: from evo.www.tendawifi.com ([103.98.7.212])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b79649sm6138716c88.21.2026.11.10.01.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:21:34 -0800 (PST)
From: Archit More <architmore303@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Archit More <architmore303@gmail.com>
Subject: [PATCH v2] drm/panel: kingdisplay-kd097d04: Use mipi_dsi_*_multi() functions
Date: Tue, 10 Nov 2026 14:51:12 +0530
Message-Id: <20261110092112.4262-1-architmore303@gmail.com>
X-Mailer: git-send-email 2.34.1
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

    The mipi_dsi_dcs_*() and mipi_dsi_generic_write() functions used
    by this driver are deprecated in favor of their _multi() counterparts,
    as noted in Documentation/gpu/todo.rst.

    Convert disable(), unprepare(), and prepare() to use the _multi() APIs.

Signed-off-by: Archit More <architmore303@gmail.com>
---
 .../drm/panel/panel-kingdisplay-kd097d04.c    | 50 ++++++-------------
 1 file changed, 15 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 893af9b16756..9cc2fa0f2b36 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -180,11 +180,9 @@ struct kingdisplay_panel *to_kingdisplay_panel(struct drm_panel *panel)
 static int kingdisplay_panel_disable(struct drm_panel *panel)
 {
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
-	int err;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = kingdisplay->link };
 
-	err = mipi_dsi_dcs_set_display_off(kingdisplay->link);
-	if (err < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", err);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
 	return 0;
 }
@@ -192,16 +190,11 @@ static int kingdisplay_panel_disable(struct drm_panel *panel)
 static int kingdisplay_panel_unprepare(struct drm_panel *panel)
 {
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = kingdisplay->link };
 	int err;
 
-	err = mipi_dsi_dcs_enter_sleep_mode(kingdisplay->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", err);
-		return err;
-	}
-
-	/* T15: 120ms */
-	msleep(120);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
 	gpiod_set_value_cansleep(kingdisplay->enable_gpio, 0);
 
@@ -215,6 +208,7 @@ static int kingdisplay_panel_unprepare(struct drm_panel *panel)
 static int kingdisplay_panel_prepare(struct drm_panel *panel)
 {
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = kingdisplay->link };
 	int err, regulator_err;
 	unsigned int i;
 
@@ -232,32 +226,18 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 	/* T4: 15ms */
 	usleep_range(15000, 16000);
 
-	for (i = 0; i < ARRAY_SIZE(init_code); i++) {
-		err = mipi_dsi_generic_write(kingdisplay->link, &init_code[i],
-					sizeof(struct kingdisplay_panel_cmd));
-		if (err < 0) {
-			dev_err(panel->dev, "failed write init cmds: %d\n", err);
-			goto poweroff;
-		}
-	}
+	for (i = 0; i < ARRAY_SIZE(init_code); i++)
+		mipi_dsi_generic_write_multi(&dsi_ctx, &init_code[i],
+					     sizeof(struct kingdisplay_panel_cmd));
 
-	err = mipi_dsi_dcs_exit_sleep_mode(kingdisplay->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
-		goto poweroff;
-	}
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	/* T6: 120ms */
-	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
 
-	err = mipi_dsi_dcs_set_display_on(kingdisplay->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", err);
+	if (dsi_ctx.accum_err)
 		goto poweroff;
-	}
-
-	/* T7: 10ms */
-	usleep_range(10000, 11000);
 
 	return 0;
 
@@ -268,7 +248,7 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
 	if (regulator_err)
 		dev_err(panel->dev, "failed to disable regulator: %d\n", regulator_err);
 
-	return err;
+	return dsi_ctx.accum_err;
 }
 
 static const struct drm_display_mode default_mode = {
-- 
2.34.1


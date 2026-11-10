Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299164;
	b=EQjldOt8N9ZIdDqCOfpLtOdFpfAYkvHgbD7cse+SmeHcHtVp1XrU/JZKtX/5uKh6h9a9
	 jnYkrnoVwc340/yKaEy2jzANMPtKq9j8drrCEWE+9Yb2sqIrw7gFVO2LVI0p0vsQFifsT
	 OJwP8NO5ooQtcgOjUUR3pRTK1a5XuE0rD3n6htieUMMiQ2XSRc0F6xBVjIcZaEEJmtdxq
	 /oYYM1twOa7qMWkXumdLma9eZiKmekjwbLZ2VhogUdV3JnaCEPdrJTQ09pwxao4g3YcCj
	 hEvkCPLobWNU6KWaHlKZv+nBtJ9uiTiPA2jPJSuWYrM6Ehz4K4rNIvB69QwVdhPs/bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BZM10ogvmfHypgTMnIoHJQjrw7Lff7Vzjvtt2LSRx4Y=;
	b=2UexNp4MJ/uBMuFmYYfQFWVX4U5gY4kD8sPd1DMfKxLUOn0m38w+pJTv+a0ZVgMmO+T4
	 OElG4sseBvfaf1FYVMtG/TfmT5E9ia/1JBHQH8G6/JTLIL1ILtGsrqq/o6+lgOor7gleg
	 r9CJFzA/d0sGo6YpoyzA0K58idRIg8Yl3R37KIK6mTvnXfoJqdtGP0na+LhXS0xZQXFHi
	 O7WhPbrcG7dTFrqSZKKsFmklCvCanf3lfGU5/lruLnX021EYjoRXnAyEkJHxCU1dYJ3iU
	 7oI/szTjLkJCGaP93ZpaFdb+357Cru5+A1ydwM5PBuPhqlQZJTNRklewDqn8BqloodA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qf6WHmbe;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55881606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55881606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qf6WHmbe
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3b4944abeso784341c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794299163; x=1794903963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZM10ogvmfHypgTMnIoHJQjrw7Lff7Vzjvtt2LSRx4Y=;
        b=Qf6WHmbexYfmJbnp+Igmo5CMKZokdwINVJgcNSI+7ElzXPrIrFa0PjHNSjj9E8u2uZ
         Zy2A2VD5KENKGAdSpmZrGOK8i85YLjhAgqVD4YS+co/jefmttHyQFnn4iPaltjlxlMYd
         i8B4OHfJ02FjCrTKA7dUaaxqGso+yDD5q7TgoaQJe8sxuK2Y7jVBBefB/6KpXxE/YTvO
         VJS3y/hGeQDvVd+upCktEdNu0d5cCi+OV0o36f0rFCgcxTHypaUczO3SbG/6Z8HG0Gpq
         GqmhK5S4spHregIYTk1kFtkkXB2H6/nbV57nvq3H+ms4c0b+Si1sRv4qDDJL1polqZGf
         5tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794299163; x=1794903963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZM10ogvmfHypgTMnIoHJQjrw7Lff7Vzjvtt2LSRx4Y=;
        b=ycE8SQPq8e+pJZYuetKfM0EuqkQZJyh4ZdWhGRbzGyw47vJlk1azBjx1/yLb0mJ1lX
         fxV/r7nbH9aKvfnoPnwMy+F1JDiVubK3EiLf+o053tjIcbErx4c/0iGGSiy0rrKr6IgB
         HQeMUyVsG24BtbNxMvdEMXkFzqeciUpcd2jLrXI0k7fhpOSzh62DfAhyIOR8aYqgL7Ge
         nLpczou6jHMBme6/dIkTKXUqayx2rq7YFNKG/+/ZMKcTn5UEupSHXmj/+sDGdIs/hZ1O
         OJKrkpH+H5ipHWuu2mNBcXso7KFWQ4yYhgx8uXUHgiDWjFNTijwgIg/aCso+VE+jeSP4
         oAeg==
X-Forwarded-Encrypted: i=1; AL+hErFjvWr+DTw8pRnBuD+N99XazOGIL+Mrr0KuKnITpJJKEVDw8l/k9zdPjfsgeY53UbLCqECZv4h7mdfu9l4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lCSOEJzWF27XDYDWAGJxE/9Cy+fVAU++YMd3ZyAHiCauLV0pb
	qhXVBiOQyx9bu6gQI+Kw2rkec3leT3huz8msi5q/WGMJ1m5rXtTQ/mQS
X-Gm-Gg: AYBFou2YZiLxOycGmONRLIGSxIKqRohMUfNZjqPvoqc8Eq88JPq0DDGk1K62RByJpaM
	Z17zLs7LwY8NuyqfqGB0YUI6PlY7uyXnhZ2n8/dFG00YcDJBIxO3jjIe/Kbc3oF2d+/3GXeUGmP
	bH3T+I6oIy9U3Dr7ec3UGkmZuwJsxkJVv7s6zNhyqOqTd1Wcu2ONbMrfwD64GKdlsMVXjJyhTPD
	97nAuk1Lt8fHS7NpKC15opDjZXM1WSLbq8EGwi0kYvFzFwY8DPMW7zzalJ3YNFo7yVQPf4JIQhf
	D4R2Gr4cY9KxGhXigE9T3ra8kWLSzBzAYECKexXBzgaXpuN852iK+M4kJXIY1jHsVjiICbjWHPo
	G1EqWiDGU8gYSlbaYGt8Ou6c+PTf2rjegUe4FMZqnZzXwSJx1/2vZ0PcvB3jnyOrBxNffW0ThKh
	//g45oJ/xRIoC/2MJxy0tg+DoiX0uN8qyCZINMWRahueaeLpVmgLrQJ+W/Q0xi9QcjXxz2MtGRA
	0ck7176eSg4XunHOQnaKCU4Lvql15MG7XLoZz4E09N5TU6L6Hxt0tsPZmkYsnooVXoPPNqylcHI
	SG7wbOJFlTJ1HfZLBCiiUi+BkgdxcHLhEcKAnCMAOD5CY/eMbTyWDsk3QdLp6rCckR8=
X-Received: by 2002:a05:7022:f8c:b0:1b2:42eb:7e11 with SMTP id a92af1059eb24-1b3b617291fmr3990564c88.26.1794299162848;
        Tue, 10 Nov 2026 00:26:02 -0800 (PST)
Received: from evo.www.tendawifi.com ([103.98.7.212])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5ba8426sm4680261c88.23.2026.11.10.00.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:26:02 -0800 (PST)
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
Subject: [PATCH] drm/panel: kingdisplay-kd097d04: Use mipi_dsi_*_multi() functions
Date: Tue, 10 Nov 2026 13:55:35 +0530
Message-Id: <20261110082535.7998-1-architmore303@gmail.com>
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
 .../drm/panel/panel-kingdisplay-kd097d04.c    | 54 ++++++-------------
 1 file changed, 17 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 893af9b16756..01f5a96f1cfb 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -180,28 +180,21 @@ struct kingdisplay_panel *to_kingdisplay_panel(struct drm_panel *panel)
 static int kingdisplay_panel_disable(struct drm_panel *panel)
 {
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
-	int err;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = kingdisplay->link };
 
-	err = mipi_dsi_dcs_set_display_off(kingdisplay->link);
-	if (err < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", err);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
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
 
@@ -209,12 +202,13 @@ static int kingdisplay_panel_unprepare(struct drm_panel *panel)
 	if (err < 0)
 		return err;
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
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


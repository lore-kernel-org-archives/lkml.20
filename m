Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFDF489FD7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866158; cv=none; b=n0HRtlLqRp7L1ngJyZeNUP3QOtpPIsq7rYTow7/68X7RycpoA9yla3oOqo//2GxMXChWmQwRxbyuOzXQZ40kDT/roblJMA1NR5QsXgshbVnLnyqNSHM3kA5y6uYkT3hnKGKcBuHCEnSepp/wSVQCSPlKRhh3AO6JBNNqdKZoOQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866158; c=relaxed/simple;
	bh=//LcL1xqjPVkCOLLpsPJFTILykqsFQnFuS0riVpsfCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usmMruhSJtgffS+bSvf1ql+aVpjnJHi9z2NSTvYFdi5NSmIAOFVEcQg2A6UOmQdR0JTK1zihWiyHDAQ28d13d2sQWCti/KpEJVQAj13wWUUIipjTv/QtNRHeDU3oxB/SgoV5RX69dFsMiZp2CEYSfVAGgc+qoiijZ8QJdu8iyf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivYSVD7F; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivYSVD7F"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0703011c2so18015817b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866154; x=1792470954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q79SjJi9kltChZ7QmatqFZHNr8QyYnXQCrfT5+1Exbs=;
        b=ivYSVD7FE3TbROGxHzUxKFxskTxe7kUk6koJgyUJ1J+r8tkM2pLiO60+/ts/11mWSx
         +2dJDmsMTrbUiTdDQKZxefB54CyFmoNV9Nn2HqfPBFQ7SUCng2eEt07bNmPJWJ3FiV+e
         Sq673kZnQdaYbqvFVD4Wl8x1hmGzFptxzxglJxiwMbD2TZjQCyYnhwcIb/qatKXiksZg
         Cm43Pv3TDJUceY8Z2+pkp1ndr+giVTEOd1/YgEZpBYL4XMzRyy0jca/vHe6b8TpVFAH4
         YQ0XOgNyvDm2TOI55R54I5tlbvfwkVxjrPMmPjqQHQnxlYw9sThYOMhimDQ/7rl4CWTU
         p3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866154; x=1792470954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q79SjJi9kltChZ7QmatqFZHNr8QyYnXQCrfT5+1Exbs=;
        b=XVSz6VR0xYzMtQapUEQJ0OUEx1W0z4Gs447i01iE4oJISzVJVuflPaS1JHci0oWBO/
         8MLHVRaSaDSRss0PB7TsmHQQs3vq2UuVkTIzZ+5jf6AtCzT7+V61RkaSagXBoPH7gigi
         6sjHp4JX8CABKxODxjxpCTPkWLh9XW0VN129wy/DqdVnzmx7BL4oIpBRNzl8KBqP1SeK
         lqasIjKimZggf3CHHNygBvziVjSQr63/YgjxeSH/ig6bXcukau4d89dTfRQ7Ur9RSrGD
         CfCe7yNWBNkpK/9i+iHYq4aDesScJRqZuLahVlxP7ffPjbdF87b/+/Qv20Mjn6Ll+C57
         Yxfw==
X-Forwarded-Encrypted: i=1; AKwUvBw9wc+BYoq7IaWXbJMGDyHzhMw9FLVQ+HgztaGO4ikZD7hrYNqXZGk0igqB3zkzqYsXWt5okCR7WiwDt2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBMh06gzN6YiMV5JYkkLlJAFxGV9+Jx1UFGrEgPSbgpzEaTki7
	umSU9Zo0LRcFVs2K0S+PTq3iemplzWXuVK0h8LYla/BPtGDznEnGwG65
X-Gm-Gg: AYBFou0axdn6BCY23+LefWO16rWUyOyxEsQtmuiernqa7OgDZqwlPxJwj/R61LQrgun
	nVth5kf5eDDj4zHXoyACCkij+VaPzLWO0v9Q8HrOHF+KSThyAfUH//Vw3y5EjP4qWxMSJ/P+4tG
	9y1lYXucFZ+3RNI4oh63iRNYwl1RsI/sU/uj/DtIpv3ccOefSQ/Yg0mWdAkwxBjv2XfdsxOhLHF
	TbMz1OWRhwnofKHJac0agVwvvl/So4HAri7/kX4uUdjR0mnInUsPhUTmHzIjgNFYq2nvgXnnNRU
	tf05F8K1iX3Ljq1h4ozmm9+QE+QHu3g7Oo1iV/2pclUkA2JoXrprrUZ+h+ywjOxKPpw2oRYqt9l
	emHOBm+vI0/VwftKY1fsMo4KgtnVaOP8QQpZuTJ+xPvj9AglzXGhmCrQAqD9F2VDvTOaxFwgdXb
	TModK85RfQfiVSgOn+bf35c4TT0FzbP4h3+OUDzM9NBOs4U6nNTbhmtu/l5vq9ecTZnzk6aFLbI
	+kDlKgxUcvpkw==
X-Received: by 2002:a05:690e:419c:b0:671:c5e:6d5 with SMTP id 956f58d0204a3-6793678dd2amr3782267d50.4.1791866154340;
        Mon, 12 Oct 2026 21:35:54 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67935606f5esm4448152d50.4.2026.10.12.21.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:35:54 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Date: Mon, 12 Oct 2026 23:34:37 -0500
Subject: [PATCH 2/4] drm/panel: kingdisplay-kd097d04: Use
 mipi_dsi_*_multi(); fix minor bugs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-mipi-multi-series-v1-2-6a29add1ec92@gmail.com>
References: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com>
In-Reply-To: <20261012-mipi-multi-series-v1-0-6a29add1ec92@gmail.com>
To: Doug Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akash Sukhavasi <akash.sukhavasi@gmail.com>
X-Mailer: b4 0.14.3

The mipi_dsi_dcs_*() and mipi_dsi_generic_write() functions used by
this driver are deprecated in favour of their _multi() counterparts,
as noted in Documentation/gpu/todo.rst. The _multi() variants record
the first error in a context structure and skip subsequent calls once
an error is set, removing the need to check the return value after
each command. They also log failures internally, making the per-call
dev_err() calls redundant.

Convert prepare(), disable(), and unprepare() to use the _multi()
equivalents.

In prepare(), use mipi_dsi_msleep() and mipi_dsi_usleep_range() instead
of plain msleep()/usleep_range() for delays between DSI commands, so
they are skipped on prior error since the function will clean up via the
existing poweroff label anyway.

In unprepare(), keep plain msleep() since the hardware delay must execute
regardless of any prior DSI error. This also fixes a bug where a failure
in enter_sleep_mode would return early, skipping the T15 delay, GPIO
deassertion, and regulator disable, leaving the panel stuck in a
prepared state. Because drm_panel_unprepare() does not clear
panel->prepared when the callback returns an error, drm_panel_prepare()
would return early on the next call, leaving the panel unable to be
re-initialised.

For the same reason, stop returning the regulator_disable() error from
unprepare(). Returning it would leave the panel in the same stuck state.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
Compile tested only, no hardware available. checkpatch and a W=1
build are clean.
---
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 53 ++++++++--------------
 1 file changed, 18 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 893af9b16756..bc25ce1ce4a7 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -180,11 +180,10 @@ struct kingdisplay_panel *to_kingdisplay_panel(struct drm_panel *panel)
 static int kingdisplay_panel_disable(struct drm_panel *panel)
 {
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
-	int err;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = kingdisplay->link };
 
-	err = mipi_dsi_dcs_set_display_off(kingdisplay->link);
-	if (err < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", err);
+	/* Set display off; error does not prevent disable */
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
 	return 0;
 }
@@ -192,22 +191,16 @@ static int kingdisplay_panel_disable(struct drm_panel *panel)
 static int kingdisplay_panel_unprepare(struct drm_panel *panel)
 {
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
-	int err;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = kingdisplay->link };
 
-	err = mipi_dsi_dcs_enter_sleep_mode(kingdisplay->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", err);
-		return err;
-	}
+	/* Enter sleep mode; error does not prevent power-off */
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	/* T15: 120ms */
 	msleep(120);
 
 	gpiod_set_value_cansleep(kingdisplay->enable_gpio, 0);
-
-	err = regulator_disable(kingdisplay->supply);
-	if (err < 0)
-		return err;
+	regulator_disable(kingdisplay->supply);
 
 	return 0;
 }
@@ -215,6 +208,7 @@ static int kingdisplay_panel_unprepare(struct drm_panel *panel)
 static int kingdisplay_panel_prepare(struct drm_panel *panel)
 {
 	struct kingdisplay_panel *kingdisplay = to_kingdisplay_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = kingdisplay->link };
 	int err, regulator_err;
 	unsigned int i;
 
@@ -232,33 +226,22 @@ static int kingdisplay_panel_prepare(struct drm_panel *panel)
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
-
-	err = mipi_dsi_dcs_exit_sleep_mode(kingdisplay->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
-		goto poweroff;
-	}
+	for (i = 0; i < ARRAY_SIZE(init_code); i++)
+		mipi_dsi_generic_write_multi(&dsi_ctx, &init_code[i],
+					     sizeof(struct kingdisplay_panel_cmd));
 
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 	/* T6: 120ms */
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	/* T7: 10ms */
+	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
 
-	err = mipi_dsi_dcs_set_display_on(kingdisplay->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", err);
+	if (dsi_ctx.accum_err) {
+		err = dsi_ctx.accum_err;
 		goto poweroff;
 	}
 
-	/* T7: 10ms */
-	usleep_range(10000, 11000);
-
 	return 0;
 
 poweroff:

-- 
2.56.0


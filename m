Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD928486652
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866155; cv=none; b=sJBXueW0PzGTECnWC5ifaJPVTbvWNMj2MjjL02rfRcjoqYKKf8RoLHV1PkaoE1qk5EVsCZPNWDnzw629ymDtWa/YMA/4DCncv1anBbhlM3KmoIwazC542Ek77sQt1TO7w4uV10aa5hndnh9XAeCGu2q/iDlgSJZE2FcCvdbwLO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866155; c=relaxed/simple;
	bh=d0QbgtI6OjDOLku4uBwUkCcL3A8R57cJePFpHOFpApg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RiJhG5lzqo0ePNTiJtcwr0C3IKhUIJ1bS/1HKA4YCKIJo9ERHa2+01O/9pAvkWTXnvdyxPL4H6dQN/cymHQ/A9+zlMN+8kkNMhks9bOw39ce9UcJEZSQIAbs9jPJAG4/EhhHR59S0lqQyMzH/rPS+XAuthYmAj3InfOJ+7TnoIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egutVQjd; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egutVQjd"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67699afea08so1638215d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866153; x=1792470953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJYJafIRYHrf+Y6ybXa+ws4RGB1oa5Cfi7dRuSbb02U=;
        b=egutVQjdypYkEHXfQCstrfDwfD+ZVB+ST1/A8k76DjMBzOPXV6ratkvjmy/d54tKix
         5Azj1ZG/n63lPEmYTNri+ahStYSAf8009HH9aUYiktsyh5xsDmItrlhKRDANKy/ESBfu
         vxUh5giHvzus+RzYR/KaVRsVFZ/mUu8NlD5Po2ZPmnsbnNi97UeP07npKaaQgKjh2fxU
         JhlxlfwBJntTH4KsZpVwl56LdAarU7h864iblgZ0BxxxfQWql7Vds9oIr52Am0LjMvUG
         YBdK0TzBSkNQnwe2AVnju94sHMJ3LDEp2ZAr0IvxUt9EVC/0PpbqEfPK18ECQuJrQXJQ
         uiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866153; x=1792470953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZJYJafIRYHrf+Y6ybXa+ws4RGB1oa5Cfi7dRuSbb02U=;
        b=uC7qkBorieUSnJDlN5fayyPjUWE6I+BFpGz9CTNC8lpPbZOKj9HQQnJpSHiB7EisTj
         pI2wbdReGobw0b0gKPO56ktr5Sc13LQAamQGkRrskYAhYzY5UlxaY0cR2aYRjRR6G+YU
         spP+M4g21RLTPwDQ/y1y02rov29faugdg+KAjtllzLi8UJMNXuZxCN0UEqgPcKriSDVz
         2oasE4K48wk/dWtuTKaj7okq72Qof6XYtE6L4BpgvMHj9tiPP7bsMKB5PdoZV07CSeRW
         Rz5WWiFZpjCdOXF+tmDxnu2I3giGAVIgmNRk/4C9Bljx/1t6kcvdUFFuhuZIWp453kfZ
         K7nA==
X-Forwarded-Encrypted: i=1; AKwUvBxBKOkFYmZE5jCkMfNuCq1W+RDI/h3+hOFsnjZvxYLXva4xA8OlxnzA7GQ7GlaSYJjGQQhKEyoinKjsptY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr5cJM5aWtLI475AYgGkD1ZOgxist7JX3jbgxghubMv78MKWMX
	z8NFrlRYsbNL5LhIPVbuvLbX811cg6dVNo70V2mTW6klAYWjn5/Oey/J
X-Gm-Gg: AYBFou1SBk04czV4ZLuSildUPtYCNOzmVIBPRGuJFTwsti7cJgyfe0SJQdRwGDcE+zh
	fpJtrJ31VMTBXchPpk3PACd5ejvIU5w5C41pCyzIqCiXnkEyV/Cf5UwxVDUpwJ6pLyj8Nogiy+Y
	j/daTtW1cppiXnSq70nUJMTy2+J0i6+yliuwTgShvqbC/ghFolLvcHggICLaUXo7pW8r95a9Ap4
	cl1GLtJ+pFKh08pzP2cPNPNFSsKucxNYH0xhcyeut03elSSZ7oA/NNy5H4mHYcORlGqZsGD477T
	GUOgeO1ZrvDZ68ykZ4YMHVvtA2xA+NA7xVKNawCUgSLh/7HFU47ZWaF8owGAvOsocSJUl4Jsifd
	jVmLIzH5yvgFP1YIgxS82idKQvEx3/xSyYZ+bwsoxltQSr5kICEXZmdJKi9X92tpHGyvRfs4q2T
	bT/PN9rEjS0nnHYHlGFnuaSPD+3dIS18NbDw7TfHiHDraXF+18RpcJMZPuG1J6nMsQvXVOZ9zqs
	nojFTDZz9+pqw3pSAS6ovn8
X-Received: by 2002:a05:690e:e8a:b0:677:ceec:5eac with SMTP id 956f58d0204a3-679362efcc4mr3015665d50.107.1791866152700;
        Mon, 12 Oct 2026 21:35:52 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67935606f5esm4448152d50.4.2026.10.12.21.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:35:51 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Date: Mon, 12 Oct 2026 23:34:36 -0500
Subject: [PATCH 1/4] drm/panel: leadtek-ltk500hd1829: Use
 mipi_dsi_*_multi()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-mipi-multi-series-v1-1-6a29add1ec92@gmail.com>
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
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.14.3

The mipi_dsi_dcs_*() and mipi_dsi_generic_write() functions used by
this driver are deprecated in favour of their _multi() counterparts,
as noted in Documentation/gpu/todo.rst. The _multi() variants record
the first error in a context structure and skip subsequent calls once
an error is set, removing the need to check the return value after
each command. They also log failures internally, making the per-call
dev_err() calls redundant.

Convert prepare() and unprepare() to use the _multi() equivalents.

In prepare(), use mipi_dsi_msleep() instead of plain msleep() so the
delay is skipped on prior error, since the function will clean up
via the existing disable_iovcc label anyway.

In unprepare(), keep plain msleep() since the hardware delay must
execute regardless of any prior DSI error. The original code logged
a set_display_off() failure and still attempted enter_sleep_mode(),
so clear accum_err after set_display_off_multi() to keep that
behaviour. An enter_sleep_mode() failure was also only logged, and
that stays the same.

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
Compile tested only, no hardware available. checkpatch and a W=1
build are clean.
---
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 40 ++++++++--------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
index ff35b62a327e..ee65506477df 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -489,16 +489,13 @@ static int ltk500hd1829_unprepare(struct drm_panel *panel)
 {
 	struct ltk500hd1829 *ctx = panel_to_ltk500hd1829(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
-
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", ret);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	/* Reset error to continue power-down sequence even if display off failed */
+	dsi_ctx.accum_err = 0;
+	/* Enter sleep mode; error does not prevent power-off */
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	/* 120ms to enter sleep mode */
 	msleep(120);
@@ -513,6 +510,7 @@ static int ltk500hd1829_prepare(struct drm_panel *panel)
 {
 	struct ltk500hd1829 *ctx = panel_to_ltk500hd1829(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	unsigned int i;
 	int ret;
 
@@ -535,27 +533,17 @@ static int ltk500hd1829_prepare(struct drm_panel *panel)
 	/* tRT: >= 5ms */
 	usleep_range(5000, 6000);
 
-	for (i = 0; i < ctx->panel_desc->num_init; i++) {
-		ret = mipi_dsi_generic_write(dsi, &ctx->panel_desc->init[i],
+	for (i = 0; i < ctx->panel_desc->num_init; i++)
+		mipi_dsi_generic_write_multi(&dsi_ctx, &ctx->panel_desc->init[i],
 					     sizeof(struct ltk500hd1829_cmd));
-		if (ret < 0) {
-			dev_err(panel->dev, "failed to write init cmds: %d\n", ret);
-			goto disable_iovcc;
-		}
-	}
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", ret);
-		goto disable_iovcc;
-	}
 
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 	/* 120ms to exit sleep mode */
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", ret);
+	if (dsi_ctx.accum_err) {
+		ret = dsi_ctx.accum_err;
 		goto disable_iovcc;
 	}
 

-- 
2.56.0


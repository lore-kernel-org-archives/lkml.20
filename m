Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB428534451
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985853; cv=none; b=fycFtq5Xq9FscEJbR6CtxEp5q4MVoeh8yYsGb2YJnreROv0TgWD7QxJB726abJm5XAP8QhY0o1CUBnnWYf+Beh2Eo6aFCihZXih4eKMtbYwdO8m33L9nhG1ZZAg/JRa/qTdnJ7Udndlb+kYCtpVhkVe36dBM4dNIHbcu4b7s81I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985853; c=relaxed/simple;
	bh=tu2tYZzl9bAVy42LPDn/IsMLcN0GmWFX/zfgksuzl3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g05NfQYc937As7UuqKUe23iJdEVgWYF4Fk5+fnJnqJ+o4vp63q8CyjWcQgh1gcbeH32DwgbQYnIY3LjyE6M/3QM7lB5dQwj5tF8Onkw5xYmTlgk4qwIU+qletUHKjVccr+zGKV1U4tF1Rp0wGNh6hTrfurQG8KDqP249I6vmIcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cehHIxQt; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cehHIxQt"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-887fb6c0ad1so180436b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985851; x=1792590651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9N60FEJPn+sUP2TONC0z9cgEmKUwGGHP2BKqTLaIgb8=;
        b=cehHIxQtkhAr0hkuAtJndKSiyw8t+Ae9ZO+W2CUQVxrllp5GMOzQnuOl7B57Hq4Dlr
         4LreW54rpSqOBG4e6ZwfqhCfy4NvqvPcVQuqiPyi/4hJ9UGfuOSViUMOkLn/McPQxE35
         dKHMtI1p23klegd/ZHXtmlvHkMWroIK10hJCUFrTv6Dn/DF5y4ReNLNiM8TOlvdnKEFK
         +fNi9saH/ERj3ljOFgB1GHEaGJgEqjGqB77KxUaYDwGXeTLEikcj5UBdinGBzux8k2wc
         KTqUvgseM+ShVKd03cTPNaYNsWzggkDHzsjJs4v09+XTATqWs71muoZOSNWx+4awRrle
         /olQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985851; x=1792590651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9N60FEJPn+sUP2TONC0z9cgEmKUwGGHP2BKqTLaIgb8=;
        b=VIk/9dwx/V+7MV6SPJl8JDXjkxtYJ3AxkQF3yVtMgTD9wLaqHM1WeknQ5jrmG1FyM/
         jWAM+dzvosNo0XRQxG3i569XMS2rJmkdtZ0LhN18Vzm3j9Ni5hKyT2jxLCwlVloS6KMQ
         Ur5LYK537oT6cUaI0ML8ceWyEoRHniuxsQHDHt/eeAC/xMrT8CmgGt+AVB4erdRfoJJ9
         ZYe2L/0zbCh+NzITBvrdwYfwXZaPJW9aZNiLX4T7aZXXe37cVTsvmomIeIyQifR2/IfB
         NYwcYuIqT/4fYVtGBrJB0/K1ZaC+RQ9xDlwVVGNCJZM8pb1BJwYrBNKB6SDkyZNGGBv5
         W7Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzDES1I58pMqURGSz1TJc/sidFSYuIiACJ0AZjW3EJWNiouzTdXvSVfWNu89Xb5S8WoFTwTUSve5rNjuD8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHmHZq8r7ixdDL9Iuo+V7W5r+oLg2SD+Hq4ldGjvCAinWWHm/D
	mkM4h6kqwrMqe6ZicCoQokp2jQO6ivtMzSpPgUJ1zwZsp/aT/tFUhfeF
X-Gm-Gg: AYBFou2CQL37Oo5KLfpdyfa512imFpuYyt3JiSTmkFY/moc5XTAXUw0gfl1at7EaHcu
	pOfTj6qzaJ/XA0lvmBJsbjbmVbFULiKmoHkE5drSCXBS7XJARf+adOkMILiYN4fG+chwTkPWFYE
	NxSur4uMkAr9HJtxwwisvYrytCD68JaRmgI40s6djyD8pN0CsqQNsilRZG5/r0gZym2GNX2csnE
	y4kzzOoTIPkTHXY5rQEoimfTbjRNL1XwbpcxxAe+92zq6FOo6b5iOvYIHetA2rxMhhu4eoVarg+
	1GUrAVfuk8bEx/oLoYiz3NLHL3SfWdAD+/D9iOV7f/1xcrzvkVhyS8r1k6TpFy6JFagh38k853z
	9ZFqx+glRc2m+YGVN/oVgGhq9ZI8zGlGzMg6YxnYIFTYb5sQdDNBrHD4I3mBl33yKdpSPn/PxHN
	eDNjjQMDcCg66l9Xj0pmVAs93a+sT7lY0gpsrYJsSBQBqajy6/Fk0IE7RVKior+KTAx2LOZeolh
	1RkzAVbqnQnXb2NnO3aRscRObgKjKgBPNQPFKxbw8fYGty0JPD3fPtj5ACMzajbE4PMlHyDnaI7
	BRuskyS9ldnv2lgC/V+mDFyB78ugVsvas7BXT00XfSFAVA==
X-Received: by 2002:a05:6a00:928b:b0:882:26ea:cd56 with SMTP id d2e1a72fcca58-897c73f3112mr13158156b3a.35.1791985851084;
        Wed, 14 Oct 2026 06:50:51 -0700 (PDT)
Received: from NB150512.ADVANTECH.CORP (2001-b011-6c00-3d72-751d-cebe-164a-ae70.dynamic-ip6.hinet.net. [2001:b011:6c00:3d72:751d:cebe:164a:ae70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804e514bsm1168418b3a.41.2026.10.14.06.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:50:50 -0700 (PDT)
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
Subject: [PATCH 2/3] drm/panel: raydium-rm68200: Use mipi_dsi_*_multi() functions
Date: Wed, 14 Oct 2026 21:50:27 +0800
Message-ID: <20261014135028.1438841-3-hungen3108@gmail.com>
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
as suggested in Documentation/gpu/todo.rst.

In prepare(), use mipi_dsi_msleep() to skip delays after a failed
command, preserving the existing error handling. The helpers also
log command failures.

In unprepare(), clear accum_err between commands so that ENTER_SLEEP_MODE
is still attempted if SET_DISPLAY_OFF fails. The helpers now log failures
at error level instead of warning level.

Leave the initialization sequence unchanged, as converting its write
helpers would change error handling. This is addressed in the next patch.

Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---
 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 27 ++++++++-----------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm68200.c b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
index c535dc931903..971d075bb060 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm68200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm68200.c
@@ -232,15 +232,13 @@ static int rm68200_unprepare(struct drm_panel *panel)
 {
 	struct rm68200 *ctx = panel_to_rm68200(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret)
-		dev_warn(panel->dev, "failed to set display off: %d\n", ret);
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret)
-		dev_warn(panel->dev, "failed to enter sleep mode: %d\n", ret);
+	/* Attempt to enter sleep mode even if display off failed. */
+	dsi_ctx.accum_err = 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	msleep(120);
 
@@ -258,6 +256,7 @@ static int rm68200_prepare(struct drm_panel *panel)
 {
 	struct rm68200 *ctx = panel_to_rm68200(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	int ret;
 
 	ret = regulator_enable(ctx->supply);
@@ -275,19 +274,15 @@ static int rm68200_prepare(struct drm_panel *panel)
 
 	rm68200_init_sequence(ctx);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
-	msleep(125);
+	mipi_dsi_msleep(&dsi_ctx, 125);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret)
-		return ret;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	msleep(20);
+	mipi_dsi_msleep(&dsi_ctx, 20);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int rm68200_get_modes(struct drm_panel *panel,
-- 
2.43.0


Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29965368D47
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790815853; cv=none; b=VhpmhzbJC1DHN21gnA0Aa+JAJqSrBnHXtEaxakRtUV/xCGEGL0zEWoIkkEbRuhojuUxZLKutCfxqrqAxMGy5p9PdlIiFJ53NOdebVk/CNDHbV5o0s1YhnPIWIgigwgWAVAe0eGu/qgZOl/iJ0NmfahOLq/ndyuY7oim4bh5m+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790815853; c=relaxed/simple;
	bh=QYUC4uyzYSIZKc3Y9RSNmVV75UIvAUJr6HbAAtAFuQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0DLix6Xs/2hz0vzSuJwWYtVb07mLGY9ZhncfhaM8/EJeRGgRXcRjccl9T8Wuxk6iF1Br0ohZlFK0Q0/AUdl9eDM+QmbWKYL/GCUQIwUT0pEXUDPFIF+9t0GjMYllIe++plISBJvpPpknhBVdGC5KNYlOisfuuCHudCaOQGaVt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EN+Lr0vI; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EN+Lr0vI"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ee1f38so26741005ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790815851; x=1791420651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+p/hrm6+chvYSoq4BTJEh28/132fMbyEn9rvNB7Zknw=;
        b=EN+Lr0vI2edvGJtFp3P7bMvVdMsp41W8fvV9aDE0ctF66Jz99w0G5y9xJyBQs85pvq
         p7nz+yPd6shO0wYHLYXnf8TLStdwTpmK0w4NJRP1wbID8m4bTOzrxscq8vp6xXe/CLJm
         xt+mRW10IoYqtlDjdx4SmWXbJGbL9XJl4zUT0XhY2z2mnPPtRfN3p3/mxRMyZoCfYCoT
         8IP0JqCQshfXD5JbW9F01bdQkG1BcxBhg27+fXNHwMEAc83vnQ6UqCxm14nZVJBtnjLr
         +717VgEgImorXCR8coTBHdCi0GWE4mZW2F3Fv6yQhKdVegFjDgxy4fwl8lTmjEaHRrWs
         jajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790815851; x=1791420651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+p/hrm6+chvYSoq4BTJEh28/132fMbyEn9rvNB7Zknw=;
        b=Sj5I3+a5QimVQVYa5BqWKFSyyYwp/hkdkcsZ6l8kHrfhMOcHgxGpwBJgXYRiYvNWt8
         S4RW34K0NgraZ9QbyjEob6Em3josk+T9B4nbXWbTl/K7nr1nGQ6c5xJQzI48t5hQmQFz
         6zmpU7FKOKln+lk0lY71sX9bzYhY+jMyPMK8/SD0eon7m0Fjh9EIrbR14HV8K51wMH6a
         4BRZFDdb+OeGtODhR4xHVeEK4H4LpG3/01EeMKIXAYd5b/fIxGKMVjPxmMY7IT/syENT
         37UUNeHkBtqydyprCM9TlUYfYfkOgNPa+CxpkheXeM7UAlyRFlW9E0XsUFZQuRaP087s
         6Z6g==
X-Forwarded-Encrypted: i=1; AKwUvByMXYmCy+050N3ymahld1DfkjGXG/P1fqfkDI51n4xPzZibHfCgSlW1jt7BWS5nrMcfRaVzw/zblWGCDSo=@vger.kernel.org
X-Gm-Message-State: AFuF++mBc8Xqp5/OMegqkpU052bxz/g76NZy36K3Hj/2JrwSA/CF6Rf9
	xDGbAPdXxgD6IlUrlD8tSuvhMok3x0VjrR7+PhVC3410STgQotVNJCdy
X-Gm-Gg: AYBFou1RnX1wCDx6Z6JzfdriBNlUt8Z4PtXzeSDCJNoGCMGeUbjSRQ5sDeqGYdqUhoy
	Wu9671aDFZm9+tOQBHJeT070kAom7LvCt3ns+SEMV6Y8fb5j1RcLF9qgt0qRlDZQrI36O2Ckmxk
	k/UMh3xZ9DkSZcphCpFqormUCIgzxdGOaVNyR3PaKe8raelon1SGgvot5PdEzDBqzHtauQQrpVw
	lTEfMF7CViWH5MCjfArf1FIVKdqrxWHPP9WrvpqlKfwSSCPdLfT3V4sNaZjAS0zS8YutwQNWZep
	Vjs56bFOLU0gHxK2qUB7U5/tA0h4DpYBwOH0x15qz0UxAVJ3atOOpXBqWekHjtik3I7cmYfr+hj
	DU/dqTwoxl62aFzL74W7AJ82R9fMPTniN7lnLo9S5O5B8cZhLHiFZ6dZoxwd0Fv0M+pCIBAG6Td
	FJgl826sdiRZ7of2W2RsyTTR/M/hQ/m2Q5EVrwOnzFSgh5uHD3qSs3qmq9sJUKut+RisibuQ69t
	xIWexOtja11tXjifZy5/9inPC3UZsl1TRuDVkCC/p5adN3jo1jUP2yAj2HBkodS5bJ2NKelcXr6
	Xpda0Q==
X-Received: by 2002:a05:6a20:9191:b0:3da:421e:40f3 with SMTP id adf61e73a8af0-3de9e69ac1emr2778847637.17.1790815851221;
        Wed, 30 Sep 2026 17:50:51 -0700 (PDT)
Received: from pc130107.ADVANTECH.CORP (59-124-202-175.hinet-ip.hinet.net. [59.124.202.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88818815025sm270995b3a.18.2026.09.30.17.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:50:50 -0700 (PDT)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v2] drm/panel: ronbo-rb070d30: Ignore DCS errors in disable()
Date: Thu,  1 Oct 2026 08:49:40 +0800
Message-ID: <20261001004940.110776-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If rb070d30_panel_disable() returns an error, drm_panel_disable() skips
clearing panel->enabled. unprepare() still powers the panel off, but the
next drm_panel_enable() sees the panel as already enabled and does
nothing, so the panel stays dark.

Always return 0 from disable(). A failed ENTER_SLEEP_MODE is still logged
by mipi_dsi_dcs_enter_sleep_mode_multi().

Suggested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Hsieh Hung-En <hungen3108@gmail.com>
---

Notes:
    Changes in v2:
    - Add a comment explaining why the error is ignored (Doug)
    
    This applies on top of:
    https://lore.kernel.org/all/20260929080143.559685-1-hungen3108@gmail.com/
    
    v1:
    https://lore.kernel.org/all/20260930013029.3241267-1-hungen3108@gmail.com/
    
    Compile-tested on arm64 with W=1; not tested on hardware.

 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index ebe6352db..9adf97aba 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -87,7 +87,13 @@ static int rb070d30_panel_disable(struct drm_panel *panel)
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
-	return dsi_ctx.accum_err;
+
+	/*
+	 * Returning an error would leave panel->enabled set, causing the
+	 * next enable to be skipped even after unprepare powers off the panel.
+	 * The helper above already logs any command failure.
+	 */
+	return 0;
 }
 
 /* Default timings */
-- 
2.43.0


Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FBA23EAB0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790731866; cv=none; b=gynPt7/8dS/6BblHnPNRpubfunbiQiLKM+GqN3OSxzw8Kccn4MRzcN15z+rjYm7onTUPOwCJAJaH4A9VpSG6h6sx8l21iLCTmM5XT5Y3lWF5E8bLUT8RsV8rlllx82v2DeGXb/hSqNvoO1oXnZug7EXStQ73UedCqi6L7zdsyS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790731866; c=relaxed/simple;
	bh=TXDZs/nX93ZQWMtX0Lu5BUoDhlrW3v9yDHva63Fc7bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H3pM/5J4y2QXXTu2ct2tBZl+46EPtF4/C4Vo/EdBA0475+h654m/M3CKIdGSw1uNmess3F2k0oGKGpBqMvxu9d2bNwdd4BISop7cZxCk4IxpgfL/Iy6UtUtf8sVECx//QKPDWa2gO6J5s1iAwnKDHxrH7puoOHwLHAQCtHBVpGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRPnKW6D; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRPnKW6D"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso2492084a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790731864; x=1791336664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pj9wMOIWQ7bNvdJuP9LsvNqHENYI3grFwHw1yx2eN10=;
        b=kRPnKW6DTv6QhATmtI/y68u8BV9Oc5mj/mR4a9H+JymjzPB6ijqyDwf1APTZPsUlpS
         XaJA9pb373mP9h/IjjIBGNkvDYyvBM7OWXwoeBS6dN/dO/2jwPQLdilMXjUnppeVBX0x
         qKGcBrjpD5JvNwSUIvHB6aAsB5nVk1vZUBiZoTtvkDY++ABwoYeSzDEaNlc8lk6cP0FX
         T06vzDcD29BW9NKG9RL9V2v5zPFuiqeOPhKujyHwizPr4deOdJk4aYrcl8I/6JlKKmKw
         4+n4bbT979Av7RbsDYvG2rloD6PtzFd/lQtL8eYUORwVIX0eNDWyn+myawbgte5jTT7h
         4nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790731864; x=1791336664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pj9wMOIWQ7bNvdJuP9LsvNqHENYI3grFwHw1yx2eN10=;
        b=CKUuU46oOrD4q67YCxphPkGs82445y9yUZ6di2k5Wdte6Rm0YfGse9yv/NUfFgYUqm
         ndAfPT4Ega3ZHuP3Ii/36yQPiwhb+hd04BVPx05DW8biLxA70ENTugqfN9bdD0bAf+Kr
         k/MH/fojmPxlWWLMOYIlxr9uZyiKczek4DWVfF6GpR6Kej+BSNznU4odblmvIiJHUu69
         AciO3ggrAVZ/G0jAOprBQ0pD+urbuRYxIZ1FUnfRiW64qjKY88AGSWoR6tsfygx7MNUK
         EA/p8wlwSXZ5n0leP9//izo/QZZiJMhIyhyJFBO8lnkEziyH67xmY0DCXljtt+oIkDWH
         cVhg==
X-Forwarded-Encrypted: i=1; AKwUvBz8fAd7k1YN7+P6FIwF6snpWfi3efcXcH84DNxaq+K44IQQCdvUBtqtx8utfgXDiznq6YcSlOZ0zXpp8WA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIURghFNcCaMjkaZpc+JuOcdK3En7P2Mn4FcHHuEEAyX5gx4Ie9
	SqozFiwGjbZb+Lq5J8jcIWB6LLO/AOrbhMgy9ijO2utDShBheblT4gFe
X-Gm-Gg: AYBFou1+5lYIcyEJI0rP5TmTWePEv9HhN0SNDI0V7r+DLuPFFoFM8qEoqVtucm9hl+I
	Ai7IJQTPwpPyKvcRRJjrlhAADZnfms0jKWJb34cJsJ5JQOfBkk1lOm8uWcrfNWw0hC6lcyFF9Gt
	+93PMQ8ywXB4rx6jxvsgV0UoMOogOuBWCWhdvdX+JERABjwboIAR4X4YyKb0kbuGiEV/LO4vrFX
	hFuHRkxZ2B4TtpFV8k9hyiFTnhnpuMpnBCwaPvcMHOdsC9zHypN3Dw3UvG6AAVAFgeMWvaVCKKs
	+TtRqvjBAw6/ESIaRwz8PXdccy/Wq1ZLM2eCgCNQOlvdJa/DmXQrJSznNl5fmzxvjBV5Ey/4B3R
	R6EhPYvPNOTkhgxoFof+z5RiKoyHRAAL4boUpPqV3WxTVtUFpii9HzjF72tPOLWSgnLzm7Cx05w
	f6NGDSaLjVznR5aWbcUXkVltbnvVJ8BHyHuUYVXVrMhTbi5W48+lcCjMw6qXOU6WRq10//Ixlsm
	MTRLsi//ktKai8onVWIkLwywUdzcXh6/WddlccOBagWr+06LSTRrf5V
X-Received: by 2002:a17:90a:c2cc:b0:3a4:cb6d:aca9 with SMTP id 98e67ed59e1d1-3a4cb6db018mr144245a91.64.1790731857501;
        Tue, 29 Sep 2026 18:30:57 -0700 (PDT)
Received: from pc130107.ADVANTECH.CORP ([123.51.235.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4caabaf9asm553179a91.8.2026.09.29.18.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 18:30:57 -0700 (PDT)
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
Subject: [PATCH] drm/panel: ronbo-rb070d30: Ignore DCS errors in disable()
Date: Wed, 30 Sep 2026 09:30:29 +0800
Message-ID: <20260930013029.3241267-1-hungen3108@gmail.com>
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
    This applies on top of:
    https://lore.kernel.org/all/20260929080143.559685-1-hungen3108@gmail.com/
    
    As suggested by Doug in:
    https://lore.kernel.org/all/CAD=FV=UU+NS0T-Ga8i12QKTNCYOu8kar_6=NsH0=4FVUFyKB7A@mail.gmail.com/
    
    Compile-tested on arm64 with W=1; not tested on hardware.

 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index ebe6352db..2d54182fe 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -87,7 +87,7 @@ static int rb070d30_panel_disable(struct drm_panel *panel)
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
 
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
-	return dsi_ctx.accum_err;
+	return 0;
 }
 
 /* Default timings */
-- 
2.43.0


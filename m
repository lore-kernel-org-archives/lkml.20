Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228D0480DEF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866159; cv=none; b=MgnLufQmOMgLYBYa8yNTtICTI+A3pK9tjRBpWtX1OwUGuu7ZrU+MpzPLdZzMsVAtWPPlvJZk7r0U87EwQtqcfHO0PrJfm4Z+bA62qLjEybpsUc7mORVG2Bw2ITkClZAPjmikyx4PJCcb4Gz5FbJJSD6DuwIyI6HVlidpxFnvY9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866159; c=relaxed/simple;
	bh=sXWLoOguLoTk5rWAON/Z1HT2KFM6REo/ZXKkoIyyAnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SSrzv2fWPMiAt/rj3acryLFxQxwizCdnTjfg7vxUKNp6fuVrW9NxJMLk5jJlI9PSgPAZy3VXsqDSNdfMqTDBn8IJhgccoLCf8z3BdNlVwRgTITnbgXb63CkW1anKpcixAT1pqEbKbFP5g3MIGWfzJpeWv81qN+NL3SQll8oIKHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Un5bTLEt; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un5bTLEt"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-678febd9307so2187046d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866156; x=1792470956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rPZxZeQ1MN5oxdqJmVTe39KchSUoN5mtLJpoRFFbDDY=;
        b=Un5bTLEtKKn/PFDp+fbQRIwdG4mlTfCSwknnox6D9pYMxEnJSqsLiBzq/p49keDuQW
         Vq+qxwm5vUtOSq2BPE/DFCwXK9vZhfb1XeeE/GbnxHhxjiEx9xQJn3X7s72MBj4gOqfh
         cjPw6RNiXUvNIew4HVwL3ZISQkWX8hwiWq+Mt0Y4wzueoEdMmvXRKOmuzDxLyjJuXlBq
         Eku2OxHTzJkG5M7zYd7RavkcOAlFCuE42+9OLWTuqXPaKlooBknIn5dcXKDzPCLQoOdE
         B1CxXFf601nH+Kirhlq2doSawp/FlsbaaUA8sA1vm8tl4qFAIU1aamCZY0VwYlrHrWiJ
         UkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866156; x=1792470956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPZxZeQ1MN5oxdqJmVTe39KchSUoN5mtLJpoRFFbDDY=;
        b=vfPIfO+8WJCYC4d+mNsx8vUChFr0sxh9QFYTrXbN/gDUYNYiidc+poSaSvl2ZLKKuc
         ZdWkSzDv1PTpYMwWp29f38WlCTxWYq1vxWyCfq9w1lH474ozcahn6zbke7kE3kmbHoYO
         ivvd4ndAq+LqEqm300Jwa/MzMH/xxfRmvuPGELVyVv4GXSzMqQBOTyEh5Moys/bGmeOT
         MD9u+7wUbe8orUCMRpI+/jpwV/XA4yhPFSG8vMCyHCuvCe2qCJabv5+FaiMQv78kL++Z
         CMr9gXFSxFl1vlWhhIpqdUSECJvcxAJqP0wViD8zwZ0ISIKCsFlzpXOBRoeZgdJIMzSB
         QejA==
X-Forwarded-Encrypted: i=1; AKwUvBy5g6vGD6p1Mwo7DwyhA83jlbHgaV48NVl6ZCGjGkQrU89PELd35Lj5aAt/8upyRvsdCXx2LoeZS6OtE50=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqmfxMFh7Ey6c6vkvkryWFTjb14wP0wxLLAX0EsapeAONiM8ws
	eh/b1YvsPYpeuWW22I0b/0jl+dQZiLGP9T/C05E89ElIQzYxSZimQwj0
X-Gm-Gg: AYBFou2DQRFAXlMm8F9Z/l+uluhrjHMHpeoLeZQYrtj9qBe8a2kQsjlcBFqRpGpXMWT
	EC0OWY4Tz5pPQek31CrhwHffcCrhYqx+ETAwokGPHJPGFo++Kjvnr68f9unlV3rijiLQWXt8eEj
	h6wjOTk3ivn483mfUgbt9VXIMf5+0pkYIhGA/DWa/n4RgywE//vbUHCOeF7qSeQMnCzJeZg3YM5
	fdhYSEQ+qj2T5/DDpA4C6iTodRlpVrA/L0WabjBjzGLM4NpkJOD/rRK4w35BQpD0cvxEMrAZQX0
	37Csqc1ERHk1660TBdxn8kWuTRsq0Ar05jwbtEqut8ueN6fT7p+SVZn4xfpU+eZjpAaMgkfiO8a
	MaV4opaWbxn1PrKzHDo8dsrLzQ4DIDyOLKQ1Wtl+DcFlR802UpCQONURR1BuE35oxvKbGov7aaO
	iDVL5n3toh3GCtnCu2MvXRKGOfT0fZyikQCw6LbutqUZHYqj3fpYFRzXE37KVYS/3RPyBS0FVHx
	4ja4YqNWjPYWw==
X-Received: by 2002:a05:690e:11c8:b0:677:d5bd:8336 with SMTP id 956f58d0204a3-67938974c0cmr3660343d50.16.1791866155837;
        Mon, 12 Oct 2026 21:35:55 -0700 (PDT)
Received: from [192.168.1.71] ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67935606f5esm4448152d50.4.2026.10.12.21.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:35:55 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Date: Mon, 12 Oct 2026 23:34:38 -0500
Subject: [PATCH 3/4] drm/panel: innolux-p079zca: Use mipi_dsi_*_multi();
 fix minor bugs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-mipi-multi-series-v1-3-6a29add1ec92@gmail.com>
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

The mipi_dsi_dcs_*() functions used by this driver are deprecated in
favour of their _multi() counterparts, as noted in
Documentation/gpu/todo.rst. The _multi() variants record the first
error in a context structure and skip subsequent calls once an error
is set, removing the need to check the return value after each command.
They also log failures internally, making the per-call dev_err() calls
redundant.

Convert prepare() and unprepare() to use the _multi() equivalents.

In prepare(), use mipi_dsi_msleep() and mipi_dsi_usleep_range() instead
of plain msleep()/usleep_range() for delays between DSI commands, so
they are skipped on prior error since the function will clean up via the
existing poweroff label anyway.

In unprepare(), keep plain msleep() since the hardware delays must
execute regardless of any prior DSI error. The original code logged a
set_display_off() failure and still attempted enter_sleep_mode(), so
clear accum_err after set_display_off_multi() to keep that behaviour.

This also fixes a bug where a failure in enter_sleep_mode would return
early, skipping the sleep-mode delay, GPIO deassertion, power-down
delay, and regulator teardown, leaving the panel stuck in a prepared
state. Because drm_panel_unprepare() does not clear panel->prepared
when the callback returns an error, drm_panel_prepare() would return
early on the next call, leaving the panel unable to be re-initialised.

For the same reason, stop returning the regulator_bulk_disable() error
from unprepare(). Returning it would leave the panel in the same stuck
state.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
Compile tested only, no hardware available. checkpatch and a W=1
build are clean.
---
 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 43 ++++++++++-----------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index 80afeeab9475..8da2f9b2ddde 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -54,17 +54,13 @@ static inline struct innolux_panel *to_innolux_panel(struct drm_panel *panel)
 static int innolux_panel_unprepare(struct drm_panel *panel)
 {
 	struct innolux_panel *innolux = to_innolux_panel(panel);
-	int err;
-
-	err = mipi_dsi_dcs_set_display_off(innolux->link);
-	if (err < 0)
-		dev_err(panel->dev, "failed to set display off: %d\n", err);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = innolux->link };
 
-	err = mipi_dsi_dcs_enter_sleep_mode(innolux->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to enter sleep mode: %d\n", err);
-		return err;
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	/* Reset error to continue power-down sequence even if display off failed */
+	dsi_ctx.accum_err = 0;
+	/* Enter sleep mode; error does not prevent power-off */
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	if (innolux->desc->sleep_mode_delay)
 		msleep(innolux->desc->sleep_mode_delay);
@@ -74,10 +70,8 @@ static int innolux_panel_unprepare(struct drm_panel *panel)
 	if (innolux->desc->power_down_delay)
 		msleep(innolux->desc->power_down_delay);
 
-	err = regulator_bulk_disable(innolux->desc->num_supplies,
-				     innolux->supplies);
-	if (err < 0)
-		return err;
+	regulator_bulk_disable(innolux->desc->num_supplies,
+			       innolux->supplies);
 
 	return 0;
 }
@@ -85,6 +79,7 @@ static int innolux_panel_unprepare(struct drm_panel *panel)
 static int innolux_panel_prepare(struct drm_panel *panel)
 {
 	struct innolux_panel *innolux = to_innolux_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = innolux->link };
 	int err;
 
 	gpiod_set_value_cansleep(innolux->enable_gpio, 0);
@@ -108,24 +103,18 @@ static int innolux_panel_prepare(struct drm_panel *panel)
 			goto poweroff;
 	}
 
-	err = mipi_dsi_dcs_exit_sleep_mode(innolux->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
-		goto poweroff;
-	}
-
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 	/* T6: 120ms - 1000ms*/
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	/* T7: 5ms */
+	mipi_dsi_usleep_range(&dsi_ctx, 5000, 6000);
 
-	err = mipi_dsi_dcs_set_display_on(innolux->link);
-	if (err < 0) {
-		dev_err(panel->dev, "failed to set display on: %d\n", err);
+	if (dsi_ctx.accum_err) {
+		err = dsi_ctx.accum_err;
 		goto poweroff;
 	}
 
-	/* T7: 5ms */
-	usleep_range(5000, 6000);
-
 	return 0;
 
 poweroff:

-- 
2.56.0


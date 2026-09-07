Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6084772B9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780519; cv=none; b=rBJao1Eumwm7lIzJFOjcEgVAmWPUYffQVT+0VloJEXZM3T+quWCAh2TLz0oF16BSqeKK3TelWzebZRrMpVqyWG/g8sQ2e1Jy6jKW2ERDzDUuKpIvYVzh6iUL24YQBzfXoy93/gpcsGcsyqTQianW9+iTa8GFnbDjXQZMlGutJIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780519; c=relaxed/simple;
	bh=igMHHRbxifyA6frngcNP7cTPZU8BglT1TaSpdHFR7B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWhcm0Xhc+ZF9Os6amPpcAhl71cPIQRN48NOj+l/i/el8fhJvckbMU74qFTSW2O6/9UlHiTPLYq6Ig8UaagUhuRAPIYI8FBqFl8WMoxV6kqHo5U91tLndDNhiOCG2GDK6roJ5DV82dl+iGmFpIGeCmereHDm2h36oDQmXODBhi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OJQAKe4w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OJQAKe4w"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7FF614A1;
	Mon,  7 Sep 2026 13:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780414;
	bh=igMHHRbxifyA6frngcNP7cTPZU8BglT1TaSpdHFR7B8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OJQAKe4wOcAGOki7jaktG7VjUjbYKleLfwQD8VgmE9QI2tlSJ0L04ZMYC6Bh8zU5b
	 ng89L1NU/mdNxQOE2CkS9JkmqheOkr4Of899TqJc12VqU/JAReZE1I2Trgz3F6bRon
	 MD524c6lZQeuDAopmetEv9AI9PV/FFvM83Wapu4w=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:28:01 +0300
Subject: [PATCH v4 06/13] drm/bridge: tc358762: Improve DPI enable handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tc358762-fixes-v4-6-e3fc3ab5cd83@ideasonboard.com>
References: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
In-Reply-To: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=igMHHRbxifyA6frngcNP7cTPZU8BglT1TaSpdHFR7B8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnp/T+47orYLUJLgcYn5Z/aE59PpVZfyFa5NJY
 Rq5wCvBazSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6f0wAKCRD6PaqMvJYe
 9TnhD/9kSNcxq2OABtsyD+a7Vq2n9lqb7t+IFB2CHkPVnn19OF00wHRac2Maip9aL/Fi9b2wpLs
 m9wfjh7QqorREZtYxX1iNa+TLserTHiA8KtPK02mcEgqu+JdosNKAKHXMVH5VnaxDlUjGRvW9iZ
 26SIWdstRGxgk13RWoMY8b2JccWPo5hzbCWERH4B6q00PzxPxGahDUWRfS8JgvjMmx3MGzzZdAF
 Z9SitO28oti6k7peuECmdnyNOammWscY7zVq6wbRDVQ0rltux0rvZCRB7YM4sDlB+U6HmAL1LsY
 CkcrU3W700M5y0Q+8OOcu3ZPY4NZxsRw2GhQGVKPHSRZXfUJPsri/FlNMRuKG4a2JfZBwzifRIx
 07nWQjAmfUtVlVhvNR+l2hpQCjku13SigR7IZync946wLv/gXt/+Lgx2UCDSrUOaahMl1s0dzWg
 G688ys+Lop4m0C6PpTcHgC3sQvU0JXKiI0qUG2znDFfpcd3wPOPNULhlUyRfZ9HaeQIq9Fi2J5U
 H95PoU1gaG1ug4Ts01km2Y1Cj/MQSWK6cxZfgwianKTFIU736f+lOxLcMzxxpbNMD4njjyxTc7Q
 BKMT8UjhFBeBIFbTdksQwSeoEDlKZiqoEibrUcnw9ivaOVkDhNCfMRluhgjnRsfMCo2ROcDqw7t
 OwF3Ww3q3MTHZWA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The HW reset defaults has DPIENABLE bit as set. In the current driver we
configure and enable various things while DPIENABLE is set. This results
in a temporary DPI output with wrong timings, which may cause artifacts
on the panel.

Fix this by clearing DPIEANBLE as the first thing when we start to
enable the display. DPIENABLE is set later with the rest of the LCDCTRL
configuration, and at that time we have done all the other
configurations.

Also, for symmetry and possibly improving the DPI output at disable
time, explicitly disable DPIENABLE when disabling the bridge.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index ee72978cd8d8..7654d4039a9d 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -134,6 +134,12 @@ static int tc358762_init(struct tc358762 *ctx)
 {
 	u32 lcdctrl;
 
+	/*
+	 * DPIENABLE has reset default of 1. Make sure we don't output on
+	 * DPI until we have finished the coniguration.
+	 */
+	tc358762_write(ctx, LCDCTRL, 0);
+
 	tc358762_write(ctx, SYSCTRL,
 		       FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
 		       FIELD_PREP(SYSCTRL_DPISTB_IO_MASK, SYSCTRL_DPISTB_IO_4MA) |
@@ -185,6 +191,9 @@ static void tc358762_post_disable(struct drm_bridge *bridge,
 
 	ctx->pre_enabled = false;
 
+	/* Turn off the DPI output */
+	tc358762_write(ctx, LCDCTRL, 0);
+
 	if (ctx->reset_gpio)
 		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 

-- 
2.43.0


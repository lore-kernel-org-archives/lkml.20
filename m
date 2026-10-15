Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE19481640
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050209; cv=none; b=asSzOckbhsH1Pq0qyP4w01EAvrvklPr47beWPrjeN5RUzPN+Ku6pgJeZxXYMbP6HC+wqaR9V/UQVejFawol3KCXY6nc73Zs1Z4b2qi4iAwNXK1Cl180iCj82YhH2KVGwzC6VxxHT1NqKC+aZP7U0aj3tDjODN+cI4PLGlE6Edxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050209; c=relaxed/simple;
	bh=YLJQp9WZ3BIAITm1NSeUvtEDfPL4hEVvl7lUXyrIuOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M+uuTIszZ+6ujf/Lhwps1agWwAdJbPjVIhKPAX8rBX5va6UWmmCDoibEocdjNByFNg4ewqGRvLi49DwSvq0SDyn3uRdEQPBW6pFuQ0mcQwnt/j6qh2CEFwAbERw1Ww63PIAnNp1G7uWJ+ctNUrrI8Nm9Kk5jDbs1e7UoUjBvrkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oPGQE9o2; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oPGQE9o2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 80405C63455;
	Thu, 15 Oct 2026 07:44:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33B4160360;
	Thu, 15 Oct 2026 07:43:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C40741032869C;
	Thu, 15 Oct 2026 09:43:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792050200; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=mXGPNaosFVQsfAd/lTLdcHqRv0MbTkP+44h/9Qmdp50=;
	b=oPGQE9o22DWyG5MrX5/Dx6cE1yFNsrAINlgjyg3Mo6J7Cwb89AoA47oAe8AOkescjMsHXa
	Fk0csLNol/R4VTt/X3ew1TfK7JNhEHTFKVt71aiLY/5pO8sY+T6xaSRCcpL8Xt/vqnR1xg
	TH43CnJSTTXphAROeqIwsUZUdT54UGupuG6eLEFF/TQ45fyl6b4eGHM6LXMZOz81bfCtP6
	SNmF9tB1r/Ei1aQGYLTEfrgTiizqh3ixswmS7eWNy+9JfX3UbkruWTgHt95uZAnsBEOQMy
	x9PqsRfNYGgZtAZtMVdGdSjLeX5IVmqVbHHx7RuyDwvEyiWUxCG8rhX4bvspNQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 15 Oct 2026 09:43:09 +0200
Subject: [PATCH] drm/bridge: ite-it66121: fix silent probe regression due
 to reset timing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-drm-ite-it66121-fix-reset-v1-1-473038e06abc@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CQAxFr0K6tgkdMoV4FeMCoWhJRNOOxoRwd
 6ou3/95bwUXU3E4ViuYvNX1sQTQoYLh1i9XQR2DIdWJqaaMo91RS8yFmRLhpB80cSk4Ucu5yV3
 fMUP4T5M4f+3T+c/+uswylG8Qtm0HHQjkJ30AAAA=
X-Change-ID: 20261015-drm-ite-it66121-fix-reset-f1765358a866
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Julien Chauveau <chauveau.julien@gmail.com>
Cc: Paul Cercueil <paul.cercueil@bootlin.com>, Nishanth Menon <nm@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Commit e02b5262fd28 ("drm/bridge: it66121: acquire reset GPIO in probe")
rightfully added code to make the reset pin really work instead of being a
no-op, but that change introduced a regression making probe fail most of
the times, at least on some hardware.

On a BeagleBone Black rev.D the IT66122 silently fails probing >90% of the
times. This is because:

 1. the regmap_read() calls just after it66121_hw_reset() to read the ID
    registers fail
 2. there is no error checking for these regmap_read(), execution
    continues silently
 3. this results in not matching any of the IDs from it66xx_chip_info
 4. and this results in silently returning -ENODEV

Empirical tests showed a small delay after de-asserting reset fixes
probing. Likely the device needs some ramp-up time after reset. No such
requirement is mentioned in the docs I could find, so the amount of delay
was chosen by testing: 10 ms worked in 100% of 25 test runs, so setting a
20 ms delay should provide a safe margin.

Fixes: e02b5262fd28 ("drm/bridge: it66121: acquire reset GPIO in probe")
Cc: stable@vger.kernel.org
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
FYI For items 2 and 4 above, I'm sending separate patches to make those
errors not silent. Those aren't fixes, so they would be for drm-misc-next,
while this patch is for drm-misc-fixes.
---
 drivers/gpu/drm/bridge/ite-it66121.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 51fc68ffdf8f..692a85e1e2e8 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -356,6 +356,7 @@ static void it66121_hw_reset(struct it66121_ctx *ctx)
 	gpiod_set_value(ctx->gpio_reset, 1);
 	msleep(20);
 	gpiod_set_value(ctx->gpio_reset, 0);
+	msleep(20);
 }
 
 static inline int it66121_preamble_ddc(struct it66121_ctx *ctx)

---
base-commit: 20b91781216dc693d862368b523e752525172176
change-id: 20261015-drm-ite-it66121-fix-reset-f1765358a866

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868800;
	b=CLe+jYcmI3fVC4yIHUQPmQ3VsJGoqYm3DRqIKlgonNlQxB3Upq8SKQKDc3XpvCwZLEw3
	 R/JE0sPKmzSgsgz+c8vliGx0J/bBzxkTv23UestqT+PMDRsMSVt5JNS3SKl+LEoghvRLA
	 g4HWEWnRN5wuSJv3+B+i4fwa1G6oHzZGED/pauCpJpWFFy82F/L8M4zElViKzTfGL1Cvq
	 P0Oo/92F3oWZrGvRPkrqas5z1XOp0LRXs+L4gy1m3TsGgcZ7NoYY85Is77TRlrZpM8CQ5
	 5nU2c5atztsGjfbRTbGFZY1u94zNN5kf0nP1l2VuFE/dwlGuTnGb05TiCevfxiLfeGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868800;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=QC5j2xRESRmSD7obottAudidFpaX/mHq2OWq+o7sIlY=;
	b=5AgEg/r6fVuQiPtzkMkaQKdk6CpsVTX+mJbipOK9drz749HuAIP/Z7pwdgCZND4+eor2
	 MW5h2I51aH5WAeXbnlLE6bML7zy6IJ12KZ8xgbljtePREbJtFPZlrW59wTEIdbskekfLh
	 IZvlSGijlrNm5HdZm64J7qh6ufGTrDZQbUsaIuLhA/VlYNY51Ym4IZVaOL4XMUnO9B5S2
	 0vAGsWTIrjAeaMonKLq+72lrf1464AgaXb8t/ERvkeCD+nXEX78xJWuz/Dt3fPyBmTF/u
	 AQM35R1uiIf7+yjwBnMIxd+2Te0v14Vc4Rkt1dW1UIhmtg25s1A1ODLvElhRZYDTsBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xgQpdWAl;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623E4606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 623E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xgQpdWAl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7912E4E403B5;
	Thu,  5 Nov 2026 08:53:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D4FF5FF85;
	Thu,  5 Nov 2026 08:53:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C220103291D2;
	Thu,  5 Nov 2026 09:53:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793868794; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=QC5j2xRESRmSD7obottAudidFpaX/mHq2OWq+o7sIlY=;
	b=xgQpdWAldL0yJrgVGT1AnGzu1XNvzgdid4qdl7D9S3poXSwZ+1xXuvxVEJDKHf+30d4gi1
	jfIEKILjzdFPA1DkuZMvQdeZI2TLkw5w99flejhGSpT9PHWna1nwLpFhUFy5Z/NcvK5Wma
	891zzHR+JkOvKtWirxgpOnQwdkkv3CpRDOTmHl1E8EDvTjQIUlbqZwuL49B0Pjp5FNasCd
	+u9DXnZ9VoKPzeMLgu447oUgwyq0RoSui0BxNQb7+bKAh2yPSYr+qYCVYDg8cbxowRlD9D
	Pf1RY+KNEgpz758Q/l8DzyjAyUtRDowJ2DbDMGDT+wPyaxb5FyvC8vVZtg2QMg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 05 Nov 2026 09:52:46 +0100
Subject: [PATCH v2] drm/bridge: ite-it66121: fix silent probe regression
 due to reset timing
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-drm-ite-it66121-fix-reset-v2-1-02039d66af29@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6CMBCGr0Jm7ZhOkUJceQ/DAsogY4SathIN4
 e4WvIDL738uENgLBzhnC3ieJYibEuhDBnZophujdIlBK21IUYGdH1FikqMxpAl7eaPnwBF7Kk2
 RF1VTGQOp//SczH37Wv84vNo727gNbolBQnT+s5/PtOX++ZkJCU9lrvKKlWlae2mdiw+ZjtaNU
 K/r+gVqH0dd1gAAAA==
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Add comment
- Link to v1: https://patch.msgid.link/20261015-drm-ite-it66121-fix-reset-v1-1-473038e06abc@bootlin.com
---
Changes in v2:
- add comment (Javier)

FYI For items 2 and 4 above, I'm sending separate patches to make those
errors not silent [0]. Those aren't fixes, so they would be for
drm-misc-next, while this patch is for drm-misc-fixes.

[0] https://lore.kernel.org/r/20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index c8d0a26e8e90..f00cbe477a78 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -357,6 +357,8 @@ static void it66121_hw_reset(struct it66121_ctx *ctx)
 	gpiod_set_value(ctx->gpio_reset, 1);
 	msleep(20);
 	gpiod_set_value(ctx->gpio_reset, 0);
+	/* Post-reset delay not specified, value found by testing */
+	msleep(20);
 }
 
 static inline int it66121_preamble_ddc(struct it66121_ctx *ctx)

---
base-commit: 0720532355207f2014a98b650d19497cbe3b22f5
change-id: 20261015-drm-ite-it66121-fix-reset-f1765358a866

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


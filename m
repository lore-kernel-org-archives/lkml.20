Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A541D135
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057778; cv=none; b=fRU9hzHYd3W05XXRJltqiM/2BgopkNO0jID+d+FE4Ky7qgkYG7AdJj4WzOSRMCaxnQ7TsfEGD6hxM5JYdLTANLbZFYgX+hAfbPttwnCCyEq5KyLTQXomkO9GkjRY7vbTJkt7/hWDUFvAqzbe7j2CH95CUWdp1E3+EjsxyzCVIqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057778; c=relaxed/simple;
	bh=is6sC8a7/INuYjQzib6KHU5Bn6bwinWq1MwKN2NiQU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=he8JgBICbM3aMJgZpilK0Dtb6FkGjPwBPQE5XuV8KRFniCIrzix4VprcYChKRmnpzoILOw6gA9dN5zoeunndvReJrNVvZ2SOMqarDteQjgBeegepyPpPnPlis3hga4MBkJOAW4FQpetD/M/O3Lag2/oSahhGLbMzV0cU2jg1MfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wa2tZLOb; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wa2tZLOb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C8C84E41246;
	Thu, 15 Oct 2026 09:49:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5178160360;
	Thu, 15 Oct 2026 09:49:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F82C10328BD2;
	Thu, 15 Oct 2026 11:49:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792057772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QZZsjZ1RvwlA3HlqbPaiuTTXp0IybfCUheX4Ww9/Dv0=;
	b=wa2tZLObEd/IQ/4YvZ2TdkQ0TCDfN0lebMhyNiJleQ62bQRH9yxVfERpdzTrr0JWYqhKu+
	U4BslktjLRslyBpAYe/alJG0f32wLxrFLrrOSMyu4pZh1dduwTmYUmGAAW+fG5Wc+mLaCt
	rm0MXJc1qDLKaPnS6Q3RkPzh862/8ww2tweeAwi/iAZqi/PtoF1/uKhR5/0c0RMwlWN6G8
	hzlCIBYS+H59M6yYtvf6l2xEGph4IKQ8NcMTHuSO8d/dtUz6zt+X3NE96G7hNVXiM3vw1c
	+29B2ZfpSyo9ggN1xOdrxlAZt85RtxLPS/VJzEams+FXyPn+NOhbYHulna831g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 15 Oct 2026 11:48:48 +0200
Subject: [PATCH 3/3] drm/bridge: ite-it66121: make successful probe quiet
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-drm-ite-it66121-log-probe-errors-v1-3-7fd6994e0be0@bootlin.com>
References: <20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com>
In-Reply-To: <20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

When drivers are working properly they should be quiet. Turn the dev_info()
into a dev_dbg(). While there, also make it more informative.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 49eb8318e974..11647b1ac735 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1709,7 +1709,8 @@ static int it66121_probe(struct i2c_client *client)
 
 	drm_bridge_add(&ctx->bridge);
 
-	dev_info(ctx->dev, "IT66121 revision %d probed\n", revision_id);
+	dev_dbg(ctx->dev, "IT66121 vendor %04x device %04x revision %d probed\n",
+		vendor_id, device_id, revision_id);
 
 	return 0;
 }

-- 
2.56.0


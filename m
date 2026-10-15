Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4913E4EA362
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057774; cv=none; b=l/l1X7g7uFsfOkJCDFin/RiMUYmWVYWISnga6ruUrcpgf+QhjzVtsnkmGLtRin0zd5c5r+ZJCz5h8USEEjbB/Ze7tMlQ3bgGkAW+X6RfubyrYAUpfoSe4MuYu4EIxxpKNqW/HcPAlSx6H83UpU6YTC6rDZ5flfpfEXoIHWlabxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057774; c=relaxed/simple;
	bh=frjUfHr9cQMGUpsry50XxhjF42iFJOsXpD38r5TO6R4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BLIeWQN8lOOotr3H9GRxOqXlSSWvtSbQCcy2ZHGBWoa6OLBUQEp7+yhPr5MSCWZkdujFCSp6kkeFC7Qg23QlfcX0HRlGgmKzvTMO0GTeAos02sC+koMDDIvaz8zdTLhZLjjGad231hoeBdDKzj+qZhH0VsRSZ2F8gmHatVKbKlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sMZpJBiI; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sMZpJBiI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B387BC62202;
	Thu, 15 Oct 2026 09:50:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D4B660360;
	Thu, 15 Oct 2026 09:49:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CA5510328BD9;
	Thu, 15 Oct 2026 11:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792057767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DyyQQF75ppIy3CIT8AxGaD9+GZhG0hpjGPHtwDqU9rM=;
	b=sMZpJBiIMuqgFM9sjdK49kIkLlw1V8oBXGXN/7UpbLbrfkhZa2P0gcFDESx5NW89OunhJt
	pbQyGu4KJwnbJIk7juGLZWkw7nhHzMLO/O8MwTW2KQm6xqCXjKpRqtpMJY2lMQMYoS+PSG
	Ly3XIXnvHTD4CU+WZbMZ+lH+w9Lp9JVIZyxkvBZAz4+kPQcvjK8x4SOI1F5lrpJtvohBxi
	BF770afjjPcFMhu0QyLfRR4Sq63DLAHBCHMn3sxnB4mFNCNdTgJX9GuNthGnEZJu/ZePY2
	VOs3t+hHYTb43GFjgWXlFinkan8jSexWfbGwHr8QCT4fPIcgXfQM/igV0b69Og==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 15 Oct 2026 11:48:47 +0200
Subject: [PATCH 2/3] drm/bridge: ite-it66121: log an error if the IDs do
 not match
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-drm-ite-it66121-log-probe-errors-v1-2-7fd6994e0be0@bootlin.com>
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

If the IDs read from the chip do not match any of the known models,
it66121_probe() fails silently, making troubleshooting unnecessarily
difficult. Log an error to clarify the failure reason, showing the IDs read
from the hardware.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 9b43456c67a1..49eb8318e974 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1675,7 +1675,8 @@ static int it66121_probe(struct i2c_client *client)
 	}
 
 	if (i == ARRAY_SIZE(it66xx_chip_info))
-		return -ENODEV;
+		return dev_err_probe(dev, -ENODEV, "Unknown vendor %04x device %04x (rev %01x)\n",
+				     vendor_id, device_id, revision_id);
 
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_HDMIA;

-- 
2.56.0


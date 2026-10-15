Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67354E06F8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057766; cv=none; b=nzORgbmSseht1S3Q7lrGnLMkwzK/pBmuaA4zhAX3MSoL4XmTPJTDdleQSZ5l/xTYGjTU3FquDRjJb+ZDhZIe/vgPNrBLSZGA01xhPGCMIiTXqX3gtJiWQY8fZzo/DvjBQ6C5u9emL5MqT1jNGPbD4p6RCQlbTeoWzdtZtth40mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057766; c=relaxed/simple;
	bh=h/zeN9abQchJxblD3VwFflOV2nY/5MWFgqGJDt6HPqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iybWqDMZQOnJ2mV8QmGsbeupEkqv2kaNod/cifaPhx35STtvabfsFSDZQIc9B7OEpdc2Wh1RBblpxgfvJ9pt2ayX8vpUgtgvGwtgvL+he+k0dXQ3P8SATV0jixK4X+Vw+MQnDRbFhF8lIlKQns5FcG/xlmzYGUlfvbwR12MRwJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=s0b1vB3X; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="s0b1vB3X"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D097C4E41246;
	Thu, 15 Oct 2026 09:49:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C05460360;
	Thu, 15 Oct 2026 09:49:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FD9210328BBA;
	Thu, 15 Oct 2026 11:49:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792057759; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=FWcYHpK8CdG5em5BjygV1FcmzuhmkAxaHza1OitPJpE=;
	b=s0b1vB3X8OGEInO9qWhWKrGDdPDH+RomF9eS9eCha6LbN7XZmmU7ZSd8PfTAimpAziRBTO
	pumhXgDh52+rDOWBx4bJtSqB3hRjBb/nOW3NCwZUYiYKn3OxlvxXPCGS9TMvWmDZ7uzrOp
	eUz9PihlAHcXJPY+DEZOOT9IA4B968Qjsbuzdj2ezEtSfbE+n+GW/QyopVLKmBKwPJ6K4a
	BliDRPa1gI6STMudISStt27l/b8/jyGQmGp520erto+J1IEi4gT5NueRjkUcG0xGsqWiQj
	JZfALh49dqjzl9j2gxmFtcilLh8BJ58ieVGf7Mw+jmcIrUMWu+tme53E1JvfKA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/3] drm/bridge: ite-it66121: use bulk read, improve probe
 logging
Date: Thu, 15 Oct 2026 11:48:45 +0200
Message-Id: <20261015-drm-ite-it66121-log-probe-errors-v1-0-7fd6994e0be0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CQAyF4auQrm1CJ3FAr2JcwNDBGmVIOxgSw
 t0Zdfm9xf82MFZhg2u1gfJHTNJUQKcKwqObRkYZisHVzlNNZxz0jZLLnL0nR/hKI86aekZWTWp
 4CW2IHNuuiQ2UzKwcZf1d3O5/29I/OeRvF/b9AAvraBOEAAAA
X-Change-ID: 20261015-drm-ite-it66121-log-probe-errors-9c8cfef8a7f7
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

This small series improves it66121_probe() in various ways:

 * use a bulk read for reading the vendor and device ID registers
 * log errors in ID reading and matching instead of failing silently
 * on successful probe be quiet on !DEBUG, more informative on DEBUG

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (3):
      drm/bridge: ite-it66121: improve reading IDs and log on errors
      drm/bridge: ite-it66121: log an error if the IDs do not match
      drm/bridge: ite-it66121: make successful probe quiet

 drivers/gpu/drm/bridge/ite-it66121.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)
---
base-commit: 49477cc277e0a432a8c08766b8ec764ee69622a7
change-id: 20261015-drm-ite-it66121-log-probe-errors-9c8cfef8a7f7

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


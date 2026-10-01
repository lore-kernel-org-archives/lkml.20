Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34901513570
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858641; cv=none; b=tGD8xhui0LXwqc83MO9iLmHIjD9EQPDbbya0Qziy6qWXjbAnRI3ZzqNmXLqaGg4zWJ/NTVp2yVx222IUEtik2/+DTs69EpfCxkZbTuPABKnDwtBpZOvQZkl+bcnopyiB0N8rTDQjdQvg1NZOEAqOHWfuPQsB3F4b+BvbmeEpqPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858641; c=relaxed/simple;
	bh=Sms6Hm0bqrkOC8r0tQMl3X20kBIz3xLS8ZiGlVmV19A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1WY/8egNzHqf9W5WAB6OaZBy7iqkYo20toYA1Mudbc07sXFupnu/qx5upJcP6d0EvaMdKbGiGwAEfLH5d1tfM75WHKGqpQucvc1ia3eaaaKFVQGJNvXxtYEe9IPbYAtdPBFTUJSKBKeCiMdbM1tyXpqar0zCpziF5eKAEJGhxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JPdWxQm1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JPdWxQm1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BBEEC1A24DD;
	Thu,  1 Oct 2026 12:43:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 848D060341;
	Thu,  1 Oct 2026 12:43:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E5D11032811B;
	Thu,  1 Oct 2026 14:43:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858636; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uBDynqj0MRNe0ZE5dYCnK/0m9DNXvSOsN2x3my6qZE0=;
	b=JPdWxQm1nF0z8GIFcgwEpWxo3QmoSCS6QhBxCwWHTqwDfXxoomJUioC6SeiKDZHJAtOwCW
	/zcLk+Xv5IgsT8ObmefEO0uIZ2Ofl+qJYq9M+h74Yo4rTEsmXGfpl049cAdxcWAyljD2h/
	EcF70V8h3CA96e5sel/Dfu8BpD0EBCd6rvz9IJru5K5Gezz+ROZhNJ1XY8ObxcPyfBpYW5
	0f4TsinQew72YShXkQenL6ekNHvqtaqsD5WeqONB7pGl+52UOxI3JzdzCcejAfOm9r0D2h
	ZSq0RhTSwcr1spv3HkT8DdXU5z1gwEzAHHdySgUVhYPL0T2KbL5H/9iYBT9QzQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:35 +0200
Subject: [PATCH RFC v2 13/24] drm/mipi-dsi: turn DRM_MIPI_DSI into a
 tristate
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-13-8e34986dcb68@bootlin.com>
References: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
In-Reply-To: <20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

DRM_MIPI_DSI is currently a bool, but there's no reason to not be allowed
to build it as a loadable module.

Moreover being a bool prevents DRM_MIPI_DSI to depend on a tristate module
that is configured as 'm'.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 65d46dfa7266..9bdd9110e754 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -39,7 +39,7 @@ config DRM_MIPI_DBI
 	select DRM_KMS_HELPER
 
 config DRM_MIPI_DSI
-	bool
+	tristate
 	depends on DRM
 
 config DRM_KMS_HELPER

-- 
2.55.0


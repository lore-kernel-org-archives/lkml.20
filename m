Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BEC50129F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858598; cv=none; b=ZzaXiCeQjc4Wx+GnmCrdTXrhUk5Mcs5Pazye8bAwMZJR9kEYuCcahrDtg9ROVxXUCDvgOVwKKIrLDfFIO/dBHBV0ymU0k2MyjDoP+cpEwYRx08mC7HOMC0FH9s9Q3zg6Kkn/vaHEYm/9LExAjKvvxJJ2NVFju+u4n7d+1hh+tdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858598; c=relaxed/simple;
	bh=kwj9ppgSdBYEolhsiAu+2r5r+LvOA7/1Kza1I2BGhT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PmyWbj7YPQwblnLibi12v3vPaTsa2K6L3Uswe+3zRoXtLZb7EawCrTB4IzSfS7ccpRkMljAGabiNHu8ss6XIISxJq//Zd4OcC5WnUPMrK8dQ9sOy43j1GTxD7dWJNb5yq6ujt2th+/pSIEOY+xC1v4wMYP7ADRPYFHuxXM1nA90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K9yGKQC7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K9yGKQC7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5E1794E41A77;
	Thu,  1 Oct 2026 12:43:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F57360341;
	Thu,  1 Oct 2026 12:43:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5C191032809F;
	Thu,  1 Oct 2026 14:43:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790858591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Dme5npjt7bYJ8nCOV+4V+fgQP+6QTM6Jp0Ld338/6tM=;
	b=K9yGKQC7+HHe2tjMowfROlOJaQ6o1KSVkqfBYsCKYz5fdtTOEL53FIxyEPoaVhvVCBgG4W
	3CHx1gCyVejETYVUclXI2jrw8zk64jGgZRUmtW57pmA8wQ9kb+Rhm1BWh7d9QNAkXPKVyT
	6GfNHPpi3Fk+u4WzCODm8Mfg98EHy4P6fwKXoH3/ph2v5ARjywfH0lPn9SAb2utPwSSUqr
	Tlk+onzmcdZS+WQE6/0s2c+5habvU1VTO+yv+EBQbXtJNqOMwmr8eXMxAxxlX5UpENwbZ+
	4OB8nIZUAdGWIuhTWsLtmqX4Fueqw6gSASntIFH3frP7pCyzJgPgGbCy709nqQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 01 Oct 2026 14:42:26 +0200
Subject: [PATCH RFC v2 04/24] drm/display: bridge-connector: hoist error
 management to common code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-drm-bridge-hotplug-v2-4-8e34986dcb68@bootlin.com>
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

In prepataion to add more error management code common to the HDMI and
non-HDMI branches, move error management to be common to both cases.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 41b51f0f13ae..2aff745f0147 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -1057,15 +1057,13 @@ drm_bridge_connector_initialize(struct drm_bridge_connector *bridge_connector,
 					       &drm_bridge_connector_funcs,
 					       &bridge_connector->hdmi_funcs,
 					       connector_type, ddc);
-		if (ret)
-			return ERR_PTR(ret);
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
-		if (ret)
-			return ERR_PTR(ret);
 	}
+	if (ret)
+		return ret;
 
 	if (bridge_connector->bridge_hdmi_audio ||
 	    bridge_connector->bridge_dp_audio) {

-- 
2.55.0


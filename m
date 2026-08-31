Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76C1480DE0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192850; cv=none; b=dzgnJRtxEpvNGBQtVXI9H/YYw0Zdw626FaC905UHSFzPak99gz0FtdFV7icSEQpdzQlA9o6u8v2yt4kR2Nz22bUch2vS0vro3hK+X2tkHIQbDLoAt4PXCXTpdUb/g4swzJycbGQGnJsJGttCve3pxzSSvpu2Pp9i6XbPq5AoyTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192850; c=relaxed/simple;
	bh=FQNk5iO5F4PNlyeJ4M6/shnJjM0XCarx4Uhng168aVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cb/L7oggNo81rto56o5fp14RiOMnqT2MVcivSOBdQs6kxLdQ25dLPibOUdpbW6U1FFQa2QFHfGIQKJ7iL3PsvCKsqvGrP2ypb4Wul9UMu/ZStKpvd81SEVvA4rSr57Z+cbYxJVUo4I7OxIievwVjMy+PiznklEmRbjsLsQcaK08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zOz/Yqpy; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zOz/Yqpy"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CC0BD1A1903;
	Mon, 31 Aug 2026 16:14:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F6A560231;
	Mon, 31 Aug 2026 16:14:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDE6011C78B96;
	Mon, 31 Aug 2026 18:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788192845; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L47f4WHA0oklyqWY/79F9ARDY2+1ZW1V7S/l3+FjfBE=;
	b=zOz/YqpyyzMAIVASK3DCyc995EjsjJSCqlJwWyZc6RGLLfa/U2OTwTUGx9JCtxSe3U/bvb
	WlWB8Ys2+tqLmPs4+rzjWPgtMN9PInV39Yt4c/cCWLGbdBWHpK1uyicfrDYMjNowfzXdeI
	HsVwpd2LBhRw1oOKTOJnusp8Y/TTdxVASD00OCnVkGxkX4nR86A5F9Unj32CthHyVdRU6+
	L/gB7TZdkuE2TSK9PiCgM/k7BoiFk9Dymr+oQuGZJt/ZDbZWLj/pkMblnUGXTAxkLpkkvT
	UTa8AxgsWu4J5BaBU87ATN845aGhfhtaFdgYghbNwnz5wOFzn1cTQmNpyYzY+Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 31 Aug 2026 18:13:27 +0200
Subject: [PATCH v3 01/13] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw:
 don't select unused DRM_PANEL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-bridge-drm_panel-cleanup-v3-1-50efd8168b3e@bootlin.com>
References: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
In-Reply-To: <20260831-drm-bridge-drm_panel-cleanup-v3-0-50efd8168b3e@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This driver does not use the drm_panel APIs at all, so no need to select
DRM_PANEL.

Cc: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Andy Yan <andyshrk@163.com>
Reviewed-by: Ian Ray <ian.ray@gehealthcare.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 4a57d49b4c6d..a999e57d0cc1 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -225,7 +225,6 @@ config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
 	tristate "MegaChips stdp4028-ge-b850v3-fw and stdp2690-ge-b850v3-fw"
 	depends on OF
 	select DRM_KMS_HELPER
-	select DRM_PANEL
 	help
 	  This is a driver for the display bridges of
 	  GE B850v3 that convert dual channel LVDS

-- 
2.55.0


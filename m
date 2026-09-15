Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86B64B66E2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490848; cv=none; b=tV3bhUO5nMViNkiM2B64bsboJilOrrngCr3BNIuWuod2RdUBzObsrC3FUFRuHsk0aY9hik1Mgc86fQ7Dzg17hBjTSMpe/MQFsWmoidmZdalDxGSlirg+9JgeGB707dhgTTX01vsQ/SvUy5i3Jkr2J6P2VJ0tiPIyVq05fsQMBuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490848; c=relaxed/simple;
	bh=eLD1gC6OWFZs65V4YytgwtBxQdBqbqcrmCJg1x6knM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rQ8fe64Wp4s1VV4Eb8Vxk6088NtdiEmfMGSqBKNvPebPLj38eaQ4mZn5CskSN3UyIznPV434Llffff2uDVbbEbqNMM3/UBk2uYfX/xQOv6qYrG+T7v14NplsWN1cNTrJuVxRwuorC9bgseA+YG2U5bT9Jn3UJ8uvf24U/Kar1OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FtmzQ07B; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FtmzQ07B"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE0AC4E40639;
	Tue, 15 Sep 2026 16:47:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA326602B0;
	Tue, 15 Sep 2026 16:47:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E518711C7AFDA;
	Tue, 15 Sep 2026 18:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789490833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4S2yNFw54mi8kizpo4SMAmA0eCb6FLd+PRdQwv2Y0fs=;
	b=FtmzQ07BTvx8EdVKTbS9SyOs1Kq3yodV33IwS4cYJlkwrsqEPrH3vNmLuo2ddjrFt3FC6g
	ydTKwgVpUG7Xmts1kcQf5OiPAueVoYHOdIR/NuuWXtEOyTfI0OZd1JD0ns/i9lT3xZTJ+4
	lJ0gJ3cPBkwcnl9/bDwPWZmguUldIQaqhA2Nr0vyQnH10nKUcbrtATqKU7BGgwMCLKz6jD
	fRK3BsxUZHwF4psveFWPcKXarEWXlRfyhTlnAK5FQ/3cetLBCslnghC6EpxKT0OXK0CowF
	qDYexFgpbeZvqvQPTdNKyuLnsOJRUv8EEHXHcHuH3DE8BbVQPO9NfZ6NbqUhIQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 15 Sep 2026 18:46:19 +0200
Subject: [PATCH v4 6/9] drm/bridge: tc358767: select DRM_PANEL_BRIDGE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-drm-bridge-drm_panel-cleanup-v4-6-30401d9406f3@bootlin.com>
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
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
 Maoyi Xie <maoyixie.tju@gmail.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This driver uses devm_drm_panel_bridge_add(), which is enabled by
DRM_PANEL_BRIDGE.

Leave the 'select DRM_PANEL' because it is needed for drm_panel_put() which
the driver uses.

Cc: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index e2ee76899468..a4bc1b5401c0 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -400,6 +400,7 @@ config DRM_TOSHIBA_TC358767
 	select REGMAP_I2C
 	select DRM_MIPI_DSI
 	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 	help
 	  Toshiba TC358767 eDP bridge chip driver.
 

-- 
2.55.0


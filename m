Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C473511E7E;
	Tue, 29 Sep 2026 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678226; cv=none; b=sgdW8r8v9OYv+crwX79BIUya9quKrfBsbleqe2+T9tx2igU+DiFgSKaxP7cCbzfoltbi5sW5YJnzBwiSBuo1Eqr4fmg84TJTlFum2mswh8/+wYPc9ej9JtwQl4yMuHx6n/VywwSIItLeVYlgLIxfsFkq4Ry++2KijmTtUSBXhSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678226; c=relaxed/simple;
	bh=+q3VRW0tbQD5J7CwSEkTWOZby1Fjzfk7r/VsY7YVllY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bacbGlZFpCeXUapZZ7cBPCUa44UINVRx41nNObSNpSETx5t+/0Tw5jcdvHLahhIDEM8qjMbGwfQb638g2KWaKG/LfnWVuXqcjdHyKzSJi+y+iDX7PwGUyZBDsrt7Z0ln69Doj1UpmKuiZfFNXe/vCQOhKhAEvsaKkZNdZ+0rOjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wCR4TJCZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wCR4TJCZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B8DEB1A1057;
	Tue, 29 Sep 2026 10:36:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 883CE601BD;
	Tue, 29 Sep 2026 10:36:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D5D8103295E3;
	Tue, 29 Sep 2026 12:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790678205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=VvnYtqd0myYRNK/90yLn0GAD8hhlBrrwU4M1ju3ptmQ=;
	b=wCR4TJCZEG1EFZ9sAHD+M9t7myv55BOEKz3ojLI5zZT8kNCNQ69VpEl5WgAyAaIuXU8JYV
	TnAtkjlIUsZjY6BsgZwBu46it15MdA0pkZHV4IBB0BeO6gblx+LFTsXwpwzO7lCu8zmpQq
	RdpdBnGZQSwwdJhHENya2deNsUErubWClvCA2GbjT6k7eQEyxhhReE+7zwrqz8kPJTui1i
	DpntxKdFxNSdU7USbUVpNAWiJ5nEf44lNvBk+ViXRvWUCSS1L4gvH2FFFn0QXCCPoEmxfg
	ZbHJpu0Rfil2TPXIB8Jwt3ffw6lEsxzPhoMzACTwb1pHGMIbjpdV2DjJpYy0HA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/7] drm: remove deprecated *_of_get_bridge() from non-OF
 drivers (fixes build regression)
Date: Tue, 29 Sep 2026 12:36:32 +0200
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0QqDMAxFf0XyvID2Ydj9yhhim7RmbDpSlYH47
 4vz8cC5525QWIUL3KoNlFcpMo0GzaWCOPRjZhQyBle7a+2dR9I3JvnilLrMcxdUyKSwyItQOSu
 XI4G+Tc6ltm8oRrDYR9lW/6P74+SyhCfH+ajDvv8APlv53IoAAAA=
X-Change-ID: 20260929-drm-fix-of_get_bridge-build-regression-98f22f8a1dcc
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

After commit Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to
drm_panel.c") some drivers fail building:

  error: implicit declaration of function 'devm_drm_of_get_bridge'

This is because devm_drm_of_get_bridge() (and drmm_of_get_bridge()) have
been moved to drm-panel.h.

The affected drivers are those which:

 * can be built without CONFIG_OF, and
 * don't include drm_panel.h

The affected drivers are 3, fix them (patches 1-3) by replacing the
deprecated *_of_get_bridge() calls with of_drm_get_bridge_by_endpoint().

While there, do the same for all drivers which be built without CONFIG_OF,
even if they don't fail (patches 4-7).

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (7):
      drm/imx/lcdc: stop using deprecated devm_drm_of_get_bridge()
      drm: verisilicon: stop using deprecated devm_drm_of_get_bridge()
      drm/bridge: dw-mipi-dsi: stop using deprecated devm_drm_of_get_bridge()
      drm/bridge: dw-mipi-dsi2: stop using deprecated devm_drm_of_get_bridge()
      drm/vc4: dpi: stop using deprecated drmm_of_get_bridge()
      drm/vc4: dsi: stop using deprecated drmm_of_get_bridge()
      drm: renesas: shmobile: stop using deprecated devm_drm_of_get_bridge()

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c     |  9 +++------
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    |  9 +++------
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c               |  4 ++--
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  5 ++---
 drivers/gpu/drm/vc4/vc4_dpi.c                     |  9 ++-------
 drivers/gpu/drm/vc4/vc4_dsi.c                     | 10 ++++------
 drivers/gpu/drm/verisilicon/vs_bridge.c           |  7 +++----
 drivers/gpu/drm/verisilicon/vs_bridge.h           |  1 -
 8 files changed, 19 insertions(+), 35 deletions(-)
---
base-commit: 91ceac83e599c9d48da4c4d2d91410c588a215f7
change-id: 20260929-drm-fix-of_get_bridge-build-regression-98f22f8a1dcc

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


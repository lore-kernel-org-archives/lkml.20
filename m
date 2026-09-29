Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA885218A0;
	Tue, 29 Sep 2026 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689217; cv=none; b=m3BltsUPDAYgm8sctbLTyxdXfGCuxynp3f8VQXtVF32zc1TIRpJan9NnEFD7ILW2QH+hrxouphMZzvsdSCORjXlSs07nW5q1RlS5ShG/3y1KA7laPLkiG8dpXvMnnl+IoqUQDSLVmssS9cKgS3UGK+AUIIKsF02zSP2X0zXoU7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689217; c=relaxed/simple;
	bh=mdpdBYUEZ10+v6WQwAMS0hhhA974VznRErhTZ971b8w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZjFMCk/y26/MgwGogu941NxLX1LA0KJpq6ReEdN/iBXoEuo/5ORgHabjsm0DUl16LiQd9FWtmuLtBeFlz2YK2HdjXPlhMcvs8H1/uuxtLHJo34HCd0joP4uejGBapCw1cuhENa+u0UO/uDbq3QojW3qlHWVyTdMj5571G6vkxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KYbH4dvR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KYbH4dvR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 342C14E410B5;
	Tue, 29 Sep 2026 13:40:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE07E601BD;
	Tue, 29 Sep 2026 13:40:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 798F710328E3E;
	Tue, 29 Sep 2026 15:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790689210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=li47V/+ljdl1K8BeLPH5PnBYfAJEyKs5Q3gRsX1+S5M=;
	b=KYbH4dvRx16/hbjludcvkJCeygqzesh+LtiUHUpPgqqPaxRrOwycDAR+sTjFWaTTelFffM
	oqUMECt6splE610HbWnPyHhAuKPOjzHgCbnfNUeDr8fWV0HL1gufRgXKHmZ9r/XY7Htrqu
	2J07esEd869Lf4uxEWdBCYSFUmAxGyN+87uevSpxZtEcRffjII95rye8qmk8bnbuZTCsuy
	09pn0RkDakTqYUNo8BVZmhRhntAIkq9LzBjyGZuIFhhWLol9I2/273nm2x1I9s95e4rBGG
	sp1ehxIYDJk2i3sRcQWcXdYaRvOa/AP11mLzigx3oif5FF6/f1iCtkXX7TwH9w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/7] drm: remove deprecated *_of_get_bridge() from
 non-OF drivers (fixes build regression)
Date: Tue, 29 Sep 2026 15:39:49 +0200
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBBGr2K6dkzpAsGV9zCE9GeAMUDNtBAN4
 e62eAKXL3nzvtlEQCYM4nbaBONKgfycQJ1Pwg567hHIJRZKqlLWqgbHE3T0Bt+1PcbWMLkkmYV
 GB4w9Y8gJqKtOqa7ShbNWpNiLMV0dQ4/mx2ExT7Qx17MxUIieP8cna5G9v0fXAiRYa65YSuW0d
 nfjfRxpvlg/iWbf9y8h5IPr8AAAAA==
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 kernel test robot <lkp@intel.com>
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
Changes in v2:
- Fix bugs in patches 2,3,4
- Fix removed function name in patches 5,6
- Mention lkp reports in patches 2,3
- Add review tags on patches not modified since v1
- Link to v1: https://patch.msgid.link/20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com

---
Luca Ceresoli (7):
      drm/imx/lcdc: stop using deprecated devm_drm_of_get_bridge()
      drm: verisilicon: stop using deprecated devm_drm_of_get_bridge()
      drm/bridge: dw-mipi-dsi: stop using deprecated devm_drm_of_get_bridge()
      drm/bridge: dw-mipi-dsi2: stop using deprecated devm_drm_of_get_bridge()
      drm/vc4: dpi: stop using deprecated drmm_of_get_bridge()
      drm/vc4: dsi: stop using deprecated drmm_of_get_bridge()
      drm: renesas: shmobile: stop using deprecated devm_drm_of_get_bridge()

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c     | 11 +++++------
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c    | 11 +++++------
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c               |  4 ++--
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c |  5 ++---
 drivers/gpu/drm/vc4/vc4_dpi.c                     |  9 ++-------
 drivers/gpu/drm/vc4/vc4_dsi.c                     | 10 ++++------
 drivers/gpu/drm/verisilicon/vs_bridge.c           | 11 ++++++-----
 drivers/gpu/drm/verisilicon/vs_bridge.h           |  1 -
 8 files changed, 26 insertions(+), 36 deletions(-)
---
base-commit: 91ceac83e599c9d48da4c4d2d91410c588a215f7
change-id: 20260929-drm-fix-of_get_bridge-build-regression-98f22f8a1dcc

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


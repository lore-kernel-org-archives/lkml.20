Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C9A3F1041
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906897; cv=none; b=c3pAt6B9oK76bo0eQENactg+i0D8qQ6yPZkYzZ7J3lpp3Ya0pxI9Sj6YzBGKBAV+iN2H+TCXIlkujMmUNrf7WpCSttKAWd9FNUJBOCJzh8sl2rgiTjPqsQddGDKDBDuQZSJRoVPAtnqiy/ELyrOeni+g96dINTksiNlY/g3/Q5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906897; c=relaxed/simple;
	bh=a9kQroVKeOdWvlL+KYo2+mSovewMxk8pKEN1+JoGhZc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=pVMqSTaN0xPO4LAlnI7/QTJrz6IOZ4/VkO2ZG+/D+8VCTmYSkW0w/XRvmbJEG3y7gBMPMZHMNimAHsMfuaIJukEtd+o5qtNbTC+14vr2wMDaKhTxGpTKSDOwJmgjeW0ftw60bJCAr3yUQArRDM4BfJqo+G2XdhcfSatl7c9d6io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=rAEMia8/; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="rAEMia8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1787906866;
	bh=fU2EHerhlIwxT2o5ahO4wxyga76HDhwM2gRiLj32KsU=;
	h=From:To:Subject:Date:Message-Id;
	b=rAEMia8/qC37dxyAeYkBUYqVtaRjKuNrQp/atAywRT/6WJfeO3oL5pRcvF8e8wFMF
	 oUC2+YxDPV7DIAl84fx5KgdiwYv3qJwFkUsTgGjL7MggLgo1oxx31oWvg/IRkgqZQD
	 kQsmUEf2S5YoYdOjO0v1/w+4xekTaIH/HJl4XN8k=
X-QQ-mid: zesmtpgz6t1787906864td0ccb54b
X-QQ-Originating-IP: rkT6K/MSciY2YH9oQfiA45bVQ3QMm0H3itZhu9mfyNk=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Aug 2026 16:47:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3426117217437372849
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 0/7] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Fri, 28 Aug 2026 16:47:30 +0800
Message-Id: <20260828084737.565-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NBkDu2gtk8Xi+8Knk8WSsoh8ZfzDo4HXAqdNejpm4OjhtF+utoh4+zoz
	kpMPPIckWKazu658jPq1uM6MXjLMQ/K6saGBEH1X7aejLKOKrDCI9Kbwh63L/aUXyN8rONz
	KsBMrbwhgmEaLwNloG9IJcfHcberz0v6u4MuvhC4L/lVzhCWv7mOPDuQcM5I+6kWVZEOMq3
	sWgOpBH+dJhsD60/cQleijX0GMPYYJCMYV+qv5PcwO8uA+T1aaRGB/Zz5qO5XELqq2vYX2J
	DMtNx5lKADSsd9Pw0t48fM6R2IDXyGN5JFzdoE37CaUEv0eoZYA9XfDkGTwW/N99MZhW6fe
	M0GVmOEqGnWOU2rmQXQ+eoZB4LkjZdCTGp0Jka9q6+hVDlxooa3x7lpSxysJ6IVnmANrr6e
	AI0CPSoLDLszGA6ZOBxnXCtgTqtvkOXBi4WRjDm5fAo6FYTvc/yKyyW9QJsIeQS9+SSKSNn
	K8ct+zdDSJAb1QiKjKm3alhhcb4GRAoaKks04YuNq4E5Bx1cWcosJgZS7C59Qhyo9pLz73d
	mt69+0D3ch9ToiV39rR4pfnLWzlcZ7s50d0uAEA1+9vTtQ+1AYMgEkqg3XMyRIUc9qftgps
	Vga2es3ER9BWlWEoTapL2b0LYbniaeiWVOSag+nEN+5Glvv1tF1L2SPQ1tM4lvkKJv4jm8G
	pzzZWgc4RkVOORU4bkezCnPH4id6YlgvmYUeEzfXGuZjWjFEae4wGc9sM6L3qQQ8FHnsp8o
	/7+E1QMSzOUSlXfGHvby6GsRnt5UZVqaf2PGnjiYSvjpsoyE+zBtHqPuShmspHq7qg2ZZsB
	d2SEXDIcjABofSRhVGOihfe6w2nWeKtsIWkV3TOtyZtQLuxVee+3zw6qKC+QFJZbCAgmB5Q
	+l0B13TDKwuybxqhgVxZ+URF7PExsBy1mGQoLeJBSkVn4kCSfmrmeND/tna1hPPfPRDeUzL
	GZdX6LoItLCxFI767/2DUd9JjNY1lwkjW/1m9Ly01wZQ4fWXYQMgh9bJ59JmzI/xeEhNnud
	0oz22U07C/VfBztswhBaEH2os8XLk=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series is split from the v15 "Add Type-C DP support for RK3399 EVB
IND board" series [1]. It focuses on the DRM bridge and Rockchip
platform CDN-DP controller changes.

[1] https://lore.kernel.org/all/20260304094152.92-1-kernel@airkyi.com/

====
1. Generic Type-C DP HPD bridge

Currently, several USB-C controller drivers register their own DP HPD
bridge via aux-hpd-bridge.c, each duplicating the same logic. For
devicetree based platforms, the USB-C controller may vary across boards,
and not every USB-C controller driver implements this feature. Patch 1
implements a generic DP HPD bridge that monitors Type-C bus events and
automatically creates an HPD bridge when a Type-C port device with DP
SVID is registered.

2. Multiple bridge model for CDN-DP

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. Patch 5
introduces a multi-bridge model where each PHY port gets a separate
encoder and bridge, allowing flexible selection of the output PHY port.
This is based on the DRM AUX HPD bridge rather than extcon.

====
Patch 1 adds new API to check whether a DisplayPort HPD bridge has
	already been registered(Sebastian).
Patch 2 adds generic USB Type-C DP HPD bridge (Dmitry, Heikki).
Patch 3 adds module soft depend for USB Type-C DP HPD bridge(Sebastian).
Patch 4 adds new API drm_aux_bridge_register_from_node() (Neil).
Patch 5 adds DRM AUX bridge support for RK3399 USBDP PHY (Neil).
Patch 6 drops CDN-DP's extcon dependency when Type-C is present (Dmitry).
Patch 7 adds multiple bridges to support PHY port selection (Dmitry, Luca).

Changes in v7:
- Link to v6: https://lore.kernel.org/all/20260804070730.68-1-kernel@airkyi.com/
- Fix extcon HPD detection by checking lanes in cdn_dp_connected_port() (sashiko).
- Bound endpoint count by PHY ports to avoid overflow and uninitialized reads (sashiko).
- Use drm_bridge_clear_and_put() to clear next_bridge_list pointers (sashiko).
- Clear EDID cache pointers after free in unbind() (sashiko).

Changes in v6:
- Link to v5: https://lore.kernel.org/all/20260730013349.51-1-kernel@airkyi.com/
- Avoid duplicate registration of the same DisplayPort HPD bridge.

Changes in v5:
- Link to v4: https://lore.kernel.org/all/20260727064408.101-1-kernel@airkyi.com/
- Add module soft depend for USB Type-C DP HPD bridge.

Changes in v4:
- Link to v3: https://lore.kernel.org/all/20260717072323.96-1-kernel@airkyi.com/
- Scan the entire typec_bus and attempt to register the hpd bridge,
  so as not to miss devices that were already added during initialization.

Changes in v3:
- Link to v2: https://lore.kernel.org/all/20260608070805.88-1-kernel@airkyi.com/
  (Sorry, I forgot to add the "v2" title, so it looks like v1.)
- Remove now-redundant call to drm_connector_attach_encoder()
- Rebase to v7.2-rc2

Changes in v2:
- Link to v1: https://lore.kernel.org/all/20260521032854.103-1-kernel@airkyi.com/
- Add copyright text.
- Remove useless goto.
- Fix incorrect function names in the documentation comments.
- Fix the check logic for dp->active_port (0 is valid).
- Fix the uninitialized prev_port.
- Remove duplicate logic from cdn_dp_switch_port().
- Fix the prototype of cdn_dp_bridge_hpd_notify().
- Properly release connector->fwnode.
- Properly release next_bridge.

Chaoyi Chen (7):
  drm/bridge: aux-hpd-bridge: Add drm_dev_has_dp_hpd_bridge()
  drm/bridge: Implement generic USB Type-C DP HPD bridge
  drm/display: Add soft depend for aux-hpd-typec-dp-bridge module
  drm/bridge: aux: Add drm_aux_bridge_register_from_node()
  phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
  drm/rockchip: cdn-dp: Support handle lane info without extcon
  drm/rockchip: cdn-dp: Add multiple bridges to support PHY port
    selection

 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c           |  26 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       |  42 +-
 .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  |  67 ++++
 .../gpu/drm/display/drm_display_helper_mod.c  |   1 +
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 365 +++++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  18 +-
 drivers/phy/rockchip/Kconfig                  |   2 +
 drivers/phy/rockchip/phy-rockchip-typec.c     |  13 +-
 include/drm/bridge/aux-bridge.h               |  12 +
 12 files changed, 486 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

-- 
2.53.0


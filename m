Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481328;
	b=cTAsCYFHdUgr1okpYYSdQXClCgTVpCw4sZV8MxUFCfG7IJfTWd/VxjodkFI8AkqOeSfp
	 H+wnH1KQ24VejewG84tyMJHa6CUATdsRfSdBCNsxMn+mjDIeGYObHb/wyiS42aAO5Wt4b
	 PLuiazPsxAuhdF2Nku/2sMN/b88h9+NLYnYOHFr3+fbYeXedau5HGIMJy3QdvYsIev6k8
	 EFchb76+QMe6jogTmwHK5UvCCv2BxgfRI7s6wvFIAR6V2vbCb8710USjeX/zAkxa6bIdc
	 DK4P1EYcsLU3GuG9m7Gv/LOOLuJugkKw9Nc7eHbSY2FObOuPeepkyyl6vIYSisE/PXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481328;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=pZgjT+oGEQ5K4V8MyzWimB+k4UA7CFJooI9DXyiZa2E=;
	b=NmGS/3e+4opNEqOxuRdAGfsbYYA9ZRrArnvHORhWdrd3MmDos6lYdkuMnl4B7FXS3gQq
	 p380nHOQs6IbVhL+/r0CCQlt6uITg1kHNpG6EmduIujdj2dQY9tYGeLeBxcWUigBKXMPn
	 VBfAhW95rEKvG7BXzl9avHlvmU8aMMGvvMSwiqpf3VX77KV4dqY6NQoK44iDjhhzzq1Dm
	 uW/cO0PvxV4C1eQsTZHRuyG33rcnSKvqEovKVScAMJgFTfz4pVSWKQHMuo2olm+bpzC/Z
	 r4LScn98z2BqL+BRg7NdXergISOVqro+eGDRNMZlSZ6swCzlXDQVgsqe1tZlTMgg7ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=MCmzGiyL;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA0A606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA0A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=MCmzGiyL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792481317;
	bh=pZgjT+oGEQ5K4V8MyzWimB+k4UA7CFJooI9DXyiZa2E=;
	h=From:To:Subject:Date:Message-Id;
	b=MCmzGiyLS89dD8rLweuPEhR2JKiaYWZkCbmVM25aR6zu4zgGdFQROhw6Dqz1sry3/
	 GCQPkFkiOpci8HmrBNOBvPtWXsx6uH3EXRX/dOkCypBRgTmA32Zu0rHRGqq/5Lsmjd
	 m0CdllQwUKFHuxU3SVFJ7EYPiuX3To1YKXxt8OlE=
X-QQ-mid: zesmtpsz4t1792481315ta7e4ccdc
X-QQ-Originating-IP: BaQu2KOZZmPISr3BKq2G0ONYeW3roXRaqXQcRqdiHvM=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Oct 2026 15:28:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1917325487105428466
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v8 0/7] drm/bridge: Implement generic USB Type-C DP HPD bridge
Date: Tue, 20 Oct 2026 15:28:09 +0800
Message-Id: <20261020072816.180-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MR8/ogc3Bh9O2h708g9J8886t4ScvAAYEnaEKhDBowKMJAjrwveNDGi1
	ja58q0kH23zjend0Imv/F8+WSekHx3OHnSPzLeTCGz07VQoHLYOhy831sNwlHR9ps/LAL03
	CP1k2LG3hyAKk4blowxqMAseFFX0Lauex7PlCoHd7o+HJ4+V484TllAAhs87Bhrn6A95DsM
	fv3XSzi7PEI04gVAcINDUVZtZa8GuXqKbr/9IZix59s2fuOxuYTG4k6LYHr6DNbVgzFscU6
	3KOkfDQXGr7tRH3mwRjCTqFVtYDZyXOsp3RuVzAlW4mRtJbURT79+x4TP+8Dphp18exCpvf
	KRPhfy3W8Z3Cj5HTU3hnVdO/qNj9yCy90SUyc7tgXqH0KjvLjY8MF/8JHNaXknXL7D/ucoL
	xTCX/eqirAOTE2zUN5MjVTU/4Oqol8zKc7+ayanNgVnNfg7J3pW/zs1Iez1jtPmnll59zzQ
	0FWR24JiyxJ7EztywEeMKW5kRxkxGgZvGyWNN48PeYb5CePK00qwqWN7br0l/lFRD81M02+
	7y2tbDakbeWxYaV4evtOMzEToO1pOTRbRq+wzY9dHKWGRxRfZpSliuIguMowydI8ulXFZGu
	9BNthDkZag50aw0/cLYC4qh7t34vxahKH8SeScNV4li6rZCkksZLXDU7D3T+KoZ5sXV/6/x
	ertK+YHHYCe/6RmFa+cSmU2y7iIy9Lh9GQv+Ecmjm2JvlUvxd9I2f2qcPouAVbbh5ubj6xI
	/wTkzMVUwoTFCxUsMnGSZ8uTPT52n6aD+o/bGTp+BVSYSK7C+82Y07BEGJ0Uc9GTdN5NiY3
	08+58Omh5XpzgISU69fT3o+/7zs1KM+xC+lpw+mXJxWJkgWViwefVky36VB6WzPN/b9r31t
	gGAKuk+Iy582GOlLp6S3n/R6Zc9m3/PEURB7SA4MMBDD10c7gv7+N5CxlSWYzP4o1Fq/6b5
	fonrSz0fP+yt4AwIJlpH87RaqKBZ9OiHyDTvIXFIaMwFPSCM1cfFCPaF09GYGUjW/xfjpH/
	BHrfgdSlRvc8KxTtic
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

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
	already been registered (Sebastian).
Patch 2 adds generic USB Type-C DP HPD bridge (Dmitry, Heikki).
Patch 3 adds module soft depend for USB Type-C DP HPD bridge(Sebastian).
Patch 4 adds new API drm_aux_bridge_register_from_node() (Neil).
Patch 5 adds DRM AUX bridge support for RK3399 USBDP PHY (Neil).
Patch 6 drops CDN-DP's extcon dependency when Type-C is present (Dmitry).
Patch 7 adds multiple bridges to support PHY port selection (Dmitry, Luca).

Changes in v8:
- Link to v7: https://lore.kernel.org/all/20260828084737.565-1-kernel@airkyi.com/
- Send missing HPD event to userspace in cdn_dp_pd_event_work() (sashiko).

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
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 369 +++++++++++++++---
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  19 +-
 drivers/phy/rockchip/Kconfig                  |   2 +
 drivers/phy/rockchip/phy-rockchip-typec.c     |  13 +-
 include/drm/bridge/aux-bridge.h               |  12 +
 12 files changed, 491 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c

-- 
2.53.0


Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0DA535FA0;
	Tue, 13 Oct 2026 22:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931927; cv=none; b=sCfDwOMHqex7omEIpdqGl8qgtbJw1uF/wmp6mD+BeSsVBaiK2cJXnSJGDTcimiJq/2SUJgOO3XGTTlLjV8zTXa5kXr2Kp6JjKROAREDevWQErDGZFlHliSeIp7eG4vLkluuJGDGnAa/CVcYeYT8429iiQVO18WrdzHCw6rG5fuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931927; c=relaxed/simple;
	bh=FFe+p5tRUGDgwsZYDsPl+7ZOo4rO49AQKBgKoo4CTh8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OPptEU5IBS6l2LOBxjuvwTxkItFur34WpFhDA0Z5eh6ni0Aew9eHU/mnR4cLQygog4LWRzcS3CfAaaPCw2eaRWEO292/FJzkR+Ku3lXi2Ov5D3nyeoXJm84vi5975lr+bjl3yCNjEnE51ro8343YTYnexG/5nXjU8XtSaLcXVvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CEziA9dO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CEziA9dO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931910;
	bh=FFe+p5tRUGDgwsZYDsPl+7ZOo4rO49AQKBgKoo4CTh8=;
	h=From:Subject:Date:To:Cc:From;
	b=CEziA9dOrXle/OLbz5LpMH/elrQJLb/eVCWUL1PNKA/Vi2BDMg34VkVtVEwZdfvoM
	 VCt75IWfGQ3JNeZwh4gw1REq5hoHf7KO1UtX2/DQFY3dLKnkyLJ0HhekqVSyLM8/dS
	 qF5Vu09MML7JWXwLypFVNsbQB0Aak+UfTmiDkQwN3w2/yaxp6/Cifram63lvaydgA2
	 2RD+UuzeStDscqLQDA3+lMyzPsunqB1e5NHWqBkCSpmaVp8bHFawv3lWSTOlh16MOe
	 tVpOnTrcZhe9F/Zy8s09PBqaRVJoJsM39SgbWpNt6PSvImhVXj3rPE+55bZDJlA7Pn
	 Uh7VIuikgtxeg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAE7517E05F1;
	Wed, 14 Oct 2026 00:51:50 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v5 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color
 format on DW HDMI QP
Date: Wed, 14 Oct 2026 01:51:17 +0300
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOzW4CIRQF4FcxrEvD34B01fdoXHDh0qFRsYNij
 Zl3L9iFTccuT3Lud+6VFJwSFvKyupIJayop71sYnlbEj27/jjSFlolgQjPNDQ1nOoZdop8Hejl
 VKoBFAzCAW3PSjg4TxvR1A982P7mc4AP9sSu9MaZyzNPltlh57/2LV04ZdVoPPgamgwmvPm+3D
 vLknn3ekT5QxZ0wTC8I0QiwHBCkDBjiI0L+JuyCkP0L5exaOBsFmkeEuhOWyQWhGhFBDRAVVwb
 hLzHP8ze9zhf3iwEAAA==
X-Change-ID: 20260617-dw-hdmi-qp-yuv-2b0f7bb5ba81
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2

This series extends the output color format support of the Rockchip DW
HDMI QP controller to cover 10-bit YUV 4:2:2 and 8/10-bit YUV 4:2:0.

Patches 1, 7 & 15 improve VOP2 robustness on RK3588, helping recover
from exceptions and preventing random display output glitches observed
when switching modes that also change the color format, e.g. from RGB to
YUV 4:2:0 and vice versa.

Patch 8 avoids an incorrect DCLK source switch for 10-bit YUV 4:2:2 by
forcing 8 bpc in the bandwidth check.

Patches 2-6 address a few vop2 related issues reported by Sashiko, while
9-12 are additional cleanups/improvements.

Patch 13 adds MEDIA_BUS_FMT_UYVY10_1X20 for 10-bit YUV 4:2:2 output,
configuring the PHY with 8 bpc.  YUV 4:2:2 always transmits two 12-bit
components per pixel regardless of color depth, so from a clock-rate
perspective it is equivalent to three 8-bit RGB components.

Patch 14 advertises YUV 4:2:0 output, now that the bus-format and VOP2
support are in place.

Tested on Radxa's boards ROCK 5B (RK3588) and ROCK 4D (RK3576).

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v5:
- Rebased onto latest drm-misc-next and fixed the conflicts introduced
  by the recent addition of HDMI 2.0 support to the DRM infrastructure
- Updated patch "drm/rockchip: vop2: Reset AXI and DCLK to improve
  robustness" to also assert the AXI reset in the bind path, fixing DSI
  panel support on RK3588 EVB1 (Sebastian Reichel)
- Added new patch "drm/rockchip: dw_hdmi_qp: Do not mask error code in
  atomic_check()" to fix a pre-existing issue reported by Sashiko
- Link to v4: https://patch.msgid.link/20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com

Changes in v4:
- Collected T-b tags from Igor
- Rebased onto the latest drm-misc-next, which now contains the HDPTX
  PHY driver fixes, so the runtime dependency has been dropped
- Link to v3: https://patch.msgid.link/20260709-dw-hdmi-qp-yuv-v3-0-a4a982a9f2e7@collabora.com

Changes in v3:
- Updated patch 3 to skip any hardware programming in the callbacks
  gated by drm_atomic_helper_commit_planes() after powering down VOP2 on
  an atomic_enable() error (Sashiko)
- Ensured VBLANK events are sent immediately when atomic_enable() fails,
  hence preventing userspace processes waiting for the page flip
  completion to hang indefinitely (new patch 4, Sashiko)
- Rebased onto latest drm-misc-next
- Link to v2: https://patch.msgid.link/20260706-dw-hdmi-qp-yuv-v2-0-b91beb33dedf@collabora.com

Changes in v2:
- Collected R-b from Krzysztof on the binding patch, while also fixed
  the property ordering in the example
- Renamed vop2_clk_reset() to vop2_reset_assert_deassert() and used to
  devm_reset_control_get_optional_exclusive() in patch 6 (Philipp Zabel)
- Addressed several issues reported by Sashiko
  * Reset AXI before detaching the IOMMU domain, to close a theoretical
    window where stale or in-flight DMA transactions could fault or
    access memory untranslated after the domain is detached (patch 6)
  * Fixed resource leak on vop2_enable() error path (new patch 2)
  * Balance state on atomic_enable error paths (new patch 3)
  * Avoided division by zero when computing max_dclk (new path 4)
  * Fixed VOP2_MAX_DCLK_RATE overflow on 32-bit (new patch 5)
- Rebased onto latest drm-misc-next
- Link to v1: https://patch.msgid.link/20260617-dw-hdmi-qp-yuv-v1-0-a665cfd06d7d@collabora.com

---
Cristian Ciocaltea (15):
      dt-bindings: display: vop2: Add missing reset properties
      drm/rockchip: vop2: Fix resource leak on vop2_enable() error path
      drm/rockchip: vop2: Balance state on atomic_enable() error paths
      drm/rockchip: vop2: Send pending event when atomic_enable() fails
      drm/rockchip: vop2: Avoid division by zero when computing max_dclk
      drm/rockchip: vop2: Fix VOP2_MAX_DCLK_RATE overflow on 32-bit
      drm/rockchip: vop2: Reset AXI and DCLK to improve robustness
      drm/rockchip: vop2: Avoid DCLK source switch for 10-bit YUV422 output
      drm/rockchip: vop2: Consolidate HDMI PHY PLL clock parent switch
      drm/rockchip: vop2: Switch to enum vop_csc_format
      drm/bridge: dw-hdmi-qp: Log resolution and refresh rate in atomic_enable()
      drm/rockchip: dw_hdmi_qp: Do not mask error code in atomic_check()
      drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422 output format
      drm/rockchip: dw_hdmi_qp: Enable YUV420 output format
      arm64: dts: rockchip: Add RK3588 VOP2 resets

 .../bindings/display/rockchip/rockchip-vop2.yaml   |  46 ++++-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  12 ++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  10 +-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  15 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       | 217 +++++++++++++++------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |  10 +
 6 files changed, 247 insertions(+), 63 deletions(-)
---
base-commit: 3e32932d3626d0279f9b3531bd648f8c0a16cb08
change-id: 20260617-dw-hdmi-qp-yuv-2b0f7bb5ba81


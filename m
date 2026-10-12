Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CECF279DCC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817895; cv=none; b=R+TCGhYU1gUjdMXka9BgbFMdu8SpmXjN3zjBhAH2m08tuImitrNqV0ZOkLdQKMJ9/o5ZzagWARAE226IeJv7SqiCKsTpfMrP9RxYRODB6KfAZih+PAAsN0VTbdhd8ZQ3eI9uuGGE9qg33Ge8uVqM93yWqYlJgMW5zPvM3+0ByYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817895; c=relaxed/simple;
	bh=A/HNB0CKwqWXWtaSB3j9UGdyZPAa8QPy4nS9NOdMTbw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b6+p9JWtIjkrTu4ian0RRSGbT3M/JRLHXBiR0+GmBJA+wByh7I9CCI8noGPXrJysKX1lIVbKS/YmUkR5QbGbdR4cYPwDtZ2mG04ZbBC31X1ROWAR0dw0ceP1UZC284DydY1XPlGMBMgNT21uMrvcImay13KVlQeBEv3zNfEmmB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aHgUcb7R; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aHgUcb7R"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CDCD81A11E9;
	Mon, 12 Oct 2026 15:11:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A0CD601A6;
	Mon, 12 Oct 2026 15:11:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B398E11D7012D;
	Mon, 12 Oct 2026 17:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791817884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GGIXi1kV+kCR2h5S/gUS/WOZ0+fEirhDT48WZLYxblo=;
	b=aHgUcb7RjoE/3nkLUjCiPBxyqhUMjDqJPhCa+pN1b8fpTJD/gqSpx+YouaDkYQA/mTax/5
	R0+c3I8S9sYnzcBIxbWGuvToSypTC1NNzkvSMtbkKE1mhJ6V2+n2DwozTaXHcQH7yYzBxV
	29jZ6mJhfARl0PQTBVOBsJCpl1IMd4d1vQjlE911WlQchP5bj5ZIH9RcZolFykQoL+PKrJ
	5dBcEpD5k3Cu+76dmJkIckEM2wvQQgSali2uYyBX8veRRztGpC+dJEgQQg3GA2kltLTsfz
	YxUR7a09D11CyahwWY9ML4kF82hL+VG5DqE+T05Cyp/JahZaAAe3nRa7KbPTow==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH RFC v3 0/8] Add support for DisplayPort link training
 information report
Date: Mon, 12 Oct 2026 17:10:55 +0200
Message-Id: <20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH/4zGoC/2WNQQrCMBREr1L+2kjyW6JxJQgewK1ISZNfG9Smp
 CUopXc3ZCPqcmZ4b2YYKTgaYVfMECi60fk+hXJVgOl0fyXmbMqAHCVHlKwlPdV3199qoweG3DS
 NbEthKw6JGQK17pl9ZzgdD3BJZefGyYdX/ogiT1lXcfWji4JxtuFS0VYoZQj3jfdTmtfGP7Ir4
 oeX4o/HxOvSkqkMR23VN78syxv9+9NJ8QAAAA==
X-Change-ID: 20260226-feat_link_cap-20cbb6f31d40
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Daniel Stone <daniels@collabora.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
 Manasi Navare <navaremanasi@google.com>, 
 Drew Davenport <ddavenport@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

DisplayPort link training negotiates the physical-layer parameters needed
for a reliable connection: lane count, link rate, and optionally Display
Stream Compression (DSC). Currently, each driver exposes this state in
its own way, often through driver-specific debugfs entries, with no
standard interface for userspace diagnostic and monitoring tools.

This series introduces generic helpers, for exposing DP link capabilities
and state as standard sysfs entries.

The aim of such development is to guide users to select the most suitable
DisplayPort connector for their needs. For example, if you have a USB-C
hub with lesser capabilities than your computer’s native DisplayPort
connector (such as HBR2 versus HBR3 support), the system could recommend
connecting high-resolution displays directly to the computer’s port
instead of through the hub to ensure optimal performance.

The new drm_dp_source_set_caps and drm_dp_sink_set_caps helper expose
source and sink training capabilities to userspace via sysfs attributes
under dp_link. Finally drm_dp_set_cur_link_params helper is provided to
report current link information at runtime.

Three drivers are updated as reference implementations: i915 (direct
connector path), ANX7625 and MediaTek (via the bridge connector framework
using a new DRM_BRIDGE_OP_DP flag).

Here is a sysfs example:

cur_link_info_dsc            sink_link_caps_nlanes
cur_link_info_link_rate      source_link_caps_dsc
cur_link_info_nlanes         source_link_caps_link_rates
sink_link_caps_dsc           source_link_caps_nlanes
sink_link_caps_link_rates

1620000 2160000 2700000 3240000 4320000 5400000

1620000 2700000 5400000 10000000 20000000

5400000

This series is rebased on top of drm-misc and may conflict with the
current state of the drm i915 tree. Which tree should pick this up,
given that it mixes core development with driver changes?

Patch 1,2: Move helpers out of i915
Patch 3: Introduce DisplayPort link training capabilities and state helpers
Patch 4: Read i915 DSC capabilities in any case
Patch 5  Use dp_connector helpers in i915 to expose link training state
Patch 6: Introduce DRM_BRIDGE_OP_DP and wire bridge connectors
Patch 7: Use dp_connector helpers in anx7625 to expose link training state
Patch 8: Use dp_connector helpers in mediatek to expose link training state

Changes in v3:
- Rework the core to use new helpers instead of an extension of
  drmm_connector_init().
- Add a new mutex to protect sysfs read write access instead of using
  the global connection_mutex.
- Move helpers out of i915.
- Add the support in the anx7625 driver.
- Link to v2: https://patch.msgid.link/20260619-feat_link_cap-v2-0-a3dec4c02ad9@bootlin.com

Changes in v2:
- Removed work converting i915 to DRM managed resource
- Remove voltage swing and pre-emphasis properties
- Expose link training state via sysfs dp_link/ group instead of
  connector properties
- Add comprehensive sysfs attributes for both source and sink capabilities
- Add new helpers for managing sink capabilities and for current link
  parameters
- Link to v1: https://lore.kernel.org/r/20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Kory Maincent (8):
      drm: Move sink link rates reading helpers out of i915
      drm: Move DSC capability reading helper out of i915
      drm: Introduce DisplayPort link training capabilities and state helpers
      drm/i915/display/dp: Read DPCD DSC capabilities in any case
      drm/i915/display/dp: Use dp_connector helpers to expose link training state
      drm/bridge: Expose link training state via new DRM_BRIDGE_OP_DP flag
      drm/analogix/anx7625: Use dp_connector helpers to expose link training state
      drm/mediatek: Use dp_connector helpers to expose link training state

 Documentation/ABI/testing/sysfs-class-drm-dp       |  85 +++
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  68 +++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |   1 +
 drivers/gpu/drm/display/Kconfig                    |   1 +
 drivers/gpu/drm/display/drm_bridge_connector.c     |  29 ++
 drivers/gpu/drm/display/drm_dp_helper.c            | 571 +++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                    |  11 +
 drivers/gpu/drm/drm_sysfs.c                        | 155 ++++++
 drivers/gpu/drm/i915/display/intel_display_types.h |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 249 ++++-----
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  14 +
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  79 ++-
 include/drm/display/drm_dp.h                       |   1 +
 include/drm/display/drm_dp_helper.h                |  25 +
 include/drm/drm_bridge.h                           |  13 +
 include/drm/drm_connector.h                        |  53 ++
 include/drm/drm_sysfs.h                            |   1 +
 17 files changed, 1202 insertions(+), 156 deletions(-)
---
base-commit: 34e9ab0182494d7599dc9759bc216550d814b396
change-id: 20260226-feat_link_cap-20cbb6f31d40

Best regards,
--  
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


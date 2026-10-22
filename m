Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687123;
	b=CGSeXza9brPEf9D9ixGhIp7JfUXBB7n9O9T5rlmd7R64FcinPYUzQO4dVz26bmYqYQ3k
	 ZOsXCUNyMpVxHKJ9bQTPn4hf1S6Z+VI+NiDwmArPomlEC58UtKbahDe5mvsLZO2qbjz7W
	 rE6VfbJuienXdxNZoXAxmgh1ZXcE0MsLBA88yGGg8nzXnzxkTwOQAh1JcPQBlXGn9ebOX
	 YNyg1PLnvIrHiPSOidODPTM8Id50Khu7OvEMIz9U8quZR+aTeRoK7qzVcyUF+9z00xlbe
	 GFrcdUo9oIMEAjiRjgeAbJ217hmWAqzbXWjN+8zJD6O6jLf25p/PlOMzmE58wBajjgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687123;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=T42Gqv1gUbqMFVHPTxAxcE7ab5XVsjECq2S74AXpAns=;
	b=44OnW3sVijb2UGC2RyDQyoQvy+Va0lu5/kcw/u+IsMmiEwj36yU2UMQLEBhOvyV92HaD
	 NDsgZxBwkvHA78gvdpTjhWsJJnDy3LRjl7Bn9PkQKzqkzH9lLrn/uIqNTkHzLnEDbm3af
	 ownUQg0k62ve7vbCA26e0ZDkc0QBwOqHN8hwVlW5jpk4AREzdawTWuVw3d52johHFKmMn
	 6SMLiZqs9k90vA4iZPqB4m2M2K+scvbpCfFhR+gvjlxuhomztVEIP0HdJMOg/UMe9klA0
	 GFxf4w3GYMqqdTi5wOyDQdwuUG6CMo4Yfj5DQ0mSO06d9r+faNjLLT+lawHqMAYNysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=05Dn9p5c;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6179D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6179D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=05Dn9p5c
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E11FD4E412B6;
	Thu, 22 Oct 2026 16:38:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99F8260763;
	Thu, 22 Oct 2026 16:38:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B78F710328E8D;
	Thu, 22 Oct 2026 18:38:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792687106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=T42Gqv1gUbqMFVHPTxAxcE7ab5XVsjECq2S74AXpAns=;
	b=05Dn9p5c5F4yDZSEUXBc+einztw3kamf5mYqUhd2o4/IoY1LYm6/ZZr1xlwC6/3vsG1atc
	jACHSsEEzlOKlDvT9+qTbnv/X6f4xqKax5UouDIys+akOXo81d4aRpuiVYNi8b/8dIKeEn
	t9Oy5OZ780M4MxRwl7yOt/9KGrryPZvfPtYiqs1+ArRMvCIpQb8DxKHEcEM0H9IFhR6SJY
	zJmPfvRGifF1pPwU8qaPMm7kG8ZpvlAFFmfFkNAVUHmFHIcrnd0rkg/JuY1onfX7UdFFjo
	/WrjMEF5oOXvGTJPsBN6vt07g8y7ZWDd+eQnJEJ9Z04nw7hiOpIfVaH+JZ517g==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH v4 0/8] Add support for DisplayPort link training
 information report
Date: Thu, 22 Oct 2026 18:37:56 +0200
Message-Id: <20261022-feat_link_cap-v4-0-a4f3f6e8cad9@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOQ72moC/2XN0QrCIBTG8VcJrzOOR3PZVe8REc4dm1QztjGKs
 XfPLSjaLr8jv789a6gO1LD9qmc1daEJsUpDrVfMlba6EA9F2gwBNSBq7sm251uormdnHxzB5bn
 2UhQKWDKPmnx4Tr3jKe0yNG2sX1O+E+P1U1JgZqVOcOAZaEM7YYwjPOQxtul54+Kdja0Of16Lh
 cfkrSzIKQdoC7P08usFCJx7Of6/FZlXNrfg5b8fhuENECys4iwBAAA=
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

Changes in v4:
- Add a new mutex to protect sysfs group update
- Remove the check on the connection_mutex
- Add the newly supported DisplayPort tunnel features in the series
- Link to v3: https://patch.msgid.link/20261012-feat_link_cap-v3-0-7517f4aba0f3@bootlin.com

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
 drivers/gpu/drm/display/drm_bridge_connector.c     |  29 +
 drivers/gpu/drm/display/drm_dp_helper.c            | 590 +++++++++++++++++++++
 drivers/gpu/drm/drm_connector.c                    |  13 +
 drivers/gpu/drm/drm_sysfs.c                        | 160 ++++++
 drivers/gpu/drm/i915/display/intel_display_types.h |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 264 +++------
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  14 +
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  61 ++-
 include/drm/display/drm_dp.h                       |   1 +
 include/drm/display/drm_dp_helper.h                |  25 +
 include/drm/drm_bridge.h                           |  13 +
 include/drm/drm_connector.h                        |  59 +++
 include/drm/drm_sysfs.h                            |   1 +
 17 files changed, 1200 insertions(+), 187 deletions(-)
---
base-commit: 932326f098877d9650c80ed428d82fc2dc14e841
change-id: 20260226-feat_link_cap-20cbb6f31d40

Best regards,
--  
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


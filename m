Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E96738D419
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790817303; cv=none; b=uKUhuGO2yQiHPt1lwv4neUmKR+vRB7paEQuNwJkWe7ybe8Vyg5pF8QYbyPgacDFW0TfPg2kr9FJKge/ktsy4gKxWTsEOiYIGB/e4Wx3JsXD7dEcAr5mWeCNlGet0oOBYdT7CxjBMZheez3WAFO4svVK75uXPNt0DBmb9+m0a2aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790817303; c=relaxed/simple;
	bh=GOwaAXoYGkU8Dmsfbd0ly6CQtUQz/aO+7qSW3lRVFfc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fg0hLBtFIPjytsX7OrZXLN2im/MNySDdVuFtKU1KWi7UMgWjlidadipSV0s8JP/RtXO9OXlN50DLIvRap5q8XNyOonMG2EuCeWZZ7IVt8/4jbs5W1dfU4psq8K/O8+DCX5pYXzy3BirMxfxtk4AzeNTz+qUtNcUynkExqOp6umE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JjmWbhc1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JjmWbhc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790817297;
	bh=GOwaAXoYGkU8Dmsfbd0ly6CQtUQz/aO+7qSW3lRVFfc=;
	h=From:Subject:Date:To:Cc:From;
	b=JjmWbhc1cshW4EJhs0xurwV4/ppkoW5zKF5sLR4SQ9SakSuYgJfEeql4zeH7FUHZD
	 +Uv8nYGthylw1Tr65U0pl/qfbo30qEkAJXsbXh9wo9yY7ngudH2EhwHTcLlyQwk7P4
	 Bx1e/WNwfzx56NxoGJM6N93bmgIw4owgzTXp9oR2GScJyn6+dH78bJQorV+Mu6OUPP
	 wlOMSjiNU+RR0nnl4FzhsY/nfx63xtJYIGYe2ESBBKzZhlyfFd3xAe/3qZ0uXUjpyP
	 0f5nVaX20r3DPioaQNfjZyx/zUxYSEFHbOpoWqJDJvbu/fMXpwyCbmzQQtbiLL/CPj
	 DOVNoB69B4xdQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D448C17E017E;
	Thu, 01 Oct 2026 03:14:57 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/8] drm: Advertise supported HDMI version in HDMI drivers
Date: Thu, 01 Oct 2026 04:14:31 +0300
Message-Id: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAyF4atI1g1kRttFr1JcjJNYU6iVREUQ7
 96pXX4P3r+Di6k43KsdTFZ1/YwF4VJBHtL4FFQuhkjxFogCdqZc1sSr2IwDvxVzmhyvTByJGqo
 jQ3lPJr1uZ/nR/u1L95I8/3JwHF9ERRI8ewAAAA==
X-Change-ID: 20261001-bridge-advert-hdmi-caps-5d0d2004032d
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andy Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2

This series consists of patches 50-57 from "[PATCH v11 00/74] Add HDMI
2.0 support to DW HDMI QP TX" [1], to set the supported HDMI version for
the HDMI connector/bridge drivers that currently leave it unset - except
the MediaTek HDMI driver (for now), as it requires non-trivial changes:
there is a core library shared between two variants, one being HDMI 2.0
compliant.

The infrastructure patches have been merged and there are no remaining
dependencies, so these are now sent as a separate series, rebased on top
of the latest drm-misc-next.  The Reviewed-by tags from Maxime Ripard on
v11 have been collected; no functional changes were made since v11.

[1] https://lore.kernel.org/all/20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (8):
      drm/bridge: adv7511: Advertise HDMI 1.2 capabilities
      drm/bridge: inno-hdmi: Advertise HDMI 1.2 capabilities
      drm/bridge: ite-it6263: Drop redundant .mode_valid hook
      drm/bridge: ite-it6263: Advertise HDMI 1.3 capabilities
      drm/bridge: ite-it66121: Advertise HDMI 1.2 capabilities
      drm/bridge: lontium-lt9611: Advertise HDMI 1.4 capabilities
      drm/rockchip: rk3066_hdmi: Advertise HDMI 1.4 capabilities
      drm/sun4i: hdmi: Convert to drmm_connector_hdmi_init()

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 +++----------------
 drivers/gpu/drm/bridge/inno-hdmi.c           |  1 +
 drivers/gpu/drm/bridge/ite-it6263.c          | 33 ++--------------------------
 drivers/gpu/drm/bridge/ite-it66121.c         | 13 ++++-------
 drivers/gpu/drm/bridge/lontium-lt9611.c      | 16 +++-----------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c       |  2 ++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c       | 25 ++++++++++-----------
 7 files changed, 26 insertions(+), 86 deletions(-)
---
base-commit: 37b346eab23aead52d17a8fa687056bfc651a416
change-id: 20261001-bridge-advert-hdmi-caps-5d0d2004032d


Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8EC4A99DE
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843137; cv=none; b=Rky4oqAXAwvWyrbIvxLlAXtw3KfLaljjoPf4F7L3qEfebpsa02lPeILboP6sPR5xIzzajJhvwwD7N5g7UbZUHN1PJTVJGoK+kfl8Vl+LIgUt5VtzRIHfJ1+b9+nOg4VvlRX04DIftgG/bp17XIYHshS2QLaZygwAoYzBqqVnrRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843137; c=relaxed/simple;
	bh=hWBYh+HFET7KkZE5QMWM2qDP25k0apkoZdP3D+xIBHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AfDn9Q3BtTCTNvzhfuIbtE1HOEr/l7XVo3zk0o5LpCxtF5B3vguYWU6N3/tdM3nO0yv4SOxPlAa8UnPMRaKyP+bKh+BBvIeWmdCNeeJbq6IadZB29ThV6asJT5LB80LdLCnHg6oQnhy5Da4RqvoQVrYq3JplC8Exw2jVwN+ppyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KtjvyFdU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KtjvyFdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790843131;
	bh=hWBYh+HFET7KkZE5QMWM2qDP25k0apkoZdP3D+xIBHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KtjvyFdULBK0Ofvzj3udV+h2ELm/yCmZN9QKHtm79IshBQfmzMYAosiPaqUyKANuQ
	 44VVhhYKi/Fg+peN7DfIjfp6ppfMwoNepFmcH3RzIepnuChHPDgbp7nnkvPUxzwoMP
	 nZw3CEwCkadrx3FMymmRTnV/f0ciI3Pd0fol/8VL26Sj6IjCeSfeA3NG567O2d7TyV
	 0TtXATodj+dPDzQ5Kh3Vl8CEDafGjEQt3OxAAANlBLkfLtLl3sRJ428CqAMgfeWM3J
	 wGoT5ucIe9Q70uBhij7f6Jq4y5LIi4l9qsWH2RwooGvseDD9OmxP7eDYrq0UxuQ5F4
	 hWqXAOIlQ5eww==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3467917E0528;
	Thu, 01 Oct 2026 10:25:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 11:25:12 +0300
Subject: [PATCH 2/2] drm/bridge: lontium-lt8713sx: Drop redundant bridge
 funcs assignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-alloc-conv-v1-2-f0a1fe040a86@collabora.com>
References: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
In-Reply-To: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The driver already allocates its private data via
devm_drm_bridge_alloc(), which initializes the bridge funcs pointer.
Remove the leftover manual assignment in the probe function.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/lontium-lt8713sx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8713sx.c b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
index 926f9e1e85bf..18696b75bec1 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8713sx.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
@@ -554,7 +554,6 @@ static int lt8713sx_probe(struct i2c_client *client)
 
 	lt8713sx_reset(lt8713sx);
 
-	lt8713sx->bridge.funcs = &lt8713sx_bridge_funcs;
 	lt8713sx->bridge.of_node = dev->of_node;
 	lt8713sx->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	drm_bridge_add(&lt8713sx->bridge);

-- 
2.55.0


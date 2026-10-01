Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA77A37B030
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790817305; cv=none; b=hhB24ERLuxidw0zvonpos8WSdRdrNMrUAvbnURyj2bJyDMJ4J06XHHc+0n66gOYZeGW8abkjuk3LirmhGDsTqhVYAgeZkTFQxMhvDRZk0x4xipdXOdYp3WE1ELcwh1IuLMjr/aWrJE/YBxj4TCPRJHu0vYGE1wNOlPZjUey0/nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790817305; c=relaxed/simple;
	bh=GmU9KxG2tOqNJrmpd/Y+xY8fvGP2Q7VSLjx6DP+d1Sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuKjngtgzpQwIr2PA9FqN1HVxQ73mwbtv7ezXeTPc/Fwbl9eSH6K9H9UhCC0YkLDcqKnCumYmfUFnxW/jjb0ksdf7hDD8JKsXj0AxbtR1O38yHduHndoARQOJJZ5454jJU/AH7pnPRYZZdNvj2nySE4JrnrAkMXMS7lSx6MOpcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dF1W2HbC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dF1W2HbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790817299;
	bh=GmU9KxG2tOqNJrmpd/Y+xY8fvGP2Q7VSLjx6DP+d1Sw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dF1W2HbCu8uZkuJ4BzqdJRyBtnYeO7ncpGdyUeWodtwXHcj7wFYmGgbshdtPXsc6q
	 OxPRRQuRHo8OY9DDQNAKbS2SFQtUh2JfSBse4nmq2+avZZkKbq86vOB6R6tXBYggEU
	 OuCL1iITxUOcNO9mJ+63+V5I9dtdhZU8A1ZMDdM6D1eYFPWBPOioMX/rINv8gw4YIy
	 aj3xMgIIRe3zudi8AyTC687g5DKjxfg9iWUInEqL/X6PEIP3tKS/m+U87u8G7W9uK1
	 mC0KBJyCrpYO2foEndePxKlBu/BnhQ8ygTa0YfrJGjp0mMzJGpOJHS7so3i+mLbUnK
	 vAwCUcR3ujs1A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E5E917E089A;
	Thu, 01 Oct 2026 03:14:59 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 04:14:33 +0300
Subject: [PATCH 2/8] drm/bridge: inno-hdmi: Advertise HDMI 1.2 capabilities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-advert-hdmi-caps-v1-2-f8806570e243@collabora.com>
References: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
In-Reply-To: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
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

Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
supported HDMI version.  This is not yet enforced, but will become
mandatory once the migration to the new caps-based HDMI connector
initialization API is completed.

Since inno_hdmi_phy_config.pixelclock does not exceed 165 MHz for any of
the chip variants handled by the driver, advertise HDMI 1.2 as the
supported version.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/inno-hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/inno-hdmi.c b/drivers/gpu/drm/bridge/inno-hdmi.c
index dd35f5a875d3..ea3447d4f285 100644
--- a/drivers/gpu/drm/bridge/inno-hdmi.c
+++ b/drivers/gpu/drm/bridge/inno-hdmi.c
@@ -1119,6 +1119,7 @@ struct inno_hdmi *inno_hdmi_bind(struct device *dev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Inno";
 	hdmi->bridge.product = "Inno HDMI";
+	hdmi->bridge.supported_hdmi_ver = HDMI_VERSION_1_2;
 
 	hdmi->bridge.ddc = inno_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.55.0


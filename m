Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632461;
	b=5kLEYHrpitGI8jWKVu6z2gD/JKqvqKG4D25zacNVP1f0Qq9jZBv8HG7G6AXhYH3sGSfZ
	 xWmwbB4Zyg9Bx8ayJy1FYfj1NeLNlqNcMxZvKmjWJJrpFobEeFb5e7gHVWonEMqVCUCpG
	 4UYoCXuK1qUvb4EK4psSF4mNMLQuA8QdggJ989zCUC0isvEseqhTMI7yWWU+OPv83Mwyn
	 /JkfEIo4AzOmvXmE+BTYj/9tNypAABnNfb/5FF/U7Qgur2wbynHBzVXyM23Mq1Qc8N/rT
	 xzLZTuZERBtBMnGw6HbvkMpPBab3lpWot3ggMKSPA2pQKT/94uT0nZZBOBfwnK6Tojg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632461;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=g7wfeDExUQ/bTqhEjFTlnZiHFNlm2fV470IeBuscq50=;
	b=2HdVBCWEI/P58WvosFDMZ4+m9gv2w65G134wuN5463dAhLiZxtKERg4zT+yLu2R70evt
	 YfUBSQUn0smueJ6l3Ap0wpdx3+hZXAUvKVBd/8uzQueXlvbmYB7OzQPq69lYF9qvzl546
	 /wsJEqmsBpb67SjeAbh1r5K2yz9MB9Yicv9eMlXZGWhza9e1DpwMVgHlTszbd3KhZHycJ
	 xNyvjJ8yGiuoACknFhi/RnXH/Nh+fb5TESuX4dQnonoUbMTeMEoMnOZpJ4OLcoo6Ec8un
	 waRu79GPRu2+afhqjoEWIyS4BPzee1A+eHxkNxKMpxz7uMzFDy3Y+H3kIjOPPjXfE0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Z2WRjd4F;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1606606A8A9;
	Sat, 14 Nov 2026 05:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1606606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Z2WRjd4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794632456;
	bh=LgZG1JUuYKTJ7lvvqoNlqpaH94dmMLvKwmDihxkOtrI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z2WRjd4FqD26jRv78qCtaqN10OFVotbLW81EQbwK5Ys1jU54ljfv/FvJYldkdMAp/
	 31dR36WTF2KKOIKMzZRDoI880aSuVbSBfXvmePllfEVqOK9xXRTefhUnVTNWg2zWol
	 j2e6OkHEWJqO5vBo2JUAjNnStEFUkwThYV5vefvDWp9zyL6k/FquPIKihk27zujLap
	 4VkMfPPNGIwyUiSsoExtCfraJXiV6h3avc/DjyxwNtEvPVP+v9ee011EasyGPMDLzb
	 a0ZBJotkrYh96cjS2ppCB+tEF2bsBK/D//NlNCNzYiTN5/aXVX+5PErnCP5fT8cZPo
	 rZasB3Cw0nihQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A676517E14D8;
	Sat, 14 Nov 2026 06:00:56 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 12705480038; Sat, 14 Nov 2026 06:00:56 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 06:00:38 +0100
Subject: [PATCH v12 05/23] drm/bridge: synopsys: dw-dp: Add missing mutex
 cleanups on module removal
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-synopsys-dw-dp-improvements-v12-5-d42d3dc5bdd4@collabora.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>, 
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LgZG1JUuYKTJ7lvvqoNlqpaH94dmMLvKwmDihxkOtrI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr36wf6xPbbDb/0onY8OomJxwqVzi/gYB6AH
 5geI7567E4MgIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq9+sHAAoJENju1/PI
 O/qaZ+cP/AlXUbdThvBVezoKDjxeiWxwYCjj0UQuTw922XA/LzmrZAfj6RqP463CMzaj09buxir
 QxqBaZRJBbowOdtWyTZ47a67AmqkXrowMXHnAWBUDQsbKmaTcCnadG+Rktk/RcKuNz88Oo0NUWX
 WXvdxsyobkFD+y2PL/SSHMdeAPYHUUufLFtGWYV4EpW5l6HVOXMchZcYlUmQ/6fOgVh2s0TWi/2
 ovmOlZ5dbzXjHFkzE1Vq/E+jmsoZ7hpozeAZYqYwPHwS5145I4Kx9hsrd+FM0isvqZ+iz5JSZl7
 6PJjyFRVeHLXwQgCKOokxUqzrvllfyYif9WEadL3VL7zXL/XNSSRPolMH+qIv8ocKZn1dFQt2zo
 DTMdOTwV4sfWS+T4TXRK1/9kRHXJvJg/N8XHTG/GS2g1d3AWsrvtJ4vSvH99OleIhTioNijVg4o
 D2ePeejsdyE+YWIN5gSHrACyBFDSdCY62/X2hRNuwE9QHtGQMeRdxmuHOMh0BeUv/SB3kv0jCxs
 FCvqx0fmvvtQC84Ly2PcwCuDo2E4jxqyLkqvAs+AlnMmVfD0lGMHFGjCw+P1sZGU8ak7IMeF1i3
 i/VXevaNQi5E5DXPD6cQgLLpTOqib0bp7aLLy+PkZRC852pBLM9uUmcB2o5hrSkyJVuuahbPOt+
 935skL03+/jFIJPGYzDEsug==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The driver is currently missing to fully clean up after itself. Ensure
that the mutex is cleaned up.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5+
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 9677f789c986..7351b70bdac9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2041,10 +2041,13 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 	dp->pixel_mode = plat_data->pixel_mode;
 	dp->plat_data.max_link_rate = plat_data->max_link_rate;
 
-	mutex_init(&dp->irq_lock);
 	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);
 	init_completion(&dp->complete);
 
+	ret = devm_mutex_init(dev, &dp->irq_lock);
+	if (ret)
+		return ERR_PTR(ret);
+
 	res = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(res))
 		return ERR_CAST(res);

-- 
2.53.0


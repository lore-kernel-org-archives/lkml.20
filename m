Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86668566C75;
	Tue, 13 Oct 2026 22:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931939; cv=none; b=k3PT1eMwTsr/sHZGa/PewROrVKfJIfE8lPq2v0hV2uhd+fS37aA7QZszCoMptryBt7Irh0kFz6Qysb1eBSfsl7+v76pTrjnXhjUFpgveHAvQwR885lG69nqeWFxSMarW5a+2RnBUooaFxsKl/JEYA3Hi0KT99sOYo4Cmsl4QhLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931939; c=relaxed/simple;
	bh=eFcaLJbV3onLWXX76Dq0oKLZVVUoH0YvgLpoIYptoKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3vHsY+BqLAXWFat1tUoMOXl78rxF/WhZcmMT2j00jbjUFzCMJVNbALQpQ65WoUnSYYPtiNiUcaEvhgFJZk/9ey0PD5wCiS8U2cnrD1hXkf790LvsTitQN0yaEKavz+ElV7LiR+xfS+Le5uUJI5nzG/Om5OmfkCSjzDseluvfPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QDqPLdLp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QDqPLdLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931915;
	bh=eFcaLJbV3onLWXX76Dq0oKLZVVUoH0YvgLpoIYptoKU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QDqPLdLpUwLITLJWpDFYHjaxRbGYhpkddjc6fE7EgQIZOI+2y4475KzCprSb7hzeN
	 1eRAoKJAQArBEQmq4DdJAW0lG5YZmUB3zUfTtl02CifcOqnyPCcH0swmkNHUJE8NRu
	 f1+f/xMxp+gkPXpztJBRLy3ED+09FnB/cXhheH6eUwpUmwxCoxSCjSKQYDbTn9jhgL
	 dzIprO8YmTf4+lOsgsppCnGNKOGNfkAm+CPM/20k8jAhck3PJH+yTid/FW+T9mAOg2
	 On29pSLk4yT9wNd3OqyvKO9wukXpDFyK9AOkz/UXgFJJkHRanrFcQnmsmHbd9pZ7oQ
	 xcAw/2COfQitQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E106C17E0EB0;
	Wed, 14 Oct 2026 00:51:54 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:23 +0300
Subject: [PATCH v5 06/15] drm/rockchip: vop2: Fix VOP2_MAX_DCLK_RATE
 overflow on 32-bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-6-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
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
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

VOP2_MAX_DCLK_RATE is defined as an unsigned long and is used scaled by
the color-depth ratio when computing the maximum DCLK the HDMI PHY PLL
can source.

On architectures where unsigned long is 32-bit, VOP2_MAX_DCLK_RATE * 8
is evaluated in 32-bit arithmetic and overflows: 4800000000 wraps to
505032704 before it is promoted to the 64-bit argument of
DIV_ROUND_CLOSEST_ULL().  At 8 bpc this collapses max_dclk from the
intended 600 MHz down to roughly 63 MHz.

As a result, low-resolution modes (e.g. 640x480 or 720x480, whose pixel
clocks are well under 30 MHz) still pass the clock <= max_dclk check and
are reparented to the HDMI PHY PLL as expected, but higher-resolution
modes such as 1280x720 (~74 MHz), 1920x1080 (~148 MHz) and above are
wrongly rejected and fall back to the system CRU as the DCLK source.

Define the constant as unsigned long long so that every expression using
it is evaluated in 64-bit arithmetic, independent of the width of
unsigned long.  This future-proofs any additional users of the macro as
well.

Fixes: b0362c45c401 ("drm/rockchip: vop2: Check bpc before switching DCLK source")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260623203310.9F8C81F000E9@smtp.kernel.org/
Link: https://lore.kernel.org/all/20260623203310.9F8C81F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 5a870a843dae..14c073f61c64 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -102,7 +102,7 @@ enum vop2_afbc_format {
 	VOP2_AFBC_FMT_INVALID = -1,
 };
 
-#define VOP2_MAX_DCLK_RATE		600000000UL
+#define VOP2_MAX_DCLK_RATE		600000000ULL
 
 /*
  * bus-format types.

-- 
2.55.0


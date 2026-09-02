Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653F444E651;
	Wed,  2 Sep 2026 22:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389673; cv=none; b=ieEYZ1uekmGnbDHyVL+cMSYneypdM0LwPcqVly6XwEFWJA7J4Dgmt0ksuwLXism15hcA4gU/KrcW9WL4kWxkfngrwyczVQJqgi/yttmxVwbIUVCCoknXxixtWXZFFFUfQW70/8z2YiI4+uiz0K8pjNf0Qsyg33H6asu4kyscLrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389673; c=relaxed/simple;
	bh=doU00+D+YerVdhuX8oEp8HqeUZPH5lDfQa2OrdpPg08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nEH25EzYRMYnEWPLzF6PhYuo1Ql+dwVLthI7RnZV+rvnRidLp+cDYFOZh/MQyuvlohR0SeAjFkN/IpiMiDOb8QMiV1/i55xhK00g9U7Ecgw1siNmykRgS5Y04qSXw2OL/bpKqzeHwtQkttBCVGLYkLTxZN3FR2OkZabAl3E3B2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ANHi+++J; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ANHi+++J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788389660;
	bh=doU00+D+YerVdhuX8oEp8HqeUZPH5lDfQa2OrdpPg08=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ANHi+++J2Md8u/D8ccNqvdoTO7Cik8rIgQX/iw+qjsxqV7xHCEnXI97HauDrMmtlU
	 UcI90Ei/Cr6QeH4OWsLzxvAQg0ZrplSbGAIZ6Bps9kja7ub0iIZxYHRJt0145ZD61O
	 1siqZ/XJpn/qjbwPjK9hq22Kc1zj3I6vNdKj0mFuo2Z+jOXIgObue6/gBE6AoYCUqB
	 91YQ3JDEiTBxPjZS99d7pTKMt0uP82U4DohnumiKonoAuhJnGORzjcylSub4/pql8i
	 /WoGQW18NGTdh///V0ZITqa1O9yXTFSMgsqn8ZcXCisMSs5ldeXN6Yu3WYhvJ+tzrb
	 JEt4HorcZf9Hw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3F7317E35C2;
	Thu, 03 Sep 2026 00:54:20 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 03 Sep 2026 01:54:20 +0300
Subject: [PATCH v4 13/14] drm/rockchip: dw_hdmi_qp: Enable YUV420 output
 format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-dw-hdmi-qp-yuv-v4-13-fb45bf4147eb@collabora.com>
References: <20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com>
In-Reply-To: <20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

Both RK3576 and RK3588 SoCs are capable of driving the YUV420 output
color format, and the required bus-format handling and VOP2 support are
already in place.  Advertise it via the platform supported formats so
the HDMI core can select it.

YUV420 halves the TMDS bandwidth compared to RGB/YUV444, which enables
high-resolution modes such as 4K@60Hz on links that cannot otherwise
carry the full-bandwidth signal.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 78473f9a0fce..1af29066a0a3 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -611,7 +611,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 
 	plat_data.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
 				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
-				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);

-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415383;
	b=s+u7jG8NhcWkVqlpeYHR1PMaoPXDTjGW+5y2Jh7SlFaiDfSpQBGMwwss3r/6g4y/e2Xr
	 wIUz1C0MeVrBc1+lNVsE1JHUa9/0F3wNL5BzxK9ZPgItCkN8faRa4sQIwhnIA2zUJq5Qq
	 oqK+0d6cA0Zh2l3/OshYBFPoKiFd1lTThMP0MNciI6p/jOxsNKD+UUvDn9OGMGpMY/6Nd
	 qx+DIFIlZXSVNBFIPq/j0TSEd+e6oVxp3gBW7xt5ly58FApNM23ldwL17LDp+TqsJfDWK
	 9yz18K2DI3UQdpIuDRXmuZlYqKjDSYB9509oFf51r6Ih3OGeJLN9sGNrTCZwye34/ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415383;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=XfL1LkLV6PZp/sIgqFTspEab58+KJnpcSZkBxVzkdRw=;
	b=xiOBvTfwbr9hdx3cnf37gUxcSH3jISw2UvxBd+uD7VyRMQbaX9a0fc5U32LzBoE0klLI
	 pkVy0gIm7RVGjEdHDePqiIbM8jBhTYdFL0pd/NTujgaH+HK/J1+y6+XEVEfElfnoiR9sN
	 iF4dhVrnILry8q6Uo1Le5XjLTOFandt/OEakt5wpKB8jqU7CyYUlSQ85j5mx6oq/FBv2h
	 HE//9oVPSnfd2AewI/D27eoaY4d/5KEsPdEeWBg5rvG76/D1HmTBdd3KP7o09vpNA7YzI
	 vCD1DKtiVDWjBGb1HBOzZsTF/Pb3QXRAGQbLcmd1wFr/g4AdL8eKS4XDOvlI93Gunkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jNnud/yw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F5606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jNnud/yw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7252E1F00A06;
	Wed, 11 Nov 2026 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794415382;
	bh=XfL1LkLV6PZp/sIgqFTspEab58+KJnpcSZkBxVzkdRw=;
	h=From:To:Cc:Subject:Date;
	b=jNnud/yw5Gdx9dHj8hc00zIESj/FRZkNQkZzz/XHMES4+CJ0RrTbyZnZV1h91kKyD
	 SwFz6v6MYXL8qbLLgIm5q2Rq929flsQLg80l56tQRfELv1b2rOYydPU0PCNPf0wk3w
	 kMM0rEGq0XzHW1GrSlitBghDG3cZ4bqOxlzDOHC9GgT1ckkwVwMgr4YsFBcSdgXdFO
	 ht5xbhRFQbxnix2zUpvIHS8KMZv/x8Y1vN/nuaFkeJG0RmG/ZGuvVzOQwgY4bgwDgB
	 OCmP3w6gYXM5hYyBntMurlsBgkJNGVeYqw6R2Yw/hLoBNPxyu9F9XabCsnkLQ15u1P
	 h1Q4VmFMPwPKg==
From: Thorsten Blum <blum@kernel.org>
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
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Thorsten Blum <blum@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm/bridge: analogix_dp: Use str_supported_unsupported() helper
Date: Wed, 11 Nov 2026 17:42:41 +0100
Message-ID: <20261111164243.77775-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209; i=blum@kernel.org; h=from:subject; bh=7Wa0OVeoMbTi4Rsw1ZGgLgGEh6+ZD0fkqEJ0pQ0kuzo=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlfZjPvMLVfu+PgiWl3feNKBa8psEs2l33i0+94z+vD/ 0/9Zll1RykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExEToaR4XXZneNJngVfpyqG ztHJVj/BYnptM+tGtYn3uJpdK5bI+jD8r32S3dr6L2bjo/rVeiXNZ+v0Z8uvjC383Kwwa8vdSff +sQAA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace hard-coded strings with the str_supported_unsupported() helper.
This unifies the output and helps the linker with deduplication, which
can result in a smaller binary.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6df6963740d2..59d3ff9bcde4 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 
 #include <drm/bridge/analogix_dp.h>
 #include <drm/display/drm_dp_aux_bus.h>
@@ -745,7 +746,7 @@ static int analogix_dp_fast_link_train_detection(struct analogix_dp_device *dp)
 	}
 	dp->fast_train_enable = !!(spread & DP_NO_AUX_HANDSHAKE_LINK_TRAINING);
 	dev_dbg(dp->dev, "fast link training %s\n",
-		dp->fast_train_enable ? "supported" : "unsupported");
+		str_supported_unsupported(dp->fast_train_enable));
 	return 0;
 }
 

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E19A386C22
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286133; cv=none; b=mVnHBy2+5M4EhSu7+1qZ9HpWc3YXjEKDt9rYzNHgrCxUtOYKuQrY6Gffz6AO3ZBOi5i1HL8R8Hzs0BtdU3hK/OfeCovzG7BCKD1Z53s007+c4KLwizejjQS61dNgGRKa5U7i4T+7fjCLfgO5Hb6H9umLT3GGS6ynJbGMkdqAw+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286133; c=relaxed/simple;
	bh=5OFBOpX56t/OqLwV1/ojP078ggg3tH36DZ2K6YbDqyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5kwquM19t8IQ16eYXfIfuRoqjjwrRwBvdAICDlNoAJCni18k/hkc4KNQlIMklXYGslxZ7rQ2zOhI6M6Lo6oe6DW/rPfUe5aOXJGFRTw4bOvXBXCJnpJOEB6GHwcCU0eYTNSAh71E4Mld5qPMlszTV1aKZFpNMoDR9zj+GDtlVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PE3kqFyt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PE3kqFyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF311F000FF;
	Thu, 24 Sep 2026 21:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790286128;
	bh=Ug3ScdpomRG8LtDGbnmPFJyb8UrlDiWfAF9PQCYpaoM=;
	h=From:To:Cc:Subject:Date;
	b=PE3kqFyt/AkRfVMEle9sWlY3GPFZe3QWQbQ6JStoVI2rLVdhLqYI5YRJmZmDjm2Or
	 DlyslEyWVolMLMsirB8N2Mgiuzk0aVAzKKnjdh88+Ol0EzDD+Stu1hrj/w0oDY4+EY
	 xdBdYs7pZBe+NDGg0yaiBlq5ijHnbjukY4X/PUnA8Rl1NgghN9JhukRP9A0suTu+Gp
	 0xF6dQp+A942VNVC4gHxJl9QLsbmb+mqcHFv6HTDQzQswti/XwA2ITETI+9K66YJpz
	 mE+VZ144slgpS9TDqOSMHaP7gGkgw+WTHtPWvg7BRVg/fbc5z3iNuWj2iagTxUmNVx
	 slFyN/eWgDh5Q==
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
Subject: [PATCH] drm/bridge: analogix_dp: Use str_supported_unsupported() helper
Date: Thu, 24 Sep 2026 23:41:35 +0200
Message-ID: <20260924214136.137531-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266; i=blum@kernel.org; h=from:subject; bh=5OFBOpX56t/OqLwV1/ojP078ggg3tH36DZ2K6YbDqyw=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlbZwrErNN8XGp9yOvXib3Tj16tnnz71ZmYnolPNLx2L zHavV6iqaOUhUGMi0FWTJHlwawfM3xLayo3mUTshJnDygQyhIGLUwAmkpDCyLBEx+MX+wLZFodF R05UvtZ5p5Z7UH7z3+yKmHD3tjsrekoZ/tdNvD/9Y+vbvcaf2FbaMqzsSCyUdQjQ7MxesvDw5Rs i/DwA
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
index 30c0c0b41d5a..ff4d2dd0a749 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 
 #include <drm/bridge/analogix_dp.h>
 #include <drm/display/drm_dp_aux_bus.h>
@@ -746,7 +747,7 @@ static int analogix_dp_fast_link_train_detection(struct analogix_dp_device *dp)
 	}
 	dp->fast_train_enable = !!(spread & DP_NO_AUX_HANDSHAKE_LINK_TRAINING);
 	dev_dbg(dp->dev, "fast link training %s\n",
-		dp->fast_train_enable ? "supported" : "unsupported");
+		str_supported_unsupported(dp->fast_train_enable));
 	return 0;
 }
 

base-commit: 5383cf280ef4f00b15f1d9e2a2886d0d02c0118b

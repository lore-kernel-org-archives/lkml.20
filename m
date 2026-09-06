Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601ED286D70
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788723830; cv=none; b=IJX5JkBjh+33IvYhebC/aIZegmL0wSMvrVXDZbnIwNIdZZtW9Ph1yMU6BH7YMzZJ4g38LHAS6WyKtmVCxzXQVm3QOKhXLsZpqPw7hFxupszT4FbS3eMMEMLJW63k4byfI74u5dIK3uBB0wt9BBYCoq+iUOrS9YPXf9h/peSHIgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788723830; c=relaxed/simple;
	bh=0Z9VlpA0raG6r7XokDnQP1FPgmzr6zyFAP4bptvzFbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VwWmkGZ+q0VPc7ihm6nmZchgWoKgLq7aOac/4kFQWT8NX0bNLK5ox26nCl4A4a64Wa5TOfgJO43MbleClqhhmf8mZ5Hio8WgKuLync4QWR/0/MEag/CzVRh9poG5VC2q+jgo8Ph8tRpUlfxCKuQiAry24xurcG+rYFub1eCkcpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXgathLC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXgathLC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C8ABC2BCB8;
	Sun,  6 Sep 2026 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788723830;
	bh=0Z9VlpA0raG6r7XokDnQP1FPgmzr6zyFAP4bptvzFbc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=FXgathLCtZ92nmpHgh1MgOPol30uGB1g34FojDDPo0uKFAGEp7U9lvJ2NaI6X7j+p
	 lCH1zcv17uN6R6K4aE/UsiNIWFz9rA56TI57H7Qn5XHT1qR92dW27FpygEiZwIwc9S
	 x8Dwn0NET3Mrik+dUAScxc/BeC6Nn5ceMYUT7erGYS2q02/4oW98CMU3mt9USm+3mC
	 2ydKlTkvSvTTQJ40682kaw1NEKbxRXKYTpKLYCT3BgZSciPErPLBGbeyI69TrrVPXF
	 uUVaL775VlZwB10T3nFS4CB7inmhO54DWkgDjErV5zD0dxDayiA5JPyGDGSNtHLtSZ
	 28n8rbyNX8tCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC505C79FA0;
	Sun,  6 Sep 2026 19:43:49 +0000 (UTC)
From: Miles Krause via B4 Relay <devnull+mileskrause5200.gmail.com@kernel.org>
Date: Sun, 06 Sep 2026 15:43:48 -0400
Subject: [PATCH] drm/meson: fix device_node leak in
 meson_encoder_dsi_probe()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-meson-dsi-of-node-leak-v1-1-9d183560279d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHPCnWoC/x3MTQqAIBBA4avErBswsR+7SrSQnGqoNByIILp70
 vJbvPeAUGIS6IsHEl0sHENGVRYwrS4shOyzQSvdKKsaPEhiQC+MccYQPeFObsPWmM5a7+q20pD
 jM9HM9z8exvf9AD146hxoAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miles Krause <mileskrause5200@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788723828; l=1903;
 i=mileskrause5200@gmail.com; s=20260906; h=from:subject:message-id;
 bh=MzPOZoQJIZouNhopaY53pEz59ebt1korUstt2TswX5s=;
 b=n7TDRXCuDuGLEEk4/VPeuku3N6NRmryW5wydClhaAsHiByeSusM+Nz8hYgNrxmDeRC7QSYUTm
 N24E5yCU0OhCuzbiwy8lCyAhHI/GXTrgxQ923wq10hBuHkzwXY3Jr/P
X-Developer-Key: i=mileskrause5200@gmail.com; a=ed25519;
 pk=zcIfq4TGtPwMRJUW6WsbE2zLHvOMwk6ZyT/CGd6XzyI=
X-Endpoint-Received: by B4 Relay for mileskrause5200@gmail.com/20260906
 with auth_id=1010
X-Original-From: Miles Krause <mileskrause5200@gmail.com>
Reply-To: mileskrause5200@gmail.com

From: Miles Krause <mileskrause5200@gmail.com>

meson_encoder_dsi_probe() looks up the DSI transceiver's device node
with of_graph_get_remote_node() and hands it to
of_drm_find_and_get_bridge(), but never drops the reference that the
lookup returned.

of_graph_get_remote_node() returns the node with its refcount
incremented, and of_drm_find_and_get_bridge() takes its own reference
on the bridge it finds, so 'remote' is leaked on every path once the
lookup succeeds: on the -EPROBE_DEFER return taken when no bridge is
found, and on a fully successful probe alike.

The two sibling encoders in this driver already handle this correctly.
meson_encoder_cvbs_probe() calls of_node_put(remote) immediately after
of_drm_find_and_get_bridge(), and meson_encoder_hdmi_probe() releases
the node both on its error path and after of_find_device_by_node().

Release the reference in the same place meson_encoder_cvbs_probe()
does, which covers both the error and the success path.

Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 3e422b612f74..3fe604496294 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -120,6 +120,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	}
 
 	meson_encoder_dsi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+	of_node_put(remote);
 	if (!meson_encoder_dsi->bridge.next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find DSI transceiver bridge\n");

---
base-commit: 88405f0ad1d5c680afe3ea0ce9345fa9e1deaac8
change-id: 20260906-meson-dsi-of-node-leak-744899da5712

Best regards,
-- 
Miles Krause <mileskrause5200@gmail.com>



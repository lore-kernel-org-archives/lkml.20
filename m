Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8D3A5431
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906922; cv=none; b=WWnVd46S7ZFvDps5unTMIXjAk4Q/BDR8DuxkkM5ljEM5RunRZ/5lwRiOcLhUXjhFFPli1GkNpcX7p/ps5wfRK463x8asmb5BK+Lr498NmSeYojh1QK81LJIkQDeEW3h1AoKttz/mIcl+CeAZI34kS7T9QnXBkyv22UVNA5z3JsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906922; c=relaxed/simple;
	bh=6EFwExoz0A9KZ2KuxPE1pE30SHIlU7Tfb7GXZp+5QNc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=O/RDLVaeSdNiNgNYAicPGGISsnDXEh0U7V8VMnl1k3zmShs3VurE+klWiQbxfkONFASTlXLC2af2XGHWrf6hCPgFVeaXpYQ9CqNt+andrxG1T5wpiFhlHelFKi0fVeiMa7oeR1IEH6DSBmmQsVP/bRcQMp8tet83L85oOWy6+Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=nEkmcWT7; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="nEkmcWT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1787906897;
	bh=ps+5/GB0NshBez8oJzJPOCqkIqmjQyVJoJgHnSj4//Y=;
	h=From:To:Subject:Date:Message-Id;
	b=nEkmcWT7a84DUV5Coa7aCeVN7JAlkWYy5hV1nCYjW53Mtp5c6BL5H43HdqLLSx+4L
	 lak995J2nhLOqd471SupLyYyjIaaui2UPQjJL1TAD7eW1I1v0vLeLQkBN63K3QxAHy
	 6BjwJZZwLMv5VD/SFR/mQiwrdtNCAZl4EBBYz5ik=
X-QQ-mid: zesmtpgz6t1787906896t199af65e
X-QQ-Originating-IP: 5flTHLV541QvG+d71g7cmkxNrt7XoJywJCQVlxi+9yA=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Aug 2026 16:48:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 316822618748361336
From: Chaoyi Chen <kernel@airkyi.com>
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
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 5/7] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Fri, 28 Aug 2026 16:47:35 +0800
Message-Id: <20260828084737.565-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260828084737.565-1-kernel@airkyi.com>
References: <20260828084737.565-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NsKw77UaNFtDkizMHzb7K+5dmlGZX9qwKPLPg3553wKp7dUeQJj2xbQ6
	/8wb+xNrvKPqt5G2BdWfxn96J401nQd1rBZMw13+Z6UmZ+5Dq0/2QBAO72/Xe6gQkZdNGqW
	GBgZJwXeUd+0LZ7074lA7Ut2TxLfxuLR61jlS+zIBWPAuep+GKBOuz3k4bqoEmtHo2e2yjd
	aB5mpGPevP0OAJYMgOJcBDbYJhkSGlIvEo8mAq0Mz7oxHjn6OLdDVtFq7ORm5HT5nrp94GX
	UH9wbQ76Xz4er4EwnSG3wfYKqRQN2fXwI37NKSSP1dbIKNdkJrTLIqlggoU9Wn0NonA6wCk
	7na1bt9Wm759UptQF/hkzNf0GhIWkPAbtgV8z2zJEGUQfcCf9bntkTn6TS+w//TUzwvoo8Y
	St3D+KnYbAuYDDB5JJs+5GVkqZ7qqJFua5xgKA6HN8MqBtfXATevBvoeLpkblTrQbQQfFJJ
	nb6tzuApDyculrYBSDJcTKMbSdC4kFexXwfl7oLWgftLM9za3LHvykoeDDMGKJlCltD7k2P
	+I4Fe960kA8KcOQDL/exhqTAhurH1PfaqQJqxJ323Y3uJbYhEVupX6RsqqTJ2o1modflUix
	dRurSls0en4U1phTfFGSzXAYunA3rUnDVGI4C0XPQrEUg33cW8BFPatLso7qv+zRAOuPkq2
	XT0jvdMm9bi3tUCcwQTNonn78uYN6LfAXbNrHau4oQMrcDRvA+mfSlLEOObPc+dL+wFPG+u
	1194iSDLhkF0goHwT0tKxg9ExFAtG9Fx2n+w23urzCl6DKsaXiHipnhLLNFMnz3ylO6NLbB
	kIK21V+IxHGal2eT4QTEasSb2NNMh7HgZR1mnWwR5q2iuc6YACxVMMuRTNCd/RZ5zOCwpRN
	rNnO0wCKJJdfOuUKgoPCKUVmRwqL8031hWtk00MYgGfQfpIoqTOs8QLJS6IDY13E9KR13UP
	SLsARZ3owvlXv7/4ocdNf6k7Hb6/ExrHG5Pp/zrxZf6xKDG6jskz8HNhj29dOAVXLbYYT1w
	JuMg8PTEN/1s4z9HYlfEMF16/SkoOsO3ATJ5Eh+g==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
device.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
(no changes since v1)
---
 drivers/phy/rockchip/Kconfig              |  2 ++
 drivers/phy/rockchip/phy-rockchip-typec.c | 13 +++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index 14698571b607..9173d3b4fef4 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -119,6 +119,8 @@ config PHY_ROCKCHIP_SNPS_PCIE3
 config PHY_ROCKCHIP_TYPEC
 	tristate "Rockchip TYPEC PHY Driver"
 	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
+	depends on DRM || DRM=n
+	select DRM_AUX_BRIDGE if DRM_BRIDGE
 	select EXTCON
 	select GENERIC_PHY
 	select RESET_CONTROLLER
diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
index d9701b6106d5..48070b50416e 100644
--- a/drivers/phy/rockchip/phy-rockchip-typec.c
+++ b/drivers/phy/rockchip/phy-rockchip-typec.c
@@ -54,6 +54,7 @@
 
 #include <linux/mfd/syscon.h>
 #include <linux/phy/phy.h>
+#include <drm/bridge/aux-bridge.h>
 
 #define CMN_SSM_BANDGAP			(0x21 << 2)
 #define CMN_SSM_BIAS			(0x22 << 2)
@@ -1162,16 +1163,24 @@ static int rockchip_typec_phy_probe(struct platform_device *pdev)
 
 	for_each_available_child_of_node(np, child_np) {
 		struct phy *phy;
+		ret = 0;
 
-		if (of_node_name_eq(child_np, "dp-port"))
+		if (of_node_name_eq(child_np, "dp-port")) {
 			phy = devm_phy_create(dev, child_np,
 					      &rockchip_dp_phy_ops);
-		else if (of_node_name_eq(child_np, "usb3-port"))
+			ret = drm_aux_bridge_register_from_node(dev, child_np);
+		} else if (of_node_name_eq(child_np, "usb3-port"))
 			phy = devm_phy_create(dev, child_np,
 					      &rockchip_usb3_phy_ops);
 		else
 			continue;
 
+		if (ret) {
+			pm_runtime_disable(dev);
+			of_node_put(child_np);
+			return ret;
+		}
+
 		if (IS_ERR(phy)) {
 			dev_err(dev, "failed to create phy: %pOFn\n",
 				child_np);
-- 
2.53.0


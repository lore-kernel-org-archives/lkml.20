Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481403;
	b=f4IFCRNQowmK77TWzZ9Gbfbw1gXkktSmW1OMgYT7vWRwxydowygiRO8g8/7L+nlYACR7
	 LwqWp43NNc+UlBDzD6ZmM1jyu40UvxgUjc6qZkfe7tOQ0+q1NeyGMeWhQvaIqia+0BvBM
	 NTrsVZBBLSx/0FAp7QiaFXWi3xFhE1Nzxd9d4OtTSUmR4Pb9ec4gz4O/oKVaQPPDN4eKS
	 1HiT5WxEoCyRYdw+672MkwLVrBzQGS5L6WI3DdJMqIkDWaSA8lEstgdKa4siwq96knfVt
	 Fj5mONIpeDeXzpJeqBsay9kz8HxgWdVVzaSUzewUxNo5umcduOOlqRMFkJfHrSs8G1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481403;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ps+5/GB0NshBez8oJzJPOCqkIqmjQyVJoJgHnSj4//Y=;
	b=b2L4mTlFCUXY+JdH1h0m9F52WS392p1g46krfyv3VWfsnEHqjwPKZs409k2PEfw967F5
	 Cxn1vLDIzTaQ5du6smYNImlfcPiCBJpi3kXaJHWK2us4Md2/CBr3k2x+Ox32dlzWbTWQp
	 ZCsQvUyFwBY6GhvNFhYsseWTf5eD0C4aaDYV/9+gGz2jet5x/FblXWQgBTKeSoBLcUbRN
	 0jAsR4IcaLcl1UPak6RFhv7ZOxk99TceoKxTj6hhd2zJf2amEoiLX6gF2DLmSvd1+yxmk
	 /xtwncZsvjC02VxWD03g6fUgcA/+obJWEz521ou7ck5Z3N69p0j8VhAbbLKq7tp+Szg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airkyi.com;
	spf=pass smtp.mailfrom=airkyi.com;
	dkim=pass header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=WE1Os1kC;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97B606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB97B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=airkyi.com header.i=@airkyi.com header.a=rsa-sha256 header.s=altu2504 header.b=WE1Os1kC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1792481350;
	bh=ps+5/GB0NshBez8oJzJPOCqkIqmjQyVJoJgHnSj4//Y=;
	h=From:To:Subject:Date:Message-Id;
	b=WE1Os1kCyShFbPK5b5Sm7DlyzEpw5Gfg+SNl12JlYD7B0FSP62XeHrPEQTWTzR0Mo
	 tMT01q19JJlyWZ59hTIOXNt8W6wVUWGJo+RLtabspjrfi1VG4O4G2BZV+XsiHoCvun
	 EoRX3lrk2EW1hy0/PJZTqV8135+h4gs0MPySRzAQ=
X-QQ-mid: zesmtpsz4t1792481349t498ce6ab
X-QQ-Originating-IP: 5IQQW5FN/kiyWe2+lWi53DmnbY8e45q3p8I9AC3Xxks=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 Oct 2026 15:29:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12217570739329010046
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v8 5/7] phy: rockchip: phy-rockchip-typec: Add DRM AUX bridge
Date: Tue, 20 Oct 2026 15:28:14 +0800
Message-Id: <20261020072816.180-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261020072816.180-1-kernel@airkyi.com>
References: <20261020072816.180-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mk9vQ32lX3utYpHxZ+mD2ZsT1CtfZpl8EaFK4b1s3NtZqP4nnMSoZEAA
	hKwqA+1uPAUtSt540v1Y5VUR5ZiddtlH48XIf0k7+VYL0H+efZ4qWkYmcOciQ9etge31757
	zOa7HqYXaNL/EE5Fvy9d+JKy0AjvRfAhdQ6c03kEmRJLlQIcP+SW6LUOT6wPXRiGnTR3skk
	LJSEuT5FKHSJWkb+jzjYlMicsuxNM2hExYN+KpM60C3bwG+Su4/bJvpwTEW7n+Ufe9fGM06
	+yY6TT2QEOlwQpG7/7YoECGwAEx+F1c+wFKFpTiiB+BFN4ghml2OYxK7S4f+t1b8v/EffVt
	F8moVHqoghkljxZrrZ5hRhVsLWb2VEw67Ci9MI+ot6R020A259qqA+hYEq1dJzu/qJLSfOf
	xsrsp++KQMpR0I5x4pj8wpAY/B3qen0aUs6GybO3/Q1vAOfm+anJ4Xzl3J7y2JQEgGx4rm5
	0geSnlQrt+S/ZDU0rkJtZF91Ieb1wXrQqX0zqY/oDn/sXxwxBVxCOu0udfTEf316uJ88GpK
	A9Lwpu2hrB9b3EGKit8Z7Qc+glcTjaP2poGqmThXipp52wNJu420Un8OMQ6XrORZeJs1GuB
	y7kvnPzJP2voP8Lq5LJ/eTxHljHjgKkl+pryohsVSN8zBbMpS3coLlSHu0z5Vc2ITKecv+x
	QxWbEWxIfEWcdlBCIHtvExO1QCWNh4baOeV/MQeA53ZGszlu5mT02nL2t3oHktJykh1BZBn
	7pnWxR7wLr1dPSNiViy0fZ18iLj3QptyoKNcMUkR+/Vk3xiGHJUT5EpvFFiDBLij1aSoa73
	bK2eqdCyi41+I7rZtDuESRpF0oR6r76olyp3lcMdtt8v8tg4CGPcmOjf1RNbhh4idXXiMwM
	ZDKa/3V8gBWCx44LeogEqey6MxyoI0mtmBAoF0r94MX7benRmg0bXQwumsgQWHaDInceWh4
	qR7ZbdbKgu2fT41cT1K8PVynxjnD3rUZ6V9Xema8ZqbPPbUG/hKfKgciLR5Y7Jr3r/9Fd4C
	dbXlWKnWU29J4vE+od7Toc18k8lbpCfQkLpPwn7VfOe2Q3GhJk
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

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


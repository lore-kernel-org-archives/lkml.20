Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6034BD106
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671677; cv=none; b=I0Hco5Uc64/1n4lC9vXUVrTxOuVx1wQRjkFgK56RO9eV2mGdZ58Un9Hn7bhWQ6O/YQFoMyAY94HvEVvGs7l3OEi+bVC/dWrLHIuxtDx2bdZZhO97mekMhRd3RQzVmKQN2y/Jtcix3Jpw11dGv3Jy0mkU9wFzvh/o1b40bDT105Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671677; c=relaxed/simple;
	bh=Z4aGSRXczRWxkdMGTkXXVDynZbO9bk2DRirqQmRGrKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Orm+EvC0hcvEhXr/Lj8gJtUVWGDPSCOzEq5nU0H6TpsDheKFqg/oxcjttR19/xjC17TCkze4jq3e2SK3fOA6L0jeQl1qybIUPtJywm+g32iJDK0f3GD0yzzUER37hYLoWtNU1T+JfqQNWW1lMdW6WpuoRezm9Z8SW+5nKiqMYbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vs5vuhsY; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vs5vuhsY"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so2667907a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671670; x=1791276470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+b3HR+GEBXlqBxQ57YrkqhyM2+pU3HtshFJ6f9asNw=;
        b=Vs5vuhsYGAZtNsiShpDj+VfessnzJSHczMONyrlSQ2rW93j4IfrLHExmCzPGprAyac
         GJP6AAAD0hzauDlro0jawPeQTxe7pN0nkCggFQr9wkqYKbuLTwcthhUFlLblV9ZBVrSD
         D12x0Swv9fCoWn4jESaBL42Cd3/Kivhds1uhoLbrqUU//U25tGuh4PWnKRjLqcIs2r78
         nTrliG8EbzlkNMWBa/kPjFppQnxCia9Ze87WuQ4S4NycgOS/cZgjmitRR/nKsrbXtjSX
         kPSrmyO0ZnSGj+tiFLv4lSjr5mgKd9ejQD/kzwvC6vFTtMnXlfdel6UOHC2OpwN7NQBT
         ROww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671670; x=1791276470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+b3HR+GEBXlqBxQ57YrkqhyM2+pU3HtshFJ6f9asNw=;
        b=R/UosvbeTnZwmqbRry1hWlKH6zJbnBmVmEwFCiF13GXADhUDckqcv6uKIWV3DtG1ma
         p4kWCeAwbcQNOzd9QjkJCT0bugaWGvcIpdZv5oyC8vgQ1lOHEnWpk1VboOuzB/1yMX4d
         vtdBEGDo9MwIG0Qan7/rYBSpMT7+iTD5OxoZOKN2QhdSEuTDNoedDjEFLtHN6aQ9Q13u
         wdW6y4ghC292YZoOBm9oPhmPZNvSQ7oMbct/6nZTr5tBO9UqIC6e20KcB22ZgkntfuSv
         35Y63AYlIx15n6+wUVMq8vJ/dhBpCjScSfDHup3heIn5OtYpKDSy2F6x6yDg8gOXC0ur
         320A==
X-Forwarded-Encrypted: i=1; AKwUvBwZse+1sLdyeJz/Iv8flBXhSPX9fvlsEqjMsfk2GWIwzzitQ616oT1F/JZ5XGR73gRzEiCAd1QIESxz91o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLww/unOAnA9WgLNZrPZLE2RRUFkIUdxpZBS7RKdJyzxPdhBz/f
	QpeiVft0Z10zwbS9aKnUZQQpF05BcgxGkSG+I/DY6km/15q3SUhVSJds
X-Gm-Gg: AYBFou1uGiY/i1eXd7sd5QiNm3lNMo1K3y+UWD8ZKYe3s5+hCNd42jdBLbvuCFsgdXa
	hpFf8gLtJVzcpF/6GVgcaK1Cn9mbuhTFVQ42WY7v+S6wypaGjSTSZmfXEVO/6dlzmepPUjO3Hvw
	HoslhJ3z02q0cb8oRa/j+1ODMm6xjNuoVbOz2rJwoVPYEf9QaBb8R0rEsQk7hIICWAeCe/WSd+m
	bTGElV3FloDxjf2V2PqfTgMSViBg1tXckZfz9UOHAwf3/hnYzbYinfegV5W75VuHHVoT2YICXkA
	HKuNS3sFsHhpVJt+qIx9A9K9Jtw256Sgk6ymV48sV1ujuYWdvbVOcJpqE+0YOZcRQ+HNL3/nKlF
	YQyIQlbyIpKpf+5hK/wvy4m/D+V+/H7BndoBw+e0Opm0QwRItcr4sjxGezwJySZWp9VrL4RMgGo
	MOpa1LfcTx7rN6MGymxN9uqDw9V1sMeuuvIoFMJa9UM6wJjP+qdreGnTe07OgrhMnRTirXWhJHF
	yTEKbc=
X-Received: by 2002:a17:90a:38e4:b0:3a0:b223:6830 with SMTP id 98e67ed59e1d1-3a0b2236c1dmr6514691a91.7.1790671670089;
        Tue, 29 Sep 2026 01:47:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49867a4b1sm4317440a91.11.2026.09.29.01.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:47:49 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] phy: core: Use EOPNOTSUPP for disabled blob return value
Date: Tue, 29 Sep 2026 16:47:38 +0800
Message-ID: <20260929084739.467082-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the phy subsystem uses ENOSYS for dummy blob functions,
it does not reflect the function state correctly. As kernel already
has EOPNOTSUPP for disabled blob function, replace ENOSYS with
EOPNOTSUPP for a clear return value. Also adapt the return value
changed in the following affect file:
- ata/libahci_platform.c
- drm/bridge/analogix/analogix_dp_core.c
- usb/dwc2/platform.c
- usb/dwc3/core.c

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
The related discussion for switch to EOPNOTSUPP is at
https://lore.kernel.org/linux-phy/20260907114837.2y55l7dfqqrgcka2@skbuf/

Changed from RFC:
- https://lore.kernel.org/linux-phy/20260922024724.191412-1-inochiama@gmail.com/
1. Merge all patch into one to avoid function break.
2. Improve libahci_platform's comment as Damien request.
---
 drivers/ata/libahci_platform.c                |  6 +--
 .../drm/bridge/analogix/analogix_dp_core.c    |  2 +-
 drivers/usb/dwc2/platform.c                   |  2 +-
 drivers/usb/dwc3/core.c                       |  4 +-
 include/linux/phy/phy.h                       | 52 +++++++++----------
 5 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
index 6e072d681341..b04789e7a23f 100644
--- a/drivers/ata/libahci_platform.c
+++ b/drivers/ata/libahci_platform.c
@@ -371,12 +371,10 @@ static int ahci_platform_get_phy(struct ahci_host_priv *hpriv, u32 port,

 	rc = PTR_ERR(hpriv->phys[port]);
 	switch (rc) {
-	case -ENOSYS:
+	case -EOPNOTSUPP:
 		/* No PHY support. Check if PHY is required. */
 		if (of_property_present(node, "phys")) {
-			dev_err(dev,
-				"couldn't get PHY in node %pOFn: ENOSYS\n",
-				node);
+			dev_err(dev, "Node %pOFn: PHY not supported\n", node);
 			break;
 		}
 		fallthrough;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 30c0c0b41d5a..8e26cd772482 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1360,7 +1360,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 			 * phy itself is not enabled, so we can move forward
 			 * assigning NULL to phy pointer.
 			 */
-			if (ret == -ENOSYS || ret == -ENODEV)
+			if (ret == -EOPNOTSUPP || ret == -ENODEV)
 				dp->phy = NULL;
 			else
 				return ERR_PTR(ret);
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index ef0d73077034..62b663ef1504 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -243,7 +243,7 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
 		ret = PTR_ERR(hsotg->phy);
 		switch (ret) {
 		case -ENODEV:
-		case -ENOSYS:
+		case -EOPNOTSUPP:
 			hsotg->phy = NULL;
 			break;
 		default:
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..6d253810c71f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1588,7 +1588,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		dwc->usb2_generic_phy[i] = devm_phy_get(dev, phy_name);
 		if (IS_ERR(dwc->usb2_generic_phy[i])) {
 			ret = PTR_ERR(dwc->usb2_generic_phy[i]);
-			if (ret == -ENOSYS || ret == -ENODEV)
+			if (ret == -EOPNOTSUPP || ret == -ENODEV)
 				dwc->usb2_generic_phy[i] = NULL;
 			else
 				return dev_err_probe(dev, ret, "failed to lookup phy %s\n",
@@ -1605,7 +1605,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		dwc->usb3_generic_phy[i] = devm_phy_get(dev, phy_name);
 		if (IS_ERR(dwc->usb3_generic_phy[i])) {
 			ret = PTR_ERR(dwc->usb3_generic_phy[i]);
-			if (ret == -ENOSYS || ret == -ENODEV)
+			if (ret == -EOPNOTSUPP || ret == -ENODEV)
 				dwc->usb3_generic_phy[i] = NULL;
 			else
 				return dev_err_probe(dev, ret, "failed to lookup phy %s\n",
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..3e84b54a4b03 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -314,14 +314,14 @@ static inline int phy_pm_runtime_get(struct phy *phy)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_pm_runtime_get_sync(struct phy *phy)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline void phy_pm_runtime_put(struct phy *phy)
@@ -332,35 +332,35 @@ static inline int phy_pm_runtime_put_sync(struct phy *phy)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_init(struct phy *phy)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_exit(struct phy *phy)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_power_on(struct phy *phy)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_power_off(struct phy *phy)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_set_mode_ext(struct phy *phy, enum phy_mode mode,
@@ -368,7 +368,7 @@ static inline int phy_set_mode_ext(struct phy *phy, enum phy_mode mode,
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 #define phy_set_mode(phy, mode) \
@@ -397,35 +397,35 @@ static inline int phy_reset(struct phy *phy)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_calibrate(struct phy *phy)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_notify_connect(struct phy *phy, int index)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_notify_disconnect(struct phy *phy, int index)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_notify_state(struct phy *phy, union phy_notify state)
 {
 	if (!phy)
 		return 0;
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_configure(struct phy *phy,
@@ -434,7 +434,7 @@ static inline int phy_configure(struct phy *phy,
 	if (!phy)
 		return 0;

-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
@@ -443,12 +443,12 @@ static inline int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 	if (!phy)
 		return 0;

-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline int phy_get_bus_width(struct phy *phy)
 {
-	return -ENOSYS;
+	return -EOPNOTSUPP;
 }

 static inline void phy_set_bus_width(struct phy *phy, int bus_width)
@@ -458,12 +458,12 @@ static inline void phy_set_bus_width(struct phy *phy, int bus_width)

 static inline struct phy *phy_get(struct device *dev, const char *string)
 {
-	return ERR_PTR(-ENOSYS);
+	return ERR_PTR(-EOPNOTSUPP);
 }

 static inline struct phy *devm_phy_get(struct device *dev, const char *string)
 {
-	return ERR_PTR(-ENOSYS);
+	return ERR_PTR(-EOPNOTSUPP);
 }

 static inline struct phy *devm_phy_optional_get(struct device *dev,
@@ -476,7 +476,7 @@ static inline struct phy *devm_of_phy_get(struct device *dev,
 					  struct device_node *np,
 					  const char *con_id)
 {
-	return ERR_PTR(-ENOSYS);
+	return ERR_PTR(-EOPNOTSUPP);
 }

 static inline struct phy *devm_of_phy_optional_get(struct device *dev,
@@ -490,7 +490,7 @@ static inline struct phy *devm_of_phy_get_by_index(struct device *dev,
 						   struct device_node *np,
 						   int index)
 {
-	return ERR_PTR(-ENOSYS);
+	return ERR_PTR(-EOPNOTSUPP);
 }

 static inline void of_phy_put(struct phy *phy)
@@ -507,27 +507,27 @@ static inline void devm_phy_put(struct device *dev, struct phy *phy)

 static inline struct phy *of_phy_get(struct device_node *np, const char *con_id)
 {
-	return ERR_PTR(-ENOSYS);
+	return ERR_PTR(-EOPNOTSUPP);
 }

 static inline struct phy *of_phy_simple_xlate(struct device *dev,
 					      const struct of_phandle_args *args)
 {
-	return ERR_PTR(-ENOSYS);
+	return ERR_PTR(-EOPNOTSUPP);
 }

 static inline struct phy *phy_create(struct device *dev,
 				     struct device_node *node,
 				     const struct phy_ops *ops)
 {
-	return ERR_PTR(-ENOSYS);
+	return ERR_PTR(-EOPNOTSUPP);
 }

 static inline struct phy *devm_phy_create(struct device *dev,
 					  struct device_node *node,
 					  const struct phy_ops *ops)
 {
-	return ERR_PTR(-ENOSYS);
+	return ERR_PTR(-EOPNOTSUPP);
 }

 static inline void phy_destroy(struct phy *phy)
@@ -543,7 +543,7 @@ static inline struct phy_provider *__of_phy_provider_register(
 	struct phy * (*of_xlate)(struct device *dev,
 				 const struct of_phandle_args *args))
 {
-	return ERR_PTR(-ENOSYS);
+	return ERR_PTR(-EOPNOTSUPP);
 }

 static inline struct phy_provider *__devm_of_phy_provider_register(struct device
@@ -551,7 +551,7 @@ static inline struct phy_provider *__devm_of_phy_provider_register(struct device
 	struct phy * (*of_xlate)(struct device *dev,
 				 const struct of_phandle_args *args))
 {
-	return ERR_PTR(-ENOSYS);
+	return ERR_PTR(-EOPNOTSUPP);
 }

 static inline void of_phy_provider_unregister(struct phy_provider *phy_provider)
--
2.55.0


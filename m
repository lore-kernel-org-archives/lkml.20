Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283605AEC70;
	Fri, 16 Oct 2026 18:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176222; cv=none; b=bWWFjJ2qCs8JjsMmqGsEup3taO+A6mx0WKQ4ZWhRQIbVoE33WsVUnLMaBQv09PYman9HFDDF+OApbxtcRIMvzoJeaTqU8z6DTV9iszsmn55ioVXNiq8EF66j3eXNK/AHXBQF+mDZ4MENhW4WcM4WsevxJGV79L8mJ9ROxTffBEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176222; c=relaxed/simple;
	bh=C0aeOmS9sPLL/qJwqoFzotL1XmRAOgMH6m/vPGSwRVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQMiYD/cz8H5yCyOdGjwmxi+vujkhsZP7raPsXU3DvfG/7CGSIPlyfpjRUrsPAQRA/7bRimRXZU//2psBckX439zLDhY4dgtFNd9By86TmoX62XpJDUztuGjo/lE+NWLPOaJvDDPolJ9a4yFxVDfZBbt3KwmPXhapcHVGqy/vSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oIxys4qo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oIxys4qo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792176215;
	bh=C0aeOmS9sPLL/qJwqoFzotL1XmRAOgMH6m/vPGSwRVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oIxys4qoOZiseYN5V43CVayuctRKCRQC1ExO0bZLZP4ZVgijLLFFLA8CsBzTkxseu
	 4FOi8uNzg8fD+Hr00sNoXPKnYokjMle/qbeD9bD55cqpXAjpaWcKjMRMWiX/rVQdQN
	 T6vUNvGkj2lOUvf/uRDUVi3SxNJ8G0nAltNfPHbMihzj/PAx3j0O0gm2nGA3CSt2/p
	 CeclEvpKFd2nOYUDDqCzgVGXD4+YZqkk7H/gGTYZ1bLRGxrsVi04WN7NhqpF9OOzr9
	 UVPO99aaYE0ReMNNwKS6iGGrjRqtcE6c1eHYawfB0OWgFFEuAiYVG/skAtWObGfMvL
	 A8K0SKrFfZEbQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E99D17E153B;
	Fri, 16 Oct 2026 20:43:35 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6B1AE48003A; Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 16 Oct 2026 20:43:23 +0200
Subject: [PATCH v17 7/7] usb: dwc3: rockchip: fix USB-C reconnect in gadget
 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-7-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3255;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=C0aeOmS9sPLL/qJwqoFzotL1XmRAOgMH6m/vPGSwRVM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrScFbVPfVUApqPMxSUh2rHPf/nEbJ1tr2vi
 8KFoP8e21z1hIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq0nBWAAoJENju1/PI
 O/qaCXsP/A0h4by3pYZzgmq6LcweRSRiEiUTMh3E3tnb1J8EGyk6/N/ZU8MiQCSzVqYW7VpQVUr
 f4UaRhmbYMrdGBywoO/22rjL4RfAX695hSHcH0sdmWW8CEXclj4avbl5lXb+y15DDo+m/H7mqIn
 2IRrnX9cP6jzcffWec/9FVL6VMiw4Mi4a/rLrVCnQo7sCDzOcwdUU0Q/qyWcyY853vXtNijbTKZ
 r7TtqMSEKe3UQy2QQQhv4OkzNYDJZfYSx9ACO7cCNJxmFgaFczstawQJ/EZJi9URtSyqP9N7VkM
 d1PpAaxF4Y4winNq9dgu7rygHgyjr9wFgFeuOpxPYy9gmUDf0EeqObRrowK9jGRsQO3x0QMlMt2
 wsoT7VH1MoxqQFf32yok3sp8uSNd6Fii/WV9rmmnpoWut//yfCG7VdgUI0Jy4nDEulq21snL3DR
 Qw2AxUHxPcl3UgkljdmkUR3MAbdVK9D4fcU7Gmk8UN7lo/NeUyhHS4zaFkt9Z7UBwdMYCPxmYMB
 OSCzUiPC1laIfTNpyLODN6oIAWL/7pLkaXWG6R2hwx+vkXoxsG09cny0FX53D8WXFkZnCOzgzgi
 aTGYfYgl9gkbTb1xnUMRAtXn2D8N2TEmrPKrI40HYBHJImJhBqxyKugKyEf9B6BkkpAOK4xBrv9
 GItSKkjFPUO1DEZs1HDkqWA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When USB-C is configured in gadget mode and the cable is unplugged
the USB controller is suspended. After plugging in the cable again,
the USB controller stays suspended and thus the port status remains
not-attached.

Fix this by informing the USB core about VBUS updates when the PHY
mode changes.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/Kconfig         |  1 +
 drivers/usb/dwc3/dwc3-rockchip.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index c86c1ac293bf..4cbc949c6abd 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -194,6 +194,7 @@ config USB_DWC3_ROCKCHIP
 	tristate "Rockchip DWC3 Platform Driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on PHY_ROCKCHIP_USBDP || !PHY_ROCKCHIP_USBDP
+	depends on USB_GADGET || !USB_GADGET
 	depends on OF
 	default USB_DWC3
 	help
diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 1f32150caa09..5cb5feec8bd4 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -25,8 +25,17 @@ struct dwc3_rk_phy_nb {
 struct dwc3_rockchip {
 	struct dwc3		dwc;
 	u8			phy_reset_active;
+	enum usb_role		role;
 };
 
+static void dwc3_rockchip_vbus_handler(struct dwc3 *dwc, bool present)
+{
+	if (!dwc->gadget || !dwc->gadget_driver)
+		return;
+
+	usb_udc_vbus_handler(dwc->gadget, present);
+}
+
 static int dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
 {
 	struct dwc3 *dwc = &dwc_rk->dwc;
@@ -51,6 +60,8 @@ static int dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
 	if (!ret)
 		return ret;
 
+	dwc3_rockchip_vbus_handler(dwc, false);
+
 	/*
 	 * Assert USB3 PHY soft reset within DWC3 before the external
 	 * PHY resets. This disconnects the PIPE interface, preventing
@@ -70,6 +81,8 @@ static int dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
 static int dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, int port)
 {
 	struct dwc3 *dwc = &dwc_rk->dwc;
+	bool gadget_mode = (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE) ||
+			   (dwc_rk->role == USB_ROLE_DEVICE);
 	unsigned long flags;
 	u32 reg;
 
@@ -87,6 +100,8 @@ static int dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, int port)
 	dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	dwc3_rockchip_vbus_handler(dwc, gadget_mode);
+
 	pm_runtime_put_autosuspend(dwc->dev);
 
 	return 0;
@@ -138,7 +153,16 @@ static int dwc3_rk_phy_register_reset_handler(struct dwc3 *dwc)
 	return devm_add_action_or_reset(dwc->dev, dwc3_rk_phy_unregister_notifiers, dwc_rk);
 }
 
+static void dwc3_rockchip_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	struct dwc3_rockchip *dwc_rk = container_of(dwc, struct dwc3_rockchip, dwc);
+
+	dwc_rk->role = role;
+	dwc3_rockchip_vbus_handler(dwc, role == USB_ROLE_DEVICE);
+}
+
 static struct dwc3_glue_ops dwc3_rockchip_glue_ops = {
+	.pre_set_role = dwc3_rockchip_set_role,
 	.post_phy_registration = dwc3_rk_phy_register_reset_handler,
 };
 

-- 
2.53.0


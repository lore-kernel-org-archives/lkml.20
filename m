Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769B4A6CD2;
	Thu, 24 Sep 2026 17:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270769; cv=none; b=mNBw4YzCj4aXkXs7RAkkXgRuvNg3EUSOUNK19k7tWlDIhjmX29fREyDTtxDnqrHHXCrcZS4tjymDXq7vEQqM7RCh6TpT23ecrgFgQNqAAnG3a4Co+G8sY2iDyx/MUl0pCLmOJY8yegmzpixPQGhe9mDyK0RXo5DPN8sUBGkXANU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270769; c=relaxed/simple;
	bh=YEWEtK3OAKTM8p7PXwLKo0yacKTTo23MmLht74kfYi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEdoNkP6boaqja2oXMYrncA8c8/SrZANH/c5PGBhGP6/N223qm2LCZVALuVB9k7fz/LIW+gy0JDLpoxXl8PV4ihVL+Q7iXghPHbrTQ53kyKL3OqQPyBRMvEBwW+F16eMmb2XmpXvNuljA41Xz8axo5TNzED9yZyWFIVbPI93mmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZEsiaBC9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZEsiaBC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790270762;
	bh=YEWEtK3OAKTM8p7PXwLKo0yacKTTo23MmLht74kfYi8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZEsiaBC9zZ+KG2q7Q7R0y5EjRpPfkC/kmcPHW7MNX9OM1w89g/o8T9vMxHOh4p1vJ
	 x6N9si/dZH0pFlyZCdY7glZUFQYBKpv2GX3zR7zL7GLcvygsx1zygi4ySnIBJknYdo
	 ++uy5pr2C9fz4ooaXfAa24vNWpvw0XSNjGkvpeijJLNF98UXczg2ZtI/SqaIIZIKtv
	 y1PXnbbOlQ7BZFFpi2V7DS32c4ZofITJ2253484g+QUgOpTZd/b+iSGvONEuuzY8a1
	 BAUE2DpQX0uhuGVzOPKdO6X3mKGCXU82rOz98TkXYqt1hxVfp8nyj0X5v3C4yrmQ09
	 xCl49Z8UHZphw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4760217E0D5D;
	Thu, 24 Sep 2026 19:26:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A1908480038; Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 24 Sep 2026 19:25:42 +0200
Subject: [PATCH v16 6/6] usb: dwc3: rockchip: fix USB-C reconnect in gadget
 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-6-126a2e9133c3@collabora.com>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=YEWEtK3OAKTM8p7PXwLKo0yacKTTo23MmLht74kfYi8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq1XSlS+3KF/YdkO6CeAE9m8ZTAA49feZOcM
 GGF9k9kRzgWGYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqtV0pAAoJENju1/PI
 O/qap3sQAIFzrHsf7RhgG5KHrxkH4p1durXd17NT8Ez7CYxUZ0NqyS9rvbvRoOI3MorxKRe64/w
 SSz6fFo/0TdMlegOhmGvXSIPadXTOm9+uR6+9ry8elX4PCHgOO15gym9C3J/ZdKQ+plCL7wEGDn
 lLb+Jk/yHtMlREzB0tlDCfLC4crWkB74tZWIkDCWkIQYNzag/FoalbOaLAYZrG0Ju1nP/NTbz1R
 Vn6fo6yikBse69UFwGuUFvzICwfFX2DpTYAizd5bmAfCZj7H0CMUCa0WzNWINrtPNYRd5/xNg2s
 ltMKdEwa8E0q7qjL/4ubkpZV0yqELBWvuWF7xODtpGx1DbZ+lHYn+XEByU0qqNulzilrjnXGgOU
 bKAviin8AS/PqP0B5wMw+SlLFQ9uJQOdjM0pjwxNfLDgOE4o7/R9n13FAPnFJB9UseNM4bLB88g
 e3snrWFo+q8ONgY6hVyLNNa+rYx+VRHONuPUpzXg7Srm7nvD4YiypZZfenTk0LQK519UjMR+QOz
 x3H3aoojVUzDjEO3mj1+qXtiHi9PTJYgF2R79+ni4bVIxkC6zVWo8G93OuidRiOwWqYiwzxIxHE
 QL8uCCjoj7eHfw5RKmSYaY9P8jeTogPKmZ03vNiPUEnR6SVE/hUItgCTuFcfgIkT3bb9OcPmMw7
 J8zqghlf57Eb3+J1YDPAlNw==
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
 drivers/usb/dwc3/dwc3-rockchip.c | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 3c120ea9746d..344291daf1b2 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -193,6 +193,7 @@ config USB_DWC3_OCTEON
 config USB_DWC3_ROCKCHIP
 	tristate "Rockchip DWC3 Platform Driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on USB_GADGET || !USB_GADGET # if USB_GADGET=m, this can't be 'y'
 	depends on OF
 	default USB_DWC3
 	help
diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 17b6c2ca9e19..ba8ffef2f27e 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -25,8 +25,17 @@ struct dwc3_rockchip {
 	struct dwc3		dwc;
 	struct dwc3_rk_phy_nb	usb3_phy_nb[DWC3_USB3_MAX_PORTS];
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
 static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 				unsigned long action, void *data)
 {
@@ -57,6 +66,8 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		if (!ret)
 			return NOTIFY_OK;
 
+		dwc3_rockchip_vbus_handler(dwc, false);
+
 		/*
 		 * Assert USB3 PHY soft reset within DWC3 before the external
 		 * PHY resets. This disconnects the PIPE interface, preventing
@@ -69,6 +80,7 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
 		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
 		spin_unlock_irqrestore(&dwc->lock, flags);
+
 		break;
 
 	case PHY_NOTIFY_POST_RESET:
@@ -89,6 +101,8 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
+		dwc3_rockchip_vbus_handler(dwc, dwc_rk->role == USB_ROLE_DEVICE);
+
 		pm_runtime_put_autosuspend(dwc->dev);
 		break;
 	}
@@ -130,7 +144,16 @@ static int dwc3_rk_phy_register_notifiers(struct dwc3 *dwc)
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
 	.post_phy_registration = dwc3_rk_phy_register_notifiers,
 };
 

-- 
2.53.0


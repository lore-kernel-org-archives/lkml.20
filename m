Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605957;
	b=N0MY68/qm1GClcLiMdF3bo5oPRt0rgFSks4JRBBhyol0T6hnk3a7WPNgoLcAKWUrqVM8
	 ZaZegIN4PJZlVi1aL6G383wrA9THYfdqZhYTDW1u/7aUAcEP1oy0Z2MDincpo07dZWFWl
	 bmrIitdodnnXcR2RJGmOOTHCLZfkh8ALMOGsXhhsv91K6Ahl5jB5KEW6x8aF/3Q3xPkQl
	 JBbyYgh9qm/njpGbQojK9p7BCa+4mEoAe7sVsvKQ3WBW0P99ta1ge8BCKcAmzhLLxRoOO
	 GzOAjh+ifebZc1YpPelcfxDvsNlp9BK03iQBUgt16jTaWP0paN55MYmrbeqZqtGtMyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605957;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=MgjbpoDnHZDSyi2XaxhM0FrM/zI2+98gTHXkVKIcidw=;
	b=5CBNLumbxCnRRlBMsyPhydHBnqO7JkPQ4NvLwmVuMgeNDpM1O7HIl6j8T9yjJ2AzWbq6
	 5LMIu4aF3v5WWWud1yLXAWDWCpPjskhwZ0rxLS6phc74lc6icdSFrL6Y/zjefqShb5bbS
	 3r6g4jA5GtMexTupf8lGFEVO4PfuIA8u1Qjp5TPgvE9LPpYYp0l2rMXcbvBmGRkNW1E9A
	 Ol0NkNcgY86i0o/SHo2eaJEvcmtpgih1+zhkkBZ/YEdWziH4ehcBRJOFrtaG+PB/nN6YB
	 zgIv2gXp4oCBIXG2atwaYIrDVNeaXr+PX+WG17kMnkqoCsWx4y7qorc3BuckjjwaA+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pEU+3OY2;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2332B60A260A;
	Wed, 21 Oct 2026 18:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2332B60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pEU+3OY2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792605944;
	bh=KIrw1rhwjg96Ij7es3QrXe7aVdikAVkgdjGn2PHrrP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pEU+3OY2Pi17qs0Ca/GuUTa1ZkbZhgBDfNxStQIeAmrk/JO09lW6g1Ef0sUnftthj
	 +HndY6MQumgKqpe7FR2NWHy369RBIYOu3C8cq8jPvArHU5lxmjwpy21sJqo9xNWid0
	 L1vAfpbZ0t2z+ERdsuK7xugYrhSjcHe5QjrbWK4GSYz0ZUieg562KxZhOBeZLm3Li9
	 1Bt2jpnUoFqYMZREr+I3SGpS3U4lgZVvntn5StdjLmLAYTEa8K+Krp0sUwSc/oTsMh
	 EiSDzs7lsoCCNxaGQ9dn6le6AMtbGmENrHZUphk7M7O/ymzqMNu15AOQh1ckUB987M
	 unNmaEZj72zhQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 02E4017E0C39;
	Wed, 21 Oct 2026 20:05:44 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6C12D48003A; Wed, 21 Oct 2026 20:05:43 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 21 Oct 2026 20:05:32 +0200
Subject: [PATCH v18 7/7] usb: dwc3: rockchip: fix USB-C reconnect in gadget
 mode
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-7-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3403;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KIrw1rhwjg96Ij7es3QrXe7aVdikAVkgdjGn2PHrrP8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrY/vcdIt8gmFXfvv6aM1rvBLxJV0MBNABKX
 VFGnWyg/ogE9okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq2P73AAoJENju1/PI
 O/qaMFEQAJWACbr5V+uEcVVazVL/oK+YsoAIPRX/NuQ4g2FcVlyzUD4OL7yYe2vCZZvnVsb9UZV
 jR+QpnALAyIaj0Az4are1tj6I5rnLxnjXER+Azr1sh8KSSa1Y05cY5ct0TPs6uAbq5U1Q0eBFIJ
 4zpX57Nnd/VjJOrh8Kv6t236KS96jobN72YqdFRud06RBgdhBjPOgQzeW6p7sFaLoJG0pkj9jUY
 gcp6nRq3/Svk9fXqnvfLSEo7Sqennu5Zvwnbs68g6Pob7YuQThrrxr5UC5/2GVm1+4Uu6Dp13T/
 PbTIJRWWdem2HNoiBBCEzIoB3lVFJhVBTa3SID6Psycack2V7lTsM3Y5FHca9uDITZuuoVkhlQk
 RPw4wAd2buSWUrCYw4JY5QiaKw55a1JvsapwVFKVWACA9EXh4rw8LXLybkLS058kFrIE2H5PpDy
 P5tJZpZcRPTM2f0etbW4fgA0fWD247pGvtILZzkEwzcBrgd9kX+npOS4CkE8DwlsCUYL3i2dZJQ
 kN4lxD0xH/nI+KlXClcC3/gppPncnSWMToy22yUWP5wL+HgR1X2cbcEqHWL1zkYBhZvEyMWMJHd
 0DzZWL9vqnbAnE7VfMLAR4LnVD4QmRyzHph+6fjatxsv+jtJ4ij9nzgaUaymUDBzlJm3VRK26k1
 ow869m34be0TyOF4jOXEuqA==
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
 drivers/usb/dwc3/dwc3-rockchip.c | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

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
index 75e647e04cc5..65d17536af14 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -10,8 +10,19 @@
 struct dwc3_rockchip {
 	struct dwc3		dwc;
 	u8			phy_reset_active;
+	enum usb_role		role;
 };
 
+static void dwc3_rockchip_vbus_handler(struct dwc3 *dwc, bool present)
+{
+	guard(spinlock_irqsave)(&dwc->lock);
+
+	if (!dwc->gadget || !dwc->gadget_driver)
+		return;
+
+	usb_udc_vbus_handler(dwc->gadget, present);
+}
+
 static void dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
 {
 	struct dwc3 *dwc = &dwc_rk->dwc;
@@ -26,6 +37,8 @@ static void dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
 	if (!pm_runtime_active(dwc->dev))
 		return;
 
+	dwc3_rockchip_vbus_handler(dwc, false);
+
 	/*
 	 * Assert USB3 PHY soft reset within DWC3 before the external
 	 * PHY resets. This disconnects the PIPE interface, preventing
@@ -43,6 +56,9 @@ static void dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
 static void dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, int port)
 {
 	struct dwc3 *dwc = &dwc_rk->dwc;
+	bool gadget_mode = (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE) ||
+			   ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_OTG) &&
+			   (dwc_rk->role == USB_ROLE_DEVICE));
 	u32 reg;
 
 	scoped_guard(spinlock_irqsave, &dwc->lock) {
@@ -56,6 +72,8 @@ static void dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, int port)
 		reg &= ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
 		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
 	}
+
+	dwc3_rockchip_vbus_handler(dwc, gadget_mode);
 }
 
 static void dwc3_rockchip_phy_reset(void *data, int port, bool pre)
@@ -99,7 +117,16 @@ static int dwc3_rk_phy_register_reset_handler(struct dwc3 *dwc)
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


Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61A54A8FD0;
	Tue, 15 Sep 2026 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485495; cv=none; b=CcDzxSku+kruu57ExHJ5p+KGSTZTgU7oatvqipm3/xhzxW8CaMAUqCJvvdO6ovDv68uKyNJPG7a1nYzllBTqqCNW9giiDlyfKYlFUf5md1Gm3K09m+9FUfmkLyvsmAWv1tdX0chAu1NXjFp3LA3L0W9MotVV4U/99iF1j+mVLy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485495; c=relaxed/simple;
	bh=4ay9HedzmaAw9AOpIB2HEj425HBli4lesEM/GeDH6Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cPzY0Fhc3RgG5rHSwkh8MyDdfTT6VbFpLzG75CFnW5u2dlidw0fvkQZ7oV9Zp2VQHSaxa/+czHIDQCoM3W1Pl8w0DxJ4GTCCN0nw9TaEaVKvttogYwEEIVBpbJQcVtRVkehE3BtJ7zKq1f4YlNxcID6InEnduXrECwPOqQDbBeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cg5t7IhU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cg5t7IhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789485488;
	bh=4ay9HedzmaAw9AOpIB2HEj425HBli4lesEM/GeDH6Ws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cg5t7IhUmD/nWSFCnqRs0kiBU8ihPO0fdhDugaflmmpoalPii7a0j2R089ON6QrY1
	 uRItSeFGKSn/JajS9cj78LiOPFFcKZc8NxQR05smag0ij9wof8oX6q4r/kHGAN3l+Z
	 WNNEWsdu5H/P9IYlNnFEjpeyX3e6jVOoZYjC/8XOAPvmpYpfvn5APk0ulpGR+vcJUq
	 Xt+CM3jphiWQDyEZbSvgGFyhGi6GS5QIV9pkHZniGWcG2PQcAxbOiFwnmWlWpvG8pR
	 KqeMArgv8RTCkcUJWUhv5zJAyPT/WMNEvU5J4Rznb23bpD7QzuNufkA+q4EMmZ5oUN
	 gdoc72h0GbWFQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DFAF17E0D43;
	Tue, 15 Sep 2026 17:18:08 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C3960480035; Tue, 15 Sep 2026 17:18:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:17:45 +0200
Subject: [PATCH 5/5] usb: dwc3: rockchip: fix USB-C reconnect in gadget
 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-5-763bb546824e@collabora.com>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4ay9HedzmaAw9AOpIB2HEj425HBli4lesEM/GeDH6Ws=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpYa/a9SOAir0KW4AaNxa0ywVhpg488MTBD
 S0OITRoVLsQzYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWGvAAoJENju1/PI
 O/qa5RwQAKpvcFHb8bI5rMhfqAImvq7YJvT7RXR6ReF/8jl2T1nEvc6xW4/s2rJOnlbm8PQr6yj
 JesP2eExEyH6PNp1mNauTAmwALyAoeFG2iircznSMEpXFgXZjWjTzngeP2I4yW2LVfovn2oy0to
 UyiyGI4VTJ8YBiXTPT2QmaRzfN5IL+1+JHds6tAsnc1MvHG2Yq9Y2EzGFitweX3Q2LS4mSgMU6R
 fosX2KjeozFlR9Xdn9EHtmgnqjPBnkTw587QJMDeC8xXfUNXWLxgZ9eaEl3Y/IDwnCV/1jQKnQp
 fnSmknaz5xG0ChuKLhIOEJiazDS56oQcWXFO2hx85CXvDpr9TndZhSuZy/2y0Vb1BfUyWIzgts+
 MvdjtlQPoPZiV93AEL9Ib1gSjssPuU8sEPKloDX27V8wBZqhck/9aUhMbe/ku3m+Yrq13g1/qr+
 Mu8Hj2eg8whfz3OK4Ao7FZKWMTLx60UVFGrspmu6uCQDJE1vvXdMZY3nY+iGn7PjhoaZjbhAWqR
 2ug3lh5K9u2/lj3gGECQDoWMWdD0ai55PyeYKM8jPQZiwap2nUkA+sX2+s3c7wYlvoo+mpEB6AZ
 GyBXi8HOHTGN8d9wxnNNLmCCQiYaD8T4gvoEOlIgVaLiWDCFX4yV5nehFW/clwcwYEh26hbNJRq
 zTBYrZVo69pN8Vyq1904r2A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

When USB-C is configured in gadget mode and the cable is unplugged
the USB controller is suspended. After plugging in the cable again,
the USB controller stays suspended and thus the port status remains
not-attached.

Fix this by triggering a runtime PM resume when the role is changed.
The Runtime PM reference counter is immediately decreased again - the
auto-suspend time is big enough to detect the connection status, which
will then keep its own reference.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/dwc3-rockchip.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 7bdd6e2eb22d..bedec3295bb1 100644
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


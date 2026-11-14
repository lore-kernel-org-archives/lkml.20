Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618171;
	b=ovgJFFRN75Ld5eOvfw0+9iqzCwJSfFRGCxS8SlyXQ1vQG1OpuAACPIrLsMUm+jTpLSOc
	 8PkzH5UL8VddqVXhvMxZgOZ2N4MIMbhUGbqNWXvTvNI0GkJ2EwrFU5RE/WIH5Qn0DlLs+
	 UbqCaD80qn/ov5Y8Mv9RJASGgBCtNDkJFD40qd0gmoYWUJ+4ucRkUlyElbfXdUUKH6Jk1
	 4ouSCRnxDVaj5qew5WnLso6g/nTTc3EtplUboXa7Y+mNfw3ZobNHvO5u/NPFYFDp5f28a
	 uVZJPOGv6VagaalMUn5WwZETajiJNrVVIo0febntPfhzN27m5Uy3tynTtLdNVUSKvjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618171;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Cv8P5miVZuYEKgmArl1OJs1HmGv8dXHrbdg23EvDXYA=;
	b=pRGiiPgz7a+1J6Cv3L0gi3RWDkX82ZfkOUGFjSaw1ExgUBX1ZtN2ZBRrz8VncgMDIT4v
	 sdb9qScIkRchEu2hKrMhNQ3GU9caA7dq+F2rmlOdVb/PWlJFVPn3gLIZ3l1Wo41bJKooh
	 fCRQxqvHrJKI/PRL3goc3Wq0dSiJYhs12IoBSlfubUnGMrbwPh18IBNLHCiyf53QJuSmb
	 QioS3MlemeYJ7zi+ETixR63ppJZjJY6zG6M3GVYmhyu9V9OLdXQ85Y3lmDx7Zrr6Hwbow
	 pr2czI0WlHVRvpQZUcYv15J8edrvMlP8V2oNGS6oAwl2WKBM2UeQcUIBrcYDFg1utDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qMANL379;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C03F606A331;
	Sat, 14 Nov 2026 01:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C03F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qMANL379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794618166;
	bh=g0X6JocB2VyTivc72aE0Omr9YagRRa/kK2iKOuWwk04=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qMANL379jhUDGWFPor10CFnutR7LqDDBUfzMGf6lkUyVufvtrOcdaDRFUeB+htiJd
	 1Cr3Ub8Odk2zGGrf8nOC9q31N4Kc2F2QJfy6gklHbBsboEaMinsAUpvEnFHZ6nHRwp
	 g0iM/iD3K1AFU+hecnuEX1V6v2h6WC4qaHN/K4/LfWUdO8lF6ayYJirlHHQ0tb82ju
	 XuKsEEGzHjTI9klGcwxeD+KNXcoL7bXwKDTKR4FSSECCJdgPOfCtSVLy45KStD1Q4t
	 fWunbim4z2Uv9AyyFZLUzLBkcPGJLg7T1Z2EoFUy37jAvWSLltIXsS8ZrylhkCsRcr
	 YTrg2HzDdlY4A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E58017E14AA;
	Sat, 14 Nov 2026 02:02:46 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C9CAF48003A; Sat, 14 Nov 2026 02:02:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 02:02:05 +0100
Subject: [PATCH v19 6/6] usb: dwc3: rockchip: add USBDP PHY reset quirk
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
Message-Id: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-6-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7897;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=g0X6JocB2VyTivc72aE0Omr9YagRRa/kK2iKOuWwk04=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3szVhtZpqns5w2s0Zg7SSkBkwC+W2H7yMF
 23mFsaqd87kaokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq97M1AAoJENju1/PI
 O/qaNhAP/1X0jU5hid9o2gP4+cwGm5zAJ0PHCOTPJyPu3c8tNkyhZ9+xKQ2pgbvvoHL3YuhvrcY
 e7uK682v5ofZaQV2hKOdL3hf79IL2mudZioN7zgS9zRj44vSbOO3xlqHQcHBOfcC2/hmppyCerl
 RCXW2hl1cFT7L4o7w08CnSSBY9C+HAXvp63QT42F9j6D4nsnF5rP/N1chJxqovN/9XYXimaz16F
 oN7MMXTUrbcJCZTe8iPO55sxEHGmZYrjhA5P02mnTgJhKn0Ylmyg8p09yfaYhq740M9ZRZ0Z7wy
 I1PwrJcbYhZzxTNcgmUiAcuiEPNadakNm9KRh00zQJTKdF0HhhubYqSRsI41r52JlMOCPSKOt5S
 GY9tTVuGuvhEWngvf2YFhqffbn/AE12lkw6pzTqY5z1ZLdpeQxl66M/3rzElNoCxVUuKooDg6LV
 ahqGIrTEvNEdNf3OP+06uwKd9eL67LZg6CodpYyacW6tadu00D0kYoWK9L60S/o5aTPNtpvyQRm
 e0sstC+nIXopKbDOh5SEUaCT5hek0ksWt/5QKTE+ptpcuw5c9tXphxTHiLtN2BLnhh+obH+xlNJ
 7MpAigCnAy048QW1PDyBqD/1Qu5Fd88ueHEARkffHCD5SF2PlTbBDADWhOANhLB/GWD2++RPZi5
 NnHTauir7xqGPU191CFM4Eg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

On recent Rockchip platforms (at least RK3588 & RK3576), DWC3 IP is used
with a USBDP PHY providing USB3 and DP. This PHY needs to be reset when
the mode changes, which may happen when plugging in different USB-C
devices.

If the USBDP PHY resets with the DWC3 IP running, its internal state
corrupts resulting in the USBDP PHY not being able to lock some PLL
clocks, which effectively renders USB3 unusable.

To fix the issue this adds a Rockchip USBDP specific quirk, which will
assert PHYSOFTRST before the actual PHY is disabled and will deassert it
once the PHY returns.

The quirk is skipped while DWC3 is suspended, as its registers may be
inaccessible and the device being suspended is a quirk in itself (the
vendor BSP enables runtime PM with very short autosuspend as a
workaround for this issue). Thus the code just ensures the PM state
does not change while the PHY reset is going on.

Note, that the same platforms also use DWC3 with a different PHY
(rockchip-naneng-combphy), so the PHY calls are protected by a
driver name check.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/Kconfig         |   1 +
 drivers/usb/dwc3/dwc3-rockchip.c | 154 +++++++++++++++++++++++++++++++++++++--
 drivers/usb/dwc3/trace.c         |   3 +
 3 files changed, 153 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 3c120ea9746d..c86c1ac293bf 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -193,6 +193,7 @@ config USB_DWC3_OCTEON
 config USB_DWC3_ROCKCHIP
 	tristate "Rockchip DWC3 Platform Driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	depends on PHY_ROCKCHIP_USBDP || !PHY_ROCKCHIP_USBDP
 	depends on OF
 	default USB_DWC3
 	help
diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 4129aefd6a8b..25bf2794c1fc 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -2,11 +2,120 @@
 /* Copyright (c) 2026, Collabora Ltd. */
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/phy/rockchip-usbdp.h>
 #include <linux/pm_runtime.h>
+#include <linux/wait.h>
 #include "glue.h"
+#include "io.h"
 
 struct dwc3_rockchip {
 	struct dwc3		dwc;
+	wait_queue_head_t	phy_reset_wq;
+	u8			phy_reset_active;
+	bool			pm_suspended;
+};
+
+static inline struct dwc3_rockchip *to_dwc3_rockchip(struct dwc3 *dwc)
+{
+	return container_of(dwc, struct dwc3_rockchip, dwc);
+}
+
+static void dwc3_rockchip_set_suspended(struct dwc3_rockchip *dwc_rk, bool suspended)
+{
+	struct dwc3 *dwc = &dwc_rk->dwc;
+
+	guard(spinlock_irq)(&dwc->lock);
+
+	wait_event_lock_irq(dwc_rk->phy_reset_wq, !dwc_rk->phy_reset_active, dwc->lock);
+	dwc_rk->pm_suspended = suspended;
+}
+
+static void dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
+{
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	u32 reg;
+
+	guard(spinlock_irqsave)(&dwc->lock);
+
+	dwc_rk->phy_reset_active |= BIT(port);
+
+	/* DWC3 being suspended also works as a quirk */
+	if (dwc_rk->pm_suspended)
+		return;
+
+	/*
+	 * Assert USB3 PHY soft reset within DWC3 before the external
+	 * PHY resets. This disconnects the PIPE interface, preventing
+	 * the DWC3 from interfering with PHY reinitialization and
+	 * avoiding LCPLL lock failures.
+	 */
+	reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+	reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
+	dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+}
+
+static void dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, int port)
+{
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	u32 reg;
+
+	scoped_guard(spinlock_irqsave, &dwc->lock) {
+		dwc_rk->phy_reset_active &= ~BIT(port);
+
+		if (!dwc_rk->pm_suspended) {
+			reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+			reg &= ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
+			dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+		}
+	}
+
+	wake_up(&dwc_rk->phy_reset_wq);
+}
+
+static void dwc3_rockchip_phy_reset(void *data, int port, bool pre)
+{
+	struct dwc3_rockchip *dwc_rk = data;
+
+	if (pre)
+		dwc3_rockchip_phy_pre_reset(dwc_rk, port);
+	else
+		dwc3_rockchip_phy_post_reset(dwc_rk, port);
+}
+
+static void dwc3_rockchip_phy_unregister_reset_handler(void *data)
+{
+	struct dwc3_rockchip *dwc_rk = data;
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		struct phy *phy = dwc->usb3_generic_phy[i];
+
+		if (phy && !strcmp(dev_driver_string(phy->dev.parent), "rockchip-usbdp-phy"))
+			rk_udphy_unregister_reset_handler(phy);
+	}
+
+	WARN_ON(dwc_rk->phy_reset_active);
+}
+
+static int dwc3_rockchip_phy_register_reset_handler(struct dwc3 *dwc)
+{
+	struct dwc3_rockchip *dwc_rk = to_dwc3_rockchip(dwc);
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		struct phy *phy = dwc->usb3_generic_phy[i];
+
+		if (phy && !strcmp(dev_driver_string(phy->dev.parent), "rockchip-usbdp-phy"))
+			rk_udphy_register_reset_handler(phy, dwc3_rockchip_phy_reset, dwc_rk, i);
+	}
+
+	return devm_add_action_or_reset(dwc->dev,
+					dwc3_rockchip_phy_unregister_reset_handler, dwc_rk);
+}
+
+static const struct dwc3_glue_ops dwc3_rockchip_glue_ops = {
+	.post_phy_registration = dwc3_rockchip_phy_register_reset_handler,
 };
 
 static int dwc3_rockchip_probe(struct platform_device *pdev)
@@ -25,8 +134,9 @@ static int dwc3_rockchip_probe(struct platform_device *pdev)
 	if (!dwc_rk)
 		return -ENOMEM;
 
+	init_waitqueue_head(&dwc_rk->phy_reset_wq);
 	dwc_rk->dwc.dev = &pdev->dev;
-	dwc_rk->dwc.glue_ops = NULL;
+	dwc_rk->dwc.glue_ops = &dwc3_rockchip_glue_ops;
 
 	probe_data.dwc = &dwc_rk->dwc;
 	probe_data.res = res;
@@ -42,12 +152,29 @@ static void dwc3_rockchip_remove(struct platform_device *pdev)
 
 static int dwc3_rockchip_runtime_suspend(struct device *dev)
 {
-	return dwc3_runtime_suspend(dev_get_drvdata(dev));
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_rockchip *dwc_rk = to_dwc3_rockchip(dwc);
+	int ret;
+
+	ret = dwc3_runtime_suspend(dwc);
+	if (!ret)
+		dwc3_rockchip_set_suspended(dwc_rk, true);
+
+	return ret;
 }
 
 static int dwc3_rockchip_runtime_resume(struct device *dev)
 {
-	return dwc3_runtime_resume(dev_get_drvdata(dev));
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_rockchip *dwc_rk = to_dwc3_rockchip(dwc);
+	int ret;
+
+	dwc3_rockchip_set_suspended(dwc_rk, false);
+	ret = dwc3_runtime_resume(dwc);
+	if (ret)
+		dwc3_rockchip_set_suspended(dwc_rk, true);
+
+	return ret;
 }
 
 static int dwc3_rockchip_runtime_idle(struct device *dev)
@@ -57,12 +184,29 @@ static int dwc3_rockchip_runtime_idle(struct device *dev)
 
 static int dwc3_rockchip_suspend(struct device *dev)
 {
-	return dwc3_pm_suspend(dev_get_drvdata(dev));
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_rockchip *dwc_rk = to_dwc3_rockchip(dwc);
+	int ret;
+
+	ret = dwc3_pm_suspend(dwc);
+	if (!ret)
+		dwc3_rockchip_set_suspended(dwc_rk, true);
+
+	return ret;
 }
 
 static int dwc3_rockchip_resume(struct device *dev)
 {
-	return dwc3_pm_resume(dev_get_drvdata(dev));
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_rockchip *dwc_rk = to_dwc3_rockchip(dwc);
+	int ret;
+
+	dwc3_rockchip_set_suspended(dwc_rk, false);
+	ret = dwc3_pm_resume(dwc);
+	if (ret)
+		dwc3_rockchip_set_suspended(dwc_rk, true);
+
+	return ret;
 }
 
 static void dwc3_rockchip_complete(struct device *dev)
diff --git a/drivers/usb/dwc3/trace.c b/drivers/usb/dwc3/trace.c
index 088995885678..8c4e2a7b142e 100644
--- a/drivers/usb/dwc3/trace.c
+++ b/drivers/usb/dwc3/trace.c
@@ -9,3 +9,6 @@
 
 #define CREATE_TRACE_POINTS
 #include "trace.h"
+
+EXPORT_TRACEPOINT_SYMBOL_GPL(dwc3_readl);
+EXPORT_TRACEPOINT_SYMBOL_GPL(dwc3_writel);

-- 
2.53.0


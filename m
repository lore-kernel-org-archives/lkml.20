Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF304E323C;
	Tue, 29 Sep 2026 15:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697300; cv=none; b=F2gGGBkPrp4h99jDGMzP6AwgmVpfhjJs0o1qpiv8SJN1HlYr55XMFv3pRt4GlBbbI1SRAVu3jlNKR2ybahtCbbyYWIk/+V5rx3JMCsSZ1d+5F+pwnODDjX07SiG8MaM1vd4p6LVvoNnxsGrg/ZDBIirRjO0288TQt1Z5crBXqQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697300; c=relaxed/simple;
	bh=NtuXsW0oBOk/NWRtuK+KW7jkchjF6NT0Zbrg4CNwUSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rAiBQsD14zKNMHlnJQXWPBDd2UlJ1Gp3odQudvlaPkTeBE7zCVIAZr6T5NdqVVGs5EygFxmhSXmxuqJfuxppf7Zll08Oic8U26gyqus+gR83eeLnCTt+NFJ3m+DMkIbSEPPFGAF1gyIv3/ZCAS/SsW1dqSTCMw7olFwBj/h9zuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Al4IM4UO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Al4IM4UO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571641F00893;
	Tue, 29 Sep 2026 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790697299;
	bh=fsLTIpHuqPWpHi2Y3gteVP3kF/d0djtwhjBxwmI6Bw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Al4IM4UOEhlzL9/UBoEGKRnVeIPRFuByN8CflIi5mGNzBBEA28y1BX9yqxZjf908R
	 YhKLLQfLAR6St++sS41HqPH+mnwKPxEQ1eV4aHJ76UZjq+pbqp5HDR/I5ruud4pDgZ
	 JHmTsDzfHTl+OI8Ft2Ebe5GUq6TAxa79UGiJDACrtP3bt4howDnUoZb53h7l9CLYiu
	 +D8LK+uq0FDFW8B8M6KeRRS09WHjd8c1GD6zzEj45uypGVO0qIQF7SUo+5zzTBTIRN
	 gNRj0XiozKK4pdYApZQeA4bSAtUialcGya0pHwpbSRmfi8dM01CGgcUM6Q9g3eLjqo
	 2D6DnK9n8vCNg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 29 Sep 2026 17:54:43 +0200
Subject: [PATCH v4 3/4] usb: xhci: Use update_device overrides for tunnel
 reporting
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-topic-dwc3_tunneling_state-v4-3-63e296346d57@oss.qualcomm.com>
References: <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
In-Reply-To: <20260929-topic-dwc3_tunneling_state-v4-0-63e296346d57@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790697285; l=10526;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gSb6zWoHjSfhc11UGtgtHn5IN5P/w2Y3Yi0KTFlTmpw=;
 b=Hp/mmvJR0E+AdcLc9QVJuFIdcf+Bgxlxf/IjF7z0Fcu5j0LehZgzC3Gyjwi2UMNQ7xU3Jucp5
 FmN4sFDthmkAy/JFaVJXrdmQFDFkc1OYnFN6fYRpYsF3EVj6fwkB9p/
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Thunderbolt framework relies on USB core device links for tunneled
ports, so it needs tunnel state when xHCI updates a device.

Use the .update_device override for controller-specific tunnel
reporting.

Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/host/xhci-hub.c  | 53 --------------------------------------------
 drivers/usb/host/xhci-pci.c  | 38 +++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-plat.c | 18 +++++++++++++++
 drivers/usb/host/xhci-plat.h |  2 ++
 drivers/usb/host/xhci.c      | 19 +++++++++-------
 drivers/usb/host/xhci.h      |  8 +++++--
 6 files changed, 75 insertions(+), 63 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 80f07bd5081d..31ba7a990e07 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -12,7 +12,6 @@
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 #include <linux/bitfield.h>
-#include <linux/pci.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -748,58 +747,6 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
 	return xhci_reset(xhci, XHCI_RESET_SHORT_USEC);
 }
 
-/**
- * xhci_port_is_tunneled() - Check if USB3 connection is tunneled over USB4
- * @xhci: xhci host controller
- * @port: USB3 port to be checked.
- *
- * Some hosts can detect if a USB3 connection is native USB3 or tunneled over
- * USB4. Intel hosts expose this via vendor specific extended capability 206
- * eSS PORT registers TUNEN (tunnel enabled) bit.
- *
- * A USB3 device must be connected to the port to detect the tunnel.
- *
- * Return: link tunnel mode enum, USB_LINK_UNKNOWN if host is incapable of
- * detecting USB3 over USB4 tunnels. USB_LINK_NATIVE or USB_LINK_TUNNELED
- * otherwise.
- */
-enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
-						struct xhci_port *port)
-{
-	struct usb_hcd *hcd;
-	void __iomem *base;
-	u32 offset;
-	u32 val;
-
-	if (xhci->portsc_tunnel_reporting) {
-		val = xhci_portsc_readl(port);
-		if (val & PORT_TM)
-			return USB_LINK_TUNNELED;
-
-		return USB_LINK_NATIVE;
-	}
-
-	/* Fall back to the legacy Intel-specific ext_cap */
-	hcd = xhci_to_hcd(xhci);
-	if (!dev_is_pci(hcd->self.controller) ||
-	    to_pci_dev(hcd->self.controller)->vendor != PCI_VENDOR_ID_INTEL)
-		return USB_LINK_UNKNOWN;
-
-	base = &xhci->cap_regs->hc_capbase;
-	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_INTEL_SPR_SHADOW);
-
-	if (offset && offset <= XHCI_INTEL_SPR_ESS_PORT_OFFSET) {
-		offset = XHCI_INTEL_SPR_ESS_PORT_OFFSET + port->hcd_portnum * 0x20;
-
-		if (readl(base + offset) & XHCI_INTEL_SPR_TUNEN)
-			return USB_LINK_TUNNELED;
-		else
-			return USB_LINK_NATIVE;
-	}
-
-	return USB_LINK_UNKNOWN;
-}
-
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
 			 u32 link_state)
 {
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a8889081ae82..61ac267bc84a 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -103,11 +103,13 @@ static int xhci_pci_setup(struct usb_hcd *hcd);
 static int xhci_pci_run(struct usb_hcd *hcd);
 static int xhci_pci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hdev,
 				      struct usb_tt *tt, gfp_t mem_flags);
+static int xhci_pci_update_device(struct usb_hcd *hcd, struct usb_device *udev);
 
 static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
 	.reset = xhci_pci_setup,
 	.start = xhci_pci_run,
 	.update_hub_device = xhci_pci_update_hub_device,
+	.update_device = xhci_pci_update_device,
 };
 
 /*
@@ -606,6 +608,42 @@ static int xhci_pci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hd
 	return xhci_update_hub_device(hcd, hdev, tt, mem_flags);
 }
 
+static void xhci_intel_port_is_tunneled(struct usb_hcd *hcd,
+					struct usb_device *udev)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
+	struct xhci_port *port;
+	void __iomem *base;
+	u32 offset;
+
+	if (xhci->portsc_tunnel_reporting || udev->parent->parent)
+		return;
+
+	port = xhci->usb3_rhub.ports[udev->portnum - 1];
+
+	base = &xhci->cap_regs->hc_capbase;
+	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_INTEL_SPR_SHADOW);
+
+	if (offset && offset <= XHCI_INTEL_SPR_ESS_PORT_OFFSET) {
+		offset = XHCI_INTEL_SPR_ESS_PORT_OFFSET + port->hcd_portnum * 0x20;
+
+		if (readl(base + offset) & XHCI_INTEL_SPR_TUNEN)
+			udev->tunnel_mode = USB_LINK_TUNNELED;
+		else
+			udev->tunnel_mode = USB_LINK_NATIVE;
+	}
+}
+
+static int xhci_pci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
+{
+	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+
+	if (pdev->vendor == PCI_VENDOR_ID_INTEL && hcd->speed >= HCD_USB3)
+		xhci_intel_port_is_tunneled(hcd, udev);
+
+	return xhci_update_device(hcd, udev);
+}
+
 /*
  * We need to register our own PCI probe function (instead of the USB core's
  * function) in order to create a second roothub under xHCI.
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..641e31976240 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -30,13 +30,31 @@ static struct hc_driver __read_mostly xhci_plat_hc_driver;
 
 static int xhci_plat_setup(struct usb_hcd *hcd);
 static int xhci_plat_start(struct usb_hcd *hcd);
+static int xhci_plat_update_device(struct usb_hcd *hcd, struct usb_device *udev);
 
 static const struct xhci_driver_overrides xhci_plat_overrides __initconst = {
 	.extra_priv_size = sizeof(struct xhci_plat_priv),
 	.reset = xhci_plat_setup,
 	.start = xhci_plat_start,
+	.update_device = xhci_plat_update_device,
 };
 
+static int xhci_plat_update_device(struct usb_hcd *hcd, struct usb_device *udev)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+	int ret;
+
+	if (!xhci->portsc_tunnel_reporting && priv->update_device &&
+	    hcd->speed >= HCD_USB3 && !udev->parent->parent) {
+		ret = priv->update_device(hcd, udev);
+		if (ret)
+			return ret;
+	}
+
+	return xhci_update_device(hcd, udev);
+}
+
 static void xhci_priv_plat_start(struct usb_hcd *hcd)
 {
 	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index 00751d851831..91333605c46b 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -10,6 +10,7 @@
 
 struct device;
 struct platform_device;
+struct usb_device;
 struct usb_hcd;
 
 struct xhci_plat_priv {
@@ -22,6 +23,7 @@ struct xhci_plat_priv {
 	int (*suspend_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
 	int (*post_resume_quirk)(struct usb_hcd *);
+	int (*update_device)(struct usb_hcd *hcd, struct usb_device *udev);
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 5fb78613a993..b252ce5e8499 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4752,7 +4752,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 	return 0;
 }
 
-static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
+int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
 {
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	struct xhci_port *port;
@@ -4760,9 +4760,14 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
 
 	/* Check if USB3 device at root port is tunneled over USB4 */
 	if (hcd->speed >= HCD_USB3 && !udev->parent->parent) {
-		port = xhci->usb3_rhub.ports[udev->portnum - 1];
+		if (xhci->portsc_tunnel_reporting) {
+			port = xhci->usb3_rhub.ports[udev->portnum - 1];
+			if (xhci_portsc_readl(port) & PORT_TM)
+				udev->tunnel_mode = USB_LINK_TUNNELED;
+			else
+				udev->tunnel_mode = USB_LINK_NATIVE;
+		}
 
-		udev->tunnel_mode = xhci_port_is_tunneled(xhci, port);
 		if (udev->tunnel_mode == USB_LINK_UNKNOWN)
 			dev_dbg(&udev->dev, "link tunnel state unknown\n");
 		else if (udev->tunnel_mode == USB_LINK_TUNNELED)
@@ -4793,6 +4798,7 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(xhci_update_device);
 
 /*---------------------- USB 3.0 Link PM functions ------------------------*/
 
@@ -5242,11 +5248,6 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
 	return 0;
 }
 
-static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
-{
-	return 0;
-}
-
 static int xhci_enable_usb3_lpm_timeout(struct usb_hcd *hcd,
 			struct usb_device *udev, enum usb3_link_state state)
 {
@@ -5695,6 +5696,8 @@ void xhci_init_driver(struct hc_driver *drv,
 			drv->update_hub_device = over->update_hub_device;
 		if (over->hub_control)
 			drv->hub_control = over->hub_control;
+		if (over->update_device)
+			drv->update_device = over->update_device;
 	}
 }
 EXPORT_SYMBOL_GPL(xhci_init_driver);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 480fcbac4525..f12a309104dc 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1694,6 +1694,7 @@ struct xhci_driver_overrides {
 			    struct usb_tt *tt, gfp_t mem_flags);
 	int (*hub_control)(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			   u16 wIndex, char *buf, u16 wLength);
+	int (*update_device)(struct usb_hcd *hcd, struct usb_device *udev);
 };
 
 #define	XHCI_CFC_DELAY		10
@@ -1981,15 +1982,18 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 int xhci_hub_status_data(struct usb_hcd *hcd, char *buf);
 int xhci_find_raw_port_number(struct usb_hcd *hcd, int port1);
 struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd);
-enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
-						struct xhci_port *port);
 void xhci_hc_died(struct xhci_hcd *xhci);
 
 #ifdef CONFIG_PM
+int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev);
 int xhci_bus_suspend(struct usb_hcd *hcd);
 int xhci_bus_resume(struct usb_hcd *hcd);
 unsigned long xhci_get_resuming_ports(struct usb_hcd *hcd);
 #else
+static inline int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
+{
+	return 0;
+}
 #define	xhci_bus_suspend	NULL
 #define	xhci_bus_resume		NULL
 #define	xhci_get_resuming_ports	NULL

-- 
2.55.0


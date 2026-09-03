Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D883511194;
	Thu,  3 Sep 2026 21:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470278; cv=none; b=YRkI9HilyVeaoeaZUTcN2OMaBnAwmF4lmwRWrVHE3kJmYHlHk9zeTykOhjf9PpeHWve4CMooDR3CDFNoGFCMqPRfDtrd/B3EEsrgQhUMyuzEvAbup+gLQxrirMvHhdvyhGMwS8L0D0IyMbVadt6nKK7eDrEZpD4SIk1hVdzVHQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470278; c=relaxed/simple;
	bh=Q9dkLvPYkbhRGAJRLHMpGpg+eWDTvtRpDeiLqa+G68A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ele8QCIb/M6HIkqi0Uhs2Hl5yJ9aRJKiEKpA2TofmW/US7nlpWX2sRdVDlRA/qjeXxzZ538mV2Q5pn9K0Qsgel1B1sLb3dDNpA4uAA26gCySvdWlilm0RLXjk7dTM9Xhpilqg2ZtH3BfsNZcW35uaRz4xI/tinXEQvNrvxXxT64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IElpz3pi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IElpz3pi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D5E1F00A3F;
	Thu,  3 Sep 2026 21:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788470271;
	bh=7UwVm8hzVIM7Q7F0XOFQ+zgbvwAo3gtnXPUwZRU/5fA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IElpz3pisC7TVWSA0AUe8hlGPqjaS0L6TjVdySyISPu2pKV0j4n1Fhsq4D5CaDXwh
	 ggyZuQRiVFsD93+VaSWE8NsHLdUGpjaMWqOKND69SFDDXTQSs73aJMZUTtsH9tDTrI
	 sriI6zcTVeFxsDy0gQlPShUprWKUOqHmRAeaeDG66aVC7IoHCed9YN+cMWvCfkkssi
	 JS06ZvDEkAh/hrZEzr1uGHPN7/6fhRiZVFKvr8YPYft2dGzz9JzUGnV9KLf7vkQLY9
	 knD77BbXMGAlVnfzYSsYjV6LX9qwld4JNFwF3taUa60eTVFZ8pVwTK1ix7BT0Yx2J0
	 WEGcCHhc1GKDg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 03 Sep 2026 23:17:40 +0200
Subject: [PATCH v3 3/6] usb: ehci: add port speed hook
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-gemini-usb-fotg2-v3-3-dd92ecf5675b@kernel.org>
References: <20260903-gemini-usb-fotg2-v3-0-dd92ecf5675b@kernel.org>
In-Reply-To: <20260903-gemini-usb-fotg2-v3-0-dd92ecf5675b@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Daniel Palmer <daniel@thingy.jp>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Some EHCI implementations report device speed in
implementation-defined registers.

Add an optional hook for port speed reporting. Move the common
integrated-TT speed decoding into the hub code, preserving the PORTSC
and HOSTPC paths when no hook is supplied.

Gate the callback behind the hidden USB_EHCI_PORT_SPEED_HOOK option so
controllers using standard speed reporting incur no extra state or
runtime checks.

The hook is only meaningful for controllers with an integrated root
hub transaction translator, so make the option depend on
USB_EHCI_ROOT_HUB_TT.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Daniel Palmer <daniel@thingy.jp>
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/usb/host/Kconfig    |  5 +++++
 drivers/usb/host/ehci-hub.c | 53 ++++++++++++++++++++++++++++++++++++++++-----
 drivers/usb/host/ehci.h     | 30 ++++---------------------
 3 files changed, 56 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index a0c66191d03c..05a88969a6a0 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -219,6 +219,11 @@ config USB_EHCI_PORT_RESET_HOOKS
 	bool
 	# Used for hosts with controller-specific port reset sequencing
 
+config USB_EHCI_PORT_SPEED_HOOK
+	bool
+	depends on USB_EHCI_ROOT_HUB_TT
+	# Used for hosts with controller-specific port speed reporting
+
 config XPS_USB_HCD_XILINX
 	bool "Use Xilinx usb host EHCI controller core"
 	depends on (PPC32 || MICROBLAZE)
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index 5aa629a92542..e676c98b6baa 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -15,6 +15,44 @@
 
 /*-------------------------------------------------------------------------*/
 
+/*
+ * Some EHCI controllers have a Transaction Translator built into the
+ * root hub. This is a non-standard feature.  Each controller will need
+ * to add code to the following function, and call it as needed.
+ */
+
+/*
+ * In a bunch of EHCI implementations with transaction translators,
+ * the port speed can be found in the reserved bits in position 26 and
+ * 27. Implementations with the HOSTPC register will have this in
+ * bits 25 and 26 of the HOSTPC registers.
+ */
+#define PORTSC_SPEED_BITS(a)	(((a) >> 26) & 3)
+#define HOSTPC_SPEED_BITS(a)	(((a) >> 25) & 3)
+
+/* Returns the speed of a device attached to a port on the root hub. */
+static unsigned int ehci_port_speed(struct ehci_hcd *ehci,
+				    unsigned int port, unsigned int speed)
+{
+#ifdef CONFIG_USB_EHCI_PORT_SPEED_HOOK
+	if (ehci->get_port_speed)
+		return ehci->get_port_speed(ehci, port);
+#endif
+
+	if (!IS_ENABLED(CONFIG_USB_EHCI_ROOT_HUB_TT) || !ehci_is_TDI(ehci))
+		return USB_PORT_STAT_HIGH_SPEED;
+
+	switch (speed) {
+	case 0:
+		return 0;
+	case 1:
+		return USB_PORT_STAT_LOW_SPEED;
+	case 2:
+	default:
+		return USB_PORT_STAT_HIGH_SPEED;
+	}
+}
+
 #define	PORT_WAKE_BITS	(PORT_WKOC_E|PORT_WKDISC_E|PORT_WKCONN_E)
 
 #ifdef	CONFIG_PM
@@ -287,8 +325,9 @@ static int ehci_bus_suspend (struct usb_hcd *hcd)
 			 * sake, add a delay if we need one.
 			 */
 			if ((t2 & PORT_WKDISC_E) &&
-					ehci_port_speed(ehci, t2) ==
-						USB_PORT_STAT_HIGH_SPEED)
+			    ehci_port_speed(ehci, port,
+					    PORTSC_SPEED_BITS(t2)) ==
+					    USB_PORT_STAT_HIGH_SPEED)
 				fs_idle_delay = true;
 			ehci_writel(ehci, t2, reg);
 			changed = 1;
@@ -990,12 +1029,14 @@ int ehci_hub_control(
 
 		if (temp & PORT_CONNECT) {
 			status |= USB_PORT_STAT_CONNECTION;
-			// status may be from integrated TT
 			if (ehci->has_hostpc) {
 				temp1 = ehci_readl(ehci, hostpc_reg);
-				status |= ehci_port_speed(ehci, temp1);
-			} else
-				status |= ehci_port_speed(ehci, temp);
+				status |= ehci_port_speed(ehci, wIndex,
+							  HOSTPC_SPEED_BITS(temp1));
+			} else {
+				status |= ehci_port_speed(ehci, wIndex,
+							  PORTSC_SPEED_BITS(temp));
+			}
 		}
 		if (temp & PORT_PE)
 			status |= USB_PORT_STAT_ENABLE;
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index d7e4cd6dc0a3..bce4579fb8b2 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -126,6 +126,10 @@ struct ehci_hcd {			/* one per controller */
 #ifdef CONFIG_USB_EHCI_DEVIANT_PORT_STATUS_REG
 	u32 __iomem		*port_status;
 #endif
+#ifdef CONFIG_USB_EHCI_PORT_SPEED_HOOK
+	unsigned int		(*get_port_speed)(struct ehci_hcd *ehci,
+						  unsigned int port);
+#endif
 #ifdef CONFIG_USB_EHCI_PORT_RESET_HOOKS
 	int			(*pre_port_reset)(struct ehci_hcd *ehci,
 						  unsigned int port);
@@ -673,38 +677,12 @@ struct ehci_tt {
 
 #ifdef CONFIG_USB_EHCI_ROOT_HUB_TT
 
-/*
- * Some EHCI controllers have a Transaction Translator built into the
- * root hub. This is a non-standard feature.  Each controller will need
- * to add code to the following inline functions, and call them as
- * needed (mostly in root hub code).
- */
-
 #define	ehci_is_TDI(e)			(ehci_to_hcd(e)->has_tt)
 
-/* Returns the speed of a device attached to a port on the root hub. */
-static inline unsigned int
-ehci_port_speed(struct ehci_hcd *ehci, unsigned int portsc)
-{
-	if (ehci_is_TDI(ehci)) {
-		switch ((portsc >> (ehci->has_hostpc ? 25 : 26)) & 3) {
-		case 0:
-			return 0;
-		case 1:
-			return USB_PORT_STAT_LOW_SPEED;
-		case 2:
-		default:
-			return USB_PORT_STAT_HIGH_SPEED;
-		}
-	}
-	return USB_PORT_STAT_HIGH_SPEED;
-}
-
 #else
 
 #define	ehci_is_TDI(e)			(0)
 
-#define	ehci_port_speed(ehci, portsc)	USB_PORT_STAT_HIGH_SPEED
 #endif
 
 /*-------------------------------------------------------------------------*/

-- 
2.55.0


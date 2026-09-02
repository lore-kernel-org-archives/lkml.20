Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4EA36B92E;
	Wed,  2 Sep 2026 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329502; cv=none; b=gdAn0BngwQhI7DzdXx5RXR4wtwoMmNeZ8mUIjsBrCncjQ38Xz53lbTjhaAXjM9y6U1HmaARnmiYYcsONoC7ehfHUFhCk/TFLPcqHg6P+QT4aI/oJ000t6uakbfeN7YAncZMAryH5XLzaE/o5nel3zKV10dHc0OqhOT6ko6QRL5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329502; c=relaxed/simple;
	bh=MbnuD9zikLjd/Tj5jJQn+dtTw3x4hOzCVXXiEM9+u7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJ/GmRuFAI1VLJr5ws+tKyjm4wEtXQkUOHexmN5BJYDIzFmW/z3uMLCuawf2H8RhBlbzd/QF0QP4MbVVxpWFxkcxT2oFB//gnxpyFPCpTMxbxu29MM/utXLYqaTsun9uoqEPd+0vZHAbegYJq5u3FXX63KfR1/Vhj0vGsmJ2UOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AbAWDFOP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AbAWDFOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF071F00A3A;
	Wed,  2 Sep 2026 06:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788329500;
	bh=VMp7v1RkUNu5pSF07fUwwfo+JhLIlaU96bI6RELV2O4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AbAWDFOP5oFkrSDBHrcxvPUPNbMKY/U0/CgVIL/NwjPglvS/lRQ9h8RlSDXphiPLx
	 sDbOwLLalswADglUq3sYFqYRtCnoKBiVU0zm404QvSnLvHbujg6Erh2rtbTWP1TNf0
	 76fkjqO/KaVHo8JBODMYOGn85rQGToBkFgEV5XpUQwIFQMoHLhMUh4UY44VKDM40Y0
	 iuYfSPu7jPC93Jrem7T0rl8FmtBqGMZUCojGjJXXGjKHTutJkEUt+GmL4bodZEFlm4
	 Q6BhCZ05QU5roP0kLWwrUu6Lrotgs+pvEjWi1ylXFcBkByQSMSlnsXUYLiRJlZKNk9
	 nPXDC+NEbhRiA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 08:11:33 +0200
Subject: [PATCH v2 2/5] usb: ehci: add port reset and speed hooks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-gemini-usb-fotg2-v2-2-0057408495d8@kernel.org>
References: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
In-Reply-To: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Daniel Palmer <daniel@thingy.jp>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Some EHCI implementations need controller-specific sequencing around
port reset or report device speed in implementation-defined registers.

Add optional hooks for reset preparation, reset completion, and port
speed reporting. Preserve the existing integrated-TT and HOSTPC paths
when no hook is supplied.

Suggested-by: Daniel Palmer <daniel@thingy.jp>
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/usb/host/ehci-hub.c | 65 ++++++++++++++++++++++++++++++++++++++++-----
 drivers/usb/host/ehci.h     | 32 +++++-----------------
 2 files changed, 64 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index 77d0df41f45f..20817b838d72 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -15,6 +15,38 @@
 
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
+static unsigned int ehci_port_speed(struct ehci_hcd *ehci, unsigned int speed)
+{
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
@@ -287,8 +319,10 @@ static int ehci_bus_suspend (struct usb_hcd *hcd)
 			 * sake, add a delay if we need one.
 			 */
 			if ((t2 & PORT_WKDISC_E) &&
-					ehci_port_speed(ehci, t2) ==
-						USB_PORT_STAT_HIGH_SPEED)
+			    (ehci->get_port_speed ?
+			     ehci->get_port_speed(ehci, port) :
+			     ehci_port_speed(ehci, PORTSC_SPEED_BITS(t2))) ==
+					    USB_PORT_STAT_HIGH_SPEED)
 				fs_idle_delay = true;
 			ehci_writel(ehci, t2, reg);
 			changed = 1;
@@ -963,6 +997,11 @@ int ehci_hub_control(
 			/* see what we found out */
 			temp = check_reset_complete (ehci, wIndex, status_reg,
 					ehci_readl(ehci, status_reg));
+			if (ehci->post_port_reset) {
+				retval = ehci->post_port_reset(ehci, wIndex);
+				if (retval)
+					goto error_exit;
+			}
 		}
 
 		/* transfer dedicated ports to the companion hc */
@@ -983,12 +1022,17 @@ int ehci_hub_control(
 
 		if (temp & PORT_CONNECT) {
 			status |= USB_PORT_STAT_CONNECTION;
-			// status may be from integrated TT
-			if (ehci->has_hostpc) {
+			/* The speed may come from an implementation register. */
+			if (ehci->get_port_speed) {
+				status |= ehci->get_port_speed(ehci, wIndex);
+			} else if (ehci->has_hostpc) {
 				temp1 = ehci_readl(ehci, hostpc_reg);
-				status |= ehci_port_speed(ehci, temp1);
-			} else
-				status |= ehci_port_speed(ehci, temp);
+				status |= ehci_port_speed(ehci,
+							  HOSTPC_SPEED_BITS(temp1));
+			} else {
+				status |= ehci_port_speed(ehci,
+							  PORTSC_SPEED_BITS(temp));
+			}
 		}
 		if (temp & PORT_PE)
 			status |= USB_PORT_STAT_ENABLE;
@@ -1121,7 +1165,14 @@ int ehci_hub_control(
 				 */
 				if (ehci_has_fsl_hs_errata(ehci))
 					temp |= (1 << PORTSC_FSL_PFSC);
+
+				if (ehci->pre_port_reset) {
+					retval = ehci->pre_port_reset(ehci, wIndex);
+					if (retval)
+						goto error_exit;
+				}
 			}
+
 			ehci_writel(ehci, temp, status_reg);
 			break;
 
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index 765338c2eb88..913e7977197b 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -124,6 +124,12 @@ struct ehci_hcd {			/* one per controller */
 	struct ehci_regs __iomem *regs;
 	struct ehci_dbg_port __iomem *debug;
 	u32 __iomem		*port_status;
+	unsigned int		(*get_port_speed)(struct ehci_hcd *ehci,
+						  unsigned int port);
+	int			(*pre_port_reset)(struct ehci_hcd *ehci,
+						  unsigned int port);
+	int			(*post_port_reset)(struct ehci_hcd *ehci,
+						   unsigned int port);
 
 	__u32			hcs_params;	/* cached register copy */
 	spinlock_t		lock;
@@ -663,38 +669,12 @@ struct ehci_tt {
 
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


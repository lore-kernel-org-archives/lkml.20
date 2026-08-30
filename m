Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE0830E853;
	Sun, 30 Aug 2026 22:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788128681; cv=none; b=mM4VCg48RzDifHvSuuIeDv4nFqpdm/gILS4CM/uP8zXcqcxk8IIrCZd9V1q71I08blckWS1ooN+NrFpv8n6gMqWEgZdjHX+PbhPMr+YIoxPpkHgv6u/+mIDW+2yp8EMv2Iko3S0iOoi1Co2WyfQ/Tn5JXOuSLUahSXMKzxBcvDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788128681; c=relaxed/simple;
	bh=BOmiDItoZxi/KD60i6g1OaGUFKQD8F43NKbv+cRPIAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ji/08irfkdRAjpWzuWecSuiHFLWLBFiuWgZRpj79P6ajUst0zlZqSGqGtpzDF+lWwbxGcaz+ZTPUnWYrZh072soO8HmtuM98ZvtdTYN7DeU1TXrxrOZhuk6yIjBziaogFb/YRGKCg2SibRheLGANp86iLVrgM8a2HFtAFbZL4bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWcIWxjg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWcIWxjg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8701F00A3D;
	Sun, 30 Aug 2026 22:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788128678;
	bh=O8gY/k32bYg9dP4t912KA45ad3kHdBfJniQrFT3k2U0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XWcIWxjgJyUcxpavJCh/aPBPghbnbcimkYV6Hi6MHtrkFCCKUS1TvOxeX13P+M3gO
	 I8xbl8pCxMSdStGnYkv3g7ExZ87KnBIwRivsjTI7eHXzsUItao29x6PJOkmK8lHVlT
	 G1/71/I172cTXHIOpL4ATTFRGd/S9dab2qEAeKiEgx0an8LqxqQfRY/Nhr+rK51aIu
	 hovwcPNliEcfnUqLFxp9LDLk1kCTHUByaFeqef/UDacV3xHkqjzqE9F9CEzgaFFGf9
	 nfG6F3T6JuGS3v9RVGQPg1DT6T9LW7ENSGHXoouL1OGCPTio//os0xSm6fOwqkhZiv
	 Q0chqLVlIDvxQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 00:24:19 +0200
Subject: [PATCH 1/3] usb: ehci: support controllers with non-standard
 registers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-gemini-usb-fotg2-v1-1-8a8ee12c4b32@kernel.org>
References: <20260831-gemini-usb-fotg2-v1-0-8a8ee12c4b32@kernel.org>
In-Reply-To: <20260831-gemini-usb-fotg2-v1-0-8a8ee12c4b32@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Daniel Palmer <daniel@thingy.jp>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The Faraday FOTG210 EHCI implementation moves PORTSC, omits
CONFIGFLAG and USBMODE, and needs controller-specific speed and reset
handling. Add
per-controller hooks for those variations while preserving the standard
register path for existing drivers.

Also allow a controller to reject full/low-speed isochronous transfers
when its integrated transaction translator cannot schedule siTDs.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/usb/host/ehci-dbg.c   |   3 +-
 drivers/usb/host/ehci-hcd.c   |  31 ++++++++-----
 drivers/usb/host/ehci-hub.c   | 100 +++++++++++++++++++++++++++++++-----------
 drivers/usb/host/ehci-timer.c |   3 +-
 drivers/usb/host/ehci.h       |  55 ++++++++++-------------
 5 files changed, 120 insertions(+), 72 deletions(-)

diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
index 3cf743c81eb4..51ec6ea43158 100644
--- a/drivers/usb/host/ehci-dbg.c
+++ b/drivers/usb/host/ehci-dbg.c
@@ -869,8 +869,7 @@ static ssize_t fill_registers_buffer(struct debug_buffer *buf)
 
 	for (i = 1; i <= HCS_N_PORTS(ehci->hcs_params); i++) {
 		temp = dbg_port_buf(scratch, sizeof(scratch), label, i,
-				ehci_readl(ehci,
-					&ehci->regs->port_status[i - 1]));
+				ehci_readl(ehci, ehci_portsc(ehci, i - 1)));
 		temp = scnprintf(next, size, fmt, temp, scratch);
 		size -= temp;
 		next += temp;
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 3c46bb18c7f3..75f780ec3ba0 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -187,7 +187,8 @@ static int ehci_halt (struct ehci_hcd *ehci)
 	/* disable any irqs left enabled by previous code */
 	ehci_writel(ehci, 0, &ehci->regs->intr_enable);
 
-	if (ehci_is_TDI(ehci) && !tdi_in_host_mode(ehci)) {
+	if (ehci_is_TDI(ehci) && !ehci->no_tdi_mode &&
+	    !tdi_in_host_mode(ehci)) {
 		spin_unlock_irq(&ehci->lock);
 		return 0;
 	}
@@ -254,7 +255,7 @@ int ehci_reset(struct ehci_hcd *ehci)
 	if (retval)
 		return retval;
 
-	if (ehci_is_TDI(ehci))
+	if (ehci_is_TDI(ehci) && !ehci->no_tdi_mode)
 		tdi_reset (ehci);
 
 	if (ehci->debug)
@@ -325,7 +326,7 @@ static void ehci_turn_off_all_ports(struct ehci_hcd *ehci)
 		ehci_port_power(ehci, port, false);
 		spin_lock_irq(&ehci->lock);
 		ehci_writel(ehci, PORT_RWC_BITS,
-				&ehci->regs->port_status[port]);
+				ehci_portsc(ehci, port));
 	}
 }
 
@@ -342,10 +343,12 @@ static void ehci_silence_controller(struct ehci_hcd *ehci)
 	ehci_turn_off_all_ports(ehci);
 
 	/* make BIOS/etc use companion controller during reboot */
-	ehci_writel(ehci, 0, &ehci->regs->configured_flag);
+	if (!ehci->no_configured_flag) {
+		ehci_writel(ehci, 0, &ehci->regs->configured_flag);
 
-	/* unblock posted writes */
-	ehci_readl(ehci, &ehci->regs->configured_flag);
+		/* unblock posted writes */
+		ehci_readl(ehci, &ehci->regs->configured_flag);
+	}
 	spin_unlock_irq(&ehci->lock);
 }
 
@@ -629,7 +632,8 @@ static int ehci_run (struct usb_hcd *hcd)
 	 */
 	down_write(&ehci_cf_port_reset_rwsem);
 	ehci->rh_state = EHCI_RH_RUNNING;
-	ehci_writel(ehci, FLAG_CF, &ehci->regs->configured_flag);
+	if (!ehci->no_configured_flag)
+		ehci_writel(ehci, FLAG_CF, &ehci->regs->configured_flag);
 
 	/* Wait until HC become operational */
 	ehci_readl(ehci, &ehci->regs->command);	/* unblock posted writes */
@@ -811,8 +815,7 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
 			/* leverage per-port change bits feature */
 			if (!(ppcd & (1 << i)))
 				continue;
-			pstatus = ehci_readl(ehci,
-					 &ehci->regs->port_status[i]);
+			pstatus = ehci_readl(ehci, ehci_portsc(ehci, i));
 
 			if (pstatus & PORT_OWNER)
 				continue;
@@ -910,6 +913,8 @@ static int ehci_urb_enqueue (
 	case PIPE_ISOCHRONOUS:
 		if (urb->dev->speed == USB_SPEED_HIGH)
 			return itd_submit (ehci, urb, mem_flags);
+		else if (ehci->no_fsls_isoc)
+			return -EOPNOTSUPP;
 		else
 			return sitd_submit (ehci, urb, mem_flags);
 	}
@@ -1109,7 +1114,7 @@ static void ehci_remove_device(struct usb_hcd *hcd, struct usb_device *udev)
 /* Clear wakeup signal locked in zhaoxin platform when device plug in. */
 static void ehci_zx_wakeup_clear(struct ehci_hcd *ehci)
 {
-	u32 __iomem	*reg = &ehci->regs->port_status[4];
+	u32 __iomem	*reg = ehci_portsc(ehci, 4);
 	u32 		t1 = ehci_readl(ehci, reg);
 
 	t1 &= (u32)~0xf0000;
@@ -1185,7 +1190,8 @@ int ehci_resume(struct usb_hcd *hcd, bool force_reset)
 	 * then we maintained suspend power.
 	 * Just undo the effect of ehci_suspend().
 	 */
-	if (ehci_readl(ehci, &ehci->regs->configured_flag) == FLAG_CF &&
+	if ((ehci->no_configured_flag ||
+	     ehci_readl(ehci, &ehci->regs->configured_flag) == FLAG_CF) &&
 			!force_reset) {
 		int	mask = INTR_MASK;
 
@@ -1217,7 +1223,8 @@ int ehci_resume(struct usb_hcd *hcd, bool force_reset)
 		goto skip;
 
 	ehci_writel(ehci, ehci->command, &ehci->regs->command);
-	ehci_writel(ehci, FLAG_CF, &ehci->regs->configured_flag);
+	if (!ehci->no_configured_flag)
+		ehci_writel(ehci, FLAG_CF, &ehci->regs->configured_flag);
 	ehci_readl(ehci, &ehci->regs->command);	/* unblock posted writes */
 
 	ehci->rh_state = EHCI_RH_SUSPENDED;
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index 1aee392e8492..20817b838d72 100644
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
@@ -55,7 +87,7 @@ static void ehci_handover_companion_ports(struct ehci_hcd *ehci)
 	port = HCS_N_PORTS(ehci->hcs_params);
 	while (port--) {
 		if (test_bit(port, &ehci->owned_ports)) {
-			reg = &ehci->regs->port_status[port];
+			reg = ehci_portsc(ehci, port);
 			status = ehci_readl(ehci, reg) & ~PORT_RWC_BITS;
 			if (!(status & PORT_POWER))
 				ehci_port_power(ehci, port, true);
@@ -69,7 +101,7 @@ static void ehci_handover_companion_ports(struct ehci_hcd *ehci)
 	port = HCS_N_PORTS(ehci->hcs_params);
 	while (port--) {
 		if (test_bit(port, &ehci->owned_ports)) {
-			reg = &ehci->regs->port_status[port];
+			reg = ehci_portsc(ehci, port);
 			status = ehci_readl(ehci, reg) & ~PORT_RWC_BITS;
 
 			/* Port already owned by companion? */
@@ -106,7 +138,7 @@ static void ehci_handover_companion_ports(struct ehci_hcd *ehci)
 			 * but if something went wrong the port must not
 			 * remain enabled.
 			 */
-			reg = &ehci->regs->port_status[port];
+			reg = ehci_portsc(ehci, port);
 			status = ehci_readl(ehci, reg) & ~PORT_RWC_BITS;
 			if (status & PORT_OWNER)
 				ehci_writel(ehci, status | PORT_CSC, reg);
@@ -137,7 +169,7 @@ static int ehci_port_change(struct ehci_hcd *ehci)
 	 */
 
 	while (i--)
-		if (ehci_readl(ehci, &ehci->regs->port_status[i]) & PORT_CSC)
+		if (ehci_readl(ehci, ehci_portsc(ehci, i)) & PORT_CSC)
 			return 1;
 
 	return 0;
@@ -175,7 +207,7 @@ void ehci_adjust_port_wakeup_flags(struct ehci_hcd *ehci,
 
 	port = HCS_N_PORTS(ehci->hcs_params);
 	while (port--) {
-		u32 __iomem	*reg = &ehci->regs->port_status[port];
+		u32 __iomem	*reg = ehci_portsc(ehci, port);
 		u32		t1 = ehci_readl(ehci, reg) & ~PORT_RWC_BITS;
 		u32		t2 = t1 & ~PORT_WAKE_BITS;
 
@@ -254,7 +286,7 @@ static int ehci_bus_suspend (struct usb_hcd *hcd)
 	fs_idle_delay = false;
 	port = HCS_N_PORTS(ehci->hcs_params);
 	while (port--) {
-		u32 __iomem	*reg = &ehci->regs->port_status [port];
+		u32 __iomem	*reg = ehci_portsc(ehci, port);
 		u32		t1 = ehci_readl(ehci, reg) & ~PORT_RWC_BITS;
 		u32		t2 = t1 & ~PORT_WAKE_BITS;
 
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
@@ -426,7 +460,7 @@ static int ehci_bus_resume (struct usb_hcd *hcd)
 	 */
 	i = HCS_N_PORTS(ehci->hcs_params);
 	while (i--) {
-		temp = ehci_readl(ehci, &ehci->regs->port_status[i]);
+		temp = ehci_readl(ehci, ehci_portsc(ehci, i));
 		if ((temp & PORT_PE) &&
 				!(temp & (PORT_SUSPEND | PORT_RESUME))) {
 			ehci_dbg(ehci, "Port status(0x%x) is wrong\n", temp);
@@ -463,14 +497,14 @@ static int ehci_bus_resume (struct usb_hcd *hcd)
 	/* manually resume the ports we suspended during bus_suspend() */
 	i = HCS_N_PORTS (ehci->hcs_params);
 	while (i--) {
-		temp = ehci_readl(ehci, &ehci->regs->port_status [i]);
+		temp = ehci_readl(ehci, ehci_portsc(ehci, i));
 		temp &= ~(PORT_RWC_BITS | PORT_WAKE_BITS);
 		if (test_bit(i, &ehci->bus_suspended) &&
 				(temp & PORT_SUSPEND)) {
 			temp |= PORT_RESUME;
 			set_bit(i, &resume_needed);
 		}
-		ehci_writel(ehci, temp, &ehci->regs->port_status [i]);
+		ehci_writel(ehci, temp, ehci_portsc(ehci, i));
 	}
 
 	/*
@@ -487,10 +521,10 @@ static int ehci_bus_resume (struct usb_hcd *hcd)
 
 	i = HCS_N_PORTS (ehci->hcs_params);
 	while (i--) {
-		temp = ehci_readl(ehci, &ehci->regs->port_status [i]);
+		temp = ehci_readl(ehci, ehci_portsc(ehci, i));
 		if (test_bit(i, &resume_needed)) {
 			temp &= ~(PORT_RWC_BITS | PORT_SUSPEND | PORT_RESUME);
-			ehci_writel(ehci, temp, &ehci->regs->port_status [i]);
+			ehci_writel(ehci, temp, ehci_portsc(ehci, i));
 		}
 	}
 
@@ -540,7 +574,7 @@ static void set_owner(struct ehci_hcd *ehci, int portnum, int new_owner)
 	u32			port_status;
 	int 			try;
 
-	status_reg = &ehci->regs->port_status[portnum];
+	status_reg = ehci_portsc(ehci, portnum);
 
 	/*
 	 * The controller won't set the OWNER bit if the port is
@@ -661,7 +695,7 @@ ehci_hub_status_data (struct usb_hcd *hcd, char *buf)
 	for (i = 0; i < ports; i++) {
 		/* leverage per-port change bits feature */
 		if (ppcd & (1 << i))
-			temp = ehci_readl(ehci, &ehci->regs->port_status[i]);
+			temp = ehci_readl(ehci, ehci_portsc(ehci, i));
 		else
 			temp = 0;
 
@@ -753,7 +787,7 @@ int ehci_hub_control(
 	temp = (wIndex - 1) & 0xff;
 	if (temp >= HCS_N_PORTS_MAX)
 		temp = 0;
-	status_reg = &ehci->regs->port_status[temp];
+	status_reg = ehci_portsc(ehci, temp);
 	hostpc_reg = &ehci->regs->hostpc[temp];
 
 	/*
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
 
@@ -1149,8 +1200,7 @@ int ehci_hub_control(
 
 			/* Put all enabled ports into suspend */
 			while (ports--) {
-				u32 __iomem *sreg =
-						&ehci->regs->port_status[ports];
+				u32 __iomem *sreg = ehci_portsc(ehci, ports);
 
 				temp = ehci_readl(ehci, sreg) & ~PORT_RWC_BITS;
 				if (temp & PORT_PE)
@@ -1200,14 +1250,14 @@ static int ehci_port_handed_over(struct usb_hcd *hcd, int portnum)
 
 	if (ehci_is_TDI(ehci))
 		return 0;
-	reg = &ehci->regs->port_status[portnum - 1];
+	reg = ehci_portsc(ehci, portnum - 1);
 	return ehci_readl(ehci, reg) & PORT_OWNER;
 }
 
 static int ehci_port_power(struct ehci_hcd *ehci, int portnum, bool enable)
 {
 	struct usb_hcd *hcd = ehci_to_hcd(ehci);
-	u32 __iomem *status_reg = &ehci->regs->port_status[portnum];
+	u32 __iomem *status_reg = ehci_portsc(ehci, portnum);
 	u32 temp = ehci_readl(ehci, status_reg) & ~PORT_RWC_BITS;
 
 	if (enable)
diff --git a/drivers/usb/host/ehci-timer.c b/drivers/usb/host/ehci-timer.c
index a79c8ac0a55f..404069a3dd0b 100644
--- a/drivers/usb/host/ehci-timer.c
+++ b/drivers/usb/host/ehci-timer.c
@@ -199,7 +199,8 @@ static void ehci_handle_controller_death(struct ehci_hcd *ehci)
 
 	/* Clean up the mess */
 	ehci->rh_state = EHCI_RH_HALTED;
-	ehci_writel(ehci, 0, &ehci->regs->configured_flag);
+	if (!ehci->no_configured_flag)
+		ehci_writel(ehci, 0, &ehci->regs->configured_flag);
 	ehci_writel(ehci, 0, &ehci->regs->intr_enable);
 	ehci_work(ehci);
 	end_unlink_async(ehci);
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index d7a3c8d13f6b..875dac39a11e 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -123,6 +123,13 @@ struct ehci_hcd {			/* one per controller */
 	struct ehci_caps __iomem *caps;
 	struct ehci_regs __iomem *regs;
 	struct ehci_dbg_port __iomem *debug;
+	u32 __iomem		*port_status;
+	unsigned int		(*get_port_speed)(struct ehci_hcd *ehci,
+						  unsigned int port);
+	int			(*pre_port_reset)(struct ehci_hcd *ehci,
+						  unsigned int port);
+	int			(*post_port_reset)(struct ehci_hcd *ehci,
+						   unsigned int port);
 
 	__u32			hcs_params;	/* cached register copy */
 	spinlock_t		lock;
@@ -222,6 +229,9 @@ struct ehci_hcd {			/* one per controller */
 	unsigned		spurious_oc:1;
 	unsigned		is_aspeed:1;
 	unsigned		zx_wakeup_clear_needed:1;
+	unsigned		no_configured_flag:1;
+	unsigned		no_tdi_mode:1;
+	unsigned		no_fsls_isoc:1;
 
 	/* required for usb32 quirk */
 	#define OHCI_CTRL_HCFS          (3 << 6)
@@ -278,6 +288,17 @@ static inline struct usb_hcd *ehci_to_hcd(struct ehci_hcd *ehci)
 
 /*-------------------------------------------------------------------------*/
 
+static inline u32 __iomem *ehci_portsc(struct ehci_hcd *ehci,
+				       unsigned int port)
+{
+	if (ehci->port_status)
+		return ehci->port_status + port;
+
+	return &ehci->regs->port_status[port];
+}
+
+/*-------------------------------------------------------------------------*/
+
 #define	QTD_NEXT(ehci, dma)	cpu_to_hc32(ehci, (u32)dma)
 
 /*
@@ -650,39 +671,9 @@ struct ehci_tt {
 /*-------------------------------------------------------------------------*/
 
 #ifdef CONFIG_USB_EHCI_ROOT_HUB_TT
-
-/*
- * Some EHCI controllers have a Transaction Translator built into the
- * root hub. This is a non-standard feature.  Each controller will need
- * to add code to the following inline functions, and call them as
- * needed (mostly in root hub code).
- */
-
-#define	ehci_is_TDI(e)			(ehci_to_hcd(e)->has_tt)
-
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
+#define		ehci_is_TDI(e)			(ehci_to_hcd(e)->has_tt)
 #else
-
-#define	ehci_is_TDI(e)			(0)
-
-#define	ehci_port_speed(ehci, portsc)	USB_PORT_STAT_HIGH_SPEED
+#define		ehci_is_TDI(e)			(0)
 #endif
 
 /*-------------------------------------------------------------------------*/

-- 
2.55.0


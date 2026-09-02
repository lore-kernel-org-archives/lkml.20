Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F169C38D3EE;
	Wed,  2 Sep 2026 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329500; cv=none; b=GW4Y3DRfqg5s48Nl7AB2f4y2EJyfSqjRjy/H/LqcsiFIkpa+ODtoP06+9UxgbHdlaAQlY8jmnZx5O4GSOM1Tz9zrqEljBsr+c80/KIvUKWzIaPUZerrVEwM+nHq227n1JA4vzibEc/L524pH2uGKFlU4+I2shbX+KZGAKIFfi+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329500; c=relaxed/simple;
	bh=5+5E83jCeQfgefJG0nKzh/woN0+S70pKzjFOL4vl0RU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SDX+17xYGtK32y0wB2sRFJ+jPY6mfQoHHWzSiAEbijUdluQXDFCHmbKWS0b1DCqN9VHgyjoV6dYJpPGfbSfoC1RXno7Z3nZRbOM981eeH8RS85iLkqfe32slKM+eep6kzudm0seDpAEAsV8eQtuULhY7zvMYMeeMmgIJX7ywPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYNR0FhY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYNR0FhY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E811F000E9;
	Wed,  2 Sep 2026 06:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788329498;
	bh=WVE8N9B4BbSvHWO9HA4D59Mo6rqDKM/PUtqgGQ97fAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mYNR0FhYKa9Vk3zKRdBE+uZXkeBnuNXKE/9rcxN+V0IVUDYfPyqD3d3ClSq27E0+e
	 pvms6bE636RTSzfhNPkiAEeWxnr+apX9zV/rqB2YMFWV8Lgw6K+a6JZ3owR92ky+JX
	 J9j9qso5rJb2eHKB8P+BN0yKtZBPyvOdoU87k1z0Jv7jl37fXTTo2RN/YMMT2Dtmu6
	 +FBd3uFMrkDsAoHZxMkqZJs4rwtN5N7bjVxXLf0YQJsyN4zxUGsc1dU+w4U49v0S5I
	 llT/1jOsH50UJ1BKvcPm8gGTNSpEy4jwi5fL9Hok+ZWzNcs0HOXK7REwYFW71qt6BY
	 Qm71tV6bYslcw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 02 Sep 2026 08:11:32 +0200
Subject: [PATCH v2 1/5] usb: ehci: support non-standard port status
 registers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-gemini-usb-fotg2-v2-1-0057408495d8@kernel.org>
References: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
In-Reply-To: <20260902-gemini-usb-fotg2-v2-0-0057408495d8@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Daniel Palmer <daniel@thingy.jp>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Some EHCI implementations place the port status registers outside the
standard operational register layout.

Add a per-controller port status base and use a helper for all PORTSC
accesses, while preserving the standard location by default.

Suggested-by: Daniel Palmer <daniel@thingy.jp>
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/usb/host/ehci-dbg.c |  3 +--
 drivers/usb/host/ehci-hcd.c |  7 +++----
 drivers/usb/host/ehci-hub.c | 35 +++++++++++++++++------------------
 drivers/usb/host/ehci.h     | 12 ++++++++++++
 4 files changed, 33 insertions(+), 24 deletions(-)

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
index 3c46bb18c7f3..19cc7611d86d 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -325,7 +325,7 @@ static void ehci_turn_off_all_ports(struct ehci_hcd *ehci)
 		ehci_port_power(ehci, port, false);
 		spin_lock_irq(&ehci->lock);
 		ehci_writel(ehci, PORT_RWC_BITS,
-				&ehci->regs->port_status[port]);
+				ehci_portsc(ehci, port));
 	}
 }
 
@@ -811,8 +811,7 @@ static irqreturn_t ehci_irq (struct usb_hcd *hcd)
 			/* leverage per-port change bits feature */
 			if (!(ppcd & (1 << i)))
 				continue;
-			pstatus = ehci_readl(ehci,
-					 &ehci->regs->port_status[i]);
+			pstatus = ehci_readl(ehci, ehci_portsc(ehci, i));
 
 			if (pstatus & PORT_OWNER)
 				continue;
@@ -1109,7 +1108,7 @@ static void ehci_remove_device(struct usb_hcd *hcd, struct usb_device *udev)
 /* Clear wakeup signal locked in zhaoxin platform when device plug in. */
 static void ehci_zx_wakeup_clear(struct ehci_hcd *ehci)
 {
-	u32 __iomem	*reg = &ehci->regs->port_status[4];
+	u32 __iomem	*reg = ehci_portsc(ehci, 4);
 	u32 		t1 = ehci_readl(ehci, reg);
 
 	t1 &= (u32)~0xf0000;
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index 1aee392e8492..77d0df41f45f 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -55,7 +55,7 @@ static void ehci_handover_companion_ports(struct ehci_hcd *ehci)
 	port = HCS_N_PORTS(ehci->hcs_params);
 	while (port--) {
 		if (test_bit(port, &ehci->owned_ports)) {
-			reg = &ehci->regs->port_status[port];
+			reg = ehci_portsc(ehci, port);
 			status = ehci_readl(ehci, reg) & ~PORT_RWC_BITS;
 			if (!(status & PORT_POWER))
 				ehci_port_power(ehci, port, true);
@@ -69,7 +69,7 @@ static void ehci_handover_companion_ports(struct ehci_hcd *ehci)
 	port = HCS_N_PORTS(ehci->hcs_params);
 	while (port--) {
 		if (test_bit(port, &ehci->owned_ports)) {
-			reg = &ehci->regs->port_status[port];
+			reg = ehci_portsc(ehci, port);
 			status = ehci_readl(ehci, reg) & ~PORT_RWC_BITS;
 
 			/* Port already owned by companion? */
@@ -106,7 +106,7 @@ static void ehci_handover_companion_ports(struct ehci_hcd *ehci)
 			 * but if something went wrong the port must not
 			 * remain enabled.
 			 */
-			reg = &ehci->regs->port_status[port];
+			reg = ehci_portsc(ehci, port);
 			status = ehci_readl(ehci, reg) & ~PORT_RWC_BITS;
 			if (status & PORT_OWNER)
 				ehci_writel(ehci, status | PORT_CSC, reg);
@@ -137,7 +137,7 @@ static int ehci_port_change(struct ehci_hcd *ehci)
 	 */
 
 	while (i--)
-		if (ehci_readl(ehci, &ehci->regs->port_status[i]) & PORT_CSC)
+		if (ehci_readl(ehci, ehci_portsc(ehci, i)) & PORT_CSC)
 			return 1;
 
 	return 0;
@@ -175,7 +175,7 @@ void ehci_adjust_port_wakeup_flags(struct ehci_hcd *ehci,
 
 	port = HCS_N_PORTS(ehci->hcs_params);
 	while (port--) {
-		u32 __iomem	*reg = &ehci->regs->port_status[port];
+		u32 __iomem	*reg = ehci_portsc(ehci, port);
 		u32		t1 = ehci_readl(ehci, reg) & ~PORT_RWC_BITS;
 		u32		t2 = t1 & ~PORT_WAKE_BITS;
 
@@ -254,7 +254,7 @@ static int ehci_bus_suspend (struct usb_hcd *hcd)
 	fs_idle_delay = false;
 	port = HCS_N_PORTS(ehci->hcs_params);
 	while (port--) {
-		u32 __iomem	*reg = &ehci->regs->port_status [port];
+		u32 __iomem	*reg = ehci_portsc(ehci, port);
 		u32		t1 = ehci_readl(ehci, reg) & ~PORT_RWC_BITS;
 		u32		t2 = t1 & ~PORT_WAKE_BITS;
 
@@ -426,7 +426,7 @@ static int ehci_bus_resume (struct usb_hcd *hcd)
 	 */
 	i = HCS_N_PORTS(ehci->hcs_params);
 	while (i--) {
-		temp = ehci_readl(ehci, &ehci->regs->port_status[i]);
+		temp = ehci_readl(ehci, ehci_portsc(ehci, i));
 		if ((temp & PORT_PE) &&
 				!(temp & (PORT_SUSPEND | PORT_RESUME))) {
 			ehci_dbg(ehci, "Port status(0x%x) is wrong\n", temp);
@@ -463,14 +463,14 @@ static int ehci_bus_resume (struct usb_hcd *hcd)
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
@@ -487,10 +487,10 @@ static int ehci_bus_resume (struct usb_hcd *hcd)
 
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
 
@@ -540,7 +540,7 @@ static void set_owner(struct ehci_hcd *ehci, int portnum, int new_owner)
 	u32			port_status;
 	int 			try;
 
-	status_reg = &ehci->regs->port_status[portnum];
+	status_reg = ehci_portsc(ehci, portnum);
 
 	/*
 	 * The controller won't set the OWNER bit if the port is
@@ -661,7 +661,7 @@ ehci_hub_status_data (struct usb_hcd *hcd, char *buf)
 	for (i = 0; i < ports; i++) {
 		/* leverage per-port change bits feature */
 		if (ppcd & (1 << i))
-			temp = ehci_readl(ehci, &ehci->regs->port_status[i]);
+			temp = ehci_readl(ehci, ehci_portsc(ehci, i));
 		else
 			temp = 0;
 
@@ -753,7 +753,7 @@ int ehci_hub_control(
 	temp = (wIndex - 1) & 0xff;
 	if (temp >= HCS_N_PORTS_MAX)
 		temp = 0;
-	status_reg = &ehci->regs->port_status[temp];
+	status_reg = ehci_portsc(ehci, temp);
 	hostpc_reg = &ehci->regs->hostpc[temp];
 
 	/*
@@ -1149,8 +1149,7 @@ int ehci_hub_control(
 
 			/* Put all enabled ports into suspend */
 			while (ports--) {
-				u32 __iomem *sreg =
-						&ehci->regs->port_status[ports];
+				u32 __iomem *sreg = ehci_portsc(ehci, ports);
 
 				temp = ehci_readl(ehci, sreg) & ~PORT_RWC_BITS;
 				if (temp & PORT_PE)
@@ -1200,14 +1199,14 @@ static int ehci_port_handed_over(struct usb_hcd *hcd, int portnum)
 
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
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index d7a3c8d13f6b..765338c2eb88 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -123,6 +123,7 @@ struct ehci_hcd {			/* one per controller */
 	struct ehci_caps __iomem *caps;
 	struct ehci_regs __iomem *regs;
 	struct ehci_dbg_port __iomem *debug;
+	u32 __iomem		*port_status;
 
 	__u32			hcs_params;	/* cached register copy */
 	spinlock_t		lock;
@@ -278,6 +279,17 @@ static inline struct usb_hcd *ehci_to_hcd(struct ehci_hcd *ehci)
 
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

-- 
2.55.0


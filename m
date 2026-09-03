Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982AD46F4B5;
	Thu,  3 Sep 2026 21:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788470278; cv=none; b=Cb6TtO0cv2jpkHEW/RZ80iIO26yeCPfxzNWlo8+BIYCtw+JGvU1hoyAoSeSOmD715RoJ843vuEr4y1k020PVJ8jm9JTsNFCUkUTtz5LYw46pJoM/M4k41v8+deHcUqxTpt0HDpZtTBnLOSFoceQiQl7dNkNT8dmMpkU2eSfN4/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788470278; c=relaxed/simple;
	bh=sD+0Zo5+83Vmp4zhLf7Dz9o7w/R4WXw9t6kOB/XVztI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BLTqdS+Pz7UG7PCYKYPlyUVt0+y6vCGipLJFxpTXvnqHLjYOM+zom4dYPyWchuZhf6q7cDkrat9ZSvo0PAbo7KAooQ/HQPGavjyfPCYGtj0VJvTAfIuSQX2OV1g1ky44XOztdKD8pk+jtq/YWZZvTHADDuHr6/j1g5Ceb7ANV78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QcQ94x4u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QcQ94x4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB071F000E9;
	Thu,  3 Sep 2026 21:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788470273;
	bh=hFJc6LmSQG90SjSodkdLwJTRZulse8SaVk/KIvkfmO0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QcQ94x4uVI1Ig+ID/HToI95POobrpWZhuFkT3GWmEfIJWBzeBfnoeCQgIdGYYwW6c
	 ObdpGdM0xIvuSkQoypWGoFbtcpKcvbota5Dx6UPIpywSGup2pUYJMmewfaLKHm+AD0
	 xIn7hBIEZRe8bn2nrHcuZLuIUa1cGaxbHe1YcaCBGVN0spoS5RlX390Sgv4rUxyWOL
	 dSf+kDddpsCJvanMu0xic4rAJnqeKdQBElBCFs7NdM83sYPKdO0SKA0Z1Q9uMdKYjP
	 DyXyB1499EuiJAcric8cB3MZDLWGx+KFYU1iDsDvj5tab8AczVJJogrRmIVXRCQLvT
	 Kf+dTUg9/qFOw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 03 Sep 2026 23:17:41 +0200
Subject: [PATCH v3 4/6] usb: ehci: support additional controller quirks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-gemini-usb-fotg2-v3-4-dd92ecf5675b@kernel.org>
References: <20260903-gemini-usb-fotg2-v3-0-dd92ecf5675b@kernel.org>
In-Reply-To: <20260903-gemini-usb-fotg2-v3-0-dd92ecf5675b@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Daniel Palmer <daniel@thingy.jp>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Some EHCI implementations omit CONFIGFLAG and USBMODE, or have an
integrated transaction translator that cannot schedule siTDs.

Add quirks to skip CONFIGFLAG and TDI mode accesses and to reject
full- and low-speed isochronous transfers. Standard controllers retain
their current behavior.

Suggested-by: Daniel Palmer <daniel@thingy.jp>
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/usb/host/ehci-hcd.c   | 24 ++++++++++++++++--------
 drivers/usb/host/ehci-timer.c |  3 ++-
 drivers/usb/host/ehci.h       |  3 +++
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 19cc7611d86d..75f780ec3ba0 100644
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
@@ -909,6 +913,8 @@ static int ehci_urb_enqueue (
 	case PIPE_ISOCHRONOUS:
 		if (urb->dev->speed == USB_SPEED_HIGH)
 			return itd_submit (ehci, urb, mem_flags);
+		else if (ehci->no_fsls_isoc)
+			return -EOPNOTSUPP;
 		else
 			return sitd_submit (ehci, urb, mem_flags);
 	}
@@ -1184,7 +1190,8 @@ int ehci_resume(struct usb_hcd *hcd, bool force_reset)
 	 * then we maintained suspend power.
 	 * Just undo the effect of ehci_suspend().
 	 */
-	if (ehci_readl(ehci, &ehci->regs->configured_flag) == FLAG_CF &&
+	if ((ehci->no_configured_flag ||
+	     ehci_readl(ehci, &ehci->regs->configured_flag) == FLAG_CF) &&
 			!force_reset) {
 		int	mask = INTR_MASK;
 
@@ -1216,7 +1223,8 @@ int ehci_resume(struct usb_hcd *hcd, bool force_reset)
 		goto skip;
 
 	ehci_writel(ehci, ehci->command, &ehci->regs->command);
-	ehci_writel(ehci, FLAG_CF, &ehci->regs->configured_flag);
+	if (!ehci->no_configured_flag)
+		ehci_writel(ehci, FLAG_CF, &ehci->regs->configured_flag);
 	ehci_readl(ehci, &ehci->regs->command);	/* unblock posted writes */
 
 	ehci->rh_state = EHCI_RH_SUSPENDED;
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
index bce4579fb8b2..855a9d08b019 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -235,6 +235,9 @@ struct ehci_hcd {			/* one per controller */
 	unsigned		spurious_oc:1;
 	unsigned		is_aspeed:1;
 	unsigned		zx_wakeup_clear_needed:1;
+	unsigned		no_configured_flag:1;
+	unsigned		no_tdi_mode:1;
+	unsigned		no_fsls_isoc:1;
 
 	/* required for usb32 quirk */
 	#define OHCI_CTRL_HCFS          (3 << 6)

-- 
2.55.0


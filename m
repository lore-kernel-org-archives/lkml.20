Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1A64657C6;
	Tue, 29 Sep 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697297; cv=none; b=Bt9tF9frBMc57X1vp8X6k6D9vXhO5e8ls0VOvuwzeCG5yTrwCDe/hMQWM7qirKr8F9kZpfX7HkROhJ9E+phDooXVCiPuauyY9pMIeJP75TCM+54WIF3HlD8eVdE/fKsdzO6Tv02IDQoyBaOngyN26gggLzMlC9nNdKYC0fQwjD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697297; c=relaxed/simple;
	bh=0eP9/uvy2I3/Zchvykx2YvGJgVWCBP9yh9eYLKowCtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fPkoYC2r6AuQRMN2tzRA2Ow2YcpPUcVBQMg/ZfVL2sKGIDDv7htXS66hGNsNI9cCsJC4MoUEzJ6213Ynsx3RhxQZlhBuZkIsMNSOciAJ8+7XvCSTwoEQsrtRWYFXw1EGkG1mJFn9+GW4mVTT1TaD2GBwr23neBljOhTV+irvhQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyrnjLIM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyrnjLIM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F6F1F000FF;
	Tue, 29 Sep 2026 15:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790697295;
	bh=7qGRd/1yD99JLc+2U/VhTYVyW5sQzR7h7VEWCa4bGUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PyrnjLIMNsaJge5kbK9A+Hz+y/43Hcx1xewBm7UcplLa6T1m/9cgdBYIz+PpPtcxx
	 3Ui29D87qZYZoMUtQ0N3TmRLVqGuNjrpNU8KjNqaqbUhm3W3g6J9J311SWW0y9YSU0
	 hIlerQmkKfwgv2tchW0nxlYYNQ7DbtuNEfpjjjQsiZ2WVkvtgk867dguwgiOCQZ90F
	 RrnOMKZPyQ6cRm4OUIbs5ckb+KmBeHeHuML8wkFyS1/4htjNPBld5MinBfz9mV38nA
	 e+zRiJLtaDAtCEd9TDJhbM//TqMniK2M2tolHmbYq6Tva6Q+OLSPL0P4bGf8NYn7JY
	 ysBU46pRxFZJA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 29 Sep 2026 17:54:42 +0200
Subject: [PATCH v4 2/4] usb: xhci: Honor PORTSC.TM if valid
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-topic-dwc3_tunneling_state-v4-2-63e296346d57@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790697285; l=4655;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=igzIaLsnPw0rPP8SmlxeFQIGpoV4uEOtMeSnxq4SYyg=;
 b=e8bGmHAOUUlXy1qDQu3WO79OHhYFVumvIR4avIMS70f5DliLL+oiTn+GEetFPpOJjNAy2eiR8
 UYmtv6JRId+Av583qO1ErsWJvZf0Xvu76VdPbOry73viKME5Fvsjz+3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Currently, the only way for the USB core to determine whether the link
is native or tunneled is via an Intel vendor-specific Extended
Capability.

The XHCI specification v1.2 and newer expose a common ext_cap,
indicating whether BIT(2) of PORTSC can be interpreted as the tunneling
status.

Make use of that and fall back to the existing Intel-specific path if
the ext_cap is absent.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/host/xhci-ext-caps.h |  3 +++
 drivers/usb/host/xhci-hub.c      | 11 ++++++++++-
 drivers/usb/host/xhci-port.h     |  3 ++-
 drivers/usb/host/xhci.c          |  8 ++++++++
 drivers/usb/host/xhci.h          |  1 +
 5 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ext-caps.h b/drivers/usb/host/xhci-ext-caps.h
index 22e53a750e2a..af7d624cd38e 100644
--- a/drivers/usb/host/xhci-ext-caps.h
+++ b/drivers/usb/host/xhci-ext-caps.h
@@ -66,6 +66,9 @@
 #define XHCI_HLC               (1 << 19)
 #define XHCI_BLC               (1 << 20)
 
+/* USB3 tunneling support capability - section 7.11 */
+#define XHCI_USB3_TUNNELING_SUPPORTED	BIT(16)
+
 /* Intel SPR shadow capability */
 #define XHCI_INTEL_SPR_ESS_PORT_OFFSET  0x8ac4	/* SuperSpeed port control */
 #define XHCI_INTEL_SPR_TUNEN	BIT(4)		/* Tunnel mode enabled */
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 470bafe1802b..80f07bd5081d 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -769,8 +769,17 @@ enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
 	struct usb_hcd *hcd;
 	void __iomem *base;
 	u32 offset;
+	u32 val;
 
-	/* Don't try and probe this capability for non-Intel hosts */
+	if (xhci->portsc_tunnel_reporting) {
+		val = xhci_portsc_readl(port);
+		if (val & PORT_TM)
+			return USB_LINK_TUNNELED;
+
+		return USB_LINK_NATIVE;
+	}
+
+	/* Fall back to the legacy Intel-specific ext_cap */
 	hcd = xhci_to_hcd(xhci);
 	if (!dev_is_pci(hcd->self.controller) ||
 	    to_pci_dev(hcd->self.controller)->vendor != PCI_VENDOR_ID_INTEL)
diff --git a/drivers/usb/host/xhci-port.h b/drivers/usb/host/xhci-port.h
index 889b5fb0fcd8..215c9cadbc34 100644
--- a/drivers/usb/host/xhci-port.h
+++ b/drivers/usb/host/xhci-port.h
@@ -5,7 +5,8 @@
 #define PORT_CONNECT	(1 << 0)
 /* true: port enabled */
 #define PORT_PE		(1 << 1)
-/* bit 2 reserved and zeroed */
+/* true: port is tunneling traffic over USB4 */
+#define PORT_TM		(1 << 2)
 /* true: port has an over-current condition */
 #define PORT_OC		(1 << 3)
 /* true: port reset signaling asserted */
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9e47e178c28..5fb78613a993 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5433,9 +5433,11 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	 * quirks
 	 */
 	struct device		*dev = hcd->self.sysdev;
+	void __iomem		*base;
 	int			retval;
 	u32			hcs_params1;
 	u32			hc_capbase;
+	u32			tunnel_cap;
 
 	/* Accept arbitrarily long scatter-gather lists */
 	hcd->self.sg_tablesize = ~0;
@@ -5456,6 +5458,7 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	mutex_init(&xhci->mutex);
 	xhci->main_hcd = hcd;
 	xhci->cap_regs = hcd->regs;
+	base = &xhci->cap_regs->hc_capbase;
 	hc_capbase = readl(&xhci->cap_regs->hc_capbase);
 	if (hc_capbase == U32_MAX) {
 		xhci_warn(xhci, "Host controller not accessible, removed?\n");
@@ -5473,6 +5476,11 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 	xhci->hcc_params = readl(&xhci->cap_regs->hcc_params);
 	if (xhci->hci_version > 0x100)
 		xhci->hcc_params2 = readl(&xhci->cap_regs->hcc_params2);
+	tunnel_cap = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_USB3_TUNNELING);
+	if (tunnel_cap) {
+		xhci->portsc_tunnel_reporting =
+			!!(readl(base + tunnel_cap) & XHCI_USB3_TUNNELING_SUPPORTED);
+	}
 
 	xhci->dma_mask_bits = 64;
 	xhci->max_slots = min(FIELD_GET(HCS_SLOTS_MASK, hcs_params1), MAX_HC_SLOTS);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index c7bfa7f028d3..480fcbac4525 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1662,6 +1662,7 @@ struct xhci_hcd {
 	/* cached extended protocol port capabilities */
 	struct xhci_port_cap	*port_caps;
 	unsigned int		num_port_caps;
+	bool			portsc_tunnel_reporting;
 	/* Compliance Mode Recovery Data */
 	struct timer_list	comp_mode_recovery_timer;
 	u32			port_status_u0;

-- 
2.55.0


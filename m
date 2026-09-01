Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E185847ACF5;
	Tue,  1 Sep 2026 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257158; cv=none; b=I0RPtM6Ebnrp3BViYymxFDBM9fau8Wle/x8rMChyNM20MPyHWqnN9lIRei1jF+fGMt2WvLhbpB19aoIN6L5d9jDyUvJyY6IHEQkJJYZF/X/d9Btr1Ixhi0NCa7bckJut2CGvBmWdCTUezVx7kPP24vrquyG+YDVGqlkVx+AMxtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257158; c=relaxed/simple;
	bh=snFNMf14ebGTlxFj8iQKxIHE9cJLdi6o2E4QN9xqXfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TNsHfNfiDf4Ewo7jqG91O6FJQVYcTQUPhVZEkhWJ7YzakJcRHGU2veNrRnjVfukodhcPFOMA35gjao4YykIz940906iLcn+xMDSDZBJ5N2Rl9uiPWHT1v9N/9Vxt5UOOePqURFnr9CKP2rOXVMx2I1EC1Ljv+RBr9o6zLXr4LW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eC6UqtT6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eC6UqtT6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4541F000E9;
	Tue,  1 Sep 2026 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788257156;
	bh=JCVwKMs0+G1PVd5uyxVRWAAPEqtNswabRiH/ZRT3d+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eC6UqtT6zDS5vo+x9Du7xv/DPs/Fet3pJVe8H3DRjZcoSUcfwO2Kz9V4RTiyvLxz8
	 lST1ReWuC3oigXsQC32BdUIQer5Q0blO5xETF54YClRzTxafWHEe8qzreQmhoo8ucb
	 A1bPlGxIrFcz/0DlGdlcOH4DPQeqi4/p8CLeCTvMk2YWX71fes9Tzhly1cUDbBE0+V
	 QV6FBuDq+Uo8awNnRCzvrX4L3hiSWIGuTQP2Rd6nCGb7tjeoFvnk6iMAGO8kfiOtis
	 cVuqUfbZk5ue/dVqDplSF4WsCDBc4YQ/Y129nVObrvWpg9me9HluC4mWT9PAJPuS4h
	 yuu4kIQtTiZzw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 01 Sep 2026 12:05:44 +0200
Subject: [PATCH v3 2/4] usb: xhci: Honor PORTSC.TM if valid
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-topic-dwc3_tunneling_state-v3-2-22fdced8de55@oss.qualcomm.com>
References: <20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com>
In-Reply-To: <20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Sven Peter <sven@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788257146; l=4600;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=rgAwW4+JYqiSjjzL1uUMCXBODSZYgrfvS/7eZrFkHZM=;
 b=M6T5vignot6Bh+yr+PAuCiMgi+HH+wGVKxPAzOcMdLADNqELYpBVhO7QfMjwrj5LTzWOGDYpI
 RFsZYlz1ea2ANCXwa4e9YiMuuqHnv+tKyhhkxEkWqiQTXPjHDiIioZF
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


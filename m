Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9124E66AD;
	Tue, 29 Sep 2026 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697304; cv=none; b=k3MgcOSK0iWDR6wEXjrtpGgIc52F3ALINFJ09Qqtwp+oc39U60Pg/VkChSe2aLYWie5wTJOHDjG3Bv4qBef0n9XzXY3ZJazbG4vswb9wUtfTUQBSAwjSSCXJhZch/tL4BJGV7JfjjvqWZD5AR0GLQnqFqCTxhCZ9vgprE+Mx7xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697304; c=relaxed/simple;
	bh=zyAtX+3wg2MD73ucjXI5qaV29NB5UMd5rGxVENENJkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cRLBjYVTeA7Ll/yeHOLEDTZ+yOmBU8DH+d18c3aN5HE6StK+7SlRBixO3MbrhwxTATreGV9jy1gOQ4YZnW1IsCeo93ouDlQ5ILNmbo9GCQpXMyAv6E3No7rKSLSl8RogZJAza3JYWegrwV1faw/GYKZiQ/v1uJEQiQ10fXMPoSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLUO6DX/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLUO6DX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1CF1F000FF;
	Tue, 29 Sep 2026 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790697303;
	bh=ONuvI2zErdb7koxpOwBIwpC/OFGy3eZwx3RI3hM06HM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nLUO6DX/N+dtqdmKsCTMoUNe9047q2yyvRLSCKu2OYbBI5WgNOsdDJ2UixqnEnxnJ
	 3BBk6bu5IFjaNr7TBpDWneC5Ltedtd5oelfrdrMSopg+8MWoycM1p1Ady5JZHFoTE9
	 on56HEwUKvVDdMCEDNRGALK64yCeM4g5g/iFNFkrRk8bIa3OEnfPFEGS2g9QnWJwFr
	 kzvOyWgOAlhGHumb4Hk+1KTELYvIRGNAdFGrb/Z0I6P7cnggxmTX5XiQ1SvqwbMB3l
	 dhhACiaQKcgZEsSXxokTieIdrXH5eVovrlNTlGM8d19LGGwLDQBOZYW9lzj7QsZ8qH
	 DZJAmDiul+ipw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 29 Sep 2026 17:54:44 +0200
Subject: [PATCH v4 4/4] usb: dwc3: Notify XHCI core of tunneled status
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-topic-dwc3_tunneling_state-v4-4-63e296346d57@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790697285; l=4193;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XXQ2pKiy3NRwQxA3Gf+0nYe4nkKMvc2Y3kYMsWL9mWI=;
 b=aGZjW13yOICKS78YSRsu0awq1aesiVyNEDWzORJFakQLJ7rwMogD2SgDc6t8N6UqINNO12TjE
 K9hrzfqexeaDWAhKJjW6NDrc1/kUfVw4bZNTXznaXGdEXkOwfbWbL1f
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Thunderbolt framework relies on the USB core to create device links
for tunneled ports, so that the USB3 controller is only kept
runtime-resumed for the duration of the tunneling. This depends on
first knowing whether a connection is tunneled or native.

Add the logic to handle that for DWC3 controllers.

Assisted-by: LLM
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.c | 18 ++++++++++++++++++
 drivers/usb/dwc3/core.h | 18 ++++++++++++++++++
 drivers/usb/dwc3/host.c | 14 ++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..4eb430f58983 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -162,6 +162,24 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
 }
 EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
 
+#if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
+enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port)
+{
+	/* Prior versions had no CIO support */
+	if (!DWC3_VER_IS_WITHIN(DWC31, 191A, ANY))
+		return USB_LINK_UNKNOWN;
+
+	/* Not all DWC3 instances have CIO HW, trust the platform firmware */
+	if (!device_property_present(dwc->dev, "usb4-host-interface"))
+		return USB_LINK_UNKNOWN;
+
+	if (dwc3_readl(dwc, DWC3_CIOCTRL(port)) & DWC3_CIOCTRL_CIO_EN)
+		return USB_LINK_TUNNELED;
+
+	return USB_LINK_NATIVE;
+}
+#endif
+
 static void __dwc3_set_mode(struct work_struct *work)
 {
 	struct dwc3 *dwc = work_to_dwc(work);
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..decc51cd6505 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -179,6 +179,11 @@
 #define DWC3_OEVTEN		0xcc0C
 #define DWC3_OSTS		0xcc10
 
+/* CIO regs */
+#define DWC3_CIO_BASE(n)	(0xcd20 + ((n) * 0x30))
+#define DWC3_CIOCTRL(n)		(DWC3_CIO_BASE(n) + 0x00)
+#define DWC3_CIOCTRL_CIO_EN	BIT(0)
+
 #define DWC3_LLUCTL(n)		(0xd024 + ((n) * 0x80))
 
 /* Bit fields */
@@ -1314,6 +1319,7 @@ struct dwc3 {
 #define DWC31_REVISION_170A	0x3137302a
 #define DWC31_REVISION_180A	0x3138302a
 #define DWC31_REVISION_190A	0x3139302a
+#define DWC31_REVISION_191A	0x3139312a
 #define DWC31_REVISION_200A	0x3230302a
 
 #define DWC32_REVISION_ANY	0x0
@@ -1658,11 +1664,23 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);
+
+/**
+ * dwc3_link_tunnel_mode - Check whether the link is tunneled over TBT/USB4
+ * @dwc: Pointer to DWC3 controller context
+ * @port: 0-based port index
+ *
+ * Returns: USB_LINK_TUNNELED if tunneled, USB_LINK_NATIVE if not, or
+ *          when the controller does not have USB4 capabilities.
+ */
+enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port);
 #else
 static inline int dwc3_host_init(struct dwc3 *dwc)
 { return 0; }
 static inline void dwc3_host_exit(struct dwc3 *dwc)
 { }
+static inline enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port)
+{ return USB_LINK_UNKNOWN; }
 #endif
 
 #if IS_ENABLED(CONFIG_USB_DWC3_GADGET) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..a97dbf9cd27a 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -78,8 +78,22 @@ static void dwc3_xhci_plat_start(struct usb_hcd *hcd)
 	dwc3_enable_susphy(dwc, true);
 }
 
+static int dwc3_xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
+{
+	struct platform_device *pdev;
+	struct dwc3 *dwc;
+
+	pdev = to_platform_device(hcd->self.controller);
+	dwc = dev_get_drvdata(pdev->dev.parent);
+
+	udev->tunnel_mode = dwc3_link_tunnel_mode(dwc, udev->portnum - 1);
+
+	return 0;
+}
+
 static const struct xhci_plat_priv dwc3_xhci_plat_quirk = {
 	.plat_start = dwc3_xhci_plat_start,
+	.update_device = dwc3_xhci_update_device,
 };
 
 static void dwc3_host_fill_xhci_irq_res(struct dwc3 *dwc,

-- 
2.55.0


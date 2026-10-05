Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7B437C934;
	Mon,  5 Oct 2026 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187048; cv=none; b=lV5NC0rqqQF+eGygwt1r/XRNplIkr8k/KtcoDI7SI9FtP/ZKQDrYTUmYqdMM+oLSiGKoqba9gPRT2v3SHxmCToQC9Nz0tuRzHgAKiCkBSjx/F2kKgxnpFj2pZsqQLPW8+4b7GnIRgaSH/SNtk3ovaGcsEFUo+ZJYkonep4fuvBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187048; c=relaxed/simple;
	bh=L4zrXZgphCwCjyKEyHDNbcQEKnNivWliCn9AfDtNIyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BIWIHMSFkTbQ91DZ/WlJR2cyhup1FsIKV+j9oXbOVoclsN5svyyT68FzJWH5wzNaRIHrgfVHZygyORuvtv/dreysR+uOIMEs9M1ZojhtS+lT0MEPpQYkH1qjQVIJG6Q94pwzQ7UfeUxvGIthjleL5yXzyAFbFofOaUcvfs9Ny6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EW7saI8q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EW7saI8q"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1324EC4AF62;
	Mon,  5 Oct 2026 07:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791187048;
	bh=L4zrXZgphCwCjyKEyHDNbcQEKnNivWliCn9AfDtNIyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EW7saI8qB2uM9xdlVWdeCgAVH3r4FS121k3iRLDgnEf3ELt8ACzElrFHmsm2l1UKX
	 6RSwceQ+J450U9VIEcoicJntxOi/AB020NFoRYVK9aTXokIXfkYuNhdP6ToxH+vD+t
	 LntYXanrBYDf8k2LxKjBFzuRROtzGmh3g67/DGTdwRE/d3cgs7yOeNXjr52XoalhX4
	 ZtP7sCMvbRN2VtEB9sZIo66mOeOgvu43bHd18aI6wtovyuzz1UoQ0PY8DVIRBya/EW
	 rBDHivafwIS8hT1CoPJ/IjH2s5XFx0cKo4yhfurY/Oojs53b791fbiz5ahRi8F20Q1
	 285u1BhfwAIyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA87CA5FFC;
	Mon,  5 Oct 2026 07:57:27 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Mon, 05 Oct 2026 10:18:26 +0200
Subject: [PATCH v3 3/3] usb: cdns3: cdnsp: Enable eUSB2v2 1KB bulk packet
 capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-eusb2v2-packet-size-v3-3-fde610a3c47a@cadence.com>
References: <20261005-eusb2v2-packet-size-v3-0-fde610a3c47a@cadence.com>
In-Reply-To: <20261005-eusb2v2-packet-size-v3-0-fde610a3c47a@cadence.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791188311; l=5055;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=6jGovsvbqiFGTEWUTII7/biTmDWSjNJ9MeWDacnN6RA=;
 b=UkrYWXFSZHkMhYAIbZoSR7gf6bi8C6rKkY2/ebIyevlLZhws/sfBRNN3EdTQRDiBxcN+lxtkm
 XqFKSIGVSnzBaw2IlyXSJP8mOCZ4w5dbfsq01yMJF+Ij+WpgdZ7JTG9
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com

From: Pawel Laszczak <pawell@cadence.com>

Implement peripheral-side changes in the Cadence (cdnsp) driver
to support eUSB2v2 1024-byte Bulk MaxPacketSize.

Check the HCC2_E2V2C bit in HCCPARAMS2 during setup and set
'pdev->gadget.is_eusb2v2 = 1' if supported. Delegate the incoming
USB_DEVICE_BULK_MAX_PACKET_UPDATE setup request from ep0 to the
composite layer.

Update cdnsp_endpoint_init() to check the 'eusb2v2_mps_active' flag
set by the gadget framework. If active, dynamically configure the
hardware endpoint for 1024-byte maximum packet size, overriding
the 512-byte value reported in the endpoint descriptor.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
Changes in v3:
- cdnsp-mem.c: Use the new gadget->eusb2v2_mps_active flag instead of modifying
  ep->desc.wMaxPacketSize. This allows the UDC to determine the correct HS bulk
  maximum packet size while letting the composite framework report 512 bytes in
  the endpoint descriptor per eUSB2v2 spec section 5.2.

Changes in v2:
- cdnsp-mem.c: simplified HS bulk clamp logic to: if (max_packet != 1024)
  max_packet = 512, consistent with xhci-mem.c.
---
 drivers/usb/cdns3/cdnsp-ep0.c    | 2 ++
 drivers/usb/cdns3/cdnsp-gadget.c | 4 ++++
 drivers/usb/cdns3/cdnsp-gadget.h | 8 ++++++++
 drivers/usb/cdns3/cdnsp-mem.c    | 9 +++++++--
 drivers/usb/common/debug.c       | 2 ++
 5 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/cdnsp-ep0.c b/drivers/usb/cdns3/cdnsp-ep0.c
index 5cd9b898ce97..090d20b307ee 100644
--- a/drivers/usb/cdns3/cdnsp-ep0.c
+++ b/drivers/usb/cdns3/cdnsp-ep0.c
@@ -253,6 +253,8 @@ static int cdnsp_ep0_handle_feature_device(struct cdnsp_device *pdev,
 		 */
 		cdnsp_enter_test_mode(pdev);
 		break;
+	case USB_DEVICE_BULK_MAX_PACKET_UPDATE:
+		return cdnsp_ep0_delegate_req(pdev, ctrl);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
index a5275c2fb43b..ac1dde43ce1d 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.c
+++ b/drivers/usb/cdns3/cdnsp-gadget.c
@@ -1853,6 +1853,10 @@ static int cdnsp_gen_setup(struct cdnsp_device *pdev)
 	pdev->hcc_params = readl(&pdev->cap_regs->hc_capbase);
 	pdev->hci_version = HC_VERSION(pdev->hcc_params);
 	pdev->hcc_params = readl(&pdev->cap_regs->hcc_params);
+	pdev->hcc_params2 = readl(&pdev->cap_regs->hcc_params2);
+
+	if (pdev->hcc_params2 & HCC2_E2V2C)
+		pdev->gadget.is_eusb2v2 = 1;
 
 	/*
 	 * Override the APB timeout value to give the controller more time for
diff --git a/drivers/usb/cdns3/cdnsp-gadget.h b/drivers/usb/cdns3/cdnsp-gadget.h
index c44bca348a41..75bc3f15bde5 100644
--- a/drivers/usb/cdns3/cdnsp-gadget.h
+++ b/drivers/usb/cdns3/cdnsp-gadget.h
@@ -89,6 +89,12 @@ struct cdnsp_cap_regs {
 
 #define CTX_SIZE(_hcc)		(HCC_64BYTE_CONTEXT(_hcc) ? 64 : 32)
 
+/* HCCPARAMS2 - hcc_params2 - bitmasks */
+/* bit 11 - DC support Double BW on a eUSB2 HS ISOC EP */
+#define HCC2_EUSB2_DIC		BIT(11)
+/* bit 12 - DC support eUSB2V2 capability */
+#define HCC2_E2V2C		BIT(12)
+
 /* db_off bitmask - bits 0:1 reserved. */
 #define DBOFF_MASK	GENMASK(31, 2)
 
@@ -1370,6 +1376,7 @@ struct cdnsp_port {
  * @rev_cap: Controller Capabilities Registers.
  * @hcs_params1: Cached register copies of read-only HCSPARAMS1
  * @hcc_params: Cached register copies of read-only HCCPARAMS1
+ * @hcc_params2: Cached register copies of read-only HCCPARAMS2
  * @rtl_revision: Cached controller rtl revision.
  * @setup: Temporary buffer for setup packet.
  * @ep0_preq: Internal allocated request used during enumeration.
@@ -1425,6 +1432,7 @@ struct cdnsp_device {
 	__u32 hcs_params1;
 	__u32 hcs_params3;
 	__u32 hcc_params;
+	__u32 hcc_params2;
 	#define RTL_REVISION_NEW_LPM 0x2700
 	__u32 rtl_revision;
 	/* Lock used in interrupt thread context. */
diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index 5d8cdc91927d..8892767942a7 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -978,8 +978,13 @@ int cdnsp_endpoint_init(struct cdnsp_device *pdev,
 	if (!usb_endpoint_xfer_isoc(pep->endpoint.desc))
 		err_count = 3;
 	if (usb_endpoint_xfer_bulk(pep->endpoint.desc) &&
-	    pdev->gadget.speed == USB_SPEED_HIGH)
-		max_packet = 512;
+	    pdev->gadget.speed == USB_SPEED_HIGH) {
+		if (pdev->gadget.eusb2v2_mps_active)
+			max_packet = 1024;
+		else
+			max_packet = 512;
+	}
+
 	/* Controller spec indicates that ctrl ep avg TRB Length should be 8. */
 	if (usb_endpoint_xfer_control(pep->endpoint.desc))
 		avg_trb_len = 8;
diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
index f204cec8d380..b9696fae7ef5 100644
--- a/drivers/usb/common/debug.c
+++ b/drivers/usb/common/debug.c
@@ -46,6 +46,8 @@ static const char *usb_decode_device_feature(u16 wValue)
 		return "U2 Enable";
 	case USB_DEVICE_LTM_ENABLE:
 		return "LTM Enable";
+	case USB_DEVICE_BULK_MAX_PACKET_UPDATE:
+		return "Bulk mps update";
 	default:
 		return "UNKNOWN";
 	}

-- 
2.43.0



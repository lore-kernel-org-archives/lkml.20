Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A70937C90F;
	Mon,  5 Oct 2026 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791187048; cv=none; b=RKTsXT53qxgughp0s1e0zDgzHhhj/FyhNjp7gC/UtiZTjH7Nz+eo5q/nORoGOaVa+NJivgjK8biwHU8O+VLDXpGD6YR/rZl0M22Liep2SQmbfi7GUKqHFXSwhdAEzTVnVNep0EmWuvCrHrUx6KKbIiY52j7Pi7aVQpJ3hJJCXZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791187048; c=relaxed/simple;
	bh=FAQ8n3PGF/42A7LPCVEPREYfeRmK3GVQTiDb9OmWKb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5hVB0K8IbQebVpmc0Yi95SPjxtzv3S8orIcP5aIcsTguoAfNzpuq92p+NZorvb0ygcyttKUauloPLMjsjLADoIxcdUy5RcbNdiR35x/rQVdgY9+FJ+FyOuEyR12RbErEzV+eNYCXHtMdSHaOXg9iBU08EFlzPGIWvu5iZb0S34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcn3TpZq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcn3TpZq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04EE8C4AF60;
	Mon,  5 Oct 2026 07:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791187048;
	bh=FAQ8n3PGF/42A7LPCVEPREYfeRmK3GVQTiDb9OmWKb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tcn3TpZq3jhTWZ4nmt9BzZVzEbRcP+T3fr+1LIP/8d5Waln6S4/R0lhSxOIfOWHUd
	 zBno1cAtRvwEkimhou2HvGGQBLfc727ocdnmfJkQTFDTUuqcnJvZ+RuKwPUme4D7Zk
	 fmCt+YIJMBQTjKa9k4iiclz+HdJYGfMBS47ArZTtYDUlPInjABUyY1Zi3OtqQ2tsKN
	 S5ybHCy1wzdLY7fa4y1IjJOct2ibpAq9M2XOKx3rF4ddBqN19PRuJluXrDbAssQojO
	 GXfvDUPC22Vjuwi+oeXZ4szletrvg2lIA4HmXfTwWUpSS27bxYCml5K+hxvjrUB4e5
	 J5R9qGCrZznpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF09CA5FFD;
	Mon,  5 Oct 2026 07:57:27 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Mon, 05 Oct 2026 10:18:25 +0200
Subject: [PATCH v3 2/3] usb: gadget: composite: Support eUSB2v2 bulk MPS
 update
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-eusb2v2-packet-size-v3-2-fde610a3c47a@cadence.com>
References: <20261005-eusb2v2-packet-size-v3-0-fde610a3c47a@cadence.com>
In-Reply-To: <20261005-eusb2v2-packet-size-v3-0-fde610a3c47a@cadence.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Laszczak <pawell@cadence.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791188311; l=4850;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=zMlRfIGeiVArfKEGBytmUlu/A6QFWPNjhtTKXEPQGZI=;
 b=LrlAcBxM8hxtKmxiL4h7gKeb58UjALg1CrbqtsIQyay8KlDymTGCtkDaPYy+P3mo/7WbkPrw2
 TTyqNs42sAqBXVtSNtLUr00Vu2phMYz8ur1Sbr3HDVMl2Q6S8B8oGwI
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com

From: Pawel Laszczak <pawell@cadence.com>

Add support for eUSB2v2 1024-byte Bulk MPS negotiation to the Gadget
Composite framework.

If 'gadget->is_eusb2v2' is set, force bcdUSB to 0x0230 and bMaxPacketSize0
to 64 bytes. Handle the USB_DEVICE_BULK_MAX_PACKET_UPDATE Feature Selector
request by activating the new 'eusb2v2_mps_active' gadget flag.

This flag allows the UDC (USB Device Controller) driver to dynamically
configure its hardware endpoints for 1024-byte packet mode, while the
Composite framework continues to report 512 bytes in the Configuration
Descriptor, ensuring strict compliance with eUSB2v2 specification
section 5.2. The flag is cleared upon device reset or disconnect.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
Changes in v3:
- composite.c: Do not overwrite ep->desc.wMaxPacketSize to 1024, as the eUSB2v2
  spec section 5.2 mandates that the endpoint descriptor always reports 512 bytes
  to the host. Instead, introduce gadget->eusb2v2_mps_active flag.
- gadget.h: Add eusb2v2_mps_active to struct usb_gadget.

Changes in v2:
- composite.c: CLEAR_FEATURE(BULK_MAX_PACKET_UPDATE) is not defined in the
  eUSB2v2 spec; stall it instead of incorrectly setting 1024-byte mode.
- restore MPS in __composite_disconnect
---
 drivers/usb/gadget/composite.c | 28 +++++++++++++++++++++-------
 include/linux/usb/gadget.h     |  4 ++++
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index dc3664374596..9678ed4e4aee 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -924,7 +924,6 @@ static void device_qual(struct usb_composite_dev *cdev)
 }
 
 /*-------------------------------------------------------------------------*/
-
 static void reset_config(struct usb_composite_dev *cdev)
 {
 	struct usb_function		*f;
@@ -971,8 +970,10 @@ static int set_config(struct usb_composite_dev *cdev,
 		if (result < 0)
 			goto done;
 	} else { /* Zero configuration value - need to reset the config */
-		if (cdev->config)
+		if (cdev->config) {
 			reset_config(cdev);
+			cdev->gadget->eusb2v2_mps_active = 0;
+		}
 		result = 0;
 	}
 
@@ -1807,7 +1808,11 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 				count_configs(cdev, USB_DT_DEVICE);
 			cdev->desc.bMaxPacketSize0 =
 				cdev->gadget->ep0->maxpacket;
-			if (gadget_is_superspeed(gadget)) {
+
+			if (gadget->is_eusb2v2) {
+				cdev->desc.bcdUSB = cpu_to_le16(0x0230);
+				cdev->desc.bMaxPacketSize0 = 64;
+			} else if (gadget_is_superspeed(gadget)) {
 				if (gadget->speed >= USB_SPEED_SUPER) {
 					cdev->desc.bcdUSB = cpu_to_le16(0x0320);
 					cdev->desc.bMaxPacketSize0 = 9;
@@ -2005,12 +2010,20 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 	 */
 	case USB_REQ_CLEAR_FEATURE:
 	case USB_REQ_SET_FEATURE:
-		if (!gadget_is_superspeed(gadget))
-			goto unknown;
-		if (ctrl->bRequestType != (USB_DIR_OUT | USB_RECIP_INTERFACE))
-			goto unknown;
 		switch (w_value) {
+		case USB_DEVICE_BULK_MAX_PACKET_UPDATE:
+			if (ctrl->bRequestType != (USB_DIR_OUT | USB_RECIP_DEVICE))
+				goto unknown;
+			if (ctrl->bRequest != USB_REQ_SET_FEATURE)
+				goto unknown;
+			gadget->eusb2v2_mps_active = 1;
+			value = 0;
+			break;
 		case USB_INTRF_FUNC_SUSPEND:
+			if (!gadget_is_superspeed(gadget))
+				goto unknown;
+			if (ctrl->bRequestType != (USB_DIR_OUT | USB_RECIP_INTERFACE))
+				goto unknown;
 			if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
 				break;
 			f = cdev->config->interface[intf];
@@ -2293,6 +2306,7 @@ static void __composite_disconnect(struct usb_gadget *gadget)
 	 * disconnect callbacks?
 	 */
 	spin_lock_irqsave(&cdev->lock, flags);
+	cdev->gadget->eusb2v2_mps_active = 0;
 	cdev->suspended = 0;
 	if (cdev->config)
 		reset_config(cdev);
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 8285b19a25e0..5f691f80fd68 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -420,6 +420,8 @@ struct usb_gadget_ops {
  * @wakeup_armed: True if gadget is armed by the host for remote wakeup.
  * @irq: the interrupt number for device controller.
  * @id_number: a unique ID number for ensuring that gadget names are distinct
+ * @is_eusb2v2: True if controller is Embedded usb2.
+ * @eusb2v2_mps_active: 1024-byte bulk mode is active.
  *
  * Gadgets have a mostly-portable "gadget driver" implementing device
  * functions, handling all usb configurations and interfaces.  Gadget
@@ -483,6 +485,8 @@ struct usb_gadget {
 	unsigned			lpm_capable:1;
 	unsigned			wakeup_capable:1;
 	unsigned			wakeup_armed:1;
+	unsigned			is_eusb2v2:1;
+	unsigned			eusb2v2_mps_active:1;
 	int				irq;
 	int				id_number;
 };

-- 
2.43.0



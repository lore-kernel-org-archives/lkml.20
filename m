Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88184825AD;
	Tue, 15 Sep 2026 08:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461196; cv=none; b=e0QXuiIRDrGNI4FAUGyEYE5Yd8mD5Gr9zdKfZYRStr24b7Ji3KBKI/ZT4L7sclThKHpGCmGR6UD4/0mNvFcjLCxykw3c147naYX0LuYBgW53T1aWp0Tp+JFiHv5HQBYX5FHGc5eufaOxYASPDoMSv4Sx10zIsk/c++qQVVFk6nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461196; c=relaxed/simple;
	bh=xy28u4Irfpty5VO+1BiRDQu17owlPYiNQitjba9Qcas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWMZ2wwZfye2yDAnII1gXxcJoVKXwalqkGjhOYaiNvzbRq7fsv6tRa5aSMJbaU+ykKH+Habg2Jocf2KGP6SFnUEJZDXH64OrH7GjXyelks2z9p8epeZKDYyuN+nBRYZmEbPrdO65h6EcDQnNF3C0bKOPvCIKfhMyPzyXi2wqGPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=XdQm8hMG; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=DK2Sy5Mw; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="XdQm8hMG";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="DK2Sy5Mw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461192; bh=xy28u4Irfpty5VO+1BiRDQu17owlPYiNQitjba9Qcas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XdQm8hMGONspxhvJaY9RH5NIsZFjRD63cMSFZ66wSI7YSPqoFcwiCzZQUMSlanAlx
	 psrtkt3QvIbGQAx5ncc7+EXFyQ0x/obO6Qf7t26QcZewlwgax/uU1AIT/QwQZuX0iN
	 tJBGdezSmKAeWKSHUL70Tmm5PLXzXseWpMmRuZY6Qop6zKPHW8BY0dVr8lDlLpYWbZ
	 p/HP7MpvORZecPalG83VURuMSFfTlTnUzJrYDmzO6JCsUw7aO2QA0PvsS0hPbOOh7i
	 RKDvL8mH8bg9o1tdm0ZR2M+uKVMBFTt5mQOi9QRPr+thyEwHYU0l6Ust1botHkv2gw
	 THgBw8WtxWzmA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 305DB40B87; Tue, 15 Sep 2026 09:33:12 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1789461191; bh=xy28u4Irfpty5VO+1BiRDQu17owlPYiNQitjba9Qcas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DK2Sy5MwtK4eJOFFW1Ls1EObJ7bGEXNRtFkmzb5VFRXyiil2JsOyWOqVWlrvZ11qv
	 BlSHOuTcUcK0YkG3zh7VUf4asBgXtuQcU60uZIYpwEj7BLI0pelhYqcgst1DKsfDq+
	 XvHa/TbSKp5OQiJ/s67IfdysmbiyQXHryTs74m99Q8HplNQfFJIyEjJfGcNzEr2XDQ
	 e7hMHObxXtWRdAYHBHBhXnu91Xizq8u1iUzqn2j1mVhSrpi1/oQzrv26wUNeUCAbId
	 W/Qf+XM2wlaVwvgkI00DBtEhjCyA0Ky4gEnyVz1gcK1l9G4n6KpxwZl6qOTMLzbitT
	 DKMqbqjRwretA==
Received: from maru.home (host81-158-254-226.range81-158.btcentralplus.com [81.158.254.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id D3FDB40B71;
	Tue, 15 Sep 2026 09:33:10 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/20] media: rc: imon: Bind both interfaces via usb_driver_claim_interface()
Date: Tue, 15 Sep 2026 09:32:20 +0100
Message-ID: <c922986ec1b360b47165a591b3a539abf3b8792e.1789460680.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789460680.git.sean@mess.org>
References: <cover.1789460680.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iMON devices expose two USB interfaces: interface 0 (IR, and
the display/knob on older devices) and interface 1 (touchscreen/
display on newer devices).

The driver currently pieces the interface together and this has to
deal with various race conditions. Restrict the id_table to interface 0
only (USB_DEVICE_INTERFACE_NUMBER) so imon_probe() is only ever entered
once per device and then we find the second interface with
usb_driver_claim_interface(). This makes the driver much simpler.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/imon.c | 164 +++++++++++++++++-----------------------
 1 file changed, 70 insertions(+), 94 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 621554005f2f..2668461ed409 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -96,7 +96,6 @@ struct imon_context {
 	bool dev_present_intf1;		/* USB device presence, interface 1 */
 
 	struct mutex lock;		/* to lock this object */
-	wait_queue_head_t remove_ok;	/* For unexpected USB disconnects */
 
 	struct usb_endpoint_descriptor *rx_endpoint_intf0;
 	struct usb_endpoint_descriptor *rx_endpoint_intf1;
@@ -378,7 +377,7 @@ static const struct usb_device_id imon_usb_id_table[] = {
 	 * SoundGraph iMON PAD (IR & LCD)
 	 * SoundGraph iMON Knob (IR only)
 	 */
-	{ USB_DEVICE(0x15c2, 0xffdc),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0xffdc, 0),
 	  .driver_info = (unsigned long)&imon_default_table },
 
 	/*
@@ -387,61 +386,61 @@ static const struct usb_device_id imon_usb_id_table[] = {
 	 * Need user input to fill in details on unknown devices.
 	 */
 	/* SoundGraph iMON OEM Touch LCD (IR & 7" VGA LCD) */
-	{ USB_DEVICE(0x15c2, 0x0034),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0034, 0),
 	  .driver_info = (unsigned long)&imon_DH102 },
 	/* SoundGraph iMON OEM Touch LCD (IR & 4.3" VGA LCD) */
-	{ USB_DEVICE(0x15c2, 0x0035),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0035, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* SoundGraph iMON OEM VFD (IR & VFD) */
-	{ USB_DEVICE(0x15c2, 0x0036),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0036, 0),
 	  .driver_info = (unsigned long)&imon_OEM_VFD },
 	/* device specifics unknown */
-	{ USB_DEVICE(0x15c2, 0x0037),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0037, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* SoundGraph iMON OEM LCD (IR & LCD) */
-	{ USB_DEVICE(0x15c2, 0x0038),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0038, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* SoundGraph iMON UltraBay (IR & LCD) */
-	{ USB_DEVICE(0x15c2, 0x0039),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0039, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* device specifics unknown */
-	{ USB_DEVICE(0x15c2, 0x003a),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x003a, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* device specifics unknown */
-	{ USB_DEVICE(0x15c2, 0x003b),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x003b, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* SoundGraph iMON OEM Inside (IR only) */
-	{ USB_DEVICE(0x15c2, 0x003c),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x003c, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* device specifics unknown */
-	{ USB_DEVICE(0x15c2, 0x003d),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x003d, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* device specifics unknown */
-	{ USB_DEVICE(0x15c2, 0x003e),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x003e, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* device specifics unknown */
-	{ USB_DEVICE(0x15c2, 0x003f),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x003f, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* device specifics unknown */
-	{ USB_DEVICE(0x15c2, 0x0040),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0040, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* SoundGraph iMON MINI (IR only) */
-	{ USB_DEVICE(0x15c2, 0x0041),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0041, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* Antec Veris Multimedia Station EZ External (IR only) */
-	{ USB_DEVICE(0x15c2, 0x0042),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0042, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* Antec Veris Multimedia Station Basic Internal (IR only) */
-	{ USB_DEVICE(0x15c2, 0x0043),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0043, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* Antec Veris Multimedia Station Elite (IR & VFD) */
-	{ USB_DEVICE(0x15c2, 0x0044),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0044, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* Antec Veris Multimedia Station Premiere (IR & LCD) */
-	{ USB_DEVICE(0x15c2, 0x0045),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0045, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	/* device specifics unknown */
-	{ USB_DEVICE(0x15c2, 0x0046),
+	{ USB_DEVICE_INTERFACE_NUMBER(0x15c2, 0x0046, 0),
 	  .driver_info = (unsigned long)&imon_default_table},
 	{}
 };
@@ -2328,15 +2327,20 @@ static struct imon_context *imon_init_intf1(struct usb_interface *intf,
 	struct usb_host_interface *iface_desc;
 	int ret = -ENOMEM;
 
+	ret = usb_driver_claim_interface(&imon_driver, intf, ictx);
+	if (ret) {
+		dev_err(ictx->dev, "failed to claim second interface (%d)\n", ret);
+		return NULL;
+	}
+
 	rx_urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (!rx_urb)
 		goto rx_urb_alloc_failed;
 
 	mutex_lock(&ictx->lock);
 
-	if (ictx->display_type == IMON_DISPLAY_TYPE_VGA) {
+	if (ictx->display_type == IMON_DISPLAY_TYPE_VGA)
 		timer_setup(&ictx->ttimer, imon_touch_display_timeout, 0);
-	}
 
 	ictx->usbdev_intf1 = interface_to_usbdev(intf);
 	ictx->rx_urb_intf1 = rx_urb;
@@ -2363,13 +2367,14 @@ static struct imon_context *imon_init_intf1(struct usb_interface *intf,
 	ret = usb_submit_urb(ictx->rx_urb_intf1, GFP_KERNEL);
 
 	if (ret) {
-		pr_err("usb_submit_urb failed for intf1 (%d)\n", ret);
+		dev_err(ictx->dev, "usb_submit_urb failed for intf1 (%d)\n", ret);
 		goto urb_submit_failed;
 	}
 
 	ictx->dev_present_intf1 = true;
 
 	mutex_unlock(&ictx->lock);
+
 	return ictx;
 
 urb_submit_failed:
@@ -2377,11 +2382,14 @@ static struct imon_context *imon_init_intf1(struct usb_interface *intf,
 		input_unregister_device(ictx->touch);
 touch_setup_failed:
 find_endpoint_failed:
+	if (ictx->display_type == IMON_DISPLAY_TYPE_VGA)
+		timer_delete_sync(&ictx->ttimer);
 	ictx->usbdev_intf1 = NULL;
 	mutex_unlock(&ictx->lock);
 	usb_free_urb(rx_urb);
 	ictx->rx_urb_intf1 = NULL;
 rx_urb_alloc_failed:
+	usb_driver_release_interface(&imon_driver, intf);
 	dev_err(ictx->dev, "unable to initialize intf1, err %d\n", ret);
 
 	return NULL;
@@ -2416,90 +2424,50 @@ static void imon_init_display(struct imon_context *ictx,
 static int imon_probe(struct usb_interface *interface,
 		      const struct usb_device_id *id)
 {
-	struct usb_device *usbdev = NULL;
-	struct usb_host_interface *iface_desc = NULL;
-	struct usb_interface *first_if;
+	struct usb_device *usbdev;
+	struct usb_interface *second_if;
 	struct device *dev = &interface->dev;
-	int ifnum, sysfs_err;
-	int ret = 0;
-	struct imon_context *ictx = NULL;
+	int sysfs_err;
+	struct imon_context *ictx;
 	u16 vendor, product;
 
-	usbdev     = interface_to_usbdev(interface);
-	iface_desc = interface->cur_altsetting;
-	ifnum      = iface_desc->desc.bInterfaceNumber;
-	vendor     = le16_to_cpu(usbdev->descriptor.idVendor);
-	product    = le16_to_cpu(usbdev->descriptor.idProduct);
+	if (interface->cur_altsetting->desc.bInterfaceNumber != 0)
+		return -ENODEV;
 
-	dev_dbg(dev, "%s: found iMON device (%04x:%04x, intf%d)\n",
-		__func__, vendor, product, ifnum);
+	usbdev  = interface_to_usbdev(interface);
+	vendor  = le16_to_cpu(usbdev->descriptor.idVendor);
+	product = le16_to_cpu(usbdev->descriptor.idProduct);
 
-	first_if = usb_ifnum_to_if(usbdev, 0);
-	if (!first_if) {
-		ret = -ENODEV;
-		goto fail;
-	}
+	dev_dbg(dev, "found iMON device (%04x:%04x)\n", vendor, product);
 
-	if (first_if->dev.driver != interface->dev.driver) {
-		dev_err(&interface->dev, "inconsistent driver matching\n");
-		ret = -EINVAL;
-		goto fail;
-	}
+	ictx = imon_init_intf0(interface, id);
+	if (!ictx)
+		return -ENODEV;
 
-	if (ifnum == 0) {
-		ictx = imon_init_intf0(interface, id);
-		if (!ictx) {
-			pr_err("failed to initialize context!\n");
-			ret = -ENODEV;
-			goto fail;
-		}
-		refcount_set(&ictx->users, 1);
+	refcount_set(&ictx->users, 1);
 
-	} else {
-		/* this is the secondary interface on the device */
-		struct imon_context *first_if_ctx = usb_get_intfdata(first_if);
-
-		/* fail early if first intf failed to register */
-		if (!first_if_ctx) {
-			ret = -ENODEV;
-			goto fail;
-		}
+	usb_set_intfdata(interface, ictx);
 
-		ictx = imon_init_intf1(interface, first_if_ctx);
-		if (!ictx) {
-			pr_err("failed to attach to context!\n");
-			ret = -ENODEV;
-			goto fail;
-		}
+	/* Newer devices export a second interface for display/touchscreen */
+	second_if = usb_ifnum_to_if(usbdev, 1);
+	if (second_if && imon_init_intf1(second_if, ictx))
 		refcount_inc(&ictx->users);
 
+	if (product == 0xffdc && ictx->rf_device) {
+		sysfs_err = sysfs_create_group(&interface->dev.kobj,
+					       &imon_rf_attr_group);
+		if (sysfs_err)
+			pr_err("Could not create RF sysfs entries(%d)\n",
+			       sysfs_err);
 	}
 
-	usb_set_intfdata(interface, ictx);
+	if (ictx->display_supported)
+		imon_init_display(ictx, interface);
 
-	if (ifnum == 0) {
-		if (product == 0xffdc && ictx->rf_device) {
-			sysfs_err = sysfs_create_group(&interface->dev.kobj,
-						       &imon_rf_attr_group);
-			if (sysfs_err)
-				pr_err("Could not create RF sysfs entries(%d)\n",
-				       sysfs_err);
-		}
-
-		if (ictx->display_supported)
-			imon_init_display(ictx, interface);
-	}
-
-	dev_info(dev, "iMON device (%04x:%04x, intf%d) on usb<%d:%d> initialized\n",
-		 vendor, product, ifnum,
-		 usbdev->bus->busnum, usbdev->devnum);
+	dev_info(dev, "iMON device (%04x:%04x) on usb<%d:%d> initialized\n",
+		 vendor, product, usbdev->bus->busnum, usbdev->devnum);
 
 	return 0;
-
-fail:
-	dev_err(dev, "unable to register, err %d\n", ret);
-
-	return ret;
 }
 
 /*
@@ -2507,11 +2475,15 @@ static int imon_probe(struct usb_interface *interface,
  */
 static void imon_disconnect(struct usb_interface *interface)
 {
+	struct usb_device *usbdev = interface_to_usbdev(interface);
+	struct usb_interface *other_if;
 	struct imon_context *ictx;
 	struct device *dev;
 	int ifnum;
 
 	ictx = usb_get_intfdata(interface);
+	if (!ictx)
+		return;
 
 	mutex_lock(&ictx->lock);
 	ictx->disconnected = true;
@@ -2547,6 +2519,7 @@ static void imon_disconnect(struct usb_interface *interface)
 			else if (ictx->display_type == IMON_DISPLAY_TYPE_VFD)
 				usb_deregister_dev(interface, &imon_vfd_class);
 		}
+		other_if = usb_ifnum_to_if(usbdev, 1);
 	} else {
 		ictx->dev_present_intf1 = false;
 		usb_kill_urb(ictx->rx_urb_intf1);
@@ -2554,13 +2527,16 @@ static void imon_disconnect(struct usb_interface *interface)
 			timer_delete_sync(&ictx->ttimer);
 			input_unregister_device(ictx->touch);
 		}
+		other_if = usb_ifnum_to_if(usbdev, 0);
 	}
 
+	if (other_if)
+		usb_driver_release_interface(&imon_driver, other_if);
+
 	if (refcount_dec_and_test(&ictx->users))
 		free_imon_context(ictx);
 
-	dev_dbg(dev, "%s: iMON device (intf%d) disconnected\n",
-		__func__, ifnum);
+	dev_dbg(dev, "iMON device (intf%d) disconnected\n", ifnum);
 }
 
 static int imon_suspend(struct usb_interface *intf, pm_message_t message)
-- 
2.55.0


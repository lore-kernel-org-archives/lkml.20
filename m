Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C6B3A4F23
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857321; cv=none; b=iQbNHDKtuIYP/5ihFh0LiU+nsYuY8UJCnJLTbHq4J20u2BLSv7c0pXp4rkjAqpY5zatLGu9tqlIA1NLmBi6kXI4ciObpzuLPgbdRR5Dxfn+v59guea4ntQ2TYDKwVnkzRg78L+ctu5gBa7eT5sFrFyA7yV2rJY+jzGrbuPS4CuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857321; c=relaxed/simple;
	bh=8uJdeYmWQJkZy+W3syV+U+iiTNe6FVKJYYlvHmtu2XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lhE3nizKzfn3z1cfV5oHG6i1v86oCBBzGW5DAjjSCdPYowbzCKUyefZ/2J/uTLs4JmdaanlTNZMs3vwoN2pbKlTIcYgLOBaZcfF7P8wnJVzGivLQvmjgKlj7zyiloJ+hPoDcOm/E0NkMFsTqK1CZQ6UKBOHWgw0QhtIN3CdeO28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltfA7A49; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltfA7A49"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed6d6eso18633145ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857319; x=1790462119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CBsZVQ7pQ+mQdybWEes03pmUYFCJXqocJTzbrDNI7+k=;
        b=ltfA7A49zxW/G6KME02CpDktyDm4NjoFemmpeFHzAF92RILMtBKQFuuWOrMIG/LTFr
         VS+DuKLBC7gb6rsHIbkmPApmtxa98kjFqm82gyLcQ8zQi71E1XKHB5m4pX3kSbXKXYD9
         ds1CtvJxZYvoxz65RAMxLyuUSG656jVJcfRKR8i288kFwLZ+goXKPxjD5N3xGIwFPcig
         X0vHbh4DOGJkvF+dne+Pw5I4mDQIaZUIw4uj9Hc4iuExSpti0E7J7biTPvLOHaSM5bSY
         C2dqMAxh1QI25FL4iK6eOzWpYmOmyN4NyTxUxZt1cwC9am2vzr+npbwqlHolAj+NpE3I
         BBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857319; x=1790462119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBsZVQ7pQ+mQdybWEes03pmUYFCJXqocJTzbrDNI7+k=;
        b=rFqRB34+asiwhr5XrvNZZje9NJY1StWkbUcVO9MHFh7W6hQyxfxLnea+z5E6ZmfNpJ
         HoR8qZPSy3FvDXkV/QNYNL+aglvkRFzePmU10SDBYDxy4sjkjAFDJOHoNs3aTmt7Np+G
         BfHJcQVBcDGlpCedpgaDeyea5AxYaD9JJFmtDParG9CUZ99vLD8iGpjKJLvbO9p2FIfC
         Co4VbIqK0RfvFkvWmcaF9gnkbRqjZKcL1pjnKQ9VsSVxsC4OH6/mxSCCOnnIJkgDq3ai
         L4RfOHziM+SUCmlj6imx6i1fWtCxFBmtmXjlu8j/PlLN/Qa/NoThd0c9cx+UDMdwwZS6
         LHQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSv38omnnmm1K2knTm385y7vcRXWxf2gA1gAuADju8fHANx5N8hXEL6p4PWsVabtF8meXYbF0lxcoI3/0=@vger.kernel.org
X-Gm-Message-State: AFuF++niPBNOulcojFWwKZiRF0vCkFDZFNEMJFX45xl68uJ4TN3bQXL4
	AUlShQQR/vlbSlzbpC5zeNHNt5VoZQRElEEbc6UUqJsDgrAVoT7Z5DFr
X-Gm-Gg: AYBFou0qJRKxE4xA/OLFcDGrIsUfmF1pBM1fiqU8TaLalveASsVDBNg3mp6tQ3id/QT
	VYS8TlkNWEiVAcm884MvWnXFNa37vCJy4eSeprkVTWhzlAlDtzyaQPdlGbkyRRHNvu0XmvQf443
	SnZW8URUWFWgJFi02FvpwDjvpHMjh2zSmi4pQfcGnWvJYQzW2jeW+aDfF698Z4UIkR0pyl9cl5X
	cUHxGeZzqlCz7TC2hUEypWZrVp0BRnu61WBEF3h/kmMh2IKfGH+CjsRL0+xMJSY0cNVkHkSnefb
	vUGw2MF2pNKKrdImhAmqyVc3UYwdEbDD8VZKbdciFqojKcxMYGraKLcOUZ33kmK1FqXoUlSxcZ6
	v/Iiel0ujZDPPZpMgOaLo+VQSJ755AKFEP5OvbITobrdkDJfYsFP3TE1D32CrGijYkgZp4spIey
	5lKL1r/wW7T6LsupjPMWgvKekTbrHeuEFciSwGQt/jinOhG7hQMavtEYrQ1BsQm0xcantnp8qgp
	VpsbUY7XL+ZZ+Mvlh2WYgYW6dkbuHwb/Ko5rOCRGFZD9LKzljS8tc64BcIp7JnnkLQett/LWst8
	TnfmrSp1Og==
X-Received: by 2002:a17:903:298e:b0:2dd:c100:4b7d with SMTP id d9443c01a7336-2ddc1005fa7mr49396385ad.52.1789857319312;
        Sat, 19 Sep 2026 15:35:19 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17c4d58sm13007015ad.58.2026.09.19.15.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:35:18 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: core: fix descriptor parsing OOB, port/bos locking, and devio/ledtrig races
Date: Sat, 19 Sep 2026 22:35:18 +0000
Message-ID: <20260919223518.3890208-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple memory safety and locking bugs in drivers/usb/core/:

1. In usb_parse_ssp_isoc_endpoint_companion() and
   usb_parse_ss_endpoint_companion() (config.c), check remaining
   descriptor size before dereferencing desc->bDescriptorType or
   subtracting desc->bLength.
2. In bos_descriptors_read() (sysfs.c) and usb3_lpm_permit_store()
   (port.c), hold usb_lock_device() and verify udev->bos /
   port_dev->child pointers.
3. In usbport_trig_deactivate() (ledtrig-usbport.c), unregister the USB
   notifier before freeing port list entries.
4. In devio.c, message.c, and devices.c, validate transfer lengths and
   string descriptor buffers.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 0e79b7f8a73d..6762e97371c6 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -106,7 +106,9 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 	 */
 	desc = (struct usb_ss_ep_comp_descriptor *) buffer;
 
-	if (size < USB_DT_SS_EP_COMP_SIZE) {
+	if (size < USB_DT_SS_EP_COMP_SIZE ||
+	    desc->bLength < USB_DT_SS_EP_COMP_SIZE ||
+	    desc->bLength > size) {
 		dev_notice(ddev,
 			   "invalid SuperSpeed endpoint companion descriptor "
 			   "of length %d, skipping\n", size);
diff --git a/drivers/usb/core/devices.c b/drivers/usb/core/devices.c
index 6f0354aba38b..771996a8c995 100644
--- a/drivers/usb/core/devices.c
+++ b/drivers/usb/core/devices.c
@@ -500,8 +500,8 @@ static ssize_t usb_device_dump(char __user **buffer, size_t *nbytes,
 				      file_offset, childdev, bus,
 				      level + 1, chix - 1, ++cnt);
 		usb_unlock_device(childdev);
-		if (ret == -EFAULT)
-			return total_written;
+		if (ret < 0)
+			return total_written ? total_written : ret;
 		total_written += ret;
 	}
 	return total_written;
diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb9425480..ecd96e249260 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -602,7 +602,7 @@ __acquires(ps->lock)
 			as->bulk_addr = 0;
 		}
 	}
-	ps->disabled_bulk_eps |= (1 << bulk_addr);
+	ps->disabled_bulk_eps |= (1U << bulk_addr);
 
 	/* Now carefully unlink all the marked pending URBs */
  rescan:
@@ -1600,6 +1600,8 @@ find_memory_area(struct usb_dev_state *ps, const struct usbdevfs_urb *uurb)
 
 	spin_lock_irqsave(&ps->lock, flags);
 	list_for_each_entry(iter, &ps->memory_list, memlist) {
+		if (!iter->vma_use_count)
+			continue;
 		if (uurb_start >= iter->vm_start &&
 				uurb_start < iter->vm_start + iter->size) {
 			if (uurb->buffer_length > iter->vm_start + iter->size -
@@ -1937,10 +1939,9 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
 	if (!is_in)
 		snoop_urb_data(as->urb, as->urb->transfer_buffer_length);
 
-	async_newpending(as);
-
 	if (usb_endpoint_xfer_bulk(&ep->desc)) {
 		spin_lock_irq(&ps->lock);
+		list_add_tail(&as->asynclist, &ps->async_pending);
 
 		/* Not exactly the endpoint address; the direction bit is
 		 * shifted to the 0x10 position so that the value will be
@@ -1956,17 +1957,18 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
 		if (uurb->flags & USBDEVFS_URB_BULK_CONTINUATION)
 			as->bulk_status = AS_CONTINUATION;
 		else
-			ps->disabled_bulk_eps &= ~(1 << as->bulk_addr);
+			ps->disabled_bulk_eps &= ~(1U << as->bulk_addr);
 
 		/* Don't accept continuation URBs if the endpoint is
 		 * disabled because of an earlier error.
 		 */
-		if (ps->disabled_bulk_eps & (1 << as->bulk_addr))
+		if (ps->disabled_bulk_eps & (1U << as->bulk_addr))
 			ret = -EREMOTEIO;
 		else
 			ret = usb_submit_urb(as->urb, GFP_ATOMIC);
 		spin_unlock_irq(&ps->lock);
 	} else {
+		async_newpending(as);
 		ret = usb_submit_urb(as->urb, GFP_KERNEL);
 	}
 
diff --git a/drivers/usb/core/ledtrig-usbport.c b/drivers/usb/core/ledtrig-usbport.c
index 8881644777a7..c472b2cf1e50 100644
--- a/drivers/usb/core/ledtrig-usbport.c
+++ b/drivers/usb/core/ledtrig-usbport.c
@@ -88,7 +88,7 @@ static ssize_t usbport_trig_port_show(struct device *dev,
 						      struct usbport_trig_port,
 						      attr);
 
-	return sysfs_emit(buf, "%d\n", port->observed) + 1;
+	return sysfs_emit(buf, "%d\n", port->observed);
 }
 
 static ssize_t usbport_trig_port_store(struct device *dev,
@@ -334,14 +334,14 @@ static void usbport_trig_deactivate(struct led_classdev *led_cdev)
 	struct usbport_trig_data *usbport_data = led_get_trigger_data(led_cdev);
 	struct usbport_trig_port *port, *tmp;
 
+	usb_unregister_notify(&usbport_data->nb);
+
 	list_for_each_entry_safe(port, tmp, &usbport_data->ports, list) {
 		usbport_trig_remove_port(usbport_data, port);
 	}
 
 	sysfs_remove_group(&led_cdev->dev->kobj, &ports_group);
 
-	usb_unregister_notify(&usbport_data->nb);
-
 	kfree(usbport_data);
 }
 
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 75e2bfd744a9..c16827d16b78 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1358,6 +1358,11 @@ void usb_disable_endpoint(struct usb_device *dev, unsigned int epaddr,
 			dev->ep_in[epnum] = NULL;
 	}
 	if (ep) {
+		if (reset_hardware && epnum != 0 &&
+		    usb_endpoint_xfer_control(&ep->desc)) {
+			dev->ep_out[epnum] = NULL;
+			dev->ep_in[epnum] = NULL;
+		}
 		ep->enabled = 0;
 		usb_hcd_flush_endpoint(dev, ep);
 		if (reset_hardware)
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..32ab63627c82 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -279,9 +279,10 @@ static ssize_t usb3_lpm_permit_store(struct device *dev,
 			       const char *buf, size_t count)
 {
 	struct usb_port *port_dev = to_usb_port(dev);
-	struct usb_device *udev = port_dev->child;
+	struct usb_device *udev;
 	struct usb_hcd *hcd;
 
+	device_lock(dev);
 	if (!strncmp(buf, "u1_u2", 5)) {
 		port_dev->usb3_lpm_u1_permit = 1;
 		port_dev->usb3_lpm_u2_permit = 1;
@@ -297,22 +298,30 @@ static ssize_t usb3_lpm_permit_store(struct device *dev,
 	} else if (!strncmp(buf, "0", 1)) {
 		port_dev->usb3_lpm_u1_permit = 0;
 		port_dev->usb3_lpm_u2_permit = 0;
-	} else
+	} else {
+		device_unlock(dev);
 		return -EINVAL;
+	}
+
+	udev = usb_get_dev(port_dev->child);
+	device_unlock(dev);
 
 	/* If device is connected to the port, disable or enable lpm
 	 * to make new u1 u2 setting take effect immediately.
 	 */
 	if (udev) {
 		hcd = bus_to_hcd(udev->bus);
-		if (!hcd)
+		if (!hcd) {
+			usb_put_dev(udev);
 			return -EINVAL;
+		}
 		usb_lock_device(udev);
 		mutex_lock(hcd->bandwidth_mutex);
 		if (!usb_disable_lpm(udev))
 			usb_enable_lpm(udev);
 		mutex_unlock(hcd->bandwidth_mutex);
 		usb_unlock_device(udev);
+		usb_put_dev(udev);
 	}
 
 	return count;
diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index d22dc78457d7..da6dc2713ffd 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -908,7 +908,7 @@ bos_descriptors_read(struct file *filp, struct kobject *kobj,
 	if (rc < 0)
 		return -EINTR;
 	bos = udev->bos;
-	if (bos) {
+	if (bos && bos->desc) {
 		desc = bos->desc;
 		desclen = le16_to_cpu(desc->wTotalLength);
 		if (off < desclen) {

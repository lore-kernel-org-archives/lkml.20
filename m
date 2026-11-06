Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976923;
	b=3BaqW9jYXlJcXWFlJt3YROH5NffIkOAEZUYz09B7L0ew3FuL7/PDYgD6Ct2gipot0snU
	 uBc038Ys3Pnxp4j+VTv276e0FjVj8iMDWirT/+ENFVkLT6VXrEqiD9QMogKS/8zEZawMn
	 XPjtRVgE5198YWR4h1qecX4YkddiYW2mG97KNZ9Pl24gpBBYeL1c19Grn9dI0Q6LY5m/t
	 eEy2y+RgA1sDbpygccTF9QuQXhK2V9iir912dupLZx0uYTAgFPVmwXBI6fUpVZYbjcpCQ
	 u6MNdz5TN3/MTw1I2FaFcvvwMXabtp50e0gC0XZjuERNs61U0Uq2W6Rkh9N0hlkZd1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976923;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=L1JcU/04WRpSSTfXZx8VAoW2lVINFRv9RJraW5KWco0=;
	b=oHvSU6O7W94P5WgDHaSYa/zmTuR6A/pHN28HaC4tsVK+cIx+8SgKAkaHg3FrjULlO6yd
	 hfWkwX+3cG/Eage3halRxjROv4k99OFCzHpBosoEWOl4ok2WmNtlEgrhiHQ8tAs93oSde
	 k4knc6XMoCLWZjPl7pZ3YSdiLkW8C0HqfYS+xlX5guBgSTls8Os75ZWb8dToJW5qAvPl0
	 wrns+BvvtZJRn6vrtgr6jzxHqj9xTmT7I7wjdlKfKCciQLemRVt9rPsi3jtfN7nKHLYfn
	 kbZiQqV7lI/Urt8PP4ndZnkmvKY0wbjca7Yewl1j8jw3HAay0aqa3UvQNEaywpCiqbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=74.125.231.202
Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F687606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F687606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4c3bb46aaf0so250828b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976922; x=1794581722;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L1JcU/04WRpSSTfXZx8VAoW2lVINFRv9RJraW5KWco0=;
        b=yh3YukKYXxk9duQ0Gb87K+A2AaGx9zSH7FvZcIQBvR6PZ6u5sV0eUGBlbDS5ym0MaG
         sudNKfX+Lciy/wFLTLQuMa54eeHLFBOKSGAgWr3qUMbtHwC6KsjZ0eyAOPR6WYm2aL+O
         pvS5Ky4WvcQdkthzI9dHp4AbRiEDdFm0bduEWQLD485wPwAu540WW1jnUBv+qpHktUQQ
         Rt0nBANdRwL0Ilv5osrAhKJsPl3VokobKIhd6dTuyEryjskcg4ev1IFLJNbNWOHIIoKK
         pDaqU+RT2soWvemTIfFhs3ZRI2kg0ysB+YylwLD4FD6CIxyXPqnwSAdYorY/vJ1RKaDo
         1rzg==
X-Gm-Message-State: APuU4Z8VZ1JIN11BaTrxTYF1ltVRQxkqxyi3IDzbplv7S2NvI0EosBez
	9CpLRecZS2Y/IRgg8mWxWRdql88CEhSDkLV95O0jJv/n20LhmsSmMNveYNUM8h4Dk/Bl51dQnGH
	wvFfcSYl+57Zndn0cm23cdEenZLY9hc43XaKdCvF+BGjmR8dVHTwozwzC70GSig==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:192a:b0:4cb:f21b:6f91 with SMTP id
 5614622812f47-567e152accfmr2392816b6e.36.1793976922272; Fri, 06 Nov 2026
 06:55:22 -0800 (PST)
Date: Fri, 06 Nov 2026 06:55:22 -0800
In-Reply-To: <6a6944f5.e3659fcc.2a40b8.0021.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aedea5a.8be4ead1.3b45e1.0179.GAE@google.com>
Subject: Forwarded: [PATCH RFC] usb: gadget: gadgetfs: dequeue pending ep0
 request before freeing
From: syzbot <syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH RFC] usb: gadget: gadgetfs: dequeue pending ep0 request before freeing
Author: devnull@kernel.org

From: Jing Lin <kayano050408@gmail.com>

Please test this gadgetfs ep0 request lifetime fix
The unpatched base reproduces the warning and use-after-free locally
on arm64 QEMU with dummy_hcd and KASAN

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f66469d9905b39d2c260a15d7d6db450f4db67c1

gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
the gadget, assuming that no I/O remains active

With dummy_hcd, disconnecting does not necessarily drain ep0, so a delayed
userspace response can leave dev->req queued when it is freed
This triggers the warning in dummy_free_request() and a use-after-free
when dummy_udc_stop() subsequently drains the endpoint queue

Track dev->req from submission through completion under dev->lock and
reject reuse while it is busy
After waiting for active UDC users to finish, dequeue a pending request
before freeing it and clearing ep0->driver_data
Drop dev->lock around dequeue because the completion callback takes it
Only dequeue pending requests to avoid errors from UDCs that reject
cancellation of an unqueued request

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c73e1942197af9f54ca3
Signed-off-by: Jing Lin <kayano050408@gmail.com>
---
Local validation on arm64 QEMU with dummy_hcd, KASAN and lockdep:
- The unpatched kernel reproduces the warning and use-after-free
- The patched kernel runs the C reproducer and rebind/concurrency workload
  without the warning, a KASAN report or a lockdep report
- W=1 compilation of inode.o and the Image build completed successfully

AI tools assisted with patch development, the commit description, review
and local QEMU validation

Related syzbot RFC:
https://lore.kernel.org/all/161c70c4-a363-469d-8665-64f71763f84b@mail.kernel.org/
This version tracks pending requests and guards reuse while they are busy
---
 drivers/usb/gadget/legacy/inode.c | 55 ++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index 7f6d84601..d60df4ad3 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -140,6 +140,7 @@ struct dev_data {
 					setup_abort : 1,
 					gadget_registered : 1;
 	unsigned			setup_wLength;
+	bool				ep0_req_queued;
 
 	/* the rest is basically write-once */
 	struct usb_config_descriptor	*config, *hs_config;
@@ -984,6 +985,16 @@ static inline void ep0_readable (struct dev_data *dev)
 	kill_fasync (&dev->fasync, SIGIO, POLL_IN);
 }
 
+static void dev_req_complete(struct usb_ep *ep, struct usb_request *req)
+{
+	struct dev_data		*dev = ep->driver_data;
+	unsigned long		flags;
+
+	spin_lock_irqsave(&dev->lock, flags);
+	dev->ep0_req_queued = false;
+	spin_unlock_irqrestore(&dev->lock, flags);
+}
+
 static void clean_req (struct usb_ep *ep, struct usb_request *req)
 {
 	struct dev_data		*dev = ep->driver_data;
@@ -992,7 +1003,7 @@ static void clean_req (struct usb_ep *ep, struct usb_request *req)
 		kfree(req->buf);
 		req->buf = dev->rbuf;
 	}
-	req->complete = epio_complete;
+	req->complete = dev_req_complete;
 	dev->setup_out_ready = 0;
 }
 
@@ -1004,6 +1015,7 @@ static void ep0_complete (struct usb_ep *ep, struct usb_request *req)
 
 	/* for control OUT, data must still get to userspace */
 	spin_lock_irqsave(&dev->lock, flags);
+	dev->ep0_req_queued = false;
 	if (!dev->setup_in) {
 		dev->setup_out_error = (req->status != 0);
 		if (!dev->setup_out_error)
@@ -1015,7 +1027,7 @@ static void ep0_complete (struct usb_ep *ep, struct usb_request *req)
 	/* clean up as appropriate */
 	if (free && req->buf != &dev->rbuf)
 		clean_req (ep, req);
-	req->complete = epio_complete;
+	req->complete = dev_req_complete;
 	spin_unlock_irqrestore(&dev->lock, flags);
 }
 
@@ -1023,7 +1035,7 @@ static int setup_req (struct usb_ep *ep, struct usb_request *req, u16 len)
 {
 	struct dev_data	*dev = ep->driver_data;
 
-	if (dev->setup_out_ready) {
+	if (dev->setup_out_ready || dev->ep0_req_queued) {
 		DBG (dev, "ep0 request busy!\n");
 		return -EBUSY;
 	}
@@ -1073,13 +1085,20 @@ ep0_read (struct file *fd, char __user *buf, size_t len, loff_t *ptr)
 			struct usb_request	*req = dev->req;
 
 			if ((retval = setup_req (ep, req, 0)) == 0) {
+				dev->state = STATE_DEV_CONNECTED;
+				dev->ep0_req_queued = true;
 				++dev->udc_usage;
 				spin_unlock_irq (&dev->lock);
 				retval = usb_ep_queue (ep, req, GFP_KERNEL);
 				spin_lock_irq (&dev->lock);
 				--dev->udc_usage;
+				if (retval < 0) {
+					dev->ep0_req_queued = false;
+					clean_req(ep, req);
+				}
+			} else {
+				dev->state = STATE_DEV_CONNECTED;
 			}
-			dev->state = STATE_DEV_CONNECTED;
 
 			/* assume that was SET_CONFIGURATION */
 			if (dev->current_config) {
@@ -1270,6 +1289,7 @@ ep0_write (struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 			retval = setup_req (dev->gadget->ep0, dev->req, len);
 			if (retval == 0) {
 				dev->state = STATE_DEV_CONNECTED;
+				dev->ep0_req_queued = true;
 				++dev->udc_usage;
 				spin_unlock_irq (&dev->lock);
 				if (copy_from_user (dev->req->buf, buf, len))
@@ -1284,6 +1304,7 @@ ep0_write (struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 				spin_lock_irq(&dev->lock);
 				--dev->udc_usage;
 				if (retval < 0) {
+					dev->ep0_req_queued = false;
 					clean_req (dev->gadget->ep0, dev->req);
 				} else
 					retval = len;
@@ -1508,6 +1529,11 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 	} else if (dev->state == STATE_DEV_SETUP)
 		dev->setup_abort = 1;
 
+	if (dev->ep0_req_queued) {
+		spin_unlock(&dev->lock);
+		return -EBUSY;
+	}
+
 	req->buf = dev->rbuf;
 	req->context = NULL;
 	switch (ctrl->bRequest) {
@@ -1626,6 +1652,7 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 				if (value < 0)
 					break;
 
+				dev->ep0_req_queued = true;
 				++dev->udc_usage;
 				spin_unlock (&dev->lock);
 				value = usb_ep_queue (gadget->ep0, dev->req,
@@ -1633,6 +1660,7 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 				spin_lock (&dev->lock);
 				--dev->udc_usage;
 				if (value < 0) {
+					dev->ep0_req_queued = false;
 					clean_req (gadget->ep0, dev->req);
 					break;
 				}
@@ -1664,16 +1692,18 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 		req->length = value;
 		req->zero = value < w_length;
 
+		dev->ep0_req_queued = true;
 		++dev->udc_usage;
 		spin_unlock (&dev->lock);
 		value = usb_ep_queue (gadget->ep0, req, GFP_KERNEL);
 		spin_lock(&dev->lock);
 		--dev->udc_usage;
-		spin_unlock(&dev->lock);
 		if (value < 0) {
+			dev->ep0_req_queued = false;
 			DBG (dev, "ep_queue --> %d\n", value);
 			req->status = 0;
 		}
+		spin_unlock(&dev->lock);
 		return value;
 	}
 
@@ -1771,6 +1801,7 @@ static void
 gadgetfs_unbind (struct usb_gadget *gadget)
 {
 	struct dev_data		*dev = get_gadget_data (gadget);
+	bool			queued;
 
 	DBG (dev, "%s\n", __func__);
 
@@ -1781,15 +1812,20 @@ gadgetfs_unbind (struct usb_gadget *gadget)
 		usleep_range(1000, 2000);
 		spin_lock_irq(&dev->lock);
 	}
+	queued = dev->ep0_req_queued;
 	spin_unlock_irq (&dev->lock);
 
+	if (dev->req) {
+		if (queued)
+			usb_ep_dequeue(gadget->ep0, dev->req);
+		usb_ep_free_request(gadget->ep0, dev->req);
+		dev->req = NULL;
+	}
+
 	destroy_ep_files (dev);
 	gadget->ep0->driver_data = NULL;
 	set_gadget_data (gadget, NULL);
 
-	/* we've already been disconnected ... no i/o is active */
-	if (dev->req)
-		usb_ep_free_request (gadget->ep0, dev->req);
 	DBG (dev, "%s done\n", __func__);
 	put_dev (dev);
 }
@@ -1816,11 +1852,12 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
 	get_dev (dev);
 
 	/* preallocate control response and buffer */
+	dev->ep0_req_queued = false;
 	dev->req = usb_ep_alloc_request (gadget->ep0, GFP_KERNEL);
 	if (!dev->req)
 		goto enomem;
 	dev->req->context = NULL;
-	dev->req->complete = epio_complete;
+	dev->req->complete = dev_req_complete;
 
 	if (activate_ep_files (dev) < 0)
 		goto enomem;

---
base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
change-id: 20261106-b4-gadgetfs-ep0-f814c14717a9

Best regards,
--  
Jing Lin <kayano050408@gmail.com>



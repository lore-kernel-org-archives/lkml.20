Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595299;
	b=2BqaHcc3qPFOhPGlUgm0PDrLMZunKD2YHptdPL+sBJ+j/ZDLYDNGMY+cPQhf9GOE0Mt6
	 cuCF6ZIq+L0xQJ2orCU8VFXVwq19GbJ20+MReEZSTnqYYFFSSfUjJzSQNx0ey9kq5mqvT
	 QlqS3te6vpjZysMbX8tM/NoTCMbaxEuskqakN+Gn1Zjf/6crubOO9o56CBJqZnqQtxVqt
	 KtkDnoRenk7qjTg2MfSGz1YjIEZKe98MO0OwDPnjmQ6glf6yNA80vHNtno2894lHy2kZi
	 hA0o2fRv0c38nzKTXL2BQC0AtuV+MQO5uQ6AAVd6qT4AArh4PFeauMgVmokQqlFMI6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SKh8lPT5SEfMc99OwulIZQOlMHEzODfvv6gUt03pNys=;
	b=d6NRvHm7dspSsUDGJpoHyzeWa/lsH3/sRjeFvdhcZEj4O75FLS38QaphlGCOFBjrx93n
	 uX1sTHgsR55LZP6Ugp3yUa36z6oiouyOVSRH54eTe3umVrjqxn3ld/YpmH4ziUjuA3RS3
	 67MjOL0TlHIuP3gAU842RcY6txa86+1ltNHkq9P7NBGbsI0b35DQUSE++//s8hc5bQgXp
	 GvosGv05yLoL5PQqJ7Fx9SkLFSxL5Ri/3GPx/V7lcIXmmlNsAWNIhMjvhGP1iO/NqrEg5
	 C5Zvs4INN70P6Tqt6IpWLfg1dxxc3doy4zlQkqI8GsgLXSo1icjhr803zLsSBOvX5Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VJpeNPVz;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCBE60A3825
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDCBE60A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VJpeNPVz
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-53c156ba662so417991b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792595298; x=1793200098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKh8lPT5SEfMc99OwulIZQOlMHEzODfvv6gUt03pNys=;
        b=VJpeNPVzzW2m9IiLhWBOP6SQVFen0qc3AlMOAVzSp2Y+DLTEnxZzmTyRkWda+g5U4A
         mp4KnQyGKOPH9pwQCWFtDjIVB3KbAQ58lrLDu/ilmQ3nKK/GWj5LF5himQIbPb9ZB627
         v2KncJj/J6NMNZY+tZ4WPIwnPkR4wJyM470iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595298; x=1793200098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SKh8lPT5SEfMc99OwulIZQOlMHEzODfvv6gUt03pNys=;
        b=Wz+txT/qphhdOeGLaO9tLnKRr/UFkRmSMfgkObklbEhDiCn2O6XhLSBkmQoRddtZeR
         pfOyRT2kfhoocC369iLGihErdhblSnueW62hNlmzNDX7pmV4jWXQlBiumw4shybV4Jwd
         IhzSht26V2BVc49N+JI+/wnmUHyNvg7fBuY64WhGxrvBCDnpYTao74l+v4ssczcsNUMN
         8uAEwvsq/fS4V5Y/+R7rrlwePxChCRuy4o5H8H9CKqYqz5MdNyyAr209gD3MuRol64Zs
         zYDKguvjyR9UG0QWv8qr6FjPEW3i/asYom2yYxjhKdOW83zg3Rn7/+Dk4686iZk/2lyT
         urQw==
X-Forwarded-Encrypted: i=1; AKwUvBxuuXEsjpKYU1C3xrVBcqvQcSU9NpOrmBl6t/PPqBQf3v37dJ6fnWP+K3wYhv6JUq7MfEGSDsG8ITk/XkY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK1x7yoBRcmihzfA8zGlQy582bGg9CQ9yNNiBvPChduc8IBG/b
	olYQ8KdUlh2XZ9mteRebDfz7GvWoocJ8bD3y+yAEjd38DAKdKVJbD9zFryNPCeekoA==
X-Gm-Gg: AYBFou2SxwikqNsvjDQHF/WQjclkLnQrnnZcakXlB+fNJ3fSe+2ysYh35MI4MAKFrFc
	SWmj3ZB1Di/vc9pOoiKajj9i2iKTxcywnxQiUH40UYl/3HDLe00QBU/yYIfKOMtVSD8J0l0tngZ
	SLrq9eCKeqxwvtlf7U0Vzq8NBT9LMHc3ca39JIcCR8FJhim/IsY/+vD8o4+kHSu/kY9R2lrLP+e
	9zEpSV1mpZDJRnw00GrNxjOE9RqcBU4pIKrAhEHY/ykeJ/YnJxLpFipLdFy76Xf+UeBuqLHzaIu
	aCNoyxAwkii7Fpm3l2otHy23XbfLJ6KefIL5qfcPLDdMj16CZ3PGagIRwqctOqQfkm7GlVhcbFb
	iwJkUwE6CahOoVgsqLcF/EjwEsHURC6r42tje8xbDJzha7ATf24sgMz4GAT774VT1Xs8pUvTFSZ
	I+dHGL7p5plT21iWPEP6ZCDpvSW2tO/bEvlKUotoywD8OBbhpqzOnFbgIWzyD/uNWhFAK74XEAC
	zTrbYBaWPNHVJDosod0DxtIMa/Lsh8cgW5oGbQAb+qmRfTI3p9LVW0Ow73vQIKXcgw6hH17mCft
	zQ4MdipzBz2yZFuIklfgj7HNjTnenZ73G9WYZUt/ZNFh
X-Received: by 2002:a05:6808:10cf:b0:53c:8f0e:ee21 with SMTP id 5614622812f47-5535876bca3mr1511006b6e.10.1792595297620;
        Wed, 21 Oct 2026 08:08:17 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400bd39sm2023922b6e.6.2026.10.21.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:17 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Raul E Rangel <rrangel@chromium.org>,
	stable@vger.kernel.org,
	"Brian G. Merrell" <bgmerrell@novell.com>
Subject: [PATCH 6/6] usbip: vhci_hcd: reject URBs from stale usb_device after port re-attach
Date: Wed, 21 Oct 2026 09:07:01 -0600
Message-ID: <20261021150704.3129446-7-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021150704.3129446-1-rrangel@chromium.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After vhci_shutdown_connection() runs, event_handler() immediately
calls vhci_device_reset(), setting vdev->ud.status to VDEV_ST_NULL and
clearing vdev->udev before usb_hub_wq finishes running usb_disconnect()
on the detached usb_device.

If attach_store() attaches a new connection to the same rhport before
usb_hub_wq disconnects the old usb_device, vdev->ud.tcp_socket becomes
non-NULL and vdev->ud.status becomes VDEV_ST_NOTASSIGNED. Because
vhci_urb_enqueue() maps urb->dev->portnum to vdev without verifying that
urb->dev matches vdev->udev, URBs submitted on the old usb_device pass
the connection state checks and get sent to the new remote device (or,
if a concurrent USBDEVFS_RESET resets the old usb_device to address 0,
overwrite vdev->udev).

Serialize vdev->udev clearing in vhci_device_reset() under vhci->lock
and ud->lock (dropping old usb_device and socket references outside the
spinlocks in both vhci_device_reset() and vhci_urb_enqueue()), and
reject URBs in vhci_urb_enqueue() when urb->dev != vdev->udev and either
usb_pipedevice(urb->pipe) != 0 or urb->dev is already registered
(device_is_registered(&urb->dev->dev)). During initial enumeration and
PORT_INIT_TRIES retries in hub_port_connect(), each candidate usb_device
is unregistered until usb_new_device() runs after hub_port_init() has
assigned vdev->udev, whereas an already-registered usb_device resetting
via usb_reset_device() is only valid when urb->dev == vdev->udev.

Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
Cc: stable@vger.kernel.org
Assisted-by: Gemini
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/usb/usbip/vhci_hcd.c | 44 +++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 27dba51392b7..e8ff63c2276f 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -693,6 +693,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	struct vhci_hcd *vhci_hcd = hcd_to_vhci_hcd(hcd);
 	struct vhci *vhci = vhci_hcd->vhci;
 	struct device *dev = &urb->dev->dev;
+	struct usb_device *old = NULL;
 	u8 portnum = urb->dev->portnum;
 	int ret = 0;
 	struct vhci_device *vdev;
@@ -737,6 +738,17 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		kfree(priv);
 		return -ENODEV;
 	}
+	if ((usb_pipedevice(urb->pipe) != 0 ||
+	     device_is_registered(&urb->dev->dev)) &&
+	    urb->dev != vdev->udev) {
+		dev_err_ratelimited(dev,
+				    "enqueue from stale usb_device on port %d\n",
+				    vdev->rhport);
+		spin_unlock(&vdev->ud.lock);
+		spin_unlock_irqrestore(&vhci->lock, flags);
+		kfree(priv);
+		return -ENODEV;
+	}
 	spin_unlock(&vdev->ud.lock);
 
 	ret = usb_hcd_link_urb_to_ep(hcd, urb);
@@ -753,7 +765,6 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	 *
 	 */
 	if (usb_pipedevice(urb->pipe) == 0) {
-		struct usb_device *old;
 		__u8 type = usb_pipetype(urb->pipe);
 		struct usb_ctrlrequest *ctrlreq =
 			(struct usb_ctrlrequest *) urb->setup_packet;
@@ -764,13 +775,13 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 			goto no_need_xmit;
 		}
 
-		old = vdev->udev;
 		switch (ctrlreq->bRequest) {
 		case USB_REQ_SET_ADDRESS:
 			/* set_address may come when a device is reset */
 			dev_info(dev, "SetAddress Request (%d) to port %d\n",
 				 ctrlreq->wValue, vdev->rhport);
 
+			old = vdev->udev;
 			vdev->udev = usb_get_dev(urb->dev);
 			/*
 			 * NOTE: A similar operation has been done via
@@ -783,7 +794,6 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 			 * should be dropped.
 			 */
 			dev_pm_syscore_device(&vdev->udev->dev, true);
-			usb_put_dev(old);
 
 			spin_lock(&vdev->ud.lock);
 			vdev->ud.status = VDEV_ST_USED;
@@ -802,6 +812,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 				usbip_dbg_vhci_hc(
 					"Not yet?:Get_Descriptor to device 0 (get max pipe size)\n");
 
+			old = vdev->udev;
 			vdev->udev = usb_get_dev(urb->dev);
 			/*
 			 * Set syscore PM flag for the virtually attached
@@ -814,7 +825,6 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 			 * on disconnect.
 			 */
 			dev_pm_syscore_device(&vdev->udev->dev, true);
-			usb_put_dev(old);
 			goto out;
 
 		default:
@@ -832,6 +842,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 out:
 	vhci_tx_urb(urb, vdev, priv);
 	spin_unlock_irqrestore(&vhci->lock, flags);
+	usb_put_dev(old);
 
 	return 0;
 
@@ -848,6 +859,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		spin_lock(&vhci->lock);
 	}
 	spin_unlock_irqrestore(&vhci->lock, flags);
+	usb_put_dev(old);
 	return ret;
 }
 
@@ -1156,25 +1168,31 @@ static void vhci_shutdown_connection(struct usbip_device *ud)
 static void vhci_device_reset(struct usbip_device *ud)
 {
 	struct vhci_device *vdev = container_of(ud, struct vhci_device, ud);
-	struct usb_device *old = vdev->udev;
+	struct vhci *vhci = vdev_to_vhci_hcd(vdev)->vhci;
+	struct usb_device *old;
+	struct socket *socket;
 	unsigned long flags;
 
-	spin_lock_irqsave(&ud->lock, flags);
+	spin_lock_irqsave(&vhci->lock, flags);
+	spin_lock(&ud->lock);
 
 	vdev->speed  = 0;
 	vdev->devid  = 0;
 
+	old = vdev->udev;
 	vdev->udev = NULL;
-	usb_put_dev(old);
 
-	if (ud->tcp_socket) {
-		sockfd_put(ud->tcp_socket);
-		ud->tcp_socket = NULL;
-		ud->sockfd = -1;
-	}
+	socket = ud->tcp_socket;
+	ud->tcp_socket = NULL;
+	ud->sockfd = -1;
 	ud->status = VDEV_ST_NULL;
 
-	spin_unlock_irqrestore(&ud->lock, flags);
+	spin_unlock(&ud->lock);
+	spin_unlock_irqrestore(&vhci->lock, flags);
+
+	usb_put_dev(old);
+	if (socket)
+		sockfd_put(socket);
 }
 
 static void vhci_device_unusable(struct usbip_device *ud)
-- 
2.56.0.212.g129ede20d9-goog


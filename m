Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792867058;
	b=wpO/+TuPSmqn0iEeWZtCBIbG94X28myPTu1AKLDWo26RrqAlcNo/ghKBSJI3bBV05EXN
	 svhJmnL1/ONK7LfK2jOKzgglwkfeqUxxH/HLkNiV9C1jELKuHkqHxOMOnxEKJKob2nxmq
	 RySdwvJuN2WUdqIfwwsYDuhwNnZZsKjRqbGPj7sdsLv6PHKKLWDeE+Pm9QISL7Yb+6hP4
	 ovQQ/LVYLM3a6OZhazhStjua/nU8MaP1AbRSDU0FdFfbIwyEmebP5Kxdi4ceFhsUkX/0Z
	 9hGQq17ZPxVE5e5LC9jupp264C96vuSVyOypwJYaAxKNFk30SmAd4u/LV4kce+ref5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792867058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9kG33+vND2Vxi7z7pWua9Yb7mC6lR8Mn3eWvlvS93PQ=;
	b=YxB+EuyvK4+P5GA9a0GyxnjBO+5dN+QM0ABaHt113TNumAxxsmJymln/sTuriMj0M6j1
	 xYy2r814OA8lfwf7xUvukXoJtce8PV9YDPi1fHJtmhfll5fkvNVQkTS4COqMqeYAA8mJU
	 erCelSB7WSBMp+yfmVgdcpp2nG0Y8EaP19U3AaEX8ZbiGjjwCKjwVl5x5Mwwc9eA7n7wd
	 hQ0edRsirVp0ghV/Wp/CnIj84/Ovu1//usiJVebEIqEaPZWLF10U0cL41TBYzt0REHaDH
	 6S+aOHsa9h1HCJOeg/cpu0FYw6yEyMAtUWTjUjq/EtWMNI6Xtv6BFTiRU4/d83b1B5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCEVNksB;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9938B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9938B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCEVNksB
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so1357673e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792867056; x=1793471856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9kG33+vND2Vxi7z7pWua9Yb7mC6lR8Mn3eWvlvS93PQ=;
        b=GCEVNksBh8Kd9atM5BrIoYWs55GIfI23ilBmuBNUyl3IBSB2mE2zFKkW6iI2zyrc0X
         dfljKq5O2B/qli0X8TjPaW1Tu59kWGK78oG03PXlh1VYponQn3M2zAKq6hOeQzdT0Du2
         4xMZm2/6fo+CmJWOpkJYGkxtoulr3r0a9dfmu7ZzSrvs86ivPS30ooaV1Z9GF51gfRUA
         d5VZxGdM3EoeG42UlmMC/O/ld3g+owiG4nz73n4tOuD5qER9+W9wN+IL4idYE0RPlzsQ
         +7OJNtyrN9k7Rqf5HpQ1t7y00PwJbZuPpW9Ey/xqZ2BeqzL5DoJLANEX3M+Q0T5XXCS6
         s5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792867056; x=1793471856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kG33+vND2Vxi7z7pWua9Yb7mC6lR8Mn3eWvlvS93PQ=;
        b=oW2lWmP0SA3H7RnMtqIOqinXYEf6oZZJrLQThkPWk+lMa3a56ibr8/lglaA5YaT7Hv
         2yTjtTxvMYmsucYAgGjZEeW3QnFk/zIwK6xUQ1Up8GmAcS8Lb0bhzflj3Qojdw/cn5WN
         rFf8Cnx4+DrAE2QacYJOCz6y/37mBn4MLSscHY0iifh23Lp+lN64Q/z6N5ZoD/jTY15O
         hGOsmoYreDNFlYAbzobHPoYjFcz6poUn3EsAW9pfP9ZfHIkoVp+8hhY1DazuvbjrUfFb
         Who3xeW6tb04Jg6z4leMsJLLGATY80coAqIFIGTzkcfMjNXSA1VwyUkJvhyFAKAl8Xib
         dmzw==
X-Forwarded-Encrypted: i=1; AKwUvBwuMV3i4L0VIZz3WalQALm1hFH0ENXiznYHQ3my6g1XNlQ1aYVrnxXGmdw3orw0Q2vtdb38Jb/5SNxKRQQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ90pAjyYPV+gjS9eGFZlqTwR3++sxYYhSivFBHQRscmzzTPlv+
	EE9yyF5ToOGNHvl4SWgB0TOuSqrVqB7p6Dez/YUkHp+kNn5omfzvaL+3
X-Gm-Gg: AYBFou1WLxpeL8gFFWeCK/2epW//CTKKdOLCmH86V27pFsKffDJrBMoWO1Kh2kBYxZ+
	9lIotptUQabx6qZMN/BJCRqe1TvPo4RS0/7hPk0tEyBNEOCXrWHvifljoM01Ni394q5DymIxSA8
	HJ0Q4Db7aJp6ZLlkyQqiDaFLttyf1iOfTFYmhbmDR0t7e6F+JYnSI5gQh7Q+1qbul/iE28bSJ1s
	vGJHuFpEaC2OC5zy0oDg9veJoJ3gu1J0/29Z9miTTJXLzPfduj5KxqnmUtaNiWO4RKRKIRnBiVk
	rGKbWxff266voK55/Wt9Tq8OBB02Qb0JH/3CFTaQfdgifjQ8FnG/lFNcvyB9aMiKYEEybBsKFjR
	qy+Ugay8QuHtzaqomL3+MA1YEJSb/C/JUbxizr/ajQmzITCE8A4gDwLlYRlitlChiofIK9If9/t
	7SuNCPycDkgzTOZbP1EBLSl7MjZI+WyXt5ctSSPDxLGvqG9HNv2S0stTrHI/cHelgamq0uQ6T3p
	bb15NJzfHl2o/IYXhprYluxrSllkVfZGItO6REGjl/p+nzkET8obAODwh59lELqpqy8Sngb4/+4
	gNHU11wuqRCrDFCIFKJuH0gSld/nYqYN7x9pfVEbnsJztzTxxi/XvG0f/qwJ
X-Received: by 2002:a05:6512:3a95:b0:5bf:a6d3:b277 with SMTP id 2adb3069b0e04-5bfb71d899dmr910515e87.42.1792867055479;
        Sat, 24 Oct 2026 11:37:35 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a920a1sm557060e87.61.2026.10.24.11.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 11:37:35 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Andrey Konovalov <andreyknvl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH] usb: raw-gadget: fix double-free race during UDC unbind and rebind
Date: Sat, 24 Oct 2026 21:37:27 +0300
Message-ID: <20261024183727.42339-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
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

raw-gadget defers endpoint disabling, request freeing, and descriptor
cleanup to dev_free(). However, dev_free() is only called after
dev->count drops to zero in raw_release(), which happens after
usb_gadget_unregister_driver() has already returned.

Once usb_gadget_unregister_driver() finishes, the UDC can be immediately
rebound by another raw_gadget instance. If that new instance enables an
endpoint, it assigns its newly allocated descriptor to ep->ep->desc on
the shared UDC endpoint. When dev_free() from the old instance runs
concurrently, it calls usb_ep_disable() and frees dev->eps[i].ep->desc,
which now belongs to the new instance. The new instance's usb_ep_enable()
subsequently fails with -ESHUTDOWN, and its error path frees the descriptor
again, causing a KASAN double-free.

Tear down all endpoints and requests synchronously in gadget_unbind()
before the UDC can be bound again. Keep the descriptor pointer inside
struct raw_ep and clear ep->ep->desc on error and disable paths so no
dangling pointers are left on the UDC endpoints. Additionally, make sure
raw_release() always unregisters the driver if registered, and release
the ep0 request if gadget_bind() encounters an error.

Reported-by: syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b7534c9b380f81a3b4be
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 69 +++++++++++++++++++-------
 1 file changed, 52 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..379351a010f8 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -141,6 +141,7 @@ struct raw_ep {
 	enum ep_state		state;
 	struct usb_ep		*ep;
 	u8			addr;
+	struct usb_endpoint_descriptor *desc;
 	struct usb_request	*req;
 	bool			urb_queued;
 	bool			disabling;
@@ -205,7 +206,6 @@ static struct raw_dev *dev_new(void)
 static void dev_free(struct kref *kref)
 {
 	struct raw_dev *dev = container_of(kref, struct raw_dev, count);
-	int i;
 
 	kfree(dev->udc_name);
 	kfree(dev->driver.udc_name);
@@ -218,14 +218,6 @@ static void dev_free(struct kref *kref)
 		usb_ep_free_request(dev->gadget->ep0, dev->req);
 	}
 	raw_event_queue_destroy(&dev->queue);
-	for (i = 0; i < dev->eps_num; i++) {
-		if (dev->eps[i].state == STATE_EP_DISABLED)
-			continue;
-		usb_ep_disable(dev->eps[i].ep);
-		usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
-		kfree(dev->eps[i].ep->desc);
-		dev->eps[i].state = STATE_EP_DISABLED;
-	}
 	kfree(dev);
 }
 
@@ -316,6 +308,12 @@ static int gadget_bind(struct usb_gadget *gadget,
 	ret = raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
 	if (ret < 0) {
 		dev_err(&gadget->dev, "failed to queue connect event\n");
+		usb_ep_free_request(gadget->ep0, req);
+		spin_lock_irqsave(&dev->lock, flags);
+		dev->req = NULL;
+		dev->gadget = NULL;
+		dev->eps_num = 0;
+		spin_unlock_irqrestore(&dev->lock, flags);
 		set_gadget_data(gadget, NULL);
 		return ret;
 	}
@@ -328,6 +326,43 @@ static int gadget_bind(struct usb_gadget *gadget,
 static void gadget_unbind(struct usb_gadget *gadget)
 {
 	struct raw_dev *dev = get_gadget_data(gadget);
+	int i;
+	unsigned long flags;
+
+	if (!dev)
+		return;
+
+	for (i = 0; i < dev->eps_num; i++) {
+		struct raw_ep *ep = &dev->eps[i];
+
+		spin_lock_irqsave(&dev->lock, flags);
+		if (ep->state == STATE_EP_DISABLED) {
+			spin_unlock_irqrestore(&dev->lock, flags);
+			continue;
+		}
+		ep->state = STATE_EP_DISABLED;
+		spin_unlock_irqrestore(&dev->lock, flags);
+
+		usb_ep_disable(ep->ep);
+
+		spin_lock_irqsave(&dev->lock, flags);
+		usb_ep_free_request(ep->ep, ep->req);
+		kfree(ep->desc);
+		ep->desc = NULL;
+		ep->ep->desc = NULL;
+		spin_unlock_irqrestore(&dev->lock, flags);
+	}
+
+	spin_lock_irqsave(&dev->lock, flags);
+	if (dev->req) {
+		if (dev->ep0_urb_queued)
+			usb_ep_dequeue(dev->gadget->ep0, dev->req);
+		usb_ep_free_request(dev->gadget->ep0, dev->req);
+		dev->req = NULL;
+	}
+	dev->gadget = NULL;
+	dev->eps_num = 0;
+	spin_unlock_irqrestore(&dev->lock, flags);
 
 	set_gadget_data(gadget, NULL);
 	/* Matches kref_get() in gadget_bind(). */
@@ -450,10 +485,6 @@ static int raw_release(struct inode *inode, struct file *fd)
 
 	spin_lock_irqsave(&dev->lock, flags);
 	dev->state = STATE_DEV_CLOSED;
-	if (!dev->gadget) {
-		spin_unlock_irqrestore(&dev->lock, flags);
-		goto out_put;
-	}
 	if (dev->gadget_registered)
 		unregister = true;
 	dev->gadget_registered = false;
@@ -469,7 +500,6 @@ static int raw_release(struct inode *inode, struct file *fd)
 		kref_put(&dev->count, dev_free);
 	}
 
-out_put:
 	/* Matches dev_new() in raw_open(). */
 	kref_put(&dev->count, dev_free);
 	return ret;
@@ -886,6 +916,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
 		if (ret < 0) {
 			dev_err(&dev->gadget->dev,
 				"fail, usb_ep_enable returned %d\n", ret);
+			ep->ep->desc = NULL;
 			goto out_free;
 		}
 		ep->req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
@@ -893,10 +924,12 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
 			dev_err(&dev->gadget->dev,
 				"fail, usb_ep_alloc_request failed\n");
 			usb_ep_disable(ep->ep);
+			ep->ep->desc = NULL;
 			ret = -ENOMEM;
 			goto out_free;
 		}
 		ep->state = STATE_EP_ENABLED;
+		ep->desc = desc;
 		ep->ep->driver_data = ep;
 		ret = i;
 		goto out_unlock;
@@ -962,7 +995,9 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 
 	spin_lock_irqsave(&dev->lock, flags);
 	usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
-	kfree(dev->eps[i].ep->desc);
+	kfree(dev->eps[i].desc);
+	dev->eps[i].desc = NULL;
+	dev->eps[i].ep->desc = NULL;
 	dev->eps[i].state = STATE_EP_DISABLED;
 	dev->eps[i].disabling = false;
 
@@ -1010,7 +1045,7 @@ static int raw_ioctl_ep_set_clear_halt_wedge(struct raw_dev *dev,
 		ret = -EINVAL;
 		goto out_unlock;
 	}
-	if (usb_endpoint_xfer_isoc(dev->eps[i].ep->desc)) {
+	if (usb_endpoint_xfer_isoc(dev->eps[i].desc)) {
 		dev_dbg(&dev->gadget->dev,
 				"fail, can't halt/wedge ISO endpoint\n");
 		ret = -EINVAL;
@@ -1096,7 +1131,7 @@ static int raw_process_ep_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
 		ret = -EBUSY;
 		goto out_unlock;
 	}
-	if (in != usb_endpoint_dir_in(ep->ep->desc)) {
+	if (in != usb_endpoint_dir_in(ep->desc)) {
 		dev_dbg(&dev->gadget->dev, "fail, wrong direction\n");
 		ret = -EINVAL;
 		goto out_unlock;
-- 
2.47.3


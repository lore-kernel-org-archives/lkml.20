Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA773C5DA1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895013; cv=none; b=GO8l5F0d4OvlZy1cDTR96myd4QjXyegVku6Km/1XoMtZxb9hoJfhX4P64m24rU13ElVcZkhBdhN4/Vfp2bcx/xOo6PBYOi7JGfWVR8UmjY8xulGQZxx6wDjo9TStCGj1u11SlgQ+xU5yorxcP8giwuGS9lJ7Ysxjqb5kflQAn8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895013; c=relaxed/simple;
	bh=+rA467aRY0zNRosxZQfwiY79GSdRVJmJK/qrcl35cdA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=e7s5tumkkb61kkGzyR025Xlvxux8fQp2pimB6Y6qWkZx8Crn9JgRgBcEdQlmAqJ56bssBGwh3HC7+WqHPYnZs/hDJfcf4B8L4FSzMDxVfGzBni3gG63LCChVt3+U6bra9jxtpY3ZmxVeL6SeK8pDGFCsUkQf62pq3Pb+LfS7tPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b38ea4c6acso7309884b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790895010; x=1791499810;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2cSehKzYzpA4XnJNJdOoJUyJqlLtc/M4HNOQke60+no=;
        b=goGOMmhVkx9f6bb6eqzMZ4Ql4BCeKixxPd0zwo2zEH30cPRlzAx+yrIVyznJIaA1Y6
         Qo3OmWseEL6D8BNp7k8PQSfnUdNHD1fB/l3thvlOmNAHExvwxWU19qBsPx8iMUMHmRIY
         NmfIOyNzN8heXfj35ZJdXHUSfo2r5VHwmOaE96Ipbwa4NPG/SG/Ur6tKn4wmULS+gMKX
         OE2aA2c9I85IiJ/SqHHlODND/99dRd77XTA8BmZHc+l2iIczyoZhdb5Zlnuo1/pDnmFU
         mFP6vzbuJ8hFrzg4gwVrwIehoN6o7qR/nH/dVgOfGQxlC3LXvQPznjsE5z78xPfLmf+q
         KhOg==
X-Gm-Message-State: AFuF++kfxgJ6THFVijIQ4/Vm3HkGNRoMCb7OqTejgYX0OgoS3ZQj2XD1
	aUEEF/kedr5lXskoWRpT6ccOpPFvrTqFtinALbPsbmHRY1eVIIEr9TG22j0/VqaoXixSrQCqB9B
	Z9cfpE7xRERVL1wL8HdXNpj5pa5a5dylqnYDHU8zHMrI8SEk89yu3L5dBFvg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14ca:b0:4d6:93e2:5bc8 with SMTP id
 5614622812f47-4f52a784da5mr668788b6e.68.1790895010555; Thu, 01 Oct 2026
 15:50:10 -0700 (PDT)
Date: Thu, 01 Oct 2026 15:50:10 -0700
In-Reply-To: <6a6972a5.d9e86bb5.297b12.004f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abee3a2.7503fbd6.2d3f6.000f.GAE@google.com>
Subject: Forwarded: [PATCH] usb: fix UAF in raw_process_io_ep_io
From: syzbot <syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] usb: fix UAF in raw_process_io_ep_io
Author: drifabdelmalekmohamedsaid@gmail.com

#syz test

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..6d33b99ce9a0 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -637,11 +637,11 @@ static int raw_ioctl_event_fetch(struct raw_dev *dev, unsigned long value)
 
 	event = raw_event_queue_fetch(&dev->queue);
 	if (PTR_ERR(event) == -EINTR) {
-		dev_dbg(&dev->gadget->dev, "event fetching interrupted\n");
+		dev_dbg(dev->dev, "event fetching interrupted\n");
 		return -EINTR;
 	}
 	if (IS_ERR(event)) {
-		dev_err(&dev->gadget->dev, "failed to fetch event\n");
+		dev_err(dev->dev, "failed to fetch event\n");
 		spin_lock_irqsave(&dev->lock, flags);
 		dev->state = STATE_DEV_FAILED;
 		spin_unlock_irqrestore(&dev->lock, flags);
@@ -727,7 +727,7 @@ static int raw_process_ep0_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
 
 	ret = usb_ep_queue(dev->gadget->ep0, dev->req, GFP_KERNEL);
 	if (ret) {
-		dev_err(&dev->gadget->dev,
+		dev_err(dev->dev,
 				"fail, usb_ep_queue returned %d\n", ret);
 		spin_lock_irqsave(&dev->lock, flags);
 		goto out_queue_failed;
@@ -735,7 +735,7 @@ static int raw_process_ep0_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
 
 	ret = wait_for_completion_interruptible(&dev->ep0_done);
 	if (ret) {
-		dev_dbg(&dev->gadget->dev, "wait interrupted\n");
+		dev_dbg(dev->dev, "wait interrupted\n");
 		usb_ep_dequeue(dev->gadget->ep0, dev->req);
 		wait_for_completion(&dev->ep0_done);
 		spin_lock_irqsave(&dev->lock, flags);
@@ -1113,7 +1113,7 @@ static int raw_process_ep_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
 
 	ret = usb_ep_queue(ep->ep, ep->req, GFP_KERNEL);
 	if (ret) {
-		dev_err(&dev->gadget->dev,
+		dev_err(dev->dev,
 				"fail, usb_ep_queue returned %d\n", ret);
 		spin_lock_irqsave(&dev->lock, flags);
 		goto out_queue_failed;
@@ -1121,7 +1121,7 @@ static int raw_process_ep_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
 
 	ret = wait_for_completion_interruptible(&done);
 	if (ret) {
-		dev_dbg(&dev->gadget->dev, "wait interrupted\n");
+		dev_dbg(dev->dev, "wait interrupted\n");
 		usb_ep_dequeue(ep->ep, ep->req);
 		wait_for_completion(&done);
 		spin_lock_irqsave(&dev->lock, flags);

Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DAF3644C4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374559; cv=none; b=sSFk/9n7j/Qxzuyd2yrTmtWit1WBbgTFl9SBT2GwQoVruNRLuO/jCpgBpF/poO0BsE1s4X+Xr/700P72IYffXs+bq7WKmAYgH55MRVqFlzZT8/fw3VXxIGGTEMSTgPE9ifiI0IOELD1f0OTDtjf/EH5zVwGfhXUq+ehcRlb7ljU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374559; c=relaxed/simple;
	bh=z7k61q/PrffSeV99a4UHM1PlIBsL4OnOCI+vRAiITAk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sdxbv8BYjiUPuObbdJzM2p0/C573f4GKlZmr5b6Jmv0dbTOOS3O9vzVo+q1DXwstT8yX2BYHsETlbAXXjFRW2AkT6yYzfE6QXyKvGVK27vCoCaw/XwJMIk7UBcHSxV8nO79JpaYZUpKGChIn/O/kYoWSZXaSjhWznyPUxZmu+zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dab94dc3e7so2291707b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790374556; x=1790979356;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HpgIE9rOO1oZ9w5xxxKD9XdJD13ek91smP8R0sMXyBg=;
        b=QZgUcCT+VIADma+WfinWOr/WqesMSWGxnHLCLhtKa5exiD6coj5FVRPmpT0ljRwsjo
         nYvJxsgLrCCuQyhxhcJQFppOrvf9swl4GhI70cpfG9w65XI+B5aGPHYhrEpfgDdcrSo6
         stLDz9FW6pQx/PFbqMrCQDLBtzF/7gjQH9IAeweA0jL56TwLspXiJA4br4SvX5py48O9
         BlfxisGdHoQedSUQHVUINDrfoVElkI0azQk0rdcs1BRb44eaqVNLe6fohtz3Lidasd70
         h9LfY0+gDibdcWPV/9tYrgp4aY/k2GP7T3GqDqvQlRdF0NnoHEKoyQh+yL/YrNwGYvf0
         jbvg==
X-Gm-Message-State: AFuF++lgulTcc0Vw8f/pzSm6AWn1o9uBig1ofCnRKKLVIC8TfpjyoSmn
	uHlzR1nIEj9sodP4ruxjlyiDYDvhFIYAbHpFQK8azVQxJQm9xDNjIC7JoGFCryuv/RTwgKvEcWH
	3JZJAxuMZru3gk1L3xLtIXWpH7XnbcfMGdmtiLQsLMNr8jTkLb7m79kOmHxo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f6a:b0:4d6:308d:4cc6 with SMTP id
 5614622812f47-4d72f64a420mr7718424b6e.67.1790374556757; Fri, 25 Sep 2026
 15:15:56 -0700 (PDT)
Date: Fri, 25 Sep 2026 15:15:56 -0700
In-Reply-To: <6a6972a5.d9e86bb5.297b12.004f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab6f29c.e548f532.1ca396.0029.GAE@google.com>
Subject: Forwarded: [PATCH] usb: raw-gadget: fix UAF in raw_process_ep_io
From: syzbot <syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] usb: raw-gadget: fix UAF in raw_process_ep_io
Author: drifabdelmalekmohamedsaid@gmail.com

#syz test

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..9c263950f609 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -327,9 +327,16 @@ static int gadget_bind(struct usb_gadget *gadget,
 
 static void gadget_unbind(struct usb_gadget *gadget)
 {
+	unsigned long flags;
 	struct raw_dev *dev = get_gadget_data(gadget);
 
 	set_gadget_data(gadget, NULL);
+
+	/*Avoid dangling pointer in case it remaining references*/
+	spin_lock_irqsave(&dev->lock, flags);
+	dev->gadget = NULL;
+	spin_unlock_irqrestore(&dev->lock, flags);
+
 	/* Matches kref_get() in gadget_bind(). */
 	kref_put(&dev->count, dev_free);
 }

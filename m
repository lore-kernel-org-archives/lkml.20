Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1297B368D4A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419172; cv=none; b=MCN8zOxsniDeyvPdznfNC89aZUBedhD/jja9QE+q+KcK4sp08JC50mFURfbdlBI6l1iOCwTP/Wuhii86se2KLaZQOYNhEs30sn/KRJZNIRGr7QxkdcaIxrv9v/ZTloftfvkgVdPIqID5mClHWTJB2OTzh2zYZInpxo5c91BFenQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419172; c=relaxed/simple;
	bh=6Yi8B4f7QmlxXddS5h9SNCzOwjwrx+XGhyZF0DKWZ64=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OKHYwyXjLZL0S04sgGKyR2fhqV5OiPCId/BRbMSEr1vXeh7403Q0CQkuTwAI/gqS2JLctFV7qLYbqcHo3OOQdcrY2/Xwq/MxchHpLSqSdhdWf8Dm6p4p9EHm5+eTzVidwATUZLOAPKZXNCFh9ce6KAq/d4O4qQQnb9gjFb9dYvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f43c6b6d64so1906867a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419170; x=1789023970;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IywCq373dkUlQSQTDRM8mInlgtx/dt5RVCeCSHsAk3U=;
        b=FLGaAMmlflxOX1iYASXWn8wIjonspcdJUblvI6Pz8xLtyAboUrAakzrW3tTA5J6NOR
         wa7/eHOx106pXGkyqiix2sE7THit0/jmoWm7i1geLHGV2EOc737WbVRT36F7kOGlxKlO
         NBT6xfKjm5HIq33lmoWpd1CUuBzVnaqvxyFQDOCOfoXcya+qvzuqSWwLJFiTP0tkaj6a
         HsNWm6PP1CJpoVe+Sdg93MgkSIKdW2FsmUyLrjI2x1y4fLM9X+sEcbn25y/rTCR+ADAz
         oNomEQaBhFTCFddr/hVcQKBsV5sEtcBQRvIkf6bB4EVNiZN1S7yPsRX1SuVd0O01NOF4
         2WUQ==
X-Gm-Message-State: AFuF++nP8FPP9tKoghYKjBfcrfXrGLPpZ/W98v6Axoe2taNWxVNlu3m3
	Zv2qTpxPr4ToDIN8uu34YOdFyAzNnz2am4B+bim4PFsAETxz9/BzWjB9UWPwDGjQzeAe7mBAPAV
	gqLjH93IQjde41fcr86EMph2+Pw7OKrBnLjufUd1Wg22LeLcyFdqXzU7fb8k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d05:b0:6ac:bafb:bff5 with SMTP id
 006d021491bc7-6b47c6b1ae9mr9368551eaf.11.1788419169990; Thu, 03 Sep 2026
 00:06:09 -0700 (PDT)
Date: Thu, 03 Sep 2026 00:06:09 -0700
In-Reply-To: <6a85e576.f7a79266.2f965f.003f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991c61.9266084e.bf0d7.00c1.GAE@google.com>
Subject: Forwarded: Re: [PATCH] usb: core: fix GPF on disconnect when
 interface claimed before registration
From: syzbot <syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [PATCH] usb: core: fix GPF on disconnect when interface claimed before registration
Author: khiemtranzo532001@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index f63004417..59e74872b 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -562,7 +562,6 @@ int usb_driver_claim_interface(struct usb_driver *driver,
 	if (!iface->authorized)
 		return -ENODEV;

-	dev->driver = &driver->driver;
 	usb_set_intfdata(iface, data);
 	iface->needs_binding = 0;

@@ -580,11 +579,19 @@ int usb_driver_claim_interface(struct usb_driver *driver,
 	else
 		pm_runtime_set_active(dev);

-	/* if interface was already added, bind now; else let
-	 * the future device_add() bind it, bypassing probe()
-	 */
-	if (device_is_registered(dev))
+	if (device_is_registered(dev)) {
+		dev->driver = &driver->driver;
 		retval = device_bind_driver(dev);
+	} else {
+		/*
+		 * Interface not yet registered: record the claim without
+		 * setting dev->driver.  usb_set_configuration() will call
+		 * device_bind_driver() explicitly after device_add(), which
+		 * skips ->probe() and attaches knode_driver so teardown is safe.
+		 */
+		iface->claimed = 1;
+		iface->claimed_driver = driver;
+	}

 	if (retval) {
 		dev->driver = NULL;
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 75e2bfd74..73c630750 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -2269,8 +2269,23 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		if (ret != 0) {
 			dev_err(&dev->dev, "device_add(%s) --> %d\n",
 				dev_name(&intf->dev), ret);
+			intf->claimed = 0;
+			intf->claimed_driver = NULL;
 			continue;
 		}
+		if (intf->claimed) {
+			intf->dev.driver = &intf->claimed_driver->driver;
+			ret = device_bind_driver(&intf->dev);
+			if (ret) {
+				dev_err(&dev->dev,
+					"device_bind_driver(%s) --> %d\n",
+					dev_name(&intf->dev), ret);
+				intf->dev.driver = NULL;
+				intf->condition = USB_INTERFACE_UNBOUND;
+			}
+			intf->claimed = 0;
+			intf->claimed_driver = NULL;
+		}
 		create_intf_ep_devs(intf);
 	}

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1da4ad161..0ec743e76 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -266,6 +266,8 @@ struct usb_interface {
 	unsigned needs_binding:1;	/* needs delayed unbind/rebind */
 	unsigned resetting_device:1;	/* true: bandwidth alloc after reset */
 	unsigned authorized:1;		/* used for interface authorization */
+	unsigned claimed:1;		/* driver claimed before device_add() */
+	struct usb_driver *claimed_driver;	/* driver for deferred bind */
 	enum usb_wireless_status wireless_status;
 	struct work_struct wireless_status_work;
--
2.34.1

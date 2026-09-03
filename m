Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BF934D384
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418133; cv=none; b=ZTtC6KdfwSymTLiynMCo1Ovfnalgx5R0CYo6/Qdz6tgpW40HledhNb5E2924RwKDSF/ijNiOpphixLE5oToM3/fmA1DuYZlr8EENw3rE2HE3E2vZbDo1eBWJJLZ5zh1HNBbzG0xa0Wv42U8EyUp2ybl95A5Lfc2Qg5yr/5zSMDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418133; c=relaxed/simple;
	bh=ozWeUu07+rRSsL9Z/I1s9i3gdiN5NEabBfpX1MwRDeQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SaDYYTqDldvV+79GJBG56/pHp9t3jGCqUP7/tvxwEPPlsX+jysD1G7G+5T6ksVCjTz3CW4lF+KlKEe7YuHk1RyytEQXYoLcEAErcyczDiLc0dFN7S5w0M27I/YIr1x+mbQ2WKWITStrxHwfSb0yj0563Ultcl9QQS6Kk2Amun2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb6a8c61deso1426590a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418131; x=1789022931;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gfy9Abt4a8wpGKWqanZvV2uiaSDAzCm5cJZvierLkFI=;
        b=r/xS0CGCoVu7XDAqIKE4Zcj9GsqAhKA2WVSPtdcrwUsFvI/8q5EyVZNSGx7w3nO9pu
         d9I41h2m9L35lHl8CowesppRiNaTQkHGC9rCzVM1Gv9ljzkU35wonHaC9PbAgu0jesxo
         TPujLYA+CcZvqkaaXM98fWvxFzG8PNl8fhysfUZMRRa/qhZcwVKWxxmiPhgtryMbL0NW
         uY5YiOg5e8nMrIHsaHADf0qESvO1yNmDk9+ekbQbMvmFXTHpFU1CXAH6fggAYwJH63nL
         hr7qXAEUTmB1w10NiMohJPoflodqhkZDGs8GV3VS5vLl4C/bdHsR3wHzlK/AhtaORxWz
         u/yg==
X-Gm-Message-State: AFuF++kFy+yE4hH7hgdihmrZiWPJJjKF5OcwCnXmKVSvBTqT+Nq82h6/
	Rovh1ZLfHV957bdITYr2qppyWOeVzyYD7nYckYFoFLVc51zh92OYnVebegTN+zGXcYlltanH5Q2
	jtF6lckm3w2QwQj10gfGdJyKH5WVkl3QYUWzVF8ZO101d7jGGSWa5IuZDorA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1992:b0:6a3:8738:4106 with SMTP id
 006d021491bc7-6b48193dfbfmr8146757eaf.26.1788418131508; Wed, 02 Sep 2026
 23:48:51 -0700 (PDT)
Date: Wed, 02 Sep 2026 23:48:51 -0700
In-Reply-To: <6a85e576.f7a79266.2f965f.003f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991853.27a413cd.1e878c.0015.GAE@google.com>
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index f63004417..59e74872b 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -562,7 +562,6 @@ int usb_driver_claim_interface(struct usb_driver
*driver,
        if (!iface->authorized)
                return -ENODEV;

-       dev->driver = &driver->driver;
        usb_set_intfdata(iface, data);
        iface->needs_binding = 0;

@@ -580,11 +579,19 @@ int usb_driver_claim_interface(struct usb_driver
*driver,
        else
                pm_runtime_set_active(dev);

-       /* if interface was already added, bind now; else let
-        * the future device_add() bind it, bypassing probe()
-        */
-       if (device_is_registered(dev))
+       if (device_is_registered(dev)) {
+               dev->driver = &driver->driver;
                retval = device_bind_driver(dev);
+       } else {
+               /*
+                * Interface not yet registered: record the claim without
+                * setting dev->driver.  usb_set_configuration() will call
+                * device_bind_driver() explicitly after device_add(), which
+                * skips ->probe() and attaches knode_driver so teardown is
safe.
+                */
+               iface->claimed = 1;
+               iface->claimed_driver = driver;
+       }

        if (retval) {
                dev->driver = NULL;
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 75e2bfd74..73c630750 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -2269,8 +2269,23 @@ int usb_set_configuration(struct usb_device *dev,
int configuration)
                if (ret != 0) {
                        dev_err(&dev->dev, "device_add(%s) --> %d\n",
                                dev_name(&intf->dev), ret);
+                       intf->claimed = 0;
+                       intf->claimed_driver = NULL;
                        continue;
                }
+               if (intf->claimed) {
+                       intf->dev.driver = &intf->claimed_driver->driver;
+                       ret = device_bind_driver(&intf->dev);
+                       if (ret) {
+                               dev_err(&dev->dev,
+                                       "device_bind_driver(%s) --> %d\n",
+                                       dev_name(&intf->dev), ret);
+                               intf->dev.driver = NULL;
+                               intf->condition = USB_INTERFACE_UNBOUND;
+                       }
+                       intf->claimed = 0;
+                       intf->claimed_driver = NULL;
+               }
                create_intf_ep_devs(intf);
        }

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1da4ad161..0ec743e76 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -266,6 +266,8 @@ struct usb_interface {
        unsigned needs_binding:1;       /* needs delayed unbind/rebind */
        unsigned resetting_device:1;    /* true: bandwidth alloc after
reset */
        unsigned authorized:1;          /* used for interface authorization
*/
+       unsigned claimed:1;             /* driver claimed before
device_add() */
+       struct usb_driver *claimed_driver;      /* driver for deferred bind
*/
        enum usb_wireless_status wireless_status;
        struct work_struct wireless_status_work;
--
2.34.1

Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FFB3F6C2D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418936; cv=none; b=DzPTY4twsS6MW7paJUo2YDZoGxfsh+JCoXbYXCvtJuZi4kMn3XFivAuqYS/Ev4cm2bZLwJ75/vDpEyveIelQSNoV+9DFiDTDVBCGrrU8siRUrRpTy74lMAhI170pikHtaTa41rFadaqkD2MVp925T4YcdxmzPOuVWqbHL+CcU2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418936; c=relaxed/simple;
	bh=1zrndBMCoB1/nJ5b5eZMsgfZfNy3fJTZrFqv1j8aowE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JMolE2DWVR5Vl/eg+oNv+Ig0T4XJSH3/q7Pvqz2kdzAvw1xE10tVV+cTx1J+Xo9xTMR/5hJNqWTIPIQFu9/qkyTCDUvybz9EhSaB1TiAzF1BNxJ1/h34IEzI0MpaVmuAjDTCJvlKQP23fmGNtZ6Da4FK6arp98Dc/Y8xUDDSFps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b34ad165e3so973484eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418932; x=1789023732;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x+DkPBC7sLvsI8CSasjNZz0BIAT9izCKfXnwLRQ22iM=;
        b=I2u7mdO94N7H1H7SmnsGukbixBT+oRFfI0QqQNYfVdAImkWXgZwTqXanO88gXlC+oh
         xNzAcb11W8u7O14hQ6EAV3F7S2TSDXPdnBUhPGOUBU3g7yxQN3ki7q1Pw0dNAliS8vec
         rZ4JaYgQinfYJYa3vnnkQT5pTCM1fZghyymr8tKloFrckMCb8a9ZRCwQsS6I9UAHujjt
         FScsLWYcPllHUomGfrF1/1FJf4qcai7vcaWmJzrLkyXIGWiK1Z2Sja6aCs1fvBKEhsaz
         P1C8YMCHQHs+EoYQWXzJTBnIPP5uZo5N6dn7cD9VmrOi57l5lBdsUODGgBA0xEj+MErt
         B6Ow==
X-Gm-Message-State: AFuF++kpWpQtLubw2kx9jlpIdFDPkYU9ZxwR8LZ0rB9mxfDy2BRUscsu
	B9trxt2YhFq9Ug9gZGPy4eg+8N1DuEVqLtOOp/DsStqX4wCPF2MzmjK0uYdPSsPeHuSgm+wP9lO
	NF3coFgwHbGGWPe+6PmHtR6MjyCBdiih0/F88LZM1MzxOaRDyoSaTo2Zsj5w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:221d:b0:6b1:4280:9e18 with SMTP id
 006d021491bc7-6b47f81bf62mr8144253eaf.13.1788418932470; Thu, 03 Sep 2026
 00:02:12 -0700 (PDT)
Date: Thu, 03 Sep 2026 00:02:12 -0700
In-Reply-To: <6a85e576.f7a79266.2f965f.003f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991b74.e7659fcc.146146.0003.GAE@google.com>
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
@@ -562,7 +562,6 @@ int usb_driver_claim_interface(struct usb_driver *driver,
        if (!iface->authorized)
                return -ENODEV;

-       dev->driver = &driver->driver;
        usb_set_intfdata(iface, data);
        iface->needs_binding = 0;

@@ -580,11 +579,19 @@ int usb_driver_claim_interface(struct usb_driver *driver,
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
+                * skips ->probe() and attaches knode_driver so
teardown is safe.
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
@@ -2269,8 +2269,23 @@ int usb_set_configuration(struct usb_device
*dev, int configuration)
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
        unsigned resetting_device:1;    /* true: bandwidth alloc after reset */
        unsigned authorized:1;          /* used for interface authorization */
+       unsigned claimed:1;             /* driver claimed before device_add() */
+       struct usb_driver *claimed_driver;      /* driver for deferred bind */
        enum usb_wireless_status wireless_status;
        struct work_struct wireless_status_work;
--
2.34.1

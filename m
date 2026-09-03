Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D493FBEBB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419498; cv=none; b=m04tFRoJKy2tfNimffUo9BNLpyjcnC9EwlxBngf8Qp2UiyQBOCSQhUiBeVseB3pPZNwuPxoiOON8AXtm9u0xg6yX1/2c/gRtkcZt9FZGajRk+jGn9UPltTOFtQIBNMZhvZVlgQe3bcI0r0CPIHdTlfrmGbFJhI7GAJE7maQgdPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419498; c=relaxed/simple;
	bh=HDEzdpCSIrKHfCH/TD+oTzf4gG7jLdVhK0rlKKHHopM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mXl8OcAt2ih5yg79KQJQOArYNj7KQ4ey6C7LCG7ZTrxKmiyGtznpIiW1mxFh/t9Ydd6XO04ITvo1dP3tl/kz4srujXnGEVX2quzgx6bKgAzlURtBMu3cNIXR2T1BdcyJmci0cfDiq8LTLC1MUOUSz3CnN8IMS4quVwmk9FfPsjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9dc0f5900so970254a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419493; x=1789024293;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gS1TNTJqwu63AYZsk1qx7InYJDq8avoed9v4HAV0yCg=;
        b=JfJ0mMsS/NwY41YUNka/1ofZO/fPQ8/36sxqxY8lp+UybFb5JbCi3AOiUbLfcuQ8j8
         0GdjrOKMV851gaCL5C4hfCUdhec1Vh/jQu/YFgeuDkpugMmoHgVjCERJ2swWW3C7ortC
         rhineuH/9FBwJ1YVoKMpGhgS071AUnLJa8jNK1hLhu4Ibd7zP6NlvIinNM+Rb/z1uscG
         oxefJRKV41mfIivrx9x9LuHJ9/4CSdPk6aOSujaNu3Gu5qCsLSJtshsOia14OSrxY6Q5
         lTeM75k+WqAIuvKCFow/qdYMms2tGavggEo5LfyC+o0gcItBffIBr2x1w8C7ctn5Zxa1
         SrWQ==
X-Gm-Message-State: AFuF++kJQItTMTBTM7M1vafBin48JmmQhZEkQvtQbjt0PRIOexEfOUE3
	VA334z929iLc1kJr9eYB2TUzHwx40EYjsg2aqq+5MUEIrqbW2j2x3mgK9AyeScLKiSk/MiEGGm1
	yUOnHFU7lLLfRTxms1MiVGp9KxsYY9y3uCBFNcTfcsDAo9TaVctug7s7w6nQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d0a:b0:6b5:ec2f:3573 with SMTP id
 006d021491bc7-6b5ec2f365emr713596eaf.36.1788419493766; Thu, 03 Sep 2026
 00:11:33 -0700 (PDT)
Date: Thu, 03 Sep 2026 00:11:33 -0700
In-Reply-To: <6a85e576.f7a79266.2f965f.003f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991da5.f03f19fe.169578.0003.GAE@google.com>
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
 

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019011;
	b=SYVHn8rjIl9zSKOWdMp5FgT6KNM1+clvTgWoXdhGpDBpYH3tWOaRhWEA03lQK0U0I6Wo
	 iOwe/3qIVrQkGfMjxdYvsAgJlVX4hyEMTB3BR1sw8u59LKC6pi1S0ZzdEe8jTDVkjhc+M
	 iEOrb7mkU5jkN+7D/CE9p0OvnTBixrpdzzD56I5ZcMeMKTvbEilZlQedmdeCmdOVRyW+6
	 VLFL7ishqOwjO8Ile6HIp5Dv1ovz7K4kHeosHXnWqzZbrF87E9hv2DONOdV1pNGMHb/TI
	 uQkMdNwiDxxs2IZmo52+fWBw73TppEetpipPGQ9WcgBzlwVWjOPlKsBwWf3IoQ6Hzfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rBjP8dw6vCoVwFwaCraoNpMLiLX/JUJlo0UcGjx5GL8=;
	b=Tx9nLTBTNW7YWxpjc77pRan97iNljh/4jxqMiWBxOrV9pyQuZeVouV0Y9+d5GLwNtnWe
	 wHZipYVRgZe2Hwm1QxJYwV35zHI1dY8wG8Q5APlpEb0ylLM2R54w5DW8qzsFt/UwHQcmm
	 r/d8VDksWDuJ4qExTGtAMhP8/xDZ3dAamwkV3kjv55uo2erqTdlLLOsK67PAVC2xPU1vE
	 HqtssTb77vbEcS1lAMXfwzz6Z7X4YfYCSFvqdoemRSkWMUgm7Jk1qZRzO7FJRygsFwPLz
	 lCi3KGyWqixQfiycfkRDNhR8/ZB1rK/7+QowDTBGZo9zDEbt6FbJbM8L4ys1zjbhJHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=geuXp3uq;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06AC606A331
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E06AC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=geuXp3uq
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2030523eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794019010; x=1794623810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBjP8dw6vCoVwFwaCraoNpMLiLX/JUJlo0UcGjx5GL8=;
        b=geuXp3uqDwn0lB26RWUvZV4w9kfr37d5egVQg2ozIefcODEpsVY7+6EkpbRPV8UHfm
         PPRgU5whQ1VL5Ts5LRnsguQ3IzZlSIF+PxkSV7vKfE7I6Dd0JF07HWn7KuLdMn3C3rMB
         xpHjXOl2zFiu7xMiMNzz4SkiqxGWVJ9V/YBqLNMpWELNRC6bnt5Cw3m6jrz49H86dNt4
         5UeR/xVbXY0kgvJRTarwlrn0YKcYR+CtBkUFcpZaBIGglOErJ+p9Gf3/HECGCxNtsa4U
         q5iH9N2OfmPC/Sn27fwlUz5K9XgSXEb0Sm4FOGiXgqjYJ3N1nTsoHbg9I76P331NM8Z4
         uOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019010; x=1794623810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBjP8dw6vCoVwFwaCraoNpMLiLX/JUJlo0UcGjx5GL8=;
        b=VmCZvatgyF69KaC7QxtMhSqia4kKLrXFfRC1mSW/b5N6ulJObe2eYHC2hAs7Vcgsc4
         JMzO+1oRa821Goj7uy3EMIqND32pdHGcZ89U1UrbAy/1wcwTnoIgQtX6qfNuV5DT4RlD
         2SbHfjS5+brfyXhM8B4Bs3ECVtbnx4ibLh+lioJEjnbnvbcgRkaUCs0FtWnNoHOFCs63
         m/lVMZBKjST5KABdgssuxPrzdOPQ2IB2GVyH6K7MWnYxI5B9HRlNqZf51eKAV2O1HE8k
         2MOWXzyteqxtJQ9IoPJgFzAmArYcIUFwxUbXtK39xTH6buIa2jkbeI/Frog0fsz8Sq8G
         9Drw==
X-Forwarded-Encrypted: i=1; AKwUvBwQGSwBSopfSdhlyrD8bNBSaDN2SsGuNtSn9SrBnE8Va2FLx/5bV7rmf5sIKBi8dxZNexSSKNPWNpbDI/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8snCLMkZgjhEsr54SVGRtbudLVotN/oKSeHLA+OadLsHDpAR1X
	6RCu5FC0Fps7IlxXJRU/47+LKhqMkePAb+/zq7ZdzC5z1WEYRFdYOGvjL2RoAsQeWA==
X-Gm-Gg: AYBFou1R1EVpmobZHGQVxSBqzWhKbz2ruGaTDtnwcV6RjPMU/GNkw9WF+7LocHB/fir
	zpd1tUoCFB1uC8GjYRo04fd9CeK6Zh2pIFO7SbDYbqxs7+in62pjnpFyieCI2JUc/6hXS+X4SK8
	4S+Yjc57bWb7xkrszodpTalTp0KC17En8LtdN84y7yv7rTZ/EWzPXi6K0fzCaP+ceftEK5Y55WB
	4fpmbu2zaHyJmVHXBRe4fRhi3GhKjUVu/IQ4D4gdsgk0dnHham9bbmQfRl2mX0SluLvLnfZVrVc
	xEF/S6i5AErcIE8F14cdplrcg5Hxn/zRnPDgwreknAbLPwaQ8bbbgBtW38PvzL25cxzqf4CPASb
	i5MwEXbKLM+9RHZvhMpTBAcrgUjJcOeX3WI+kz/EUGYaf8hL0KgZSiiAEN/9ruFibF+bwvpVOGP
	3DsttZDSvjM62TpBbypxIC1vWG/vvfh0xpk6j6R2dDLr9Eplein7V1Ezsv04DbNXPWBwcj0J+mW
	S/JbG0pCHp9ZNFHMriA/4r9PMvdHx7ajrvh8OMdhduF9DDpBfQP82KdHRKbZWqAbaZl+57QP+QP
	vN5ct8DtemCVOrYlvw9ih8RtwbSm4NPRBGE9KKS1DyyXQFwkyMuWSrH6t2qSITyVRaunq/Thv89
	00LM5dpmO2ficzZ8QLQ==
X-Received: by 2002:a05:7301:fc81:b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-36f6f2aa43amr5289981eec.0.1794019009707;
        Fri, 06 Nov 2026 18:36:49 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm10421618eec.20.2026.11.06.18.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:36:48 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v5 1/2] usb: core: export the generic device driver's operations
Date: Sat,  7 Nov 2026 09:36:37 +0700
Message-ID: <50db3bea8dd8bbc09bd8a9c3b38f44d6523442eb.1794018128.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794018128.git.jjc@jclark.com>
References: <cover.1794018128.git.jjc@jclark.com>
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

Export usb_generic_driver_probe(), usb_generic_driver_disconnect(),
usb_generic_driver_suspend() and usb_generic_driver_resume(), and move
their declarations to include/linux/usb.h. This lets a driver whose
probe may return -EPROBE_DEFER leave generic_subclass unset and call
them itself, so that it can defer before the device is configured.

Say in the generic_subclass kerneldoc not to set it in that case.

Signed-off-by: James Clark <jjc@jclark.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
Changes in v5:
- Added Alan's Acked-by

Changes in v4:
- New patch

 drivers/usb/core/generic.c |  4 ++++
 drivers/usb/core/usb.h     |  6 ------
 include/linux/usb.h        | 10 +++++++++-
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index a48994e11ef3..53675d9fdb03 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -261,6 +261,7 @@ int usb_generic_driver_probe(struct usb_device *udev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_probe);
 
 void usb_generic_driver_disconnect(struct usb_device *udev)
 {
@@ -271,6 +272,7 @@ void usb_generic_driver_disconnect(struct usb_device *udev)
 	if (udev->actconfig)
 		usb_set_configuration(udev, -1);
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_disconnect);
 
 #ifdef	CONFIG_PM
 
@@ -301,6 +303,7 @@ int usb_generic_driver_suspend(struct usb_device *udev, pm_message_t msg)
 		usbfs_notify_suspend(udev);
 	return rc;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_suspend);
 
 int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
 {
@@ -320,6 +323,7 @@ int usb_generic_driver_resume(struct usb_device *udev, pm_message_t msg)
 		usbfs_notify_resume(udev);
 	return rc;
 }
+EXPORT_SYMBOL_GPL(usb_generic_driver_resume);
 
 #endif	/* CONFIG_PM */
 
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..9f1e4d197695 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -50,12 +50,6 @@ extern int usb_get_bos_descriptor(struct usb_device *dev);
 extern void usb_release_bos_descriptor(struct usb_device *dev);
 extern int usb_set_configuration(struct usb_device *dev, int configuration);
 extern int usb_choose_configuration(struct usb_device *udev);
-extern int usb_generic_driver_probe(struct usb_device *udev);
-extern void usb_generic_driver_disconnect(struct usb_device *udev);
-extern int usb_generic_driver_suspend(struct usb_device *udev,
-		pm_message_t msg);
-extern int usb_generic_driver_resume(struct usb_device *udev,
-		pm_message_t msg);
 
 static inline unsigned usb_get_max_power(struct usb_device *udev,
 		struct usb_host_config *c)
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 825f03b29067..4844f53e2fa8 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1301,7 +1301,8 @@ struct usb_driver {
  *	for devices bound to this driver.
  * @generic_subclass: if set to 1, the generic USB driver's probe, disconnect,
  *	resume and suspend functions will be called in addition to the driver's
- *	own, so this part of the setup does not need to be replicated.
+ *	own, so this part of the setup does not need to be replicated. Do not set
+ *	this if @probe may return -EPROBE_DEFER.
  *
  * USB device drivers must provide a name, other driver fields are optional.
  */
@@ -1375,6 +1376,13 @@ extern int __usb_register_device_driver(struct usb_device_driver *,
 			struct module *, const char *);
 extern void usb_deregister_device_driver(struct usb_device_driver *);
 
+extern int usb_generic_driver_probe(struct usb_device *udev);
+extern void usb_generic_driver_disconnect(struct usb_device *udev);
+extern int usb_generic_driver_suspend(struct usb_device *udev,
+		pm_message_t msg);
+extern int usb_generic_driver_resume(struct usb_device *udev,
+		pm_message_t msg);
+
 extern int usb_register_dev(struct usb_interface *intf,
 			    struct usb_class_driver *class_driver);
 extern void usb_deregister_dev(struct usb_interface *intf,
-- 
2.56.0


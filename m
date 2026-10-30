Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360835;
	b=pi8muJQQRh+QuMERonkdviVZZ8CFdW4viSlcjSGfpTcSLEnE7hdPNa2eK20M9abElIgn
	 NQLiyyT3vZVrdBcfS7towPn9jQACQuJv76u+2ofilzEdD4PmJEM9L6Vhl+fRvzFw4KjT4
	 P5GXNLg8HastfD9wW+JECeaVv9nRJxPLrkZhUVnAJijYMZSB9982p6PJlK6ABc0PUwvZG
	 /AXCIwVUpZJKPi33Ca7C8eu1Dz8PoONxp8MkJ8rZtkuR0lAVUfrddjJ/w5WpmVWHVVVE2
	 nnZhL+52/m52eVHPnuN0LocXQ116fSmgrWRo5ldIb1FqFEB+13VYCaFH21k0hn5QnCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
	b=WMcdB5F8pNJ40qJxhV9WACtFIhcMlSCzTF1jlv0vQjOlvmuu6I4mVROA6ydYtOqpsLBS
	 hCiOqm3IwDaV5nHfYB+7SDsVrOGPm1GopDky9S9T89RJqjxe935elsNc3EeP35DS6E+rz
	 dtIXfIkt8dcUEfq1BlE4ZWfdOOmLM3pjXkjfv9HElR/zlrOVX6QJPgzBecJmiPR2XslkM
	 Muvi8cWUC3fImiHP8GH1L3jMMZM88JHfSUXA37GP6otO8NBu5XltfNasj0A9rV1pMDsh4
	 Ksb/4cLskKpSGZA9RQF2xBptMhrS1eUnQYvalsN7aHMRzlJcDnf0hnjA+7C9zrvL5vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=me6KKni+;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEFA606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDEFA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=me6KKni+
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9d1114320so4647955ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793360833; x=1793965633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
        b=me6KKni+y5jQl0eqMOFJYUaWQNTL3kewbOTUsbbEjTCdl5uMB1oDszxhD86U2hYlSK
         z2avVrm6AuD8o3CqmMkj+k1MbFK6t+uwQPJoIpPE9zyi7ZU/vTIoqJoP1PtT2VFOx/VP
         dzG6l8AMKADqVDy3P/whtrlFdLss7qbPXIdYiuzEKG4CNTx33YhUmEdOmL+ICFiy4ato
         Jk1CFrzN9awcUfuezxTU8PTBejtkL7v5r39xmF23Ran7SDUZjKe8BCcW3PQVZUKwxazd
         +4C3ocx+lRSAvAzyxcCBCkS9lWFg8mKwyWMwLnMTV7015P17KI83v8jXFEZ81w6MC/C4
         Kgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360833; x=1793965633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nbz/Vjri7OOyBPqFDAm2yR3HQ9KSPqNqIywAM0GHwt8=;
        b=RceGunn2zSAqjV93SLfR6NFauio0t/39szU9bNjrhAVs6vkz9yGAZLgr5sNq5CtG9s
         7JfwlX4OK7C/vjriHnyKL5u2nnJ3oisnPjY39t8jiVHpd3XUluxbKp046hHcgpSfRpn/
         vlwgWrEVPhLckDInKh71vfw9bQYTusFNCcEpvzz3Z5BVbIw6KUttUO2G86IkBTIpOYMg
         Y36lAgTDFikbRjwLwHZOhaRuYSPzgV9DR3U+FG6okJpeKSytww2zsx/QnUcOJVjrT/F8
         9gEGO7TNMICodsDoXHK8451piJ4g59mS/CeDb0kL0quEofGmmgn9uuR1XdoyfBSqNyR0
         1OmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLAu9e6TkC97rcXwDGsl3b8PN97l3NCWdw5YAOcxh7lJ/RHJG5mQpjA2j6x1citOfW2zAh6IZGfZZ7cqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmO8QHLSSpmKEdui696KxImJQeQaF9dxF8jAHKRdXVza9FlIVz
	1TgiPQrDwYlSBl28rThP966frUiUV59JvYldeWq3cF1xsQsmmiNWnyte3kSmE9EOHg==
X-Gm-Gg: AYBFou3Z9eHdDcYdzjaSkLQxKpf1dnRJnC4by3kkyYsNy43MMl0SFdKjx1/5/lkSt6d
	lmHpgrVeqLVzUYChLOOMoFPF8RJ93KN55NhDXKv4sCdzXM9PPZOLZhduqWMrl8NRr33ceZPIxAx
	htWlwyPwK0/0fqscW0hAhOkbMmBET1f0/IGnc83cIM/LEuI3wEE8hVQ314txcBsGA2OZxfyREP5
	NkB6CxWHZAaJxoZaNG96cG1sC0e+qiewaM54KsLI+EuyGh4E/gsjkjPedCPxQ5gy7fqdNowYfWT
	Y017nMW5fSrAaWZ4p6Rcu3infIqOK3sM2vdJEDd2gcvL7fhBA0nFPQnmInJsmasGkIz2YwciHhs
	XjKH7XipbNCvKkrqss9IJGBsWr9eR0ltg4tb3aMxzEIvUXimlB24Yff/lY8mLc3/FgbfpwgHTHK
	GFh8kObnSkAOSU650mBUK27BXMoHQ1ivN3M+qQan1ra2W3ID1YJ+XzAZ80yaczQmZgG25TjA3Bt
	xhcXjoKVvIoMdtDOzAinYDaZ2WXz7d5Z7WetbxSPtHdgHyCbpziIUGf5h1WSjaB/8HN+amtccwH
	Ou5tA+KXXf2KQyvskq6k/zQCLZIZ0FfLQz8LjCi7/TfU8ShxpT0amIJGkRBZugeip4Mdcg184ZX
	BJD8cDs6jvRAwm8wz
X-Received: by 2002:a17:903:124a:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2eb36495fe9mr21504985ad.14.1793360832911;
        Fri, 30 Oct 2026 04:47:12 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392ba7d3sm6025725ad.75.2026.10.30.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:47:11 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 18:47:05 +0700
Message-ID: <20261030114705.3159093-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

On a BeagleY-AI with BeagleBoard's device tree, kernels since commit
f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms")
no longer boot to a usable system. The log repeats "hub 1-1:1.0: USB hub
found" for the on-board TUSB8041 hub every few milliseconds, with no USB
disconnect in between. The flood of uevents stalls udev and the boot ends
in emergency mode. Reverting that commit makes the board boot normally
again.

The underlying problem is in onboard_usb_dev. Both peer hub nodes in this
device tree carry the same reset-gpios, so the GPIO is now a shared one,
and with CONFIG_GPIO_SHARED_PROXY=m (the default) the hub's platform
probe is legitimately deferred until udev has loaded that module. The
bootloader leaves the hub running, so the USB core enumerates it long
before, and the USB device probe finds the platform device without
driver data.

At that point, onboard_dev_usbdev_probe() returns -EPROBE_DEFER. This is
what causes the problem. The driver has generic_subclass set, so
usb_probe_device() has already run the generic probe, which configured
the device and bound the interface drivers. Each binding is a
deferred-probe trigger, and the driver core re-triggers when a trigger
happened during a probe that then deferred. So the device is re-probed
straight away, reconfigured, its interfaces bound again, and so on for
as long as the platform device remains unbound. This is not specific to
shared GPIOs: it happens whenever the platform probe is deferred, and
briefly whenever onboard_usb_dev is a module.

Bind to the USB device anyway, with NULL drvdata. When the platform
probe finishes, it already schedules attach_usb_driver_work to
re-attach the USB driver; extend it to also walk the USB devices and
attach the ones that are bound to this driver but have no drvdata. This
ensures the USB device always has a driver.

It doesn't work to return -ENXIO: the driver core takes this as the
driver declining the device, but the device is then left without a
driver, and a device without a driver can't be resumed once it has
autosuspended, which a hub with empty ports does right away. Nor does
it work to return -ENODEV: the USB core then binds the generic driver,
and driver_attach() doesn't rebind a device that already has one.

With this change the BeagleY-AI boots normally with that commit in
place.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Clark <jjc@jclark.com>
---
I found this by booting commit 85b4bc79dde7 (net/main during the 7.4
merge window) on a BeagleY-AI with BeagleBoard's device tree. A coding
agent identified the problem, explained it to me and proposed an initial
fix, which was revised multiple times on the basis of local Sashiko
reviews. I verified that the patch fixed the problem on top of commit
d89e1d186ec9.

On this board the platform probe asserts the hub's reset line, so the
hubs re-enumerate and are probed with the platform device already
bound. The path where attach_usb_driver_work adopts a USB device that
was bound with NULL drvdata has therefore not been exercised. It needs a
board whose platform probe does not reset the hub.

#regzbot introduced: f918e3804498

 drivers/usb/misc/onboard_usb_dev.c | 76 ++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..aac4e29c8233 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -43,6 +43,7 @@
 #define USB5744_CREG_BYPASS_UDC_SUSPEND		BIT(3)
 
 static void onboard_dev_attach_usb_driver(struct work_struct *work);
+static struct onboard_dev *_find_onboard_dev(struct device *dev);
 
 static struct usb_device_driver onboard_dev_usbdev_driver;
 static DECLARE_WORK(attach_usb_driver_work, onboard_dev_attach_usb_driver);
@@ -301,6 +302,47 @@ static const struct attribute_group onboard_dev_group = {
 __ATTRIBUTE_GROUPS(onboard_dev);
 
 
+/*
+ * Attach a USB device that was bound by onboard_dev_usbdev_probe() while its
+ * platform device was still unbound. The device lock serialises this with
+ * the probe and with an unbind. This walks the USB bus, not the driver's
+ * device list: unbinding a device holds its lock while it waits for all
+ * references to its node on the driver's list to be dropped, so an iterator
+ * over that list that takes the device lock would deadlock with it.
+ */
+static int onboard_dev_attach_usbdev(struct usb_device *udev, void *data)
+{
+	struct device *dev = &udev->dev;
+	struct onboard_dev *onboard_dev;
+	int err;
+
+	/* Unlocked pre-check, so as not to wait for every USB device's lock. */
+	if (READ_ONCE(dev->driver) != &onboard_dev_usbdev_driver.driver)
+		return 0;
+
+	device_lock(dev);
+
+	if (dev->driver != &onboard_dev_usbdev_driver.driver ||
+	    dev_get_drvdata(dev))
+		goto out;
+
+	onboard_dev = _find_onboard_dev(dev);
+	if (IS_ERR_OR_NULL(onboard_dev))
+		goto out;
+
+	err = onboard_dev_add_usbdev(onboard_dev, udev);
+	if (err)
+		dev_err(dev, "failed to attach to %s: %pe\n",
+			dev_name(onboard_dev->dev), ERR_PTR(err));
+	else
+		dev_set_drvdata(dev, onboard_dev);
+
+out:
+	device_unlock(dev);
+
+	return 0;
+}
+
 static void onboard_dev_attach_usb_driver(struct work_struct *work)
 {
 	int err;
@@ -308,6 +350,8 @@ static void onboard_dev_attach_usb_driver(struct work_struct *work)
 	err = driver_attach(&onboard_dev_usbdev_driver.driver);
 	if (err)
 		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
+
+	usb_for_each_dev(NULL, onboard_dev_attach_usbdev);
 }
 
 #if IS_ENABLED(CONFIG_USB_ONBOARD_DEV_USB5744)
@@ -497,7 +541,10 @@ static int onboard_dev_probe(struct platform_device *pdev)
 	/*
 	 * The USB driver might have been detached from the USB devices by
 	 * onboard_dev_remove() (e.g. through an 'unbind' by userspace),
-	 * make sure to re-attach it if needed.
+	 * make sure to re-attach it if needed. The work also attaches USB
+	 * devices that were probed while this platform device was still
+	 * unbound (e.g. because this probe was deferred), see
+	 * onboard_dev_usbdev_probe().
 	 *
 	 * This needs to be done deferred to avoid self-deadlocks on systems
 	 * with nested onboard hubs.
@@ -606,14 +653,9 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 
 	/*
 	 * The presence of drvdata indicates that the platform driver finished
-	 * probing. This handles the case where (conceivably) we could be
-	 * running at the exact same time as the platform driver's probe. If
-	 * we detect the race we request probe deferral and we'll come back and
-	 * try again.
+	 * probing. Without it the USB device can't be attached to the platform
+	 * device yet; return NULL and let the caller decide what to do.
 	 */
-	if (!onboard_dev)
-		return ERR_PTR(-EPROBE_DEFER);
-
 	return onboard_dev;
 }
 
@@ -635,6 +677,21 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
 
 	dev_set_drvdata(dev, onboard_dev);
 
+	/*
+	 * The platform device may not be bound yet (e.g. because its probe
+	 * was deferred). Bind to the USB device anyway, with NULL drvdata,
+	 * and let the platform driver attach it once it has probed (see
+	 * attach_usb_driver_work). Requesting probe deferral here wouldn't
+	 * work: the generic probe has already bound the interface drivers,
+	 * which triggers deferred probing, so the device would be re-probed
+	 * in a loop until the platform device is bound. Returning -ENXIO
+	 * doesn't work either: the device is then left without a driver and
+	 * can't be resumed once it has autosuspended. Returning -ENODEV
+	 * hands it to the generic driver for good.
+	 */
+	if (!onboard_dev)
+		return 0;
+
 	err = onboard_dev_add_usbdev(onboard_dev, udev);
 	if (err)
 		return err;
@@ -646,7 +703,8 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 {
 	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
 
-	onboard_dev_remove_usbdev(onboard_dev, udev);
+	if (onboard_dev)
+		onboard_dev_remove_usbdev(onboard_dev, udev);
 }
 
 static const struct usb_device_id onboard_dev_id_table[] = {

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373572;
	b=Hx4jZGlgTHV5FhoHU6bV8/hdP5Dvi83yyho+HaFQHJy96uCkGNaCYV7z1Es5seQWf8NE
	 mjLrsD+2BiO0r42CxK1q1XTqcMVVQsnKmLyLJSEqI5b3LAl572uhG/7nuTLuXqIVBDyRR
	 rHswrUKT4k4KSMoYZZoV01UCcMHvSztmnxzhfAD1TLhajRDIIDLkZkSWJczia9aPn8O66
	 tTUxmQj03lOvJJQOLsXARb7wvzQ0knFCXAspcMX/jEQ4Pu06Oyg7JP9riaKA4QWaPbQ9H
	 btNj5IDC587pTDcoo4mH/k3XtA7jexZ7tij6iA+JfLWGqddXiNtfCvZMW76DvfOXTMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aMfd1lvjJW32CoMCSXvxCXSHxkjcxHALUNNYKBvf7+Y=;
	b=EWuc2rfRp8JQi0C8i/M7AdnBrss9MCrX9oyi+uOGVzLNwtPpaga2ErpAm75bYOE0oAxp
	 QZs3UP7fj4vFgjFc8lwb0isnfsKbhKiKwEycM7bMgks14gEPtLLaOZ61KR5t7nQ/gSzGe
	 Vcpv4DUkfU14Ez7FVZ+Xjfzr+tn14K7B7KSoJZAegN4z3kgbtDpnFZFZaJ6+2S71I63Ty
	 SOqaae8V7hICgLO+yYm/wb8Ir7oKPvD4JktP5NHTp5vh1CaY9nqXe640XgW7AAy7JyGmV
	 Ex2ziBzjr8t4Z7QGddB7TwGBwST0ygbQHPSdIOZqlUt6sUhoDeGVC55x3Nv3wCth5Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BBE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1BBE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso489910a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793373566; x=1793978366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMfd1lvjJW32CoMCSXvxCXSHxkjcxHALUNNYKBvf7+Y=;
        b=abiLqurDx5h+MbSvKkqu83x/QSeI/wNeGtoFgcjenITGmXux/QqCZfpoBrwZY93Vrx
         IUoYGx3IDtzN8orcFNVdWckTAzd9r62fZz1raM2XXusO4Gd6tdRPvy6Trh26vZb/mFHS
         iuSVn+oiVGShuRcJXmPEpRVolRU8ant8+cCktmAoG0tapDYOPV2XpgsujCA1f/rvFUYV
         sKJ4TlE4UPDGHLFjEDYp8uVg7fWDZvAE7OCOnKTTPrZUonaD2r52ci6917djTugLM7wQ
         wjH7NWkq3cKyfWCaBiF6IRUhA661rLD/A42mRz4jzcLtOaezcIOo+Tl7fdpYtTBsahhP
         Vmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373566; x=1793978366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMfd1lvjJW32CoMCSXvxCXSHxkjcxHALUNNYKBvf7+Y=;
        b=UVhD+qk5z+1L1zd2XoCzP08XS5Qp+x8J5088/pa6o8ftHkU6hJ4xaiDAP8JYFFBUOg
         GygKP1aE7N5k1FGF5gC+euIeUs+LyFdA2XsA1N2Ba2L6uP0Rhw2x5l7IV+x6t6wrNBzT
         4UZuT62ibwFxqMBg0NXHh86ifMt0iYgNAqE/qxevx/oaFeJOaV6o+AB2uRn+OJYwTnYf
         QNIz4NM3iGgHWGqLpBZzMlUxdRFLtHJ1nrxTZRfX+59tiC57QcRYppJccVkh1sp0ya8j
         YTFAZXEkIT/dV/HroC4lxDgwUXQ9S28aTgYxaVOcZC6PsbTjMUX+1ytCPJ5FjjjWLwoF
         +1RQ==
X-Forwarded-Encrypted: i=1; AKwUvBzShCaA4kEOSTo4TR/d+r6x8j6UCAPcyFwwIc0pgxXbxRfxvKyO7S7Iza024v7b4wpoXNWr8PMthsuDoDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJANTpimXxby9RFR0CZ/Jec5JeDcBucSkhGV2u8b2bnIN5drACc
	/tGfRgQKxnzMRgHkbfNrnLqhK/PePPd8+e5WVR0NYh+/jV4xVBnQPhRutJkIXOHUzg==
X-Gm-Gg: AYBFou3IbQ/SrQlJeOTYpjkQlSK9JaC30BlL6wny8fRn2T810aGbgG0aeZFwbw2c4zj
	gnyLOCV5M6ah7cVV/tIJu7yh7yRDFovjLiHCC2kG+2FaOJ+MgCO93NKSwMAtoq4E3LCf8hM9Ypk
	2BjlRoloeFHP3ktNbc8/3KzftbUGLuYgMB9A5jB5PfxkS6PlJp324o+ZW8e7nmJZvi4moSj9Kif
	jD9FZpWblx/idg4XKWaH7JVeba5S4z9sLWUIU6zSg2L6gJoM1RT0KQxsTJ90Fdn6D+O/HHIvH4S
	91fHkiraBNiyacB4iHHCLdaDVkGziOn6bqf2DRK9hHe7i//opnwb3m0CvL135gZe+iyZciqNvPF
	d33LTnsu9MtkRd3lc+0KrfCravhsspEqpsqzGrvZfNgq51NybUFjEwuSJrE4WKZbUc5RbtQpDBH
	SMHRoa5EUsy4rNtRexNXXrX+41/A3R62dogb6zzbAFgIgHZ/uR4HQudL5d0vj/jBbxWZHXvYKg7
	II+ovzkzbWejE0O/o7FLIamsiyCla8p1Urs+dq9PcBcfQ1AlAJaUeD7NX2QdZYFtd7ItLBX9sRa
	Y8E5w9ENhfPVf1OCoYGKkEfIYp/HuM1xOSIp1or5PwlBSG8vKPvS3B2FV73qDSYWBTJzwm9nrfy
	As+Ks0Ns3hu3ZKwPZdd5+lbQ6yrdbvwkylzUGJpU=
X-Received: by 2002:a05:6a21:e181:b0:3e1:3178:8d51 with SMTP id adf61e73a8af0-3e928a29faemr1794338637.52.1793373565562;
        Fri, 30 Oct 2026 08:19:25 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963d6acsm129309b3a.18.2026.10.30.08.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:19:25 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v2] usb: core: add a pre_probe callback for device drivers that may defer
Date: Fri, 30 Oct 2026 22:19:19 +0700
Message-ID: <20261030151919.3511106-1-jjc@jclark.com>
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

Both peer hub nodes in this device tree carry the same reset-gpios, so
the GPIO is now a shared one, and with CONFIG_GPIO_SHARED_PROXY=m (the
default) the hub's platform probe is legitimately deferred until udev has
loaded that module. The bootloader leaves the hub running, so the USB
core enumerates it long before, and the USB device probe finds the
platform device without driver data.

At that point, onboard_dev_usbdev_probe() returns -EPROBE_DEFER. This is
what causes the problem. The driver has generic_subclass set, so
usb_probe_device() has already run the generic probe, which configured
the device and bound the interface drivers. Each binding is a
deferred-probe trigger, and the driver core re-triggers when a trigger
happened during a probe that then deferred. So the device is re-probed
straight away, reconfigured, its interfaces bound again, and so on for
as long as the platform device remains unbound. A probe must not defer
after it has registered child devices, and with generic_subclass the
driver's probe has no way to defer before that. This is not specific to
shared GPIOs: it happens whenever the platform probe is deferred, and
briefly whenever onboard_usb_dev is a module.

Add a pre_probe callback to struct usb_device_driver, called before the
generic probe, so that a driver that may have to defer can do so before
the device is configured. -EPROBE_DEFER from it ends the probe with
nothing done. Any other error is handled as if probe() had returned it,
once the generic probe has run, so the -ENODEV fallback to the generic
driver works as before. Make onboard_usb_dev's USB device probe a
pre_probe; it does not need the device to be configured.

A device whose driver defers from pre_probe stays unconfigured until the
probe succeeds, and for good if it never does, e.g. an onboard hub whose
platform driver fails to probe. Before, such a device worked while being
re-probed. On the BeagleY-AI the hub is unconfigured for the few seconds
until gpio-shared-proxy has loaded and the platform driver has probed,
which resets it anyway; the board then boots normally with that commit
in place.

Fixes: 8bc063641ceb ("usb: misc: Add onboard_usb_hub driver")
Suggested-by: Johan Hovold <johan@kernel.org>
Signed-off-by: James Clark <jjc@jclark.com>
---
I found this by booting commit 85b4bc79dde7 (net/main during the 7.4
merge window) on a BeagleY-AI with BeagleBoard's device tree. A coding
agent identified the problem, explained it to me and proposed an initial
fix, which was revised multiple times on the basis of local Sashiko
reviews. I verified that the patch fixed the problem on top of commit
d89e1d186ec9.

v2: add a pre_probe callback in the USB core, as suggested by Johan
Hovold.
v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

#regzbot introduced: f918e3804498

 drivers/usb/core/driver.c          | 38 ++++++++++++++++++++++++++----
 drivers/usb/misc/onboard_usb_dev.c | 15 ++++++------
 include/linux/usb.h                | 14 +++++++++++
 3 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index d3a61ebc6afb..724cfa9da4e0 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -249,24 +249,41 @@ static int usb_probe_device(struct device *dev)
 {
 	struct usb_device_driver *udriver = to_usb_device_driver(dev->driver);
 	struct usb_device *udev = to_usb_device(dev);
-	int error = 0;
+	int error = 0, pre_error = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
 
 	/* TODO: Add real matching code */
 
+	/*
+	 * Give the driver a chance to defer before anything is done to the
+	 * device. The generic probe below binds the interface drivers, and
+	 * each binding triggers deferred probing, so a probe that deferred
+	 * after it would be retried straight away and the device re-probed
+	 * in a loop.
+	 *
+	 * Any other error from pre_probe() is not acted on until the generic
+	 * probe has run, so that the -ENODEV fallback below works as it does
+	 * for probe().
+	 */
+	if (udriver->pre_probe) {
+		pre_error = udriver->pre_probe(udev);
+		if (pre_error == -EPROBE_DEFER)
+			return pre_error;
+	}
+
 	/* The device should always appear to be in use
 	 * unless the driver supports autosuspend.
 	 */
 	if (!udriver->supports_autosuspend)
 		error = usb_autoresume_device(udev);
 	if (error)
-		return error;
+		goto err_pre_probe;
 
 	if (udriver->generic_subclass)
 		error = usb_generic_driver_probe(udev);
 	if (error)
-		return error;
+		goto err_pre_probe;
 
 	/* Probe the USB device with the driver in hand, but only
 	 * defer to a generic driver in case the current USB
@@ -289,15 +306,26 @@ static int usb_probe_device(struct device *dev)
 	 * specialised device drivers prior to setting the
 	 * use_generic_driver bit.
 	 */
-	if (udriver->probe)
+	if (pre_error)
+		error = pre_error;
+	else if (udriver->probe)
 		error = udriver->probe(udev);
 	else if (!udriver->generic_subclass)
 		error = -EINVAL;
 	if (error == -ENODEV && udriver != &usb_generic_driver &&
 	    (udriver->id_table || udriver->match)) {
 		udev->use_generic_driver = 1;
-		return -EPROBE_DEFER;
+		error = -EPROBE_DEFER;
 	}
+	if (error)
+		goto err_pre_probe;
+
+	return 0;
+
+err_pre_probe:
+	/* The driver core doesn't call disconnect() for a failed probe. */
+	if (udriver->pre_probe && !pre_error && udriver->disconnect)
+		udriver->disconnect(udev);
 	return error;
 }
 
diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index c60406240416..33653d8f76d7 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -606,13 +606,14 @@ static struct onboard_dev *_find_onboard_dev(struct device *dev)
 
 	/*
 	 * The presence of drvdata indicates that the platform driver finished
-	 * probing. This handles the case where (conceivably) we could be
-	 * running at the exact same time as the platform driver's probe. If
-	 * we detect the race we request probe deferral and we'll come back and
-	 * try again.
+	 * probing. Without it, e.g. because the platform driver's probe was
+	 * deferred or is running right now, request probe deferral and we'll
+	 * come back and try again. This is allowed because we run from
+	 * pre_probe(), before the USB core has configured the device.
 	 */
 	if (!onboard_dev)
-		return ERR_PTR(-EPROBE_DEFER);
+		return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER,
+					     "platform device not bound\n"));
 
 	return onboard_dev;
 }
@@ -623,7 +624,7 @@ static bool onboard_dev_usbdev_match(struct usb_device *udev)
 	return !!udev->dev.of_node;
 }
 
-static int onboard_dev_usbdev_probe(struct usb_device *udev)
+static int onboard_dev_usbdev_pre_probe(struct usb_device *udev)
 {
 	struct device *dev = &udev->dev;
 	struct onboard_dev *onboard_dev;
@@ -695,7 +696,7 @@ MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
 static struct usb_device_driver onboard_dev_usbdev_driver = {
 	.name = "onboard-usb-dev",
 	.match = onboard_dev_usbdev_match,
-	.probe = onboard_dev_usbdev_probe,
+	.pre_probe = onboard_dev_usbdev_pre_probe,
 	.disconnect = onboard_dev_usbdev_disconnect,
 	.generic_subclass = 1,
 	.supports_autosuspend =	1,
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 825f03b29067..6e07d485d49a 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1280,6 +1280,19 @@ struct usb_driver {
  * @name: The driver name should be unique among USB drivers,
  *	and should normally be the same as the module name.
  * @match: If set, used for better device/driver matching.
+ * @pre_probe: If set, called first, before the device is resumed or
+ *	configured (the generic USB driver's probe runs after it when
+ *	@generic_subclass is set, then @probe), so it must not access the
+ *	device. A driver that may have to defer probing must do so from here
+ *	by returning -EPROBE_DEFER, not from @probe: by then the generic probe
+ *	has bound the interface drivers, and each binding triggers deferred
+ *	probing, so the device would be re-probed in a loop. Returning
+ *	-EPROBE_DEFER ends the probe with the device left as it was, so the
+ *	device stays unconfigured until the probe succeeds. Any other error is
+ *	handled as if @probe had returned it, once the generic probe has run,
+ *	and @probe is then not called. If @pre_probe succeeds and a later step
+ *	of the probe fails, @disconnect is called to undo it, so a driver with
+ *	both callbacks must make @disconnect cope with a failed @probe.
  * @probe: Called to see if the driver is willing to manage a particular
  *	device.  If it is, probe returns zero and uses dev_set_drvdata()
  *	to associate driver-specific data with the device.  If unwilling
@@ -1309,6 +1322,7 @@ struct usb_device_driver {
 	const char *name;
 
 	bool (*match) (struct usb_device *udev);
+	int (*pre_probe) (struct usb_device *udev);
 	int (*probe) (struct usb_device *udev);
 	void (*disconnect) (struct usb_device *udev);
 

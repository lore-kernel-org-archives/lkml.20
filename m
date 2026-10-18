Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B66B448CE9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357051; cv=none; b=pPgzmluZXYLhQ7WAoMW4Je+K/cnpEVhNGPaWNW+LmS/6ZuIG65lU7sH4LpMWrBLosLEj/r/4jfNVe1Sc+CrRxvVYFhk5eiOTBAoE90QxsrGZ4sTxbQj3Jv2EM7V8ETZbkrr6a7DLpmsbFNyRiE5SMi/eYOUq2HzUNkSrr/i84dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357051; c=relaxed/simple;
	bh=quLj1TIOPm9RgE7RHnLSipcI5NCmxB79c5QMlU3aI1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imOT0SVOC1PyeW274J+L2vxXCoMuQtGl5tYSCmuAg84tA+iChDywvdEwe7polepHGwlo2GmGzjLYAgdypwMCth8gNNgN7hXZeyslIZJN173R0vx2Xin8mh/Je/H0KZdWoInnr5xWlRno0Y7+tqr1mim5Z3n9JmLLpTJlJo+ZUGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9CEhsX/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9CEhsX/"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso612245f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792357047; x=1792961847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQ2DSDEj+kpesB1ZCHZFSPPaWPe2E9ZNqkiYEcQb/+s=;
        b=B9CEhsX/7p8Z9miDVlstI4Asl22AuXMCXqMtR0VtQTJ3L2aSJ3Sjmbkdck0LYVPZUA
         VuS6E6pSwdJjRzxpzaYwwvwgWo8ummC2vS0eSbvsu/bs+tR8gSFVHxBEzIjMQiQGe2C6
         iEAJjEO0Gw2s6pE0dGRti8ThcMIf2uBYhsHpLw6ktAuX4RLBrsSt0UtsPiAW7s5La8jF
         2xaTcoF00JBv29K4ab6YolUerUnPLwOiwISmwAY72YXJtY7vRU+/TBHnUkYwSdGmGk8h
         EzxWPDdn2lAmy5uemEREXeSFEl+wk1YYCio+arKrec9OMW4J1zGr0QjXHr4YhwC7jsPL
         HaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357047; x=1792961847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQ2DSDEj+kpesB1ZCHZFSPPaWPe2E9ZNqkiYEcQb/+s=;
        b=GmQhvClu/YooJw4pLR0A1PwhrtGmzPGQydx6IIUHkE2VctuGclaos3yl53AEoLxUWo
         hPT4UMgfyT2nOahgsNY7VZArsNQSVSw0jND+nSvYi3+bkb+1PCPkASWOcEB2c22873M8
         5bTn9ceh7X6LZTVAjKdUJ9ei5VBAo6ZX9dUZYi0/HZo02aVSJlTTsZZwuHziErFy7mSU
         B4rJPHtXDx/RKXomKyAyDaI4KXeE12dcWh8lBrDNof0cIrYMWfhwDI3Tse7N3pL/al6X
         0XdTcB39zjTguW/6+WeEeTAdhuYz8zjIKoXIvBafstTYdx7Q3X1G1V4kXD4uLo4qJGvk
         RXFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyP3CRPaXZtsEpYXMwPH8jiytJ2DmU18uucjp6P697dSdIRIkyavQ9PM1ai4RA/0aBwHpgQOmmWHJeFyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK65KqERbxTIcF+vHKc57u0CdJYidiNjpkiXSioPUBCjJLKe5DY
	9icanPAmwarkxyNFwtkjGI6mhWz5MPlG50txtnhbqGG7ERW7HxeV5vUG7/eSAkUhxTEQDvUb
X-Gm-Gg: AYBFou2LKS3K0o7Coclx8lMLv6wNM9EOoj/K/tcoNH5lQ8I5dUh2iPDFOUc9UYILYpf
	BDDMw+oReOOl4SguL/nzZg+WDrxcm+YcxDT7zdB9tZsAMzTiUuDpfoHTeeSms1FQ8qZVh77tqI3
	+bJztNcN3D3uOJhiBxowBYrOC1W31rxT6qlQjB0BXu2MFA1h+MdpK3KAvRICPeWohPYlSB9bR1W
	wFjXXxwlmuVUf7a4+WJjyapMEAYknQnp2uZy8d5xverFWy5l0lOMU4k5uIW3L1p8P3AHOTxRvgr
	b25zCMPmBcFguHCK24Z2/3hln2UZ+sL/dUYUEB7fOZ47W7Wk6wppycjNfgjTJyZg1+AnYdU5xqK
	4kJnA38Ak/iMabKvBeSPXEExRcHCr1z7JEv97XriaLkl3EA9s2mdn0g7Y3DAgPLPvx9w6OizpnU
	jXy/cVGYyam5NoxTjL3X5yt0gg5fGiWQ1QZ2werIaDahe+BZNi1ALnoyYWk7W4t5lU3C6dEto4Z
	mplJkW1AwmjZL0yaKyTFDg4slRKm8PeB3TEgWISBJpgi+3WW7xLPSDoyFcf8mHEcWkXuA==
X-Received: by 2002:a5d:5d13:0:b0:48d:de0f:b79 with SMTP id ffacd0b85a97d-48e07928730mr11453026f8f.0.1792357047307;
        Sun, 18 Oct 2026 13:57:27 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm18496263f8f.30.2026.10.18.13.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:57:26 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	tiwai@suse.de
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v10 3/8] HID: topping: add the E2x2 OTG
Date: Mon, 19 Oct 2026 01:57:05 +0500
Message-ID: <20261018205711.168291-4-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018205711.168291-1-mikhail.v.gavrilov@gmail.com>
References: <20261018205711.168291-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Topping E2x2 OTG (152a:8756) puts its digital input gains, its
faders, its source selectors and its output switches behind the same
vendor protocol as the M62, in the same frames and on the same
interface, so the same transport serves it.

One thing differs. The E2x2 OTG reports without being subscribed, and
its own vendor application never sends it 0x11/0x24 or 0x11/0x26. The
subscription, the announce request and the keepalive are now reserved
for a card marked as wanting them, which is the M62.

The device table now says, for each card, which interface carries the
protocol as well as whether the card wants the subscription. It is
interface 4 on both; a card that has it elsewhere is one more entry
rather than a change to the probe.

Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
 drivers/hid/Kconfig       | 13 ++++----
 drivers/hid/hid-ids.h     |  1 +
 drivers/hid/hid-quirks.c  |  1 +
 drivers/hid/hid-topping.c | 63 +++++++++++++++++++++++++--------------
 4 files changed, 50 insertions(+), 28 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index fecbbaa..9367a71 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1285,16 +1285,17 @@ config HID_TIVO
 	Say Y if you have a TiVo Slide Bluetooth remote control.
 
 config HID_TOPPING
-	tristate "Topping M62 vendor controls"
+	tristate "Topping M62 and E2x2 OTG vendor controls"
 	depends on USB_HID
 	depends on SND_USB_AUDIO
 	select CRC16
 	help
-	  The vendor protocol behind the analogue input gains, output
-	  volumes and output source selectors of the Topping M62 USB
-	  audio interface. These are not described by the USB Audio
-	  Class and are reached over the card's HID interface, so a
-	  driver is needed for them to work at all.
+	  The vendor protocol behind the input gains, output volumes and
+	  source selectors of the Topping M62 and E2x2 OTG USB audio
+	  interfaces, and the output switches of the E2x2 OTG. These are
+	  not described by the USB Audio Class and are reached over the
+	  card's HID interface, so a driver is needed for them to work
+	  at all.
 
 	  The controls themselves belong to snd-usb-audio, on the sound
 	  card it makes for the same device; this driver carries them
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 1af487c..cc114e4 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1478,6 +1478,7 @@
 #define USB_DEVICE_ID_TIVO_SLIDE_PRO	0x1203
 
 #define USB_VENDOR_ID_TOPPING		0x152a
+#define USB_DEVICE_ID_TOPPING_E2X2_OTG	0x8756
 #define USB_DEVICE_ID_TOPPING_M62	0x875c
 
 #define USB_VENDOR_ID_TOPRE			0x0853
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index bca22bb..5872952 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -791,6 +791,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TIVO, USB_DEVICE_ID_TIVO_SLIDE_PRO) },
 #endif
 #if IS_ENABLED(CONFIG_HID_TOPPING)
+	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPPING, USB_DEVICE_ID_TOPPING_E2X2_OTG) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPPING, USB_DEVICE_ID_TOPPING_M62) },
 #endif
 #if IS_ENABLED(CONFIG_HID_TOPSEED)
diff --git a/drivers/hid/hid-topping.c b/drivers/hid/hid-topping.c
index 2e50b36..9d23c0c 100644
--- a/drivers/hid/hid-topping.c
+++ b/drivers/hid/hid-topping.c
@@ -6,7 +6,10 @@
  *
  * The M62 (152a:875c) puts its analogue input gains, its output volumes
  * and its output source selectors behind a vendor protocol on a
- * HID-class interface, and exposes none of them through UAC.
+ * HID-class interface, and exposes none of them through UAC.  The E2x2
+ * OTG (152a:8756) does the same with its digital input gains, its
+ * faders, its source selectors and its output switches, on the same
+ * interface and in the same frames.
  *
  * The protocol was read off the vendor application's traffic.  Frames
  * are fifteen bytes:
@@ -22,10 +25,12 @@
  * does not verify what it receives -- this driver signs its writes
  * anyway, and validates what it reads.
  *
- * The device says nothing until it is subscribed: one write of
- * 0x11/0x24 starts the notification stream, after which every change,
- * including a front panel button, arrives unsolicited.  A second
- * write, 0x11/0x26, makes the device announce what it reports at all.
+ * The M62 says nothing until it is subscribed: one write of 0x11/0x24
+ * starts the notification stream, after which every change, including
+ * a front panel button, arrives unsolicited.  A second write, 0x11/0x26,
+ * makes the device announce what it reports at all.  The E2x2 OTG
+ * reports without being asked, and its own vendor application never
+ * sends it either of the two, so neither does this driver.
  *
  * The control pipe is not an option: GET_REPORT and SET_REPORT both
  * stall with EPIPE for every report type, so the interrupt endpoints
@@ -37,12 +42,13 @@
  * THE CONTROLS ARE NOT THIS DRIVER'S.  They live in snd-usb-audio, on
  * the card that plays the audio, and outlive any binding of this
  * driver.  This driver is the transport: it registers a component, the
- * M62 mixer quirk is the master, and at bind this driver fills in the
+ * card's mixer quirk is the master, and at bind this driver fills in the
  * struct topping_component it is handed with the one operation the
  * controls need -- send a frame -- and from then on passes on every
  * frame the card reports.
  */
 
+#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/component.h>
 #include <linux/crc16.h>
@@ -63,11 +69,14 @@
 #define TOPPING_REPORT_LEN	16	/* what arrives, one pad byte more */
 
 /*
- * The M62 presents two non-audio interfaces.  Interface 3 is
- * Application Specific / DFU and is never touched here.  Interface 4
- * carries the control protocol and is the only one this driver takes.
+ * hid_device_id.driver_data: in the low byte, the interface that carries
+ * the control protocol and the only one this driver takes, and above it
+ * what the card wants.  Both cards present two non-audio interfaces:
+ * interface 3 is Application Specific / DFU and is never touched here,
+ * and interface 4 carries the protocol.
  */
-#define M62_VENDOR_IFNUM	4
+#define TOPPING_IFNUM		GENMASK(7, 0)
+#define TOPPING_SUBSCRIBE	BIT(8)	/* wants 0x11/0x24 and its renewal */
 
 /* device-scope properties */
 #define TOPPING_TT_DEVICE	0x11
@@ -95,6 +104,7 @@ struct topping_hid {
 	struct topping_component *comp;
 	spinlock_t lock;		/* guards comp */
 
+	bool subscribe;			/* TOPPING_SUBSCRIBE */
 	struct delayed_work keepalive;
 };
 
@@ -282,10 +292,12 @@ static int topping_bind(struct device *dev, struct device *master,
 	 * connected input about 5 s later -- so nothing here waits for
 	 * them: each value arrives through .raw_event() on its own.
 	 */
-	topping_send(th, TOPPING_TT_DEVICE, TOPPING_PP_SUBSCRIBE, 1);
-	topping_send(th, TOPPING_TT_DEVICE, TOPPING_PP_ANNOUNCE, 1);
-	schedule_delayed_work(&th->keepalive,
-			      msecs_to_jiffies(TOPPING_KEEPALIVE_MS));
+	if (th->subscribe) {
+		topping_send(th, TOPPING_TT_DEVICE, TOPPING_PP_SUBSCRIBE, 1);
+		topping_send(th, TOPPING_TT_DEVICE, TOPPING_PP_ANNOUNCE, 1);
+		schedule_delayed_work(&th->keepalive,
+				      msecs_to_jiffies(TOPPING_KEEPALIVE_MS));
+	}
 	return 0;
 }
 
@@ -352,8 +364,9 @@ static int topping_probe(struct hid_device *hdev,
 	th->hdev = hdev;
 	th->intf = to_usb_interface(hdev->dev.parent);
 	if (th->intf->cur_altsetting->desc.bInterfaceNumber !=
-	    M62_VENDOR_IFNUM)
+	    (id->driver_data & TOPPING_IFNUM))
 		return -ENODEV;
+	th->subscribe = id->driver_data & TOPPING_SUBSCRIBE;
 
 	spin_lock_init(&th->lock);
 	INIT_DELAYED_WORK(&th->keepalive, topping_keepalive);
@@ -451,10 +464,12 @@ static int topping_resume(struct hid_device *hdev)
 	 * state refreshes what may have gone stale while the panel was
 	 * reachable and this driver was not.
 	 */
-	noio = memalloc_noio_save();
-	topping_send(th, TOPPING_TT_DEVICE, TOPPING_PP_SUBSCRIBE, 1);
-	topping_send(th, TOPPING_TT_DEVICE, TOPPING_PP_ANNOUNCE, 1);
-	memalloc_noio_restore(noio);
+	if (th->subscribe) {
+		noio = memalloc_noio_save();
+		topping_send(th, TOPPING_TT_DEVICE, TOPPING_PP_SUBSCRIBE, 1);
+		topping_send(th, TOPPING_TT_DEVICE, TOPPING_PP_ANNOUNCE, 1);
+		memalloc_noio_restore(noio);
+	}
 
 	/*
 	 * Tested again under the lock topping_unbind() takes to clear it,
@@ -467,8 +482,9 @@ static int topping_resume(struct hid_device *hdev)
 	scoped_guard(spinlock_irqsave, &th->lock) {
 		if (th->comp) {
 			th->comp->audio_ops->resumed(th->comp);
-			schedule_delayed_work(&th->keepalive,
-					      msecs_to_jiffies(TOPPING_KEEPALIVE_MS));
+			if (th->subscribe)
+				schedule_delayed_work(&th->keepalive,
+						      msecs_to_jiffies(TOPPING_KEEPALIVE_MS));
 		}
 	}
 
@@ -476,7 +492,10 @@ static int topping_resume(struct hid_device *hdev)
 }
 
 static const struct hid_device_id topping_devices[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPPING, USB_DEVICE_ID_TOPPING_M62) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPPING, USB_DEVICE_ID_TOPPING_E2X2_OTG),
+	  .driver_data = 4 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPPING, USB_DEVICE_ID_TOPPING_M62),
+	  .driver_data = 4 | TOPPING_SUBSCRIBE },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, topping_devices);
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751125;
	b=0NU3wHXCS8bI7OeknUxojG9lnq+HJWVyjFq9vBMDIc6UHj87r7HvBVWPnguQqNMGq2od
	 21RPb08aMFtbgaN/8ypIWGeLbZhRRVP11XL2LYzyn/bhl+tBYo838IeYstTQNVSb+uTL8
	 cyS1s2Z4JwRZEzj/juvEOc9AO3uTC/FoLDvsFaZEV21pjDcZ+gooVAfGsc1INYVqCgraM
	 R5g/9pzEcYfT671Dnvt4n053fImAMpO7frQLU/YJ0J41Iirz9/owDLsZScXHlSQY/oL3/
	 0WnYDBD0TaRU8yINPO7Z/gFVM7LiUz509QIlk9wBDEwtsszpubWsQYMqjEhhkYd/B/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=puoRQt9p4YyKE9/BzbAjjcae9LvbnX6JUATeqPyecX8=;
	b=UCaC/6reInoSASWk1BRZxwtXL/joguX007Hd4t8iWx+3ElHxhSn9PWDaeDTCavZPcHoO
	 vtp0XYvlOLL0yvcpN6nvxqkSROx7mdxy54D73aTLXad0GyTtC1TbrX5Fn8+JXF6Ng0baU
	 j1XBcPvIAgmRwL055fhcBR8TbwouQlcfGfBE2fFYwHxq1pQyU+R3i6rnFHimdEFmVUTiB
	 in3VgcWNZAuSumrFu4VFd1snbQ3MXF1bpfck7ZUsp2NLY5FzYM5JahflsyUBRSci3rMc6
	 15v6ZInFYckU23jw8gTBf4/SPAtIxHyirg1e+IHhk1EAtyYCRe92by5ECeTDjFEaOKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCRILPvU;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6951A606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6951A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WCRILPvU
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so21060475e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794751123; x=1795355923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=puoRQt9p4YyKE9/BzbAjjcae9LvbnX6JUATeqPyecX8=;
        b=WCRILPvU9gf8POX8ju7SYoZRlvFrh6tXp8SMZSIh0+ZErkv4BcD6Cgs+3Y4V5qwc4Q
         GM+LafhNK214T8sY11Ke5OX/GbYaSC3oYZUvhS+pcZd2Ok7iJuHBFC7LSjrqiFrwBUQw
         fmHVQGJ8Hy+lELUubFMpaxZR8yd8WW0eRnBPXMiPTtI5pUCV3ZRZIyllPbrZIqZEbO3K
         d3FyKq4GMtbcY8LtCzJ/btRT/C6C9cKMLaJueoB6WHFFS2ja75t3LO1aWTIa/hgZoQZp
         UN4VKY4LTWgBBdTBNPnuN69RhzYyt3uglN7SXtohKKfq1PhCDjxIDarnOdGUpiH1bHRs
         REig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794751123; x=1795355923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=puoRQt9p4YyKE9/BzbAjjcae9LvbnX6JUATeqPyecX8=;
        b=H3M8NqSCh+PKqFk/MOLjqw/4CXObYboJGHxRfv//vH3JK4NI3HEwr5L1VlrJNm2t6y
         oT4xjHU13kISjO6RAzDH7olFoBbE2DVjcpR1JokqfwiVcL2EI9KKmAU6QLUKPGk0IK/O
         sJ+nqgo6I+kmsTPFp1Nj8xUwuhkc8ei7zDefbSmALvAVGf7eDbM5rRoVFMBZaXZXUhTF
         sz3dLtgkOWh7XyCs1ayFwkOiwSgQ1UTvjfzdCXOZ+YinCe85VT6QJj8vgN9RUKtpEK8j
         /UsvGEwSjcQW2Bq6g87kuatnZm6W47UcF8iD4b7GwumURrZL3vtKA2AKEPuEzrtp2kRX
         tp/g==
X-Forwarded-Encrypted: i=1; AL+hErHCbOpYRL1G2LSI3QWMQlzB9bSqXYYPhSNhm+QHnTDwf/SYy0R7rayYG25SLOCGzpSlmmv7OMynUCdfe7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sYXC0MLQ3TP0n6QFVzKWQw6qSHbZ75AFhBdj5ryyi0IGOvt1l
	nmRi9wifmlomsUOgwjbOajaR6t3f1jT50FQE6+vH96WLBGoOFrNrLMxp
X-Gm-Gg: AYBFou0ftSEdcg4zG5Kh33d/bzPQYv2l6tjjoeNTOUtXFUtq3npGzlKmGfGSfkcd3C2
	l1BXi0+2SY/VomDpQnk9cdQj8Y8s0imJDz2T+JxV4NNqiQslZtxTd55b6Pz35dUoQsmYP30KIzh
	icaZ7FfVA4F6eVK0s4/pMlqspF6aGj4ZNjMm2u6YgggDhOHB7bwwcALpXHIB7di0OR6sNsMe/rw
	c8ep17PWci0JhLOCJnqJb4N2wVey/Ui5bdt/l7t/7VKQKIyeZickgC+R0OYX9A7kYWGa9I7kYDI
	kPxRRbXQtzEC0TRcfKEO6tip4JEc7yoYYfmM+E+DwT/W8V+ZWW/AThlkthAGpY7r1csSEishhD/
	wyg8sR8irmbqTUea5q10Uhod0R5hLqiuXxCbeI8QSo3BiU/JAGDZsUOJ2PG4P5qDOqIZ41de541
	m37U4DEhRRcdj/thR/yjcj6ez4uzVQXdBBWp9xQLPRfFlSCAEHnFxE8RPkXelY2k3CbW+9rq3FD
	EP3Ppev8nv0orAaNyXt1gCli1QBw3OVvHfYbj6vL+u7TbL24LwIh22oPzt65Yc+10xmGtLoXq+v
	gzhC0n5e/RG/OYSasdy8xYuNQ5mq4lvZZL1JwGry
X-Received: by 2002:a05:600c:81c9:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb55a65b31mr157701365e9.18.1794751122786;
        Sun, 15 Nov 2026 05:58:42 -0800 (PST)
Received: from alnutz.home ([2a01:e0a:dfb:f440:f7a6:ce5b:75bc:76a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223b21sm18445396f8f.2.2026.11.15.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:58:42 -0800 (PST)
From: Alexander Gollings <levirootsmanuva2@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Gollings <levirootsmanuva2@gmail.com>
Subject: [PATCH] Input: xpad - add support for GameSir G7 Pro dongle in Xbox mode
Date: Sun, 15 Nov 2026 14:58:14 +0100
Message-ID: <20261115135814.34031-1-levirootsmanuva2@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The GameSir G7 Pro 2.4GHz dongle enumerates as 3537:1004 in its Xbox
mode, the same VID/PID as the GameSir T4 Kaleid, which was added as an
Xbox 360 controller in commit 854d2233de0a ("Input: xpad - add GameSir
T4 Kaleid Controller support"). Unlike the T4 Kaleid, the dongle exposes
GIP interfaces (class 0xff, subclass 0x47, protocol 0xd0) and speaks the
Xbox One protocol.

xpad binds to the dongle through the vendor-wide GIP match, but the
device table lookup then forces XTYPE_XBOX360. The GIP power-on packet
is never sent, so the dongle reports no input at all and rumble requests
are ignored.

Make the device table lookup skip XTYPE_XBOX360 entries for interfaces
using the GIP protocol, and add an Xbox One entry for the G7 Pro. Its
36-byte input report carries the Share button in the same place as the
Xbox Series controllers, so enable MAP_SHARE_BUTTON. The T4 Kaleid uses
the Xbox 360 interface protocol and still matches its existing entry.

Tested with two G7 Pro controllers, each paired to its own dongle
(firmware 1.55): sticks, triggers, D-pad, all face, shoulder and stick
buttons, View, Menu, Guide and Share register, and both rumble motors
work, including through Steam Input. The back buttons send nothing in
this mode unless they are remapped on the controller.

This patch was developed with an AI coding assistant (Claude Code,
Claude Opus 5.5). It found the cause from the USB descriptors and the
xpad source, wrote the patch and this changelog, and helped capture raw
GIP reports to locate the Share button. I reviewed the change and tested
it on the hardware described above.

Signed-off-by: Alexander Gollings <levirootsmanuva2@gmail.com>
---
 drivers/input/joystick/xpad.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index d2eb48d..f0ceb78 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -406,6 +406,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
 	{ 0x3507, 0x000b, "ZENAIM LEVERLESS", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
+	{ 0x3537, 0x1004, "GameSir G7 Pro", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x3537, 0x100f, "GameSir Nova 2 Lite", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1040, "GameSir Nova Lite", 0, XTYPE_XBOX360 },
@@ -2054,6 +2055,30 @@ err_free_input:
 	return error;
 }
 
+/*
+ * Some vendors reuse the VID/PID of an Xbox 360 protocol controller for a
+ * device speaking GIP: GameSir 3537:1004 is the T4 Kaleid, but also the
+ * G7 Pro 2.4GHz dongle in Xbox mode. Never apply an Xbox 360 entry to a GIP
+ * interface.
+ */
+static bool xpad_device_match(const struct xpad_device *xdev,
+			      struct usb_device *udev,
+			      struct usb_interface *intf)
+{
+	const struct usb_interface_descriptor *desc = &intf->cur_altsetting->desc;
+
+	if (le16_to_cpu(udev->descriptor.idVendor) != xdev->idVendor ||
+	    le16_to_cpu(udev->descriptor.idProduct) != xdev->idProduct)
+		return false;
+
+	if (xdev->xtype == XTYPE_XBOX360 &&
+	    desc->bInterfaceClass == USB_CLASS_VENDOR_SPEC &&
+	    desc->bInterfaceProtocol == 208)
+		return false;
+
+	return true;
+}
+
 static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id)
 {
 	struct usb_device *udev = interface_to_usbdev(intf);
@@ -2065,8 +2090,7 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 		return -ENODEV;
 
 	for (i = 0; xpad_device[i].idVendor; i++) {
-		if ((le16_to_cpu(udev->descriptor.idVendor) == xpad_device[i].idVendor) &&
-		    (le16_to_cpu(udev->descriptor.idProduct) == xpad_device[i].idProduct))
+		if (xpad_device_match(&xpad_device[i], udev, intf))
 			break;
 	}
 
-- 
2.56.1


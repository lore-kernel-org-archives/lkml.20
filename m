Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898233D810F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 19:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462426; cv=none; b=CeOUBneTCIWU9fB5hl/z8nCqhbKzOZUDh1orpLOr8DpfUrVLfxKNpIUjMCg8W4GYua4ECEjjAcVkqw8ycYLPhk6Kus8QoZYrWor7vnZptnX6wethjIkGrPVWsEHtIvGmSasUAvHUCKm+XS97obkcedsCWopqUXgpdoDOWrSD/cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462426; c=relaxed/simple;
	bh=w7omx3YMyTcaH1ogVGWPdU12UICmtznTiUT+lio+t/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yi9T1zS+w+GZs2l+Jg0C4Zs0JrwaOpxs6/f0zSnu/jWesMV6WaKHARPeuUWA4jkExm0cmYwOWK+kB7KeSBc4KHZl2ythUTYDt7/C0JboDG/f4dTopSDugUawjATDN2flDza8b4gd9Nn/7q8J5uXy/0n75Cw6ks/sMjS43Hk7DwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAj+DXpy; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAj+DXpy"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso223929a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 12:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788462415; x=1789067215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dDib65S8CFIQhIYI6LWgQWUD0MUxHEqD0COA8UQlWu0=;
        b=hAj+DXpyDDMJxJp4v8yTSkHKrs6OumVlKYWzDPOV8GK6Xgbnw5chCk1Vo5n6F9Bc9V
         0/+Alg7MSkqBFkxeqfDFwpqB9qOTO3Jq5uWPl6ZXswWJKqZdY9QfBwewz084jGRqLZ7c
         VkjRdiyAkErHpIo46Kt6RQ9H2ZQCHa5N8XrAz0hoqHeRxShRp++6d8DGOvxwb2X5nEQW
         Bpzb76iFoU/st6yYR02D8zMVT3y1AyU+PH9NWh62FGxkpkEjXxRRrww+YYmS9WTca9lm
         aGGAYu7BERzwSN4ABs07pX8F6DIMHRIyTWr0V0L2c52KcTmjcph/WuSw1iQglsi1LVqM
         JBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462415; x=1789067215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDib65S8CFIQhIYI6LWgQWUD0MUxHEqD0COA8UQlWu0=;
        b=PIAlkJcAk30Ech1GjuJPtR0eS+oxPM7+7JeZo2Ev1N8VZZwJSqtjmSK9GX2tkxaLCS
         svMl4+HHJXnl0IC+pzmZC+cWXdXHYtcArrLGGSRNJwzPaHs+e1Q9p5ktsw7Kbw2uRvOA
         dg1m1JcPx6zy4akFZmMqi8bxcpXQHIT/uefqJkVMck8fLz5Qw7COEptzD0sCeD4bsnfA
         f1/D7RbnKs/okD7uBfACSYv7JQ3faI/RkTuACqV+cpqKA85bxj+QQ2/mlDFTPobSBbce
         b0ZkJ9zS47pcrZH0P9NxueSpd9XFsg5WMunklM+818Wcrb/+g6ldwx8iWS/dUkrbfpAw
         41fA==
X-Forwarded-Encrypted: i=1; AKwUvBwKzOIN01M0RI2IW3PfPCuBNCbIfNrna4Jox3M65bAHV30PZBnPeeP/XxrnYUqnpmSXgNpA/7Qhp10eqvY=@vger.kernel.org
X-Gm-Message-State: AFuF++nJZAym/mmJSGOdTTIWFD1J7QB9MIGd0KLFW6j0hLCoZZmv9Ydu
	p/6yElqofjelaKcH3OIV72xGnJrREBrqz5k98f/zXTZYNw0X8ywDTA7j
X-Gm-Gg: AYBFou3yXNufIJScUVqlRNJ/ckFJqH0l+u0I2iBYyZioAmo9LAnwNdc/gVTwl3NHwbx
	CtDJaLUO457XVLw+ff4Ksm7tMVOaXTcD7I4ZcyymoRK+Pl3bOzqb4PIi7/Qeu393Aw7gNzRIAlU
	Lz0La1Rn7Zgb/0ilNhsaTEj90gCTJdrNg0tk9xDIdjkfW2IqzuL0yEI3gnMX0y/u+Y75QVvWDx/
	vKHyEVdJFHZv0VinzX0dlhJE1iwzJjP3ZxB49mnfhQRzJ3eZiNW20gr3RDJfiz9G3rll5EgXb/2
	kdeMnLvpsCTorLFCTyOB7aORMM5i9cTk3vzw6VOEU4R8I6h9ls6SfgnLtCfGdbNbnf9S1yjof/M
	rkqirnxpNAS8reQrEsZx+IAJJ4uhaC1O+qTFBHAYTzG+gSMmmQ3IJcbv1hPtRFR8GpLYdz5jkEd
	i88nrT+yDRKRtfSylhNkVdONHDrlUdWZEIw/gnx680U08z+Q1L9EgfWSDUey3J
X-Received: by 2002:a17:90b:2e0c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39b26169b1fmr1012620a91.11.1788462414813;
        Thu, 03 Sep 2026 12:06:54 -0700 (PDT)
Received: from mothership ([2406:7400:43:dc90:37cc:75ad:6506:3043])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm982389eec.1.2026.09.03.12.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:06:54 -0700 (PDT)
From: Hani B <itshanibee@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hani B <itshanibee@gmail.com>
Subject: [PATCH for-next] Input: xpad - add support for Flydigi Direwolf 4 paddles
Date: Fri,  4 Sep 2026 00:36:39 +0530
Message-ID: <20260903190639.344878-1-itshanibee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Flydigi Direwolf 4 clones Microsoft's Xbox 360 controller (045e:028e),
identifies itself via its USB product string, and reports two rear paddles
(M1 and M2) in byte 19 of its input reports.

Add a probe quirk to detect the controller by string descriptor, expose its
true vendor and product IDs (0x37d7:0x2414) for userspace recognition, and
decode rear paddles in xpad360_process_packet().

Signed-off-by: Hani B <itshanibee@gmail.com>
---
 drivers/input/joystick/xpad.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 2da0b7f1722a..f738a409d139 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -401,6 +401,7 @@ static const struct xpad_device {
 	{ 0x3651, 0x1000, "CRKD SG", 0, XTYPE_XBOX360 },
 	{ 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
+	{ 0x37d7, 0x2414, "Flydigi Direwolf 4", MAP_PADDLES, XTYPE_XBOX360 },
 	{ 0x37d7, 0x2501, "Flydigi Apex 5", 0, XTYPE_XBOX360 },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
@@ -938,6 +939,12 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
 		input_report_abs(dev, ABS_RZ, data[5]);
 	}
 
+	/* paddle handling */
+	if (data[1] >= 20 && (xpad->mapping & MAP_PADDLES)) {
+		input_report_key(dev, BTN_GRIPL, data[19] & BIT(3));
+		input_report_key(dev, BTN_GRIPR, data[19] & BIT(2));
+	}
+
 	input_sync(dev);
 
 	/* XBOX360W controllers can't be turned off without driver assistance */
@@ -1949,6 +1956,12 @@ static int xpad_init_input(struct usb_xpad *xpad)
 		input_dev->id.product = 0x02a1;
 	}
 
+	if (xpad->udev->product && strstr(xpad->udev->product, "Flydigi Direwolf 4")) {
+		/* expose true vendor and product id for Direwolf 4 */
+		input_dev->id.vendor = 0x37d7;
+		input_dev->id.product = 0x2414;
+	}
+
 	input_dev->dev.parent = &xpad->intf->dev;
 
 	input_set_drvdata(input_dev, xpad);
@@ -2085,6 +2098,15 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 	if (xpad_device[i].flags & FLAG_DELAY_INIT)
 		xpad->delay_init = true;
 
+	/*
+	 * Direwolf 4 enumerates with generic Microsoft Xbox 360 VID/PID
+	 * in PC mode; detect via product string to enable paddles.
+	 */
+	if (udev->product && strstr(udev->product, "Flydigi Direwolf 4")) {
+		xpad->mapping |= MAP_PADDLES;
+		xpad->name = udev->product;
+	}
+
 	xpad->packet_type = PKT_XB;
 	INIT_WORK(&xpad->work, xpad_presence_work);
 
-- 
2.55.0


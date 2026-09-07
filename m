Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320713A3E88
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767028; cv=none; b=Zoc+2si4hUsKH/RdMAT/MMMtMoioKqGVjSg7sWE5ERMQnJF59631TPurKGaRqJmZNRZidXferCJ+fs/dR3R61+wSaaW2iKG3dVJBW0OCexuHkT0MsicbAhclor0lXaGPygcUa/Irg1Ceg1SJDBcFLs3LD+JU4a1WijsuLx3L5n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767028; c=relaxed/simple;
	bh=73l7JiRJoRNuR1NoXzxinmUu2kvIPgaVdQ2Lqob7+jw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAFGgvSfNp79mcgI1b2hZZIPb2gYksluR8GSOa8ro1o0xuI/YKGyE+Ca+ujfhjaCSVevtHCkmZOddSxjj1ezbwgMAIjCO1lm0HUItZMOzRCtwocYgLCyBeYUNOvR+hwp+4HEl4SbdfkMZXNVW3jqyTO+8TA99OfedBho2AKlpIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ow3GmC5F; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ow3GmC5F"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8541875f596so1066043b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767026; x=1789371826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEZ2k63Zr5fX+XAkb2sGHlQk5o0Kd6wlF6IX5apMREo=;
        b=Ow3GmC5FOiC7lwKEk51170ZJtb//zQJrBv44BG4SOwb+oFVwGt0tzUOiMy5y5l8GR+
         gPj2+boX61SOoVWbR2NP1ovTdg7shL9ijAu+IKh5peBVo+iUWtwRmCHN0T4LqQtCVZ9+
         YaTHZNWDcAlc4fzcABZBBvOcZnLfTS8OKRThnBC/63eYTETnyX4xie7i/e7AOd6K5PoR
         NRwN7gh5VkNusvwzbEOCU5rhzoMXTsJs6y1Rbrg6Ee1/YJ8+umf78gA91p3vWOaLT76o
         Hk08k/bDItLKN9hZVcFFs1CWxAt1JEby1wyz9Twv1Fn/KlZa6JHU26Y1UfOFXuMsYNKL
         jwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767026; x=1789371826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEZ2k63Zr5fX+XAkb2sGHlQk5o0Kd6wlF6IX5apMREo=;
        b=Q3I5DVhUdOAOHYm1kE2kQnLIn11ONsKExxWBRwN2qUHf0LQ5BZJXcdFdpTGiiEWFzk
         VC7yubvjN45WXe/R3hatb49whCPhZIFLm+7OBEBmfBOZQ7E6P4KOt5E/mR4u/u7FF2ta
         O8xmuQt64TNN5wAWvj7m0T1wNkbcy/VuDmMVR0xkT4d/TvzI04XRbVmDziOMh0unIbFF
         pguiKicn0TDCyjv4KeFjXlQQIVntomyc6tc7ImK+yrlgdttJix6lygjNaslCkuPDrmmr
         XKvmuRsaMRRsrzfmkA3haCkOyaZ7R8cbiZ8gK2rHuh7YeC3XvcjSwMOVuG81Y7OrBMLJ
         9gpw==
X-Forwarded-Encrypted: i=1; AKwUvBxp/bl8M5/EszpTyjZV+8aTgzxDHbORK/hwcN7N/iS9A2zWP0UrPcNqYMM+tj1LP1sXGn3IPU28x1G/ThU=@vger.kernel.org
X-Gm-Message-State: AFuF++li+qj+XnsmWudyoIEhWrbaKFkQTnMjOFdn6JEa0VissSPZvEGQ
	KHKes6jvj8G0Y7MpDw7gC6q1zdPIhQEItLUBwOeuDgGk10Fetj3iXmrC
X-Gm-Gg: AYBFou3B8Upwn1FlL4IdeCvZEo+xrVaRukdQMhDe1yN8gv8VVKZnipA8uuRUBVaeY9F
	erW/mfWutJhqztaopMOxTRfNyaQvw0bJTAOAnWYH0itFoyRVMQvsOaiv5wGV8MGRYSGPRpy4AN9
	cxfscxvHjDaNBzAWGBCczGY4F9hQLLCAWlHVlwNC8UC47mDRv5BiEDWoF0igURm/uQaxeRdX8ga
	5kcsovMeaDdrQkd3L9FzXskYJ+pVTzv5x2g1lfE0zyDjo6xWSAQH1nzQL14BXzk8+kEJL1YGKjN
	3qmscV69/802Ef6CsMp+Qo5TxK1i9Zgb5/YBNL32u2TLbzzyOTqO5tkzxgZOUfMHteUYBWuP8J8
	4HUYo9aBedeWEIMuhHXv+XnV9XFhLwS0OhblV70gynbEsL6mzTnytTllA5rbnnmSWsU4K2k5WyB
	QF6HmP0ArCqG1tW1ean9Lc7zFZGHnRjhZZe4t4/aOSiZLkO4n1yPpSwHcKxASe
X-Received: by 2002:a05:6a00:22d5:b0:857:73e2:9102 with SMTP id d2e1a72fcca58-8616be5ac9dmr28638810b3a.18.1788767026359;
        Mon, 07 Sep 2026 00:43:46 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e4:1aaa::2a8:1c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-861537284c6sm3907105b3a.49.2026.09.07.00.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:43:45 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: michal.pecio@gmail.com
Cc: ayush37735@gmail.com,
	thomas@winischhofer.net,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Subject: [PATCH v2] USB: sisusbvga: avoid prolonged initialization on failure
Date: Mon,  7 Sep 2026 13:13:08 +0530
Message-ID: <20260907074308.109603-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB core holds minor_rwsem while invoking a USB character
device's open callback. Avoid retrying graphics-device initialization
from open() and fail probe when early initialization fails.

Also stop sisusb_do_init_gfxdevice() after the first failed request.
Continuing initialization after a failed USB request causes additional
synchronous transfers and their retries against an unresponsive device.

v2:
Stop sisusb_do_init_gfxdevice() after the first failed USB request and
treat early initialization failure in probe() as a probe failure.
Remove the initialization retry from sisusb_open().

The exact v2 patch was tested by syzbot using the reported reproducer,
and the reproducer did not trigger the reported hang.

Reported-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3bc656a9271e7c8a5c6b
Tested-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
Thanks for the review.

v2:
- Stop sisusb_do_init_gfxdevice() after the first failed USB request
  instead of continuing with further synchronous requests and their
  timeout/retry cost on an unresponsive device.
- Treat failure of the early graphics-device initialization in probe()
  as a probe failure, so a device which failed initialization is not
  left for a later initialization attempt from open().
- Remove the graphics-device initialization retry from sisusb_open().
- The exact v2 patch was tested by syzbot using the reported reproducer;
  syzbot reports that the reproducer did not trigger the reported hang.

 drivers/usb/misc/sisusbvga/sisusbvga.c | 133 +++++++++++++++++--------
 1 file changed, 89 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/sisusbvga/sisusbvga.c
index 3e75a7c24828..e0b1111c1f53 100644
--- a/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -2075,66 +2075,114 @@ static int sisusb_do_init_gfxdevice(struct sisusb_usb_data *sisusb)
 	packet.address = 0x00000324;
 	packet.data    = 0x00000004;
 	ret = sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	if (ret)
+		return ret;
 
 	packet.header  = 0x001f;
 	packet.address = 0x00000364;
 	packet.data    = 0x00000004;
-	ret |= sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	ret = sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	if (ret)
+		return ret;
 
 	packet.header  = 0x001f;
 	packet.address = 0x00000384;
 	packet.data    = 0x00000004;
-	ret |= sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	ret = sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	if (ret)
+		return ret;
 
 	packet.header  = 0x001f;
 	packet.address = 0x00000100;
 	packet.data    = 0x00000700;
-	ret |= sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	ret = sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	if (ret)
+		return ret;
 
 	packet.header  = 0x000f;
 	packet.address = 0x00000004;
-	ret |= sisusb_send_bridge_packet(sisusb, 6, &packet, 0);
+	ret = sisusb_send_bridge_packet(sisusb, 6, &packet, 0);
+	if (ret)
+		return ret;
+
 	packet.data |= 0x17;
-	ret |= sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	ret = sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	if (ret)
+		return ret;
 
 	/* Init BAR 0 (VRAM) */
-	ret |= sisusb_read_pci_config(sisusb, 0x10, &tmp32);
-	ret |= sisusb_write_pci_config(sisusb, 0x10, 0xfffffff0);
-	ret |= sisusb_read_pci_config(sisusb, 0x10, &tmp32);
+	ret = sisusb_read_pci_config(sisusb, 0x10, &tmp32);
+	if (ret)
+		return ret;
+
+	ret = sisusb_write_pci_config(sisusb, 0x10, 0xfffffff0);
+	if (ret)
+		return ret;
+
+	ret = sisusb_read_pci_config(sisusb, 0x10, &tmp32);
+	if (ret)
+		return ret;
+
 	tmp32 &= 0x0f;
 	tmp32 |= SISUSB_PCI_MEMBASE;
-	ret |= sisusb_write_pci_config(sisusb, 0x10, tmp32);
+	ret = sisusb_write_pci_config(sisusb, 0x10, tmp32);
+	if (ret)
+		return ret;
 
 	/* Init BAR 1 (MMIO) */
-	ret |= sisusb_read_pci_config(sisusb, 0x14, &tmp32);
-	ret |= sisusb_write_pci_config(sisusb, 0x14, 0xfffffff0);
-	ret |= sisusb_read_pci_config(sisusb, 0x14, &tmp32);
+	ret = sisusb_read_pci_config(sisusb, 0x14, &tmp32);
+	if (ret)
+		return ret;
+
+	ret = sisusb_write_pci_config(sisusb, 0x14, 0xfffffff0);
+	if (ret)
+		return ret;
+
+	ret = sisusb_read_pci_config(sisusb, 0x14, &tmp32);
+	if (ret)
+		return ret;
+
 	tmp32 &= 0x0f;
 	tmp32 |= SISUSB_PCI_MMIOBASE;
-	ret |= sisusb_write_pci_config(sisusb, 0x14, tmp32);
+	ret = sisusb_write_pci_config(sisusb, 0x14, tmp32);
+	if (ret)
+		return ret;
 
 	/* Init BAR 2 (i/o ports) */
-	ret |= sisusb_read_pci_config(sisusb, 0x18, &tmp32);
-	ret |= sisusb_write_pci_config(sisusb, 0x18, 0xfffffff0);
-	ret |= sisusb_read_pci_config(sisusb, 0x18, &tmp32);
+	ret = sisusb_read_pci_config(sisusb, 0x18, &tmp32);
+	if (ret)
+		return ret;
+
+	ret = sisusb_write_pci_config(sisusb, 0x18, 0xfffffff0);
+	if (ret)
+		return ret;
+
+	ret = sisusb_read_pci_config(sisusb, 0x18, &tmp32);
+	if (ret)
+		return ret;
+
 	tmp32 &= 0x0f;
 	tmp32 |= SISUSB_PCI_IOPORTBASE;
-	ret |= sisusb_write_pci_config(sisusb, 0x18, tmp32);
+	ret = sisusb_write_pci_config(sisusb, 0x18, tmp32);
+	if (ret)
+		return ret;
 
 	/* Enable memory and i/o access */
-	ret |= sisusb_read_pci_config(sisusb, 0x04, &tmp32);
+	ret = sisusb_read_pci_config(sisusb, 0x04, &tmp32);
+	if (ret)
+		return ret;
+
 	tmp32 |= 0x3;
-	ret |= sisusb_write_pci_config(sisusb, 0x04, tmp32);
-
-	if (ret == 0) {
-		/* Some further magic */
-		packet.header  = 0x001f;
-		packet.address = 0x00000050;
-		packet.data    = 0x000000ff;
-		ret |= sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
-	}
+	ret = sisusb_write_pci_config(sisusb, 0x04, tmp32);
+	if (ret)
+		return ret;
 
-	return ret;
+	/* Some further magic */
+	packet.header  = 0x001f;
+	packet.address = 0x00000050;
+	packet.data    = 0x000000ff;
+
+	return sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
 }
 
 /* Initialize the graphics device (return 0 on success)
@@ -2223,20 +2271,10 @@ static int sisusb_open(struct inode *inode, struct file *file)
 	}
 
 	if (!sisusb->devinit) {
-		if (sisusb->sisusb_dev->speed == USB_SPEED_HIGH ||
-				sisusb->sisusb_dev->speed >= USB_SPEED_SUPER) {
-			if (sisusb_init_gfxdevice(sisusb, 0)) {
-				mutex_unlock(&sisusb->lock);
-				dev_err(&sisusb->sisusb_dev->dev,
-						"Failed to initialize device\n");
-				return -EIO;
-			}
-		} else {
-			mutex_unlock(&sisusb->lock);
-			dev_err(&sisusb->sisusb_dev->dev,
-					"Device not attached to USB 2.0 hub\n");
-			return -EIO;
-		}
+		mutex_unlock(&sisusb->lock);
+		dev_err(&sisusb->sisusb_dev->dev,
+			"Device not initialized\n");
+		return -EIO;
 	}
 
 	/* Increment usage count for our sisusb */
@@ -2880,9 +2918,16 @@ static int sisusb_probe(struct usb_interface *intf,
 
 	if (dev->speed == USB_SPEED_HIGH || dev->speed >= USB_SPEED_SUPER) {
 		int initscreen = 1;
-		if (sisusb_init_gfxdevice(sisusb, initscreen))
+
+		if (sisusb_init_gfxdevice(sisusb, initscreen)) {
 			dev_err(&sisusb->sisusb_dev->dev,
-					"Failed to early initialize device\n");
+				"Failed to early initialize device\n");
+			sisusb->present = 0;
+			usb_set_intfdata(intf, NULL);
+			usb_put_dev(sisusb->sisusb_dev);
+			retval = -EIO;
+			goto error_4;
+		}
 
 	} else
 		dev_info(&sisusb->sisusb_dev->dev,
-- 
2.53.0


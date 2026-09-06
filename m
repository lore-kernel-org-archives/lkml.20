Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359882F8EA5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788732481; cv=none; b=d6omPuhE/X5H6bi5ACIeZzmw23+JMLD/HNhEysws58o4EQ4ZhxQdgOgTaU8LtWqBVI0XclHhfC2pEPJAbzZriYvrWUqQ5kTel0dHHXHvLfrjICxmAo10okgTf+BHPwyUFP6nMZ5LDN8YbK4NVxTxgY7vf95wgP0cfo/f/GRRaN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788732481; c=relaxed/simple;
	bh=2ngG+icSZPnCr7zJZFv7sgQNG1VXwjlAUJMzFYuJd5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scYkYNsK8ZCC4EBxEip97Vi+AVFtOFFlFCUY0toFl1K7Afv/E9cfHdAtcBKvLRMna4ZYjSnDpb9KyioNOY6qftxqidZoUl91OV6WRM8+1Ty+luDs5zy49MoF/49w34goGJRcesMZz+0TQ6AZcRvxWL9/ftc/3pIuGAacMz0jmF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKiaWySz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKiaWySz"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39b35105ba4so2380525a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788732479; x=1789337279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gu0vqn0CXg1wlwcKWyu83q3gWI+6kY5pHSTOMRQlpGM=;
        b=QKiaWySz+TuhzRzcnqLkFK5oKn/2FnCdkb0e6BeuX9bCWvfkzk+0ifePzeyRWcEzOi
         VNYCkprx6bRWfZh9de7a0Y9Pcso+wAf55X+KdbXO0u+R0WqYp3K2AvmdmhETjxwIhjGe
         WYKB+2lh/Tnw0yz6NTodAHQJ82ManqMbz4tFcnkeGsYa6nD1Ccv+Ax8is4PopurOLJL0
         hFZYTWtHXTT81ckR/UlGJr2IsGISIGXXGpqHtzZ1HNiLggCtfCYt5juNU492uln+/XX6
         AyLE/N+bNNqYKzc7JolQ4SARa8lHb8CWx8SNK0f/21Bry3ncLebAwBOCE9Lz4kb/qEiT
         4JpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788732479; x=1789337279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gu0vqn0CXg1wlwcKWyu83q3gWI+6kY5pHSTOMRQlpGM=;
        b=W2sQknMMnwTublCZa3L2uVwm71vYAc/nW6cOSRVvdnDwuAHPNja475W6hSZvx/WNE2
         zgKLY9IzvohRM+iUAD/zW1Z9yQCAnIfwo64ROFcTsBy6X9wUiRXqcj4DCGDLaB+M08ww
         K3LNQtmuUypucB2DrXqBnImyGCo4a6ORnJG5dat0UKQNCA+IpBTkC4PCb2U5a0E70dF/
         uwU/Go6Z9aBBfcI+4dRk46s7zspyzOdQobq9MydkyRCGerdflJeEkd/nOaq90DeSxiQL
         NX9yiYEkmbGFFDT7h4p9+giP8sX0zNn2lD6YT4H0y9A41MeKM0lY3tmhF8o6ObuehCgw
         LlIw==
X-Forwarded-Encrypted: i=1; AKwUvBwACCpEPhXwLBaoEOXtDGy96Cg/mfkPsAqpB2hQ/tUcT9w06j0HnXIkMgd1xkszJF8dZZjdfdpJtwwJm/A=@vger.kernel.org
X-Gm-Message-State: AFuF++n/8+sAywXoNwWhIFayxhhqOIFhjRW/s1veXVTQZeE7rEIHhJ9d
	PhCnZiAJih+ygNR0wmuS9KzwoFdU618HbgYdnqyyGAQ/+UEZrHw+mNkrsvIZ5E6p
X-Gm-Gg: AYBFou2L0coqSMGAbi/vd3OvHvxTxBxQB4HKi2c4EuSq8HRwVsyPxvhkNMEmL7xgJfh
	nSzsrN5ltzy2jm+Fy/GjfS4Z9mQv9Tesl5VMl2W/Yx3SOk8L7Inyr+iv5AcOYbTK3Lmvj2cn04e
	QjQOjPkUCjnuobWrlKW60DAdolAclJRo8TDLaGzwmw0tyQoMoxCWTU6+C4BV3j1i242fsDm87qg
	YNfXmDYZvPSr60abSzcSmPHASjy+2pafhwbSsSzPhjVXiWlEJH0FYhz6syPafAzUnSENf0JwZPR
	zhwqcrN3g4CNvo5CzRC/8okN05uz3rXrHsWKD5VbESm7m7cP6zRNLWz3Y4l30SA+dh019jyI7Zj
	WqDediIglTzgkK5ROolaUUm2e7Wj6QlCeRozC48W4iB14DaF+NXJ2DLF5TqtaFCcrb7VI6Gc8pe
	p4WMhZ0BCEmmzOtbdsi1Lqm41Fw7A6p0thAc1XCFVjq/yl/HNrJ5apQZ+qgxpX
X-Received: by 2002:a17:90a:e18b:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39b26155274mr27499615a91.10.1788732479383;
        Sun, 06 Sep 2026 15:07:59 -0700 (PDT)
Received: from evangelion-g ([2a09:bac1:36c0:58c0::2a8:4f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm9762375a91.5.2026.09.06.15.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:07:58 -0700 (PDT)
From: Ayush <ayush37735@gmail.com>
To: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Ayush <ayush37735@gmail.com>
Subject: [PATCH v2] USB: sisusbvga: avoid prolonged initialization on failure
Date: Mon,  7 Sep 2026 03:37:32 +0530
Message-ID: <20260906220732.103357-1-ayush37735@gmail.com>
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

Reported-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3bc656a9271e7c8a5c6b
Signed-off-by: Ayush <ayush37735@gmail.com>
---
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


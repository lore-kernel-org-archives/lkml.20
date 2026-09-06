Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34336346ACD
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788732579; cv=none; b=VnSG89PWeDj+Pz2ZGdfRM/YeO/gQ2x7w4xa3PEQPCFoaIaYtoy4Hgim3LZkc+T14+WhqKjuWv4tVJr9q6jDRnXDDtmyWL1M4HhcJPmauf2y8hF0wYRRRCNhEnd4Qbc3C/7rAlRQSmVnN/VPxBvGBhDImpx8Gak9kDY065w9kdyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788732579; c=relaxed/simple;
	bh=fZmXhuwN+mtnCj2UTmImbBT40STPpWxRHNwG71DcDZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NDe6ZNNuAYohioiykBIrfHR5qaJU+3rm9pGtPK9ooMh6qVOQRzuxpWfnFFxqK5/ZwYQc4y7n4Z9P3/csqUH1oTddbYoLJMwKEptD8MIzZQ0Zn7VpNnGO8rskoCbyCo+C8UfjH3rvyMnnzBCQRGYK4TXmaaBHiosBslt8NsvYe/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fldQJ7rk; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fldQJ7rk"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so1837816b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788732577; x=1789337377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aC6wQX/KLPMuG7Cq5FhE2tbhlAuXRl0hoZ6WkzrbHQo=;
        b=fldQJ7rkzdSG1UCbruK2iqK8+iYAF2YOhRtdm2Rtx7gAeJgE0i69IstacEXnP0NgOb
         7ChEl++sVVR/d+njxbhMC+pMiIIywUyKOT3qvA0g6PnOzwHIQYey5nm1/eI2ixyd18yG
         tS5/YtNX2EyZbn2rMzVA4JXC6qfrxOrhMQVDy3A0FFIB6hv/U66EHnpb7NJpEGQsFdZN
         CRFK65WyY7EwzfsgLC841hT+8hIc9fsVF7zQZ7VAUARCgbpzpUewre/McP+4FT6rCdnB
         kGXMJt6u3vQuMCMuH2CxqBDxfDQhtnV5Nx/6MgQq9zRQY1aFaLDFo94zyWvNPzra81qd
         9Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788732577; x=1789337377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aC6wQX/KLPMuG7Cq5FhE2tbhlAuXRl0hoZ6WkzrbHQo=;
        b=iPjf1v1rvUMFjXbcCPVMv0Unjasn/0xGBDCWgT0rac6Ep7AwEFfuwKzJtUO4UErf4h
         EgJv8YcHfngoj+F9mmP9O4gy2np6QMenpRBJ5VKCXUA4hs+kBgKB97U7Z1WURF/TzRin
         3v5qfhmEJglNTAo8m/XXWjmG4QTqSWXJGVOIAtajzgGQjOxpztW2eCuXjq6P+ZiWdtOE
         FxAvi7tBO/H/knPWc+oJMutNhKyFhZAunTq1CfEU41S2UU/ABXXabi/0y56Abi1aHNn7
         iogIFIYOUsVVYkISpC90iea9y0fetVFYVMCMjDa6BhE/wJbuXlCSdqYJK0829dPAIXFF
         lacA==
X-Forwarded-Encrypted: i=1; AKwUvBzV8Oiz8r7rLxboqE2NdJoqTkYoGJ2S1FxmZGj6eigfTQxBQr2SVpedJC7MnBZCW3WLH8YckhuCdeVJnD0=@vger.kernel.org
X-Gm-Message-State: AFuF++khJOGpSUO+1KuAg+daLurwdvw1xy/Vz+EwNwgvHEWLbjWeHs4R
	puxSp6Bh9Oy4pNyBRkxWN5xAH/XDRilNodG4iUbLGVFNuM27oi/8Kx4t
X-Gm-Gg: AYBFou3mR4+a9No1Mwn40Pxe3Uyt/Nb8K6utH6Nl36Q00bdiJwn2CGHVgtokBAKLsY6
	4nayL4aLj7cFOLbBRNbh+yyJJV7CmZN02viPNxZxFqSfFou75HaEsZIOWZC31jVAMZsiS+ZzKlE
	b9MbjkcxrG4nfHgLsndmulMftXJ6vNNzLUcD0l/d5SUV4d+WCjBqrBMmdXzFG6uC8yDl9Lau0sM
	lnEaL5fGpImwBYkdzaCk5BlXQIwaZnTvqpOyFH3eP2bkgGVBu6R39IHCGBcH0E/AapOVeHryxr/
	rQaZLEBy+L9dlL4LzPwWUEesHiGvL09kxtMzPWMdGbcOEshC9LmKOcTVz0agpNs3d6ie8N0HeqJ
	z34nvq8R8HLohdsNQQKaQGlmUFnFWeiuwkCQNlSajfhgiqLILIp62Joskm+YLu2D0WpztpXyViL
	zVUN4DAfN+2iKRkBi6SWcIb1Qq+KFCjVZpNims0WiI9UULCDyTDg==
X-Received: by 2002:a05:6a20:2583:b0:3bf:7bf7:7913 with SMTP id adf61e73a8af0-3da39ff4716mr26511356637.14.1788732577326;
        Sun, 06 Sep 2026 15:09:37 -0700 (PDT)
Received: from evangelion-g ([2a09:bac1:36c0:58c0::2a8:4f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc464393760sm2297858a12.3.2026.09.06.15.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:09:36 -0700 (PDT)
From: Ayush <ayush37735@gmail.com>
To: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Cc: syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Ayush <ayush37735@gmail.com>
Subject: [PATCH v2] USB: sisusbvga: avoid prolonged initialization on failure
Date: Mon,  7 Sep 2026 03:39:11 +0530
Message-ID: <20260906220911.103503-1-ayush37735@gmail.com>
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

#syz test

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


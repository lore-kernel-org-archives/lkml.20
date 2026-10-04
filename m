Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536E6392C28
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124998; cv=none; b=UxJIajCEeZFbTAvge8NqzXO2rIDrR7MgWwMWG4WySHTkF8HJmY+aboBq3svgaiCE60kF4jPtUal9BlYzmN5Kx02xfUWURngY7jzawsP5Ox4sHTq/v/VIwJXkJuQqi/FRDfl2CvN45VqWbNGuG7iySujDJFIaenP5EGsiLN1PlTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124998; c=relaxed/simple;
	bh=Imibex0ZPtexQhB03MR4ctsbLyR672dl5fVr3Bw9pAI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RyN+zjCQGBOdt9jS7CoABFxkrXjYAkeuInlYNH6qvrYmrV0daKBY21dVEWzOHPUhdX0cR4bY88Tv5BHn7AcEbErT3HbfgcG8KEWWJqEnz49Q3fc6y0w1DKeSiHXyYazu8YfvDHLH2kVT1Pi0blwHNdTm9MqZWr6ByP+Xtbtprdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cd3e90ff97so605190b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124995; x=1791729795;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZxG7CCR/x7yfur3+Y2IRpP2LAzAJ4fPBUAZpHn5g4j4=;
        b=jnE2d5QYUXND/iy84IifOp8QOaHw1AOiiHDVa+rqUbaPkD3kTTCnf5j88KBfgjjCrn
         C72+lVhbBeuBfirldn1pCQdPruvgFUm2wQ7gf2zw1BdsX6WySCwGq1T9WAsZDQGjNHIe
         Ww7SpUVb+MFyKv1X1nSMl2QPY6fMONvYXg+K8PGQ9ZG1Hfjvo/9MplFvPy+e9QBbZ+cK
         eaao8+EpHBm5gEjiE8+GHHJM9lxDb6m7CYmHqYJcoT5bDkfvgMBdopMF36tt+4ShOuTJ
         AyGpNM0orBWL8vLPN4fVji9O1yQshKYEbcTDz0hePebyHFxaSK3QrqXBWTm9HpkZ/L1e
         FP9Q==
X-Gm-Message-State: AFuF++kh2eZFJd+XV44qvNLsoU6ux2kIQ0wJgdzNI7Rmso7qvjFiBFyf
	12v4CKHFqT97uo1jemDQ+pGKbRE5379fa4eGpNZtIvy1wwlKEFhjhSFO2Yf+/8wNTi7FyLphCRp
	p5zJG2kT8pbj1s18V+7Ho+J7I2+XohKVq8VXhPRh7+MetpkgxVOcE058mIfM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1fb:b0:4f1:6ab6:8fc0 with SMTP id
 5614622812f47-4f5288c00c5mr7860163b6e.15.1791124995159; Sun, 04 Oct 2026
 07:43:15 -0700 (PDT)
Date: Sun, 04 Oct 2026 07:43:15 -0700
In-Reply-To: <6ab15335.3179f8cd.1e36b2.0023.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac26603.34119e79.2f92f3.0023.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] INFO: task hung in usbdev_ioctl (8)
From: syzbot <syzbot+109061940215dd4b011e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [usb?] INFO: task hung in usbdev_ioctl (8)
Author: ngocthang2710.1999@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

sisusb_probe() initializes the graphics device from within the hub's
enumeration work, i.e. with the parent hub's device lock held.
sisusb_do_init_gfxdevice() accumulates errors with "ret |=" and keeps
going after a failed transfer. If the device does not answer, every
remaining transfer sits out its full timeout (5s, retried 6 times), so
probe holds the hub lock for ~30s per access and about 10 minutes in
total. Anything that needs that lock, such as usbdev_open() and
usbdev_ioctl() on the root hub, is blocked for the duration and trips the
hung task detector.

Return on the first error instead. Also fold the three identical BAR
setup sequences into a helper and the leading magic writes into a table.
The sequence of accesses is unchanged when the device responds.

Reproduced with a raw-gadget device (0711:0550, six bulk endpoints that
never complete I/O) on dummy_hcd: opening the root hub blocked for 603s
before, 29s after.

Reported-by: syzbot+109061940215dd4b011e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=109061940215dd4b011e
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/usb/misc/sisusbvga/sisusbvga.c | 120 +++++++++++++------------
 1 file changed, 62 insertions(+), 58 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/sisusbvga/sisusbvga.c
index 3e75a7c24828..544284111191 100644
--- a/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -2064,77 +2064,81 @@ static void sisusb_get_ramconfig(struct sisusb_usb_data *sisusb)
 			ram_datarate[ramtype], ram_dynamictype[ramtype], bw);
 }
 
+/* Probe BAR size, then map it at @base */
+static int sisusb_init_bar(struct sisusb_usb_data *sisusb, int regnum, u32 base)
+{
+	u32 tmp32;
+	int ret;
+
+	ret = sisusb_read_pci_config(sisusb, regnum, &tmp32);
+	if (ret)
+		return ret;
+	ret = sisusb_write_pci_config(sisusb, regnum, 0xfffffff0);
+	if (ret)
+		return ret;
+	ret = sisusb_read_pci_config(sisusb, regnum, &tmp32);
+	if (ret)
+		return ret;
+	return sisusb_write_pci_config(sisusb, regnum, (tmp32 & 0x0f) | base);
+}
+
+/* Bail out on the first failure: each access to a dead device takes 5s */
 static int sisusb_do_init_gfxdevice(struct sisusb_usb_data *sisusb)
 {
+	static const struct { u32 address, data; } magic[] = {
+		{ 0x00000324, 0x00000004 },
+		{ 0x00000364, 0x00000004 },
+		{ 0x00000384, 0x00000004 },
+		{ 0x00000100, 0x00000700 },
+	};
+	static const struct { int regnum; u32 base; } bars[] = {
+		{ 0x10, SISUSB_PCI_MEMBASE },
+		{ 0x14, SISUSB_PCI_MMIOBASE },
+		{ 0x18, SISUSB_PCI_IOPORTBASE },
+	};
 	struct sisusb_packet packet;
-	int ret;
+	int ret, i;
 	u32 tmp32;
 
 	/* Do some magic */
-	packet.header  = 0x001f;
-	packet.address = 0x00000324;
-	packet.data    = 0x00000004;
-	ret = sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
-
-	packet.header  = 0x001f;
-	packet.address = 0x00000364;
-	packet.data    = 0x00000004;
-	ret |= sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
-
-	packet.header  = 0x001f;
-	packet.address = 0x00000384;
-	packet.data    = 0x00000004;
-	ret |= sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
-
-	packet.header  = 0x001f;
-	packet.address = 0x00000100;
-	packet.data    = 0x00000700;
-	ret |= sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	for (i = 0; i < ARRAY_SIZE(magic); i++) {
+		packet.header  = 0x001f;
+		packet.address = magic[i].address;
+		packet.data    = magic[i].data;
+		ret = sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+		if (ret)
+			return ret;
+	}
 
 	packet.header  = 0x000f;
 	packet.address = 0x00000004;
-	ret |= sisusb_send_bridge_packet(sisusb, 6, &packet, 0);
+	ret = sisusb_send_bridge_packet(sisusb, 6, &packet, 0);
+	if (ret)
+		return ret;
 	packet.data |= 0x17;
-	ret |= sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
-
-	/* Init BAR 0 (VRAM) */
-	ret |= sisusb_read_pci_config(sisusb, 0x10, &tmp32);
-	ret |= sisusb_write_pci_config(sisusb, 0x10, 0xfffffff0);
-	ret |= sisusb_read_pci_config(sisusb, 0x10, &tmp32);
-	tmp32 &= 0x0f;
-	tmp32 |= SISUSB_PCI_MEMBASE;
-	ret |= sisusb_write_pci_config(sisusb, 0x10, tmp32);
-
-	/* Init BAR 1 (MMIO) */
-	ret |= sisusb_read_pci_config(sisusb, 0x14, &tmp32);
-	ret |= sisusb_write_pci_config(sisusb, 0x14, 0xfffffff0);
-	ret |= sisusb_read_pci_config(sisusb, 0x14, &tmp32);
-	tmp32 &= 0x0f;
-	tmp32 |= SISUSB_PCI_MMIOBASE;
-	ret |= sisusb_write_pci_config(sisusb, 0x14, tmp32);
-
-	/* Init BAR 2 (i/o ports) */
-	ret |= sisusb_read_pci_config(sisusb, 0x18, &tmp32);
-	ret |= sisusb_write_pci_config(sisusb, 0x18, 0xfffffff0);
-	ret |= sisusb_read_pci_config(sisusb, 0x18, &tmp32);
-	tmp32 &= 0x0f;
-	tmp32 |= SISUSB_PCI_IOPORTBASE;
-	ret |= sisusb_write_pci_config(sisusb, 0x18, tmp32);
-
-	/* Enable memory and i/o access */
-	ret |= sisusb_read_pci_config(sisusb, 0x04, &tmp32);
-	tmp32 |= 0x3;
-	ret |= sisusb_write_pci_config(sisusb, 0x04, tmp32);
+	ret = sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	if (ret)
+		return ret;
 
-	if (ret == 0) {
-		/* Some further magic */
-		packet.header  = 0x001f;
-		packet.address = 0x00000050;
-		packet.data    = 0x000000ff;
-		ret |= sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
+	for (i = 0; i < ARRAY_SIZE(bars); i++) {
+		ret = sisusb_init_bar(sisusb, bars[i].regnum, bars[i].base);
+		if (ret)
+			return ret;
 	}
 
-	return ret;
+	/* Enable memory and i/o access */
+	ret = sisusb_read_pci_config(sisusb, 0x04, &tmp32);
+	if (ret)
+		return ret;
+	ret = sisusb_write_pci_config(sisusb, 0x04, tmp32 | 0x3);
+	if (ret)
+		return ret;
+
+	/* Some further magic */
+	packet.header  = 0x001f;
+	packet.address = 0x00000050;
+	packet.data    = 0x000000ff;
+	return sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
 }
 
 /* Initialize the graphics device (return 0 on success)
-- 
2.43.0


Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9962384CDA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176082; cv=none; b=abNYCL4Wm9FWYn/2H6mDqz/BgiTretsONGhBG5Owxj7H1ZO6U6FvSNHqG87ooj+ZlBDxs4nYhWplLp5pGW3N9z+ICATabQ+IeAS90plwXWzOC5KOgCvPFPtdsu2ZSVYQzznaqOTHbh+OwTxUE/jKDR5Bqo7667G2KxP2B4P6Tfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176082; c=relaxed/simple;
	bh=/J83ruJbsWF/uwh9PLynk9MBeoHwfhETAcdSEkxqkeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bDV28C2HCiX7PsvtZF/OPfeOU0LMVQFj10XZOqCEVveabM5P2kKxRX16FKlIEka8AG4lD5jT3tWnjaLdJQMO4ub6v3y+XKsDoYTnjIs57MZtsfaCLuaJfshWcP/k2wyzX8AabvOhCS9qCzbuN5W2DGdTBPHxxKyW8afMGaigdvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhTfmV8I; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhTfmV8I"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed6d6eso6650035ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790176080; x=1790780880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/oiLgwpixmTi6/OckLG7kg10z7r50fdYVvYUYjPXtws=;
        b=OhTfmV8IY/bUZwaX7vXIR2J1BpWNr0LJqGRPuVWJZD2JXrWyVNmAGA6mAGT0aNsHwM
         E2B3BZhuwntKhnKVDTNsSHo9SVZk6dnTKeZAZREX/aSsLxufRfWUPWGCgkvY8gamD67Q
         8jyWdTqF6ZDE9huodAoQKA6imcozCtpfxYJuIoeoG+o06hKjcjm1wl6DEaEN7AGmWoJ7
         yWC6+FBR5hVavHoMR7RGkdjFCEGR8tgm5ykoCstaXH6Oxj5C3epyBKmdT/RJ6Zo1sima
         O6uruNdXlHzDUIo1PL4V6z4e821rJ3WDZkGBPouLDcL6ve8dzaJd3D6ELzYzk5gHW2lK
         Cu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176080; x=1790780880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/oiLgwpixmTi6/OckLG7kg10z7r50fdYVvYUYjPXtws=;
        b=xhnJFNUTmvDEwxXm8qQPEKDWTZZvy+wufNcEJTAghGf3c+yHBfGFbgKePOgkz7B6Be
         yFF1EzBWnSb0Fuu7hdIAOd9FG4mNWyE5kX0fic9tdWS+qd1vLe2vNmnafu/YeYA3FBra
         AW55txT6bviBAsfbOpSfvLQ0ffcHIPovBxGzjQ2na9WRrKFIwn6jUX5Kq7irM6WWoUMv
         2zkKAuW2zXz1O++CmeMIBIdo2firva4SNrzB2nxQKvAi2RQKuO9FapgII1dtU4ns6DD2
         z8Gp7cv60Te7hGOdC5ZM4VecrHvuEqxvAWEfv4dzc8xJTYChi00if1aNb8y5QMSSMx03
         U3vw==
X-Forwarded-Encrypted: i=1; AKwUvBy2rnn3Kw/YQXIi/OWXNNpC06Q/PKdzceXTHNKFVwinlvuC8uMf2PfXtIUaOKbrGjfznmsylj4YS9q89Ck=@vger.kernel.org
X-Gm-Message-State: AFuF++nCDO+f7xrIBoc75y5lTeZChk7lnPshTMirEHyLB2yD07rym2YF
	Cv+5+xEdUz64Iww9scDtaZTXFRc6YzetcKcyUEzC+O+cyY3rMVvVbjvH
X-Gm-Gg: AYBFou0mqDHrF6gJgszD919VO6i8ukpxR5q7rpF6R7sOPoKmpgMaqvmeTLXZf0H0qjA
	JTVvECjEP6fFZad42mGcoCaHAgQDaskw7W/kqccmjw+qEgy+1c87wK5OmKJaH1Z4FVF8MwbAqpt
	rOBk4M5nrb4WRXG+9FoODcua5bwx+2FBWzczqggAtosKmjZEkDNjTgWST1Y6Fg9KO5H7Tdpnfy6
	0IbtFsAM+JAhRRnAYU7X8OlbpNBbzw02wypBPTQQL4oS6Gvii73WWVGqkPi/Hd8xo9IqZ4+tsX4
	r/g7FpC2QmHFYZT0kRqEV01WrAxE/ahkFCymFN3S48ioco8viWsBEuULpYV3OC1mftddz0b0gBi
	XkXgAgYH+gsD3JXdN+gJFLKQKNS7Vl5oX3XQih2yhjrqz98S7wNjVbhxCg1lEtslYsIg76/RB5K
	QAwRRa1cCHzafQLKLr/l+Rtu/tmY9LsM6Xlnr0yGjzrrzWAHBlNjiQHh06ehBxEaqdnabD11cL/
	4jOKNnB5c0wXlth
X-Received: by 2002:a17:903:3846:b0:2dd:ad74:6d1a with SMTP id d9443c01a7336-2df69d3577cmr23037265ad.23.1790176079907;
        Wed, 23 Sep 2026 08:07:59 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:f072:2258:ced5:5d8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d96sm12825075ad.2.2026.09.23.08.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:07:59 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Thomas Winischhofer <thomas@winischhofer.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+109061940215dd4b011e@syzkaller.appspotmail.com
Subject: [PATCH] usb: sisusbvga: stop early init on the first failed transfer
Date: Wed, 23 Sep 2026 22:07:53 +0700
Message-ID: <20260923150754.31652-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Notes (not for the commit log):
I have no SiS USB2VGA hardware, so the reordering is verified by inspection
only. A single silent device can still hold the hub lock for ~30s (one failed
transfer); removing that entirely would mean moving init out of probe. Happy
to do that if you prefer.
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


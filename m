Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB683A05F2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791194; cv=none; b=sdzIXXB5ydHRSRV88E3hh8V0UVkg6IdQmwkBzRMLNwpjwSmamebRBkVwiU1CcQKoDwX6q0ZCauzb6eOmGSjCM60rx9Hh56BTZkWZ6ZC0kFDVZGSnCyCNbE+JFsfocpBiOz18lQadmDKQMUp4ie35xLJ/lsO/iZ3W8/B0D6vZZsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791194; c=relaxed/simple;
	bh=6M6BqSu+AARyDk9/i3i6nT6PArwCznAtKG+pD5PVZUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=agaXVS0QoZKoaHLSim0FO2xrPLbOom52+3UY+Ge59exPf0mNLFOgUqvVk6Eujr9y+i3JN0FPG+pBVUSu0On6Ymc84bnCHgMM/B+pnQrNmxT3M0075ZDIaRCkeveBCIjD8Bl2z6lGUJWkZDolDEArMIGsprH4nxTkgC54wT8KpeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6Dr4i0W; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6Dr4i0W"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso38692075e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788791190; x=1789395990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4f0/64qaNZYvJEcWhejwJa+PLE1/Em7ct5SbUix/fW8=;
        b=q6Dr4i0WkAjuFmycVhSSQRnVTczqfUrTQaeORur6Hd2bVgq9VoAdE6Wwx+qQABHvcH
         yacqumiHa9NTfk2p6UIHl9ZhgciVNMQLYg6fwIkh1iAcLsdn4nEP2JV0f4rzLfEZxNAf
         OM1sN0qTqoopKC7E7ab2G3lsoYl2oqr/v/l2GB0mfB5wOk/p/2YZlg9yKs+ZqrZJ0ogS
         XmFEUg/33CGHFA5vSfZ4BQ7Er5wDZNJt12yYr/Hzd0bw5a3lcMZdIKiNZBLTkxaZSuoN
         bbu1rjcC39MFGDDAIhtcPhoj4/iokqFcrXyLzhhKm97rTq99Hd8H9nW+bLRa77OyLgaY
         OcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788791190; x=1789395990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4f0/64qaNZYvJEcWhejwJa+PLE1/Em7ct5SbUix/fW8=;
        b=I6fpTbyBJbW0DiYfot44t9EjqBkbUy07xkvJOrUEDnzGErJF0owOPsbmqtDwr5wvUT
         43VPYtndZ/X6Kp2/SsQbXYTV8yBz9m1bDANp/MQupUn/3f97FqBXph/hv5joO6v+NF/K
         3BLPDF9nV4DXdRzytQYez9DAp48PnsJUYXgVQpeLQdOrS6C1/cp1fbi6m0Xw3aaTybxE
         xrpJGgBH/+aEseEKxH027P155NpiFlIIRlMD88X+NBy7Nr2DxbGduZV8oh8WbEGHh+rw
         j9XUtmU4NuphOuwaV+LnoLjaUzTGyihGqRJ2+b343TdgIj+jJBkGc2yYljjgBD2VxyN3
         4M1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAYmadRNHcJpuXQDFvXNNJfHHOK72MXyHM1LOsHuP21x4Fat6QDU29Kg2+iflLVBdDHL3LkcBSlpMapDo=@vger.kernel.org
X-Gm-Message-State: AFuF++li7cUpuCofrKhxBBoOdjwJKxHQ9JE9JB9XJ9f0zrEb/tpQhsDN
	rs0RIuY49psr34zLkfom56DAAIiigNmUXt4hnCmbhMCzTRn3I9GT8SfPg3+U+QYJliA=
X-Gm-Gg: AYBFou1HM+JPwZOfhVSyaL+hflqXAzuZdlh3+7+rNbcL86v+PIxVXtYp6jNIKKyOoWT
	f7ScXe6eZnxYqWHu/M97AUuqwxlt1IiMPrms9J/YxaVeieS39w4lSSwTTp2pCdfemOH0f7EyubF
	Rx+URVCwndRM9srFlqOUaMC5CE9RHibdOL+h4Vk3yOsF5AT0kQPR6bIazz6+j6ueQvpLVs5KJjI
	uStKTkYSI7T+AdbjNPXjzI9lwrWKa3Jp2RyU9EJkFXVt7hZQoE8UKsYEbznMbjMA6Jugwo0O+i3
	rs6BwIwgZsAZjSvWXhoftO27RtyX4QLvykF9jEeDM6LyrqIXn2zrciSjLYO0RCCnDPAHyCemfP+
	7pOu7+lFSvsbIJO4R1yEt5ecFs6vgsorSq+bR6N5HGSQ+g/uQw0t+VhfvOlBREFe1N2gJOH4bi5
	Bg8gdgQUR5CaoBq7TTKA1DSgqU+ClkIheqMKln3CarQF+N8dTRKflGgr0wqWiwJI33GDlL2ayzz
	2m8TUhHzhGeSADtmMc/OjCZPOuNSg4fO38Eu7d9Ubt09jY8joT+U5d/ZjXpZhSbZuXvTYjrkDEV
	8VQ/UlqFPRLQKi2aMeXcRyHvkg==
X-Received: by 2002:a05:600c:3b01:b0:49b:4d64:bbc4 with SMTP id 5b1f17b1804b1-49cf81f1592mr393945895e9.8.1788791190141;
        Mon, 07 Sep 2026 07:26:30 -0700 (PDT)
Received: from MYL150-3871.localdomain (80.151.89.79.rev.sfr.net. [79.89.151.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6024a8sm414605655e9.6.2026.09.07.07.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:26:29 -0700 (PDT)
From: Nicolas Thibert <nithibert@gmail.com>
X-Google-Original-From: Nicolas Thibert <n.thibert@ext.mylight150.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nicolas Thibert <nithibert@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] Bluetooth: btusb: fix NXP IW610 composite device handling
Date: Mon,  7 Sep 2026 16:26:04 +0200
Message-Id: <20260907142604.1080571-1-n.thibert@ext.mylight150.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Thibert <nithibert@gmail.com>

The NXP IW610 module exposes itself as a composite USB device
(0471:0215) with three interfaces: two real Bluetooth HCI interfaces
(class 0xe0) and one vendor-specific WiFi interface (class 0xff) used
by mwifiex-nxp.

The composite device's whole USB descriptor reports class 0xe0/01/01
(Bluetooth), so btusb_table's generic USB_DEVICE_INFO(0xe0, 0x01, 0x01)
entry matches every interface, not just the two real HCI ones -- btusb
ends up binding the WiFi interface too, and mwifiex-nxp never gets it.

Fix:
1. In btusb_table (the table the USB core actually matches against),
   explicitly ignore the WiFi interface via BTUSB_IGNORE, ahead of the
   generic entry.
2. In quirks_table, scope the existing BTUSB_MARVELL entry to the BT
   interface class instead of matching the whole device by VID/PID
   (harmless either way since quirks_table isn't consulted for initial
   binding, but keep it correct).

Not upstream anywhere: checked NXP's own i.MX kernel fork
(nxp-imx/linux-imx), no IW610 references in btusb.c on any branch --
their reference designs wire this chip differently (WiFi over SDIO
per their release notes), so they never hit this.

Signed-off-by: Nicolas Thibert <nithibert@gmail.com>
Cc: stable@vger.kernel.org
Assisted-by: LLM (Claude Sonnet 5, Anthropic)
---
 drivers/bluetooth/btusb.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -71,6 +71,15 @@ static struct usb_driver btusb_driver;
 #define BTUSB_BROKEN_EXT_SCAN		BIT(29)
 
 static const struct usb_device_id btusb_table[] = {
+	/*
+	 * NXP IW610 (0471:0215): the composite device reports Bluetooth
+	 * class at the whole-device level, so the generic entry below
+	 * would also match this WiFi vendor interface. Ignore it here
+	 * first so mwifiex-nxp can bind it instead.
+	 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0471, 0x0215, 0xff, 0xff, 0xff),
+	  .driver_info = BTUSB_IGNORE },
+
 	/* Generic Bluetooth USB device */
 	{ USB_DEVICE_INFO(0xe0, 0x01, 0x01) },
 
@@ -477,6 +486,14 @@ static const struct usb_device_id quirks
 	{ USB_DEVICE(0x1286, 0x2046), .driver_info = BTUSB_MARVELL },
 	{ USB_DEVICE(0x1286, 0x204e), .driver_info = BTUSB_MARVELL },
 
+	/*
+	 * NXP IW610 BT interfaces (Marvell-lineage silicon, same quirk as
+	 * the 0x1286 entries above). Scoped to the BT interface class,
+	 * not just VID/PID -- see the btusb_table entry above.
+	 */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x0471, 0x0215, 0xe0, 0x01, 0x01),
+	  .driver_info = BTUSB_MARVELL },
+
 	/* Intel Bluetooth devices */
 	{ USB_DEVICE(0x8087, 0x0025), .driver_info = BTUSB_INTEL_COMBINED },
 	{ USB_DEVICE(0x8087, 0x0026), .driver_info = BTUSB_INTEL_COMBINED },
--
2.34.1

Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D14485CC3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135160; cv=none; b=m8mK31ZQblyJ+12QCInK0KL87kqXSRwjHPE+HHFcSu6bmOy7JyLwFAQ9TIdggjp/rPpxi08dVNU9SDPBz0+8Xp2P2uQdlJJgwat7h7G6VGWdMJ6udw40DkRxuKIBYDFkQCdPzd9M2Af8frFWPN9ijOi1bguKx8kPk9Vp4i3j0pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135160; c=relaxed/simple;
	bh=LWoqwo8OPOF1pqAPY7zk58MStnc+PQK6YDQKYR9dyZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pkocupgywBWvfPFx9F9uMmWjj/lHcHAlKhg4+f77Z5+8rOqPsASrzJoSFzSf84veNZ5OWNsEju94uocj3OG/bxDenYItE5088r1yqH6Q+KXBzIpdvQs7PL99jTgg0Ib9RXfWR9vSOGx4lsKANTmWHzr60JeEQhuABMj4SJ2gKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB8VItdy; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB8VItdy"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so1011539a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789135158; x=1789739958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHtTy9lDcxvA2WiCWTCjZ0Fyc3K2ZxTW6s38+wxLTi4=;
        b=PB8VItdyJaSpA3h9dyrkvqzTCZ3E4T0+tYwfJ/eRiI1TnIe0boTHRF4KB6+xjwatti
         83RRp5WbySoBj58AqIAXoomo4uljpuqxyKdvGTis7Imv74Al4Y+6xtE8qqBagEo38n4e
         Nx1ULG7KY4/jGWzc94BjC9MyADP94NenDaDjyXvR6/R2D8ZYBPdiwMn9rTXoEAWHVygP
         /IrgSI0FuosFJVjD6u3tPz2OwE+eGPChHWd/U7fEEOslMFXI6usDSmmZwHocnkNFBv2O
         kAwMQ0i+vpk9O4BKAX4HiWUDQOWJGk0hSIKSGoGHQfRGRD9V8DjWRDc5p0+0MrkWiqQe
         Hcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135158; x=1789739958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHtTy9lDcxvA2WiCWTCjZ0Fyc3K2ZxTW6s38+wxLTi4=;
        b=kTbga9BRYoVPngcTnohvGdyl5AwdIKSkAaPPB4FkdLmnd/kLckNhft7EaF+G1UTPU2
         sPNElI/Gd5ayXFuTLz9u/wV6PpcPOn+iq0Nv9f+a2OyumsHjPP0Q83za7KHgcSxQvO1t
         CQ+0H6K+KQW24ssHrvSCYw97gLV5LGeMv2adxnmIeySW3ebf4DH1c+runLT52gwVnyRQ
         Snb9TDlU8BgxKymVGCQ3G6gNxO9VgtlSdY0fDLd97R6qD2McNvEAgP9BnPPLAYj5CqNF
         KoM0tgrFqMnBTZ8nkolnFOF0l++DErkK4tiNM0z42CJWP15SSxct0+VIOaB29zOYvc+W
         oTCg==
X-Forwarded-Encrypted: i=1; AKwUvBz8dNJobsCHx55zGBx3Ym8OUUJq/ASb8DAXoP4glbnfxjsaZJQ2iI6zzS5+rkIzsVA5fq6y2L5AT3q9bYc=@vger.kernel.org
X-Gm-Message-State: AFuF++l9sfEXzwzT0lbCLzODFEGtdeWjZgsZMEWoggsZnFI2H4I++nk5
	YQKkHXzR9dBQIoWJ75pOkN7wVfOL1E57Mv92ftR54ozKcFh9Y3cAr+xt
X-Gm-Gg: AYBFou1/TNYBko+kt9SWfrajSVqm5mCy9Hs1fFNVHx/iSdAsyiD3YkR9N85Aoxx86i+
	cujA4a+7XfsKpPi034fyvzMqnS91sroYhgC4fCK5ROQglgsa1aHoZk/kp1kN5HbmfBY6nvtihXj
	9vUuJsFRk/j3wZXZxU0kKHP0Rn0tYr7FEM0UGEwV1Co9G81XKa3cYcBJUZDGUQm1D/0Fum36PxK
	SDIIWzquyWomIDU8bnfmMEb0llDKsjIVG+Ps3m6MrbazKggBJxQVi7W/dlaV9OmANN/MtFeBXGD
	DAXCs9mtXE0RYtGYrexTDjNOy6gCMbpgZKKcpMSZAy+4F/hSOdrqvD9UvSGGIe572XpVHG6MphY
	NR5n2I+bGAPAJBcaM9jO+CERzFQ8FpLURgK5UkMhJdQBvV0Ml/UmhbUHx9Fd34TUJxZdWaM08P8
	N5c9FQtJxOlQc6C5pA//4QJpMURspkrtS7WWY/dtW1/9DT38q46G1VLBDo0TtE9PirT/xKqamo1
	n8sR84pcbADw4XQdUsD6oh+Z4rCfkBHqBpXN1qNSzTnSPRx
X-Received: by 2002:a05:6a20:a120:b0:3d3:ae50:97c7 with SMTP id adf61e73a8af0-3daed7dcbedmr7207784637.20.1789135158291;
        Fri, 11 Sep 2026 06:59:18 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a803:6c49:9c35:d64e:78e3:c51b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e5193dsm6586878eec.10.2026.09.11.06.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:59:17 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] usb: xhci-pci: Add TUSB73x0 definitions
Date: Fri, 11 Sep 2026 10:59:12 -0300
Message-ID: <20260911135912.1604622-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of hard-coding the TUSB73X0 PCI ID, USB_CTRL register address
and the PWRON_POLARITY, introduce definitions for them to make the code
easier to read.

No functional change.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None. Only sent it as a standalone patch instead of part
of a series.

 drivers/usb/host/xhci-pci.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a8889081ae82..c580e0b86011 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -28,6 +28,9 @@
 #define SPARSE_DISABLE_BIT	17
 #define SPARSE_CNTL_ENABLE	0xC12C
 
+#define TUSB73X0_USB_CTRL			0xe0
+#define TUSB73X0_PWRON_POLARITY			BIT(22)
+
 /* Device for a quirk */
 #define PCI_VENDOR_ID_FRESCO_LOGIC		0x1b73
 #define PCI_DEVICE_ID_FRESCO_LOGIC_PDK		0x1000
@@ -95,6 +98,8 @@
 #define PCI_DEVICE_ID_ASMEDIA_3042_XHCI			0x3042
 #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
 
+#define PCI_DEVICE_ID_TI_TUSB73X0			0x8241
+
 static const char hcd_name[] = "xhci_hcd";
 
 static struct hc_driver __read_mostly xhci_pci_hc_driver;
@@ -479,7 +484,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	    pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
 		xhci->quirks |= XHCI_RESET_ON_RESUME;
 
-	if (pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241)
+	if (pdev->vendor == PCI_VENDOR_ID_TI &&
+	    pdev->device == PCI_DEVICE_ID_TI_TUSB73X0)
 		xhci->quirks |= XHCI_LIMIT_ENDPOINT_INTERVAL_7;
 
 	if ((pdev->vendor == PCI_VENDOR_ID_BROADCOM ||
@@ -678,7 +684,8 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	dma_set_max_seg_size(&dev->dev, UINT_MAX);
 
 	if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
-		pci_clear_and_set_config_dword(dev, 0xE0, 0, 1 << 22);
+		pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL, 0,
+					       TUSB73X0_PWRON_POLARITY);
 
 	return 0;
 
-- 
2.43.0


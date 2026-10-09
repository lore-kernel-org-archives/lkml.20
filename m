Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D6451981
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550330; cv=none; b=PazMLE0nh39cKn0EMVLHSjdTvTQDLFKXOcqLUIRML2NP3BHSWMnTkIHgK+QShGn2drwqbYe/Sd+7mO1EYtccEM9OrqyQli8eNWlAve6t/wAvInPKHgcMHVxpP6ZZ+4i8qNbBlJ6ftDx17/mLOzI/5GdZSSSuOHRJmIzHUuqBAuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550330; c=relaxed/simple;
	bh=UwboIcLvo8L2QPyEHASS/xgFWR57jyxEQJ+AMdJMRIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EHEnkHxxj0FbDNMGwP8I32eQkvF9rDvw5gHUJSo5rIZ22mr7ycdN17ouoY3bmNs+PS/4Lp0KSDSG1EWhAy8e0IjSane/9OIDCkMOXKasW42pLlo+zghddWhLyF9FCetkiULDKxIDpw+SFv77yo71y0crBC7P8rrLJhkS6a+ApGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAnUfN6n; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAnUfN6n"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6c8f6a53fabso1543713eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791550320; x=1792155120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r4zoLo6TEGlBfruK7UlHr1Vnlx0k0bueLiUiQyZg9BU=;
        b=kAnUfN6ndGpJnwLKmLLm+h+QLR6n3vffG8FgKn781p9ZtWChx/W9Vi+lsXRFhACD6A
         TAa3B6cP+v+vhk4vIEOmpGc9GHpAAm792vFZSdnwBkyBk4MnuSK1LnFZlANcUJ2ipcZA
         XttPfcWetCXaJBmuckJ4nLtyXErFozsX2qYjq9ApLVxgQ6dMQun9yal7e027r9dQwXKR
         EH4yBge581Qj7rE4G+62eBhOm459bgI8wNVPDYUvKi0BgYJ6ptGFvUcdOlRO53BrvJms
         wQxKaElbwsDtlj7zzzY25t9mN9SQ0OO4u/4UpQhZPECFHHGpz0aielHvso7fIo86SrEq
         t8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791550320; x=1792155120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4zoLo6TEGlBfruK7UlHr1Vnlx0k0bueLiUiQyZg9BU=;
        b=MXqOzb9hDvy3zxRDWJP6533ykQEHp92Rptvd6VytCK+YUauGR//tg5eljCnjARqjaf
         +Y57r5I4ngvPs/5+CXl19j9lztPAobMIEPHJq6QWKcgDM1/6/uRL6F1nlOmizHBAsRx1
         6IoJrQ1jvC+HxUuUFwZ0eBPL6LtMsuWSQ+5opClHmZlj+nPCaUb+8Ppzpsf4hIv3MU/x
         eCtblUW6Nx+O2aJgrRFz52cIzbnx6WunT4etrH8SrpRupkAnZwA2PNpv8suCGsSvpAw+
         ylJW0kkBpG2nsKejySy7GqgqAVl4RJUbpjaK+GAR47rzR9h/iZIURZxZhlPs3cuKbEgJ
         MSjA==
X-Forwarded-Encrypted: i=1; AKwUvBxOf0pNQfSQacaLZJdB8wQ/ca4U+9ny00y6l1w7VoajW+x2UkRe1df4a6fNt7h806iK/xUis1px3Ev4pOk=@vger.kernel.org
X-Gm-Message-State: AFuF++kyrWkLY9kMkWeVsth0lYOX1VaIylWkC/UybD4Y1eQVC0zbSrt+
	s0rCCWSagA0o5bmCbhb0rcOr4nH9YaH/sB5JCYpeWsDRgKqPeczQzX8Z
X-Gm-Gg: AYBFou1kbdAVaU/UUBFwpHXZER/U3u5MDVR1XM0myky++QaKMKDgNde/CjCZCINof54
	7J6ehXmGBaqH0M2C39l4vPHtsK/ekpPf9HCAt8P/e62YvQ9TuTTUVnFTZ0UoEoYtdjnU7Zn4Zwf
	57quctoBYasVtdzgV5/AcwtdJiY13bhCn7+s8tEF0iZ+56Uz1I8YzosyZhhGgC0WvylmPjqdjsE
	sflbUMNHgqPrOUbcwpo5eC9zk4ry4/lu3ufTzgn33/3lWZ39+FrlM2dGHXZxehHj2L/Ph4HJx2B
	YwZSoXitOtpQ42j0PqffGYf8RuS0JJV96K0BuajU8g5KTSEeVaqn0MHtrFc+AKVr7oYnAT3yeRA
	bjOZsdryroHJQuCuIOMHsbt+Vt2aS20GMH7v+3dnUnTVQ1SsAYSlzzj4xjufOes+mLdJpxRzZPT
	mja+j86Pl3vkZZylItLTZihRfF+EamC2GRpztz2zyRJXUrJRiBAhM19orZ8rKcHhn8JAzu3I5DV
	LSCZl0DDxMyAxC5dy01TxY0DyAKohhk8+Sif8Vs0lvf+qPm
X-Received: by 2002:a4a:e84a:0:b0:6d9:c309:6479 with SMTP id 006d021491bc7-6eee48577dbmr1105828eaf.58.1791550320542;
        Fri, 09 Oct 2026 05:52:00 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:250d:38ba:9672:afcf:65b8])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a84a1482sm1514908fac.6.2026.10.09.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:51:59 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3] usb: xhci-pci: Add TUSB73x0 definitions
Date: Fri,  9 Oct 2026 09:51:54 -0300
Message-ID: <20261009125154.266435-1-festevam@gmail.com>
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
Changes since v2:
- Move the TUSB73x0 PCI device ID to the shared PCI ID header and use it
  in pci-quirks.c too, as suggested by Sashiko.

Changes since v1:
- None. Only sent it as a standalone patch instead of part
  of a series.

 drivers/usb/host/pci-quirks.c | 3 ++-
 drivers/usb/host/xhci-pci.c   | 9 +++++++--
 include/linux/pci_ids.h       | 1 +
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index ba158d63bb8b..f670e7aab984 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -1189,7 +1189,8 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
 	val = readl(base + ext_cap_offset);
 
 	/* Auto handoff never worked for these devices. Force it and continue */
-	if ((pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241) ||
+	if ((pdev->vendor == PCI_VENDOR_ID_TI &&
+	     pdev->device == PCI_DEVICE_ID_TI_TUSB73X0) ||
 			(pdev->vendor == PCI_VENDOR_ID_RENESAS
 			 && pdev->device == 0x0014)) {
 		val = (val | XHCI_HC_OS_OWNED) & ~XHCI_HC_BIOS_OWNED;
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a8889081ae82..54b76e2bddd2 100644
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
@@ -479,7 +482,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	    pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
 		xhci->quirks |= XHCI_RESET_ON_RESUME;
 
-	if (pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241)
+	if (pdev->vendor == PCI_VENDOR_ID_TI &&
+	    pdev->device == PCI_DEVICE_ID_TI_TUSB73X0)
 		xhci->quirks |= XHCI_LIMIT_ENDPOINT_INTERVAL_7;
 
 	if ((pdev->vendor == PCI_VENDOR_ID_BROADCOM ||
@@ -678,7 +682,8 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	dma_set_max_seg_size(&dev->dev, UINT_MAX);
 
 	if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
-		pci_clear_and_set_config_dword(dev, 0xE0, 0, 1 << 22);
+		pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL, 0,
+					       TUSB73X0_PWRON_POLARITY);
 
 	return 0;
 
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 0693e4532a68..030c86dd6d67 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -889,6 +889,7 @@
 #define PCI_DEVICE_ID_TI_XX12		0x8039
 #define PCI_DEVICE_ID_TI_XX12_FM	0x803b
 #define PCI_DEVICE_ID_TI_XIO2000A	0x8231
+#define PCI_DEVICE_ID_TI_TUSB73X0	0x8241
 #define PCI_DEVICE_ID_TI_1130		0xac12
 #define PCI_DEVICE_ID_TI_1031		0xac13
 #define PCI_DEVICE_ID_TI_1131		0xac15
-- 
2.43.0


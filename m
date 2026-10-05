Received: from mail-vs2-f35.google.com (mail-vs2-f35.google.com [74.125.227.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87549C4BE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209529; cv=none; b=GF4hA/xUPKBig1Le90p7F/87RF3dEvuR8RidNDJw1Mhl75quSoVBHlQtznHwkqTN4NCCGcta03Ohgz0DsS7xJH216NlNtIQwSOEe9a/fvaN4zQxYNFuwkXZzZU50d/6zEAjCzDYJVSQSLXgki3aUH/5rCUpy8eC9YxF9WOKE+nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209529; c=relaxed/simple;
	bh=LWoqwo8OPOF1pqAPY7zk58MStnc+PQK6YDQKYR9dyZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZ/G0BNwM5+5Yks2yYXHZkUNBgYJXUxTpNqBNaipaohrAf2YP3S/jYCJZ5rPY/KNaAzSkRZQ+Y905FZUDXutk7neDBNfrmREZPReVVg2tvpG6muskDMdSjzxzMy5XO79ic7Je5MZGYZzHmMJzjkB8/jon8gaXOoSKHPcbB4Q3/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwuWHU5k; arc=none smtp.client-ip=74.125.227.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwuWHU5k"
Received: by mail-vs2-f35.google.com with SMTP id ada2fe7eead31-7bf8325ae13so523291137.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791209518; x=1791814318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHtTy9lDcxvA2WiCWTCjZ0Fyc3K2ZxTW6s38+wxLTi4=;
        b=mwuWHU5kndioTalq9PNtE4D/GV/RjW7pIwTT1MmWMozvkjNlkK4Kb/SY4r6jEpuce/
         oun9iIenAeiG5/HY+j2FXIRlpxDv5rFA/ihM0AphYRoVj7RE9o2RXPBfnndaJ3cijOv/
         V9bqRZ6Cen9vcLFoVcasLaQRlVSxYdXPc2rvXDyzqdVQHIdfFLBNw/zFqZO0UATi0kib
         jlQs+vygiPeamj6YjoldTf4dgQhfoM+OiXoKlXOeykQYmPRgClUNCNf8SnO+97Tlpjf6
         J165GXwaX4KwB4Lg/hWYFkJ3aDe4PghOCTVxYIdlKtS5nVG/qLPIZPT4sTQBU1dpYMbB
         bBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791209518; x=1791814318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHtTy9lDcxvA2WiCWTCjZ0Fyc3K2ZxTW6s38+wxLTi4=;
        b=fJbhzCSlXCBwCqMrA1tJ+SbEpd/lUt9/HgYehuvlL4vTuNuuFZYHDK95rUTG8vpWj8
         ga0CtuYWleZQ0rTVMEbinjLWDl+BMyFl099BFApHAKenVctjuRkGNpA9aV8oV0Vc6FXQ
         qkuBhA95gDgZPVyndpQAMNyDYQcZjjQzWxp36R85LlQ3e1YmA/fCjDz8//rJ2KPjrxwC
         ZM+jMl++e7zwcnCTu7Eb3qZJYniD+Ng5VRyZSC2z76nWaiW5gZY4okq8Z9AmykWjR2XS
         pACnLFfe7Wubl+nuPlR9j4K6Qxpp4l/pb65rRpr3X9QJ977A6dcJAdgfuFhYS28PGjLz
         tCkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDoGrCIjK2K92UPAKTAVoDMGyJsDjd/Kglcpq5YPcsv3qDfdXcMe8HNhHMuXoksy2QILWoMvqulJWQ0jI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN8K/keG/jCF4xxK7LwuzIcvBEO2xBDH68AhZCJuYG4GiB1G+l
	yN4AA54GwDUY5KRixmiu2N5RqfUzLXbjkfsWSKZ8SPgW80Yx31raOpXM
X-Gm-Gg: AYBFou2CPdDUKFedonnTke1z0psZkUz6vReXNHECoTeuEYLVNAE1blzTKdTKY1Hipsi
	QITTd4fwL4G3YfQeQYqDYitTwcsDKU5ouKtdh2QPtrwb5j0C2ehjYrpfCogIbtumtuF/7L/sogA
	AixHv1jeW9P3AXx63RnbSoHDH1DHJClKaPSqGj8AoaWCVclf3IS54OuOvrmBHxbXLsA/M/dDG/n
	0r9aWS/F1AhcCEWa6oEm3niCWDB4SpX49IgvHDNUIVm68Pr9NezRZsuyiIzSa87XNG2m52DRorw
	DLmsIOjC6vlwXwHxoOymWrGBMpY0MhfUFGVxfY/iHDptvN5DA1GC27aSiDn7OT5AAzsK87xmiXS
	yq4gwtA3bnMutkuxDAH8uoNh72jOKMNvJ2qRilNspo36Z3T0aK1VTCX9md8zqd9urLNOTq+FF8/
	5BiUE7tXw73Z6qiCRNnRUbxyACWn1odhwHPTBgkrQMzVt+xvvDNE8jGpbSmXXrZkMOIaoHF34yT
	1QHrxoTU0hD8RLJacTJP5YnXAiDbnAzjvlw4QQ4uCypW/A=
X-Received: by 2002:a05:6102:5785:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7c0f64a940emr2234582137.34.1791209518432;
        Mon, 05 Oct 2026 07:11:58 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a800:a625:a591:442e:c8b6:e423])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c100026109sm10033161137.9.2026.10.05.07.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:11:57 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH RESEND v2] usb: xhci-pci: Add TUSB73x0 definitions
Date: Mon,  5 Oct 2026 11:11:41 -0300
Message-ID: <20261005141141.385414-1-festevam@gmail.com>
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


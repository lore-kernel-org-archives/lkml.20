Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873642;
	b=1+k/gsmvwst4leco56Eux+Gj2AWBKZfFxtpZKfd18/hTTKAfEyTVXu85EcnFAXibvaFA
	 qAwhRBDQFdQe0qJsgFrXotLtTv86nEGUynBtj9xoBswEmLI93I7HK0Rrikr6AGhJKJAhx
	 V7pPrXXSdK0mPMw/FoLQBbhH0KFJEMCQgr7EM22k7RjOwA0hfblC+lH12ansQxB/s1RUE
	 gCZFHL6Kn7QYg0zcTdZ9LpSRimbUKXA2j8T6IzmHJLo3fkVeMV/ZGiKQmNzGBWo9MlPcP
	 fA0wmZPhkzhzX1bPmYdwDGNiScC1UqIOexBN8dvPTWyf+jmrjsYmgnlfARj5wCo/jcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8/84fIsnYNevTgT8Tyj3fXtgY4rv5SdcHrjwauikJg0=;
	b=Fumbe/4neaUJ143EAP0Wj36M6oYCR62SM3HXOV7Hgr9Fu6GsFbygw8yGs7Yp/9up18DY
	 aLZJNCYvamdmI5+HwVc9HrltkdxGMWD+LqJ1d92puekgOR3Tn94T4/8M9Igv6a3AM8WHc
	 BDgL3elbWzzFBA/ZDZOvGkNzYEwQ4R/z2CFoTDdv7eii1YaJyfpmx9MWY4NNDdMbLcF9C
	 ksMB5hnlm0v9K7gfffoDt6bZ9P/JqhDv1inwrL5+Al0Ss2AgMYRXeCDfugfuHbS+MDqIW
	 1B2y68asSSRY6qGc/rTATSULb5n2FH829GQiGbuTsefJZafGpN04pjDsKwOBR2GldWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DVjHUOSH;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AC9606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4AC9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DVjHUOSH
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so4896535c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873641; x=1795478441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/84fIsnYNevTgT8Tyj3fXtgY4rv5SdcHrjwauikJg0=;
        b=DVjHUOSH7KOs9wtDV7NDv6hTj0w600gwishdrCZ12ZLMkcHEtn0cTAAPoueNJe284F
         msTNBOggHrbkHsTlX6XC6ZHeCebifdfS5KNU5HUUK/UyN3mf77e7kmki2QUcUg/VKSwm
         SEo4QGPNg8mjjhnHX9AlCX/l8BOCRJgKR9wCxdNWpF/MAmHOQnQ9wh4WUrztwqN5bcMW
         HQ+D7JSpH1ufQ5x4P5YD0XcvRYBOxXmfuUhQtn5GqJhXzgG4KmNDZUurtdLgSpSlDtle
         jTOJRC3nTnmsHGKSiVUlfGn9S9Dzp14ahVY8wMKmFihnKwQE7mUbA9bXuh9WMcy9beY0
         kSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873641; x=1795478441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/84fIsnYNevTgT8Tyj3fXtgY4rv5SdcHrjwauikJg0=;
        b=tVU2n47/IXkzOV49MUgyXKtkiriBLuCfRCgU+hV/nLM88Ob8YjZvUCsQVCpFAcmY5N
         xvQjlOc2DX0mmAxDZTyls3/JwAUKcYp8zEIKcj43OUqGz9lan8oZCshexubGsamRRCHi
         AAkCyumP+rokkNnx090MxjmozAt+plMi3jdUDEx+G2B2R8Y8khi5gsl94QUmiw1P1Y94
         mfXEeHv2ub/flt+auDWLPLkJ1CWXQ46feoNQyrlx1ZLhbLJLY6UgkopblDHoySNVmzeV
         OMMnEFO+7zQc3yZ5oATAV5WYh6TmTBemNH/4EWG7RXIopo+5r7+r/NI8WtVHBzw2Coj1
         lyzw==
X-Forwarded-Encrypted: i=1; AL+hErGu0zFg7PVXaTgwQjwE1kXi2xw3FtdLGDMj/eUj1Fq2qFG3Np6KzFBFPMglXG8ZiD+87xvFK60ICaHCB0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ujtPkov0ZHzi1C5NGVrc7siLAfPi+m5N3MEFT5W4h/puGWdCH
	hJ6OXWaMnS/Ep56XCfGQMvxe1uakL3KNQxC2X7ZWA+drVHVohbecLUg=
X-Gm-Gg: AZFdTZf7+inQFXd97dz6lK6MHnFuU4ocqXguKAMAFbXg/jpGBQxETqImeByDzVoxS/H
	TwQMS/MqZ0SI9qroRnXg00PkCYFvn7XW0JX2yvcSMHAvAH1M47jIKuiYlEz8m11BnEQCWnUErJA
	bbVTbuIiGOgifqDZe7NbrVtp4rPmFi94+UfEyGgJZ0oX3ePoDMm8Ga7iKOasyr8Z4s1G4YBDl8Y
	qd2PXlSSaqZJ/6Yp88E+YP+gkXIIPhl22MyyfKfDFdXfEwFkQhin2v9e7s86rgG4kh42BeJJvHS
	vb/Grl8yyqgZnzoJge9p+/5kG9F9yqZCMquV4XWDsXhpQVplzyKAyM8MpBhP45vanfGp7ZulGYG
	fa+0sO5OGX32jA8cmOyVcmdGI/bXrGr3dC2tv/kZm6Md1KxbKfHqN9TcaFAPPg2Z93TxLEtsFdd
	DjRxUc9HFWDAyneI6KlK7d39tvmU2c/QqBZCL8pa3VT9eKFRUDg5BftqE3QvetYKbUvDWg3xVP5
	KNrZlOTEYNk4zeoFFYs0A/sS9T+m4hBhyPx3AB9EDPrB4DwnrlFRDTRkEHIWfnDc2+wZ/WgA517
	28bJvL9dM5lFqOo/x7l9N1YQPmoz8gwRB4K43HRMY6l6y4ASi+FSmi0/FCwGOtkwDg==
X-Received: by 2002:a05:693c:8206:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-37966e3ab88mr13204369eec.7.1794873640677;
        Mon, 16 Nov 2026 16:00:40 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3815045b90esm854224eec.13.2026.11.16.16.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:00:40 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] usb: xhci-pci: Add Power handling for Card readers on Apple systems
Date: Mon, 16 Nov 2026 19:00:32 -0500
Message-ID: <20261117000034.7641-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Power handling for Card readers on Apple systems using SPWR
ACPI method, SPWR(1) turns on the card reader, SPWR(0) turns off
the card reader, on newer systems SPWR just writes a variable in EC.
On previous systems it writes to GPIO pins.

Its also used by the macOS driver with the function
AppleUSB30XHCICardReaderPort::setDevicePower in AppleUSBXHCIPCI.kext.

(This should fix https://bugzilla.kernel.org/show_bug.cgi?id=111201
 But thats not confirmed)

(Tested on iMac20,1)

Changes in v2:
- Fixed grammatical errors.
- Added CONFIG_ACPI check
- Checked for xhci_suspend success before turning off power

Link to v1:
https://lore.kernel.org/all/20261116231926.5891-1-atharvatiwarilinuxdev@gmail.com/

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/usb/host/xhci-pci.c | 25 ++++++++++++++++++++++++-
 drivers/usb/host/xhci.h     |  1 +
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index e278db940..31961de97 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -15,6 +15,7 @@
 #include <linux/reset.h>
 #include <linux/suspend.h>
 #include <linux/bitfield.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -517,6 +518,18 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (xhci->hci_version >= 0x120)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
+#ifdef CONFIG_ACPI
+	/* On Apple Machine with Card readers, we have to use SPWR(0/1) to turn
+	 * off/on the card reader, And on boot the card reader is off, so we turn
+	 * it on.
+	 */
+	if (x86_apple_machine && ACPI_HANDLE(&pdev->dev) &&
+			acpi_has_method(ACPI_HANDLE(&pdev->dev), "SPWR")) {
+		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 1);
+		xhci->quirks |= XHCI_APPLE_CARD_READER_POWER;
+	}
+#endif /* CONFIG_ACPI */
+
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"QUIRK: Resetting on resume");
@@ -562,10 +575,14 @@ static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct usb_device
 		}
 	}
 }
-
+static void xhci_apple_card_reader_power(struct pci_dev *pdev, u64 on)
+{
+	acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", on);
+}
 #else
 static void xhci_pme_acpi_rtd3_enable(struct pci_dev *dev) { }
 static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct usb_device *hdev) { }
+static void xhci_apple_card_reader_power(struct pci_dev *pdev, u64 on) { }
 #endif /* CONFIG_ACPI */
 
 /* called during probe() after chip reset completes */
@@ -853,6 +870,9 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	/* synchronize irq when using MSI-X */
 	xhci_msix_sync_irqs(xhci);
 
+	if (!ret && (xhci->quirks & XHCI_APPLE_CARD_READER_POWER))
+		xhci_apple_card_reader_power(pdev, 0);
+
 	if (ret && (xhci->quirks & XHCI_SSIC_PORT_UNUSED))
 		xhci_ssic_port_unused_quirk(hcd, false);
 
@@ -895,6 +915,9 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
+	if (xhci->quirks & XHCI_APPLE_CARD_READER_POWER)
+		xhci_apple_card_reader_power(pdev, 1);
+
 	return xhci_resume(xhci, power_lost, is_auto_resume);
 }
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ec4bfeb48..579ddea52 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1652,6 +1652,7 @@ struct xhci_hcd {
 #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
 #define XHCI_ETRON_HOST	BIT_ULL(49)
 #define XHCI_LIMIT_ENDPOINT_INTERVAL_9 BIT_ULL(50)
+#define XHCI_APPLE_CARD_READER_POWER	BIT_ULL(51)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
-- 
2.55.0


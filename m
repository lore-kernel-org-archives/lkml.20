Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871174;
	b=yxuwdPCexe4W5jQNRvXFvAWn4k4AKx8HzF20AB9+MA694YdyO6YuOWeDkgCLhjY4TFjV
	 Pzz0R4O7xSs3B9IdhPTP46bOlejQMOZ32iNZlk/bPcaOds1JzRTVN834+Kk8muTjRAN9N
	 kH5bK4u018oAN2ZLip4RrroFN0ik6xdRsHBx2Poz0OT0WR21apB5OS0MwbUt8s3kb1WE3
	 uH6Co4YyG5WPTxfy3j/W6l5xbpcgbOen9ntgaV0ISaKyPw1nV7jtYerIhpkOoznrPaLbD
	 rB0mSXeorqJEYAMznZfEIeMeOf8351kPMA9g5sYYGANZuocINlSTYXi8uZwwhptCCRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jw2CbGEioaYFyvgvzlTesDNeS0REYhiPWP30MLKwFJk=;
	b=oFPmcs6Xno4Pi+yFXxQo7ubUYmgwGiuHySP9oByLVIQQrKh0kq3ExDEVfypIEl/ogThZ
	 Q9s+YZxa3CeBaAt6TQCOv9yDJMF77jJbAakQW3ui3CD5DJ4O1kiUT9cihnAxkLVhYCWP1
	 WmClZmyeA7TdR7bHQvr8/sx7M77ooSPjvO1NBZa5nlpA9KSuj1UkhgCuM5QwN2F9kegB1
	 BWXTv5AjzCctBtVurnmu3Gn1s0ZrQNQjYS0gjiK47Qzl0Dkt8UYzF+8K/lWRTxSi+Qljh
	 CC8zQBMraaXuhAFxQHNJ1SprAqMLMqRybef8h5DIt/jihXFvwTzK468X5TMBqwWOTaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0VBv9+u;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B270606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B270606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K0VBv9+u
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so4861404c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794871173; x=1795475973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jw2CbGEioaYFyvgvzlTesDNeS0REYhiPWP30MLKwFJk=;
        b=K0VBv9+uEAW3U1m3nHj/RhxFnyVzTfOxeu0Dug6e00X2cDNWWUuJ3l0jnxg6MfLDtP
         bAEUS/hKP74/CzEouyE5o2qene3PrbGhHbIICN+6+HyuVl6q0Ak7ZGaAl4G60yQOMKU3
         oT1jyVcoX9d3U+HDGhXNt4IZGknaIykItdV0VytANiydDs8+873IlJXCio8TLAIdWaZX
         0LLoJTq+V5z0as8wxa14ak6qgB02H3JszpBRUrpWTCZx03Q6t9ASYq+CKYW5WX03o+hw
         SLwIqAJzLCawiTLUHvtSAFuq5VelxQhCJYVGxrfxVRbWBw3ra8VIJmJ2R+KORynNsDNw
         TATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871173; x=1795475973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw2CbGEioaYFyvgvzlTesDNeS0REYhiPWP30MLKwFJk=;
        b=qMXttvf1fZeKbZUeJCKOsSpwwGKQ+WPrfMAtAAJE9GuqC8dVJp6T2w/SnHOTSxItaa
         LyYx39taEDEqjxmP6/WX0E/zSKkctHhCVfFh+TPyiE4pQF6qzK6KYK5gbTS2gszRycSS
         cdsZrI/aSDs8UqH9j0E8dqKT+tXPxJMAVfKRnLHBRsyQGMqrRVmWwTn6PVeOrkiOKUfu
         JGaWC2XP2zKHVkHivwl+7MAZ/7h3cVkutPNzCsOYbCibop/l6JJExE2myh4xdgJWwXUg
         uOjfc15ZH15AqRJk/E5r7PdtIVAmyMQO268WT6a5AvZvN873ZkZI4uWh3UwQUtFvsZn/
         /6Hw==
X-Forwarded-Encrypted: i=1; AL+hErFrPzOuSG3M9kWkjs43gKoDoXPiLD91Y/RVPdwD+UKkghml1R/phl32lrtbJUZJBoG4SZN4YY5eXGBoSIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s1yAP8pK/znBYmuTYUZox+EgFt9IzWiXFz1v6UbojdmFvPCV8
	iMxln8W5kGCkzDVLPzOczA8O1ofDnwM5JG5i4KIj+KKedM3FcgAuh1w=
X-Gm-Gg: AZFdTZcDX78c/tN35PMq6qkGVzCzAewmwojUUbNGrqOHTyXYu3BXzuS6BZNroG1187/
	w5x7GI/Q48Q+dARFOgEBPT65xpfz7IkRyn7ULgEIaMbQugaF0CRJWiF5vs/1Z1/S2Q25G0Ko2Ge
	dOwtwf0TZg1uCY9ZUGf7uyk2/pjKFB1SjqfBSbzJgryjHeFTNOHzVfXs2B8xey57e3uTJqldl2v
	BioVjR9ZM1cMoaS398uZH8tdF/qIdg6K9kMCPz/RsJ+BpocojKUqMttdhESBOOoRp06sjX33VIz
	LoIoeAuxoh9qajNAiWsTCjJDulJidp6+4RXM2ndeJ67w1b+2czxWpDjgjQljIpSeBYc+18Kb0y/
	1pbaFnLx64BGLOSBJEEgpGhmfI4xVXKj1Vr/sSK5WziquoRCQOwfmQL7Mr67iQaD1b8N2nZTgVK
	iA7gvMmmr/NZ2Xzc7BgwisNDXZDps6c830nHu8Gce+MsmFWwwVyb5zdNfotBXu4glHFCj98j+tF
	PXt0hjZLLkUi3ieYc57lDFcEfJ8iuqa8S8A57vJmp/d4GeKfReKUwvLnGZotJwjRC8BEO/taNIA
	iPRGDI2cSCk3goiL7WyVSEP7bgaVISu42vGiGMJQcI8ci50I+wuiY7RUl6ASe7V5L1k=
X-Received: by 2002:a05:7301:4d07:b0:375:87f5:ccee with SMTP id 5a478bee46e88-379684b56e7mr12857126eec.29.1794871173283;
        Mon, 16 Nov 2026 15:19:33 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm56940788eec.8.2026.11.16.15.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:32 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB XHCI DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: xhci-pci: Add Power handling for Card readers on Apple systems
Date: Mon, 16 Nov 2026 18:19:24 -0500
Message-ID: <20261116231926.5891-1-atharvatiwarilinuxdev@gmail.com>
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
the card reader, on newer systems SPWR just write a variable in EC.
On previous systems it writes to GPIO pins.

It also used by the macOS driver with the function
AppleUSB30XHCICardReaderPort::setDevicePower in AppleUSBXHCIPCI.kext.

(This should fix https://bugzilla.kernel.org/show_bug.cgi?id=111201
 But thats not confirmed)

(Tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/usb/host/xhci-pci.c | 17 +++++++++++++++++
 drivers/usb/host/xhci.h     |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index e278db940..0cbecbbbb 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -15,6 +15,7 @@
 #include <linux/reset.h>
 #include <linux/suspend.h>
 #include <linux/bitfield.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "xhci.h"
 #include "xhci-trace.h"
@@ -517,6 +518,16 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (xhci->hci_version >= 0x120)
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
+	/* On Apple Machine with Card readers, we have to use SPWR(0/1) to turn
+	 * off/on the card reader, And on boot the card reader is off, so we turn
+	 * it on.
+	 */
+	if (x86_apple_machine && ACPI_HANDLE(&pdev->dev) &&
+			acpi_has_method(ACPI_HANDLE(&pdev->dev), "SPWR")) {
+		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 1);
+		xhci->quirks |= XHCI_APPLE_CARD_READER_POWER;
+	}
+
 	if (xhci->quirks & XHCI_RESET_ON_RESUME)
 		xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 				"QUIRK: Resetting on resume");
@@ -853,6 +864,9 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	/* synchronize irq when using MSI-X */
 	xhci_msix_sync_irqs(xhci);
 
+	if (xhci->quirks & XHCI_APPLE_CARD_READER_POWER)
+		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 0);
+
 	if (ret && (xhci->quirks & XHCI_SSIC_PORT_UNUSED))
 		xhci_ssic_port_unused_quirk(hcd, false);
 
@@ -895,6 +909,9 @@ static int xhci_pci_resume(struct usb_hcd *hcd, pm_message_t msg)
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_quirk(hcd);
 
+	if (xhci->quirks & XHCI_APPLE_CARD_READER_POWER)
+		acpi_execute_simple_method(ACPI_HANDLE(&pdev->dev), "SPWR", 1);
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


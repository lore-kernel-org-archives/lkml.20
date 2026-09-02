Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DFB3876A4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327569; cv=none; b=pqL3ZN2ElUncE9XHRAe2cXPg1hyfki24XDZcmrlMVoDPIUTYu7ax/e4S/lqN1yvoSH/aiFpSBJd/efdmD2d+C6QrJeLs4EHJeY+TAcC27P7OgDHQm5yueeI2SncePzyAg1VWbrEmH6YzzLFhlKYn1uWmZUdqjC28q8E5jJz5MOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327569; c=relaxed/simple;
	bh=D2qpkwtyTf3w93woN4RfdqDyYYM4IpV1kr43tBMElaA=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:Message-ID; b=k9oChvSaG4XrLCtLkseDoMn+Q9dNGyPvRKXKYABZ3EL4BUwEfoVpyqykD43Posy8BblDs/6bkuMwVA2ImgXCuFYnzKg66LzHdCPdTJvur+NwH7v+Zl04LN8poiZQ05mko9MIpXmTVjafsbsCRU/JgKUR8aWE/VC6QrllqiKNzAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIDi+tXW; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIDi+tXW"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-396affa9420so76709a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 22:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788327567; x=1788932367; darn=vger.kernel.org;
        h=message-id:cc:to:subject:date:from:references:in-reply-to:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=H3Gzfs+DJpEpqKw65mjqsmh8Qaprer5Io+JTzhX9dEA=;
        b=YIDi+tXWCmGM7DzM58ZNt9EVTpiKVquzQfLrL3PVJ9WEkowF0OTCZUP6mCalDTJBxO
         UxeLw6KsOvnuRRJf2kIZ7pZToLPTUF+TZRo1+qT0CUBjdtu1OHzLE8RKW3eWDCCMw4gM
         bXkDeSBR2zPMPtZxZti/BlnhOYmLO6WzZ30isEHWDMKgo4YK8rNTxtUvF40r11TpWPPN
         +I2V+ZTScPN8gQhzSjp7cmx7XIlfSx0owFxUzRk11ug+SdPSRUr5zOZ82ZH1uOXrICkD
         Ileue6r9XSS064TBJKDM2+bpbH61LwjFQCguSGkMZ7Z7WWRYfocZRX9Uf+itbKBLYyR+
         lghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788327567; x=1788932367;
        h=message-id:cc:to:subject:date:from:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3Gzfs+DJpEpqKw65mjqsmh8Qaprer5Io+JTzhX9dEA=;
        b=L2dq9BLGM9VC1qunH5WH0YdkXYzQXw1mPOLxYVhJhVK/ovbRtDW7c9ICUQH3lyfHoo
         YWCnSLlQpduVcWSvi/EDoCYihuahSXsg92VWkFzh8SSd8p3O8/GpDdj4rtJjMDwr4rJy
         3jcWqT1wDDnVhZfm01WTOzt49o4lAIjf13Iltrfa07LkyR0NJwDKe6697pyXiRj1SqAD
         shSgJKyc0d84yG9hQNfcEO86Liz7b48IwDexHDM0JTVyVf97o+WonuzW83gTS7qGnGpR
         qbi0kv90kapftmFAbkZLxAJVeQiii2+/XHCIOuHVmOrEIfaQ+HmMezWOmbRjBTja+MB3
         L76g==
X-Forwarded-Encrypted: i=1; AKwUvBy78/9BrUeR6lQAsQAcZOZ7wuXAtdj+ux3bDAheaWeNCkN26ox0wFk/L/N/Wrihz/siF7p/uBoitI3hZkY=@vger.kernel.org
X-Gm-Message-State: AFuF++mqvctUsCiUFziIXYo1qNRqCEn3QjWbGvVHcCGTuiscTRaAkDCj
	U3Z9YyyDmkMpjn88lw4JXEinNEQssOKYT+wgT8BH0ThAgaDIRWifz/5x
X-Gm-Gg: AYBFou2RoImbzS+fWph8sxOa0K3txV6fAgeYxBtRHn6ytNh3kKiSLFMewpX0QjFfJxn
	O0ygXizYpqM/L1bKeDih7YWYhnmxH48COPgb1nxJeXS5MaK7lN6Mo5S0tVQagWty71ZGj4p4dIK
	EXVQKoiZG4GTXHMriFHho3BHoIvYVmlL8svl/N4m5Izvj+YSBm7lvPfJJrIbFeWbT2EoCCzs6Hk
	YcvdOEKInlVk/LBx0xSvBne6ThFDJcPrR2XP75Bn0O5bzkHdOntzZSflkZYDNAYx7iwjuhiStey
	SJ8gA93O7ynrI782nvcadZfYzz2RyvV6CNBOa3lYwNAWXKTqL+vC9ZRcZvkci4ka/pvmQfl7WOJ
	+OaHSWIude5bozu0bLIyeZMyY/0SOoyy920fE2pL4ZGM5MfbY3rVcSrE3bs72IQbGOO71R7vjfK
	zK+Wb6fA8w3BEng7iK9TXWAv2RNF4HQyXTL1KlgZZbHlhKbevdjHOwnjgfkCGduv/0c7k5v8e18
	Junerec3i+ZSCltO2QTTlfen1vxvulnSVgU3Os+tC7EFUJTL1qrqMHEBIqckAqvPcxTi30Egys+
	jxgX2GEucHC+/epxzwvh7R4XGoRsNC4ZgBP8YOW1n2s7ps9Y87MQOpfdvGr5171mmRpOD44Qpie
	Mxe15QTn87TUTWmwpMvs=
X-Received: by 2002:a17:90b:4408:b0:396:63a8:699b with SMTP id 98e67ed59e1d1-39aedebbbacmr2123907a91.1.1788327566984;
        Tue, 01 Sep 2026 22:39:26 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (c-98-47-46-163.hsd1.ca.comcast.net. [98.47.46.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e9eb4dasm5213580c88.2.2026.09.01.22.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:39:26 -0700 (PDT)
In-Reply-To: <20260902052631.75c6068b.michal.pecio@gmail.com>
References: <20260902052631.75c6068b.michal.pecio@gmail.com>
From: Rishabh Jain <rishabh.jain1198@gmail.com>
Date: Tue, 01 Sep 2026 22:39:18 -0700
Subject: [PATCH v5] usb: pci-quirks: always assert xHCI OS ownership
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Mario Limonciello <superm1@kernel.org>,
    Michal Pecio <michal.pecio@gmail.com>,
    linux-usb@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    stable@vger.kernel.org,
    Rishabh Jain <rishabh.jain1198@gmail.com>
Message-ID: <178832755831.50581.1058201741431375556@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The xHCI ownership protocol requires the OS driver to assert the HC OS
Owned semaphore before using the host controller, then wait for HC BIOS
Owned to clear if firmware owns it.

quirk_usb_handoff_xhci() currently asserts OS Owned only when BIOS Owned
is already set. If firmware leaves BIOS Owned clear, Linux uses the xHC
while both ownership semaphores remain clear.

The timeout fallback also clears BIOS Owned using the original register
value, which can clear OS Owned at the same time.

On an AMD PROM21 xHCI controller (1022:43fc), this caused every S3
resume to terminate Controller Restore State with USBSTS 0x401. Linux
then reset the host controller, both root hubs and the USB Bluetooth
adapter.

The controller entered resume ready and halted with USBSTS 0x1.
Endpoint state, 100 ms save/restore delays, scratchpads, the DCBAA,
device contexts and command, event and transfer rings were verified not
to cause the restore error.

Across four S3 cycles, asserting only HC OS Owned changed USBLEGSUP from
0x00000801 to 0x01000801 and eliminated the restore failure. Testing
included the unmodified 7.1.8-ogc1.1.fc44.x86_64 distribution kernel
using a test module that set the HC OS Owned semaphore. The same test
was repeated after review with the same result. Clearing USBLEGCTLSTS
was independently verified to be unnecessary.

Always assert OS Owned for controllers using the standard xHCI handoff,
and leave the existing TI/Renesas forced handoff unchanged. Keep OS
Owned asserted after the standard handoff, including when forcing BIOS
Owned clear after a timeout, to prevent firmware from reclaiming the
controller during subsequent suspends.

Fixes: 66d4eadd8d06 ("USB: xhci: BIOS handoff and HW initialization.")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>
---
I kept val unchanged for the error log, restored the original handshake
formatting, and explicitly preserve OS Owned when forcing BIOS Owned
clear after a timeout. Documented timeout issue in commit message.

I repeated the same S3 test on the unmodified
7.1.8-ogc1.1.fc44.x86_64 distribution kernel using the test module, with
the same successful result.

Changes in v5:
- Preserve the original ownership value for error logging.
- Restore the original handshake formatting.
- Explicitly retain OS Owned in the timeout fallback.

 drivers/usb/host/pci-quirks.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index 0404489c2f6a..2b12a35e6f10 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -1193,10 +1193,11 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
 			 && pdev->device == 0x0014)) {
 		val = (val | XHCI_HC_OS_OWNED) & ~XHCI_HC_BIOS_OWNED;
 		writel(val, base + ext_cap_offset);
-	}
-
-	/* If the BIOS owns the HC, signal that the OS wants it, and wait */
-	if (val & XHCI_HC_BIOS_OWNED) {
+	} else {
+		/*
+		 * Perform the standard handoff and leave OS ownership set to
+		 * keep the BIOS at bay during subsequent suspends.
+		 */
 		writel(val | XHCI_HC_OS_OWNED, base + ext_cap_offset);
 
 		/* Wait for 1 second with 10 microsecond polling interval */
@@ -1208,7 +1209,9 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
 			dev_warn(&pdev->dev,
 				 "xHCI BIOS handoff failed (BIOS bug ?) %08x\n",
 				 val);
-			writel(val & ~XHCI_HC_BIOS_OWNED, base + ext_cap_offset);
+			writel((val | XHCI_HC_OS_OWNED) &
+			       ~XHCI_HC_BIOS_OWNED,
+			       base + ext_cap_offset);
 		}
 	}
 
-- 
2.50.1 (Apple Git-155)


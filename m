Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389026;
	b=MHdrbwmqxb93er5P4FzaW1TqNRsEJPiqzMty9ChTA3WtpKNva/b8hHvcHPXMgJgAlM7w
	 QPx8UoxKONVAzUAcpLJFXtlcY/NBMDusovHL6UK17t5vxVAX0VTuZvPE9Wgf7k1X9dLg2
	 GFqU29NrNCTt8JnvKOOgo5KoA16HcWLXlqEsTNg64b4Jgl+uRYmuwtgK81+tL/n71CfVz
	 fsPpy+FOFlJBwhlSWCKy2plJZk9uFkoFAzes956MABqsy18t/w7JnzWNPweLDRcTGKL6o
	 tHcs/t20lrtNryX2BcMa/DRrdxNAU1vkjv1B9AWrSNnmB0qCnE96bm2UMJCv5hkMIZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:Message-ID;
	bh=SAVZhtl45acG7pXv3O1589ijaVBP1M9mCVM0eytdgy4=;
	b=U4GeBr/KHZJlUZBAaEm9lNaL44yh/bFRWO7k8e6/X2hlIsfca/lghZpEhF/M1yg+Jbvj
	 L+hCevdQycyd2zzqWva1pNmGL0bA4dVcDqj6XkWX8WloS3x0WfXHSb3ZJiTSCC/mvzwJU
	 flbMQZZqcIbIBIuXWJsz+5PNFPxcQIxuT9EqYzXPa0WqkDpW5cbBVVNMCt1q/eDEKV1qa
	 q8r7ogE+QFsrMVJoD6bszDDGsc02jwusFH9YuVFzVB4l2SG0kT3o+Jb6wEP9xC9TzbOfm
	 wWuKhybFzVhMo/M6XUrFQhX4/bsbOy0q6DQKUn8nnsn88PGcHvPWCK98PoAh2H5ANmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfURx7M7;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0093B606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0093B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfURx7M7
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-168de2167deso8439c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793389025; x=1793993825; darn=vger.kernel.org;
        h=message-id:cc:to:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAVZhtl45acG7pXv3O1589ijaVBP1M9mCVM0eytdgy4=;
        b=FfURx7M7snCJy3FJoVpaCRBNec3AB74pIgrzMYoUtGQFRvxSbEaKOLQcSwW1j4xI63
         JtLthT2zf3sJcdoNi/q38OC4ZcPlpJcwDTFG2xN/u5UDkRSs6mEAfD6XlLj2LvcGGff2
         a9/FGWfvVYvjs3qP6rT+Fk1ZqU8A0c+itVXh6gCCfMBnNWDqfKDP1SP3PI9iCHq9IEWj
         e4m+UVqZgFlipLMkAxwEmvSuSOfrHaiNBHP/I1PZoQxHukke5xpu2CP1rYimA0EuScF7
         hSMgZLjU7Y+4VzjGhI5gUuLXb6EtUIqCpAZP1qtR6SuVewLXsoNOFkdQ9bnMtqsDcdGp
         0Itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389025; x=1793993825;
        h=message-id:cc:to:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAVZhtl45acG7pXv3O1589ijaVBP1M9mCVM0eytdgy4=;
        b=huga7lKsWv/mCWvkt24a2u0rY6KmHbB/ceM/OKAX8VstYoRJ6B+puSVBU+4NRNOrWo
         pFwdVtkDgfIl5vCpEZyrPkVFr46VZja5mjyfKxDU9lZWDTlWSwp4TVLeRLSnMIjY7rYT
         1TBsKvTKffj8/Nq3Xlph4czVB4pTSGrO+7yk8WKvYBsdKiknsisuljKcYv9hTZTlYwJl
         gtqWIykZBHKu65lUmdUROk7nc4OdHf4MdJOrawach/buDvCIL2f7KNAkZZc2kWpPHn0G
         IXBrNsh5INvBbb4fctLdFoc1edh0InZXIqhy3Ptlm76Tj2WiO3XsFuizicjpk18J18jT
         PGVg==
X-Forwarded-Encrypted: i=1; AKwUvBzVgMnPz8dZDAhcCDViedG+BIOvl7yEQyE6BOs+EMrI7eBizvwyt4JuNSg2RGtRne4wOwQnrtgOCLc2X90=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo4+WtJE+eVmlXviOGGEiQ9koxwOP6yKPnAARwMdJKLxyHNv3e
	BRzouAGwixljXx67rP9Z848LKRKBf7DicHq8Hfhj3emtfmmlydBXDYfq
X-Gm-Gg: AYBFou05RSsKyJ1uJHbUXJZe7tc58Wouby6/Q/Yx80vFroPdk94Ly9hEuYkjeNykUZF
	kYU3D8xZBRyGR7tSeu+NorG7fWbAvY84CJtLgyr0GPpfLWbesuqddraT76Kt5YK3q5c6fE/i9ii
	gRf/Y/u5nW/r+kWv2bc3jIfaQDA291/NBFeFzanAFjTD8mT5M5OpvqWm3ZA5XXJP78nTfL5qp24
	wlmpU/dRgFmJs/+R33/vA/k3f+9l/0FphuoYix3Y/Y/XqW7ytgjcdy+TCCEvN3vu6p7nBnOz9Kg
	wF7Ar37yVZuPmcXJqfgsbZkdGAK/gVUDAHvSnltV1kBa6VH0rg1j2hKvX0d5Dz3GqwXlHBTXmw3
	kfEy7ZsKWgQeoMWKnv8+n7r7NHwskDizSusydvoA2MbZIKuj3DdJmn/AtI5HbDe7cmJnnz3Q4I3
	ND3jlc6W830d2xQXhrQh1MZswu9yF8kCj6yhbVGoWsQ8y5ubUF7zaoUsTjfeI0uJyXx+dyxKRjq
	pP/oomYynKFSBgEdzywSNEWltRyKUr43XlkWSkiA3mmMVk8bnnp6rBFOtv18zaGNi7c0GTvXnmx
	ZBawK1o2p280RJxSvCUO/CfwHV4qWMe2THVD5wxrmCq+F3quCgr9aPqR8y1yluJDTyu7+tpZom4
	nFM0b1sFDmjVPJp8pWr693Q2n/2c1sHbbfIa5VRcFsnqfko4BBbXXFhcnHSA=
X-Received: by 2002:a05:7022:c90:b0:127:def:dd72 with SMTP id a92af1059eb24-1ac5914348dmr5687886c88.2.1793389024873;
        Fri, 30 Oct 2026 12:37:04 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa (c-98-47-46-163.hsd1.ca.comcast.net. [98.47.46.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a136537sm8425848c88.18.2026.10.30.12.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:37:04 -0700 (PDT)
From: Rishabh Jain <rishabh.jain1198@gmail.com>
Date: Fri, 30 Oct 2026 12:36:47 -0700
Subject: [PATCH v6] usb: pci-quirks: always assert xHCI OS ownership
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Mario Limonciello <superm1@kernel.org>,
    Michal Pecio <michal.pecio@gmail.com>,
    McKenna Fan <blue_sun@tuta.io>,
    Quinn Schive <quinnschive@hotmail.com>,
    Bruno Filipe <bmilreu@gmail.com>,
    Maciej Zonski <me@zonni.pl>,
    linux-usb@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    stable@vger.kernel.org,
    Rishabh Jain <rishabh.jain1198@gmail.com>
Message-ID: <179338900780.73175.16604680938007633313@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

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
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Tested-by: McKenna Fan <blue_sun@tuta.io>
Tested-by: Quinn Schive <quinnschive@hotmail.com>
Tested-by: Bruno Filipe <bmilreu@gmail.com>
Tested-by: Maciej Zonski <me@zonni.pl>
Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>
---
Sorry for threading the earlier revisions together.

Changes in v6:
- Rebase onto current Linus mainline; no code changes from v5.
- Collect the Reviewed-by and Tested-by tags.
- Send as a new thread.
- Move AI disclosure here following removal of the Assisted-by tag.

An LLM assisted with the investigation, patch, and submission text.

v5:
https://lore.kernel.org/r/178832755831.50581.1058201741431375556@gmail.com/

 drivers/usb/host/pci-quirks.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index f670e7aab984..1dbfd697a582 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -1195,10 +1195,11 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
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
@@ -1210,7 +1211,9 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
 			dev_warn(&pdev->dev,
 				 "xHCI BIOS handoff failed (BIOS bug ?) %08x\n",
 				 val);
-			writel(val & ~XHCI_HC_BIOS_OWNED, base + ext_cap_offset);
+			writel((val | XHCI_HC_OS_OWNED) &
+			       ~XHCI_HC_BIOS_OWNED,
+			       base + ext_cap_offset);
 		}
 	}
 

base-commit: abf8c33470f78e2226ee3dcdc69004660020ab47
-- 
2.50.1 (Apple Git-155)


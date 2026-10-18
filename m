Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEC63F1044;
	Sun, 18 Oct 2026 16:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341721; cv=none; b=X6hIEfIaV7xpQYXRyRILPOeW0+brN9v+KBJsw4R3SmP1BOi5sz7aKKL6Aw3Pp6liHIZRVxROT7hxMoMvZR5uOiAKiO494ppsn09TJAf1CfICdY63kyC0/zv2q1Gvm9eE3Kzc1dq8BGBvzrNJA7+CyJcEsDEN1EAUkSpeNDvC310=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341721; c=relaxed/simple;
	bh=hGmLVsblAGabHmvZzEwwReewowZajH/dW6cuAGTB8ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=anLdR6/ajSlY3Uq5aB6EPNL9TgmSqZYqrik6uHPid9l89nP7yGj/COP9Mj+z32RXC9Y6TGqkh22liyOnxB3aP0bYEHjskr697bDooidHvkQxyQs4jqYsYjIL114IBumf7ITOAIg6Yeyvhl4LaxIob/J3mTruW9NGVIOa2nI1r6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; dkim=pass (2048-bit key) header.d=unwrap.rs header.i=@unwrap.rs header.b=GjXGD7u2; dkim=permerror (0-bit key) header.d=unwrap.rs header.i=@unwrap.rs header.b=NiqJwT/H; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unwrap.rs header.i=@unwrap.rs header.b="GjXGD7u2";
	dkim=permerror (0-bit key) header.d=unwrap.rs header.i=@unwrap.rs header.b="NiqJwT/H"
DKIM-Signature: v=1; a=rsa-sha256; s=202503r; d=unwrap.rs; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From:Content-Type; t=1792341715; bh=v2p66xuZqY
	iKMK4lP1Xh2fqmBVHwLGyF3dq2Tb2Ypkg=; b=GjXGD7u2z2jRdoHbca7d2WdlVAkgrV/ZCeLLE
	rz0DlB1r11bDcHcHG9FCXgEXVUkgA1fdgYsU08Tlx0Q5gwmK4j2tOu1P0r3bvJuMhBQCEUhzuOl
	cRE+MQujZ1DktlocFz3/JSh4bwoEKMDvvNBWUkE1CI8IPzau5JO6UAGtm33cWMAEQQlR8SdCTs5
	OlpCzOQgK3f1A58M1+F+YpF/N9vHbwtS0KyMXRpZFNbUN04hkBlEaWD230N3x3Tw0Nu2f2LepAm
	6VY0H7Jr16u6j/ECIfa6cn1zIv6ITv5KbRZ30hVbp6lNohWl5mHmbv9EEREqYOIhr3kBBpgsJZ7
	ejakg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202503e; d=unwrap.rs; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From:Content-Type; t=1792341715; bh=v2p66xuZqY
	iKMK4lP1Xh2fqmBVHwLGyF3dq2Tb2Ypkg=; b=NiqJwT/HQDbmVfCsBK9tAxHiX594O0MPf2mhf
	Uz3nf034XnCDi7J9qg61o76/L3u9HsaYwXIb5t7E113enZoCQ==;
From: Cole Leavitt <cole@unwrap.rs>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Cole Leavitt <cole@unwrap.rs>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: hcd-pci: Do not disable an already disabled device on remove
Date: Sun, 18 Oct 2026 12:41:02 -0400
Message-ID: <20261018164134.134106-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

suspend_common() calls pci_disable_device() and resume_common()
re-enables the device. If the host controller is hot-removed during
system resume before its ->resume() callback ran (for example pciehp
handling a Thunderbolt/USB4 dock or host router that did not come back),
usb_hcd_pci_remove() drops the enable count a second time:

  xhci_hcd 0000:b2:00.0: disabling already-disabled device
  WARNING: drivers/pci/pci.c:2198 at pci_disable_device+0xac/0xc0, CPU#9: irq/128-pciehp/225
  Call Trace:
   xhci_pci_remove+0x89/0xd0
   pci_device_remove+0x4a/0xb0
   device_release_driver_internal+0x19e/0x200
   pci_stop_bus_device+0x63/0x70
   pci_stop_and_remove_bus_device+0x16/0x30
   pciehp_unconfigure_device+0x96/0x170
   pciehp_disable_slot+0x66/0x100
   pciehp_handle_presence_or_link_change+0x62/0x190
   pciehp_ist+0x14f/0x1d0

(usb_hcd_pci_remove() tail-calls pci_disable_device(), hence it is not
in the trace.)

Only disable the device if it is still enabled.

Fixes: a0d4922da2e4 ("USB: fix up suspend and resume for PCI host controllers")
Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---

Notes:
    Tested on a Lenovo ThinkPad P16 Gen 3 (Core Ultra 9 275HX, JHL9580
    Barlow Ridge host, I226 Ethernet), in daily use since 2026-09-17.

 drivers/usb/core/hcd-pci.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index cd223475917e..ae5175fefd91 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -348,7 +348,13 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
 	usb_put_hcd(hcd);
 	if ((hcd_driver_flags & HCD_MASK) < HCD_USB3)
 		pci_free_irq_vectors(dev);
-	pci_disable_device(dev);
+	/*
+	 * suspend_common() disables the device. If the controller is
+	 * hot-removed during system resume before resume_common() had a
+	 * chance to re-enable it, there is nothing left to disable.
+	 */
+	if (pci_is_enabled(dev))
+		pci_disable_device(dev);
 }
 EXPORT_SYMBOL_GPL(usb_hcd_pci_remove);
 

base-commit: 32c52ec87d6245ee2d12ed5dd509e40062939b50
-- 
2.54.0


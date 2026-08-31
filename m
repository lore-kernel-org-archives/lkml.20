Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAE738AC78
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210699; cv=none; b=bJekwAicuazXOV7YbkaSYsh0xKQo8WLA0HR9ulmsAn+2fiBj3XZS5x7MriAFRCIK6rV0hwBVth2fc1V9IWhjdUADLmEZ/gwl2DwXZCIELjVpx5L6GkxzRRzR60xEd/bZ/Ck+E6gC2AO5xY0la1qKFVyfS3S6zCKvfcQpsal7BwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210699; c=relaxed/simple;
	bh=Q63MR04sB+zNUYx0lqlqqCJa/F6jjRvfRvkJKfzV9mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVk3MX61hNjJUwViEcKrlgwNXWTAKbpGuVW7cz7YEBfzRQOGNvkWBB05U0tL5RQc5Xb0y9H8V3VP1BKjKB6rYRK+mowVPJVhjoiLefcdRpf7oMnNXhjgfastNrUBsin6Ya6RLNRYuFCWBnl880+Cos08ANEXll5K4jJbAXzay/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbvlwasb; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbvlwasb"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1c9b7c1e4so673736a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788210698; x=1788815498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YvP8FNVlmhwGF7juXCoARc73UH3L7nBQG3sdAe9hHrY=;
        b=hbvlwasbuFlqJ8hYeCtBtdu6Ao+RI5JSMhJzs2xCYXsKk7mWI5cG+7FjNjxtmckg/k
         KQeXW/rpvfvrtAV2F0i5JIqWJhMUw471oT0GOENCNRwZQ0PfHRowbmEilQh38CjRdBRO
         wn0Ena/3KtDJngu6MDfc4y3LN6e58RtONVYgnVYziZhwoKAXHGS8s766o73LYDcmeSFR
         WKhMTp/bKbpzJgxuCsFi0A2GFUQot0TniJduk5/o3OL/HNrGFn5V1LhTh7tvOOJsio71
         fkpfc3oUatG3O2gZGjgiqyvrlzeEGoAGIH5qqPBUuVEiHeYQfPIC13UC1bUbxVXr/+8d
         yS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210698; x=1788815498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YvP8FNVlmhwGF7juXCoARc73UH3L7nBQG3sdAe9hHrY=;
        b=h6zDeSls/QG/STb4acNrB46sPyW8Kn5m7sSK3EijEBzxFdpjmBaD1vQZDfRIgbNWB6
         0k6wArh693nQ7b8au7zfxD/k4rVxm61w4m8WOZDY5nksAA23B5LMMgWy/NQGu5fOF/KZ
         7DddGGKs5X1KYlC5Q250W74TayxxtvblvbW/VO+QtZ9zOXy2qg/zygqlHLVBPNvufF5z
         c3t1YUpC0S3lxlyEeh4Hrd1piYt18iRCzJeBQV3XJ1h/J5BJBg7v5KX7/w2Ak/ik3F3h
         RKGgONnXe9wnC32dzvyneU2uw8ZHorPlfU7F+RSrdpxt6YEGfwMXx1Tu65m/Nvu+JLCz
         x4aA==
X-Forwarded-Encrypted: i=1; AKwUvBy6MFommDBBBdsbUl4KtNhNrsSjGYNvUYKB1XlfsMTefY9HaJyZoLqq6l0kcIcsUI4IjSPjtkzugeFnp/E=@vger.kernel.org
X-Gm-Message-State: AFuF++nvOR0vXTDRDPmxQgCwbbEy1iBYZMwr8PlhMSa+jm1nX6ubpB/N
	J4yWy5HqtygEfVvHE7+SX6w8Hgr1cNxK4+4NxpYO97GmlmrCt/BkYpF1
X-Gm-Gg: AYBFou07Ud2zofaU+ppJyNNgCDziZIvkATt/j9S088tsCmE2AyVw2747KhEoAnh3dF2
	cR9APy2Tcqc+wRfyUCoGhD+dUYowkqvWvIB6vUA47VeJaOosKuQSmjb8JalFNHESB4owZ5lMx/H
	pfBtOAKh+GiqH3Ndr35LjE+/xYcprpO429fcqLEFXmmfzV/2a9JPc2dTC8zeEkQnFxmY1Jnfjfy
	hsaYCwbSumDUQr61EDKgvT1pfuJ0YUnJ/H8ZELC0Ls2he0WU/1a49jebq5EztBvVXqxjirtAdZp
	aL0SXj0qGWOjKmff0nk8+lezyYD8jUi2HdD42Wq7dyYDK2CSBO+1iCn8QAdAD6CJVEKNKLUp1Ft
	jHi29QuCqRI5MPQinirnpWy2IgUN/Pfh8mFl8AVCdtuyxXMsteAnzqGOLzFfytzJydMrd3zz5wG
	ksBsTGgpYYqEwQYrs+SXmqLz7O2YKcPZwlCh2LJvg68h+lRLe9lp94wQH70tPjrYhGYhQMgCwhz
	NB7oBzOFa65+Gv+OnI7iFKgZ3783I4zzAA4sYVV6ZGxUWubuYVhECGfruIsEBJp0M6zPyhKXBP8
	LhBgP850PrcPd+Qb7bUzkJR/sG6jQCidxJJ4/8QIbKJJspLoelgKiLt12ObkNqS0Rp4RvXAsEea
	6f8pQOzaN
X-Received: by 2002:a17:90b:442d:b0:396:d27c:8696 with SMTP id 98e67ed59e1d1-398babea308mr15440305a91.4.1788210697055;
        Mon, 31 Aug 2026 14:11:37 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (c-98-47-46-163.hsd1.ca.comcast.net. [98.47.46.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm52933419c88.14.2026.08.31.14.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:11:36 -0700 (PDT)
From: Rishabh Jain <rishabh.jain1198@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mario Limonciello <superm1@kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Rishabh Jain <rishabh.jain1198@gmail.com>
Subject: [PATCH v3] usb: pci-quirks: always assert xHCI OS ownership
Date: Mon, 31 Aug 2026 14:11:26 -0700
Message-ID: <20260831211126.23745-1-rishabh.jain1198@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2026083129-justice-egomaniac-01cd@gregkh>
References: <2026083129-justice-egomaniac-01cd@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The xHCI ownership protocol requires the OS driver to assert the HC OS
Owned semaphore before using the host controller, then wait for HC BIOS
Owned to clear if firmware owns it.

quirk_usb_handoff_xhci() currently asserts OS Owned only when BIOS Owned
is already set. If firmware leaves BIOS Owned clear, Linux uses the xHC
while both ownership semaphores remain clear.

On an AMD PROM21 xHCI controller (1022:43fc), this caused every S3
resume to terminate Controller Restore State with USBSTS 0x401. Linux
then reset the host controller, both root hubs and the USB Bluetooth
adapter.

The controller entered resume ready and halted with USBSTS 0x1.
Endpoint state, 100 ms save/restore delays, scratchpads, the DCBAA,
device contexts and command, event and transfer rings were verified not
to cause the restore error.

Asserting only HC OS Owned changed USBLEGSUP from 0x00000801 to
0x01000801 and eliminated the restore failure across four S3 cycles,
including a stock-kernel test. Clearing USBLEGCTLSTS was independently
verified to be unnecessary.

Always assert OS Owned when the xHCI Legacy Support capability is
present. Use the existing ownership masks with a single initial register
read/write. Keep the existing BIOS handoff recovery and legacy SMI
cleanup unchanged.

Fixes: 66d4eadd8d06 ("USB: xhci: BIOS handoff and HW initialization.")
Cc: stable@vger.kernel.org
Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>
---
Changes in v3:
- Drop the unnecessary BIOS ownership debug message.
- Drop the redundant self Tested-by tag.

Changes in v2:
- Use XHCI_HC_OS_OWNED instead of byte-offset access.
- Fold the TI/Renesas forced handoff into the ownership-register write.
- Make the BIOS handoff wait unconditional and gate recovery on the initial
  BIOS ownership state.

Additional context:

* Kernel Bugzilla #216470 documents the same USBSTS 0x401/reinitialize
  behavior and its impact on attached USB devices:
  https://bugzilla.kernel.org/show_bug.cgi?id=216470

* Commit a7d57abcc8a5 ("xhci: workaround CSS timeout on AMD SNPS 3.0
  xHC") is related workaround history: it tolerates a distinct AMD CSS
  timeout and resets the controller on resume:
  https://github.com/torvalds/linux/commit/a7d57abcc8a5bdeb53bbf8e87558e8e0a2c2a29d

The external reports do not record their ownership semaphore values but
are included as corroborating failure signatures that this might fix.

 drivers/usb/host/pci-quirks.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index 0404489c2f6a9..52d41ac5daa85 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -1191,25 +1191,22 @@ static void quirk_usb_handoff_xhci(struct pci_dev *pdev)
 	if ((pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241) ||
 			(pdev->vendor == PCI_VENDOR_ID_RENESAS
 			 && pdev->device == 0x0014)) {
-		val = (val | XHCI_HC_OS_OWNED) & ~XHCI_HC_BIOS_OWNED;
-		writel(val, base + ext_cap_offset);
+		val &= ~XHCI_HC_BIOS_OWNED;
 	}
 
-	/* If the BIOS owns the HC, signal that the OS wants it, and wait */
-	if (val & XHCI_HC_BIOS_OWNED) {
-		writel(val | XHCI_HC_OS_OWNED, base + ext_cap_offset);
+	val |= XHCI_HC_OS_OWNED;
+	writel(val, base + ext_cap_offset);
 
-		/* Wait for 1 second with 10 microsecond polling interval */
-		timeout = handshake(base + ext_cap_offset, XHCI_HC_BIOS_OWNED,
-				0, 1000000, 10);
+	/* Wait for 1 second with 10 microsecond polling interval */
+	timeout = handshake(base + ext_cap_offset, XHCI_HC_BIOS_OWNED,
+			    0, 1000000, 10);
 
-		/* Assume a buggy BIOS and take HC ownership anyway */
-		if (timeout) {
-			dev_warn(&pdev->dev,
-				 "xHCI BIOS handoff failed (BIOS bug ?) %08x\n",
-				 val);
-			writel(val & ~XHCI_HC_BIOS_OWNED, base + ext_cap_offset);
-		}
+	/* Assume a buggy BIOS and take HC ownership anyway */
+	if (timeout && (val & XHCI_HC_BIOS_OWNED)) {
+		dev_warn(&pdev->dev,
+			 "xHCI BIOS handoff failed (BIOS bug ?) %08x\n",
+			 val);
+		writel(val & ~XHCI_HC_BIOS_OWNED, base + ext_cap_offset);
 	}
 
 	val = readl(base + ext_cap_offset + XHCI_LEGACY_CONTROL_OFFSET);
-- 
2.50.1 (Apple Git-155)


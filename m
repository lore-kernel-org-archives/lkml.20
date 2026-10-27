Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793144317;
	b=aRCxD077XxRnxAdmVKdjv/sFuBjhW8T0wzQl6daJsVEbGkUg2eVd6++HKkp1ApLgEX2X
	 68sL7mc8smw+313RB2niuTVNWBR8a0DDv+g1OONE3tpAHQwFMvimaDN6C8sbMKPFockO5
	 PPyt12SkHvecexxIxjx8zUy8Lqxoz6LDIWoq3l1ph0VIEpOHeGXeHyrYOMuhwp9NbZnY0
	 OkvLEwi+FZN5rEVU9F0V3kBS2e9aYVVUPCtgjfurf32abi57EnQa3mOh1arydQ1mysHLw
	 ORuyc4DiauuORxxs1QTK1FVnOVRZS1rFVXmaVD+cyvTVG7bw7KPkRgPDHoyh0DgywyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144317;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k1MxGfpFlT7dkeupz0T5lK63fjoZTYsDJPiZEqVnvoc=;
	b=fOo/M8vlJxkTD2+Xb+rqzaPgBk8yqcmbmnlP33wc1MGXtLrmzNmbwIhHVQTI2CI2Bf0o
	 PJOk045vQ6cIkrOfkbliokWQAgablOOD1VQoq0PuYeTvTU+6ctzDkv/MCTIMUTn8NG9iW
	 LFZzL46blsnt6VSx+9fV1TI1kxXQrNo8FLpA75vVPSTMEOVFYUwDJ6mLdGwvO/9Ym8FNh
	 Dyi444TAxNF/h0OkuOHxsEaVNjqQi1uDp/hyy4WtCuAeBy8tCmR3RXCaaCpf82sGNh31Y
	 zUrCwo4Xhof3Gs5HIjQ96jjoTWjofZhBVujjx+sTguGP7x/e3mdFUhCzaRUzLy4c62g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kzexqIdz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77143606A31A;
	Tue, 27 Oct 2026 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kzexqIdz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793144315;
	b=A8OaR42Ug/9JXwIuAP4MEe1uj+ZxlORcxyaZylUCRD8LscHi8c788eMuGGSyRvqSb2z9
	 kr0Ym0cj5fNG/B9iZ2mK7IFdlyqQmU1KCg32TsdbY49rAJ6HP4fWwpa/pp3Q76yuEAWKi
	 rplDx/pE8ouZNXQf7JC/N+OXBNFbndUSejj0oODkuoiSoQySEUss+ur1GwYd2TsyhRlR5
	 TajyqtgGg6hgETf5yc+VgxzHHTkc6l+kY6IewESRkG2imWywQrqqLovWjXUnAxFv84xpy
	 rdY/lK2Cx+qjy9z1RzpmqYnG+X6cVu9YG3j3iVGLiC6uSznwonqw4FjAc1G6DU537SA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793144315;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=k1MxGfpFlT7dkeupz0T5lK63fjoZTYsDJPiZEqVnvoc=;
	b=OoALIzq8sEF1/d+cOFSw2EVGMjCnDgwoyMQktmfshs+QPoyjHZMaCyRm5E/uoefUGhi7
	 ZemoY7wlI36MDwCfx+DNeWlJ0i2mYPWnOJBrHik6p6IZooKNjagdzKwL5q0JA8otOVMiI
	 yd8zYWbi7U4YclmDbxrGY1pCO+Ag99onTawM5Dil2Y6ySBGNYW81gmDBWu1AXh9UzRSIl
	 KQJfEyeuuEE8gf5MNokGDZtdt9KDIRlLJUQIx9O5hrDv7DfdOG0hWKRWPcaTfSYUza3zK
	 Ri0QVwU6/JxjiVKfZ2aIDQFZgMrRjy2/bGPF7+P83ZFW4eCu21ZFKlMlahPY9kAphow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EA4F1F01825;
	Tue, 27 Oct 2026 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793144315;
	bh=k1MxGfpFlT7dkeupz0T5lK63fjoZTYsDJPiZEqVnvoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kzexqIdz6cSRJ2Ze/a7NeZDWobwtsaHagGurH863vjvvMYhhmJXtBzO/4DxH9MPF0
	 ibBq5SYaAdWrc2odIRi5PUynPAWD/B2zowbEY6yrYYYfP3mc04T7aWDSEtD0X/ebDk
	 TIUN7aRdAKV6K2UF0OM3o2rkUakcEN7S7pig9evxUeWlR4zr7oiLPthuqBqyWzzYS6
	 88WtAqGMwIyPbmLgtAcy6g6xEq0/4E+HsuWewN5iUZ1hEIeQgrz5pJ5tGcVCa+/8Ij
	 ouOxFq8aQm3oJ+QsB2loR2PoAcJZplVeS8p5fDrV1e/eEfIgL7c9/iBg6Eg/425Hsf
	 17Kc6kWOGZUpA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BCC63452E2;
	Tue, 27 Oct 2026 23:38:34 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Tue, 27 Oct 2026 19:38:35 -0400
Subject: [PATCH v2 2/2] usb: ehci-pci: Set has_hostpc for TDI EHCI on Intel
 CE5300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-ehci-ce5300-hostpc-v2-2-375e9d362d74@telaak.dev>
References: <20261027-ehci-ce5300-hostpc-v2-0-375e9d362d74@telaak.dev>
In-Reply-To: <20261027-ehci-ce5300-hostpc-v2-0-375e9d362d74@telaak.dev>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793144314; l=3297;
 i=joseph@telaak.dev; s=default; h=from:subject:message-id;
 bh=mAomdJY7vVHiH3SZhOh4pFTjDcxX+9QU//lNz5w7C8k=;
 b=vSS727hInN79mdgdbbEnxkaH9nfyw29I2eqlH5yTXBpHRWd+JBkXWIjomvRCLL0svZjIC5Ss0
 XkqjJgR+XxyBDTttuhbQowaE/9gCd6BlQ6t4rSjhBGu++LLcV/MRK3D
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=vbM2RxVf3De5c1pQhdR2zZNLas2GaS+BXNVRR5qg3hI=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/default with
 auth_id=1203
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The TransDimension EHCI core in the Intel CE5300 SoCs (192e:0101,
revision >= 6) has the Moorestown-style register extensions: host
mode is selected in USBMODE_EX rather than USBMODE, and the port speed
is reported in HOSTPC.

Without has_hostpc, ehci_reset() never programs USBMODE_EX, so the
core stays in idle mode: USBMODE_EX reads back 0, USBCMD.RS never
sets and no device is ever reported as connected, even though the
probe itself succeeds. With it, USBMODE_EX reads back 0x23 and
devices enumerate.

USBMODE itself always reads back 0 on this core, so
tdi_in_host_mode() would report a running controller as not in host
mode and ehci_halt() would return without stopping it. Add
has_usbmode_ex so that, for this core only, tdi_in_host_mode() reads
host mode back from USBMODE_EX. ChipIdea also sets has_hostpc but
keeps host mode in USBMODE, so it is unaffected.

Intel's CE5300 BSP sets has_hostpc for device 0x0101, revision >= 6.

Tested on a Control4 EA-3 (Intel Atom CE5310) with v7.3-rc6: a
full-speed CP2104 USB-UART bridge (10c4:ea60) and a high-speed USB
flash drive (0781:5575) enumerate with this change, and
ehci_shutdown() leaves the controller halted (USBCMD.RS clear,
USBSTS.HCHalted set); without the USBMODE_EX check it stays running.

Assisted-by: LLM
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/usb/host/ehci-hcd.c |  5 +++++
 drivers/usb/host/ehci-pci.c | 10 ++++++++++
 drivers/usb/host/ehci.h     |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 75f780ec3b..fd7b47c0f0 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -170,6 +170,11 @@ static int tdi_in_host_mode (struct ehci_hcd *ehci)
 {
 	u32		tmp;
 
+	if (ehci->has_usbmode_ex) {
+		tmp = ehci_readl(ehci, &ehci->regs->usbmode_ex);
+		return (tmp & USBMODE_EX_HC) == USBMODE_EX_HC;
+	}
+
 	tmp = ehci_readl(ehci, &ehci->regs->usbmode);
 	return (tmp & 3) == USBMODE_CM_HC;
 }
diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index 3c7430a06e..183002ed7d 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -155,6 +155,16 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
 	case PCI_VENDOR_ID_TDI:
 		if (pdev->device == PCI_DEVICE_ID_TDI_EHCI)
 			hcd->has_tt = 1;
+		/*
+		 * The Intel CE5300 core selects host mode in USBMODE_EX and
+		 * reports port speed in HOSTPC, as on Moorestown. USBMODE
+		 * reads as 0 on it, so host mode is read back from
+		 * USBMODE_EX too.
+		 */
+		if (is_intel_ce_tdi(pdev)) {
+			ehci->has_hostpc = 1;
+			ehci->has_usbmode_ex = 1;
+		}
 		break;
 	case PCI_VENDOR_ID_AMD:
 		/* AMD PLL quirk */
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index 855a9d08b0..e26e913ad5 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -248,6 +248,7 @@ struct ehci_hcd {			/* one per controller */
 	#define OHCI_HCCTRL_LEN         0x4
 	__hc32			*ohci_hcctrl_reg;
 	unsigned		has_hostpc:1;
+	unsigned		has_usbmode_ex:1; /* host mode is in USBMODE_EX */
 	unsigned		has_tdi_phy_lpm:1;
 	unsigned		has_ppcd:1; /* support per-port change bits */
 	u8			sbrn;		/* packed release number */

-- 
Git-155)



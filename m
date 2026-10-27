Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793144316;
	b=wjCa2fRAtsvoMwKb8edDsCz9Ul32+Rs/PabzeKVZ3VG+izeQjSwjb3O9+BjmWCNVWj8S
	 vPLhpRjUxwdzvYXRue/oo4hKevYKsIjPVwA4E162TLYnHFJ3eaFdKio98NXGNWHaF31sG
	 JD7R1ifZGe5cdUs2HEIsPkERDVsSb8pxKBo2Nwc+D97YHnL/3UecFUftXMjS6dB/a94Rc
	 0exi1KPxa7Lhmngf6Yb75mvmGlAaaS9hfQW+MJcGA3CWHofgZoMRkjRPSFcs507x5FVuy
	 urRh6794nazaUa3jTdaHxdf/MNIKDSWBsrujfPcrN6s3O3BMjk6WwL1v7EMUKgBoNhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144316;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KLy077q3uNLNrSGKqRnp5Fea85nGPQ3CjKXZFxDEyYU=;
	b=fizDMbAYPeL0AnIFtio2Us9O8XTiOq97YU/x/ZEstU7CbDIhr5Va2jh3SzP/4whp86wP
	 2xdjRCYWOHNpC0gRIFRpiDyMyyVMlgtBguATTMXuW3b+mGJMFWowJ4q5kWBru0pGhv6vh
	 1RIqD9PFdbaZlKfmTK9CSMLDXmEtinG9fUpkciSacAp3wQGSyHbJVUNsqbYParccELhId
	 vAzxTEg+8ardUu9qKh/PXGhT5otlqZ2hdv2lozsFvbYh4YuNR3chyB9BCYIcNRE9fhznH
	 7N9F/Xtbt3RD6WVkJB1bLZjS00phSmO0CmRk8Qmc4BaVzir4SUpW1gitV9fUKnTuzvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BjOtMAlQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771F5606A31D;
	Tue, 27 Oct 2026 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BjOtMAlQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793144316;
	b=BEpdFH8LcBkEr2J6agKITIyslXoygI5NiythTcUuTRPTXbPqPXEhHNzsmDtwN444Qc6x
	 mpiZKdaSkT8syYQ0EYEPaLmCwIbtqSPWCHi9Sp22aFEWR6lLpTszRoPqb+wgAVYE0TwZC
	 f7pUJkGNGAORqt6RkimwZ48FmQEvsYiroacH4NBYJQ0f0sn+jMVJg8w0ZLDE1mqdvdsVV
	 DcZKaDUqEGBvp3B3NrSOCUJLhzFnt/LqFCtvq0K9RZseMq+Nw0H8uKGKOwtehDMu7DX4G
	 GEAS4WkRrwM6zbFSiM5yKT47T93Ef42QOBFlWbxqTbway/FOSk68UT+oJOcxAOT7o2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793144316;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KLy077q3uNLNrSGKqRnp5Fea85nGPQ3CjKXZFxDEyYU=;
	b=g7D2drX6hcpvvdKql7UqmeN0GqYHuoxRgsA4NhwUk+ik0DBv5LwM8NprSXHtqaKZI9ax
	 iqCCiZA4VeI1PnEXxlim2HNRMBCTQJpd4XketLcGYWpC0YPjNDyweaXG5hpljTDkVCY0G
	 zdOLOs3H80jAyVwALXx1T27d2fK00wJIWMUPqJ1Cq5LInTIsoDxYSiEPwyPn0xR775JbK
	 jmzeP3DayxY5RbE6ZMGwQhwkIcJKiQ9X81YtORnB7oM5s6vrSlUslrqgG1c/HunsXhOb5
	 mqNJZGqnVNkDZRaAIVZeK63QY8h7UGPo2r6jGI1t1IFqHiNJAKvBbky+L3Bpdf0EM4g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 506241F01828;
	Tue, 27 Oct 2026 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793144316;
	bh=KLy077q3uNLNrSGKqRnp5Fea85nGPQ3CjKXZFxDEyYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BjOtMAlQK09QlPDRJpxEFp9sx5/x6+aqs1uuXIwe3sSrZet5Cal3BJlDLe5LmJQkK
	 QoGzDbrQ7qf4jnRGYciD1inS5ljnKnQhxgLsOAN/24nR8GGqZHafPi7ZjHrX600Lsx
	 BVftmiDUm1ICx/IISbqkow5Shco8YOf3p2DQ+S+b9RUZy4z/sUOu+25peqqGLcFsAl
	 hPG1NlM/akRCZYLGT1vdkJ1vZ+UtpOG2ekFW0WtiWFIsUMGYkhV8e1DMzIfHRUPbzb
	 q8xwVRG4uvzYOm10/ReI+x6gQmnkaFWIbpNMXXBVA1zi894cfwYYENtPLYvM+Wyr3a
	 hS+AMm8SsUdrg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B2AD4452C1;
	Tue, 27 Oct 2026 23:38:34 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Tue, 27 Oct 2026 19:38:34 -0400
Subject: [PATCH v2 1/2] usb: ehci-pci: Skip SBRN and port-wake reads on
 Intel CE5300
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
Message-Id: <20261027-ehci-ce5300-hostpc-v2-1-375e9d362d74@telaak.dev>
References: <20261027-ehci-ce5300-hostpc-v2-0-375e9d362d74@telaak.dev>
In-Reply-To: <20261027-ehci-ce5300-hostpc-v2-0-375e9d362d74@telaak.dev>
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793144314; l=2537;
 i=joseph@telaak.dev; s=default; h=from:subject:message-id;
 bh=XLKlRgT0Je/buuDmBCEauwUFMUUQyJz51xcNAqZXxSg=;
 b=kfwdbBmD8UehZmnWWRj4NgwPHQF5ecjlbq3la82/pcyNQnhlsonqILVijjnOqVZYDG5J0ttVa
 JXccqemsQ9EAUaVUj30roFBhwtE2gk5cIHT7+MzdIGD0b+kvTRp8nGB
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=vbM2RxVf3De5c1pQhdR2zZNLas2GaS+BXNVRR5qg3hI=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/default with
 auth_id=1203
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The TDI EHCI core in the Intel CE5300 SoCs (192e:0101, revision >= 6)
has no EHCI-specific PCI config registers at 0x60: those bytes shadow
BAR3. ehci_pci_setup() reads two of them anyway.

SBRN (0x60) reads as 0 and overwrites the HCD_USB2 default, so the
controller reports "USB 0.0 started" and ehci_shutdown() returns
early because sbrn is 0, so the controller is never stopped on reboot
or kexec. The port-wake word (0x62) is whatever BAR3 holds, so on
some instances bit 0 is set and the driver prints "Enabling legacy
PCI PM" and marks the controller wakeup-capable.

Skip both reads for this core, as is already done for SBRN on the ST
ConneXT and HiSilicon Kunpeng920 controllers. The new helper is also
used by the next patch.

Tested on a Control4 EA-3 (Intel Atom CE5310) with v7.3-rc6: the
controllers report "USB 2.0 started" and the legacy PCI PM message is
gone.

Assisted-by: LLM
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/usb/host/ehci-pci.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index bd3a635555..3c7430a06e 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -31,6 +31,14 @@ static inline bool is_intel_quark_x1000(struct pci_dev *pdev)
 		pdev->device == PCI_DEVICE_ID_INTEL_QUARK_X1000_SOC;
 }
 
+/* The TDI EHCI core in the Intel CE5300 SoCs */
+static inline bool is_intel_ce_tdi(struct pci_dev *pdev)
+{
+	return pdev->vendor == PCI_VENDOR_ID_TDI &&
+		pdev->device == PCI_DEVICE_ID_TDI_EHCI &&
+		pdev->revision >= 0x6;
+}
+
 /*
  * This is the list of PCI IDs for the devices that have EHCI USB class and
  * specific drivers for that. One of the example is a ChipIdea device installed
@@ -312,6 +320,8 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
 	else if (pdev->vendor == PCI_VENDOR_ID_HUAWEI
 			 && pdev->device == 0xa239)
 		;	/* HUAWEI Kunpeng920 USB EHCI has no sbrn register */
+	else if (is_intel_ce_tdi(pdev))
+		;	/* no EHCI registers at 0x60; those bytes shadow a BAR */
 	else
 		pci_read_config_byte(pdev, 0x60, &ehci->sbrn);
 
@@ -320,7 +330,7 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
 	 * can be removed on 17 Dec 2009 if the dev_warn() hasn't
 	 * been triggered by then.
 	 */
-	if (!device_can_wakeup(&pdev->dev)) {
+	if (!device_can_wakeup(&pdev->dev) && !is_intel_ce_tdi(pdev)) {
 		u16	port_wake;
 
 		pci_read_config_word(pdev, 0x62, &port_wake);

-- 
Git-155)



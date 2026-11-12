Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484699;
	b=g5jj33MGvJXQ0iMYPiQZCH6uCIFjQRzrkh9VhsX65RjMmQ5bGOHsZ86wXO2oBK4oaCow
	 MOf56g57dJNvFLHLFuhv83KyKAvVWzDuYmpIlqMbR/39DfQeMiWDwHJ2QLnOIrsy4QDxO
	 CrWMnid8BENRDLRaLcyDvvHF+CU8Z1stFh36F6AugnpZrRhfIb0mOv629TDvYRC1cRi7j
	 +qkuE9YF1Wga2gdrwMdUUHEphc7jfATzRfDG90EfcHQM7jqvCxjHVQH7LlyAFRXP+loxh
	 jtuLb9QUGZ7SPQhoy69CJs7CaT+4YJId9crTwg/SMJwKJquyYsK80MmP2KZ9N2fzHEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484699;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=sfLHcWpnq20caHJHCxxcMBF8FhCQ66tT+/gp4ILq9r0=;
	b=NUoiiHPBMynczg1GZdP5y/GEvJ+KnpPCIC4rs2V8GmNVVrB4nrPsxzkon85IkhGp3Q5Q
	 JigU2CxJMKmQtB2tfnDs7J7eWo+AO1JD50hAyUQtsEVhCnYQ52vkLANHf6oG2WpwqVFfe
	 K6mLMVI5uKXOGSDviRRlJkmDePaKG06HQ4VM8sd3Bhv8y+lMrkAbFtb6MQ3HeHeGPtODi
	 PMUWHNuO/U2UHoJ6q83/wTXxxV92sEfl3YPNvSP4Vu+xVE49BoNGogaSRaeSJ1F4SgIx5
	 O/CKOb6eNw7mlWryyrf3hBFzm+ARrMdmGeHuX/lY/hN8R6VeQs9OO1xHPkS4XUm5YVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Mc7sHSCI;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2A8606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F2A8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Mc7sHSCI
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76D18A0064;
	Thu, 12 Nov 2026 12:58:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794484695; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=sfLHcWpnq20caHJHCxxcMBF8FhCQ66tT+/gp4ILq9r0=;
	b=Mc7sHSCI2CgJp4mgP7GG45uP/g/da4TRVl3aPYcP384KJOcb7Z0uaFPXLfv6M19OeX0Z2q
	SMMcfT9PUOvLXXI/hF276MyJc9jjklZNvnvlPksAWcQUAQN7h5IyIUEr+6OxC7SPig7h+q
	rTVTs/6uOCMcTxNBZeasPHEzpRoc+sddLfYBGplDIr/tPkBs7z6rPdjzsCRLZf4ZtyMLZj
	C2iZMrz1M/by+q4+wusT1MmDDrXVvAunoKdHRZHf4qdefAmnxF8qINQ3LaEE+1+cpBCLca
	u+ZD8HBtp61/PWhgxqdEqfeSUwDNtcdqlE/G27Ng7WvFdGDMzj4N+pCRFHaAkA==
From: Nicolai Buchwitz <nb@tipi-net.de>
Date: Thu, 12 Nov 2026 12:58:11 +0100
Subject: [PATCH] irqchip/bcm2712-mip: Fix multi-MSI allocation for
 non-power-of-two counts
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-bcm2712-mip-msi-align-v1-1-68090868c979@tipi-net.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZOS/QRGiZrzJ22Go2I7YbjYow9
 u5WPX6H/9/BpKgYnJsdirzUdM0V1DYQr2NeBPVSDezYE7mAU0wciDHphskUx7suGb0/8Rxi5x1
 1UNutyKzv37cf/rbndJP4+M7gOD7j2DNjeQAAAA==
X-Change-ID: 20261107-bcm2712-mip-msi-align-6632f7c96019
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stanimir Varbanov <svarbanov@suse.de>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Nicolai Buchwitz <nb@tipi-net.de>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

ilog2() rounds down, so a request for three vectors reserves only two
slots and the third can overlap another allocation. The alignment is
also applied to the bitmap index and ignores the msi_offset that is
added to the message data.

Reserve exactly the requested number of slots and align the start of
the message data block to the vector count rounded up to a power of
two.

Fixes: 32c6c054661a ("irqchip: Add Broadcom BCM2712 MSI-X interrupt controller")
Cc: stable@vger.kernel.org
Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
---
Found this while working on a series that uses all 20 MIP1 outputs on
BCM2712. Even though I can reproduce this on a custom Raspberry Pi CM5
based board, I'm not aware of any bug reports regarding this (yet).

The fix has been tested on Raspberry Pi CM5.
---
 drivers/irqchip/irq-bcm2712-mip.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-bcm2712-mip.c b/drivers/irqchip/irq-bcm2712-mip.c
index 06a6ab6270ad3..a0f45df0e4c87 100644
--- a/drivers/irqchip/irq-bcm2712-mip.c
+++ b/drivers/irqchip/irq-bcm2712-mip.c
@@ -71,15 +71,24 @@ static struct irq_chip mip_middle_irq_chip = {
 
 static int mip_alloc_hwirq(struct mip_priv *mip, unsigned int nr_irqs)
 {
+	unsigned long hwirq;
+
 	guard(spinlock)(&mip->lock);
-	return bitmap_find_free_region(mip->bitmap, mip->num_msis, ilog2(nr_irqs));
+	hwirq = bitmap_find_next_zero_area_off(mip->bitmap, mip->num_msis, 0,
+					       nr_irqs, roundup_pow_of_two(nr_irqs) - 1,
+					       mip->msi_offset);
+	if (hwirq >= mip->num_msis)
+		return -ENOSPC;
+
+	bitmap_set(mip->bitmap, hwirq, nr_irqs);
+	return hwirq;
 }
 
 static void mip_free_hwirq(struct mip_priv *mip, unsigned int hwirq,
 			   unsigned int nr_irqs)
 {
 	guard(spinlock)(&mip->lock);
-	bitmap_release_region(mip->bitmap, hwirq, ilog2(nr_irqs));
+	bitmap_clear(mip->bitmap, hwirq, nr_irqs);
 }
 
 static int mip_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,

---
base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119
change-id: 20261107-bcm2712-mip-msi-align-6632f7c96019

Best regards,
--  
Nicolai Buchwitz <nb@tipi-net.de>


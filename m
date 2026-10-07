Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D736F90C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791382621; cv=none; b=G6X1zbdjCcOBn/+VaK0+1TOEwBx30nuzZ/T83JydmFeLtHQN86qDP3mG5SOmHP8138RV8ixOCrNZpgm2z7LMfjpr1ebWPWlIp0UMRum3Os9YX7WNAeUB3qyAAnYMsw/wSnO4mhI9DWyuJ/s8kj1AGsZmT1rsk5g8F4q9EtoGrog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791382621; c=relaxed/simple;
	bh=Qmkf+XiGZRy30vGcRvQw4oCFml7R+FQ4UhT7npyZ/iY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MF2dwKK+CzUxUgDjQqcY4fBZGzIdHx1aITcREaoISfYp4y78/PD3rMTEsr0pJTcFSeMA9cKAe/fxZFXYDlV1MKU/PEo3Rsd0iNTMeKDrJJQUa1I7oi8PUXSIt7yavy7pFKTSvIk3CFOWQLpcE2apM3dlN78VuygEYD5+a0LqZuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5q6yfo4; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5q6yfo4"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f84a55e31aso1548839a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791382606; x=1791987406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgfFU4PoWoQaUk98vWn6gXhkSnB1yU0D/q7IV/OvUeI=;
        b=p5q6yfo4AjoekKy2BPgPXnZ8jVojhWWEts9/jCh3R0Jit6Z6a09O6THePg1rk3RcmX
         3jn1MmiZmhL6GICR58kEdimoK6sd4mu8YmvJ2JeiIGOoxEqiPAWtTw8suNsmK6M0vX/s
         TtjSKZcN0RurG8HaE0F18SdGQt++8neOhN1AFERlpJbbfPwibCzA6ptDWkY4TGDzHZhb
         bok/Qi6LZ5Ufyk6wa7Lfft5oruCbK9dwEmtYapoAlJ+64HZLFamefjD4DwBgEOdNgAfY
         ARVuf/aGdV6ad24qTYN+fWpmK0IraMTd38Ia6/6xIph7ogMDDokuBh3K2EmzPXd82HIC
         +PLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791382606; x=1791987406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgfFU4PoWoQaUk98vWn6gXhkSnB1yU0D/q7IV/OvUeI=;
        b=D5cG7RG2MHjkHpojaiWDd4EQ1kzUwWHD3/bqBzqgYy7d3MH68kS8rSygX4nMErhyPA
         rG8VO6wTmT/Dy9clVsMpFqk/bMCDz3PYRCzmal/PXdXvi4PbKu5ZcGFnI4E8GKwSpORi
         itac6KtMnIZq5Li+m7Q4KskcKrokJ7rvBkJOlpd3ZEp831jDKuzcPbxIN4mVRDzSi5mR
         2v/rQrOQglSTnfCy1pNpqn/6XJKaoDRx9X8KP2sU3BD0vFq99wbxC9UnSPPUfy5tEqzs
         4L7z3P0ULnvSq7uu9Quf6hP+xvC8HhjGc7KhNsDZcGRAtMlvbgyRx1x0u3Nme5jG2uIT
         dK1w==
X-Forwarded-Encrypted: i=1; AKwUvBzovpBZvo8wv/bvnX7ugtMpjcvL4RVTvpdJTR8Ey32vLJipSvBic3ZdGXOm+EBmijhnZVoNhLdXIQZmtwE=@vger.kernel.org
X-Gm-Message-State: AFuF++nPyT7dSsr5WEdYTJXRV/7/Pl3LjCWCzHLJZKGWFNHGCIEmRLGx
	+IEoIY8oyyjGfCzrj7x5sOK+ss8LHwGpe5FWPmaoQnMdEsu7Ti97KWn8
X-Gm-Gg: AYBFou1jZrsVGaP3qc3tlEoEYgyzArfiqWHLz4pNhj4G83kEBCg6lMpeRPphmfyUymx
	TclhUXLSHjIRefF3ubywznDi0f7v/ziU930/5bEOmxRPefEWSXQ8+D8gdUX3/hZy0W9UKoVQWn5
	9grtcVr1Hk6HJAjRxrN+pXYPr3koVp//7M+PaFaO89h9Vs7Y3HCsle8CdCNSXy+1A1UgtXsrsKW
	pYqk12y06HivGFTR9NK0RgR+bu4+nOPuHOJIBsPSz359/7vdCh/makIOT9byNphnhcbtlr/Mw7N
	TQ9cPRRDk5vTJcEcn+2xgonp1exnXeAGfnUOtssVJhgBZtBk/mZZ5znkZLgmbDgJaeN7zLlskkl
	Ti3g/OS+OwsWdujqWT0ffTKdyp5kzeJzqia5SqjrMkqt5E9x7FE08PLLYcLwHOPeyEE0JR/qYe1
	2oDLTmBinnj29VbiKmFoFjCPMC0ppfi8ecKpFWGMKhut5z0PouqwXNOil4cuvt5N2vRt1d4jJWG
	Lu1kEYawaLE7+JpoXNg0D42GkVbfYJDR7FZPQGr
X-Received: by 2002:a05:6830:4884:b0:81a:9522:f00f with SMTP id 46e09a7af769-82acee9056bmr2732551a34.6.1791382606170;
        Wed, 07 Oct 2026 07:16:46 -0700 (PDT)
Received: from MacBookPro.taile6ac9b.ts.net ([123.113.35.89])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adc3f6d5asm2899704a34.12.2026.10.07.07.16.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 07:16:45 -0700 (PDT)
From: kai zhang <zhangkai.cool@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI/P2PDMA: Add Intel 0x6f00 host bridge to the whitelist
Date: Wed,  7 Oct 2026 22:15:58 +0800
Message-ID: <20261007141558.59852-1-zhangkai.cool@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For P2P paths routed through a host bridge, the P2PDMA core consults a
whitelist of known-good hardware. Add Intel 8086:6f00 with
REQ_SAME_HOST_BRIDGE so the entry permits peers only below the same host
bridge.

The bridge was tested on a single-socket Intel Xeon E5-2697A v4 system
with two PCIe GPUs below different Root Ports of the same host bridge.
Without the whitelist entry, peer access was rejected before a transfer
was issued. With the entry, 64 MiB peer transfers completed in both
directions with data integrity verified while the IOMMU used translated
mode.

Assisted-by: LLM
Signed-off-by: kai zhang <zhangkai.cool@gmail.com>
---
 drivers/pci/p2pdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
index 9334eb314663..84413920e39b 100644
--- a/drivers/pci/p2pdma.c
+++ b/drivers/pci/p2pdma.c
@@ -542,6 +542,7 @@ static const struct pci_p2pdma_whitelist_entry {
 	/* Intel Xeon E5/Core i7 */
 	{PCI_VENDOR_ID_INTEL,	0x3c00, REQ_SAME_HOST_BRIDGE},
 	{PCI_VENDOR_ID_INTEL,	0x3c01, REQ_SAME_HOST_BRIDGE},
+	{PCI_VENDOR_ID_INTEL,	0x6f00, REQ_SAME_HOST_BRIDGE},
 	/* Intel Xeon E7 v3/Xeon E5 v3/Core i7 */
 	{PCI_VENDOR_ID_INTEL,	0x2f00, REQ_SAME_HOST_BRIDGE},
 	{PCI_VENDOR_ID_INTEL,	0x2f01, REQ_SAME_HOST_BRIDGE},
-- 
2.54.0 (Apple Git-157)


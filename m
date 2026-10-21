Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577745;
	b=EerJeSp4DlmQO2J4bhnAvpyZCcQYXYSKQEiS4mAFlZM3f83T7Z+B/zirvKj9K3SZoYK/
	 gQwD8AybfMQ3H5A8QypA3tk8sCpAYK/1EVf2xbtAv6r90cr4QnbMYqqrzyTRXgq/vTLJG
	 JcamyVHKby0RfwNibPyUxCBfYcNO1ewFG6xPDc8TLj7JfJOWKkC97WoEIeEAgO0sjn/vx
	 SY7g7c+7nCu6A9I+W36rE4WXqs4rCIyDP2mN+bhs/8zRA4BqwE1McBShzlUYvMqbLHkc2
	 cRsfoGvAceoG3YMWNzfEK8wvWkHqLniBdjdIPnTd4BVYcmhQaMOLrECgHT1WSJ7YuVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577745;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qID+dEtKjHnTB7zRrjAZ+x1ovn7794ILO31jRDajG3g=;
	b=WCtjmPTUInfHP1Rj61PVTlfXbPhge2A6Uc9mPWlOWxtWQq+fSS/LUTyLwwFYZtJTvJOP
	 yze0uGrx63LZ1eAybAzKPPCk7xLd6JkM8rq9QGsH4YYq5Vdt4yeS4I0frcaknVAL36ZpA
	 FhQQWiR3CG06W0UU6uJhibTPKLyClWVYQ+2+Si5H0Ww/Yb1Uqm9gQORmdqyzkIQahhTBu
	 0pxA/PR+Tu4gv5qoC3WGq0Qc4bP7n8BdXVSx5HBR60MxxuQuafsxG/vK5sOd8xDJ+a82+
	 pI/5QixgTLnOjrdPeAEUBFSv5EIcDn9g3ro1tX5uiudzhYyv7l5RfBkoJuFTMG9IRmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=MzoRXlTX;
	arc=none smtp.remote-ip=91.218.175.172
Received: from mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5B1606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B5B1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=MzoRXlTX
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gsCMZZdvoKKiSu7dqO9JkNt1TMT38UkvVw1xwlAFKHE=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792577742; v=1; x=1793182542;
 b=MzoRXlTXc+JAtToIuPIerhcflb10/HaSykfPkyk9peAW+RP8wlgKsKIHjPMmynjgBKnzgFC9
 jp2IBpB2CbkGAKg+MEnPw4kXJyQY2aQaqHFgTix9HznEDdBq3Zh4/RFks6Ue/mIipL4qYZ4TpQU
 FpjjVtToQ3hFu5COTGPm30qRwdaJI7OftEDPaqFNDJBcAJ+GY5K315TPi/t8cAg14Ruf+bwRr54
 xTB2h0fi/4PspJ65z4lxfxAFyYkircfCMmMUNUT7xRNgeZQIzE/4phVfXsVgELWE5G7+ZP7IE1J
 7zX2PrTFxEfv+XnqKhvDRSDqcV6psfzxUPOqfxqHmSisw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6805060a84a1d670;
	Wed, 21 Oct 2026 10:15:38 +0000
X-Mizu-Trace-ID: 6805060a84a1d670
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] PCI: dw-rockchip: Remove redundant dev_err()
Date: Wed, 21 Oct 2026 12:14:57 +0200
Message-ID: <20261021101533.609118-1-diederik@cknow-tech.com>
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

The devm_request_threaded_irq() function already automatically logs
detailed error messages on failure since commit
55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
So remove the now-redundant driver-specific dev_err() calls.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 14976861f8ef..a4dbfc52c2f1 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -718,10 +718,8 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					rockchip_pcie_rc_sys_irq_thread,
 					IRQF_ONESHOT, "pcie-sys-rc", rockchip);
-	if (ret) {
-		dev_err(dev, "failed to request PCIe sys IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	/* LTSSM enable control mode */
 	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
@@ -764,10 +762,8 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					rockchip_pcie_ep_sys_irq_thread,
 					IRQF_ONESHOT, "pcie-sys-ep", rockchip);
-	if (ret) {
-		dev_err(dev, "failed to request PCIe sys IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	/*
 	 * LTSSM enable control mode, and automatically delay link training on
-- 
2.55.0


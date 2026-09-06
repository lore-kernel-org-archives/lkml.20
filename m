Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506DC4CCDD5;
	Sun,  6 Sep 2026 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788703305; cv=none; b=gfz0Y8gFtq/4I3v6kmmOPYuFSzFtBDO2UnwtAkIzGfJ/xQ+ws+8z8MjGXP1h2WOKiE+FEtYryGjJaKSTWo4GOLgpA7G7raktSKbTxqO1G94r6i+4JaFQz9oQHYe1nlQ/A+UUAzsxDc0QDsmjS5ekvaXXbCIOQTAUNJLJgVEggAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788703305; c=relaxed/simple;
	bh=CStm/eOenuXKikwRef4mrw0P4fo3a5vEDok4EsjfkfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gB56qy+X/tcUw6omKpX4hqGv+Ox1ooSDQPJ0XanDe63K4flsniyTZTdP0enaCY9azau9BsFNLfxDUYjhwgvL5ebQttVXG8J8IQXviJWxCRCtUDP90KSh3VHbiTc/rQAchALua1fuVSnCcT7qSC/anxxv2a1ugujW3TrhiWmDeTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PqNw0frT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qHh2Mw7p; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PqNw0frT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qHh2Mw7p"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hdBhN5v56zKmwc;
	Sun, 06 Sep 2026 16:01:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788703300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ICN4i+YAw1SWFOpfAEPgSU1+cpG9eLVnsY3ytgN9CGc=;
	b=PqNw0frTdjTlZv8Ya7YmEpyzCsaGEP4rKWHy3UyEUWbtjRTGGm9+YeRHIKsSVVQP2921nm
	GZTapO1CeSbuvAc5wQuVgMDHwub8Nvtg5u/VktK8bidn74+whB6w+7VQuEGGMDKhBP88Qm
	18BlMmrmdgYM5dJNs8IsjAVmK9d0eZqSMjkGlK61uF7XuwhFEk3CQafLEuKxS+OP8Jx3t9
	iqBe5h30RnYO8RE+9GjdXv3qKDN63mwv/JxYDTxH9SSzFFKnvzY7gIlP5Jh9wiGVkNV3TY
	yLy4VjbUi7Tq57nr7Z5jZYLjAUw4sUqce6K+qO1KL9qkbHlEX1PNRg4I+7iZaQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qHh2Mw7p;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788703299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ICN4i+YAw1SWFOpfAEPgSU1+cpG9eLVnsY3ytgN9CGc=;
	b=qHh2Mw7pAZ0BzM9YMD+KGhCYjUBAOJCKcLqSILq3z7xLJFlBdXyEybKPJg5CuBKr9o1xsR
	GR6U9MWVqUV7vOpGtn8LxeHIjBFfMRjjIL9y6NIqvJT9XeeFCyUafsYUpt60wFSZc4bHNA
	3qPDWeaE00ZDR9jZuePHuda1kWJgsW+amJqaxuYilH+uLWHeRwWNHYgynHp/a+wCedM2XW
	JFAXkr1GyLFdedM7P3y7b0Xm1Orjgi6a0Sxj1/ZhietRj98jC6BfvGU90FVDC1M6LNe1FV
	2ogLOdYFLUq45XY7I+/UI0GX1w3nkq48WdxY9g5joHY9jrdShpExtK3NNKeMFw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update PCIe node
Date: Sun,  6 Sep 2026 16:00:48 +0200
Message-ID: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 65ac7hzpkta6m6ojpbwtnby1w5q7rjtk
X-MBO-RS-ID: 1f97d613af167f4373d
X-Rspamd-Queue-Id: 4hdBhN5v56zKmwc

This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
and add msi-map into PCIe controller node.

The GIC ITS does have master interface to issue transactions to RAM.
The interface does support cacheable transactions, however, it does
not support shareable attribute, because the AXI port signals are tied
to inactive in this implementation. Therefore, add "dma-noncoherent"
DT property into the GIC ITS subnode.

The GIC redistributor does not have cacheable/shareable, therefore
add "dma-noncoherent" DT property into the GIC node.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 24 ++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index c66fb22d72aa8..5f9223a0f4468 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
 			resets = <&cpg 624>, <&cpg 1121>;
 			reset-names = "pwr", "core";
 			max-link-speed = <4>;
+			msi-parent = <&its 0>;
+			msi-map = <0x0 &its 0x0 0x10000>;
 			num-lanes = <2>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -701,10 +703,10 @@ pciec0: pcie@e65d0000 {
 			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &gic 0 0 GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
 			snps,enable-cdm-check;
 			status = "disabled";
 		};
@@ -1852,11 +1854,23 @@ ipmmu_mm: iommu@eefc0000 {
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-			#address-cells = <0>;
+			#address-cells = <2>;
+			#size-cells = <2>;
 			interrupt-controller;
 			reg = <0x0 0xf1000000 0 0x20000>,
 			      <0x0 0xf1060000 0 0x110000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			dma-noncoherent;
+
+			ranges = <0x0 0x0 0x0 0xf1000000 0x0 0x200000>;
+
+			its: msi-controller@40000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x0 0x40000 0x0 0x20000>;
+				dma-noncoherent;
+				msi-controller;
+				#msi-cells = <1>;
+			};
 		};
 
 		csi40: csi2@fe500000 {
-- 
2.53.0


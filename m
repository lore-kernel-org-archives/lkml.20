Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9273D3A5422;
	Mon, 31 Aug 2026 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151556; cv=none; b=F4ZSBTGivQaEK8TFiIMFIxtMYcm2ca2QnI6jKf4LKvvmE1OEvKa6EJBaTfkYFRtjxnR54OGxjH0ByoXr9A3cwr2oveOvnr+r+9umSL6KsCtM3Lo7h33gofgA9ommUoBSdhquLnxQ5m73FvFENkpdwqlcPWMF4gyx1wuliNRp5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151556; c=relaxed/simple;
	bh=8hsM7uEsdW9wHrV81u1kOderp6KDML/E1j9rjZQUchk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ox7+iKxULGNvmDh/rHXsS+tlyPj6z60m69kopW/qCqvjVMOhZiMHPyP4J3BC0cOb67oYjSt49w2f1ZsGdyXP3cihS1z3Yt3ERX2UienZqlsk1+v3+mt1t60dcXjpCV0dDsfjsmrjYUykJrQCgfS45+DxTs9ebKSaJNMeglQs6fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=gzdNhHYY; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="gzdNhHYY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=nPsllQ14yICJboie4pbgD9p7PzTM/mzFbU+8jrVYCwU=; b=gzdNhHYYv9Qz2/EAIciMLxfzh7
	5ZDIjLV4v+qqwJFt/lAv07CAplPIx4MKauOFw9l1yJ6LJmsb90ZbhL2mFE5NdpCi4gq7+O2GKvrVI
	2yezOYshcv6obWqrXfEI8pMWltbTF06DqcVD0c5MfHw+uJAbY4I8RQeZAaePQ+5m9c0+u5m9OAIYc
	ifrPSJR3+oKKigObMTEBaG6UDglY+w0QRxsBl0DiAWaMLiZGRE4re4JeyJ4MU9no9hGI1mJ9i69I+
	NRtIjMOJkF23ZJeBNrX/nFw0ys4tAxFUaAqsQclVFOTdbll2djh6lVCG7Fc9exaZQQCPNI9qCI/3C
	ZFji2DtQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0tu3-0000000Ape4-0cLQ;
	Mon, 31 Aug 2026 06:45:51 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v3 2/5] riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX board
Date: Mon, 31 Aug 2026 06:44:22 +0200
Message-ID: <20260831044540.3304350-3-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044540.3304350-1-aurelien@aurel32.net>
References: <20260831044540.3304350-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K3 has 4 USB3 controllers labelled A to D.

On the K3 Pico-ITX board, the controllers B and C are used in USB2 mode
only respectively for the M.2 B-Key slot and for the RTL8852BE Bluetooth
controller.

Add the two controller nodes. On the K3 Pico-ITX board, enable the
controllers nodes and add the two corresponding USB2 PHY nodes.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 22 +++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 60 ++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 0a6f669d509a9..5aa6fa89cab58 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -323,6 +323,28 @@ &usb2_phy {
 	status = "okay";
 };
 
+&usb3b {
+	phys = <&usb3b_u2phy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
+&usb3c {
+	phys = <&usb3c_u2phy>;
+	phy-names = "usb2-phy";
+	maximum-speed = "high-speed";
+	status = "okay";
+};
+
+&usb3c_u2phy {
+	status = "okay";
+};
+
 &usb3d_u2phy {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 6f8d55eae6f6b..55b00c0f429f7 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -441,6 +441,66 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb3b: usb@81400000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81400000 0x0 0x10000>;
+			interrupts = <125 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTB_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_B_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_B_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_B_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3b_u2phy: phy@81500000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81500000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTB_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usb3c: usb@81700000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81700000 0x0 0x10000>;
+			interrupts = <148 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTC_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_C_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_C_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_C_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3c_u2phy: phy@81800000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81800000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTC_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		usb3d: usb@81a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0x81a00000 0x0 0x10000>;
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353263;
	b=5Iy411fvg28y3v4VpsQG7Zcv1lDYyVFG8LN4qN8X72116GBA7fRV5BdbK1ebYShq273b
	 Z/eVKCNN4czVNaBOMv2VGjOHomd3O0GT7m8PS/e3KS8HKJbit7OSHUvOG3DLe4Bc7VcB2
	 aJ5OHks1f0k/Y8SmMIGeHifbjdPL1gbOQOInMES+6oeHhyDJ0GELtkxh6HwND+psp+rll
	 sm4FHXzyNABbXcSkRXx3mqKZQlXGgy76EEXEsuvHm7K3OAgRZrIsnls1pEjnVaQ+Wr13s
	 aHRac81BquLYbKngVgzUoVOGwe/gEctANg4BCqxYHaACECHlP3NObKwpIBGPeGnI5/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353263;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=NIxqMKyYG+I1FTMitPEEM3EWEjjxuEu8hI5Iv15e8d8=;
	b=inyOTA5RG1D4UnrHDr7t6wwXrjZelF55K15FTNFpCPmtXsZg8wXYA74ifzT+r5oq8baT
	 9POccmWJHzvxlSjLFmOvs82XqAp8LEgdCQI1+cb4sa+qyyAfc59CkzrbMp5dIDXJuXNyO
	 lzHhokMEwGlxSPtRRkp35gkhUs3v6NW3XmWbrmPG9bWYIN9zr0AhkeNWPRA+BXf/8y7Bh
	 VjKu3WqpLJ301t/obSYMVZEmXEvSgpcHZwPIrK+IVuFUgNdf0QtjHRNblZVhU2ROWlQSV
	 gIZYC+ayh6WTPAUT8mc9SMEZiLI6VIYbmE2ZoXzreLUIzgrGgDsSH15QQdiQu5N6BEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=UwGhhSuR;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B56A606A323;
	Fri, 30 Oct 2026 09:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B56A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=UwGhhSuR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793353241;
	bh=NIxqMKyYG+I1FTMitPEEM3EWEjjxuEu8hI5Iv15e8d8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=UwGhhSuRqDTwZXbV5RreA8uFwVKQfqwJy0uhUiRoAAkOFKv//TJ45xb8kZmWVqHEo
	 /Qyf2SPk24SFABLB7VlBpCEgE1qVAFOB00HsHhHLTPdv7H4MmYZ2m45R4ky5G1BPXH
	 WrSLWnecuJ7l9s4kOAvh8j+H8WdTf270P9WFHS/E=
X-QQ-mid: esmtpsz17t1793353237t9232972f
X-QQ-Originating-IP: 5U1DF8ULzeZro/FTuuUh22awM6fJteIZcTjwwHXA5Jg=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Oct 2026 17:40:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4904317109447055735
EX-QQ-RecipientCnt: 14
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
Date: Fri, 30 Oct 2026 17:40:24 +0800
Message-Id: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MM3MbTCua2rwwBkGzFFh+EGainYjDztOrp6+r97NdurKuRpADffVWP29
	QLcoTxkAOeeL9WUcpI5poJvgQ+efjshxoflK8IwKeQ/hLM9Li3WrCpHv5hM7gML6vSxM1Fo
	eHloIyDcVYawhNV8QajRDi0x5r0ofeQbQOcI/u70/EEMhq/dFP6n+gdECgE/MJH0V7Z5pnn
	mjiS2N89MECl6i6oG/S3mXPIKQotcJUn58jpbqCl+NrmZN/8TcMmvX2lR247BaC9usTAYS7
	sN1XXeX4nPMDW0yy5fCHCdLmBLyDUFsqiDar2AuhovtrVD3jOhMOb2YdGMRTr4AB3BxJjIo
	ZvHei5/qcq3qiUAFK//0J0zhGP1VmI14LWKG7UTpu9sxtj9gt7ciYdcoNAEFeVQroZvMZbc
	aXASbWjN1cv+1IoxnTfNEG6Uzs7MSBad0I2De1oYL+t8Z6meYtFXiFsczvH+2EZKKVQQnnj
	b7/DHV1tqs4iv6gabdSCTRaMVBvuAksaJUYIvw4RzmMELDjMT1ksJXFqIo3tcrQHPh2aTtH
	I83O4Yvid0sfaEa7faFSZLON0ShuWng8SHphdOO0ZK3KBfXXkuoBuqHNXfay+Bbcrv2lRYR
	JlhMtTtzXwiamXlx6n5SAST+L01OAP96zi60/oWKS8kNqyT0kDKqpPbpoqaDcX44PovQIzA
	iw052JeSBw/60AgWCQaeUwYJlZkUUyYdwrC3SHC4ZjuaMs4dkSbrtPghObZ1usvMmWrBgbZ
	p0j0aB3p5WBJU4gq/xKmDGWa60m2QBIWXQCkmrCQZtAWmzsCK9maR6JwEnmdJU0aJN3sV8v
	usmRu1+hoJL59niasIYqSfMktPIEY6fWqeKYASsYap0+WfkGXNS+4qNw3XC3pFJngp9/atZ
	CNlaYj+Ce+Y5bYqG0yaj2BNHa5tje8+5S2amSUbkjFhkzVLmKiWdN5hY1B/PI4bg1GOc9Tk
	qh62oJBtmHob9+aFkZEKu0hboucJBCsTx+fyH6qh+kmOVuxzIE06Ul113w6EcU3bqoWgzIr
	d1wxpz8rSXZwPOZLMR0zWtEPDLVkDIm+de1RGSyX3it2EQd6cZebxs7aSwpJA1CrxwCcV5Q
	j6QMT9rXZhrY6IgdbbaY2k3h14USIjx862aVtlyMo+C4WbakyhyJJO/piBM61Gf0MtbB7UC
	XGnE
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
of the K3 SoC.

Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
yet, so the port runs at high-speed (maximum-speed = "high-speed").

Enable USB3 port A with dr_mode = "peripheral", so it can be used as
a USB device.

Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  9 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 30 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b084a35aa00e..74d4fdf9e405 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -323,6 +323,15 @@ &usb2_phy {
 	status = "okay";
 };
 
+&usb3a_u2phy {
+	status = "okay";
+};
+
+&usb3a {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
 &usb3d_u2phy {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..220dfe29bb78 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -630,6 +630,36 @@ gmac2_axi_setup: stmmac-axi-config {
 			};
 		};
 
+		usb3a: usb@cad00000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0xcad00000 0x0 0x10000>;
+			interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_A_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_A_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_A_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phys = <&usb3a_u2phy>;
+			phy-names = "usb2-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			maximum-speed = "high-speed";
+			status = "disabled";
+		};
+
+		usb3a_u2phy: phy@cad20000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0xcad20000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		pdma: dma-controller@d4000000 {
 			compatible = "spacemit,k3-pdma";
 			reg = <0x0 0xd4000000 0x0 0x4000>;
-- 
2.34.1


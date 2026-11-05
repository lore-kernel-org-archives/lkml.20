Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867390;
	b=IxXw+rtra8uKyaN7e1zGfnBUZfGXXxR1ipW+UgwV77C4T2SWlZe2Zqf8DNRsfW2wqVDr
	 E2VMdv6WXUo2fNjfRJTqf3nzH5smgegTdB9Zdzg9V1Tj3h4Hu9g9DjZt9hEaS3vchWSqV
	 kAebIFxLT3gZElWffNOoZ5FDfNDYZ2201BYbEpaLqDfar4YkAJjmVYP9vT+GcJHZXKr5X
	 NgKB09JHKdSi8UBDskq2sXXhiPOdlR6NgZnoDsqQiWyW4QL4pn/BrLXk1vaL/6bcY8RkF
	 d9ox9udpCMrYWaq4rIgRGr+cTjplBdzP68uYEslVQLI605Rin8+fLRXyvO2cdhlYX5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867390;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=HpKrwB9rCAuUJd/mdqKwOdrJ24+UX+4D0BCjQpCzHeo=;
	b=3m9dqe+iCvViDimgYwXflRBY7xsE9sdP9wQjQfdb+EZs9N70PfYp7lVQi2v8LEj3bwmb
	 IsBN6XA9KfBuInCtFNKrgxarImgBQtqg5a5k40vk5UavwO5Dheq7F4BObrIN7/EBeP1jK
	 P8kLv9ty1HhlGVapQaBotLL6k28s+qH52FDM2vXeiqlLf/HceIJL3sQP7d5+X6aGTjlJa
	 kibiZKinsxik6iWqneWMqW2u4IdyJIIv498o3QoehPsrbvP+8ywkoaFNSsvmBRMrtGlsk
	 5D5w1Lu3IJcaW/jG4FGPLczAMF4L7Os1S2vUMbElY3/nsL0YMVmYTgYh4QJA6HSc9zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=udCHJPIs;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF844606A328;
	Thu,  5 Nov 2026 08:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF844606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=udCHJPIs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867379;
	bh=HpKrwB9rCAuUJd/mdqKwOdrJ24+UX+4D0BCjQpCzHeo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=udCHJPIsC22Tg5EdmmU+meBVc0Xa++gl5/5CBS3nHGf7CH7bMx/MFDuUvPEiNkZJS
	 a2fjRC0jXOmjVo6GzAjj4s57S5khqLG12XSa+KVZcgGa24X1CphtyWj2BCzPq6OTpj
	 XoJ2DPgnBb1T1alVrfucMuvHj9aKuJH9Prm9o2yw=
X-QQ-mid: zesmtpgz1t1793867378t0c8c3d9b
X-QQ-Originating-IP: RX1adP727/U1jyvgtCrXrR1MW19ffD4TGAPRM99bsf4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:29:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11866058336167670261
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:29:27 +0000
Subject: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
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
Message-Id: <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
In-Reply-To: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2339;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=+Ys6xDTlkWYC2lhqTf399k5bJBFMMlgJMp/BntR0DlM=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlv7NI+1jZsPftm1WLPg/Ehq+5emG48dXe9g/68B8yBG
 ecVo4RdOkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACaSuInhv2t1wtyq6A8OK6ee
 te2851NZ9i/zybXUplcrn7WrL57H18/IcJD3gOT7t32NK/Zq3tdZ5fSGr+iBfIB5540S/9ZlUmJ
 ODAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mdg51hMop9NqkkY6Pqxoow2q1Z8DZP6QSzVg9cA4vaItFB0DzC6H/E22
	PwoLZAry9d0PeIGhovwG3dVb04OGyJyW3+kYxHbBJsTSxA4TMtICPMNeku2jk5DGn9uOQEh
	Ac5vpj9y+O1QFi6bNmaLk97KHkqqHKhPl1ztcAfG141A6tJm+IFnXPaxCchfE0HCW9IpoJY
	SI+AQU+aKg/Omk3ZJFB6vS5i8zlVZ7WLLhPSjQGqAEQpxXClHq68N+bese0u4rOYQ3P9P3s
	RuzlNdyS3qS0TMUTubjlG09xe/L7slrQJZwHpAkPQ5Zng62OumjCEItSDVl2pcZFl9lSN1h
	5LdKDHSJSuNp2undHnALEhUvH8YLGpnkCfiFWu6bg3P84nRu/pXuE8CoU8izCaU38yIFmi5
	VzGJqGO6VSpEJWY1bom0e2teU9h2FWcYEvCMWFxyjzIk8HVA2zSVjjPekJP+ZE/vVeLQC6C
	mxPwEDGGJbC/LvguX6+EfEj6whz0Sm8lSTFv9MPiEjSe9seFS19qqsgL8Mj668skiJMXEBb
	z2nv1+IRo43LdP8SvTnjQoiQSVjGGg9c0LUvvDudP+V2/6vk7x3C2Cr/dXtdcsfP/P/m4/s
	orZuaNr90Qxub68vlIlXD1TK/5TCDslZ/fdDWESvojVJjpvXo15oCxCy07vgL40490Oc9RC
	PS+Y/1swbdng2ym5hvSf7j4ugImFGXYoTLtv0KCSnUwYwnXDeHnG8cuKcODwcboTstYeI6d
	4+5MCjJ/1afIzqv/7DdWy/8IWsKMvrw26ZVTwg1P7ablxBR1I+54fnm19Xedp5GRtmQVUKT
	H6PuqmNHpUflUv6y8KPy38n+FepeHXj0EyhrO4iAymp87Jz4Y7LfnkGfcc+ZGu9r1uSX6D/
	Twnbv6CG49EoanxeBrxIWaN48pllxOLwCEXmGifSZSvNFedm3F6xwqknN5xi8RmalVX6Mjc
	xkd+kDPYnKcmx/T9H6y23s1lnewTBDpBHF29s3dqbrN+Hl9cQOdZDy9xzvWA++DPHldTqz+
	wBOJk15RNzjGVzZvLATyy+tDdLFSdAORBquvWGFiSDIbPXqnMSOJCzd72ygfgd0rAHv3uxs
	v+bL6YW+N8dkPzNmFoEYjNXd5zx8O6MYQ5fR0Fp5FJjPw4flzOVeQ07sVgSbRVS5e+28lRK
	OvMQ0tmC9HC5ZZuJD0ohR4M6iqlc1rN+19mpCWihdccwm70=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Add a device tree for the K3 CoM260 IFX TQ board. It reuses the CoM260
module description for the UART console, Ethernet, module EEPROM and
PMIC.

Describe the carrier's green and yellow Ethernet PHY LEDs while keeping
their existing hardware state. Enable ALDPS power saving on the
RTL8211F PHY and disable its unused CLKOUT output.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/Makefile             |  1 +
 arch/riscv/boot/dts/spacemit/k3-com260-ifx-tq.dts | 44 +++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 851b701e5da4..fe664f84e1dd 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -6,5 +6,6 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx-tq.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx-tq.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx-tq.dts
new file mode 100644
index 000000000000..6d9b2dbd825d
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx-tq.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd */
+
+#include <dt-bindings/leds/common.h>
+
+#include "k3-com260.dtsi"
+
+/ {
+	model = "SpacemiT K3 CoM260 IFX TQ";
+	compatible = "spacemit,k3-com260-ifx-tq", "spacemit,k3-com260", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &eth1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&phy1 {
+	realtek,aldps-enable;
+	realtek,clkout-disable;
+
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			function = LED_FUNCTION_LAN;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "keep";
+		};
+
+		led@2 {
+			reg = <2>;
+			function = LED_FUNCTION_LAN;
+			color = <LED_COLOR_ID_YELLOW>;
+			default-state = "keep";
+		};
+	};
+};

-- 
2.56.0



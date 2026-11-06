Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962047;
	b=w/b/Ozkz1CIBUeGzi/QdfmlvJIQNghuIFY6He3aG8h/u5+P0PvliMdlacQnNgVhi4Ayv
	 GgPKwttV1Ya5hDavu6o3MP18mRnPJSJllSlKzRSwtgsmUbY2gYazSMBTHJ9RNDvsyR3TS
	 ouqDNjKrRz9GY5mHbapGhLBBwkczmgLcxmjfPiWC94hbsI9QU57eimYEIFQlhrxzMx7ze
	 WTCLKWxXI8/iqZTIiaqp/mlx+M3m8jCkGOVkMj9d5KcEUmhmJ0fub5U7yP3cMVABdm7uv
	 pKDn+DbUIGHv45+aWkO83p2QIziYkTJfpPOzb3CtfbjC5cyMAv2H8Hl6quo548tIndg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962047;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=pPs+LFjQd4/vwzx0cx5k8n7Xns8+xDNlOq6HRQ/nnB8=;
	b=oPUqDUOjs//qAQt7JfLJPv+D85b0+22RnO6m/563QopdWY6H40b5FgcT5yBJKQCgR5UM
	 +YOkke2tzXHbTgEp/fLYCziFvBP7zlqTm2hnfCnWDbJVbal1QfocxGMQ4mIbfoc96ZsIO
	 wAjY3sd9RxQFUj+0Vrx2kRmO7xh9NOgY5tZFH76MVGKAe9Rh3egP3sBfPEmYvebuB7m9B
	 +GS1mgXV2JybRHIXsj5NvpJzr2CNL5YJKeSAkf17mTboZIDXYqjetDXM8TD6WrE5iitxP
	 qHsY4arsHTLw7Jwv5BhQbTJDP4lolz8VQVlF3WQ0huAubfdL3T0ATcGcbSoo0/UeMdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=WDiuIdwm;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9CD606EE9D;
	Fri,  6 Nov 2026 10:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D9CD606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=WDiuIdwm
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07O1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:13 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07O1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962034;
	bh=pPs+LFjQd4/vwzx0cx5k8n7Xns8+xDNlOq6HRQ/nnB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WDiuIdwm8UFous+4e6je7OsE/8ufj1XtOgyvdnUxhllJALqtuVpEksTgZHay5aGN2
	 OSUw31Y4Evz4a9e98UBjvLW2OBd38tJ2O2r6cA+qKRwc50nhkulAKp0Gczk+44weBF
	 7rfLXx9GIzn+uaIW0S+fA31LeNfKiUyl4zfxnncc=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 09/10] arm64: dts: amlogic: meson-s4: add the AO CEC controller
Date: Fri,  6 Nov 2026 11:46:58 +0100
Message-ID: <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Add the AO_CEC_A controller and its pin group.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 155997649dc3..dd51e786d29d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -747,6 +747,14 @@ mux {
 					};
 				};
 
+				ao_cec_a_pins: ao-cec-a {
+					mux {
+						groups = "ao_cec_a";
+						function = "ao_cec_a";
+						bias-disable;
+					};
+				};
+
 			};
 
 			gpio_intc: interrupt-controller@4080 {
@@ -970,6 +978,22 @@ sec_ao: ao-secure@10220 {
 				amlogic,has-chip-id;
 			};
 
+			cec_a: cec@44000 {
+				compatible = "amlogic,meson-gx-ao-cec";
+				reg = <0x0 0x44000 0x0 0x14>;
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_periphs CLKID_CECA_32K_CLKOUT>;
+				clock-names = "core";
+				assigned-clocks = <&clkc_periphs CLKID_CECA_32K_DIV>,
+						  <&clkc_periphs CLKID_CECA_32K_SEL_PRE>,
+						  <&clkc_periphs CLKID_CECA_32K_SEL>;
+				assigned-clock-parents = <0>,
+							 <&clkc_periphs CLKID_CECA_32K_DIV>,
+							 <&clkc_periphs CLKID_CECA_32K_SEL_PRE>;
+				assigned-clock-rates = <32768>, <0>, <0>;
+				status = "disabled";
+			};
+
 			ir: ir@84040 {
 				compatible = "amlogic,meson-s4-ir";
 				reg = <0x0 0x84040 0x0 0x30>;
-- 
2.56.0


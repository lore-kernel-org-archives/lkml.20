Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DE45013A9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775213; cv=none; b=ucsi0zBZoPLs1xmFdsrUbPgtS5l+YPHL3inkFsyjxop5hOuNGdi6ibnLABSbld9xFhpNHwsOXwbhM63U2Q8Fd0mzWrTZSPv5HTEaYNO/qB1FJ/NWvcb1SqVZsW+bc5VAHhBkSw9hiYv8rgAy88PWGC/xQ+E3GuY8Nz1gAW2iwpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775213; c=relaxed/simple;
	bh=D/htAC8v/62rB5znZryYdq7W/Xu80Fa0o3CHbbLXHwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V1cGBRl/kmzHStAG9pG9FcCJhgHiFdT1v4glNkzDTi+ybgR6pppVurgSN1vu6WcwTtPBKUCKAwb1hoDftT3yYvsAZhsjNx2n3Cpuy5s5hqgDh5HBu8lH4zoXNQC2HVCZ6ElggqGO2tXIlwjYif289/hlXXyfZMiB8lBw9pHYHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTXovslD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTXovslD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so4679371f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775195; x=1791379995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkCPrnhEVYlaEQro7j1pOyawJyARa0yk9RU25Es5naQ=;
        b=FTXovslDmQo4wqpCECOpjUlI6r0OC+C3FV60S8d6UzRa6zp2N/g2ha0Ht/o6wpbsG8
         pM7nbEyT3XU9vsQ4c5eEWFG/WaDUq8o9Mi6c+pUD/rhEv38RhhtZGWYRSFr7SvVL0ezI
         +2Jc/KJCFgIpYWwYL+0geham3dGuyjTouh/MpmMIAJnq9yfy8Zpp3zyaNQhgUH6KUCXv
         mLoqwCnTLzg+9cxJBvklEfLxMqiIz6hGIxlAUluT9n8lwrmQNrERR4+Esm9eEqKqFuG9
         AcYk7EVsZGqG78gwFPFcCzbr23U3P1O2P6vOVCUNOzNl/3G1hB3tTYoA3FNE77pJ3cMt
         vgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775195; x=1791379995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkCPrnhEVYlaEQro7j1pOyawJyARa0yk9RU25Es5naQ=;
        b=OCvN4OAEmLuIva+5Rk0YiWQ2ezbTXisctN0f6uXTARvVUOBHN/4L0IpTM5PwYnkLRs
         i59tkYY9VMCgmiRDk75Vz4DRr5oF8zDxG9RxLjuWkBhxcdE4TMv/TqYIv+NColqfC4bv
         vjK0ABxDvhyFzpRjJhDYnh7deLS1GYAuD0ghe0B2rn7QmrL5ArLcUzlcO/vex/pjLrz/
         cwGM5D7l32rRoYWb6FuALJmXUkUhhamFgbOf9155xRaXBaCfyi0nVI+tsMbTrrbCixAN
         iVgjQ+FA2WrvCTIS1qkpr4nb+1h35M/uvgRJ63bQ7m6yTPYcPACp8UdByQqEXTnPyhra
         txog==
X-Forwarded-Encrypted: i=1; AKwUvBwvK6TKPoRRSYTZhezCcsXbgN/zKmwBQk4pPNHOjDwr9y8sNgaC+DlCjM/HpYoKwMzsYeOJbZs9P1Wu3tA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJXK8+0CsIxbg+zs0Rr8AtqDf5rFQ3CqiKfNnZt0CELQRevWGs
	stBc6ya80YqUX/mTx/OYSJKUG0/O5EuVO8g4e7U+c8vkimNljmQRZYeV
X-Gm-Gg: AYBFou2PH2+CjUnuZnYL99agkCW2mHhuUIMtPYI05OHL987IENNc+lgSmUNipiPTSRA
	mf2X+YXIRxrHt1hM04+NvsiiHOv1oFAQfH6jKj0mxj75dvJP8dsAbsTm21XYmmOPEYPc9Z8fPEQ
	l2atna7fRgTYzmDMuspuPBZPuFfWqCl8yyR7nMog0GwIRe9avjjTuMaYFJ5zNenPxENoYSQJ/IN
	jj6oY3u7871KimTXWD3c3743J/J5sCWRjlvY56veDi0qFYvI9toA/eb9CKEf83esS1U/DidjAyz
	Zqmk7kSGf2mBllJKxwSvXQoxKMJPVGeVWkcVzuUHo+UnxdSm8auJWQ7nlFf0bVQY1kV5+mGn6vC
	6syy6eYmQNMWqRKxqwn0kzqvQWd3KumbI81gR6jeUW99QEPjpXAypQYb0T6Zw95iQe+S0ZinAmE
	jnKM9oqyHDegceHxZ4SXY1i6Hx6bzhv4LkTOX9QZ93Uc5JUKqXQRDHfgkdz8k5Wj8duOK8Ge+By
	jiwcDP/FKiariHnN1JxSK0=
X-Received: by 2002:a05:6000:2209:b0:487:27f9:835 with SMTP id ffacd0b85a97d-48b0254d69bmr2409622f8f.42.1790775194706;
        Wed, 30 Sep 2026 06:33:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:13 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 8/9] arm64: dts: renesas: Add DSI overlay for RZ/G3L SMARC EVK with ADV7535
Date: Wed, 30 Sep 2026 14:32:50 +0100
Message-ID: <20260930133257.23210-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a Device Tree overlay (r9a08g046l48-smarc-dsi-adv7535.dtso) for the
RZ/G3L (R9A08G046) SMARC EVK board to support DSI-to-HDMI output via the
Analog Devices ADV7535 HDMI transmitter.

The overlay enables the DSI controller with a 4-lane data path, the
display unit (DU/LCDC), HDMI audio and configures the ADV7535 on I2C2.

Update the Makefile to build the overlay as both a standalone .dtbo and
a composite .dtb (base DTB + overlay).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit description.
 * Updated license header.
 * Added HDMI audio support.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../r9a08g046l48-smarc-dsi-adv7535.dtso       | 138 ++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index c6f3718cd19f..b9dad3f44ac0 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -264,6 +264,9 @@ r9a08g045s33-smarc-pmod1-type-3a-dtbs := r9a08g045s33-smarc.dtb r9a08g045s33-sma
 dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtb
 
 dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtbo
+r9a08g046l48-smarc-dsi-adv7535-dtbs := r9a08g046l48-smarc.dtb r9a08g046l48-smarc-dsi-adv7535.dtbo
+dtb-$(CONFIG_ARCH_R9A08G046) += r9a08g046l48-smarc-dsi-adv7535.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
new file mode 100644
index 000000000000..1e1ebafe2439
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree overlay for the RZ/G3L SMARC EVK with ADV7535
+ * connected to DSI and LCDC enabled.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
+#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
+
+&{/} {
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
+	dsi-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			dsi_to_hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	sound-card {
+		compatible = "audio-graph-card";
+		label = "HDMI-Audio";
+		dais = <&i2s2_port>;
+	};
+};
+
+&dsi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_in>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>;
+
+		interrupts-extended = <&pinctrl RZG3L_GPIO(K, 3) IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		a2vdd-supply = <&reg_1p8v>;
+		v3p3-supply = <&reg_3p3v>;
+		v1p2-supply = <&reg_1p8v>;
+
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&dsi_to_hdmi_con_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				codec_endpoint: endpoint {
+					remote-endpoint = <&i2s2_cpu_endpoint>;
+				};
+			};
+		};
+	};
+};
+
+&pinctrl {
+	ssi2_pins: ssi2 {
+		pinmux = <RZG3L_PORT_PINMUX(7, 0, 9)>, /* SSIF2_RXD */
+			 <RZG3L_PORT_PINMUX(7, 1, 9)>, /* SSIF2_BCK */
+			 <RZG3L_PORT_PINMUX(7, 2, 9)>, /* SSIF2_RCK */
+			 <RZG3L_PORT_PINMUX(7, 3, 9)>; /* SSIF2_TXD */
+	};
+};
+
+&ssi2 {
+	clocks = <&cpg CPG_MOD R9A08G046_SSI2_PCLK2>,
+		 <&cpg CPG_MOD R9A08G046_SSI2_PCLK_SFR>,
+		 <&versa3 2>, <&versa3 3>;
+	pinctrl-0 = <&ssi2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	i2s2_port: port {
+		i2s2_cpu_endpoint: endpoint {
+			remote-endpoint = <&codec_endpoint>;
+			dai-format = "i2s";
+
+			bitclock-master = <&i2s2_cpu_endpoint>;
+			frame-master = <&i2s2_cpu_endpoint>;
+		};
+	};
+};
-- 
2.43.0


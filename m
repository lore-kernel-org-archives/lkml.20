Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285925;
	b=E6E/AVQzfihQmQT+Spkwq3qJr5p3oxGZzL9SNM8XYZ6qIwWPJEeundt4nqID/hJaQGAW
	 8aeYlFzYcSTT9RtRS4IaAz7YH7g0lf3IAgcfIqGdATyShYL2LqW7ab8BoxyLzFGxKxlVV
	 LIHjgFKgtoZOJOHtJUk2ALXvnNmiB50K5n0BlEWKE+qOIXlSRSFNMCeOUJvA62ZPj3fXl
	 GtrZVhEvOUh/trmGxaXGUPW+GKnsXXBRAlgQN1EPhvUvEussUnQXPiVLKM9YN7Qj59Lcl
	 zVOFQVW8kQZE6IKQokPAnUVvminLb88mpIDNW0vyoobk2+lPoKDEa+Uj4cC9GZk7Mwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xBKHxMWuIUOsCxcEpfrlnd6KOMRv79TZHTDBMeuiq9A=;
	b=VZQr9HSymPi4el9vmcxJkl3DspHTu8aORdHNapKTOZXnQ1ayIxlXrsj56i/LVIT5ZmnV
	 +joFRMEDmlQmMVDtFsdEmeNZqp8zNQzXFjdIawKWcsPK2dAhJIrLPuvW1frkwGevIB2AM
	 Gz1K6VTutMyKrZVUtd7oJnYuvz8CmX2/xIkeiq1whibTEAe8UDjSCHIK29p6Jg9Rt7eIO
	 yX/E37pHsE8m2uuK4pGqATYVhQCoIOEIbDZECZD6+uEpHT75nfW+FhRE3TthjgT6n3YXL
	 3QrrBRyDO9iFyq9WOrVp/sVw+UBMZ5LuMIt6cv9d396rYcew1b1I3FnJlQBnBxCffBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D4/LJEOR";
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C8360A2614
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C8360A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D4/LJEOR
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-539a57a0b1fso602383b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285923; x=1794890723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBKHxMWuIUOsCxcEpfrlnd6KOMRv79TZHTDBMeuiq9A=;
        b=D4/LJEORBG0XC5VDoKv4YKxH+dupiFvw1LwNlpxeLxRzPblU8yAllMmFyr+orwxyLs
         /pTBNcoIUKERC6zZZezXs4qLe9nbiUlCuvhaA16V/RyrBTMEQMcWvBWvzKunDGYuYEin
         lg1pmif5xBkv6S4ZjBwNUGegm/pFo8uyjBWhOgKY83d5lBTIBAntMzTFuKg/up1AdwQj
         9Knyzq3SkGfTchKYX4az9YPu5ebvzU2OxoSljYbecbgjzj2q055lawRmxNoi32XvD5xM
         XZr72pey+ypvjujjddDu7l7tIBsobgIhikrYssTMZzTPd5t13SNe2vcDKlbQgNEFuJN8
         k+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285923; x=1794890723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBKHxMWuIUOsCxcEpfrlnd6KOMRv79TZHTDBMeuiq9A=;
        b=SpTpy82iJ30rIrWhARJhaPis7i+wySnL8P/NkbeKw6IPRi5mNkKhMw7WiGuxg+jvu7
         8Vzvnhkqqdrw+H1d827CIwiyz53eMwiyz/iopQELOwcuNYrRqSOB7b7Sa+dgqZ7auM2G
         6f1ig2/tQPeoFUkwgCft6ePKvyA+DzMK/LEN9MGtDx/FzdfRiZmPaBzMLcqM+nPkleuG
         uxy+E3WaM9rTd09U2x0labeD72YuRU8N6vC0iNB5bqwqA5ohzLPM8lMxhW8EzIzQ2UzD
         pn1kIWoG6mOvAfOBVqwCSozeCyvl4UwPfPKtC7LNRtFwlp8iI643zGHaUG7nKnTHFbd2
         f6qA==
X-Forwarded-Encrypted: i=1; AL+hErHuNUWVBYK4FKAv119/uCBAXtxYKY/E/5cZ/vnf3Qqwa9zJHHYTzw4drPafDx7nkmlF2lN/SAirjHWj7Jw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wlVnmJdotGxRCgNvcyB91pXFjQk+yvMJfcjewn7sxbquNHFtC
	b4In4ffIkDsP3ukYEMtKb3rdtq7P+LYMWFIbNbkQl2dow5W4UOlCJ/17
X-Gm-Gg: AYBFou0+xIyK1r0O+MRi4Ctw7JfIY17kfwA0lazU+1wA9t5LzLcFQVZPUP+AMp4q1QW
	kqKYfug0zGXKfX3xaOXv1ImQdXLGjLDm8Mk+jnEUOvG4uIrUZtYzNlEZhTeEOwS3WytLYqWir0X
	r3/A3uOUF5oeiEmGC+wnfCmr9l4nQmhG8hkyANxjaOZ2ajf7CpIuyg7Sb0uB7YQ0yVgkvmMvnHb
	1VvBlYhXUJgBkPoRB31sWvv1XgYZILWPzj3jqo+6jv5H/rARachzX5JwKwGaPxpnr+WQHpcHQke
	+TLdzV5ydFmhfJPDmPcn5IbryDkPBM2ZNVqNPDVN8LjfgdiEjSpNEVrozebYbSM09oManOcDaWZ
	IvLY0fkrtLdX9H+yfb4qvhs4gLK7cYhfFPN9Ya4JVZZaLx/fshAKuuJ8CBsoTEG17Plq4W3eq1D
	lReQFrppZ5SUChCYbBqQQU/O1kAuL2neZ+BfwlRuTdrKo6IoYC3YpsLcEDVZzsZJBfPWrMpCWyS
	hy+87KlSWtx28psZI6LT2VyOGEJox0+uaDZV0x5ZX1OQQlJ23922uuRYRbfsh1lwkIuNJMkBvf4
	7FwF+EddmkugBBC7YC2TorWlMWwMoow6Dh9KLJWFctU3lJ7rbzBRv7T9FfwoIc639flD/ZEwXGm
	Jr5nEMw==
X-Received: by 2002:a05:6808:c211:b0:567:f784:f939 with SMTP id 5614622812f47-5683cb05bd9mr1218075b6e.51.1794285923185;
        Mon, 09 Nov 2026 20:45:23 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906330d56sm1201237b6e.15.2026.11.09.20.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:22 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v3 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Mon,  9 Nov 2026 23:45:20 -0500
Message-ID: <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
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

Provide the SoC description needed for the Cubie A7S console, PMIC and
microSD support. Describe the CPUs, PSCI, architectural timers, GIC,
RTC, main and always-on clock/reset and pin controllers. Include the
main and R-domain UART/I2C instances and MMC0-2 with their pin groups.

The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
and noncoherent attributes follow Andre Przywara's public A733
reference and the A523 precedent. The CPUX interconnect diagram in
section 5.1.2 supports noncoherency as an integration inference. The
ITS stays disabled pending its clock/reset and MSI integration.

The enabled console, R-I2C0/PMIC and MMC0 paths were exercised on a
Cubie A7S with vendor firmware in the November 4 RAM boot of DT v2.
EL2 interrupt delivery and ITS/MSI were not tested.

Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 601 ++++++++++++++++++
 1 file changed, 601 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
new file mode 100644
index 000000000000..d0b9f432e3ab
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -0,0 +1,601 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+
+#include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
+#include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
+#include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x200>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x300>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x400>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			compatible = "arm,cortex-a55";
+			device_type = "cpu";
+			reg = <0x500>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			compatible = "arm,cortex-a76";
+			device_type = "cpu";
+			reg = <0x600>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			compatible = "arm,cortex-a76";
+			device_type = "cpu";
+			reg = <0x700>;
+			enable-method = "psci";
+		};
+	};
+
+	osc: osc-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH>;
+		arm,no-tick-in-suspend;
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x0 0x40000000>;
+
+		pio: pinctrl@2000000 {
+			compatible = "allwinner,sun60i-a733-pinctrl";
+			reg = <0x02000000 0x800>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_APB1>, <&osc>, <&rtc CLK_OSC32K>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			mmc0_pins: mmc0-pins {
+				pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
+				function = "mmc0";
+				allwinner,pinmux = <2>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			mmc1_pins: mmc1-pins {
+				pins = "PG0", "PG1", "PG2", "PG3", "PG4", "PG5";
+				function = "mmc1";
+				allwinner,pinmux = <2>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			mmc2_pins: mmc2-pins {
+				pins = "PC5", "PC6", "PC8", "PC9", "PC10", "PC11",
+				       "PC13", "PC14", "PC15", "PC16";
+				function = "mmc2";
+				allwinner,pinmux = <3>;
+				drive-strength = <30>;
+				bias-pull-up;
+			};
+
+			uart0_pb_pins: uart0-pb-pins {
+				pins = "PB9", "PB10";
+				function = "uart0";
+				allwinner,pinmux = <2>;
+			};
+		};
+
+		ccu: clock-controller@2002000 {
+			compatible = "allwinner,sun60i-a733-ccu";
+			reg = <0x02002000 0x2000>;
+			clocks = <&osc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
+				 <&rtc CLK_OSC32K_FANOUT>;
+			clock-names = "hosc", "losc", "iosc", "losc-fanout";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		uart0: serial@2500000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02500000 0x400>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART0>;
+			resets = <&ccu RST_BUS_UART0>;
+			status = "disabled";
+		};
+
+		uart1: serial@2501000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02501000 0x400>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART1>;
+			resets = <&ccu RST_BUS_UART1>;
+			status = "disabled";
+		};
+
+		uart2: serial@2502000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02502000 0x400>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART2>;
+			resets = <&ccu RST_BUS_UART2>;
+			status = "disabled";
+		};
+
+		uart3: serial@2503000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02503000 0x400>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART3>;
+			resets = <&ccu RST_BUS_UART3>;
+			status = "disabled";
+		};
+
+		uart4: serial@2504000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02504000 0x400>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART4>;
+			resets = <&ccu RST_BUS_UART4>;
+			status = "disabled";
+		};
+
+		uart5: serial@2505000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02505000 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART5>;
+			resets = <&ccu RST_BUS_UART5>;
+			status = "disabled";
+		};
+
+		uart6: serial@2506000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x02506000 0x400>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART6>;
+			resets = <&ccu RST_BUS_UART6>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@2510000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02510000 0x400>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C0>;
+			resets = <&ccu RST_BUS_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@2511000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02511000 0x400>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C1>;
+			resets = <&ccu RST_BUS_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@2512000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02512000 0x400>;
+			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C2>;
+			resets = <&ccu RST_BUS_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@2513000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02513000 0x400>;
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C3>;
+			resets = <&ccu RST_BUS_I2C3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@2514000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02514000 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C4>;
+			resets = <&ccu RST_BUS_I2C4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@2515000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02515000 0x400>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C5>;
+			resets = <&ccu RST_BUS_I2C5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@2516000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02516000 0x400>;
+			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C6>;
+			resets = <&ccu RST_BUS_I2C6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@2517000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02517000 0x400>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C7>;
+			resets = <&ccu RST_BUS_I2C7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c8: i2c@2518000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02518000 0x400>;
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C8>;
+			resets = <&ccu RST_BUS_I2C8>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c9: i2c@2519000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x02519000 0x400>;
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C9>;
+			resets = <&ccu RST_BUS_I2C9>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c10: i2c@251a000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x0251a000 0x400>;
+			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C10>;
+			resets = <&ccu RST_BUS_I2C10>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c11: i2c@251b000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x0251b000 0x400>;
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C11>;
+			resets = <&ccu RST_BUS_I2C11>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c12: i2c@251c000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x0251c000 0x400>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C12>;
+			resets = <&ccu RST_BUS_I2C12>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@3400000 {
+			compatible = "arm,gic-v3";
+			reg = <0x03400000 0x10000>, <0x03460000 0x100000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			dma-noncoherent;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			its: msi-controller@3440000 {
+				compatible = "arm,gic-v3-its";
+				reg = <0x03440000 0x20000>;
+				msi-controller;
+				#msi-cells = <1>;
+				dma-noncoherent;
+				status = "disabled";
+			};
+		};
+
+		mmc0: mmc@4020000 {
+			compatible = "allwinner,sun60i-a733-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04020000 0x1000>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC0>;
+			reset-names = "ahb";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc0_pins>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		mmc1: mmc@4021000 {
+			compatible = "allwinner,sun60i-a733-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04021000 0x1000>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC1>;
+			reset-names = "ahb";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc1_pins>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		mmc2: mmc@4022000 {
+			compatible = "allwinner,sun60i-a733-mmc",
+				     "allwinner,sun20i-d1-mmc";
+			reg = <0x04022000 0x1000>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MMC2>, <&ccu CLK_MMC2>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC2>;
+			reset-names = "ahb";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc2_pins>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		r_ccu: clock-controller@7010000 {
+			compatible = "allwinner,sun60i-a733-r-ccu";
+			reg = <0x07010000 0x250>;
+			clocks = <&osc>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
+				 <&ccu CLK_SYS_24M>, <&ccu CLK_PLL_PERIPH0_200M>,
+				 <&ccu CLK_PLL_PERIPH0_300M>,
+				 <&ccu CLK_PLL_PERIPH1_300M>;
+			clock-names = "hosc", "losc", "iosc", "sys-24m",
+				      "pll-periph0-200m", "pll-periph0-300m",
+				      "pll-periph1-300m";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		nmi_intc: interrupt-controller@7010320 {
+			compatible = "allwinner,sun60i-a733-nmi",
+				     "allwinner,sun55i-a523-nmi";
+			reg = <0x07010320 0xc>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		r_pio: pinctrl@7025000 {
+			compatible = "allwinner,sun60i-a733-r-pinctrl";
+			reg = <0x07025000 0x800>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_R_APB0>, <&osc>, <&rtc CLK_OSC32K>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			r_i2c0_pl_pins: r-i2c0-pl-pins {
+				pins = "PL0", "PL1";
+				function = "r_i2c0";
+				allwinner,pinmux = <2>;
+			};
+		};
+
+		r_uart0: serial@7080000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x07080000 0x400>;
+			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&r_ccu CLK_BUS_R_UART0>;
+			resets = <&r_ccu RST_BUS_R_UART0>;
+			status = "disabled";
+		};
+
+		r_uart1: serial@7081000 {
+			compatible = "allwinner,sun60i-a733-uart",
+				     "snps,dw-apb-uart";
+			reg = <0x07081000 0x400>;
+			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&r_ccu CLK_BUS_R_UART1>;
+			resets = <&r_ccu RST_BUS_R_UART1>;
+			status = "disabled";
+		};
+
+		r_i2c0: i2c@7083000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x07083000 0x400>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_I2C0>;
+			resets = <&r_ccu RST_BUS_R_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		r_i2c1: i2c@7084000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x07084000 0x400>;
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_I2C1>;
+			resets = <&r_ccu RST_BUS_R_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		r_i2c2: i2c@7085000 {
+			compatible = "allwinner,sun60i-a733-i2c",
+				     "allwinner,sun8i-v536-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x07085000 0x400>;
+			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_I2C2>;
+			resets = <&r_ccu RST_BUS_R_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rtc: rtc@7090000 {
+			compatible = "allwinner,sun60i-a733-rtc",
+				     "allwinner,sun50i-r329-rtc";
+			reg = <0x07090000 0x400>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc>, <&r_ccu CLK_R_AHB>;
+			clock-names = "bus", "hosc", "ahb";
+			#clock-cells = <1>;
+		};
+	};
+};

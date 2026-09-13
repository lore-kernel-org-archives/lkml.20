Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAD3331EC0
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311429; cv=none; b=u/23FsyHFysGvqyefqjnLERQEeRhBYJCnVVi263+DKQBLFQhBIRC/uiVAH/vnXB2peBvuWuvBDZH3IBLN+dGf/rs70uSCuwuYiaLZZRW48FPUU64Jy/K3r4Uc39IDdYPAtiGcYQIYp38rDPDaOuTiyShL9TTm/hXgUzd6EKOchg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311429; c=relaxed/simple;
	bh=U8TcarFOSxPgPS3gl1vJEnVGMW4O7dlmLEDGi+5O5hE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ihjq+fUantCY4phcT1iQh/IGh7KbysvdrOeItyJVuHKCIr8xfwi4mT1CdmI5ZTCJJuR1OOH/QLrdS1mtershMqfsPGKXcGRZLspAYam7Y2ZqnHBR9oExmH12uDGgFp7BhMF8MATGF2I4mJNIBbikHigG18KhJP8fXS9uzpkJNWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEfLhEb1; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEfLhEb1"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so804995a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311426; x=1789916226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ojm3inVGHkUK0yBRj0L32h8BiK2OtTXiQ8B+T74NBtE=;
        b=AEfLhEb11jba8BEBJ0eQLfnmkrhwaXaKs8cRlDEmc0TbBYl+AJLg1C3zFB86Y2V37m
         UYH6SYLqsgUoDiDKFgKjL2bpEiZP/mRwBcZhdITc12HR/4BLCOz2rh66csm4fXwnhPym
         sZq30PdzbV9ll5m8F11HpFMVsRm7GcZolm7sizA1O2Wc2A1vH55m2/FXyhaMOTXzVWNO
         R/z/82MH4sgRPRyWgGtfF7wsPNXHkwbUpKIt0a+Ih3D6mfUwrb3WlAr8grUt0Rz1+II3
         dx7JZftfKT8aMq6QA4y1Wh2GzG3cEEbmvrivpkqutpwgWmUBmoI1PYYFyoj3CZHltS3k
         m7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311426; x=1789916226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ojm3inVGHkUK0yBRj0L32h8BiK2OtTXiQ8B+T74NBtE=;
        b=rXPX/kiZJQL1lDoXh2tlJsig8M4XI4wvrqSizg0Vi4VAEbumsoEIjDc2ZJlsbzYNTX
         n2avqWfAxugK7ljdSRghW2cxUuXia6w3EmXAyAPeWTQqRXC0jp642wuHE+oXMd69u5jh
         SFeWIqjEYWdVy2eojpi/kA0PT8PBwdtRoCH8xytk8qMVqTVLuf9yTTR4JQln+gsDSxqP
         gfuCUWtAzkA6f9/jxkhc7Ys9lvAvQWd9+wtMIXnkYMXEDwex8dLhXz0JJK3XvL0CNZO2
         p1c0xtd+jevVm5usTDuPpPSUfQGW6QtCqSXMcSfhrIlnAhjDB50ntQjv4/kMXqJx4Qqn
         BJtg==
X-Forwarded-Encrypted: i=1; AKwUvByRfQp0VZAdB7CIcuFCzN1Rbo4iSkRny+LxDU4S/KC6DNm+tYFFtwkfc4TeanSBWbU/fekqRf/90GQI4Bo=@vger.kernel.org
X-Gm-Message-State: AFuF++ksn1wQe87Qyw0gV16cEnHEZBK/sb46tNAvhfG6+V9gQyMvNFl2
	qwAN8k+f9RlCiaZifD8F8isjE3lH3YoL6CS0G+E4jr3T4SCCjbJwz3SE
X-Gm-Gg: AYBFou2RlUlhNAo//5FGeYNfSCltpKiQ7Oed14JOkB7jFIbToApxOF5cxKhK70X4wy0
	fyrReQHon8Zug5sPn0KKeZzzpQoePBdk/K2tCbFBVgzHhus+iz5fhgc6NfRZ7tGIhAgsyWImFjP
	jU2Tld4rjUlGqoH8l/zoQFyMuXmdgPknB8KRztVSXKLw/hwMWDdQbFcDXChOm4qZ+Ex1P0Cuj2V
	5Dq53oYUpxq5O4t7E04Ypo1TNTlEe3gDODpSkuc+aTzF9xmUKJeMISXImh9sDAjP+DH5CJRZhsG
	oiOlvUU3X9FDRMfUxshqzuYdqgo58tbsdxYGSLvsXoOWDhAcej9OwDbzJP4WxcvhTJuXe6JdwPn
	HEHu075x6cCfnUF4dy2zzB62H6WE4nnIFq/Gj/PEMgHjIXHoUiKBEMwvHSfs1xsn9+tnQhl9D91
	EfrXU0XHz4ShnSaG0fXcMFP9VHZeYJPF2SwM6athyo78xTyaYepz5PPwhJMsWXd6Ng
X-Received: by 2002:a05:6300:83:b0:3da:755f:a031 with SMTP id adf61e73a8af0-3db0e1440cdmr14771539637.12.1789311426035;
        Sun, 13 Sep 2026 07:57:06 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:57:05 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 5/5] arm64: dts: allwinner: sun55i: add thermal sensors
Date: Sun, 13 Sep 2026 22:55:27 +0800
Message-ID: <20260913145527.18148-6-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145527.18148-1-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, THS0 and THS1.
THS0 has only one temperature sensor, which is located in the DRAM
controller.

THS1 does have 4 sensors:
ths1_0 - "big" cores
ths1_1 - "little" cores
ths1_2 - gpu
ths1_3 - npu

Add the thermal sensor configuration and the thermal zones.
Trips temperature, polling-delay and sustainable-power parameters are
derived from the manufacturer's BSP.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 172 ++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ff..ced544154 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
 #include <dt-bindings/power/allwinner,sun55i-a523-ppu.h>
 #include <dt-bindings/power/allwinner,sun55i-a523-pck-600.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -26,6 +27,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			reg = <0x000>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@100 {
@@ -33,6 +35,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			reg = <0x100>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -40,6 +43,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			reg = <0x200>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@300 {
@@ -47,6 +51,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			reg = <0x300>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu4: cpu@400 {
@@ -54,6 +59,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			reg = <0x400>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu5: cpu@500 {
@@ -61,6 +67,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			reg = <0x500>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu6: cpu@600 {
@@ -68,6 +75,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			reg = <0x600>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 
 		cpu7: cpu@700 {
@@ -75,6 +83,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			reg = <0x700>;
 			enable-method = "psci";
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -380,6 +389,30 @@ gpadc: adc@2009000 {
 			status = "disabled";
 		};
 
+		ths1: thermal-sensor@2009400 {
+			compatible = "allwinner,sun55i-a523-ths1";
+			reg = <0x02009400 0x400>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+			nvmem-cell-names = "calibration", "calibration-second-part";
+			#thermal-sensor-cells = <1>;
+		};
+
+		ths0: thermal-sensor@200a000 {
+			compatible = "allwinner,sun55i-a523-ths0";
+			reg = <0x0200a000 0x400>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC0>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
+			nvmem-cell-names = "calibration", "calibration-second-part";
+			#thermal-sensor-cells = <0>;
+		};
+
 		wdt: watchdog@2050000 {
 			compatible = "allwinner,sun55i-a523-wdt";
 			reg = <0x2050000 0x20>;
@@ -611,6 +644,14 @@ sid: efuse@3006000 {
 			reg = <0x03006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration0: ths-calibration0@38 {
+				reg = <0x38 0x8>;
+			};
+
+			ths_calibration1: ths-calibration1@44 {
+				reg = <0x44 0x8>;
+			};
 		};
 
 		gic: interrupt-controller@3400000 {
@@ -1145,4 +1186,135 @@ npu: npu@7122000 {
 			power-domains = <&ppu PD_NPU>;
 		};
 	};
+
+	thermal-zones {
+		cpu0-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 1>;
+			sustainable-power = <1200>;
+
+			trips {
+				cpu-trip-0 {
+					temperature = <70000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				cpu0_target: cpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				cpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_target>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu4-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 0>;
+			sustainable-power = <1600>;
+
+			trips {
+				cpu-trip-0 {
+					temperature = <70000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				cpu4_target: cpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				cpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu4_target>;
+					cooling-device = <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 2>;
+			sustainable-power = <2400>;
+
+			trips {
+				gpu-trip-0 {
+					temperature = <60000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				gpu-trip-1 {
+					temperature = <90000>;
+					type = "passive";
+					hysteresis = <0>;
+				};
+
+				gpu-trip-2 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+		};
+
+		npu-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <1000>;
+			thermal-sensors = <&ths1 3>;
+
+			trips {
+				npu-trip-0 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+		};
+
+		ddr-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&ths0>;
+
+			trips {
+				ddr-trip-0 {
+					temperature = <110000>;
+					type = "critical";
+					hysteresis = <0>;
+				};
+			};
+		};
+	};
 };
-- 
2.55.0


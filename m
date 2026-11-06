Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962042;
	b=B58BoKO8cgCI1q6p/5zf32GBFr9zFrYvza7yHUV2EuJjN3y8ZrvugSpmbvONy9cC9wWs
	 vmJLTAg2TB3kJfPcXNb1cG5zSYcDXWw6XJSr0wmyli0V1cDDepBfhAid/i3Q4X9OJty1w
	 nwjoLxxrDcPTcN9CzY/oPv1kF4pdtU8LIOROlN56k/gOjsxR1QwgIz7QSSxKPXDcT6CC9
	 H/mqiEE9Dv+7c099KNBHWvRpYbevUSmLzmbUP3ZeTd2XADc+evd00W0ZAjjyIjEXhykTH
	 k2jl9FgYFeoF4TBuD4Lk1dqv7edbuV73b4YO9SS9lzarL7flwn1idRzAQ0/hu+y4hTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962042;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=tcFiQk9INcP1NyiO/VB8I2WdTS9SqK6ZO3Kat/I+crQ=;
	b=vZaUEN0xK7ARSLFgAgX4IEtfz9J2wTdP9HszQwrXquojvnyn659q0NZS9/teG4c1K6Ln
	 HaXUFdyeZ6AWzf1ruzYShpmqkyU88VXkOv3KCgKe4KzEvsNr8C7nYuic3TnIAywIHUJ6H
	 GbrK+LY1wnpRAbkLSRc2ZT4bXSS4WM9TatnlmVp9nZjFMDVTydm/JfZI8LUCFnt7NxUoo
	 VrhCJ4Uqz6d+XLtaw44efRWLmFrdGZuu0uaj0FsyP8NRFqWF1G1GamiU9HfZcykXf39V6
	 e2qFlZUDZpDd+YEMQH1Ti96ncQekdh4hnX7DaAMUffpRS+Wq26lU15NakHgH51FD1yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=UmF8bcF1;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBD8606D820;
	Fri,  6 Nov 2026 10:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBD8606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=UmF8bcF1
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07L1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:10 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07L1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962030;
	bh=tcFiQk9INcP1NyiO/VB8I2WdTS9SqK6ZO3Kat/I+crQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UmF8bcF1e1gKyJgQXP8empdFqOyOuLai7XBv+uhWBnnSA6fBJJ4q/L/CQDcT8P1JS
	 T9EaiOHxI3Q28di/59Fo14aWXU2MLypxBq48S9khE8HlAR2/GvRDCPGljeNFEgwgn7
	 FHT1lB0anQLHGRYlWJ7QEG4D2jrFuivTkTbAzl/E=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 06/10] arm64: dts: amlogic: meson-s4: add the CPU thermal sensor and zone
Date: Fri,  6 Nov 2026 11:46:55 +0100
Message-ID: <20261106104659.54656-7-christian.koever-draxl@student.uibk.ac.at>
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

Add the CPU temperature sensor with its bus and functional clocks; it
reads its calibration through the secure monitor. Add a CPU thermal
zone with a passive trip that throttles the GPU, which shares the die,
and a hot and a critical trip. The CPUs can join the passive trip once
CPU frequency scaling is in place.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 69105c8abf12..1e8b845b80c3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
 #include <dt-bindings/power/meson-s4-power.h>
 #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	cpus {
@@ -748,6 +749,17 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			cpu_temp: temperature-sensor@20000 {
+				compatible = "amlogic,s4-thermal";
+				reg = <0x0 0x20000 0x0 0x50>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc_periphs CLKID_TS_PLL>,
+					 <&clkc_periphs CLKID_TS>;
+				clock-names = "bus", "core";
+				#thermal-sensor-cells = <0>;
+				amlogic,secure-monitor = <&sm 1>;
+			};
+
 			eth_phy: mdio-multiplexer@28000 {
 				compatible = "amlogic,g12a-mdio-mux";
 				reg = <0x0 0x28000 0x0 0xa4>;
@@ -1025,4 +1037,40 @@ emmc: mmc@fe08c000 {
 			assigned-clock-rates = <24000000>;
 		};
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <100>;
+			thermal-sensors = <&cpu_temp>;
+
+			trips {
+				cpu_passive: cpu-passive {
+					temperature = <85000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				cpu_hot: cpu-hot {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu_critical: cpu-critical {
+					temperature = <105000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+			cooling-maps {
+				/* the GPU shares the die and the sensor */
+				map0 {
+					trip = <&cpu_passive>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT
+							  THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };
-- 
2.56.0


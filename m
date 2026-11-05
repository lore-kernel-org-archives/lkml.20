Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793918072;
	b=cQcNK9f9W0Ser1LJh1oEdWb59+FNWoJ/EiFEvuFZFpKyLlBExMHztLA/UWeHL5mbSGPx
	 jfBQphwEgJfIrhextWqGxAslfOY0g3J09gomhwMcXnKka0Pn+8bx0hvzRlTvT7AQ8z8yQ
	 gllRzoE6hm2wqrqWDs9KgXIvrkWjpjSsD/b4Qj2cZSjY11W5NLcMu/HsRKxh11Y3IxHmD
	 b7svH+pLTPAaSEpBakYbZrzwuZOe6fqIjxqHtDgHT3Rolw54tP4VDBT555sp6z6/WA5GX
	 J4R/fp+dnQ4WTOu0hdXIhC+r172hVOE7Xq2LMjDG78U7vrhHF7nx08m3gclyzu7glog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918072;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=ln4tk/LM9M0+d3paa8i5oxkJfRqKQYtzPOy14WdQ1gI=;
	b=NNs3RBLwVOeENAURAayEIrwjgE6VjYKC6xcazSpnJmxbRnxYasonhTbM/CLXCym5cZlN
	 Ay9Vf4MS2C2EI1hLsw2+hh4NdPb0bh0xVBZPjTn889wG0LqNm+wcYsqA+4jI/c1BwSEX5
	 xUDPYNfeZmwMy3CFcN0KfRPQKYpdBV4eHgX3Tw7wwM1gbi00/ETy8q6zEz5wAU2rCV35a
	 mBjRObygUbJORcNPQuzJgdPQJNs3jTqJxDqFbM8OTvyicZ/lUIeaCqbVe62eEH4E2atsA
	 arhGmSDDfajQoUsLNDAvwj7c15Eva3Ob880lrnAWGMUpdAutGO0cA5NII6ZHBSRYhYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eiZpq1Yz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDBA606A338;
	Thu,  5 Nov 2026 22:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eiZpq1Yz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3636D1F008A2;
	Thu,  5 Nov 2026 22:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918071;
	bh=ln4tk/LM9M0+d3paa8i5oxkJfRqKQYtzPOy14WdQ1gI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eiZpq1YzgAa2fy5imGg6jK1ziacqZsR4XCVKvq9Luinw/tkBPVYxUEpFWi/v3wSlc
	 URVQY8WgqkQUUVL7I/4SNiiAvzyPEAZEb1aOoPH9rXKXojw2Fvkn8m4p6vooyj2EFO
	 oreYil7CtgOMgJ6e2kdQ8lNU1YGW+pyoi92hOqefWViOFnmkkAGOVkoETke2g/+oD6
	 U06zlWgipG1tHZzGwYlXN0VFFFzG1zJpb7sCUxsOjphvi5QyokkkrPevb/RL2QwDS4
	 gxIYWdJbDwyynQMQ2KH+Rwfrf16bx7W59wppdw6RmoBGuQhpkKCfodzpkMEo2hlqEJ
	 FJOYTKmaPKqpA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:16 -0600
Subject: [PATCH 3/7] ARM: dts: arm/vexpress-v2m: Move regulator and led
 nodes out of bus
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
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-3-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The regulator and led nodes are not MMIO devices, so they don't belong
in a "simple-bus" node. Move them to the root level. This mirrors the
change already done in vexpress-v2m-rs1.dtsi.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/arm/vexpress-v2m.dtsi | 162 ++++++++++++++++----------------
 1 file changed, 81 insertions(+), 81 deletions(-)

diff --git a/arch/arm/boot/dts/arm/vexpress-v2m.dtsi b/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
index 2a8d1d6dfc7e..e368f04bf513 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
+++ b/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
@@ -20,6 +20,87 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
+	v2m_fixed_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	v2m_clk24mhz: clock-24000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "v2m:clk24mhz";
+	};
+
+	v2m_refclk1mhz: clock-1000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1000000>;
+		clock-output-names = "v2m:refclk1mhz";
+	};
+
+	v2m_refclk32khz: clock-32768 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "v2m:refclk32khz";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			label = "v2m:green:user1";
+			gpios = <&v2m_led_gpios 0 0>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-2 {
+			label = "v2m:green:user2";
+			gpios = <&v2m_led_gpios 1 0>;
+			linux,default-trigger = "disk-activity";
+		};
+
+		led-3 {
+			label = "v2m:green:user3";
+			gpios = <&v2m_led_gpios 2 0>;
+			linux,default-trigger = "cpu0";
+		};
+
+		led-4 {
+			label = "v2m:green:user4";
+			gpios = <&v2m_led_gpios 3 0>;
+			linux,default-trigger = "cpu1";
+		};
+
+		led-5 {
+			label = "v2m:green:user5";
+			gpios = <&v2m_led_gpios 4 0>;
+			linux,default-trigger = "cpu2";
+		};
+
+		led-6 {
+			label = "v2m:green:user6";
+			gpios = <&v2m_led_gpios 5 0>;
+			linux,default-trigger = "cpu3";
+		};
+
+		led-7 {
+			label = "v2m:green:user7";
+			gpios = <&v2m_led_gpios 6 0>;
+			linux,default-trigger = "cpu4";
+		};
+
+		led-8 {
+			label = "v2m:green:user8";
+			gpios = <&v2m_led_gpios 7 0>;
+			linux,default-trigger = "cpu5";
+		};
+	};
+
 	bus@40000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -423,87 +504,6 @@ clcd_pads_mb: endpoint {
 					};
 				};
 			};
-
-			v2m_fixed_3v3: regulator-3v3 {
-				compatible = "regulator-fixed";
-				regulator-name = "3V3";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-			};
-
-			v2m_clk24mhz: clock-24000000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <24000000>;
-				clock-output-names = "v2m:clk24mhz";
-			};
-
-			v2m_refclk1mhz: clock-1000000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <1000000>;
-				clock-output-names = "v2m:refclk1mhz";
-			};
-
-			v2m_refclk32khz: clock-32768 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <32768>;
-				clock-output-names = "v2m:refclk32khz";
-			};
-
-			leds {
-				compatible = "gpio-leds";
-
-				led-user1 {
-					label = "v2m:green:user1";
-					gpios = <&v2m_led_gpios 0 0>;
-					linux,default-trigger = "heartbeat";
-				};
-
-				led-user2 {
-					label = "v2m:green:user2";
-					gpios = <&v2m_led_gpios 1 0>;
-					linux,default-trigger = "mmc0";
-				};
-
-				led-user3 {
-					label = "v2m:green:user3";
-					gpios = <&v2m_led_gpios 2 0>;
-					linux,default-trigger = "cpu0";
-				};
-
-				led-user4 {
-					label = "v2m:green:user4";
-					gpios = <&v2m_led_gpios 3 0>;
-					linux,default-trigger = "cpu1";
-				};
-
-				led-user5 {
-					label = "v2m:green:user5";
-					gpios = <&v2m_led_gpios 4 0>;
-					linux,default-trigger = "cpu2";
-				};
-
-				led-user6 {
-					label = "v2m:green:user6";
-					gpios = <&v2m_led_gpios 5 0>;
-					linux,default-trigger = "cpu3";
-				};
-
-				led-user7 {
-					label = "v2m:green:user7";
-					gpios = <&v2m_led_gpios 6 0>;
-					linux,default-trigger = "cpu4";
-				};
-
-				led-user8 {
-					label = "v2m:green:user8";
-					gpios = <&v2m_led_gpios 7 0>;
-					linux,default-trigger = "cpu5";
-				};
-			};
 		};
 	};
 };

-- 
2.53.0


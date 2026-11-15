Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762716;
	b=4WJIKwo8c21v6s80gvi0E1nYwp1FZu7Abs8oB4M8mHY/1G0T2p3o9Twuty0JOa1bsBbe
	 wtj7chqafQw7jWtGn5E0K5bVqNpOWWViIP9HzsOXGwPryj8T9GDVTPcRX4jCAfb5VIljj
	 2zecTvJPgi76SCAWUiKxGmDQ9hzhtVtzYnu6mUwTldMEnAuTm46FweGNvoa8veyCWCAtj
	 XeiI1BGw2zBwGML7HcSgJWYvV9b2elZAa1YIOlLbJoGDTQ2HUL3ZlFWHqJiH9f8Vkno5z
	 q3P1yjuQYX91iYoez4V05rlDWTaB3qkbPadXC3gTgD/wHYOApTjs5S498EFjiToy4ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=;
	b=R6mtZ0oZZ8KDRmj/Pr1UtRIeVvBnEH2a+6evUlJTZ0LDK0SOG7PC0Ys5i7Zr6pXU9jEY
	 zBSXqrJKP4ghr13xku1t4lzCxuKTQOGjAzYoaZTdmKgmsY9dvyiQyABhyW3Ev5N22TtNU
	 pb7yCuaFG+43J1hUZdBwywofgtduGWtPNOOY536vYHGBw0wBxFPh0s487AFrZ7iX0mgZ1
	 vb9AkstsNXAUUlHdPqH8UneOmyCHosUJBi41BbJBH7SxMZjoMysj2qOH62AbYvSJlfzb3
	 mfIGAQoHhm4qPk+wvVIebY5VjlXtcuUSw6RNJG3CPdp6TUSBCC8QpDTevaihaCf2Jgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RtUpyv5H;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8403D606A336
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8403D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RtUpyv5H
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso5966045e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762714; x=1795367514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=;
        b=RtUpyv5H1PxH9F74rpTsQi5KXEP7mRFeo4yHiNn4VjUREE2t7fvJyGMv0JpMOBfYdY
         LgtkVAb8x1RCGQGRmJYeDEYqMa8VSbQOAZPNZwodhFVBdpGGYX6EHzNHUDUzr7R2jIly
         Q2fi7fv0pQKT9/xkOoQpwtCKxX2V2zSupDJ8BXAWpRw15wyDqx9BkA312fOij0Dt2vEK
         MTr7n4nVZOC/3t2dD4Gg9qVy7DiBqglUko+e8N/9ZwQEKgvCU+7HdhgRytYIDkVTbniI
         5U5jSwk3lNw8S4eYkLI5boIAtHAbOKoa7pOQU+BSKIjFUE+B7eruuTkKn77dIzS3/Rb3
         59WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762714; x=1795367514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VzAxZ0RnZAjE719KYavFE7LkkGQ9v4Zgw3d/Pw+Z9SA=;
        b=RZkDieH3RBHxQRYtpsbSO4yvH3d5eQBM6fofyZ5P/4HG9rG5FTDmBBaPSG2Fna6nf6
         yh24s2OctKx4Fv8cj3XS7N6V0Ez4YhUI0Rka+Y1Hsoe40aQYC3xIPoPdTcrsn+oALz1v
         XDQ3OHEjEt3pGtY3dqvm+AI5/sWpKPIujOWIrHK8s1ut4qfBWsU+Nup/KtVSdNRVFeFG
         NqLuQJpjG45ekLSoPGc1+q29HqWteSQ8KwzKJKKPBgNibc1tzuDuG1asb6kEuonHRpS8
         cciqNlkh/V0oTL6VKWD+V0i7pP/ZPH+1ELkKKzlYq53YmlklTaPzYnwdSOVFAHcf3sjl
         wywA==
X-Forwarded-Encrypted: i=1; AL+hErHW7uEk3KJC4d2mAb5UG2sXvUxDAyKOpUWdJNxu+13Sq5dh6HTYnNGIEwZvFRx2d2sGRylbaicNTILYykI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mRXl1dIqMlzwYEcen3tXqkgTQyksX/ocvVlpwpcVs5xWRp54q
	jg+VvbxsQmG9GxC+iIO+kvcFfb4DOufJhWhO2O2fW5i3hc/avJwmFWor
X-Gm-Gg: AYBFou3hJUDQ9zSr2+HAPFQGF2ivQxzug5LLFfQQluwCEyCigOgsPNQ4w63Km9MytY6
	ZIyggBB8Fl+YDfHyKLufRUvFWmDAVa95EA7QGvi28UBLSnQ6l8fcixSVZ2uam+iOfO90imvbbQc
	S/HHJzGMCveRkW39F67BvwwoN8K0J9rAR65Yn2LkcdkXLpHvf071u5PsxjaSwtHcdARVxOQMsIA
	6sbUumb4F+RXgSVbMfnj/psS3RQc5ZYQsU5F0fU0LGzSGk6YF/Pt4U0rdDPlDTJdQpGbDFwyzdD
	P+pE0GA6g9vtPbLgYub50dgNzxv5QHFwu0qLMHfBX+LFq1a6gftGswP2CSY2HSJEh+iuK06N4DE
	SQXSZQh6sRHQ4soevoiGiibb7hRb+GubwtY59A3NR4c43l2pRnRztCGmpnSulBRPfGvCV0lMXU8
	eT6f+HpByfcr+u68VgxhaNh8wY2Fo4AcYLLbyUvAZTip3UcgGE3ynwKlw5RRz1cDVzrJvOM8kKQ
	Q0o+R/iRuEgXA5ntWRLfIdNhsQWgC+XDnkCOXkKUW5rvbeTbVKZr0E9qE1QnKz+aR6yNe1sh1n+
	4lOauLAUWc1l5+/7jjUCnCWcBi9EdpoCb4ImUOsqNEtY+fn9RFYuJqzTa5rB/gXoglGyWWHui5K
	K0mxKrtecVjBwyT57ilKsHpNnfBtgCk8AuPp66nDopkFBZ610feT0nyGqpCvEd0SsnwgcR0tVqq
	LOP3HurboGAokXbF+qzNQZ5B6Z1zNdhGpBTOF2rf4Al0MqR9loimrGMAneqZNAPgaNpSBnBJhc5
	ugFVsOhyAd1QA==
X-Received: by 2002:a05:600c:1906:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb55ac2a34mr189672185e9.17.1794762713782;
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
Date: Sun, 15 Nov 2026 18:11:47 +0100
Message-ID: <20261115171148.37784-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
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

Every H6 package contains an X-Powers AC200 die next to the SoC. It is
controlled over I2C3 (PB17/PB18), takes its 24 MHz reference clock from
PWM1 (PB19), and its Fast Ethernet PHY connects to the EMAC through the
RMII pins on port A.

Describe these parts in the SoC dtsi:
- the I2C3 controller with the AC200 at address 0x10 as its child,
- a pwm-clock that runs PWM1 in bypass mode at 24 MHz as the AC200
  input clock,
- the I2C3, PWM1 and RMII pin groups,
- the EPHY calibration value in the SID.

Everything stays disabled. Boards that use the AC200 enable the
pwm-clock, the PWM and I2C3 controllers and describe the PHY package on
their MDIO bus.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 53 ++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 48c771223af4..5e48b35d13de 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -17,6 +17,16 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	ac200_clk: ac200-clk {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm1_pin>;
+		pwms = <&pwm 1 42 0>;
+		status = "disabled";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -314,6 +324,10 @@ ths_calibration: thermal-sensor-calibration@14 {
 			cpu_speed_grade: cpu-speed-grade@1c {
 				reg = <0x1c 0x4>;
 			};
+
+			ephy_calibration: ephy-calibration@2c {
+				reg = <0x2c 0x1>;
+			};
 		};
 
 		timer@3009000 {
@@ -388,6 +402,11 @@ i2c2_pins: i2c2-pins {
 				function = "i2c2";
 			};
 
+			i2c3_pins: i2c3-pins {
+				pins = "PB17", "PB18";
+				function = "i2c3";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
@@ -414,6 +433,19 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			pwm1_pin: pwm1-pin {
+				pins = "PB19";
+				function = "pwm1";
+			};
+
+			/omit-if-no-ref/
+			rmii_pins: rmii-pins {
+				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
+				       "PA5", "PA6", "PA7", "PA8", "PA9";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC3";
@@ -626,6 +658,27 @@ i2c2: i2c@5002800 {
 			#size-cells = <0>;
 		};
 
+		i2c3: i2c@5002c00 {
+			compatible = "allwinner,sun50i-h6-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x05002c00 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C3>;
+			resets = <&ccu RST_BUS_I2C3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* AC200 is co-packaged with the H6 die. */
+			ac200: mixed-signal@10 {
+				compatible = "x-powers,ac200";
+				reg = <0x10>;
+				clocks = <&ac200_clk>;
+			};
+		};
+
 		spi0: spi@5010000 {
 			compatible = "allwinner,sun50i-h6-spi",
 				     "allwinner,sun8i-h3-spi";
-- 
2.43.0


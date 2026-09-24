Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6CF18A6D4;
	Thu, 24 Sep 2026 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256170; cv=none; b=RV6//vVtfWOPR/kltBdHTzdtgptkxfpV2/A/ijj/YYmTQ41pDljhpbsaVyJCEsbPTkfuiAdku55fbtrLTTBluGS4BhMOkU3RRtLBi1XInRFQN8X0SHFihMVSL70W31eqn4ZHLM49bGLXNDsdoM/yIQBpX5UWz0o3XVpI8WRWico=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256170; c=relaxed/simple;
	bh=V7rZxf00ifdzZN6MjtWsWhtJfDJFKwI6LbM+MG8Yu6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fS7U5Q91zHRkSk4z46f8Yiw9VPYgqWr2Y3PVPD5UszhYl7A/H02z4kzmsHPREei9+gghJ14gbCTwfbCdu1o9URt71YCztzl5pm4OSU7s3HAWY+6Rr4m2C60B9+ikJQSxnfpMLOJjNhD10TIAYQIC5lIHSu0shLYpcUhgMNaEuck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=WYirBpFi; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="WYirBpFi"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790256155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4HcJKcUVq7LllSNvQBs32R2oFsmdY/a/xgb5CUOfaaE=;
	b=WYirBpFiGy1GF3cm0bhGfJO9pQc+viReBJs00zq7d64PjhzR8xvmsKufxlgrMDHorniBuV
	8XyMtoXAHdEvGQMCmpqUGI7jne0kKRbxMFpBD5/QSiWeD0r8ZkowXoXT9Casin150GAlp0
	MXmI5Aii4dIB72ucjVoPRNuv+PdDb48=
Date: Thu, 24 Sep 2026 15:22:23 +0200
Subject: [PATCH 1/3] dts: apple: t8132: Fix blank-lines-related
 dt-check-style issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-apple-dts-m4-dt-style-check-v1-1-3ec651d75baf@cyberchaos.dev>
References: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
In-Reply-To: <20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>

This fixes all `dt-check-style --mode=strict` issues related to blank
lines in the t8132 device tres.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8132-j604.dts  | 1 +
 arch/arm64/boot/dts/apple/t8132-j713.dts  | 1 +
 arch/arm64/boot/dts/apple/t8132-j715.dts  | 1 +
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi | 1 +
 arch/arm64/boot/dts/apple/t8132.dtsi      | 8 ++++++++
 5 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8132-j604.dts b/arch/arm64/boot/dts/apple/t8132-j604.dts
index c4be915cb33a..93076cd923a9 100644
--- a/arch/arm64/boot/dts/apple/t8132-j604.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j604.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8132-j713.dts b/arch/arm64/boot/dts/apple/t8132-j713.dts
index e1fc5d47f487..892a3812bc65 100644
--- a/arch/arm64/boot/dts/apple/t8132-j713.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j713.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8132-j715.dts b/arch/arm64/boot/dts/apple/t8132-j715.dts
index 2672914ea76c..212d194bd1ae 100644
--- a/arch/arm64/boot/dts/apple/t8132-j715.dts
+++ b/arch/arm64/boot/dts/apple/t8132-j715.dts
@@ -19,6 +19,7 @@ / {
 
 	led-controller {
 		compatible = "pwm-leds";
+
 		led-0 {
 			pwms = <&fpwm1 0 40000>;
 			label = "kbd_backlight";
diff --git a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
index 9882ea3f85e6..b0c5d71943b6 100644
--- a/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
@@ -26,6 +26,7 @@ framebuffer0: framebuffer@0 {
 			reg = <0 0 0 0>; /* To be filled by loader */
 			power-domains = <&ps_disp_fe>, <&ps_dptx_phy>;
 			/* Format properties will be added by loader */
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/apple/t8132.dtsi b/arch/arm64/boot/dts/apple/t8132.dtsi
index afec92a06015..1ea488ce6e1c 100644
--- a/arch/arm64/boot/dts/apple/t8132.dtsi
+++ b/arch/arm64/boot/dts/apple/t8132.dtsi
@@ -24,18 +24,23 @@ cluster0 {
 				core0 {
 					cpu = <&cpu_e0>;
 				};
+
 				core1 {
 					cpu = <&cpu_e1>;
 				};
+
 				core2 {
 					cpu = <&cpu_e2>;
 				};
+
 				core3 {
 					cpu = <&cpu_e3>;
 				};
+
 				core4 {
 					cpu = <&cpu_e4>;
 				};
+
 				core5 {
 					cpu = <&cpu_e5>;
 				};
@@ -45,12 +50,15 @@ cluster1 {
 				core0 {
 					cpu = <&cpu_p0>;
 				};
+
 				core1 {
 					cpu = <&cpu_p1>;
 				};
+
 				core2 {
 					cpu = <&cpu_p2>;
 				};
+
 				core3 {
 					cpu = <&cpu_p3>;
 				};

-- 
2.55.0


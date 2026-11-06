Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984190;
	b=EvRu3TLSdTa8++qfDmCpSEfYfjqYZJwyyGlLr4ZC/JcdY1R3u1/EPegP9eV1JIsORdeD
	 1zwcACThDFHe55/0/ENNZXzlHd56qs+0IZUH3F5mLNsT0TeU8p1BIKS1zeamvE3FYcnFI
	 6uwx8GlCxNqiy86Bt/VmJKwNsS0k4tApOIgA5+zMhnJdRIiB+5+zcd0S2WxeEVWOsgA6e
	 zTi3SENqMKBoanEemns1CraMw47c3sGDf2pRSkpCv6q2DnJhBHZZTrQPwbAyKgCgoC4E/
	 6LEyO6w6WGNRFEalLXeilM9bCSGF2YqaTridZTiS0LnE77A+V0DGojDEDKWf8BzJKEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984190;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=A0ueZbdutXIDB8BlM9vO73ShuZrV78krDehdwtiPnNo=;
	b=PngkZtoMJWdGKTS/6RYYcy00CA6KxyyziF7U0/tODhW+aAZxQXaAZp8vExLu+VG1zoIU
	 R9UHwWG59rCbfF+W06oNGDnaOnNnvJCFrZeNZ/SHEG1zvpAnCSZaiPiPIbjVLHStbu/Ap
	 vLsk7bZFgbH3er+g7LNG11uuUjtW+ACFR/1trwjL4mU7h1QUho2Fjw5ncI+DCBQx/DhwS
	 iaoWVzMbJrMLqeZhuZglTpEihJwr10k3XJTQeFPjsENvztIruhtqRSB4PbE6ta15hu+J+
	 nU/+E6/ID6s7J7z2vtcFqN3Xy4NWtwDj39Z0+xMGitj4GA5uXBnEdgodIsMSe3JVr5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=l2n3Ww+q;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2CB606D812;
	Fri,  6 Nov 2026 16:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B2CB606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=l2n3Ww+q
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793984183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A0ueZbdutXIDB8BlM9vO73ShuZrV78krDehdwtiPnNo=;
	b=l2n3Ww+qMYNYZnEOl5MJWYsGjh1k96ytz6u9g4ni081Vo8swU0V3TjT4zeR884wrnHLIbT
	L6wQIghEjnV8IFPqT9hJL+zyUX2xS+2gclgG7XQA81Rt6QgQpvdJt4nRXnkJPrBi73Ugat
	myq0U/+TBBL2ilWJv/L6bl9AL0+Ni3Y=
Date: Fri, 06 Nov 2026 17:56:14 +0100
Subject: [PATCH v2 2/4] arm64: dts: apple: t8132: Fix blank-lines-related
 dt-check-style issues
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
Message-Id: <20261106-apple-dts-m4-dt-style-check-v2-2-1e715e80b066@cyberchaos.dev>
References: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>

This fixes `dt-check-style --mode=strict` issues related to blank lines
in the t8132 device tres.

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
index 58805c6ab002..6d070306e29a 100644
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
2.56.0


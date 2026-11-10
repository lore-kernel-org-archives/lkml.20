Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794289019;
	b=eAxEpMvE8CZYxeGFMG2iKYdRwq7JiptSmZZt6hjShHNT8SwIpOk8gsBowb6hrCabyop3
	 Fagd7sGpktGuw6FyOz98JGU7vay4cS0qCz4KQUl0f3VxcUGGoIAuQU9O6YcfvKMwfCrCx
	 tt6mmes5Z4AQJuvFcPm49RPhldynwBaqyQu9xXALdSwjSqvyLZ8xHdcb25xj4DyYPXX7e
	 YcUO/GhLBDMypHSaI802O4xEkh2/J2ey9eUTPPeU2nprK+ZCfz2BhPMqH3qPZPwpiPsgd
	 gy8k1e3GguU5xhQ+DcrjTes8elXYg0hqcmabJz8rl5XBKZTpsweJfHePlTFqpWUu32g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289019;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	b=h/9gKLpIvPhNVcfB8YSeBUrRG2Ly9eaX7iF5w2MHZcMcpRA3v09Oerj/OxIZaVG2GZ3G
	 OxFqha84UMMbinveqRLqcVqxGRtZbm6W3SdokjHlIlvYVYpJrz10+zo6VVe3NheyMpQby
	 0tjW7q64GmQcu0ffZvwVaqumjkZU8hB5zZHTdOaJqLwoKMXPbRM/hLTlzVgZFyiE1mWcq
	 JpWF4rE6uiNgV9aiUPVEFkL5a687/0cWPli6GctzBvKpgVV4HP8nUGuG/BqhiL47/O/th
	 v8bynhfcLp6s0at6r0cYx+0rrPfAxg5SJlZWssuMwZbsmQfCfh0QCS/vGKFed+U95+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IReWKkhQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162F606A33D;
	Tue, 10 Nov 2026 05:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IReWKkhQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289018;
	b=Na2wMfpKXhzrFGK74WPaAKTpe+xcg7gBdDVmoCbt2tDGxZV1qMJjV8ERYypi26IjtTq9
	 3wPOkMJSjjngAf2oI4vfOLfM9cTQAX5zBc9nGqchEAbVbEabvZ6wes9CtRFqQPtXQkoWB
	 GuJPIPXqHNihwLMgLkZeZMYHUzuuEgQl3qfphAG2dyTr+uSc/b5SYRRKgC+pPdNWVLfX3
	 fWRMegq42uUVmDXhwT1vUhplkmXIYiA39rXD8IstCPtBwMii96ydeMzVhmBGFkVllsPVX
	 aAOSR1L8UrL3CeVnnz/YxfXMJMW7zeE0Rrti/lwcOmQI4lM2GRig4ZUfFm4Rl0K6oCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289018;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	b=d9FR42Vx9cGQuZuDxa6hP+gpnkdjLquTgcJT7vnDTt4/j3DBWj93/riGW+0TJ7KXQ1q0
	 ZSpLzThs8HpmSF/eeVBw30VYSZVacxPfQ6QNtiTt5MsVqIUlz1FjjYgM2b3amSbjjH+Vf
	 ZBnv7hePY4dXY3QgHPFvRD3m9QnNtvbN5vwZ1hWKoAas2xEhUE5dZhewp4p1BNc6M2HaH
	 +KUAU91gewELszaeGzlR2Kp6yIfDVx3TbLUL5YywKAOeGAAUF0u55yUttq5H2ose2akKI
	 LUNh7qk0vTL7Tptj5OXbVmdOGKmi6VlIrGXX6lkroXmpr9BsLvsVNjiZ4Fb1xWpXckw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 458C01F008A4;
	Tue, 10 Nov 2026 05:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289018;
	bh=cccUMx05jPVtgncaoOCw86iG1kz4fwGOT9LlfXUuuVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=IReWKkhQKF6NSu7COjWiNE5qqRwZa//FZ5wN9Spk+81YpPWq5Ij5tzVy/q0xjNyld
	 R7xQcS6AINJwX6jrdO5l6Gy49X02oEOSpIyk9fcKQ/7MjgeZP1rzYld0R8wnQYbrG/
	 5hEI+dNmgjJR9XcW1J6h2IypitTDdWh1/lbk9D7sW6BeNwZZW6i2ydn14f+VYZjWzE
	 84YU1Y/vneIebR40rFX6KMFG/iCPx2TjVGonb9vNJ3wNYCqTBwbBytuUUN0UnSf/5a
	 RuO9psNIfUXEScKlFbwKCLShcpyjlOInaM2qCDMpAMavjyvbLU+qaAaz6v3WSLddeQ
	 lTDeNyO+sOAog==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C64FC488AB;
	Tue, 10 Nov 2026 05:36:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:36:58 +0000
Subject: [PATCH 4/8] arm64: dts: allwinner: h616: Throttle the GPU from the
 GPU thermal zone
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
Message-Id: <20261110-h616-zero2-dt-v1-4-05506d760f21@gmail.com>
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289015; l=1929;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=teKOTEf4Ehrd6NI/Dk5AeKkHXxd5JXaOLzoyVTpHUvU=;
 b=+C62sstufF9DUcspTyYWdroKBtE0YbldKzOadENtR0M9QPURkJPdKa5dDR8JEWNjIBFmbSYpf
 znoWxcN6w7lAFZhzlaAu+zyYgU6/yLlfr3tVr/jBbGQqT1aprfFClur
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The gpu-thermal zone only has the 110 C critical trip point, and the
GPU node is not a cooling device. Once a board describes GPU operating
points (panfrost devfreq), the only reaction to a hot Mali-G31 is
therefore a shutdown.

Make the GPU a cooling device and add a passive trip point at 85 C
(2 C hysteresis) that lets the thermal core lower the GPU OPP. 85 C is
the CPU alert level mainline uses on the H6 (same thermal sensor
generation), and is below the 90 C at which the vendor BSP for the
H616 throttles the GPU (it maps the GPU to its CPU "target" trip).

Boards without a GPU OPP table are not affected: panfrost then
registers no devfreq cooling device and the map stays unbound.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 68bd6137c316..93c3b8279241 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -162,6 +162,7 @@ gpu: gpu@1800000 {
 			clock-names = "core", "bus";
 			power-domains = <&prcm_ppu 2>;
 			resets = <&ccu RST_BUS_GPU>;
+			#cooling-cells = <2>;
 			status = "disabled";
 		};
 
@@ -1124,12 +1125,24 @@ gpu-thermal {
 			sustainable-power = <1100>;
 
 			trips {
-				gpu_temp_critical: gpu-trip-0 {
+				gpu_alert: gpu-trip-0 {
+					temperature = <85000>;
+					type = "passive";
+					hysteresis = <2000>;
+				};
+				gpu_temp_critical: gpu-trip-1 {
 					temperature = <110000>;
 					type = "critical";
 					hysteresis = <0>;
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ve-thermal {

-- 
2.55.0



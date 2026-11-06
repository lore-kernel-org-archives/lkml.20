Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002248;
	b=BYeiG2UB/ILfpmJW0QMp1kgpL0HnEheizzd5kGjEoX5cyjSUGZ7+mY3+SKRxTIwsAeIH
	 7u8huDjGly7UftQ7R1w7PDIEAlyF4D89LssS6Bb5RYP6hL9xZ3Jm++fq2JP3e1GN80Xuv
	 oE8T7cwpScXLX+WOgr2mkqol87ywoG3iNAvuHIEXItMYyjDoFYsCUfi8Yy1rTmOHl2GHl
	 Kffi3+mMTvHvFaMGRd37bGqWS1ObAECkb9YvikL7gfIqOjOlWDMywY/J9jTX4NeGLQ85K
	 f/UEafdFJ/04KJC5Dh9NMPRbSINPg1+qxQIk2o1+8TELpzJtG3P4ynvYtxx7mH8UOZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002248;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ReJVLYumEn9iWasnSyBGUIhaXWZBsODo5kqsWooUE/0=;
	b=ToR5nMd9fbtOG+wSan5hXS3JaR2Xq9YHgLs2Bith4yRx9gdN3rwwq2owfaO03DhLFiXp
	 srgyyDikbXXMXoFv2zUmcgrQs3LDQ7kdcNAof55W3+7mjflVNE6EwSaQK7FUKDogkflYw
	 nP4qwU5XKFuBm4FKpJlmtVNO4ke6Snc5+1/OqTF3bGHCXg99znOHDJfNZ7DvMCUelPdOg
	 wbOlX9rxSDCuWBEQm4aCBHzpYh6n8o9ivAPDPw+p7XNhspzyBDBEJoH7tuHp04Gh/Ckh4
	 94cCqDR3alCz3/iIcArnaq0j9MJf5q37Jub9WMj/rSvqNVpHPXdeIeSOPlECsqwf/Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="HijhD+7/";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575B2606D808;
	Fri,  6 Nov 2026 21:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575B2606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HijhD+7/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794002240;
	bh=yZcsj37g1wDaYHpaMHQC2ZVJ0rLcIWMu06mwv5p3B7g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HijhD+7/jPNYT1fn5eC6PcPQ2DoEwvDfWCwpLJq8qLVfSWFj4hd7+5VXwjUo5zYV1
	 fGaGa6QYGnztOuo2McK787uiq66F0Jhs633mQcpuhDvtT+XVFLPRUrWClOk9jtg+iG
	 Ljv+raqiYZfw7Sc96JqlrgmxTEB5tr42Yy1fZj/4gVDuvfI60q34zHeBpjiq+NQ1HE
	 XEA0QYFONQkAQKL0dP4yrXjlT5+XNGMsU0EKdpFsKdqKmVPdNrVn9VfNp9XVlZDOOu
	 KGGtd9Pf9C4QafR2Q8oNzF/BfGWvZB7tHjSHwElY43sahJswr1dhRe2c4RTjKS+vvC
	 O/tpZvkypgzGg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C05117E092C;
	Fri, 06 Nov 2026 22:57:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1413548002F; Fri, 06 Nov 2026 22:57:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 06 Nov 2026 22:57:07 +0100
Subject: [PATCH 2/5] arm64: dts: rockchip: Enable NPU on RK3588 EVB1
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
Message-Id: <20261106-rk3588-evb1-dt-updates-v1-2-bdbe16223589@collabora.com>
References: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
In-Reply-To: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yZcsj37g1wDaYHpaMHQC2ZVJ0rLcIWMu06mwv5p3B7g=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGruTT81gQ1jKj278e8o4UwdJsiBbOsUrL7mq
 h9I8htVfnYX8IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7k0/AAoJENju1/PI
 O/qaebgQAIwQyvBzXMtzSQdbLxacZUfOP6Vzw9WomWyYqHZOR/vCnASth1BcQEKepPeOtg5lxy0
 4qYgzFTO4LrP9TzJIP+KTd19QjmnkTukIpT5ulSQaR/yxa3wQvqgZ3FWaKFaGZEr3A/2W5VWp3w
 C6f//NlsGy8oTwuDCIJqG6O9q9HREWXqxCKGqT9Hm+hLe8a840eRDaLB+InRnq1VQE6mIezIHH2
 2Z7VoL/zVxZXGQZNHhcPsJAdGfelfCQIPna/qe4Z6NYyRpgFt3K5KbErCHoIsAIY3Tp9nyXm6QN
 PWtSuFtO6Gs3ZCq0qBQpsmHeSu9CvkTJ/Qs7RxKFGnJuwmRd0xSmpA8pkx3wIYItkDoLugOArdW
 rEVDJBtRU6BOFDpdqfhmXIbLQF7Z4gk9F4orUItBbMlApMeBcsQmFEzFsiSEKCKqFH2e86i6S+P
 7r+ulWMorjnuEQPGYTMLt6xlJeT7MRWitCSmRGhRzHuckMGqu0bqf1ctbQ1DFKmnIMhQgjGF1HN
 K78kLevgK+TRZfYpRG16H40yZmI2WID7CuKUTwVDwynKdsVzT4DXXjHY9gMpTDtAwyWYCk8XgFi
 J/uU8mMV8oW7lYIXsOYjGndc6FgmygJe0a/ZIDvrx3VC/bbkmefo+p/mJ/uP7c/p1e0Xicuh13E
 Kqn/YxpwlnzHWYYcLYNsoVw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Also enable the NPU on the RK3588 EVB1, which is very similar to
the QuartzPro64.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
index 87e624d1e094..6476d9e3be6f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts
@@ -578,6 +578,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pd_rkvdec0 {
 	domain-supply = <&vdd_vdenc_s0>;
 };
@@ -703,6 +707,36 @@ &pwm2 {
 	status = "okay";
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";

-- 
2.53.0


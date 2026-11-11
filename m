Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436996;
	b=3dAsVMGTzCOWP8LjgFWD9ZhkfLbEtPqNBSTIBaZwcG/z+hYttZFhrEVvngj6MAXMN2Rt
	 rYGw9lxhJZUQAFVUszsPrq4waSJTmgm1SJpwQqXcjfllA4XH7uxRr4t2xWVfGzhNbg4Of
	 pl1GOiIjpVOLVe9TzGW7n1Zy+rBY7xtJtbzn8v6RwyGSzBS9lJQlSq/B0PvQjAITNSbrE
	 m/2uyOnGCu53RDw4v+oneQ1AWB4F5vEwYsila65TXEQJqXXtO+7eCc4NbyATmLFrjLR4l
	 VQfbeNWoQUXOR9oAoqNPyCvFL5xGdWaQaZVesRTd+WH9KOPe61OP49XgYGqJnoZXCvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436996;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=/sHEUsYL1fLrcDtxWkY+EanrRcanvkHZv8Egmu5dY54=;
	b=rmWb2hTK1R8tPwDfMiy6FlK3v3zWJ8sjEIMQqqqwxDdpFfG6uhOLirIG7gOFZnzT6Kar
	 QyvfjuKo4efPGYVqjB9pvIUnD5PNYabnvospkSKREnJ9uw8/rFojQr6Vm1PkfjxkemT+i
	 Mrn7BtKEKFfhRwLX3ePd0FXtsJtfMfvioJ6X6O29wkgjozFNfdMRLyUKmbdtkkpNdfewV
	 tzpAq5Ltb47oZ4Tc4GtLdQS0HfUkWCikyadRjBFdxANAjdYIA1lMFbLY4OXkx9M/kb6Z1
	 EqzlXG0lqdWoOZXIem/ujvZhMGAM0Dz8g048vZl7Zn9AgvOFXdF0IBkGfagHbg4RwVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Geab3j7d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5F060A3824;
	Wed, 11 Nov 2026 22:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Geab3j7d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5891F00A08;
	Wed, 11 Nov 2026 22:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436996;
	bh=/sHEUsYL1fLrcDtxWkY+EanrRcanvkHZv8Egmu5dY54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Geab3j7dU4DJKwXmvVey6M7rAvj3P5TjLmWO+PqqCSbYz6hLjS34N7PIRdFx5ixJ9
	 d6Vrlonzq7j6to9H1R8SV4jvj4v22jlxOsT7MAxh/2oC4iroLGqKZhJzrstJV2PIsT
	 UX27j5pqQgFDDP6yE4GNn8at1anpx603EySecb3dkCCxUkImysT2T2UmlkebN+AQ8v
	 KNKTggKoXfO73KibAefj5pT2wJA0WazLnRV7dY49Mc0wqcR1fB+UnuhQoFbTO6I6/Z
	 M2ye1Y6nXoH78a7OlvPBnbfrD2GYwDcRwtKE85T+aMTosN4sVgfGZ04vf5gGKDo6ah
	 caHpWztyqiBrw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:42:59 -0600
Subject: [PATCH 2/9] arm64: dts: marvell: Add AP806/CP110 syscon
 compatibles
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
Message-Id: <20261111-dtbs-marvell-v1-2-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Add specific compatibles for the AP806 and CP110 system-controller
syscon blocks that host pinctrl, GPIO, clock and thermal child nodes.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 6 ++++--
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
index 40e146982921..0da13b2cd1fc 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
@@ -267,7 +267,8 @@ ap_sdhci0: mmc@6e0000 {
 			};
 
 			ap_syscon0: system-controller@6f4000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "marvell,ap806-system-controller",
+					     "syscon", "simple-mfd";
 				reg = <0x6f4000 0x2000>;
 
 				ap_pinctrl: pinctrl {
@@ -293,7 +294,8 @@ ap_gpio: gpio@1040 {
 			};
 
 			ap_syscon1: system-controller@6f8000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "marvell,ap806-system-controller",
+					     "syscon", "simple-mfd";
 				reg = <0x6f8000 0x1000>;
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 39599171d51b..9e365af19a0c 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -225,7 +225,8 @@ CP11X_LABEL(rtc): rtc@284000 {
 		};
 
 		CP11X_LABEL(syscon0): system-controller@440000 {
-			compatible = "syscon", "simple-mfd";
+			compatible = "marvell,cp110-system-controller",
+				     "syscon", "simple-mfd";
 			reg = <0x440000 0x2000>;
 
 			CP11X_LABEL(clk): clock {
@@ -277,7 +278,8 @@ CP11X_LABEL(gpio2): gpio@140 {
 		};
 
 		CP11X_LABEL(syscon1): system-controller@400000 {
-			compatible = "syscon", "simple-mfd";
+			compatible = "marvell,cp110-system-controller",
+				     "syscon", "simple-mfd";
 			reg = <0x400000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.53.0


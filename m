Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437002;
	b=Yutwe26ARIvq7DV3MkyQICOWopAw8Em2ugDPuv229wp/4y9MIaV0SmEZXhv3qhv+FH0V
	 x9d5imIjVQjOCuyJ90kgrNhrHmAQgVfvXxOWi9FNqjg+jSfsTzMeuZcbSNpZMU3Q0PLLp
	 oabxw+ie75idrbDZUBrBJAr5AAHZjtg5XyoTxt1aRqWEOKEycYLwoOVQxJ0Ce+GpZsxSY
	 PU/gUuSmY1nA6oO31PT+jUfQoy55+VzxGTfUBpc6S3PJS5o44/3yfg5KfASGSvmJ9KUCH
	 BYmG1MPT5SfLOzoDikXtWOpGH+C58+C4WrZ7rECE6jl6WZ37PGofYTD5ftiQkGD04rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437002;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=9/5/8dOyDqQ1xEhv/96Eczu20G83ALlhjhXbEVyTE3A=;
	b=V5BQ/luLxsaQCIsgggwvo7/yIa6jRGys88/Jm01Q8I5yrrj1SKSfEprrj5Ef/xXSeKd/
	 FBCc+Mdvmx47crfVYXRgGlqUJoVbPLyVFloKINyrY0B4uYAvOR1949zEmguFhfqcZMcon
	 PO1BOaU6oeJ0prKtvrrCHEHt7HnPqV7MDq/XDGgORDIeRHl3xQM1F3LBjOIUPyZtRs9F8
	 tIATShcsHZpzHzGffiQ51siFHGCETz+VShCqqRK0rf6yFROzb/Ak1J+O20ZWvkVtLdBmj
	 21Wh4KGCo+cpUi+a4GXkHnqGAU0ajwCyfCNSkH/Fwu3OE8GxthWoC0yD1pyP9a1/Sag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="R/+5yJmE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B42360A6F47;
	Wed, 11 Nov 2026 22:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R/+5yJmE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620681F00A10;
	Wed, 11 Nov 2026 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794437001;
	bh=9/5/8dOyDqQ1xEhv/96Eczu20G83ALlhjhXbEVyTE3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R/+5yJmE4KaBsF1aXUf+XjI8G0njxOL9DRSS62soWh5qV6EpsGweYh8SvvT1Q4NWN
	 oD0dpqtE/SV288KczymCJqk30dbZ76d+km6r/bKOEsMUyd2DrXENWzQmFjHDQstVqW
	 03ES3pIeuqIgqo5D7JTbdvxDQOiZ4SNGD+a7pMb1kPyZuFQg4TtTXEiF0NSGJSv1Zo
	 Z7B/eWHQjkS1KXl3TZC3rJuUSnULofoSguyVmMqjFhZsCV4QWiaHNgReP88kyqxENr
	 jguGv4fjm2xOasjdfw1W/64ue9IkLwxb+bA4Wc9ba0rynirBhPm70ZL1sOLDQ+ALzf
	 RwSBeZHDc33mA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:02 -0600
Subject: [PATCH 5/9] arm64: dts: marvell: Fix node names
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
Message-Id: <20261111-dtbs-marvell-v1-5-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Fix various node names to use standard names.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi              |  2 +-
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts |  2 +-
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
index 4878773883c9..814b8a2e8ea9 100644
--- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
@@ -231,7 +231,7 @@ sdhci: mmc@805c0000 {
 		 * Dedicated section for devices behind 32bit controllers so we
 		 * can configure specific DMA mapping for them
 		 */
-		behind-32bit-controller@7f000000 {
+		dma-bus@0 {
 			compatible = "simple-bus";
 			#address-cells = <0x2>;
 			#size-cells = <0x2>;
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 4efa2a1dbda7..101d1518e28f 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -324,7 +324,7 @@ cp0_led1_pins: led1-pins {
 		marvell,function = "gpio";
 	};
 
-	cp0_copper_eth_phy_reset: copper-eth-phy-reset {
+	cp0_copper_eth_phy_reset: copper-eth-phy-reset-pins {
 		marvell,pins = "mpp43";
 		marvell,function = "gpio";
 	};
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
index 06a861f83ad8..68c8489e0a6f 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
@@ -165,7 +165,7 @@ cpu_active: cpu-active {
 		};
 	};
 	cooling-maps {
-		fan-map {
+		map-fan {
 			trip = <&cpu_active>;
 			cooling-device = <&chassis_fan_group0 64 THERMAL_NO_LIMIT>,
 					<&chassis_fan_group1 64 THERMAL_NO_LIMIT>;
@@ -191,19 +191,19 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0x0>;
 		spi-max-frequency = <20000000>;
-		partition@u-boot {
+		partition@0 {
 			label = "u-boot";
 			reg = <0x00000000 0x001f0000>;
 		};
-		partition@u-boot-env {
+		partition@1f0000 {
 			label = "u-boot-env";
 			reg = <0x001f0000 0x00010000>;
 		};
-		partition@ubi1 {
+		partition@200000 {
 			label = "ubi1";
 			reg = <0x00200000 0x03f00000>;
 		};
-		partition@ubi2 {
+		partition@4100000 {
 			label = "ubi2";
 			reg = <0x04100000 0x03f00000>;
 		};

-- 
2.53.0


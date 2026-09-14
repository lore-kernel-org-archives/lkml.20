Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F29410D3D;
	Mon, 14 Sep 2026 08:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375261; cv=none; b=eXuXj+hlo2u3slEy2ZhXl/t2CPEhmD+sUgS4Ia2B9CtNVLuqTOHmoTlTPvIeUdtzX9yszCtBgbqn0WT3NZ4UBYHR2nl9+uwwTjvbXZbhEJctTquCf6AQ4OAyT/OzDwiFPSLQDtgpJb3rFR/t2/vGHBkucd5wRiKbVCxtX9EiM1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375261; c=relaxed/simple;
	bh=C7S7XHfxQnp5uE+3F+9w2T8pnzHGI5LbglHOzy5r0d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rn1K8NNhxgUPfXWbr9PaNy5KXCGKBbY3w8ODRknOT4Wxej+1J7PIaZCsinbFLRKOvUgQw0H7dD426gkUp0xAFfqfW0Jxg+DBJiLnAfoW03A6oIEAPWKelHRssx47ZkDGRy0nVKeJaXVAOrSCWtpUqGWZJ0GH5QKhPaSMbDhx6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Py7zPeLE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bUkRMS17; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Py7zPeLE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bUkRMS17"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 97323140009B;
	Mon, 14 Sep 2026 04:40:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 14 Sep 2026 04:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375252;
	 x=1789461652; bh=ZkT5VcAQQpKlpqulmTBWpPKXElg6p9FdyGKZi+5QEAY=; b=
	Py7zPeLEZovGH09PN8PejcyxDbQ5P1Z5oaWb2tJsrszv44pNxyTcN9Bvfjy6BY6N
	PRI0/d5+R4SUzahbk6CHm+kaWVr6rSPPF+whfKWpnYjhDZmxtPAUjaoXaZlvCDni
	f2Fvjd0M1vggU4WcfDE5PybiGqcv4aEoRGC6lW7/JDbXn0m2VrT9i/n6QOdINCSG
	kH8Ra3b+ohmmOFNi7OF5rD4YrC3Je3bklDNSIVCe+/giFKkEhw6StGDUSnrdg1Av
	hWj/i7zdX7aBDlAsA0pEWj3u48MUiow4Lh/MVNZMndgmqKRzXis2jghFxZnpmP8n
	YS36AlymENmcEGYhPh4UcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375252; x=
	1789461652; bh=ZkT5VcAQQpKlpqulmTBWpPKXElg6p9FdyGKZi+5QEAY=; b=b
	UkRMS17fQFb8+PgyLcu14OhydtmaqlRlKSYK0ixRDuXg/nQH3wFfd9wxDjyDjEK9
	az80QTQ0cw7UjCY1gf5TYTqEvJ+L/Re7BXcU1HISfYVILQOZHDQGx2D6cnCh3vIA
	rSePOhEtnaEncSYXaEAAUgrpVf52FQvGkp5+UvzJNGPru6RUbR0becsTwWM3at49
	noWw4E57LZgDDvdy0H16ztjRwMJJ8uzwV/lDrwE01AX8sFm2OFKalVp7c0HSEVTG
	K3VS2UUFD1XRnJuHKpCllgD6WR+yniTbzy2tXW14ymjvGR/3IOoVOIrH5gUSefz6
	HvEfn1+L+pU6koagIt4QA==
X-ME-Sender: <xms:FLOnasPgkG0Oi5B7dHh88qUUlXW5nPZ6RxmPhRfpE7P23ZrBiCAz9w>
    <xme:FLOnarL11OAVIRuMu8LZoTFMgdPq2lL1SafHoxu-CibHHqAMrEPFQUkjcPKY9dzfE
    x-d0B49716BJyeKDJFQlV9t1BzDfC23I6iNQkjuIGFYPBzLs_Z9KSbB>
X-ME-Received: <xmr:FLOnau1K_XQt5A4Ih3_0x51DeM-MdZdbEBoOyu9Idc7OY6xFbfNfSZ9kg679MVnBnBDk9LDOPLYHsD54BLYzbwhAR0e7UcwkmfnecQ>
X-ME-Proxy-Cause: dmFkZTE4K6JMrxd6sPzZVNrePGCzWSArxKGqIFy2UwUC7nS/ZY+sStdcZ7vmPmE2pNoHZC
    9MiqcQ5OXckdWGFiy01IJr2JkZ+n3p+fcnek7D1Qwk8LgHRtAPwJ3G0I5cz7ZhSuemTIJc
    i9Rs6SyTtRrS0p1PgXmcVZpifTNEIm8RuZjsFaFCWemyhP462rhvuOdftkbms6ekvvuLIV
    6HeACEZ35ia1OWZxWsqljJDvRhxvUU8yfY+GnRLK37wYdoIiqubcn305EIee0gH5ypsRyC
    0b6zJacisih6eDtoNCnZwnv1woWj2R2DHm/YruUPQexvu5t1hokHp9I+EwChY3zqidyUlh
    FkDPWTgUsG1BaWyjaO/P3caKqgWDdCEJRSoCdkNcFFAjxp1cTwrL9pXxE57R8gujZM7VZx
    0PJ68qc1r8/rQWBJQfEeoQ3GoG5RPClwyDG6mL3wAVQzIZRB5sDqCd/goM2p921zqE4cU0
    1L1QKCxf8voFIoabFptxW7ViLhwMGHEK5FqHfCl27EiG2ib1oCDzGhEOIbjcr7fr4NebSb
    ZKFvBiTuWEmCf0vUllDZ1lVeN8MAludnwCy78B4HfhpPRN4WCzgousGq+l9V19IvpBDf/E
    DY2xfo6R8pMm6yNTAJjfxAkJX2kzwq+cGfxR25YBruK4CGKpNo4nUFomXCxQ
X-ME-Proxy: <xmx:FLOnavVaHlyZiMxq6AH84MyBzrU-52OAzTcVE3HMr8Q9cCUh4H67ZA>
    <xmx:FLOnagMcz8Uqkucq1BGoKj0cXF32OVAVANKKgtB64NjE9LR_Qe0RVA>
    <xmx:FLOnai1yArCVXhJ-GIf9qcflF94pwoxtXjHXsX84_1VEbe6TeeeCnw>
    <xmx:FLOnakQm5jrqeQrxwEZYRMLgue0AirR74I2jBR_aucKQo2XIXYBc9w>
    <xmx:FLOnatM-3QmtqufLe6vzE67I1dWhCc_Z51X5_1c6Uyiz32BcxhgQLWgW>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:51 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:38 +0200
Subject: [PATCH v2 08/13] arm64: dts: apple: t6030: Fix most property-order
 dt-check-style issues
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-8-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=16105; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=C7S7XHfxQnp5uE+3F+9w2T8pnzHGI5LbglHOzy5r0d0=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm5mvaV6p9t+QF+/KMNNhxZIlj+sVvLTee9XdPvdPX
 lpDwHVqRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgImkPGX4w3P8reaHJf/uCXd8
 rLHUP83kHp/usvuOk6vNo+J5gQwb+RkZGsWKbJkmZ510jF4kcWC57UmW39fDv9Zkutgx/V93PJW
 THQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

t6030-pmgr.dtsi is left unchanged because future additions or
modifications will be sparse.

Not fixed are

| [property-order] property 'd-cache-size' out of canonical order (should sort before 'enable-method')

for all CPU nodes to keep cache related properties together. A blank
line is added before 'd-cache-size' to attenuate this grouping for human
consumption.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6030.dtsi | 218 ++++++++++++++++++-----------------
 1 file changed, 113 insertions(+), 105 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index 0b5824c9f1bf..71b75a59f695 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -81,179 +81,190 @@ core5 {
 		};
 
 		cpu_e00: cpu@0 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x0>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e01: cpu@1 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x1>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e02: cpu@2 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x2>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e03: cpu@3 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x3>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e04: cpu@4 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x4>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_e05: cpu@5 {
-			compatible = "apple,sawtooth";
 			device_type = "cpu";
+			compatible = "apple,sawtooth";
 			reg = <0x0 0x5>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* to be filled by loader */
-			next-level-cache = <&l2_cache_0>;
-			i-cache-size = <0x20000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x10000>;
+			i-cache-size = <0x20000>;
+			next-level-cache = <&l2_cache_0>;
 		};
 
 		cpu_p00: cpu@10100 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10100>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		cpu_p01: cpu@10101 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10101>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		cpu_p02: cpu@10102 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10102>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		cpu_p03: cpu@10103 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10103>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		cpu_p04: cpu@10104 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10104>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		cpu_p05: cpu@10105 {
-			compatible = "apple,everest";
 			device_type = "cpu";
+			compatible = "apple,everest";
 			reg = <0x0 0x10105>;
-			enable-method = "spin-table";
 			cpu-release-addr = <0 0>; /* To be filled by loader */
-			next-level-cache = <&l2_cache_1>;
-			i-cache-size = <0x30000>;
+			enable-method = "spin-table";
+
 			d-cache-size = <0x20000>;
+			i-cache-size = <0x30000>;
+			next-level-cache = <&l2_cache_1>;
 		};
 
 		l2_cache_0: l2-cache-0 {
 			compatible = "cache";
 			cache-level = <2>;
-			cache-unified;
 			cache-size = <0x400000>;
+			cache-unified;
 		};
 
 		l2_cache_1: l2-cache-1 {
 			compatible = "cache";
 			cache-level = <2>;
-			cache-unified;
 			cache-size = <0x1000000>;
+			cache-unified;
 		};
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 	};
 
 	soc: soc {
 		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
-
 		ranges;
-		nonposted-mmio;
+		#address-cells = <2>;
 		/* Required to get >32-bit DMA via DARTs */
 		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
+		nonposted-mmio;
+		#size-cells = <2>;
 
 		i2c1: i2c@289014000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x89014000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 890 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c1_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c1>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -261,14 +272,14 @@ i2c1: i2c@289014000 {
 		i2c2: i2c@289018000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x89018000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 891 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c2_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c2>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -276,14 +287,14 @@ i2c2: i2c@289018000 {
 		i2c3: i2c@28901c000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x8901c000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 892 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c3_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c3>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -291,14 +302,14 @@ i2c3: i2c@28901c000 {
 		i2c4: i2c@289020000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x89020000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 893 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c4_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c4>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -306,14 +317,14 @@ i2c4: i2c@289020000 {
 		i2c6: i2c@289028000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x89028000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 895 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c6_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c6>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -321,14 +332,14 @@ i2c6: i2c@289028000 {
 		i2c8: i2c@289030000 {
 			compatible = "apple,t6030-i2c", "apple,t8103-i2c";
 			reg = <0x2 0x89030000 0x0 0x4000>;
+			#address-cells = <0x1>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 897 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c8_pins>;
 			pinctrl-names = "default";
-			#address-cells = <0x1>;
-			#size-cells = <0x0>;
 			power-domains = <&ps_i2c8>;
+			#size-cells = <0x0>;
 
 			status = "disabled";
 		};
@@ -336,8 +347,8 @@ i2c8: i2c@289030000 {
 		fpwm0: pwm@289040000 {
 			compatible = "apple,t6030-fpwm", "apple,s5l-fpwm";
 			reg = <0x2 0x89040000 0x0 0x4000>;
-			power-domains = <&ps_fpwm0>;
 			clocks = <&clkref>;
+			power-domains = <&ps_fpwm0>;
 			#pwm-cells = <2>;
 
 			status = "disabled";
@@ -346,26 +357,25 @@ fpwm0: pwm@289040000 {
 		serial0: serial@289200000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x89200000 0x0 0x1000>;
-			reg-io-width = <4>;
-			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 866 IRQ_TYPE_LEVEL_HIGH>;
 			/*
 			 * TODO: figure out the clocking properly, there may
 			 * be a third selectable clock.
 			 */
 			clocks = <&clkref>, <&clkref>;
 			clock-names = "uart", "clk_uart_baud0";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 866 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&ps_uart0>;
+			reg-io-width = <4>;
 
 			status = "disabled";
 		};
 
 		pmgr_gfx: power-management@290e80000 {
 			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			reg = <0x2 0x90e80000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-
-			reg = <0x2 0x90e80000 0 0x4000>;
 			/* child nodes are added in t6030-pmgr.dtsi */
 		};
 
@@ -373,6 +383,12 @@ pinctrl_ap: pinctrl@347100000 {
 			compatible = "apple,t6030-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x47100000 0x0 0x4000>;
 
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl_ap 0 0 224>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 273 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>,
@@ -383,15 +399,8 @@ pinctrl_ap: pinctrl@347100000 {
 				     <AIC_IRQ 279 IRQ_TYPE_LEVEL_HIGH>;
 
 			power-domains = <&ps_gpio>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_ap 0 0 224>;
 			apple,npins = <224>;
 
-			interrupt-controller;
-			#interrupt-cells = <2>;
-
 			i2c1_pins: i2c1-pins {
 				pinmux = <APPLE_PINMUX(37, 1)>,
 					 <APPLE_PINMUX(36, 1)>;
@@ -425,21 +434,20 @@ i2c8_pins: i2c8-pins {
 
 		pmgr: power-management@350700000 {
 			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			reg = <0x3 0x50700000 0 0x14000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-
-			reg = <0x3 0x50700000 0 0x14000>;
 			/* child nodes are added in t6030-pmgr.dtsi */
 		};
 
 		aic: interrupt-controller@351000000 {
 			compatible = "apple,t6030-aic3", "apple,t8122-aic3";
-			#interrupt-cells = <3>;
-			interrupt-controller;
-
 			reg = <0x3 0x51000000 0x0 0x184000>,
 			      <0x3 0x51040000 0x0 0x4000>;
 			reg-names = "core", "event";
+
+			#interrupt-cells = <3>;
+			interrupt-controller;
 			power-domains = <&ps_aic>;
 		};
 
@@ -447,6 +455,12 @@ pinctrl_nub: pinctrl@3641f0000 {
 			compatible = "apple,t6030-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x641f0000 0x0 0x4000>;
 
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl_nub 0 0 37>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 472 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 473 IRQ_TYPE_LEVEL_HIGH>,
@@ -456,21 +470,14 @@ pinctrl_nub: pinctrl@3641f0000 {
 				     <AIC_IRQ 477 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>;
 
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_nub 0 0 37>;
 			apple,npins = <37>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
 		};
 
 		pmgr_mini: power-management@364280000 {
 			compatible = "apple,t6030-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
+			reg = <0x3 0x64280000 0 0x4000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-
-			reg = <0x3 0x64280000 0 0x4000>;
 			/* child nodes are added in t6030-pmgr.dtsi */
 		};
 
@@ -486,13 +493,12 @@ pinctrl_smc: pinctrl@36c820000 {
 			compatible = "apple,t6030-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x6c820000 0x0 0x4000>;
 
-			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-controller;
 			gpio-ranges = <&pinctrl_smc 0 0 18>;
-			apple,npins = <18>;
 
-			interrupt-controller;
 			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 545 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 546 IRQ_TYPE_LEVEL_HIGH>,
@@ -501,12 +507,22 @@ pinctrl_smc: pinctrl@36c820000 {
 				     <AIC_IRQ 549 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 550 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 551 IRQ_TYPE_LEVEL_HIGH>;
+
+			apple,npins = <18>;
 		};
 
 		pinctrl_aop: pinctrl@374824000 {
 			compatible = "apple,t6030-pinctrl", "apple,t8103-pinctrl";
 			reg = <0x3 0x74824000 0x0 0x4000>;
 
+			clocks = <&clkref>;
+
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pinctrl_aop 0 0 54>;
+
+			#interrupt-cells = <2>;
+			interrupt-controller;
 			interrupt-parent = <&aic>;
 			interrupts = <AIC_IRQ 394 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 395 IRQ_TYPE_LEVEL_HIGH>,
@@ -516,26 +532,18 @@ pinctrl_aop: pinctrl@374824000 {
 				     <AIC_IRQ 399 IRQ_TYPE_LEVEL_HIGH>,
 				     <AIC_IRQ 400 IRQ_TYPE_LEVEL_HIGH>;
 
-			clocks = <&clkref>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_aop 0 0 54>;
 			apple,npins = <54>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
 		};
 	};
 
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
-		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
 	};
 };
 

-- 
2.55.0


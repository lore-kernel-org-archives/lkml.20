Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794781808;
	b=y1Vl5IFHUQb3gRp00Wxy0Xz+zC4EnqnZ8pdBRE/oqRLZw95EjtHmzgbnhAhJZKvCNRrc
	 ZvUCG4mR85GoXUdO0TxbxqVa0WW5IRrOJN4rkvTJkgq72e5euTZgLz7orwRZb+n9Z69Co
	 brWSipC6q1hbZUtCBXjGtBR8FmZwHeKVHowm1ugRTOvvj+voY1fkF+cR5lbIAGgQJcVmO
	 xfUnKCXEQ/xyk6mz4l8uPd0+2G7+iZsT8inAiPdmSbMVqh2gl4sLGaKzCTZ4flJneYUFm
	 jONJYvktDxNHJMZFhXm2bJROWGWNytuQgefEfMxCcx8rgVvYkfhLahIUQUe52cy3egw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781808;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CDkGCQB6W2en1DTCIjxdwqRAsiPLlKjviAdTe/duEdY=;
	b=pwu5GLzFWiTlce3ypSx04BmX4StXVGSWuG1rM8g+li55kmTnezOeA4/E/iLGDTVTln/j
	 FrznrpLc+sguV6I9xGNPqWd1meqD25UmVczLFFhcFiqUSHVMeAgsk1AJErZUoLGsy4cM1
	 ChlZaJHPDCbXrfJKAbdvMMbfd/WH6OgtnRmQXuoHdfgJpfNkEbFWe6cOZFyJZ+1nRyp0l
	 qeWnCR9/mou3WgNskdF1Ey+iXZGQqO54D7DjiQlX5bKIsutJMiOXuIh5wcF9kmXtCGuOe
	 Yo+YoVBIldG4bn0pmo8hF07MpYwbN50GNtLDXBkC0Yiv3uRDNnok29iUMXHNtlpHN1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dz1UYDCE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7FC606A895;
	Sun, 15 Nov 2026 22:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dz1UYDCE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794781807;
	b=yBfx3AtiSQkNwrO7F1ekTSW4IYRcW4ZX1H8+j09+R2WFOg4NDWwcFWpItSqvSNhDCxGa
	 pfeSqZb1o3TP++rMgZsstRw0KBrFv3vsuv/5NS/swJ/aJfknuChfT9PKcpbq9kMUXq9Vc
	 +JSvAxAaWWqlmh5UqUdx4HlPjOYTOlK1lNsRkp5KQTKzByzA2LopjsHfieROXzGxFkMQ7
	 +z2i3pt1dUlBUrNIDOxqnofpg3f+VfYmgnwM28Wc22PJ1Ej04D6c+wIZzXDCL6fRBYc6H
	 tGsg80VdTR/abKK5fNqRHhovgXLI8f8pTqPCw5uG6OwgrwsRlxZuLrq6Gm4fDLrCmKw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794781807;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CDkGCQB6W2en1DTCIjxdwqRAsiPLlKjviAdTe/duEdY=;
	b=u8D7Uilyb2n/rs7F4GZtqGvtSSAqoNbFUYhiICR7X0RNV/zPct3iBz0ybe4NnuYDvkFN
	 qwv2XPMkOI3vrXRliSItvcvFl8gm9DBaRIo6KvI4uP00Px6qlDOs5lC5yHriv8Jg+xJx1
	 6hBACzXjJb61caBTx1UyO8g8+aPECj8Wb9Bgk9789/s3MVk0O9cnXXxKqdVu0EoustEUJ
	 sIflgNHIbcCIg7i7PAGJL34+d3rS3em5Hl8fEmnTJvmc5w6Sdbb9H2d1S4CZ3aFO3gc5D
	 2VjNF4sqFnYlGLyG9ZQUXJRscXPN2SHiie7VtYwTKsb8X3MlIpBoEYd/1Q/TclBmpFw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1CB801F000C8;
	Sun, 15 Nov 2026 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781807;
	bh=CDkGCQB6W2en1DTCIjxdwqRAsiPLlKjviAdTe/duEdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Dz1UYDCEDGSMVuJE6jmOCJ/mg+KRvHQvXq1NIeaOVg7V5QcoeLyKMd9+Dx6euI7oS
	 +WlhauoE+64LDufvWgMsh9TDqI0oAzI7BtXyN4G1tkAea1/IHDpnHHeNLqlNXH0fW7
	 n5s5slWT+998HrC14B/os2+CvhEso+dChpIsvxxbBNBieAhFLf3VX4u4mJqYgesKtM
	 NkjRLMcd0k2Gqe9Tn5iT/jzKULfPrM65SQ0hz0ZxHH4yVhgZUv5K8bxajt2qVFFH+d
	 SqHmJ9V/vpFHdsiydaYaTL7/+XgiVTeV5f5JgDS1NUwfgMhQvhBDdQDl0W4Ew2+9HX
	 AjUc99+4+FkVA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9C8874A22C;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sun, 15 Nov 2026 23:29:39 +0100
Subject: [PATCH 4/7] arm64: dts: amlogic: g12: Add ranges to periphs
 pinctrl node
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
Message-Id: <20261115-fix-amlogic-dt-warnings-v1-4-94cbd67a32ea@aliel.fr>
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2669;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=t9HskvsPsw4IgT4qLZYW9JrAwDATbsMB7Lv8ZE1CwUo=;
 b=kA0DAAoWKo0VA3vnMSIByyZiAGr6MmejtwJnEQg19pSjQcrE9LORMtQgCVQ8eJJYKC/cgelkH
 4h1BAAWCgAdFiEEj505yO7Txcz1vCdkKo0VA3vnMSIFAmr6MmcACgkQKo0VA3vnMSLC3gEA9d0n
 NYxml+vTlIsJDpaiVZ28E7ZQUdmyMY6DixkeXt8BAPAbiw6WcN5G9J1pBnwxCVUagh8fWWTjj6L
 0FOhCnR8N
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr
Content-Transfer-Encoding: 7bit

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Building the amlogic DTBs with W=1 reports the following warnings
for the periphs pinctrl node:

  meson-g12-common.dtsi:271.33-1554.7: Warning (unit_address_vs_reg):
  /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no
  reg or ranges property
  meson-g12-common.dtsi:1768.27-2040.6: Warning (unit_address_vs_reg):
  /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg
  or ranges property
  meson-g12-common.dtsi:271.33-1554.7: Warning (simple_bus_reg):
  /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges
  property
  meson-g12-common.dtsi:1768.27-2040.6: Warning (simple_bus_reg):
  /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
  meson-g12-common.dtsi:2239.23-2279.6: Warning
  (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000:
  unnecessary #address-cells/#size-cells without "ranges", "dma-ranges"
  or child "reg" or "ranges" property

The pinctrl node has no reg property of its own, and its empty
"ranges;" does not describe which address space is translated to the
children

  /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells
  without "ranges", "dma-ranges" or child "reg" or "ranges" property

The DSI controller node has no child nodes with a reg property,
so #address-cells and #size-cells serve no purpose. Remove them.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3135566df880..434df25f6247 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -272,7 +272,7 @@ periphs_pinctrl: pinctrl@40 {
 					compatible = "amlogic,meson-g12a-periphs-pinctrl";
 					#address-cells = <2>;
 					#size-cells = <2>;
-					ranges;
+					ranges = <0x0 0x40 0x0 0x40 0x0 0x31c>;
 
 					gpio: bank@40 {
 						reg = <0x0 0x40  0x0 0x4c>,
@@ -1769,7 +1769,7 @@ ao_pinctrl: pinctrl@14 {
 				compatible = "amlogic,meson-g12a-aobus-pinctrl";
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges;
+				ranges = <0x0 0x14 0x0 0x14 0x0 0x24>;
 
 				gpio_ao: bank@14 {
 					reg = <0x0 0x14 0x0 0x8>,
@@ -2247,8 +2247,6 @@ mipi_dsi: dsi@7000 {
 				clock-names = "pclk", "bit", "px";
 				phys = <&mipi_dphy>;
 				phy-names = "dphy";
-				#address-cells = <1>;
-				#size-cells = <0>;
 				status = "disabled";
 
 				assigned-clocks = <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,

-- 
2.43.0



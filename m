Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70292C11CA;
	Mon, 14 Sep 2026 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388362; cv=none; b=dlufJoQ36hIVBnuskrDwnA3xKAmrF3FOgyMwjKbt1T7y+Wv/s42Z/rkEgSzRHwLSuonN++yIMhPGVSFB+ysV33kzsasHXXq+NyW67RG4V6JGehjyYE5VHRfAH+n1YEywGxXKLSy7yBXYcAkg9ZMp92IxCVQ0OrLC4P+QtTRJEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388362; c=relaxed/simple;
	bh=p8LIjC4ZN6gd8P1OT3ukIB7Ru8KZ2eHQH3dTGQxy188=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/VHRPqvnzyGywbJoNShgIfn9Uu0vavGeGmWIO91mqNL4s+PGnXpwZ5Z5MsPaQxZArU5Uapfynw8NbUWNXU1FiFLwp6yJe/8CY9zbTyD5IEq8mSZ0Jz56yTEoAN0PmO5FK5KmDR6BWnGzwzND1VB2jJsyCkPa7y9rtY2ijlNubE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org
X-PTX-Original-Recipient: lucas.sinn@wolfvision.net
X-PTX-Original-Recipient: conor+dt@kernel.org
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-PTX-Original-Recipient: heiko@sntech.de
X-PTX-Original-Recipient: krzk+dt@kernel.org
X-PTX-Original-Recipient: p.zabel@pengutronix.de
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-PTX-Original-Recipient: devicetree@vger.kernel.org
X-PTX-Original-Recipient: robh@kernel.org
X-PTX-Original-Recipient: s.hauer@pengutronix.de
X-PTX-Original-Recipient: linux-rockchip@lists.infradead.org
X-PTX-Original-Recipient: mchehab@kernel.org
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D6A7D200A43;
	Mon, 14 Sep 2026 14:19:10 +0200 (CEST)
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 14 Sep 2026 14:19:04 +0200
Subject: [PATCH v3 1/4] media: dt-bindings: Add Rockchip JPEG decoder
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-rockchip-jpegdec-v3-1-3583c376d0d2@pengutronix.de>
References: <20260914-rockchip-jpegdec-v3-0-3583c376d0d2@pengutronix.de>
In-Reply-To: <20260914-rockchip-jpegdec-v3-0-3583c376d0d2@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789388350; l=4988;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=p8LIjC4ZN6gd8P1OT3ukIB7Ru8KZ2eHQH3dTGQxy188=;
 b=KoCYKg3ZyPmA+BHc6auoElyRv1EZc0I0obZSus3Gjh26YicaMK1CiCdno8yJGY9eFRP0oyw69
 AzTmr/FELz1BNE/Sz4jejpFERm4pLMEZuezsDM42bc3jyF4ZpQh/xz8
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=

Add a devicetree binding schema for the JPEG hardware decoder Rockchip
integrates into a number of its SoCs.  Documents the single register
window (task registers plus the LLP link-table block at offset 0x300),
the decode interrupt, the AXI and AHB clocks and resets, the IOMMU and
the power domain.

The core is not tied to one SoC.  Downstream it is known as the VDPU720
and the same block sits on the RK3528, RK3562, RK356x, RK3576, RK3588 and
RV1126B, with only the clocks, the resets and the power domain differing,
none of which this schema constrains.  A compatible per SoC is all it
takes to cover them; the RK3568 and the RK3588 are the two that have been
tested and are enabled here.

The resets and the power domain are required.  The block cannot be
reached with its domain off, and the driver falls back to pulsing the
reset lines when a frame times out and the in-block soft reset does not
complete, which a node without them would leave with no way to recover.

The IOMMU stays optional.  The driver never refers to it, it is a platform
integration detail, and rockchip-vpu.yaml does not require it for the
other codec blocks on these SoCs either.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../bindings/media/rockchip,rk3568-jpegd.yaml      | 92 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 ++
 2 files changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
new file mode 100644
index 0000000000000..27d85f17922ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-jpegd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip JPEG Decoder
+
+maintainers:
+  - Lucas Sinn <lucas.sinn@wolfvision.net>
+  - Sascha Hauer <s.hauer@pengutronix.de>
+
+description:
+  Rockchip's in-house JPEG/MJPEG hardware decoder, known downstream as the
+  VDPU720.  The same core is integrated into a number of Rockchip SoCs, which
+  differ only in the clocks, resets and power domain they are wired to.  A
+  dedicated Link List Processor (LLP) register block, located at offset 0x300
+  within the same register window, allows the hardware to decode a chain of
+  frames autonomously ("link mode").
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3568-jpegd
+      - rockchip,rk3588-jpegd
+
+  reg:
+    maxItems: 1
+    description:
+      The decoder register window.  It covers both the task (function)
+      registers at offset 0x000 and the LLP (link table) registers at
+      offset 0x300.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AXI clock
+      - description: AHB clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ahb
+
+  resets:
+    items:
+      - description: AXI reset line
+      - description: AHB reset line
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    video-codec@fdb90000 {
+        compatible = "rockchip,rk3588-jpegd";
+        reg = <0xfdb90000 0x400>;
+        interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru ACLK_JPEG_DECODER>, <&cru HCLK_JPEG_DECODER>;
+        clock-names = "axi", "ahb";
+        resets = <&cru SRST_A_JPEG_DECODER>, <&cru SRST_H_JPEG_DECODER>;
+        reset-names = "axi", "ahb";
+        iommus = <&jpegd_mmu>;
+        power-domains = <&power RK3588_PD_VDPU>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f8253ed..f8b4921843d27 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23424,6 +23424,14 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
 F:	drivers/media/platform/rockchip/rkisp1
 F:	include/uapi/linux/rkisp1-config.h
 
+ROCKCHIP JPEG DECODER DRIVER
+M:	Lucas Sinn <lucas.sinn@wolfvision.net>
+M:	Sascha Hauer <s.hauer@pengutronix.de>
+L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-jpegd.yaml
+
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Aurelien Jarno <aurelien@aurel32.net>

-- 
2.47.3


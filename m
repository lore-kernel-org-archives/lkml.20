Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFBE46D0A0;
	Fri, 25 Sep 2026 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790336733; cv=pass; b=W3PnhhoilinNNGLXrkiK6oDBZs2AAG3sYiShMF3JaErvuGzbCoJEwT6M04dKWQMj7rBf037UhNPxPXcPU02S00s5lzzqqsjHApzAYyQW99nP1NPEZ6dPCBi5ElcIUVuPZL7TRg5qRzHiS6s28zQ7sHx27iJzl9ZzXH8lD9cKGb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790336733; c=relaxed/simple;
	bh=gelfVXPRUI9lntnkL+U4FhD1/gZ6OlA0mb0S8llJ7A0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=leiyhEXkEesOdAG1PHyJAuskiIUXEW6TiSfuK1s+1VsqkVpG2r3bAyPSH/s8RPH5a6B/Q+XYBwYwNERVwKc2WdJFOvo/lMuLLI3xgQ8UKPTCIlPr1KzO4G9Z1xBRWVUyqJKHI8Dqm8ACQiBpuK+FULZcIIusEotP5D/Mg3OEs4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=UXm65EgZ; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="UXm65EgZ"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 35A4D2008EB;
	Fri, 25 Sep 2026 13:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73JIQ3h7BNI8yX+F7iHYZ3k7OZlBvEQT7aHQLxKzRog=;
	b=UXm65EgZuoBZ9nYqmQOo/13SUjluJOyFzzkZ4LCalnPVZj6a7EPwLOsj4xqhPKWINepqR8
	1cO+potNnIijqousasKzsYvRmXQMws0OfZA4h0HWZGo8PGiW38oUuBsdBWh67VhgiRtoOn
	yjz0aIrsB8+AoMZlZhBwrmkxPpb1aRvu9vxk60pbK537mjaL7rpw8Asrk2GNIY4cMXTK5m
	pWwxDarosFyoIP1awsuD25NaDhq/dAOCqxXwASX+wgrmTtvuJJG8FCuL4whForP4Tothis
	5xMdaRATlx4d662ReGdRcSPSHs/xMJGZKcHtHMUhkrLWwfRr43gDlkbS6isVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790336726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73JIQ3h7BNI8yX+F7iHYZ3k7OZlBvEQT7aHQLxKzRog=;
	b=RhCx9EHV3PA+te07C9y2xHwnwXK1LAfgq9nv/Gi+B2CfmPScpoTHIRnGA2Gtnn89Gx39dL
	ZHP7naydmZa1ASQ8W14KJ9V9zdj7V6iSzAG0e8EA4VF+QynVGB/zqZDewo974Ox0QAbmb2
	ioQZIzhImcW0Qlm+kJLyfhLCnaY+qh7McocieuOE7HhAhAZDau+1bQlT+NGx85hNOmrP6S
	hc0Km09EU0onl4CM5T1X7lMz+KExA+AnW+eYH68MrQvxkBHUaP43PT+yeJOBR0Aw7LQNqi
	7OiAO3Y3/DNBkUiNc8t47pm1eKqAQC5biB8WWKlPC067OimTY81g66/BNW6GsA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790336726; a=rsa-sha256;
	cv=none;
	b=EQpJEWDgMPrcHbcXCxSPHB1aUhdSM96Rus7HgnXvduMulaIM9PMpdnMOSdLuDv6txp87cU
	nIxjPufErhUMH9McQlyIjvuNDOaxjWG17kOw8HlTpv4oASqJXsBWTzd36bB0sNhes0Lad3
	+qQFNelK5diYXqzONOUdQLezpcHKWWkc8N/ypMBe/tqHG0LmBcLs5CVk45CuaMgUkpwwgM
	xO8GvguoraG0Zw9Rfm/1J3cIp3mYUzNTdrTTIIOiBoySWOwSbspt5GpBGrh3/JZ+HOFEuu
	KZtiiI0AaDnSJdAp+ZDaM/pv0el7p5ZgmZnve5Fv9kZRbxDMeWk4HZuzxgQTyg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 25 Sep 2026 13:45:25 +0200
Subject: [PATCH v5 1/4] media: dt-bindings: Add Rockchip JPEG decoder
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-rockchip-jpegdec-v5-1-30658833cb68@pengutronix.de>
References: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
In-Reply-To: <20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790336726; l=5061;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=gelfVXPRUI9lntnkL+U4FhD1/gZ6OlA0mb0S8llJ7A0=;
 b=yHzTUbq8ZRk/uC0KQqBuQP+vWFz7t0MFMCat+P8x9bVLRPapxt+Uk3vM2K77r9Q8JFDOntkW1
 QWTJDwVXnhgDBn9N/8Xeprmnq7dFR32mBKHShYlRERNgmBW55cLsvD2
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
index cc3cae2e378b3..290c3a1452ea0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23699,6 +23699,14 @@ F:	Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst
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


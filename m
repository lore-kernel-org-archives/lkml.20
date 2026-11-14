Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794615232;
	b=U/LRNWZrylQ7SijjdliqhCoUp7qbU4Vfq/KCMoS0j6kV1dOXFBfVXiPpg+UBEbIDiwQT
	 SLjegnThej4aGojtb6AXhuEvwR4k16OUbqkU8WxtMaJxzSSBV3eKEJh6sTjpWGWv2fIKX
	 LZggk/ioXGId23e/UxfmpWfX6VTHVpMGuPAgA1Dj5QYS4WGcqbv9hE2VVaw/ftl2/ruJ8
	 McbM0+kGDx8w1fRENgJBReCA4e9x2FjogcZD7Avx6K9uoGTOoZ6yiPEv1XgwDFlVjqYn/
	 ogSCz3DBGCQpr2MUfukjk7yXiTZoKoh+FlOb+B/NEbHl2bhDeU7T5hJxrZBtsGaBdjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794615232;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tt3zLwRlEbhHHzfvqBg3SbCShwsAMAa6tuNoWsaaWnE=;
	b=kVkuhJ9RP2RBQ8QVvdZbH2iv023SVJaSDBt70n53uIkuksuG1eNtEXHdCuSS/oWXL6l1
	 bBSqN8bEj2RREM77gmYMgeoWTSbtaarbtrhUStbr6Ft0xERxk/TsXELmvUuUcTxBT9WDx
	 NPXvVqoQZdZOTad8xrzTSQ/7vWbR+gNL+EdW3NATYbEbqbwI96t+iRPn4B4bGQ2SGIhii
	 JkGlf/s7jy0dCq+DfSvWQVXIKUfAdN2sVZJ+02a4crApvTWpsKc7e6AbedmBQ6oH6hwXK
	 HAEP9nX3yeqFsiNVO4V+LcdXyZCiLDGhGUAVfARRb9D34CszZNcnjQ6tmj6SUraaz3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GsNO6W9U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2281C606A334;
	Sat, 14 Nov 2026 00:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GsNO6W9U
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794615231;
	b=byHabmVDx7rx3qAo2JtLnmQIB+E9RGx3avrlkHtT9Zs2JKhYS/BWttpuxD0ybeYCElyh
	 R5Fqzt32ueZEE3to4KgPOi+BhS5rGDns/MuVCJrqWJ9zMoc365deQiYmUrnUf6/ZK2AYe
	 RDcMkg74DcnUij4J+1if77qMVdueXkx5dxPmq4jW3w9oRRFlzb0weg2PKLAIQ1ZlGXPbh
	 5Jg/crFgsU7H6j7dAG2xgOlPXn9jKkwIdkt66xSg28geyvuzYwmwMT+mDdOuYOeq0MFl6
	 yEk31uIsSZr89JHuxG19betu0SDioUh35zZTNb2zBDZDiywIpGkraKl3qgiedrTxsrg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794615231;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tt3zLwRlEbhHHzfvqBg3SbCShwsAMAa6tuNoWsaaWnE=;
	b=HU7ciRT5OtLPjuExmzHw9U0G1OXV9x1/pVarEbL3kUm+LysbfgW0u+HgOZdkCByPdiAU
	 32tpsFSbgOonvOAN8wdxj7cC5QgI23beuTHdpke93Kz/joaRgPGlV6qDNe7HlbEJqjiTK
	 cn8ufZurPTBtvJz9gLLk2cvGw7pPkXVjgBHRaHWUtGwu7HXtukc9HHlTtzanwWzIhZTN5
	 gTMbHjcnk91m5FWbiJOKLIkIvFSGaaXNYZ/Fl0Y6HJywRGhucWB8MqNGRvJvpw3AJ1wCP
	 d5BNjD3BoljbhX9Piecfn32BxXcnD+dBdKTgIMYP8GIEU22qXi0QPxSKhLaBsA4CS5A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 048DC1F000C5;
	Sat, 14 Nov 2026 00:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794615231;
	bh=tt3zLwRlEbhHHzfvqBg3SbCShwsAMAa6tuNoWsaaWnE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GsNO6W9UCL0xMthTVg8wBbf9nSBusLt1+3sl78ODODtPxerzIcHaSTdHDQuWANzxF
	 Y/N5K2GQnjp5NTg9DRG9fjI176zHmU9WcNvtwFFp9ZV5tzAd304tGKMVgSYESsaUyn
	 EgeLUDYrvRCAxlHrIgDl/pBxbwbEXwaEeG+M9hTloVNB9AOB5Y2cGdp9eJgKz2HoSh
	 onjvuCfZEMDdV+Vd0VhzGh+Ef2XnMNRKzF09dh28k7RcSktgpYQi1lF4wI1i8WdCn3
	 x3kvbk+bjIpewqAw6x3GNk93jIurLc7bKsASLqjoOS3MIiEd6jAgyX3Z0VxDw417V8
	 d14CepCWkM+sg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 72E7D49BA6;
	Sat, 14 Nov 2026 00:13:50 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 14 Nov 2026 00:13:50 +0000
Subject: [PATCH 1/3] media: dt-bindings: Add Rockchip IEP2 deinterlacer
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
Message-Id: <20261114-iep2-v1-1-a8edde5a21e1@gmail.com>
References: <20261114-iep2-v1-0-a8edde5a21e1@gmail.com>
In-Reply-To: <20261114-iep2-v1-0-a8edde5a21e1@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Alex Bee <knaerzche@gmail.com>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794615229; l=3973;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ChHZwNhLk4WNiGW3BpdABPaZ57+oP++kU/hOOD04E7I=;
 b=uS4zfwgTX+5ZBvlB6DoFO8TpVG+Ewot7VmL7qXlTShSwggTjUBmz6Sjdtx3T/b/g8AM/3fyXW
 OodGGE+F1E2BjfrznJDqt+oCdEOPnuvAemYgFKzSd7cWsIejY9oKhrY
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Add a binding for the IEP2 deinterlacer of the RK3568 and RK3588 SoCs.
It is a different block from the IEP of RK3228/RK3288/RK3328/RK3399,
hence "iep2". The RK3588 block falls back to the RK3568 compatible:
the vendor kernel drives both with one compatible ("rockchip,iep-v2")
and one driver.

Clock and reset names follow the RGA binding. The resets are optional:
the block has its own soft reset.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../bindings/media/rockchip,rk3568-iep2.yaml       | 95 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++
 2 files changed, 102 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
new file mode 100644
index 000000000000..0c7666de19f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3568-iep2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip IEP2 image enhancement processor
+
+maintainers:
+  - Arun Iyengar <aiyengar1990@gmail.com>
+
+description:
+  Memory to memory video deinterlacer of the Rockchip RK3568 and RK3588
+  SoCs. It has its own IOMMU, with which it shares its interrupt line.
+
+properties:
+  compatible:
+    oneOf:
+      - const: rockchip,rk3568-iep2
+      - items:
+          - const: rockchip,rk3588-iep2
+          - const: rockchip,rk3568-iep2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AXI bus clock
+      - description: AHB bus clock
+      - description: Core clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: sclk
+
+  resets:
+    items:
+      - description: AXI reset
+      - description: AHB reset
+      - description: Core reset
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: core
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
+  - power-domains
+  - iommus
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
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      deinterlace@fdbb0000 {
+        compatible = "rockchip,rk3588-iep2", "rockchip,rk3568-iep2";
+        reg = <0x0 0xfdbb0000 0x0 0x500>;
+        interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cru ACLK_IEP2P0>, <&cru HCLK_IEP2P0>,
+                 <&cru CLK_IEP2P0_CORE>;
+        clock-names = "aclk", "hclk", "sclk";
+        resets = <&cru SRST_A_IEP2P0>, <&cru SRST_H_IEP2P0>,
+                 <&cru SRST_IEP2P0_CORE>;
+        reset-names = "axi", "ahb", "core";
+        power-domains = <&power RK3588_PD_VDPU>;
+        iommus = <&iep_mmu>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f4456f4589a1..b32b7eeb0a9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24285,6 +24285,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
 F:	sound/soc/rockchip/rockchip_i2s_tdm.*
 
+ROCKCHIP IEP2 DEINTERLACER DRIVER
+M:	Arun Iyengar <aiyengar1990@gmail.com>
+L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rk3568-iep2.yaml
+
 ROCKCHIP ISP V1 DRIVER
 M:	Dafna Hirschfeld <dafna@fastmail.com>
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
2.55.0



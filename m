Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794732463;
	b=RJeX2ZE8byLKnYaKfLT5EzZr9JUFb34UopUgLcV72a+P8Cf/d9SMgPViF0NprRpUUwdV
	 6LPxQj+W8B2UAPH3AFCwSsggR2zA5fw2mGjL84aO9XUdw05lwLYWYSINHcqCSZ2kAKygX
	 TaaASdnCq/zR+AZf2kpfWdHRZeqA6skXEF3ska2uKQkUtRAEOYIK3RRvMpOje8VRRJwSk
	 V+hZsFPQSknZNOWnFG6WoWGDfxyP0CC2CVxGTjjvbFZeP4+AvEhc3vEYOiczJFDWDYON4
	 7wezdxfQqNk7XpkvXTHwv6HXpGTGfngnsoJX9DIcCJiaeAhCqJ8Vf8MWwSyIlNlj6qQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732463;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tt3zLwRlEbhHHzfvqBg3SbCShwsAMAa6tuNoWsaaWnE=;
	b=op50l6KSbK3KkglgkjMfKcg0q8HL3SfVyb24OEe5kHCH1zg1+5WLjQb9sPYlWgDU8Vv6
	 /cvHREZAse3siP2nQQdbxPoXfsWNpMS8lLrQiJegDBbTPDE73F5M2yt+REuok1iPb3x6S
	 NvzHXGEE8pQb0YOZUaHgCqxnML/cJMgUjxJixfZm6j0a3ur5MFk/8JeNAcfKBASCSQSre
	 rXsX+DtqczXM5NuO08fECx3lLjHQXSJ4P5hmPTCIGBP4RP7wYpcNcIp+VjUpQMtgk/Axx
	 n7xi4yt6h0k0JBg95onRZRjiirRLHdti1h7SLmt+qptgrHiPzmAhkGnTg/zZUd5riWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6xOnUgl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97232606A323;
	Sun, 15 Nov 2026 08:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V6xOnUgl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794732463;
	b=T7HNH51/GXx9vQKe3lAjyqW+BjevtypEanymiazSlsImQmJHkxjUbqQQItbkoaBHuUcm
	 4DFDEG4MivzKnkOFSDfsNiT4l12B7M01s8kOZJTFTF4DKAPbWM4ugEd5uK8FsdXNm/jCb
	 Qssk/KgCTgPpON/laJF8v6WwhIVMfvCsM8n6bDAk8whX6ONDvgRnyLHViLkXVpn03ArcM
	 BX/yP1UFfmtwEBwST8hwiveBCpvacnoQdXMuH8qXu5y71tNRFPKB7mALl2uto0lnLOlgb
	 qSF+XCG2BoyfCJMuHWSmQp5wqUI/dvH9klfTabygNUHsUnz5t/AuMrv2Ivt9b/j4duA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794732463;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tt3zLwRlEbhHHzfvqBg3SbCShwsAMAa6tuNoWsaaWnE=;
	b=o3t1Qx6qU74bL9nd6uxXZstkssxUZzcj8Xy7vlOSkoVEZc0Ruwrb2EF86pc3KFko+YAR
	 d4MeeKLdM40rXNGfCYS2nfRgjGGQpAiVjexoWXf3ThSPuNbsdg9S7GGyl7HdWPFLebW8H
	 ijeoqM422zmxqqbhSU/oOwFBMpe2NVSv+R+i4DlEOxUlQ2liK+lSWqDpxNyj/RmG1/Wvd
	 Os7um1f32wkAFH2NLCyCEFG6Pz/6s46UlPTM1QMSdrWZY4IX4aR6usDNW5nUGewGp8L1P
	 kiQvqh469xagIm+63vXg15fpfWRcDJWw7BlgfDfl5xcrFrUf4OPB9lN1qeR1Sv/enIg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94C681F000C4;
	Sun, 15 Nov 2026 08:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794732463;
	bh=tt3zLwRlEbhHHzfvqBg3SbCShwsAMAa6tuNoWsaaWnE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=V6xOnUglEeG2ZHbjfE1UbeOn3TF5z63ZdwjnEhTuJt/AuRJ1Wa8Xvg/qCg3neKzw+
	 JaDY9qpDF7FAh4RtTNYnUsQNonZwFQpUDM86kEjujxKjs5/BEXopAkeKNcM8+kAoDF
	 z7equn0exul0+62dbN91/tDZeQH/UqoBtVvq3wHU/QMPWe6IuGObnR4VHaYNZApr2J
	 d1I1oMpU+hyLFIuyvmYEStYqRr/lKJBcZ3Q9aLTbAehEYt999UZSanCUkSjLJsXrsN
	 xx8b/qotgYseRv0m8RsLUKs3yzaClTjFxZifR5kBS9f7h5QqQd22xB9QtN1Cs2Gl42
	 wW7JkvQoKmbWg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 100714A002;
	Sun, 15 Nov 2026 08:47:42 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sun, 15 Nov 2026 08:47:42 +0000
Subject: [PATCH v2 1/3] media: dt-bindings: Add Rockchip IEP2 deinterlacer
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
Message-Id: <20261115-iep2-v2-1-3d8798cd9a55@gmail.com>
References: <20261115-iep2-v2-0-3d8798cd9a55@gmail.com>
In-Reply-To: <20261115-iep2-v2-0-3d8798cd9a55@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794732461; l=3973;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ChHZwNhLk4WNiGW3BpdABPaZ57+oP++kU/hOOD04E7I=;
 b=GMNGd1IctVsCad3503Cxem0D/wvD8iX2XTLiziLurXuh92OaeUZOru9C3ms6+REWAICXf0tbg
 hK6SE+93bLpDay4kLFR+xlh9oHd0FlwIDGW+z8gR/8b2FIEMucI8YiV
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



Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305286;
	b=TL1+ZX5P+Sh4snyQ/Awy501ALt6++9u0hibB8QTCRmir/v1oLSwlq1+27A0rKdrjeIy2
	 1JycEZBf4FE0Qq7hZWpAVFHjR2LZJbaNr1SXEYLY3aSpq8Uzv8Jt11DXGumqM+ZxqBQxR
	 DmSsTUAFgDiFFnUNOPIHnL/Yrv9h6dhsdf6sPhxrFXiufRvDBQWM8yY5Tcqdc0X13ufhv
	 smpTWyVxx5KqjZsgaVK4WSYiaP5GxTt22MMqb56nULfeWhv1K5MIf4/Q1KxQVACFgAVdE
	 Au8ZYBaGOrUYr9r0s5WpkpIUIWS8MQOSMLgs0v4okz5VakOwVWoCfYdG5PoEqXFgmFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305286;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1v5MOvJRb0ZumFsnpO/7N7S2x7bW1RJdhbdwRNR3VDE=;
	b=JPz1CY4pIcAmV7QI3FMhgZ8G4a11A/5DNfX6I6nxUuvdRRHkIRRYvjpgn0l70uRUL0tu
	 SQ7w63GWT4yxJ26enMyL7/IbvkdVHq37a1csWFKHnBsipPnbooqpj6ufyvpBXskvhvvdR
	 3uKRElHORNzutBCidOpsKKkm+U2dBjKWExwB7OsW6FxzQOJCnp7R09Ezht8eXWH/sssp1
	 vmeJ9eeDOtA81vmZM+B9bZtq3vbDp5ftJa6TURX/fXunvc/MOU9ie+IrpsmRf+N2ZD1Sj
	 PjR8tNAnvI0DuA2M4/XozNxXAzLvJGw0pERhZ/qwx9bEuBA5f1ItDT6dbyNBlLKKtrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ic5Lvv/r";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20895606A32E;
	Tue, 10 Nov 2026 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ic5Lvv/r
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794305285;
	b=igSDVUHZ1oMxCYbB6adbC20Q6mZuul4ciVbLSsNy09+/gRhcD0731gRD2RY1W4GGZ82T
	 fTUZ2J0NDx2lI9vTKSQ4kTdcrzv7oY+/2NyO7GIKLbB5clqYvmK80I3brW/ItYKul2ceZ
	 /UeIbtGxAA/B5nQUc8VQusI3ZXrsyGrbi7KVvsY6ZTOrsifLSJMXdvAO7mTfGHNSArBcj
	 DbEiShPbX0GbfxdtgZTBSe07b+vythv9vP102mynN9GWDBXYhySa/Xs4p/f3t+0q57pUb
	 UhlSuycihKiOdu0JqXUI8kcwa71DGu6RcCEwEeuHW7kdV+o0SoLeBJrhonN4XF/1L6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794305285;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1v5MOvJRb0ZumFsnpO/7N7S2x7bW1RJdhbdwRNR3VDE=;
	b=XVxMAOTY4L+WljYG4locFxnHVpVnpd/eTSmPwyLXnjV56dGo02LRRV8TI8ORqNF2qJnX
	 RdVFcs01a/VmU44bs+U5rVSYLZr6VxAwsL+cvCBiNYvKZ4HfrlyUUJL2uJugn4RDLP6n9
	 73X34gONmYO6cnX83Va+sqdQRA5ZPqzjQrK2mGte4DHfQ42bKEfTDeuNN9jeZKYVkBgkU
	 g1yZNsMPC17NKgpwkNaOsgRg0utSM1q4uomNRKL6rdn3xv8KuJLf1mjM1CvErmDhwaNEj
	 MVKeP7/d6wxa8r3LuC3rcKiTasQvfmkjwfYyHlT46cI8nxNmkPXYYCiOsTLWkPwHjDg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADB091F008A3;
	Tue, 10 Nov 2026 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305285;
	bh=1v5MOvJRb0ZumFsnpO/7N7S2x7bW1RJdhbdwRNR3VDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ic5Lvv/r6yv/QygkzefpHR1vASoSz/dCqM7iu1Zh9ObqVt0Wu67DBPCWwyVLprmql
	 +jLGVY3jvSYU9WVc3anyrXnQBOJ73uEUF7RPnEpLYQ/4a+1QaxLPcs7XOr1atwfmQu
	 bUwM0iWSrs8nNmjeIvQtelMVrFkKI73E1h3Fa3Eo4UhNgROrgTe127hzpi4KF9TqN5
	 sopE3UissfzoGpDIMCBvefqjIdV98Z8MvzUzMBP+Sav/jNzy5oG6O8K0sdQeEgdkJf
	 /eXjHMKH9MVngNfjQ/PHjIV28UTTAHpZHuqSfehyVRMqE07tGbqqVq6PxA39LRCQc7
	 4gqNMsuBJ2++g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4198D48AB2;
	Tue, 10 Nov 2026 10:08:04 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:08:03 +0000
Subject: [PATCH RFC 01/12] dt-bindings: media: Add the Rockchip VEPU580
 video encoder
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
Message-Id: <20261110-rkvenc-v1-1-ea8b47122d8c@gmail.com>
References: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
In-Reply-To: <20261110-rkvenc-v1-0-ea8b47122d8c@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Jiaxing Hu <gahing@gahingwoo.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794305283; l=4162;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Ts7pMXWf/I5T8ZMd/4JVnE7tMKOGl43GA03EZ8jGtCE=;
 b=slS1xDOmb7x2dV8Ky2vEl4BO6JnpFvJGs8WnFNXv8Ue3qqE3ADlkIEU//HEdSPQ4V/S8GfyUI
 cOlq1p3EPn7DzHGsqpNh9qy+2prvMs8j7jgP9nUz5sTvEKpa6asd/HH
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The VEPU580 (RKVENC) is the H.264/HEVC video encoder of the RK3588. The SoC
has two identical cores at 0xfdbd0000 and 0xfdbe0000, each with its own
clocks, resets, power domain, interrupt and IOMMU.

Describe each core as an independent node. Unlike the vendor kernel, which
groups the cores under software-only "mpp-service" and "ccu" nodes, nothing
in the hardware ties the cores together, so how they are used (one job per
core, or both cores on one stream) is left to the operating system.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 .../bindings/media/rockchip,rk3588-vepu580.yaml    | 93 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++
 2 files changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3588-vepu580.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3588-vepu580.yaml
new file mode 100644
index 000000000000..2b52b17de93d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3588-vepu580.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,rk3588-vepu580.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip VEPU580 video encoder
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
+  The VEPU580 (also called RKVENC) is the H.264 and HEVC video encoder of the
+  Rockchip RK3588. The SoC has two identical encoder cores, each with its own
+  clocks, resets, power domain, interrupt and IOMMU. Every core is described
+  by its own node; the operating system may use the cores independently or
+  together.
+
+properties:
+  compatible:
+    const: rockchip,rk3588-vepu580
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
+      - description: Encoder core clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: core
+
+  resets:
+    items:
+      - description: AXI bus reset
+      - description: AHB bus reset
+      - description: Encoder core reset
+
+  reset-names:
+    items:
+      - const: aclk
+      - const: hclk
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
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-codec@fdbd0000 {
+            compatible = "rockchip,rk3588-vepu580";
+            reg = <0x0 0xfdbd0000 0x0 0x6000>;
+            interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH 0>;
+            clocks = <&cru ACLK_RKVENC0>, <&cru HCLK_RKVENC0>,
+                     <&cru CLK_RKVENC0_CORE>;
+            clock-names = "aclk", "hclk", "core";
+            resets = <&cru SRST_A_RKVENC0>, <&cru SRST_H_RKVENC0>,
+                     <&cru SRST_RKVENC0_CORE>;
+            reset-names = "aclk", "hclk", "core";
+            power-domains = <&power RK3588_PD_VENC0>;
+            iommus = <&vepu580_0_mmu>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..57d899b1229f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24322,6 +24322,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP VEPU580 VIDEO ENCODER DRIVER
+M:	Arun Iyengar <aiyengar1990@gmail.com>
+L:	linux-media@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/rockchip,rk3588-vepu580.yaml
+
 ROCKCHIP XPCS DRIVER
 M:	Coia Prant <coiaprant@gmail.com>
 L:	netdev@vger.kernel.org

-- 
2.55.0



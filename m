Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689D546A5F2;
	Mon,  5 Oct 2026 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193583; cv=pass; b=g5JPILrHOAohOmykORezwiUuZNrkxx1Tt2IZNQZ84HKNyNmK1P+08DzKw3bDrLhs9zOXwX3ZJmponZ4onbYi5e7FH0sDKzI90ShA9hau3iJQtIb8uAmYyJu33pW8jr4x3dDLz0dIh96uFhtcWMliBv7JpU7TP468p+Yzb+SbwD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193583; c=relaxed/simple;
	bh=2VNHH6t1LxKsWFfH9k8oFZtI7htHDHrqki/CJa53Uds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOl3u7Z5pzaMqlk7skFPA8kofoEyodcf1oT6NEy3inesP5ZKfSbTWELEbYivmtDw6WYsLOiSDVIDHuKuznr2CCVLSARhQCOmsWVL8KWFfomE4B0NyAqeBbhXWagEp8TZzU/mNC4owKc9oRCP5V/MY3Vbyu/D6/nRLY+VhyBLp2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=C66kT4UP; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="C66kT4UP"
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0C540201C87;
	Mon, 05 Oct 2026 11:46:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791193573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LOZf8umnm/lnXB2PS4qM8n7Q8JyNtiK3ASguB+/Asmk=;
	b=C66kT4UPGNMGcWkW1IoBs1JA7XhidihyvRYnCRtksCnpESQI+xaBdT2EfPjBq+uh8KtS0f
	mW0GhkdAV3MyOTdOR5SSmFtKiYhSMWsxCbgaxhf834YgSJllXWn7kuG5TPRSPRGF2csQSj
	pBOU097QPbNkYKz8DIJ+K0TTE3VoZRiztL73FHXBPHsdDeixPK0Qs0hIDj0I+2QtoJM0ko
	tlmgeygAtPww5liEV9k5mb/TVKe80Sh0WVDmVdugZW4do+bm2k+lDIOI7awFn+4autGt3P
	J54f5OjosvdWFHjQtFGeNz6tT2CSa550wzyasu9BoeDkx0ucR8D6pvV10htY7Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791193573; a=rsa-sha256;
	cv=none;
	b=JLacWAqj7IFsAnxAanKJzIvlz76OqDIwjgZmahc8+AA6J+waIMlz99YsH4rZ/lMBMST9Il
	4VR9bnkxlIADatSEJRPpHI2Xn2YwFOeHVaZ8oEQnSRuuCzPweCkOx/xxrItpDZU/rQWXTx
	Vpvs/VljtO5Rc/kNB00NdUt53hJDmINM8SXcd6PP+18hjja6gZEyp9ZFs1TE+aBFu8UF9q
	Cbwib+qSZQGcvu1Bz7mYZRpJSmx1CpaJf6l714EpfbjKzdqpXULUy3tGN+isZ+36/9n3bz
	svzoM+XE7hkTkKnPxgZLuzs72cd9fP3NcFgM5CPncm1Q59OjHo/xhHfIqYivSQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791193573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LOZf8umnm/lnXB2PS4qM8n7Q8JyNtiK3ASguB+/Asmk=;
	b=P79c5afuAX7RlVG0IbWKVWOWrH68U6sARtzqAYYWaGgTdcF6rihoV7+EhVdy4oialoeNnh
	y4SXg4KolUIzfIV41ebGrsW3+9M7WNFR0zq16d3VIjBJfnuMrPy31ZBvXO8V/DibBBlyja
	XIY4idETDiY5Edlr2rVgAHvPEyuhtXqGka/SHLX1tVUtg//I1WWvRRMVCH/At57cTBlwOs
	VG4nVavXneqvq1vdUYZc1C4b2sBOPivB8Dg0xvNDw6KycimfLbAafaf/O9E4CWR/Ffhm3H
	MNnmKXWTAbP2zgU4WI16Y/WJt92HDwIqjSi7sVGF5wsjaSk7siiC0YNa7lLDWw==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 05 Oct 2026 11:46:08 +0200
Subject: [PATCH v6 1/4] media: dt-bindings: Add Rockchip JPEG decoder
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rockchip-jpegdec-v6-1-25f16dea1697@pengutronix.de>
References: <20261005-rockchip-jpegdec-v6-0-25f16dea1697@pengutronix.de>
In-Reply-To: <20261005-rockchip-jpegdec-v6-0-25f16dea1697@pengutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791193572; l=4958;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=2VNHH6t1LxKsWFfH9k8oFZtI7htHDHrqki/CJa53Uds=;
 b=ViQmAINmVpNJ+6XjZ6GqGyfaSF/BBEtVV97rhYgRaoRCMMoIIwOwHOVl14hpebQJXvASJEUPv
 3/BoYjhGXHyBUsWO/hdOBi3cuncCu4/LNsdJRCPIGouaC9Milq1HZMc
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
reached with its domain off, and the driver takes it out of reset when
it probes and puts it back into reset when it is removed.

The IOMMU stays optional.  The driver never refers to it, it is a platform
integration detail, and rockchip-vpu.yaml does not require it for the
other codec blocks on these SoCs either.

Assisted-by: LLM
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


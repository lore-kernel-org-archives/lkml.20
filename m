Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761351;
	b=RdqAr2AggcMa7wMhql1yBgIjc2OLz7u3LUMb37ztL7jteX16HcL5ynZLRfRIWkFbakf2
	 s6ajq5OOnGGnCZw9yEcsA+1f+WCC0nnsclrudOPfwFlm44Ya645TbFWFtnuxR6oT6VWSi
	 TRxTriKIixr18RdaD0QPaxeIV0SBjeIUyj/MSTsIdj/OzfyeN/MOUeYnJVwjh3p/FLsqI
	 HgYUIfck7dB4rbdjAdt8cASJA5qzvCGZiupaPC+10qSwLJias/80ngkW2MjLcWonBTdR3
	 1jikNoAwiy7Z3HqKR5SlACAD5COgEoQW+5L5hF7t6bc907kk5JLuvhSqx8m1AxnXGVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761351;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=cdpF+fVt2Hy2HfAcjpixN/WDxEX2Gn1Ra3OqY32SpVU=;
	b=P1bgfPZvAuXxKXVmgAJmCs2R1kuRBU/B2i8l5YGKBedez3WqjBXF0GqHM1PF4hXxP/Bd
	 ZKlLaN1vRtvbqjxOyENCTzEyib20k5OSk1sW16pFrckEDCqPYnV7pjgc3M0LuWFFiJ57F
	 vFlesEddr+K5MwgR0uUeaTeF5Ke0mgISl0rSR6WDo11MPJnUpUMlGthNlj/xrQWvkemwE
	 m+YumWmgGAomfZrX/Y6L5M2ylcS2WFaEm4EKpDynvVktcVrAMBRQaDma5an55TdEdBdv1
	 kd3QmJCG4eH2PstLyqR8J4lusm0nG2nZ6Hj4C3Zuwo7umz1BRsPEZBHl3iIZLc+q4iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mVGGwHjl;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E15D606A324
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E15D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mVGGwHjl
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261023131548epoutp0136abdc6bff07fcd9861147162eaf9a91~hKvK6uykf2500925009epoutp01W
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:15:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261023131548epoutp0136abdc6bff07fcd9861147162eaf9a91~hKvK6uykf2500925009epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792761348;
	bh=cdpF+fVt2Hy2HfAcjpixN/WDxEX2Gn1Ra3OqY32SpVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mVGGwHjlJfnuh/4+7+Ci5EO+0VrPVE/ID3N16GY7xk2HufMz8Zu7DApt4jlTHlBa7
	 Kn2rzMwGmklvJWSYc8OYYp8/3WbazSLys/EwhLEjvJr5+KJNWo0S2D6LNDmPQCmemu
	 Q41VhPDT0SfgZqQAvVd2It/p6hQFyxUGmb3YMlYo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261023131547epcas5p209499d6511be03591bb323d282998a0a~hKvJ8q5X10460604606epcas5p2V;
	Fri, 23 Oct 2026 13:15:47 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jB3Rk4SDdz2SSKY; Fri, 23 Oct
	2026 13:15:46 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc~hKvIRFYpW3047030470epcas5p1q;
	Fri, 23 Oct 2026 13:15:45 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261023131542epsmtip2ba58969fa0472da8c45d845928488ab5~hKvFhqAQp0806808068epsmtip2C;
	Fri, 23 Oct 2026 13:15:42 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
Date: Fri, 23 Oct 2026 18:45:00 +0530
Message-Id: <20261023131501.3157463-2-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261023131501.3157463-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
	<CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Add the Samsung Exynos8855 DWC3 binding using a flattened node
representation, where the DWC3 controller is directly addressable
rather than nested as a child node of a glue layer.

This is the first Samsung Exynos binding using the flattened
representation.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 .../bindings/usb/samsung,exynos8855-dwc3.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml
new file mode 100644
index 000000000000..d8983c310d31
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/samsung,exynos8855-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos8855 DWC3 USB controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Selvarasu Ganesan <selvarasu.g@samsung.com>
+
+description:
+  Describes the DWC3 USB controller block implemented on the Samsung
+  Exynos8855 SoC.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos8855-dwc3
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Two clocks are used:
+       - ref: Reference clock for SOF/ITP generation.
+       - bus: Bus (APB) clock for register access.
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@13200000 {
+        compatible = "samsung,exynos8855-dwc3";
+        reg = <0x13200000 0x10000>;
+        interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&usb_clk 0>,
+                 <&usb_clk 1>;
+        clock-names = "ref", "bus";
+        dr_mode = "peripheral";
+        phys = <&usbdrd_phy 0>;
+        phy-names = "usb2-phy";
+        snps,quirk-frame-length-adjustment = <0x20>;
+        snps,dis-u2-freeclk-exists-quirk;
+        snps,gfladj-refclk-lpm-sel-quirk;
+    };
+...
-- 
2.17.1


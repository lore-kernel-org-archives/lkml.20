Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=154.81.10.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645238;
	b=Xo30jXgGXNW6P9x5WyNrcJWsXjbpUm+/QqlNYzPx1ek2eF/X8IqcfYDpWnVgSzV1Tcgz
	 a232EdX/bltCyxhINDrfeYEUv8Q1H0l0TNZRLZOU3s530qCT64Yg/KciqQ11iM2oE12QN
	 E/POxPLz7eAUru28P6VY7BzczZys7uh6h/AAWhTLkC44LcsKo3aqQlmRUGoxvAQTh9/s9
	 C5PNFFY8UGPiLNn/u1t8Zgke+SqRnrdC4QJ/s1dDIgVu75CBiVqfCUWlLYPqefaEu9eaw
	 WRgWUcvbxSIinPhDa7syCYd2IlPKECq01OQbeM0yvfmezpBwWP4W3w//f7MnL6Hvmfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645238;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=e/eh1vOuT+TpPDmUDTGrb8/JwSxCiZPJ7zrKwO3AwYI=;
	b=W1LKgu0HlWf7qj0sHZxKHVJStffpgR6NjGizHzo4e+r1V7hi1IFvZ5Pkr6eb+p35/oPg
	 bVQAPK+IUWtNKCin56J/IOXeGklqMjWYDlc8Kh8C4QwtewPdB3OItGje3T5okhLTOm10I
	 pcKsiHmAsRQcENUPGK1saFPnfcr+5Ae+EhtxmPZ0uWUMpuUyP6/XA+c1yYnXX20fZaSGX
	 cUZYypXtXE6r2bQVmeHLhftzyFxSl3anM1PIi3HG48suVeNZt4Z/b8p8GI7wJhgUPdCVO
	 KFETmoAMlQJGbpeH2Z1VWea0Z+rG9a/W+3Qo2czRqK23x8QiXoyC5sfBJsozC9tN7Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dxF6mDms;
	arc=none smtp.remote-ip=154.81.10.145
Received: from mail-m10145.netease.com (mail-m10145.netease.com [154.81.10.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D106606A329;
	Sat, 14 Nov 2026 08:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D106606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dxF6mDms
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54aa88680;
	Sat, 14 Nov 2026 16:33:46 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 1/4] dt-bindings: phy: Add rockchip,rk3568-edp-phy
Date: Sat, 14 Nov 2026 16:33:36 +0800
Message-Id: <20261114083339.600986-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261114083339.600986-1-damon.ding@rock-chips.com>
References: <20261114083339.600986-1-damon.ding@rock-chips.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d930f2b703a8kunmf52e9804102250
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSU4ZVhhCHUIdGhkaTksYSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQ0xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=dxF6mDmshrFM7qsa/3d9KDS6zRw14BXb5oGzh0K58dDvU1eAtKYSY15bxYCU0hdR9I3lF6QXxDeXYW6v4TeVc1StLuh8ELnqjrA6sVUFb1VjSPDQCaQr1px2hSLh1Il+0EKVExE6zdd1lrIxyBeEQbIOSMrQ6csHF8fPuLbM0tE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=e/eh1vOuT+TpPDmUDTGrb8/JwSxCiZPJ7zrKwO3AwYI=;
	h=date:mime-version:subject:message-id:from;

Document the eDP transmitter PHY with Naneng IP block found on the
RK3568 SoC. The PHY has its own register window inside the eDP PHY GRF,
so its node is modeled as a child of the eDP PHY GRF syscon with a reg
property describing that window.

Also add the "rockchip,rk3568-edp-phy-grf" compatible with its own
binding schema, so the shared Rockchip GRF schema is not extended with
per-device conditionals.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Add the reg entry for the PHY node and the ranges/#address-cells/
  #size-cells for the parent syscon node.

Changes in v5:
- Move the APB clock (PCLK_EDPPHY_GRF) from the parent syscon node to
  the PHY node, matching the updated driver.
- Split the "rockchip,rk3568-edp-phy-grf" syscon node to its own
  binding schema, instead of extending the shared Rockchip GRF schema.
- Rename the reference clock to "ref".
- Drop the example from the PHY binding schema, as complete MFD
  examples belong in the GRF binding schema.

Changes in v6:
- Add Reviewed-by tag.
---
 .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 46 +++++++++++
 .../rockchip/rockchip,rk3568-edp-phy-grf.yaml | 80 +++++++++++++++++++
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
new file mode 100644
index 000000000000..06dd1d19dca2
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/rockchip,rk3568-edp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip eDP Transmitter PHY with Naneng IP block
+
+maintainers:
+  - Damon Ding <damon.ding@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
+  On the RK3568 SoC the eDP PHY is controlled through the eDP PHY GRF
+  registers, therefore the PHY node is expected to be a child of the
+  eDP PHY GRF syscon node.
+
+properties:
+  compatible:
+    const: rockchip,rk3568-edp-phy
+
+  reg:
+    maxItems: 1
+    description: PHY registers within the eDP PHY GRF.
+
+  clocks:
+    items:
+      - description: Reference clock from the PMU CRU
+      - description: APB clock gating the PHY register window
+
+  clock-names:
+    items:
+      - const: ref
+      - const: apb
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml
new file mode 100644
index 000000000000..852420798f06
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/rockchip/rockchip,rk3568-edp-phy-grf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip eDP PHY GRF on the RK3568 SoC
+
+maintainers:
+  - Damon Ding <damon.ding@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
+  The eDP PHY GRF is a dedicated register file on the RK3568 SoC,
+  holding the registers used by the eDP Transmitter PHY with Naneng IP
+  block. The PHY itself is modeled as a child node, with its reg
+  property describing the PHY register window inside the GRF.
+
+properties:
+  compatible:
+    items:
+      - const: rockchip,rk3568-edp-phy-grf
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/phy/rockchip,rk3568-edp-phy.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      edp_phy_grf: syscon@fdcb0000 {
+        compatible = "rockchip,rk3568-edp-phy-grf", "syscon", "simple-mfd";
+        reg = <0x0 0xfdcb0000 0x0 0x8000>;
+        clocks = <&cru PCLK_EDPPHY_GRF>;
+        ranges = <0x0 0x0 0xfdcb0000 0x100>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        edp_phy: phy@0 {
+          compatible = "rockchip,rk3568-edp-phy";
+          reg = <0x0 0x100>;
+          clocks = <&pmucru XIN_OSC0_EDPPHY_G>, <&cru PCLK_EDPPHY_GRF>;
+          clock-names = "ref", "apb";
+          #phy-cells = <0>;
+        };
+      };
+    };
-- 
2.34.1


Received: from mail-m1973195.qiye.163.com (mail-m1973195.qiye.163.com [220.197.31.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0A511E8C;
	Tue, 13 Oct 2026 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897939; cv=none; b=pHWhKEbQ/rcFpj7nccUQiiTtG3S10pXkNtVsFM1DHnm6bliUL1eY9GLdh40dKEwjXOxCHmA0vHa4DkAHqgaDuQsBdGntWvbkqnVO2vDYpMcAypxgKGJw3YhSa3/2h6rh8KTYWsF5D3Kro9iz1YuWe9G3SJytIb+Ryt1tdmey7AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897939; c=relaxed/simple;
	bh=J0AlJ1lbzd3dTmzNmWvifeLzfrFogNEyWn1jyS/ygew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HkiBDD4eKZ92w+NhkgtRfcQl6fVohPEV2yFxDzQ86ff9E/tDRP/NzcNH2yhcpaPONzRNQEENiSnmCqKyzUNyzB6SsTqraeN28jDFmCkUwaZDSRcjB+fTH8R3jsgadNvw6e33UxSg9IeRV39IvQoA/9ujGMWx5TDV+G9oCSX+Cq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=WTSaEo11; arc=none smtp.client-ip=220.197.31.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="WTSaEo11"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 50e2b940e;
	Tue, 13 Oct 2026 20:49:54 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 2/6] dt-bindings: phy: Add rockchip,rk3568-edp-phy
Date: Tue, 13 Oct 2026 20:49:42 +0800
Message-Id: <20261013124946.1807886-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013124946.1807886-1-damon.ding@rock-chips.com>
References: <20261013124946.1807886-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1354ff50b03a8kunm2e7c128b300b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSh0ZVhodGktOTBpMT0pCTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=WTSaEo11TyUklwYr8CFdY7Pz7pd0sA6rYQndynov2q5kXbjr0P+5RRWrD5DJoEq3xLUwJBPAXMSUpPiXiwBfYy8PEzpPrSq2EcpL5UgfdP9ncnxTWs4n5h1hghRT8IKJ7sY6I4ks3nM7IiXFy+Pq3bOidQX8pW/lBiKhJZtmoWM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=V6YTkuc+JQ/Q5NgJoM+Ztyfr/5wVw30o5S+KA6zRLSw=;
	h=date:mime-version:subject:message-id:from;

Document the eDP transmitter PHY with NaNeng IP block found on the
RK3568 SoC.  The PHY is controlled through the eDP PHY GRF registers,
so its node is modeled as a child of the eDP PHY GRF syscon.  Also
add the "rockchip,rk3568-edp-phy-grf" compatible and the "edp-phy"
child node reference to the Rockchip GRF schema.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 59 +++++++++++++++++++
 .../devicetree/bindings/soc/rockchip/grf.yaml | 15 +++++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
new file mode 100644
index 000000000000..afe7bc3d839e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/rockchip,rk3568-edp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip eDP Transmitter PHY with NaNeng IP block
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
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: refclk
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - "#phy-cells"
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
+        reg = <0x0 0xfdcb0000 0x0 0x100>;
+        clocks = <&cru PCLK_EDPPHY_GRF>;
+
+        edp_phy: edp-phy {
+          compatible = "rockchip,rk3568-edp-phy";
+          clocks = <&pmucru XIN_OSC0_EDPPHY_G>;
+          clock-names = "refclk";
+          #phy-cells = <0>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 7bcb4e2f47ec..8d4ced0145b8 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -93,6 +93,7 @@ properties:
               - rockchip,rk3399-grf
               - rockchip,rk3399-pmugrf
               - rockchip,rk3562-pmu-grf
+              - rockchip,rk3568-edp-phy-grf
               - rockchip,rk3568-grf
               - rockchip,rk3568-pmugrf
               - rockchip,rk3576-ioc-grf
@@ -156,6 +157,19 @@ allOf:
           $ref: /schemas/phy/rockchip,rk3288-dp-phy.yaml#
           unevaluatedProperties: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-edp-phy-grf
+
+    then:
+      properties:
+        edp-phy:
+          type: object
+          $ref: /schemas/phy/rockchip,rk3568-edp-phy.yaml#
+          unevaluatedProperties: false
+
   - if:
       properties:
         compatible:
@@ -309,6 +323,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3568-edp-phy-grf
               - rockchip,rk3576-dcphy-grf
               - rockchip,rk3576-vo1-grf
               - rockchip,rk3588-vo-grf
-- 
2.34.1


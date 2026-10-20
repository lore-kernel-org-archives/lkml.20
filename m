Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497593;
	b=gu3jb4lE9ksjfIsHcXTK/aq2Xf56sZ+pC4z1No8DHweRrk43z8bFsaJq6rHzVD05Wr8q
	 w3HffgAQl/jwWdQztzO14IByTXxTDqribabE6CgXU+XOSPAV6GhkZUbQadcixViC8U/Dq
	 MZVCZMedRT88qhEPdXaECpH1s5iL5x/pNCrcZpuitx+fB4zZ/s7XoZwJOwILx2NDMvSE5
	 OF9yQI/O+hz4l2kFdimUUKCJMctyo59yIL085cYlwprlgZ+zYi8pd3wIkcpcu9eJR999R
	 2ApmoEv6s1V629VHKEcQUgGTkGy2Lkuyn0rMfF7TOFtQhFyiXpxO1bRsZZA6dxv4sFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497593;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LC/OjFTpCCvkIsv7pAPuEZkfOKc3BfQoa6IiutvgXsQ=;
	b=lYk92OELkhGQ4H7E4l6pTHuo0vup6W3mJTG2PnbfYwr9PBtRrqxo2PcmW2dbvvywH3dl
	 CcbuHksnJ2KQnqFc09vAKc/1v/sMn+sBy+2d6glOXxiRsiAOhnTGcxZUgd8c3P26itlCe
	 QFOQkMWevgDKzFZvn8QLzaLqa/sh4u+ORk/GWyOEiqv3lXejW9XahJna5YGkVmTxB24JZ
	 NX5b4x9lSzfRzdHGBzMOVXgGE2Zw3nOSK5vSslDQ4eK8PJkm68xQJdYJD7mG2tEGlphTI
	 24TlZRn4UrRMOnXIJfKtPZzp3Vjph53LTw5Zrpqhl2dzGr3uGGAxbHjIvIGbkma5gyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108A9606A334;
	Tue, 20 Oct 2026 11:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 108A9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Oct
 2026 19:59:50 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Oct 2026 19:59:50 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Tue, 20 Oct 2026 19:59:49 +0800
Subject: [PATCH v10 1/3] dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
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
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-upstream_pcie_rc-v10-1-fba209af8656@aspeedtech.com>
References: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
In-Reply-To: <20261020-upstream_pcie_rc-v10-0-fba209af8656@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792497590; l=1816;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=R1Rp45+kmKh9eM16JpYNajIX3lEUCLAV021oQUooi3w=;
 b=Xdz92dN612PvoOTD+/ca/mYNCNaAw+XoC5l7R9jvXBL00yppDccJtEgvEGBu9esn7E1XDoVeW
 N7n2MFuEQ6nAWWFff8w4ZhCTQrUh20i2vNTFAlB6HWwFp/v0lxO8ODx
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=

Introduce device-binding for ASPEED AST2600/2700 PCIe PHY.
The PHY provides the physical layer used by the PCIe
controller when operating in root complex mode.

Describe the compatible strings, register range, clocks and
phy-cells value required by the PHY provider.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
new file mode 100644
index 000000000000..686b2e3d9457
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/aspeed,ast2600-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe PHY
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description:
+  The ASPEED PCIe PHY provides the physical layer functionality for PCIe
+  controllers in the SoC.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2600-pcie-phy
+          - aspeed,ast2700-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      Fixed 100MHz reference clock provided on the board.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@1e6ed200 {
+      compatible = "aspeed,ast2600-pcie-phy";
+      reg = <0x1e6ed200 0x100>;
+      clocks = <&pcie_refclk>;
+      #phy-cells = <0>;
+    };

-- 
2.34.1


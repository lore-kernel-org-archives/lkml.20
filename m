Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31220495023;
	Tue, 15 Sep 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467036; cv=none; b=n3d99KrYewzW+2KwzKNqODCtKb5gGcBXAxXnOBvbUN4ICTGQKsQ135dVnvjn3EuN10+pV/7lQjeby8HjSoUlKZrqi+kYGqdaAq+JacR5X8QEoG69ZZJZuYSVDmxKqxx4BB+1//lq8GGx9SHrwtqVr/AO/ZbwrEaIn8yr8mG/IJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467036; c=relaxed/simple;
	bh=QL+UHbz6ocxj2GQ6KJGSIdIbj7NFCI3MZwL5GnuuHpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItDMjGLNVW5Nz/LMcUT/DGgtjloRYwU3189h6zdk4ej89nLONoMa0kBK551x1+6yR9M9HSelmoDfLcmrGd1buCnHr5FEBdqMZPgGB0B4DEeVS/bq28Kj+RW9sqqdaDxusAgNXL2iqFmV75Nh9wL9ZF0kam/V+BF/RVJWsZpKCcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WFIKAhPn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WFIKAhPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789467026;
	bh=QL+UHbz6ocxj2GQ6KJGSIdIbj7NFCI3MZwL5GnuuHpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WFIKAhPnOsHFLpzvCY+NrDgDA/svkjIC0EMr4vEmv/LJxySNgjlxic46k4Ikm1Veu
	 SuBjZdMDM3aC3ltooN60qg1McN9nbZ80f3n/EiSktyjDVRfs9ElUwDPmavve8uU4MF
	 WiEtR1ShdkGZIvHALq8vGl9wtmP5F+oSfnxpTMnn1jTkhgilqfeBGGIbkmRgUM/cyv
	 B8Gg8HzEvyE+MHnMG11TefMkj+p6yvJqEt+OqKL5+kyqHVzaYYzFZ1cEvUB0bP5arE
	 GWrvQkNr4GwElM2IHFXJ9KBxWHM45P/F/O9g6/dChLTKwNxNUKtircXy8JeMR8za3C
	 LIjMmyTnxrnBQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4733917E091A;
	Tue, 15 Sep 2026 12:10:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: phy: Document MT8196 MediaTek PCI-Express Gen4 S-PHY
Date: Tue, 15 Sep 2026 12:10:21 +0200
Message-ID: <20260915101022.23852-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
References: <20260915101022.23852-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds bindings for the PCI-Express Gen4 S-PHY found in newer
MediaTek SoCs, such as MT8196 and its variants.

In the current "revision 3", depending on the specific port, this
S-PHY supports up to two lanes of PCI-Express Gen 4 and both EP
and RC modes.
It is not clear whether revisions/versions earlier than 3 have
ever been shipped in any other MediaTek SoC.

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../phy/mediatek,mt8196-pcie-sphy.yaml        | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
new file mode 100644
index 000000000000..3fd1bfbc3822
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mt8196-pcie-sphy.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,mt8196-pcie-sphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PCI-Express Gen4 S-PHY
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek PCI-Express Gen4 S-PHY is capable of data serialization
+  and de-serialization with 8, 10, 128 or 130 bits (16GT/s) encoding
+  and decoding, has analog buffers, elastic buffers and mechanisms for
+  receiver detection.
+  This PHY supports link rates of 2.5, 5.0, 8.0 and 16.0 GT/s per-lane
+  in both Root Complex (RC) and End Point (EP) modes, depending on the
+  chosen port.
+  The Digital PHY (PHYD) part adheres to the Intel PIPE (PHY Interface
+  for the PCIe) specification.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-pcie-sphy
+
+  reg:
+    items:
+      - description: System Interface (SIF) registers
+      - description: Clock Management (CKM) registers
+
+  reg-names:
+    items:
+      - const: sif
+      - const: ckm
+
+  "#phy-cells":
+    const: 0
+
+  nvmem-cells:
+    items:
+      - description: Internal resistor selection of TX Bias Current
+      - description: XTP Bias V2V voltage calibration
+      - description: S-PLL CKTX Impedance Selection (P-MOSFET side)
+      - description: S-PLL CKTX Impedance Selection (N-MOSFET side)
+      - description: S-PLL CKTX Intermediate Transition Impedance
+      - description: RX Front-End Return Loss Continuous Time Linear EQ
+      - description: RX Front-End Return Loss Variable Gain Amplifier
+      - description: RX Front-End Return Loss Decision Feedback EQ
+      - description: RX Impedance Selection
+      - description: TX Impedance Selection (P-MOSFET side)
+      - description: TX Impedance Selection (N-MOSFET side)
+      - description: TX Lane 0 Switch Resistance (RSWn)
+      - description: TX Lane 1 Switch Resistance (RSWn)
+      - description: eFuse calibration table version
+
+  nvmem-cell-names:
+    items:
+      - const: int-r
+      - const: xtp-vtrim
+      - const: cktx-pmos
+      - const: cktx-nmos
+      - const: cktx-r-mid
+      - const: rxfe-lanes-rl-ctle
+      - const: rxfe-lanes-rl-vga
+      - const: rxfe-lanes-rl-dfe
+      - const: rx-lanes-imp
+      - const: tx-lanes-pmos
+      - const: tx-lanes-nmos
+      - const: tx-ln0-rswn
+      - const: tx-ln1-rswn
+      - const: cal-version
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@16900000 {
+        compatible = "mediatek,mt8196-pcie-sphy";
+        reg = <0x16900000 0x10000>, <0x16920000 0x10000>;
+        reg-names = "sif", "ckm";
+        power-domains = <&spm 10>;
+        #phy-cells = <0>;
+    };
-- 
2.55.0


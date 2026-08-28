Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D874A31195B;
	Fri, 28 Aug 2026 19:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944970; cv=none; b=fQlpTwdeHFnCJx/Ln1EyRz/1DYylyhcDlZMQ9ZL+STe7eiFzTYt07BGIB11sOb7nkrmQqPT6HeUgWjQlQhKRZhjjtUFG3XFK3bzCbeKxvponx1hn6b6LmOezpxCXhbCmw5xGc8QRVjfRmwx/sx/0fDCAjPrPz0t2B3FNRfwTGf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944970; c=relaxed/simple;
	bh=2K1no5OiWCbDqZCqZV9RwiArh9g3t/EZ3tZFuJVFM8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iuUC/ly10n+96AZpzSoS3zMhClQi79Ca2cULI7uoMqGMl9ksYjJoZj0VZw/SnDtbG0n4N7bB3Kq3+reduHRnrR8j7a+O9gQ59+roY/Zh/BpgPaSSHSpm4Fwjh4fzUlCIake+pDt+8uINHN3YLO5tDj+fqrkwm9GzplCeDLFYsaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nPnVVapX; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DQWWgDIg; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nPnVVapX";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DQWWgDIg"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hWpDw2zRdz8v4R;
	Fri, 28 Aug 2026 21:22:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787944960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i6Zcfk6OiBd21jW5PNVvOmFKcd6Av7RN7HuO+LFyu+o=;
	b=nPnVVapXGL78Y5ASqvnUuLKDUVFQeK/AZYwO9zp6gaOTwHvD+vzCuA4bo6PO3xBrVoRMyy
	QRTEEsMROdL3/CtuWMnRXZMFNDWNpxYOvCWmcAF+6i6Tf4zdHaN/vd2EShfADugnBhKD+8
	I+N4kxZCJUzPC4xaaEArORvcBeo5d/N3ocxIbbgk1DVvH4sRmkFieFLR1UndBsEW7+rW/f
	VTc8GZo+5M8IX7OIacOjdbfgBaZK0y0s5msNXOH0FpcfGtwcpXICWRj1kUALHpFIh8HB6v
	SQOGWma/nFQUkEL3MjYP6K8HHZXwhvYqR4nGBqZlDy7kyMr0infnv1zVhPJEOA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787944957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i6Zcfk6OiBd21jW5PNVvOmFKcd6Av7RN7HuO+LFyu+o=;
	b=DQWWgDIgGpAmlFnR4FL5NaWK86aTGrJYonu1OYpAoyAlmy3p+U7l2m5x4m38hDBOG/PBAI
	Fdjfs7LQfdy+mStxzkaMar9tZFg/x27IaRI8oXH/hq5p/kBVOtkPF9nTs5X4OTCnazKM3S
	IvzEJtRT7Fa7ZyNRCiqTQA7FkaU8SwqiCp1da+JWE9OxGZ2QYjkX/k3kcDCLqMLaKSikbj
	b6cba8KgA6NwlEM0eYEbKJeA80Zew8SfkxPiELIMLLfCFVQxoBVQkFGixJ0lC26pKUJsgU
	Osl3uUP+/YZbuUYGl5qf/RJOb07UACj5OVmDx9N+PHOpyVQNuf3ullrB91IQiA==
To: linux-phy@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Phong Hoang <phong.hoang.wz@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Tam Nguyen <tam.nguyen.xa@renesas.com>,
	Thanh Quan <thanh.quan.xn@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: Document Renesas Multi-Protocol PHY driver for R-Car X5H
Date: Fri, 28 Aug 2026 21:21:39 +0200
Message-ID: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3k3rhshq4777g3ma5iagqk8czrwsyy4x
X-MBO-RS-ID: ea153f9a525213584ef

Document Renesas Multi-Protocol PHY present in R-Car X5H (R8A78000) SoC.
This is a multiplexing PHY block with inputs from five IPs, and outputs
to four separate IO blocks. The five inputs are two PCIe4, two USB 3.2,
and ethernet PCS, each connected into the PHY with up to 4 times 2 lanes.
The inputs can be multiplexed to the four IO blocks as needed.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Hai Pham <hai.pham.ud@renesas.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Phong Hoang <phong.hoang.wz@renesas.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tam Nguyen <tam.nguyen.xa@renesas.com>
Cc: Thanh Quan <thanh.quan.xn@renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../bindings/phy/renesas,rcar-gen5-mpphy.yaml | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,rcar-gen5-mpphy.yaml

diff --git a/Documentation/devicetree/bindings/phy/renesas,rcar-gen5-mpphy.yaml b/Documentation/devicetree/bindings/phy/renesas,rcar-gen5-mpphy.yaml
new file mode 100644
index 0000000000000..2da8be2d3de82
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/renesas,rcar-gen5-mpphy.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/renesas,rcar-gen5-mpphy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Generation 5 Multi-Protocol PHY
+
+maintainers:
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r8a78000-mpphy   # R-Car X5H MPPHY
+      - const: renesas,rcar-gen5-mpphy  # R-Car Gen5 MPPHY
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 5
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: mpphy01
+      - const: mpphy11
+      - const: mpphy21
+      - const: mpphy31
+      - const: mpphy02
+
+  power-domains:
+    minItems: 4
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: mpp0
+      - const: mpp1
+      - const: mpp2
+      - const: mpp3
+
+  resets:
+    minItems: 5
+    maxItems: 5
+
+  reset-names:
+    items:
+      - const: mpphy01
+      - const: mpphy11
+      - const: mpphy21
+      - const: mpphy31
+      - const: mpphy02
+
+  '#phy-cells':
+    const: 1
+
+  renesas,num-lanes:
+    description: PCIe lane count for each PHY input.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
+  renesas,phy-type:
+    description: PHY multiplexing configuration for each output.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 8
+    maxItems: 8
+
+  renesas,external-ref-clock:
+    description: PHY external reference clock select for each output.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
+  renesas,output-repeat-ref-clock:
+    description: PHY repeat reference clock select for each output.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+  - '#phy-cells'
+  - renesas,num-lanes
+  - renesas,phy-type
+  - renesas,external-ref-clock
+  - renesas,output-repeat-ref-clock
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+
+    phy@c9a00000 {
+      compatible = "renesas,r8a78000-mpphy", "renesas,rcar-gen5-mpphy";
+      reg = <0xc9a00000 0x100000>;
+      #phy-cells = <1>;
+
+      clocks = <&scmi_clk 340>, <&scmi_clk 341>, <&scmi_clk 342>,
+               <&scmi_clk 343>, <&scmi_clk 344>;
+      clock-names = "mpphy01", "mpphy11", "mpphy21", "mpphy31", "mpphy02";
+      power-domains = <&scmi_devpd 17>, <&scmi_devpd 18>,
+                      <&scmi_devpd 19>, <&scmi_devpd 20>;
+      power-domain-names = "mpp0", "mpp1", "mpp2", "mpp3";
+      resets = <&scmi_reset 340>, <&scmi_reset 341>, <&scmi_reset 342>,
+               <&scmi_reset 343>, <&scmi_reset 344>;
+      reset-names = "mpphy01", "mpphy11", "mpphy21", "mpphy31", "mpphy02";
+
+      renesas,num-lanes = <4 4 0 0>;
+      renesas,phy-type = <PHY_TYPE_PCIE 0>, <PHY_TYPE_PCIE 0>,
+                         <PHY_TYPE_XPCS 2>, <PHY_TYPE_USB3 1>;
+      renesas,external-ref-clock = <1 1 1 1>;
+      renesas,output-repeat-ref-clock = <0 0 0 0>;
+    };
-- 
2.53.0


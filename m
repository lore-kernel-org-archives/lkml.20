Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838519;
	b=JS4abebOaT+WYPFhGOe+8BBNLmqdxAJvGwnsj3tWFSoLso4xI+z6WESgiHsBHXNEqhFE
	 xho35lCIn4s0zVLHgYqe9TwfPlHSr1snOOrh79/8mVOtjOMPF2zNqt35cCZ9ab0kfRsWX
	 r9xu0QYFDSKpUL/R3i5C8VnZhrfjTwKuVwWlLVAPzaS2Vhe5+volTeBBVki4fVbMk8TAU
	 lxnh3NH+JkZhrieBgN2PWg4RdZYsGFYP+WrO2diUU4c8F0UNk+u1gi2QMaVFzHrDR4/Gy
	 +vHQ1K6g8yb5zMca7hgqzMdetimZwpJ/rc7rMWkSTjkH3IHrSCEIqEUXvDHs1DfLTrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838519;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=K5NHzVXY3LRAB3acJJ9610fRkwObgwH6kG7Ys1BqKf4=;
	b=tZXmhhwOl3fcSa3WBtBomlKtfNNC9NnQiwkE6c0sck04pjxPtcGa/JlRkrtlzPAljIR0
	 fL5/Wih9maMGbCXrl+rgU0MlC4s4PPpvJpk9NT3cbTOUvjAMf0MHu43+qvednJ7kDbKRq
	 U9D2N/3RzXPrvyg9YnjhHOme/mg1hoOD3Qs0OxJAM2FTcdQxO4BdkD+xh0h5dpRtWMbur
	 FwP32K3DXO3cn2aj8HPMu1+H+wTnyWGalVGkXc0m2OxF9cdlLUCEGq6rw3zTka2yuJ/Ax
	 Rk3XNPl6zizzsBcOWTqg/Z6V/OOi79271F4fGoeQ07TQEI9wdFz7K4lwJsjOoPQXM2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCmhV8qt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4DE606A31C;
	Mon, 16 Nov 2026 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GCmhV8qt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67A91F000C7;
	Mon, 16 Nov 2026 14:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838519;
	bh=K5NHzVXY3LRAB3acJJ9610fRkwObgwH6kG7Ys1BqKf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GCmhV8qttAXwtE2U3WfGcYJoOZxQXn3T24ec0r0wHcRoDrYG24fqdn1QwTQeeIBzr
	 Q9RbjmU2yYDLyLImV3rfJi4dITgG+a70I/YND49iJ+WZJfpWE7vIgpDBcIvfp7Yn/m
	 xOvyVNPJ5N46SHpMArhs0BTb/8j8kgYW0/v/1fMA4j4CpPLe3fIYUL2sEJ/HRrUaPv
	 nK8QQ6XFJUGRaq2fZCitRLP0IpXyFa9PqLA5YBPiJJfS1YuCnwsw1VkBrup34Wpop1
	 /87SDUDWY+r+SyjN2ZagnW8w4MRtW6qU6VGANJefu2w7ARbGRdtlfhilN6Mu8QMGQF
	 vxAiEmk/irFew==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/8] dt-bindings: net: Add Synaptics SL2610 DWMAC
Date: Mon, 16 Nov 2026 21:54:37 +0800
Message-ID: <20261116135442.4827-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
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

Describe the Synaptics SL2610 integration of the Synopsys DWMAC 5.20.
The PHY interface mode is selected through a system-controller register,
identified by a syscon phandle and register offset.

Restrict PHY modes to the RMII and RGMII variants supported by the glue
and extend the common DWMAC compatible list for the new integration.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
 .../bindings/net/syna,sl2610-dwmac.yaml       | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2c4842404bf6..267340a5f45c 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -119,6 +119,7 @@ properties:
         - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
+        - syna,sl2610-dwmac
         - tesla,fsd-ethqos
         - thead,th1520-gmac
         - ultrarisc,dp1000-gmac
diff --git a/Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml b/Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml
new file mode 100644
index 000000000000..0748b623599b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/syna,sl2610-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics SL2610 DesignWare Ethernet MAC
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: syna,sl2610-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: syna,sl2610-dwmac
+      - const: snps,dwmac-5.20
+
+  syna,syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to the SL2610 system controller.
+          - description: Offset of the Ethernet interface control register.
+    description:
+      Phandle and register offset used to configure the Ethernet PHY
+      interface mode.
+
+  phy-mode:
+    enum:
+      - rmii
+      - rgmii
+      - rgmii-id
+      - rgmii-rxid
+      - rgmii-txid
+
+required:
+  - compatible
+  - syna,syscon
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    chip: syscon@f7e10000 {
+        compatible = "syna,sl2610-soc-syscon", "syscon";
+        reg = <0xf7e10000 0x10000>;
+        clocks = <&osc>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+    ethernet@f7a06000 {
+        compatible = "syna,sl2610-dwmac", "snps,dwmac-5.20";
+        reg = <0xf7a06000 0x2000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+        syna,syscon = <&chip 0xa3c>;
+    };
+...
-- 
2.55.0


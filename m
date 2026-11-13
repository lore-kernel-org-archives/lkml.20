Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572339;
	b=Zo+HDMafd5pL3SP4XrBshHSn8gykpdagbTaK9UusgVy6U9jZtCMBifedarHgZqf7FpTH
	 AahkZbnaJbafaNc2NytXsIO/04hfNfM9KEv91Muz7CULwOKssMQNLhZDVTIjyUVpSdPBB
	 ce4GBVhTbAlQ4kOyc5ho1NLT4RgNzjHigwQz/wznZFB3eIqWhRlcAZWd/t0PZWWCLcBGG
	 iWztL+lo+qHbHu5uEV+aA4RPM3eYRMZoc3Jm5Gry/bbONJXqjeomMkKJx7iOqWrrdEpUS
	 agAJ1bdVeX1NPwQuRxnH3aaV87w5CAnlwJ1Y071uPpK/kONLNkgmsCvQYm0JtfGCEKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572339;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pzwdGume78d+Ss8/RtaDjaZog/9tADCa21G3bSQ/eAo=;
	b=OGF+ghroUOtkjIcpdhllJrRWRU4ySAESugKi5TbUkY8JFLnu3L0eZsQQvRjaSHtXZh17
	 CuA/xoJJfppVexTFV8v01yGik84rQMjpPoOgh99EQo4q2PxV5wkPHueadQ1EWqGVADd2N
	 cWX+akmA8GB86XoxzWZ+bsjYGazxN/D0eiNsXGSGm1BCngG3wZ0KlR1+rkhsEoqenYpAZ
	 7RPoUmDYQ04Jfk9bVLNxjvgduixadJHjst4WPi6vaRlMGJSKq3HeJJXSyZVoWjAznoZ6l
	 KSE2SLzhQtq3W4+fJOV/Ic7wlXj1QttMzWZD79+FxCsecHtdx6i4QCdQn2GagiO9Ofg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D41B606A88E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D41B606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49412eb1474so406565f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572335; x=1795177135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzwdGume78d+Ss8/RtaDjaZog/9tADCa21G3bSQ/eAo=;
        b=F29z3dgh9X9rvMQsn1KoOJnk+42erA/4nA+ni8q7oTku8ZgH7TuDVR6jR/rs4F9AjI
         G7G8nsE3aRqncrlcFye+ESmwEgiRvAL/PxhIow3TNkDl/JrLfS3ps9DJ/e+pCsManGmn
         DQdn0H3k2K0Q3mR56d5mRgTDQJ/OrXfiTMYWTMDxZzJGYAJxa+PJE+0KJWEuXdWURN6g
         JPQbTAqDcyJ+X6zGuGzsloDk/jj3BkzH7QdT08aHtS63wDwIfz5n10QB5dXz8hAFghfm
         G3tEO0pXhFgR5WcBgpn7q9XLxKKiJRSbePRKhlcfiAlQ+82lMSHC7feN2Gjoohup0tOq
         mCcw==
X-Forwarded-Encrypted: i=1; AL+hErFD/OkIuq2q0sQ8NBmvPmr49+Hy4UG1g7oeFUoK/Gq1f79PuZJQqN8XA/nScNqXV0N1vLt5vxKDthw4IJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kt+P2q4LFNS0pHCcxxdRdDWxdOyvlv1y20LrxNQOeooTBbR28
	I69LBUaKGR8EOATGgmOUGGMQXhvD2INAVmcPIusJupYaH7Bnkv0niQLY
X-Gm-Gg: AYBFou2U6o9YqS+Ix9mD9Xqo4dln8obNtzMghNzFI3TqOEIfjvmzyMBdRkB6BWczhdc
	c7CM6C77ZYGOK+fhsCM0gbAyzEy4vF8ryhrGjjtqErUdxlHjSSJR6PUQDm//HvQbr6zw4LYth9D
	ze1RNHkrJ//6KP1RXWU7przIXmJPLGeD6DmGNZm62k5yzwQA4j1tIP8Vflud9nLyljPDlB3nvPp
	7lf4LBNGIHsNPAk5v7v954ZIOpJ3YUhil0P3Ze+XWCXFyZtbzwknJtG3cxMCyP0TDBqEANhpln2
	Ogu8cCrJrKESY40PqEdG0IaGa9Y+q/nmfXjfpHnZkcNQVGypQhluBfa2gR+G3awhkpRHC3AJG1U
	RbzUJ+0N7J8HVu+8PmVN9qCnjt0Xcsu+0lSwkq7u/rHIEskQy12kt2chznH9rhOm+6b9rWGjh6S
	mycVtTLfuPeGcehQRJzVqTeQlneLSF+1XssLGOxLbJOc7iwbTEc+cCcUpGp1bjkXAEdKx+LaCOm
	o6QKxQSWCKdH3jVxIpuuWW0uEeWbsXY3UWSl7tGemqAOcjhLcJPzLc1y67lYBdMlTFcBYyzUtFs
	HppMZdTyMs034s4R4N3cfVyTD9dpKn68GiVbEQXRQekH0Y07pVb2Ui1lH1zUTir1ZqdGmYixXVd
	jHFGjoX/qf4KHEiLaUWWnzFHJ
X-Received: by 2002:a05:6000:2003:b0:490:411a:1eed with SMTP id ffacd0b85a97d-49c72f7a66cmr5198418f8f.39.1794572335385;
        Fri, 13 Nov 2026 04:18:55 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/7] dt-bindings: net: add amlogic,t7-dwmac
Date: Fri, 13 Nov 2026 12:18:47 +0000
Message-ID: <20261113121852.334604-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
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

The T7 has the same ethernet glue as the G12A but needs two clocks of
its own. The controller reaches memory through a pipeline stage with
its own gate; nothing else claims it, so it is switched off as unused
and transfers never finish. The glue registers share a gate with the
MDIO multiplexer, which probes after the controller has programmed
them: the writes are lost and the port keeps the bootloader's delays.

With a newer core, a clock list of its own and delays that follow
ethernet-controller.yaml, the T7 gets a binding of its own: the PHY
adds the 2ns, and only the receive delay line offers fine tuning, so
only rx-internal-delay-ps is valid here.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,t7-dwmac.yaml        | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml
new file mode 100644
index 000000000000..9b7c3864cd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/amlogic,t7-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic T7 DWMAC Ethernet controller
+
+maintainers:
+  - Lucas Tanure <tanure@linux.com>
+
+# The select keeps this schema from matching every "snps,dwmac-5.10a" node.
+select:
+  properties:
+    compatible:
+      contains:
+        const: amlogic,t7-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: amlogic,t7-dwmac
+      - const: snps,dwmac-5.10a
+
+  reg:
+    items:
+      - description: registers of the DWMAC controller
+      - description: the glue registers PRG_ETH0 and PRG_ETH1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: First parent clock of the internal mux
+      - description: Second parent clock of the internal mux
+      - description:
+          clock of the pipeline stage inserted in the bus path between
+          the controller and the DRAM. Without it, the controller cannot
+          complete DMA transfers.
+      - description:
+          APB clock of the glue registers PRG_ETH0 and PRG_ETH1.
+          Without it, they read as zero and ignore writes.
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: clkin0
+      - const: clkin1
+      - const: pipeline
+      - const: pclk
+
+  power-domains:
+    maxItems: 1
+
+  rx-internal-delay-ps:
+    description:
+      Fine tuning of the RX clock, added on top of the delays that
+      phy-mode describes. The PHY adds the 2ns RGMII delays, see
+      ethernet-controller.yaml.
+    default: 0
+    maximum: 3000
+    multipleOf: 200
+
+  # The TX clock has no fine tuning, its only step is a quarter of the
+  # clock period, the full 2ns at 1Gbit/s. The PHY adds the TX delay, so
+  # the property is not accepted.
+  tx-internal-delay-ps: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
+    #include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,t7-scmi.h>
+    #include <dt-bindings/power/amlogic,t7-pwrc.h>
+
+    ethernet@fdc00000 {
+        compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";
+        reg = <0xfdc00000 0x10000>, <0xfe024000 0x8>;
+        interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clkc_periphs CLKID_SYS_ETH>,
+                 <&scmi_clk CLKID_FCLK_DIV2>,
+                 <&mpll CLKID_MPLL2>,
+                 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+                 <&clkc_periphs CLKID_SYS_ETHPHY>;
+        clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline", "pclk";
+        power-domains = <&pwrc PWRC_T7_ETH_ID>;
+        phy-mode = "rgmii-id";
+    };
-- 
2.56.1


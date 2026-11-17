Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933716;
	b=5dn0ZSr5YtZKfi6Ciqp3rNZOz8P6SqO6a3enpJE9t5pAb3BYRlR8K/Brpd5nSiz35KZ1
	 riUiZwZRA2351ssT63iKHvlOv8sywZH7CMuhL4dORYM8JA0vnPn5O5cgS0rDWOlFydHVf
	 3feGBN0NIFZCOMLOg5rvuotLtp1tmI5JI+c0XoEOKsJUzTVoqM1AAQYA5002XaFVh6nU0
	 Zlh8tidJeVi2zlJK8ZECAIIlK4HEUn09VzR3FU3iwu3TJ8Broec/cSDgodnA1+j0PwIbo
	 mPc0SLhFQ7XEEwvb7OnLusAIII8g0Ozz4hPR4HGfpSisdhxNWoVzISUlY6Q7gACOzIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
	b=Q3QW+FBKwVkyoZ+qIVNAFCheZT6FRFbNYZQyug2VJcs/GzaAQfh+S868YEawA0fAyIiY
	 3Xmherr/2X+O8ij/agb875izcVwyRclw+CniqaTpsJkzPW7U6QOncoZD66N8fwPesIAOj
	 c+AAMpJ8V9T+WLAx9/aB9OVVT/aMzKMXilMdJjsgml1DLtS5u2SiBHvxVrO0377it+r/X
	 p3HqO/WJqmhTZmKNcJ1wc9bJ+9IgqqqAWN4FWSUDCZxJS7a52QaNCw/IsbofyavYYBVI9
	 pvYF+mVcLbf4t7vGeQzv4uuB5fWGS9y5oOFsLdTvs3UQTWxAfoNrVkKfRULLt8bPROQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEcYeJNp;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FAB606A881
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0FAB606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEcYeJNp
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb606491faso424335e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933714; x=1795538514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=sEcYeJNpeRv+Lts5wXZy6F0llPLMKNXQQzf3kNPXLIcl7F9lC98wbGCW+aTRts2Lpc
         Gu6Ud0A59ond0ewTVe1gxYQekw72vv2WdeMenM1Mev3n0wX8qmEjXlAP+bwNKXaMj84g
         SIym9BXPsxXCLDQpD3LiSGJ9Kj5GSptF8eR8zoY8WJcX8g5SRmu0PltUDLu53lQfLPSF
         j7JUlz8jIWGpihAyWWS8zhnftQhLxI3isRoAQ13WjWxEv5YJDX0AjygasZp1jNYsVKjF
         cxrRuabweevUR9VcFbUgDLIka1w1dX248YaWugml0Qm+6TMl0ntWmlM9hDD4c7Rkn2sd
         0fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933714; x=1795538514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=tDa6HmbhWiOZ/5GCFnvGWjMDGAjXc9qvND5rAk7mzVv5tmoEz4FarhCkJ+54PxsBl6
         OnM7hC4h5+jMEGDXj19U7872LRkXoZ0+KbzIEIMxujjBhe31hc+YqoCjv+pDKf5eVqjt
         GjnKpsO1/DWWaqOOK6FP62Nl1k6roQxGXXmXOBAWUcsoteSSiDl2tHBu0Lp9VwB5DqYU
         LVsS6aAdW98stV+CBfiil2S+4ZrE8+9S1HnaQNmRhCfWmxPaOMLlXjTOv1VaUJYweufE
         0Kcq1KeyQ2TxglsrDIWs+0gAddIchy8l4P2uXWyvzZViIGF/PTLXv9CdgbopcL90osZ6
         qpjQ==
X-Forwarded-Encrypted: i=1; AL+hErGzSLLw7xrynckxl1JqMSksDuah95CWxOiAI0kZItyNHN2zsgoE5PIQv1nSDvNSP/VIRmduhlsyXaFPxsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GA020UqskDTV1b42fSJV1vXcwHqCb5mlMR3J3ZXbuYECzSLGL
	/ZMW16J2ty7N/NPBgRfRXbVVtyTPTcUme/GNmkzhL8XLJzCuWDrKTOyX
X-Gm-Gg: AYBFou270rjZDHSB8rVlkaHkeNUcwLEKBkIPvpHFPM5SxE7Auugn1SSsb337XDLOWlT
	LUrY2HKeJdqe1qLVAbubHCw6VJrm0y7h4Tlk5AxxiegnrwcZonjHqa0q6eZPFiGgp3UykDMcEHl
	2EACdH5aqTBj1RIvgk1YXizNiEZV88XHq+NEGZUE7cNl4VPlOtC83ZQcRCcxkigfnHXSdwzxY95
	iXVyOMgKRHROPj6slv+17hykCOAvsqt9UOWbkfdwYBpLCZypN3/eSwFhVoK4PjBzrwLnbjkdr0R
	IE87L+f6E4tLxKR0ZwTV/NIepk0IOyHOwLRj/5yAEx4dP2hkydgYVFLWOTCY7aD0dsrP9JUqqa7
	z8B40egA3zUYJRFqz8fag/l9Hlz0Oij1ZQ0lMXshQheSTDCO7wrsBAWj3mExg0FknJJIE8fNi+6
	P5wA831MHVdkOdfQxGoSUlB2mFa5LOj6lZIKlWcgEcf3RdU5TX0AnZWhTkKl3Bjr7TU1t+kXqJa
	Y6CA5kr9WN2pFHni70CD/rONNQAmM9a0TB3RyU8JiciaEwL8npg7BrJ4k72znan54XLkCv6maYM
	T6XU1RLhgu1kknayLgyz07SeKp3+DNowCCpBhpm7NIOfTDxrArqseJfx+X9cQv0Vg1mpokem695
	+TsWkib/fFs8Wx4KnVGFF4X/hl2LAa0oUi2c=
X-Received: by 2002:a05:600c:1c0e:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb68e5bb4amr237923745e9.16.1794933714168;
        Tue, 17 Nov 2026 08:41:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:53 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue, 17 Nov 2026 17:41:30 +0100
Message-ID: <20261117164132.47167-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117164132.47167-1-ansuelsmth@gmail.com>
References: <20261117164132.47167-1-ansuelsmth@gmail.com>
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

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..48127e956c96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description: Switch exposed by the Airoha AN8855 SoC
+
+  mdio:
+    type: object
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - mdio
+  - ethernet-switch
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 GPIO_ACTIVE_HIGH>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.55.0


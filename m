Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582477;
	b=N3dpQ4BPlcAc6qtJdGfq9y8e0Lttb451o/fWq+FEWjA7KYCW5p0vkqThzMHMnSm9pnqu
	 jHMV8gUHzcqizKBtYHnqvjjEy8j3kY74P6VHUkl0FpmGV1ZC3A1M3BaqegsBt8nJiUFfd
	 RCjiFN9pojwBwfgX3K5RsJWV0o0C9ZY2b1GJlcq/t2f/XUr576G+WlpLC/ZKJiiFlK4hS
	 vlOmL1iYJrWA+Q6FymlerGQTzko3CBkiLOpUKMsh3RPz/49d7cnjshY0M05clp0cIH6cC
	 jNldR5rFxb/sPj6+CJfHEHBQskf/EY1wByvuWPuqYdB3vBZmzPbX/G+W6MFDtFptXnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
	b=ovyd0XGM1g0EbKeEvPqAKGZKnudpz4zqFMQbB8gyEavhCsG3ik6sJaAOKe6DLpD3aAtg
	 M92/legv/1jrYqNkhBdacnSoe2kZKe0Exx8HI4ntcsc6pTOmg182g6KCTTqPEp5xFu+br
	 wBbEiVaAnObn/Z3ebMY0UJ9v95stltCtdrx3ueVJOdt0wULcIDEaYWaCy1bAcygYEPhT5
	 2cvtOdAaIet2uQgOfqeZCJm5eOAhNz/K8uCTHZFBBNYa6BMNuG7QbVqrpyOx1nts8Ha0w
	 kzVFvTp7+H5pMik+cWueaDwx1JC12TExkTT2mB8UBmrpnDAetl6ChKX3FhrmX7zvPUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PwqR7+SE;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B4F606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B4F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PwqR7+SE
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso626327f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582475; x=1793187275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=PwqR7+SEfDE00LHg4c6TRp/whilgLicIH9x0KLuJDLz6mDthbM7bchork4oSUc81ng
         hALl3itrm02INZTTCzLc2RdczMaWHwhYOv0kJhdbCatYSwptUuOy/HTGu40yfyE0jtOG
         fzThuyYZibmqMqOj24UT0s9+iyvHzDtjh8+RIMKG3fXZUQTfBLFQvPRX2ipzDimQvR2g
         EnoGXlas70SxzBZDY1o7/Fz2+EOLGzeo7HF9YetHEK3WN5n4Nqg33sEykBzHaffOzjzk
         U9sMBK3RGjSSGPXXDfLiTZFiablIHEM9K/y+UPLBohxP0Y/1bOHNWGClAMBYIJE4dh3v
         ubgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582475; x=1793187275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+ciZeljp4XbV+7Ul/HTP2zfMzICzcEEGNyLNPo0cRI=;
        b=pJqXh6wk97uF5ukfhcYkYN406W5SP0CHrfmcmR3n8+TsB9BfvpB9mlAf8zEGNRDgEH
         Jh4SH0aZ8UXLqoTyfC1MFxxXQXtECJiY5nFGDWGn2tMf5ho3PJ+7rC1LfVw6WPn7kq+E
         yKNNP1SYNPoRZz6Cl1dRDoJ4ciOHM6anT1j7DJUZ/ARfY1GlNSjIsTFCqExMOKbEVpUN
         Rmuw1CbKu3tD9/vF70gH6fwQcXpddCAgrFk+CGIZWyaQ7rhTzyIe7jOMBjb9+1947McW
         ZqF2YuA/RseIZv7OBMemJv4TdqJ8G8xDxV1/WilmmIp5mwY4Ob+bjjs6dJ+tstWcphy1
         dz0A==
X-Forwarded-Encrypted: i=1; AKwUvBxx1+wGbtu1Od6BJzcCYz8fAkO2OG80xpzxWDxZ4obEOxr3oHjykh8Xy2heFcf2sEgi/xR5/r0CulMiRrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhS4SpGhREP89iqmjRD/dbHRyZ4n3k+UzuJbtVGdl0/CvnYs6G
	azj+RkxjxrYbhKhcoAORCI6YcWGflFppiJMS5vozAQC6ebDe5sI3MxL0
X-Gm-Gg: AYBFou3gOoBGBL1VekA63rVKQVO/cG1a4kZhnl/zqReVrOClWpuc8LdXLTiUdvCAj8U
	gYB6giXL4kCe6VX67BeHU3QjRWbKirdGtbKPPgl9oBI/RNn5fVLFEaNWU7yEUu4Hz/WyVSoPKcA
	R1UepMZlG476fWs1nqwEe3yg6EgZ4aZXHA4NZCvPj8jh2Eaapuic8XlDBFEEOlxV5a/LsKf9rfA
	9LxxfHt4HDdbZu3Fkkps0XEa5qpzGHbt8SMN7MVSajMUj30rkto1Afywnc15oeXOL5mIfu+ncPR
	owyelxgogW9JwsTudM74FT1xDetD+vjf6UsqVcGiUYMLSJlmf6GhbfdcFQynaYJrFWYHovcQNUj
	Qd7quY3IsmaPaCDHkMxMO1d7OiR7LazxLZ1zPhwad4XS/+D11XBkK7yj0OQYVTKuMlnOXbSkU5Z
	04oD3gVfp5LCVCGG1ePpV/dAyrsJvNHCuztzgS4G0oSRXIFvuYC2OUZrPRSPP9JFDB+wY90739S
	j7hfO4iFXsBpAdNctAugF9+QNPZgbkI1ByYPc76FdgHaBN7UtspPPTE7XVT1r/gn5j8ruVBCRbQ
	AN/lS588J9LZCPQgZuZhED2aByAJ9nJU4ur8+plL27IIxqoTB+r0WMOjBmUE
X-Received: by 2002:a05:6000:4b0b:b0:48c:414f:cc12 with SMTP id ffacd0b85a97d-48e264d185bmr3297266f8f.40.1792582474839;
        Wed, 21 Oct 2026 04:34:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25833b9asm5068768f8f.33.2026.10.21.04.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:34:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/2] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Wed, 21 Oct 2026 13:34:16 +0200
Message-ID: <20261021113419.283015-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021113419.283015-1-ansuelsmth@gmail.com>
References: <20261021113419.283015-1-ansuelsmth@gmail.com>
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


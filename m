Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737851;
	b=m8AMyX1FRHCaCoTNH6EwfIHzXOjZjjuIL0uVWz0lxF43BMTNYnoMFX+Tk9W5H0THMyJK
	 frXUbU85l9N8HLOVBgsDmyd+8FP42cwd3qbytfr1Pwj7jVozCjyo7pw6EOOr3oJjoOUrZ
	 QCxzR7K90Y9sWeF0oY+zFThApT7PTSrE2aiRsazoywN8NVb7sWdvryUMTHiWEipG0bvJl
	 Enuwj78pk/hGyauPHG3bh1MSLed7UZjrSVa3ybH3jZu91aRhU2Y+GL+IKGc9YQcjTbIo9
	 z7EuehauFe39zkiHU1SHgp4nZ1TF7/pTDTYIerPIeaGmd2H/5drvSPuIKNUHEZycjHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FZfYo8SuzajjbwV4kqNY7tywvSI0LOY4vzOInvykOJI=;
	b=XNKVLvqujXheY/Dn8oYJZBLgWJI1yqvZ0twgOSsKBc0bkm2fUBskaNOnmyfmC4B4fXLf
	 u3GXY8pfP1pfGWwgBUlHGPHxUB1bqfFNc30gFhwGArsJUsmycw6Ia3SCZKw2s2V5Wvr4p
	 diWSJxXmr/dRpy5jUsgmfxtPCZFj7t7/yP3Q/tP9tSDuHa1tyNSdTnAGuEpOpZ+MN+Oq3
	 Rcd6hMZXYmCrQxYXMfke9wk9K1AKfIoTPv+wm5vMtnIu4Sj0ucl3kBbrOZ5mnJyhz0mT8
	 5o0DLPIRfJER0xW6eiFqSzvZFaP2AkS9je5XCPzhToHj6thHRl8Bq34u02hKY2iRt1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+G0hPgv;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4645606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4645606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z+G0hPgv
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so7194455e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737849; x=1794342649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FZfYo8SuzajjbwV4kqNY7tywvSI0LOY4vzOInvykOJI=;
        b=z+G0hPgvJEtClVcAOQwvDYL/LaCrrOLaj99bug0eOtu1t7nKLZINdnWZnMAluamX4q
         P2s8eAbfKmM4bIxlCMCEQDiLRH00FzQifTcN51bXR6ku9SNYB6Cj7n0tsN5G6hIbfgxx
         pOH7TEr9CXKtG3y2cNqZdWtB9Li7RiaKLObp0wTTkwSNWnUHqSUNtVcmdwFpr43whHES
         xC80EoChV922tufQ1Qqgb7LIQEmh/XYFjuZgMPXgB0kmMMivnSHaR6JwePP9+5bFZRRo
         sqBxaSn3JFakp9nWtuX15vQPr6F+ge6ibino2pjDFXaAUD431J6y42lvDBhDAUGiu6Uo
         vkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737849; x=1794342649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FZfYo8SuzajjbwV4kqNY7tywvSI0LOY4vzOInvykOJI=;
        b=10hshOyUb9+8MQTNU7X83ZG43eS/POyhskhPbWGmMePnsAPwtDk0x6r/452mDzRWn6
         nGvu9YDuXeu8Xfie79iwaTXGHoBetAMFZUEMpGC368CY0H/Q+TtedzPmFIKIzm2EkFzT
         cvNXQO5yHtoxGJfK1BAVQru84WgbBcglZFIyDobXsVpB6y3KSNdkVnDBB3/36oBaqJ1T
         K0IX0wkvfUeTmaE/qgpaFDFpn/t0j4W8nvypwNR63BPa/Ik8OOpCSjdBVBgyJZyCcH5u
         5L69d8Yty4FJ5Mg9kvP5L22yqc0zrzJkyPj0xiYPUvPuUt9oEDiu/rz1JfT1WQGpnE+b
         /IXA==
X-Forwarded-Encrypted: i=1; AKwUvBy4aO3SxsrCodbGql2xfPJeJnmMCe78eJHiD1PuaQShTamBSPsyJOAMcJhhVMUzlreBM1FYfTJ7yqRsNkA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r0CVyoGXup+fpTb3WCB4YQwjUQekGSr0DuDpJcDrKrPXibih7
	2/joYGJWuTggROS6c0hn4JGeLdOBQna7EAtQLu4RZClpVR2B7Wy7J+T+
X-Gm-Gg: AYBFou2cc3EklKqte2YWyAvZxoA1cVcNZ23D868yMmwOR7kDOMWzc9LBvH8Qagfm8a/
	nZ8BSiqgeSxDV4sbrlEzid8+8fbb3xVUAqdTkwEJCj/aJPPQTG7+hCriy0BKvMh4WnsXDeWu7+Z
	7To1/d0hsPtgghSQtvQCIk6Wv/N1gGX0lLRhUh9tN/ds7Qtz2TIYNd9hdfSYXEgU3nQk6ypuXTJ
	UfNSPLC9GEOqbQc8F46IZpMRe3ENignQ9OeMXc1oqOncn95HDbAM8BrypX17HvMic8iWXtyTvi/
	GXBc+q0Ak821l5lcZUE5vYQ80efzI6iRhR2XkXkuBspzMD6of/ZMlnVjwaOIotbz3um0W3am/1R
	CpWRuwSYhMCfSqAeaQ5L1R9w/POVP3gpEUSL+ZfVJvy9p8aBJhaFRGMQEFO/ACuT7p6MMo2IwAs
	GHNgbkSmm9OTjLBQgayFK65AT2d0IBpJvanrS0P4rV5w1hAE7yiBfHbtmyAT3ewsUax7Zg0InK+
	I9x644dsEFjrwxdK/GHi2IduOLhTgVejlUF+/p9MLZtQCo/i6mzuyGltGcZAs8kJL4bTw04mYkU
	9NXAjLX0h/vZQQwGitt8jrmxvY08qHYOvOyK2bYU2WqBbBsNZeXHNRZcsyOSLezWGmrCbWTHtm/
	yBq1EtfPlt7f6dYhh6whwcTaGDcW1M2SCXQ==
X-Received: by 2002:a05:600c:1d11:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4ac174712admr336521505e9.10.1793737849367;
        Tue, 03 Nov 2026 12:30:49 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm75110245e9.4.2026.11.03.12.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:30:48 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue,  3 Nov 2026 21:30:31 +0100
Message-ID: <20261103203034.12869-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103203034.12869-1-ansuelsmth@gmail.com>
References: <20261103203034.12869-1-ansuelsmth@gmail.com>
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
---

This was already approved by Rob but I dropped since
I dropped the DSA switch section and reference (since
it will be handled by the other series)

I have a question about this... Can I send a follow-up
patch to this schema to add the ethernet-switch
and make it required by this or will be an ABI violation?

It's not clear how to handle this detail. Would really
love some guidance on this.

(or maybe the DSA schema should be pushed with this
series?)

 .../bindings/mfd/airoha,an8855.yaml           | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..ee7241154851
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,134 @@
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933713;
	b=HmqSEAr/Y/RUHkwoNWXNHX0eKDywJAwzqpDrvjm8a1ifq8vr8Vc2I3a3zvriJseiIvfl
	 8V0pJMcH7XNVmnGnBdUWGydoCg29XKImF+2n2C9DWMdD7JNf4J8FoVKF1RbW5IitwzfAM
	 wAVhSa/Z+7yZFbFqPHCYCJtkgt+LOn9cbNBaubnGrO4CjGFflPLZ0HUAxqt90FRZTWwGx
	 mjAv4yxYfcQeYvcx0QPKEihVqCNDyHF83Uxma1cNZaYMDTZ6zWquMshEeJmdOWwD/T8fL
	 wqPiXpwKkc5QS4BBslLnWf+fgBETYPzsmaFv+DKbNoW7ELTTeyY+3aED010iHI3jYiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
	b=rUI1Zfi+0C6kcM1/yo69gyNswCcSrDXdk6PagD8iAeLQp+0At0VlUz58KcQnX2BcslWS
	 FCGUlZSa6+YAUAw0AMxj7DwyMkx85geBiBoHf4YXYW9aYgiKXpdiotOOeqEKWCkAkJsok
	 3KaNY1Fwjyaw1UKwFzO092JEZzo3eYU3HxIfy5oBLDAXNcrRhxwZ7+NmsgQOS8/BC1KKV
	 YZiHE2MxsbYYbjSeVCmdV6HfTC2MY2OXFPyeUwhQGQmDhFR19C9pL7IPI9aEpGuq504Uh
	 RCes+DcyU+cRS3dEFBViycLtfDs8Uz/cY2gIG306IZdCOtcXvJOesgRfvraOPOJCAJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wr3dxYS8;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A1A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A1A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wr3dxYS8
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so810955e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933712; x=1795538512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=Wr3dxYS8E/sYgWPey/0VSPT1Gfc1PRONLdWZ+g/P/yGPigjE7HGMAvvplayOPv7WOH
         Gkjdjwv34Iy8UuYflzXUCqU6kmi4fVnB6Fk+N0fNQHjRxHeLEeiZb/j1g8tjKCLgMsN5
         YyMD0yfaBYIfuj10gUKwwwSjhZkU5+AzRjdih3sqiAMZFNymcpnH07O8k3igCNI3keRy
         Ssq0vtdPV9i1Grj6jwmLAGksAK4fJroUzS+xxTpKP8NhI+1ujjKQ9rrUmPvF8Cm4qlRv
         wdUbn6l59WkhiYKC51m+4PFDz6fMOGZt5CUvl/qj/AhDgoUHfdnEawKj/lqEUikAvMoV
         0YHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933712; x=1795538512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=OjbsLSkGkSRmaCkXawGVdeKyLn+w2N9GZDlf/o75/RypMKL0jPW8j+7t43o3/vCQYO
         AnSt/Z8mob5NKi5gEbPPQ7C9nff1XTC+1g9Kdk7Y0ryUnZm1LyBZOnfa38zkCnWS0ZzG
         XrBtWEe3zXQTJ6PawzamK8fqJCuyqIGNGtyb1YasOqkoSNyh8CYN3z0VE8ez8L+7kWiw
         od5A1EdT2LbiGMT2lTrV/GYgUvM1crucE7VroeoZ4RAyBTQLnoonbv33j0gPxBqVuZ2m
         xaa2i0xyvYTJesxhOLoVtKbbf1ZMT4RAOW6EamAked8SkIzb06X8d3kJ6UUerT4acI3E
         HF2Q==
X-Forwarded-Encrypted: i=1; AL+hErF1goqWFbw+BaAl4DmcE/FpBwtF7qMrrB/iUGqvdCvABZgyt4Hmd/+xibSOOWfKi4jC1wfN3zxzEvADsZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9f7d5JDGBOYJlsK/+lkeanOxBzERLSMcWx4WjBkeOwcA/IPQq3
	8ZYvQMmrZJlqlaP15jWsSjVHox2GJuM/o0Tpu7cJnYJzt1Hc8TXTzobpOuqs2A==
X-Gm-Gg: AYBFou3GAn5VyphnwLdM6LSP0uNEGCPQDSHb+zOENSH7KjLw9WjjmHD8vXA6r0JAoX9
	L2vqLo1ndRQOjoHWTrsdwbeAdNTSzDsdok6CQ+bmq1HG+/SZwr5x9CxB4NDf8fjIA9mgWhuxsz7
	JUEmnJ7Dk8LTnhSZbeccPShNS5I7NzXoVDCSWyXh/AwFfIZ3j7ycbMtEtDH045HLBCTbAoRKxWC
	4SLDqgOIAjhAz31I4hCyBEkIPAB7R3m7M62rqEk03MgoGzMelBTNT+zQmm6Z3Nqhbe7DL55JK+a
	sZNz0+T7cCWdFkTWlnNebi4dSy79Dti8YM9QBNzozYnhhwAojDu9b7bimcZkbgiLWCAZKPA8JHS
	/eQSpn8EVmyHGHkvLB9xmq9ACqIQtzOqSQoxN32izNhDeOzG2BbYZUIFrM1PPNqS+2tfoXEEA2C
	6EAhAMuvkR9ML2P/GQL6P/0ypbDXLxJaAr4AINNOnw5C+ZNzMnrNXdNlPXrd0FC0Y6a8VyBYEWp
	qvMmg13sNms86vQeKoNhZtuRYBueYafxTPGpUXxCrtuoKaJioNtYWlEwcYaLMhFcxtnRtpsXse7
	kcrPVFeO2+3TIglFFz0orol1tODsfx1RiFt906rGNx3K3EdBGZTuu0iy2uy5SLfgEIButa9+6lB
	/EPxDgCup4jEBmXE/D4SzzZG+YMMIFMAj/BI7oE9b8xQxIvoVmkD+fQI=
X-Received: by 2002:a05:600c:3509:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb55c5f579mr313862835e9.2.1794933711523;
        Tue, 17 Nov 2026 08:41:51 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:50 -0800 (PST)
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
Subject: [PATCH v3 1/4] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 17 Nov 2026 17:41:28 +0100
Message-ID: <20261117164132.47167-2-ansuelsmth@gmail.com>
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

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configuring the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.55.0


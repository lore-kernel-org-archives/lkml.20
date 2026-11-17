Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933714;
	b=x24EP3hVzApH7OzVtVM0WzXNGViOY0StBizS3k1RZt+M/hagXwdhCrBIvu5WROr1ih4e
	 t3vjGHkOVU2HJfGIF1WrAL7BCcuBBkyxCmxdRA9y9JBiefoniVQYK7anPfVbiCq3GAKDG
	 KBpS3gW84wwyueo5GKLYqomIqfiLDzQZkdZ2g99E1+7tsmZBhXFjhs70HKlHY7KFW54FO
	 6qoeoTq6brEKshcTJd2ixCkS8odWf0bewmZwS/HiORsGFs41LFGbJAJ6YFntabEerbE6x
	 90y97ekNI9xQJR83tuFFlsELOjBI58wJT2KG8q/5P8RwBQ+jH57zafl14m79nBulD2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
	b=seDyIRQ18txDRttf1pdSD6Rjz4TOY02ozQpWbchIdvkjdJv2hLTXIlOApQDMOW1yi+CE
	 vNXttvmf1zfkLisC+G4uVE3k3cqoyCWTd5z0vV7kvFylg5incIBcpZV7cY0+eALrpCIWm
	 c6J4tKTrtsLnV/y2mR/G71gCRF09R88h6qETkQ/DASWMF3o+Wg55PswVCkyZD4TRiWZqd
	 tIEeeeNY6ndBffPlqDOONFxllIDB0ty9F2RY4z5LShBaKn1Cd5ey+MiWwmsfnEGQsWuux
	 90+8Ag3hTWXZgDca890agbdj6npXexgOyHNPr/8gD/U3iztpqQTasU+iJd3p3dSvzzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diTmpu6i;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8454B606A88D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8454B606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=diTmpu6i
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso537585e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933713; x=1795538513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=diTmpu6iPHPqo9m+2tYHVlfuMOMp60XxZZh5NHM71BDcSd3RXbX2ViehEIizRNnlbr
         oFuzXfimjV0/7cr+Bbp4qEMTOuDfRWI+8MTvs4vFCs0dhqbxbIPktwdpuNBiP+SjerHA
         n99AByFdou1LEKDBlApVm8ocFugtqCNfAViA7evtO7/RFmupI2z2M12XV5e0xI0OkvaO
         TCYlFtVIX3xoHheHy/R6gv4DafEM4vdfEse/C8D/2dFIj28TUh7G7N/9XLw7gngX4pcZ
         R2x1tTveajrkHIPiCQg3otNZ+uSCOUTO1ZOd9j8twMnpth38yComQ3bY0m0aLTn+P0gk
         cwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933713; x=1795538513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=Gd0O4NgtlQ4xdAoxwt4cHp6oTfEax08sz9J794+56ZF2rIytUYP9jQPHFTyGOJtwAD
         dZTw/Yc7HkWCpWWiOV+Zt2BFgSX5dBKnEw3g+PUtfBsSujRcDLJ87ZWDblw/1mN8mspi
         B+QRMK+AG6m7KgrdiuuYslQJP0K5DT0/Edmk0sYqFa3ezAjKjPUxTPrH7XG1So/tIlzr
         2hv//hqUBibGteU+KrjMaveMVhC3XkOM+YU+gVA0ZyhTDqwoaqDC3Mbkr7UhMOzkoTB8
         foG9Cqv13JKIanD5hGtm9aLTqfmkVSTrrOdBuIDlAVmwqop2dgnxvLkoELxNB2pImeYK
         QRZw==
X-Forwarded-Encrypted: i=1; AL+hErGGS7W1Irbeg8CwYncnpOTKXPaRb7LU7xHKkspBpEEwyAnc9L9FhTHYaa8WTGH2S3V3oNeBkBbQrguJBSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PMym9uDXFbXCk3ohG325sQxFKAiu+Nmy/SF52yJxesQjEtUfX
	yCy/PNVG4n5YcFOADpx+XQqXvmwaJ2JouWoJpaL/nTqdvW+7qS8y9EFQ
X-Gm-Gg: AYBFou0NI22OPjqBYuC1OA4MoGojX6v9NvcSBeBF92BvfJABVr52DcEu+Jhwc4xASk4
	3KJOUTUxzatqSgUaOXApTErHvZxuB9dpHU1D6FdNAi4kLk00cnLCiHevVsNGWLExkG8UbG80iKI
	HfUFThwZI9m7LvJ9vRgATZ8zA035G2hQtegocU6PwXUtnctSfiuK5n/VaX8qy+X5HPmZygNNdmZ
	mj5HdEL95y/RqRBW5iXHHA8AYqswtxwo+vsRgkwuhCiK001Z56EvIznNODsvckmYwtuMHSU5Rph
	jKTuhGOsFD/vJTurzc2HDzak+rYEDra7feGLG6vOlIyZSi/E520NS94e8NVdpWsFkZ68XF8cp09
	qUFQ+wmlNhBQIMUPDqe+v7LXt2qLDgMSAE4TEZT9va0+uSRRhsTZjt6boJ2j5yMmR1Scg7mSBsV
	YdaXPY5FNK/pTZI4Zt+zwdAZC1s0ELwoW0d82pFLsACL+H4Sjg7/AI6SnZ4lCO/dy5EqNZiVlgp
	07u2jQPltwpBXRrPjDc6aqJsI95nr/5juBmk4YzWG0OTYxJ9GqvoZ2UdnDjAwqVjfbpcADVHqLG
	7mvi/csTVCK0DIFYz6rPey36Jwjmq0CWEa9EXxTNRHk5IRiWD7qENA/I0nKkTmTevrk8WBLy97o
	xJTM+q7qG/gqSh7+TqKIlySj3qbwjP1VOUw==
X-Received: by 2002:a05:600c:1988:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb5e2693b0mr281411975e9.0.1794933712865;
        Tue, 17 Nov 2026 08:41:52 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm82316475e9.12.2026.11.17.08.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:41:52 -0800 (PST)
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
Subject: [PATCH v3 2/4] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue, 17 Nov 2026 17:41:29 +0100
Message-ID: <20261117164132.47167-3-ansuelsmth@gmail.com>
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

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.55.0


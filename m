Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724F94A8410
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637252; cv=none; b=NdwpViGNz+n7+c57vNVITaHprFZcl14WVVGVALHocOxuVravLfa8MoCpbqGLAy/zU+pPOMeC2F184ANN/VsRhGQiwQCIIbByBANarqGpf0eTHEFHj4acRMyOLn22D3cRWn5qqWgntyS2JWWxi3echieGZ9koXnsw75mCVfzxJaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637252; c=relaxed/simple;
	bh=GabFKJ1EikIatcIw9grczmA3skhOW3B9YOrjGPqa0wE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUVevO1255GpY1F/PuJy8meuJ3NXLTqu1iXg98eooaQXJ7ZM0oQp1vlV1jX8pyhJpmeE0lMCb8jq1AdVOywNOHdg0NNRlIj0P32lMv2Oj0GZskT+H8qlQeu7MhfE/YKiLApMx9lT3Pt4L8phImniNb7ccVzlIQ+r3hWPBmJklLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlPjjRwp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlPjjRwp"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso14790625e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637247; x=1792242047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JZGGWiHspaUSLm7YkvfnqPFJNEs8gUx31Fh9NnvvTUo=;
        b=TlPjjRwp0MBhG3r8H4ZrJziW8cE8kPQLyx1k5o9QLSQID2QQeFvJS9r+qgD84m5CuA
         2Ox5BgNEdgwu2mBJYk9P4zlBjqPxbsm7nFcW8WIyZhGE4bGuHB5i4htU0FlUPaR9LP9X
         69RIup/9VGZvU6e+IVWuUuUFrDO7/gegU9SPQKI1is/krWFqRD/eDMBm4o9UlLaJabJd
         CX8p/VKNDhpqKOeEqWzVkkMslg8RE0oQj7t7vYunhlWz+Ui01NnT/fd6RaTx+/c0qgM4
         +p5X77ieTu+CkwMSltmCGCnhnDgic981ZW1peeS2fAVXaEC6aocpAfOGezvz+vlw4IkN
         LkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637247; x=1792242047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZGGWiHspaUSLm7YkvfnqPFJNEs8gUx31Fh9NnvvTUo=;
        b=hgTycjOGy5zOao4SQ9VsF7BRozPHereT6NVGnsoKEgJqh3uqqqYThHmMHT/icyGjtT
         6kp/TyN+Y89G6iIEEnOqaW1OCoDjrxZFYwOtv4Poaap9SHgCUTU4WieL1isqAzWTQBO6
         NUsuObq9Xy7bZ23pyUXZn+KIfA8tCOxa3wYjqazkdpx83QJi5sBecyXJoy72IaR7ucIx
         MFvum38NYzQWWgygqwQqvTTGLNx8dM84T1jR8bsSAjCDA0GBzCO+T2CkW7uyOqTsyiIa
         dhfa73qEr579fxPuGnF6Lne+hgobh9DUfYHzGtcpXNOTTc3x/0+t25iIBpHswbtncXRa
         YNZg==
X-Forwarded-Encrypted: i=1; AKwUvByDst5BrhICPQcsaqtnTEfcphXQdH3DF1CsduyUW7D5gtkI2CEu4Vlw5XRziEU2Vbtr20W4swxaArK0W1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAAwzgnCAcRCQ9XOx1wiUcsy3NW5UavLoJ2vKpZgN8cVp48rqs
	gw9neAijFlfaFo8gWf/ghFexXEOvfUQXPHkBStaqbHyYJMaWO9V0WJtU
X-Gm-Gg: AYBFou09uuKeDqb7d+jxNys5lxqVlUycdnJk2+6+zQIYKHncDflcg5QJaj0YkVrKifD
	G6UGQ09FETXLsIbM+boRU3VammGTkywOu2vySVzZyLdqp8G1EAOrchUtrMmeiz0r6OfyZ7WuKIY
	YJjPhmVyxNwPgyrZr6b24BFWGvMNi8o+T7L5KuCdAurfK/VVv2y9Bc7ofkup/rYSYVHvcZI0btp
	s2BOFrf9zopH8uAW6vRdp+hezQVoklRYvD60jyF/RVEIIy82rDiKiPqNHchYEQvcKwBIdqmpxDL
	6yrwdhfVveLkh5dC+U17AVxmyme/kMi5q6V8YnUqRwfa/AR6BAphBKRB7AWRytXI+moNs+oA/pG
	1Cew4qzSlSMNGmN/Rlg87J9wLQxOwDZdzY5apbnkGep0v9Q94k/VdM8GmN9uoBhXzNXTz+MzAEe
	Kn0KAqSeKfXzMEmH+w6TKJGf6XnneNRnIurepXnAoSnX7dYZC4F2l5IIGbWl9+DGjM2/RZDaEDI
	zEj3+E4vhMKqYyIU0upbtGvz1cchh+CVq6w9QILSWCO9zqKnBnDOPOdGtO6IAq01sovjtq0PTSd
	E5p7eBr492eZguFwOkKRxpr4WAQRlyAw2JIhznv5akA1rU/6xxBa0FUPmC+u2w==
X-Received: by 2002:a05:600c:810a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a18e3ef100mr78533535e9.0.1791637247192;
        Sat, 10 Oct 2026 06:00:47 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:46 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 19/24] dt-bindings: spi: Add ZTE ZX279128S SPI flash controller
Date: Sat, 10 Oct 2026 13:59:57 +0100
Message-ID: <20261010130024.177503-20-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the flash-operation controller and its work and register
clocks.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/spi/zte,zx279128s-spifc.yaml     | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml

diff --git a/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml b/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
new file mode 100644
index 0000000000..967d460ec2
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/zte,zx279128s-spifc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/zte,zx279128s-spifc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s SPI flash controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The SPI flash controller of the ZTE zx279128s runs flash operations (an
+  opcode with optional address, dummy and data phases) on one chip select.
+  The data phase can use one, two or four lines.
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-spifc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: work clock, the source of the SPI clock
+      - description: register (APB) clock
+
+  clock-names:
+    items:
+      - const: wclk
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx279128s-crm.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    spi@94406000 {
+        compatible = "zte,zx279128s-spifc";
+        reg = <0x94406000 0x1000>;
+        interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&lsp0crpm ZX279128S_LSP0_SPI_WCLK>,
+                 <&lsp0crpm ZX279128S_LSP0_SPI_PCLK>;
+        clock-names = "wclk", "pclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "spi-nand";
+            reg = <0>;
+            spi-max-frequency = <50000000>;
+            spi-rx-bus-width = <2>;
+        };
+    };
-- 
2.55.0


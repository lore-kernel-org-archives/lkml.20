Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E153911B5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284964; cv=none; b=lMxqzQ9+xBHV5J+pY22p35CAxmZzGukbXgr4bjDyxhcA6ahmSt0akpJVHk1xFSLaGFjc739w6pGCkvC8QbknV35uZO3A7Y1Pw2Du0RdSNnt/6JdfyMPzkdFVJHCxcwj+1db5keysTS5Lv+WMZoOmQ5r5IdXDXsa4h//JoutiELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284964; c=relaxed/simple;
	bh=a8UW03hFC4y6xIrI/jY9IpQN2DP0E4+UInOOitHWCq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RpRlVge24azDf/HM/SKEG+noW6hP5K16L1SSAtxe25QjuXZ+IeuAcbh5znhZbM3vTg4glhbG49BOwKUc3wCKLP+VDewemdlgXxtqayGHYqyRMzDtVslVQdM214hkDvUm8MtxWLpHY9m023wkJLuUqvWRl953cj3D7yDRl0miBNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKWg6FeI; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKWg6FeI"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso205582a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790284963; x=1790889763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNeX0VLmUYHcPXZxiAvv/hSZfqe9z0guoQ2EWN7NS/g=;
        b=UKWg6FeIp+QcZbBOi9RV8Vsv0ybC+q/eQVqfLW9gXNewL1D4v7MyuCnzSRSIZMm4Ya
         cOcl4aI7OKLygx0FoKHCqsfc8AZp+mP1zMRP23MWAWOh6646wDaGF6bzNAwJ7dftM8tw
         SJeD16wrp2Pa7gqrWpzaYA2KHl8Xo9BQHwxpLsZGTYWMtAi5FJC+qzeeCdcLYhXrag14
         AcNwbzyL1+2s+SxjA1wnoRDigjo96wy7nDsKINvwAUrxuzGs/t3b4o9PA9B5yO1J5kRo
         LF/xltEpKvIeZbFdJimhiyCwZKvWnST7j45zFQHVEBscPwZeMetjV+kmxkay1OzYFILW
         PUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284963; x=1790889763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNeX0VLmUYHcPXZxiAvv/hSZfqe9z0guoQ2EWN7NS/g=;
        b=CX4v6sKamxAUHA/WxZbotOEosO8xj8z8BRkfyc5KyJElG372cq5XbXfypVGm41pEAB
         r0gMKzYDom6UB04vHERFlsvn6wHXXrpsdgWNT4oOvkSP5elzsp5kH/x8/wRLyddU8roT
         ZuJcUH9RukUWx1yBRud5PAdnmOarrzzYTt83JZM6TLfPHil1OaCWZznZrHcF2UcmH4So
         c50KnO3nbLm1VuayNuOnZP6EiIREO+kJv4T4Uj/cErjpbbkuz51E5bZ1xODnvjx61JcC
         rMwQnLD74oxkyYdYhL0ZiI4ydjFQ+PE587TfBlYDsEVhBm/RRqeRfW/aQeIw8jVUJoRk
         B7Pw==
X-Forwarded-Encrypted: i=1; AKwUvBwzCopMHNsOf825bJhOxhQdRVBMCGwJfxuz2RIhRNsyCMzypnOa4T13ZiGmyAq11vnZoWXzZK90wwbJ5m0=@vger.kernel.org
X-Gm-Message-State: AFuF++kk18+AI8qTNDUJNP4Ad3B+LqUEPrro1RbK7BXKFDmSc/w6hhVD
	7OtmmhQfdvB6MGEpSqzE2wegEffOBNuHumb0qvn3iYAHjca40mZEpajt
X-Gm-Gg: AYBFou1DICefQZD0MzVjy4WmNNZjONhpv32fyTsm+YeGAKvjNniFG9iclPqYKQIwYmw
	9Zv+SxoYWKT7krn64MyaMe4qiyPWl9OSBu6GsWKgaGmW0JW4xjv5sQ9G0kjVnHNHnUu1da5r6Hz
	u37J6pBLqzeut8qLpnxzFjZnw+apdHmSoTLb6O0K1Tnpnk8EDSJgEeMoxOIm3weWdmPb+CiAx2g
	b0QfSA+dHKrdWZL3OxDCFLDX69trKsru0z/ZU/fwknq+Ykt535yDrAz7qM/r9XAgAa+HICB2N2J
	k5rCub+ZgaE/W/lFDK0NpPJBpnztIByhuiLCXvoDe7UKnymueplqj+NjWwn07Xh9bFXv/wddqrV
	1WDe98GwvBqNmAvF0/i8eSX037jyL10xto9zwFGePndPubo+6BL5uR2RZH9hVCAlp/Hz4r8OKZj
	9aEhgcEZ/iYbsaWu+9nGb8B6vH23+K4e54Y7mAKmO5mGKuu91zIMozAYzqQsx1OhMkkNQq1CI/P
	/oyJ9kUTzyomiT1kcG/cr1+XwP0ALAvmz9m50kbTmLIj7pDrexKw187O1iXZKXtOFjQoE2O7Ou8
	TsnOnkgSIA/WK7ssbUZtLKFKtL1BL4j+yrrxKbEjRy7L9wNVPecfxVCnVRY=
X-Received: by 2002:a17:90b:4e8f:b0:39e:6c68:1551 with SMTP id 98e67ed59e1d1-3a09896c4demr3131575a91.25.1790284962600;
        Thu, 24 Sep 2026 14:22:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5711sm461579a91.17.2026.09.24.14.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:22:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dt-bindings: mtd: convert IBM NDFC binding to YAML
Date: Thu, 24 Sep 2026 14:22:40 -0700
Message-ID: <20260924212240.81857-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NDFC NAND flash controller was only described in a legacy text file,
so dtbs_check reported "failed to match any schema with compatible:
['ibm,ndfc']" for the ndfc nodes of the bluestone, canyonlands, eiger,
glacier, sequoia and warp device trees.

Convert the binding to the YAML format so those nodes match the generic
nand-controller-legacy schema.  Describe the node's reg, ccr and
bank-settings properties, along with its "nand" chip node which carries
the legacy partition layout.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: fix wrong regex
 v2: fix reg value
 .../devicetree/bindings/mtd/ibm,ndfc.txt      | 39 --------
 .../devicetree/bindings/mtd/ibm,ndfc.yaml     | 88 +++++++++++++++++++
 2 files changed, 88 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt b/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
deleted file mode 100644
index 869f0b5f16e8..000000000000
--- a/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-AMCC NDFC (NanD Flash Controller)
-
-Required properties:
-- compatible : "ibm,ndfc".
-- reg : should specify chip select and size used for the chip (0x2000).
-
-Optional properties:
-- ccr : NDFC config and control register value (default 0).
-- bank-settings : NDFC bank configuration register value (default 0).
-
-Notes:
-- partition(s) - follows the OF MTD standard for partitions
-
-Example:
-
-ndfc@1,0 {
-	compatible = "ibm,ndfc";
-	reg = <0x00000001 0x00000000 0x00002000>;
-	ccr = <0x00001000>;
-	bank-settings = <0x80002222>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	nand {
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		partition@0 {
-			label = "kernel";
-			reg = <0x00000000 0x00200000>;
-		};
-		partition@200000 {
-			label = "root";
-			reg = <0x00200000 0x03E00000>;
-		};
-	};
-};
-
-
diff --git a/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
new file mode 100644
index 000000000000..e614c5855b42
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/ibm,ndfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM/AMCC NDFC (NAND Flash Controller)
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Richard Weinberger <richard@nod.at>
+
+description: |
+  The NDFC is the NAND flash controller integrated into the IBM/AMCC
+  PowerPC 44x SoCs.
+
+allOf:
+  - $ref: nand-controller-legacy.yaml#
+
+properties:
+  compatible:
+    const: ibm,ndfc
+
+  reg:
+    description: Chip select and size used for the chip.
+    maxItems: 1
+
+  ccr:
+    description: NDFC config and control register value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  bank-settings:
+    description: NDFC bank configuration register value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nand:
+    type: object
+    description: NAND chip attached to the controller.
+
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 1
+
+    patternProperties:
+      "^partition@[0-9a-f]+$":
+        $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
+        deprecated: true
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ebc {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        ndfc@1,0 {
+            compatible = "ibm,ndfc";
+            reg = <0x00000001 0x00000000 0x00002000>;
+            ccr = <0x00001000>;
+            bank-settings = <0x80002222>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            nand {
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partition@0 {
+                    label = "kernel";
+                    reg = <0x00000000 0x00200000>;
+                };
+                partition@200000 {
+                    label = "root";
+                    reg = <0x00200000 0x03e00000>;
+                };
+            };
+        };
+    };
+...
-- 
2.55.0


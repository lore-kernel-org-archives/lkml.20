Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1182D6E72
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790387287; cv=none; b=lyhNuoukHe4ncsyu186Y1Dqt/h8VMBdBdX75D6YucGJ7XO0zMbb2VgHeJd1b+rxh53xsr0HL8T73lLfgjXdDgvGV1M+jcXU3xU0l6L2FZOoiKtltxagS4I8JEdrjG0KIZseDBMwNW9lQTzf5sCVYSqhZ8odg23hU7WEV7AbvFhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790387287; c=relaxed/simple;
	bh=TTVyPZcnJYABDmdRCD3Hn0KPAE4CSLVocgepqNv6eGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rlgWKjBYmQ2uBKjDdJlq3r1vYtfLfNxv5lA9sv/KOIA27zgtjHGFn/jbA+jfdSYxnbF25qBOz9+tFhB0NmNWkUITp+1IcdMaS67cV5kENSCy9lrsujEO61vAHFvILf3naJ3gqS/kcuDusIGoDFlpch8Mlc3bvfjhu5SJjdMRop4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0VUhBva; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0VUhBva"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-880adb5d043so435005b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790387285; x=1790992085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u8E325Hob5EvNUG1ihDxwdbdqqSNh/dhHuy8AA89ZKE=;
        b=c0VUhBvaUXAjhjhhVMBK8VRLWEsAKgSrU59gpHDtGJXqZjWGhqDD9owhV1ujI28iXo
         r8b2cI4sDcQQxvy96KuLgzd1mzVmAU87wRlHshvd2TRUAdI6CeUvAkek6nsq08Qwy4Q3
         dtbbdJtk1H+WrLFKeC0/t5FSaLD8xX/naKpXtVtSqaH6d2rsZIoT8RVfflAVP0wxX+rd
         w8/dU/LYGjvfy69aSXGs49YtgExaw756KQq7oLhZ56YNW4PRTQgWzHa9kJpX1Ksgf6W5
         AbOq7l7tVlmSh4g94brqv2eLXQBKahBpgUPDMf2fVw25HBXYb6lgv/s/yU7XclB/S5Qb
         xbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790387285; x=1790992085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8E325Hob5EvNUG1ihDxwdbdqqSNh/dhHuy8AA89ZKE=;
        b=f4lbdMlbviRakyDBJoGtR5jWpvKhMcSp+h5SbjUbg1EiBahFfi8ctAWk6b9Nof2EGe
         dsjReRKvEdXbHLuJTldASKTiy3P8qs8LTBpf9i1fE5YhPSBbAOfMYHG6HzcTb8cKtOG9
         5RcH4zTIIfIuL4Ni6dmJjoi/UZCp4pLqbr4dL+xxXRLy/Ru0HvMnPhaIWVicWEvx6rTp
         ldzNjEwbbpINIDgRVep5egF25e/YRi8M9YQ/AmZHT1cjaE1Sq0Iae1Tk5EQmJfNWo94C
         PkJWTs6DATsYFOftWF78iiZ8BZHELkCuzRMtW2jx90LJjlBThygdkF4TA/3srll6KVAt
         vMiw==
X-Forwarded-Encrypted: i=1; AKwUvBwT9zrz1pGpO5ro0pME4qkSzIPB1v6K2dBjOCPIgm8LeGwgeMJYensh8grgMuQOYuX1G2D/wfOSuNwaMzY=@vger.kernel.org
X-Gm-Message-State: AFuF++lQQACesSzCA55rd5UEygRfz4yT0IflcUcwFFfICducNL4l4EtA
	wy6SD0xds06FrflCG25nipr9UhPdX3D7BmKJzqVaKM8w0aYr/SCu0/ZF
X-Gm-Gg: AYBFou1rPNlcyKmDIcJCtmeQ7VNgmctQKRD2kkoqd+RWu9fH9K3YpcBHBrPef6aIK+a
	7CplJCglzN8Vr21lMlOZomVq5BSBhYqjpi5a7+gqi7QMO1yBnUZrcGaSyeIMyrXds5XJYCxo5B2
	0YdV+hfTMkRmX6rkfdYhpaEMl6m6SeoUfbCfcQtWpHg7Y70MwmG4UwrcJMmo7/MY6TTD524pOcP
	bLOvxNx5KDxOowuH4vJfL1NcWZSNElbw+sqWuTYwMS0fiflpH5I5Q6URIbsm1Qs8J+om9PCIZEK
	aNxsmwenJfPolp/E8qcnu9orz/XFBVurMlBH0sHdwRGIHcs9pp8yuB03cf0cD8Zk93YgboOw3kg
	uluVthmNBN/FsfCF1UGlqX6mQJni+ldlMly3AhCi9zwEUAV/gPMNEUp6ljQlLqj+YGLUAz+2HKS
	bm+2qwQQVIviFjVx49zbEgp/J1d/DmAS1ICUrc1TV+9HDBSRK6YQxcKbEY1Jmh+95EKcJWRWB6n
	orOq4+Oh+EO4Varu/unWnv5oaSzgg1LJ3N/QMTqAg2kD6HJr3VVzMTmC6OeEK34BtIDFv1x2lei
	pkiCf4s1jJX92XiYryseAu+lQLayM3dngIdKfBoVh34+77VL
X-Received: by 2002:a05:6a20:e211:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3de0e8b30c3mr6910904637.38.1790387285324;
        Fri, 25 Sep 2026 18:48:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea18ff85sm1836463b3a.19.2026.09.25.18.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:48:04 -0700 (PDT)
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
Subject: [PATCH v4] dt-bindings: mtd: convert IBM NDFC binding to YAML
Date: Fri, 25 Sep 2026 18:48:02 -0700
Message-ID: <20260926014802.87255-1-rosenp@gmail.com>
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

The "nand" chip node carries no unit address, so the "nand@[a-f0-9]"
pattern of nand-controller-legacy.yaml never matches it and
raw-nand-chip.yaml is never applied.  Describe it with mtd.yaml,
nand-property.yaml and raw-nand-property.yaml instead, the way the
controller level does, so that both the deprecated partition@ nodes and
a modern "partitions" subnode are accepted.  The node name does not
matter, the driver picks the first child of the controller node.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: allow modern partitions
 v3: fix wrong regex
 v2: fix reg value
 .../devicetree/bindings/mtd/ibm,ndfc.txt      |  39 ------
 .../devicetree/bindings/mtd/ibm,ndfc.yaml     | 128 ++++++++++++++++++
 2 files changed, 128 insertions(+), 39 deletions(-)
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
index 000000000000..d5c392001ad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
@@ -0,0 +1,128 @@
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
+    description: |
+      NAND chip attached to the controller. The driver picks the first
+      child of the controller node, so this node is not required to be
+      named "nand@<cs>".
+
+    allOf:
+      - $ref: mtd.yaml#
+      - $ref: nand-property.yaml#
+      - $ref: raw-nand-property.yaml#
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
+  - |
+    ebc {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        ndfc@1,0 {
+            compatible = "ibm,ndfc";
+            reg = <0x00000001 0x00000000 0x00002000>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            nand {
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partitions {
+                    compatible = "fixed-partitions";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    partition@0 {
+                        label = "kernel";
+                        reg = <0x00000000 0x00200000>;
+                    };
+                    partition@200000 {
+                        label = "root";
+                        reg = <0x00200000 0x03e00000>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.55.0


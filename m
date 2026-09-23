Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF713E4113
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191534; cv=none; b=I5azUHczx1FHlDNyxu0qxI6rjpCKsQRjiFmBfqMrE0LYEKSDZZabO/Cac7xny5ftfCWOdJ55jSlyMEJKdmE3FAI8seUMEsOFMZZ8PLuK9j7aECLL0DPT/55vzZ2sEIyPx00oVT1c0Y48vrCHFfCC3iMqYCEnJM5qMDzs3kb+M94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191534; c=relaxed/simple;
	bh=BWqLzOXRk+5S9MZYqWW33QkwbgUmwjXfTeVGI8+JXcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sIw6wlSedELMX9JS98z/ICrcITpnNNtO/fRhiUA1tqVCib389mvoDLKVmKaLKYmPBX6RthHwN8HUcEH2NNfFi+MzVITLzKGz6XK27tt7rLxnXpvvL27TBMtvUHhlIr6vWnpDwe/0hFdF1eonoF4Lpnn6oDkkvdopbyuPeNa8MBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtrrVqAG; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtrrVqAG"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939695b5741so110152785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790191532; x=1790796332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2uLNBtINgA/GkNyiQCsk9cZ9o6dy6b2I5aUCsD0irM=;
        b=AtrrVqAGTIbeShKnXhWwYxY9l5h8GvTMJo/rMpzCw69W0QpwTyBQ2R6ZHIZeiHj60a
         kJ3pVz8KfY8g1q73td2wGkoTl/C1aUW3B9t02SM7fWi9y3QXi39S8pJ+UfA/XCiTYI9Q
         IzkN2Si562TcCnvbXDnwomjSOE6tOSSPwlXtntF+1pISJ4vN4LYspj8g09nGG1dSmanG
         Iw1An93zago9FLusyk1Pzl3jOxxQ9m8vEQWpAKncMrmYnlMz37E1ptfrdhX39EgSFUcC
         gK7MHTtA0kvxdhX0zfzBQfoest2suI8m5MiRYC/r0NJ2+AAzRMq2n0C2lr2jyUaWp5g2
         53bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191532; x=1790796332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2uLNBtINgA/GkNyiQCsk9cZ9o6dy6b2I5aUCsD0irM=;
        b=z0hcTqYSp1BGEonU7xIAWFALksFPfealw3xVT9OuZHOLyNAscsVZ3NhYtU4jlstXTk
         5tCjTQF+8DLOMFuch8lg/jKdzU3x72tjmzUbG3WFFh2Rpc0PiOiTB94ZLoo6icZVnSiv
         N7v2EkEZstuZ14QNh2JZpl2uDhkKaLDrinzi0JdSHCOvKpZkXC+i/SS1FtMsz9fAUlOl
         OoobGwFVp78Q1B4cOlbPuPMG1VxxGYUWbCUgnvXIURUanEJ8ibBoQ3RFDN7wNS377y0g
         ublTImFi+MPpBLYTj2fvcSxYlAGMsUuStW+bqejLooxM8DUYPbPpJOce2sE83EAGNNk+
         7q5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx37NvGJUUE6gEaizEgHqiqBgsjVf967NZW5lp5hzcbxn/pC/lhTWyyJU0+PIjOfFLK8hSTnOH/g0Sgr3s=@vger.kernel.org
X-Gm-Message-State: AFuF++m+OckafTr0JijK2WfTMbBw7m/swzUB5ky7XjNSYF5CrkFIelkC
	YMODET3ap/d0/9hR02cgNl7hYrL2NuJIszwkOhmfY9DS2LgOWy2GdZftW2OC6Q==
X-Gm-Gg: AYBFou2fOiqqea9m2+uYFmSKLF7VOgmKAcxGCCACVy+5DF2iM5goBJvDVsXotFda+X0
	Ry8CBJ08ZtCBrjKI7T1iqZeCGhLDHavrWBMa4yOn1xKpgchxNC4ou9uYpS0pmZ9Q3dusxgxfP1h
	29yzDXyPcLXjYyVE30/PzQBjrKYWYXD3ijMZa22Waa6mT6+cQCjYq/HxDETlxPzwk6eiLj2yfHo
	Ivx67r2hUfyPbD4hTWB13ItD/XrWGGx6I3ELvrWClBhvfN4eA7qx8R82QxcuFuWg1xm2eKqmnhb
	/nYwm3/2nJzF1IXGJ4RqFng9cCbNXtVdEZQ0jFwWmB8pPRC9YNRjgzvwqxgnXtXZ3KB0/wQGIU6
	AKon8PNj9poXBjsdLdIWRovTr5nG9jMPAENQMFKOTzASEioREmAH8XDTyjkGcD8O+IvsgEpcmWg
	Sbc6Om4+naxkgbQdIUAuUq8ea4OSyuGUNMwejIrTGObSSTjhbJBW+mnb8VuDGecfh2qcp8yU4IE
	ZVksfNnmeEIExWJYiTwNBZib8tW4S2tOWNk8se14beRzO7bCfUOejOsvpx4iwhCQJMGm9VvUFMO
	qD9t30XrEi4ndpQrRhK1Orj0Q94XPDI+hfveNlFJqYMpYbakntiWXmsVtBo=
X-Received: by 2002:a05:620a:c47:b0:939:8c80:669 with SMTP id af79cd13be357-93c344f00f6mr28296485a.42.1790191531871;
        Wed, 23 Sep 2026 12:25:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c245e8804sm294644185a.0.2026.09.23.12.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:25:31 -0700 (PDT)
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
Subject: [PATCHv2] dt-bindings: mtd: convert IBM NDFC binding to YAML
Date: Wed, 23 Sep 2026 12:25:28 -0700
Message-ID: <20260923192528.52330-1-rosenp@gmail.com>
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
 v2: fix reg value
 .../devicetree/bindings/mtd/ibm,ndfc.txt      | 39 --------
 .../devicetree/bindings/mtd/ibm,ndfc.yaml     | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 39 deletions(-)
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
index 000000000000..51ba0bd1d329
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
@@ -0,0 +1,89 @@
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
+      "(^partition)?@[0-9a-f]+$":
+        $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
+        deprecated: true
+        unevaluatedProperties: false
+
+    additionalProperties: true
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


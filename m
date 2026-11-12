Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794520433;
	b=pgx3+JbuX7WXOJ3Ro4hWpAXeoDJXJfxrFksmbVVM44mq7LECxV0F5wmrQe9XiSj1aiFc
	 flI/GJEY8GkDWsVtAafAVqLunfJyNmTuSEFZ9NAWWyG/2sJzwWmRE9bXkUnxtajPqLfYX
	 lG0P8RruQaWxfTJV83nhjUGEWW0m58mGMb98mr771N6KguNyYuDL6DZ+JEgPh8mN/0vN4
	 kP9vCdqn+cZDmZrYLwxIXVzT2P6K7W1t5KrjvjG7RwIi9OXcJ1FrCKBlaptvpX8a9og/q
	 pg/PkxBcUGOuKtuMHgqqJGPD8LNgLoeVhqo0JrU8gGWnhTP9JtgGR3SzlWgULd2G+Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794520433;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/quXiTePYwxhk3T+roKUpapQ2saAb+a0ZyiCxtFV5MU=;
	b=KmWc83zYWXF493vEKAgneBH6hT9UyDKSd2LcOYlQ4zwjJxIFAGb6+sWJ3vBWw2JK+9VP
	 szYBkjzqap/og5yiydBypr0FRhdmwv/RWnd/fjS9yxtv4zACGx/U2cNj8pGq5W54BJJx2
	 fPKW2C9X4scZ263xRkjQmMNEsSSTcX8r0HkcNuiS9bo0MC/5STh7LmtpyUW2mfJxRdejX
	 EPmSqMERQWbo2PhYCb6p69wolu3wGzXvBVZj5tyo+yizVWpqPS9wxdJCFzQnERu/ihmEh
	 sgiOM5BcYfUs1nEcMo6pdMi/cUu4bUhbuF6WEU/CvXKFYZCXj2bpSu/qyxbW2m9rCLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDFYWbGw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280A1606A334;
	Thu, 12 Nov 2026 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jDFYWbGw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CFC1F000C6;
	Thu, 12 Nov 2026 21:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794520433;
	bh=/quXiTePYwxhk3T+roKUpapQ2saAb+a0ZyiCxtFV5MU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jDFYWbGwuiEYA5k83fIixzWBsuRueoHUhzL0ue8zLSRdvWIMHgKRW2IaqLB/nq9Hq
	 0Pe629euEwLesk/TTspIBB3QhUFXyejVMDEPAP4lp8N6iA45Ftm4/9kcYbso1mEQ7L
	 VrOEJWVpCw5fC4DTyh57tK3f+JkVjD4+h8+8VVJTEOeUIcfooEH39R4LLcvgmiGyjA
	 sZSm/uzK+ZwWMnjbrRl+pm2tmiKxh2erVDv/kWvsAXkV63S7telI8xBwpbFL/izpZ0
	 5TTLZowKlOxW1A3YXCeYNDP+9GeNypEG15pdTXg97+YSj2Jx5g2j0jKbIA+eyCtSDM
	 qJvujOqRX/i/g==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCHv3 2/4] dt-bindings: edac: altera: agilex5: document new edac support
Date: Thu, 12 Nov 2026 15:53:40 -0600
Message-ID: <20261112215342.2476801-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261112215342.2476801-1-dinguyen@kernel.org>
References: <20261112215342.2476801-1-dinguyen@kernel.org>
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

The Agilex5 EDAC module supports ECC on a few additional peripherals. Along
with support for ocram, ethernet and USB, the Agilex5 EDAC adds support for
SDM QSPI, CRAM SEU and IO96B.

The Agilex5 EDAC also exposes up to 7 named interrupts on the manager
node. global_sbe and global_dbe are aggregate single/double-bit error
interrupts that fan-out through the manager's IRQ domain to the child
peripheral ECCs. The remaining named interrupts are routed directly from
dedicated controllers (IO96B memory controllers and Secure Device Manager)
to the GIC.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v3: Add minItems for interrupts
    Add constraint for interrupt-names
    Add interrupt-name as false for non
    "altr,socfpga-agilex5-ecc-manager" platforms
v2: add if/then to enforce maxItem of 2 interrupts for older platforms,
    and 7 for Agilex5
    add if/then to enforce interrupt-names as required property for
    Agilex5
    enum altr,socfpga-s10-ecc-manager and altr,socfpga-agilex5-ecc-manager
---
 .../edac/altr,socfpga-ecc-manager.yaml        | 90 ++++++++++++++-----
 1 file changed, 66 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
index 136e8fccd429a..14e09fc86055f 100644
--- a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
+++ b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
@@ -20,7 +20,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: altr,socfpga-s10-ecc-manager
+          - enum:
+              - altr,socfpga-s10-ecc-manager
+              - altr,socfpga-agilex5-ecc-manager
           - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-ecc-manager
@@ -33,7 +35,25 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 2
+    items:
+      - description: Global single-bit error
+      - description: Global double-bit error
+      - description: IO96B0 DRAM controller error
+      - description: IO96B1 DRAM controller error
+      - description: SDM QSPI single-bit error
+      - description: SDM QSPI double-bit error
+      - description: SDM single-event
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: global_sbe
+      - const: global_dbe
+      - const: io96b0
+      - const: io96b1
+      - const: sdm_qspi_sbe
+      - const: sdm_qspi_dbe
+      - const: sdm_seu
 
   interrupt-controller: true
 
@@ -235,28 +255,50 @@ patternProperties:
       - interrupts
       - altr,ecc-parent
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: altr,socfpga-ecc-manager
-then:
-  required:
-    - compatible
-    - "#address-cells"
-    - "#size-cells"
-    - ranges
-
-else:
-  required:
-    - compatible
-    - "#address-cells"
-    - "#size-cells"
-    - interrupts
-    - interrupt-controller
-    - "#interrupt-cells"
-    - ranges
-    - altr,sysmgr-syscon
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: altr,socfpga-ecc-manager
+    then:
+      required:
+        - compatible
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+
+    else:
+      required:
+        - compatible
+        - "#address-cells"
+        - "#size-cells"
+        - interrupts
+        - interrupt-controller
+        - "#interrupt-cells"
+        - ranges
+        - altr,sysmgr-syscon
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: altr,socfpga-agilex5-ecc-manager
+    then:
+      properties:
+        interrupts:
+          minItems: 1
+          maxItems: 7
+        interrupt-names:
+          minItems: 1
+          maxItems: 7
+      required:
+        - interrupt-names
+    else:
+      properties:
+        interrupts:
+          maxItems: 2
+        interrupt-names: false
 
 additionalProperties: false
 
-- 
2.42.0.411.g813d9a9188


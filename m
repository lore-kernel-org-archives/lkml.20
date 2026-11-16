Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860943;
	b=v0nz2d8/79IpYJzqOGfeaCnmlSXMvffIR3dAV6xmqNf9rHWcV4ERo1oUycr6c8f1ZZLc
	 1UvB5PrTL17s/6gCCkqj+lLFCJ2lb3RPpV/FX+hXFAhO0zWNGgitQnf8JUvLvzN26tb1D
	 FVuL6YMFwYOpQyu9cfD5OFYnw82NTHcIviBhVdh828tupMB+sWnhsjdBKuVfyv4jmv1lW
	 OroVJ8sN2l+TiUeLziQfl4TR3ig/0W6WGza3zNwwNqb50/RCTMfFjMHDxkjQUKs3XieFG
	 /937ugU0xLrSeCx457bPFMYILd4+V8m9zs//+6hvsYmrUbQyaB2HeGlx1Kbx0CyaBag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860943;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=z+TI89wjf4PE6oOT0wrSvlPT4gMuNBu53F3p/Vrpuhw=;
	b=TgqYeh8mRTXk7nzUY4wx28r0HHY2U/l2/l/CJvDUPy/dJ+siMpVkknXAESib3xUnePTt
	 Y2+JuWNksN4a0/PL+fLzRcbMh+672tl0oqUZUxpJ2BsnY/WVFoTHpNh4TVLFtswsgdB6u
	 dztEcTofpBES1F5o+XoNDiumi5pc0I5uVsilr2fV2+sekhPffLB3kS0RmGeaMILP0V00+
	 mUZJk4OuD2WeG8CIWPOm3fdSUjDA8Z9eNm9rI4ZSSGdw0sStGQ0BkkkY7sSkuKRjIZ0Hi
	 UsaBFKNKEAoHdYqg4DkHfgUP5EoegDw80RhORJJQjj3qWKKkgWGKscrTcmhC8m2qgvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kiq30WI7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7503E606A333;
	Mon, 16 Nov 2026 20:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kiq30WI7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20191F000C4;
	Mon, 16 Nov 2026 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794860943;
	bh=z+TI89wjf4PE6oOT0wrSvlPT4gMuNBu53F3p/Vrpuhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kiq30WI7dKwRDyvpDWb/Y3aBghdC5FTl3yXnqRcZFF2j4bemEEf1UYvFC3Tsqx74u
	 G11VxniJwGAtWqu1lR6uMQOG/DOl7SUKu14sDx2LVREME8E/9G8UmdBtCtzwkrToZM
	 0D7SJHcr4qETxEjUVRi7JmVbdLhzjProjvlaigBeHwfK8/1rrYdGhVvVCgqlhP/GbW
	 s1984L9wHDysQiE0oMXLWvxzEaqMhngh/Nfo3FrjCv5zxx3G4NFBYU1gQDY2H21cf9
	 /7cEkvdSqa1/M9kfXIlEnD5eyXKONuWCboVkTGHuVnUnEfpPwe2PRpL6QqcCLBlsIS
	 /coSQCbz2TIQQ==
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
Subject: [PATCHv4 2/4] dt-bindings: edac: altera: agilex5: document new edac support
Date: Mon, 16 Nov 2026 14:28:52 -0600
Message-ID: <20261116202854.3087673-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261116202854.3087673-1-dinguyen@kernel.org>
References: <20261116202854.3087673-1-dinguyen@kernel.org>
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
v4: constrained interrupts and interrupt-names to 7
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
index 136e8fccd429a..1c882de660799 100644
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
+          minItems: 7
+          maxItems: 7
+        interrupt-names:
+          minItems: 7
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


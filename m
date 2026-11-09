Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241540;
	b=z+JcuzUh9SPY8403hJBAuievrlc19AL5rnKoHiRG76Mc9eHDEP1cEJWuuP3Y7ISS4TgF
	 QTIwJdnHBE99v0lPERtHaBlMGLtRQJ1url7PR09Qm7qqoSE66RO8v7f6QpiHUMRG8JWYr
	 FxolLh3c1m8slTkcjhQZlOwx4YAzVjsIJUpmaKQTSV4f+0y8RfmVRnKB5OYQUwnvqUVM2
	 hRaalrkXaq+WSu6Fsi2I3yPwbfKV5iraIfi1vWM7aOKyu1hvHhuyzMIXLP5hCVAaWOvei
	 m9Ppu2tT90sR5ugXV6s4GY1pRA/zdkN2pULpUlQaMfs7LAK9gw1aH+B2iwd1EKzLpHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241540;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=MDGFl4qA8hcrqIE4Qo7wyZIkox36iPq9ZdIRBSD7yrI=;
	b=bajsPgt/xV3OfIWks3eKtci0I6FRs32VgpMAnYZFqc6sL4FoSBmRfrjkDkNghWTJNwS7
	 oFU2TbRKuzSmF9/kmj1OYfTI7ef+IWNLqVuWwcwgrK85vOBbDEEloAzwTlsw02u19QjYm
	 0jjimrF+eeBJoLsfsbWhuI1oO4Mkrc4uMkUrat3FxhSgnay8U3ci0BWqDuosBf4jupwJT
	 9k3hEs3EP75iRo3GpL+Vl1keBrOAt9+8ji7bDkTYevQjHicu1qL4+bQDuTwx+ePV3ZP70
	 WJxcPV78Fo+GeBr7DAsYXyVlZa8rhC2o68Xud5HZIPExKtwilYDtinRrVhTN5IBhWng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNeIfHOY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DFD606A337;
	Mon,  9 Nov 2026 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cNeIfHOY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB151F008A3;
	Mon,  9 Nov 2026 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794241539;
	bh=MDGFl4qA8hcrqIE4Qo7wyZIkox36iPq9ZdIRBSD7yrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cNeIfHOYyre95tJy6YSefMIKt3G4yen5nU/l+OEmuNJ3rcFMKdwAZRoqzjO/BIpyZ
	 eoLo41bDhwK3Xzzrr7V3eMjYnmcpEozWJpfaA+JToes031GFVRfNFEsSCWcY8+A+RP
	 z0lq7g3mRSEhiLAjBgPMi5nbzvJAMoXO8YtVLMvyxAH06oG+KnpXvmrfYM+1WLtC0c
	 vE1cZrVpOLWFbMaK+3wR8s3PrGS5YFqbQJL4MovHYGlDVX3ijs3uUK8IbaZFOLHlhH
	 OkMhP2vEFs6lywn68ykI9Gpr3PE84M/LfFrq5JHMbdZyk2yc1g9bUsqQHX7Muv3M89
	 cl20bjb/9pQCg==
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
Subject: [PATCHv2 2/4] dt-bindings: edac: altera: agilex5: document new edac support
Date: Mon,  9 Nov 2026 10:25:21 -0600
Message-ID: <20261109162523.1698129-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261109162523.1698129-1-dinguyen@kernel.org>
References: <20261109162523.1698129-1-dinguyen@kernel.org>
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
v2: add if/then to enforce maxItem of 2 interrupts for older platforms,
    and 7 for Agilex5
    add if/then to enforce interrupt-names as required property for
    Agilex5
    enum altr,socfpga-s10-ecc-manager and altr,socfpga-agilex5-ecc-manager
---
 .../edac/altr,socfpga-ecc-manager.yaml        | 85 +++++++++++++------
 1 file changed, 61 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
index 136e8fccd429a..16940b49471cd 100644
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
 
@@ -235,28 +255,45 @@ patternProperties:
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
+          maxItems: 7
+      required:
+        - interrupt-names
+    else:
+      properties:
+        interrupts:
+          maxItems: 2
 
 additionalProperties: false
 
-- 
2.42.0.411.g813d9a9188


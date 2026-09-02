Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612454908AD;
	Wed,  2 Sep 2026 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352831; cv=none; b=Lz9b7hhyfPKKGnAvl2Te+cauMuNb8WGvF1rMsfKMDdcLNxK3u6FHBt0XCnX8jsmoy/onGuVKmzoGUqhk9IqKILpLNwxXusbGm9HBOO4a0bH2sJlVIk4WaeBzkGjIERfZwvGyHpvm7WL5R/ibaPVbiMaWguJKOFtUBnNckNTFNZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352831; c=relaxed/simple;
	bh=UMI0QfgMfnLxhqN+hUuIEBnQed8SOgoyTb0c5j/oTEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iTSs8I0aZ11rDZw/NnWC0UN/GRh4Zx3naLn8eSOqh2gKSaYoowpFzWHMvL21JuIFLU+e0yJklp+zRcQ6TI5NUtbvNGVkO8bWFJnlPfQpg/9TSDSVHNub77PWZSROHE2Ln38Scj/oeMQY1NHBlguvlGMvZBsRPIbN91IXB0eMn5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Fus7J2en; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Fus7J2en"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9BD311CE48;
	Wed, 02 Sep 2026 14:40:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788352822; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=YJo+5nQ0nINBNaxywSOUixu7kVY/MO9oQIxFhCicr3U=;
	b=Fus7J2enwqruCRbPnjDoUUUhP40Uy3ASz92Ve/vGIRhjx2qab15DuVYHpB3yKKYvPm3vqH
	Vm676MIUl/Hou0yUJVBuS2+tCEmpu4onyCikaQYO7Hbk5qlo8FJ3EyXl2YvTNZjw1dvG5W
	rC+kTspa6YkdHr2dLx/UyTy3HdiKDXnH1xcU5bbO1HB0/AT4Ix31FXBoRd7iql6GjOz7ao
	y28MuKsc/8h3CLuFKNAnqY3y25YlYI/B16Sx5WAqkJvqEg3JmZk5nqbLDiu+6qIR8CsXfO
	nTXNoFAd9vVEffaHwqjYBzESOBb08Tmn81TVSPXtBUcOJpxgNsg0gZV8pJ2aXw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 1/2] dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
Date: Wed,  2 Sep 2026 14:39:49 +0200
Message-ID: <20260902124018.606544-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
address/size cells.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
V2: New patch
V3: Fix the bindings
V4: - Undo simple-mfd in favor of dedicated SYSCFG SoC driver
    - Update commit message to match, this used to be patch
      dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd
    - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
      https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
V5: - Add missing contains: into conditional
    - Add phy subnodes into required list for stm32mp23-syscfg/stm32mp25-syscfg
V6: - Reduce the pattern in patternProperties to match only on phy@2400 and phy@2800
    - Disable address/clock/size-cells/phy@2400/phy@2800 unless compatible
      with st,stm32mp23-syscfg or st,stm32mp25-syscfg
    - Disable clocks unless compatible with st,stm32mp157-syscfg or st,stm32f4-gcan
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml   | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe235..a559f8b03b842 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -39,6 +39,17 @@ properties:
   "#clock-cells":
     const: 0
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^phy@2[48]00$":
+    type: object
+    $ref: /schemas/phy/st,stm32-usb2phy.yaml
+
 required:
   - compatible
   - reg
@@ -54,13 +65,30 @@ allOf:
     then:
       required:
         - clocks
+    else:
+      properties:
+        clocks: false
   - if:
       properties:
         compatible:
-          const: st,stm32mp25-syscfg
+          contains:
+            enum:
+              - st,stm32mp23-syscfg
+              - st,stm32mp25-syscfg
     then:
       required:
+        - "#address-cells"
         - "#clock-cells"
+        - "#size-cells"
+        - phy@2400
+        - phy@2800
+    else:
+      properties:
+        '#address-cells': false
+        '#clock-cells': false
+        '#size-cells': false
+        phy@2400: false
+        phy@2800: false
 
 additionalProperties: false
 
-- 
2.53.0


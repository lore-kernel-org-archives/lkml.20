Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F63BB104;
	Mon, 31 Aug 2026 23:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218052; cv=none; b=S6nR0WORjipTo3OShXwGvY5/XanXioM5fEJx7vmR4l+qKDZXe/VbOvM9KTPFgQT1q/NQw3oPnaGWRJAs3/rKtR5Ggh3yT7XOdHXcZHKkgL07eCXJMEXWRxvyckoqfX92Tjal6pgAgxCDPFk01n9g3oTNCcg0h41s1Yl97iK7KLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218052; c=relaxed/simple;
	bh=yZHG8jLOJUMDrpiBAOnEoJi8mRE2rb+QBmZRhAuWNdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPMJQDJwpkecQpGFANuIgLqC/XmCIkROyyY1GBDIFmby8/y84/SVYAUIeazHpGd7EY3veiUtp4FY5ZwgcEm4eGi/BFJuqommQbW0LFAdy2AtooWC933Hz0lFlfiDxL1Zm9G4zghFB+w1JwoF/LINAwn51YwxG8SHae07jeWufps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Y17bghFM; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Y17bghFM"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BB6011C934;
	Tue, 01 Sep 2026 01:14:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788218044; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=OsrNXzQ4NnwEZq7XsvkuamMCBWqUACDmS63rgtMjAZ4=;
	b=Y17bghFM8t98sSP/sTa7xOdzNYeWRt5954vWueefRkYlx1BCv86jMfmKYTlmNbb9C7eia+
	ESHplgx1pKMOB4+EB7hwBKM/3KWkUMU9orff4XoAsfuaGkGHq2qfqRUl4AM1xGyLcRXX3b
	dAr7qMpRI0kMJLB973brvVxJ7VBwFgoabXqUNz04zBBcr9m+Ovskt36egCWYdEMzJbHAT3
	EC+XCP2NUo+8QYDJ6ZzoS33cMUCwtuTxlh8BWowovwoX+cEWg10r4MOAjBg9i2NZo9BYtL
	B1/TDnHJxeeIzHV5HIa7M0gqI+i8tSaYfzZCIUvp/GAO6DRAVnJSZDZ4Lt7Kcg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
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
Subject: [PATCH v5 1/2] dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
Date: Tue,  1 Sep 2026 01:13:24 +0200
Message-ID: <20260831231359.136475-1-marex@nabladev.com>
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
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml   | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe235..2cce174004fe0 100644
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
+  "^phy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/phy/st,stm32-usb2phy.yaml
+
 required:
   - compatible
   - reg
@@ -57,10 +68,17 @@ allOf:
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
         - "#clock-cells"
+        - "#address-cells"
+        - "#size-cells"
+        - phy@2400
+        - phy@2800
 
 additionalProperties: false
 
-- 
2.53.0


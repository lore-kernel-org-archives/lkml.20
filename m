Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2AA21A42D;
	Fri, 28 Aug 2026 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929947; cv=none; b=qSMJvTl+u5Q7ASxmvOcRkUCGyi3M7gRGAMto6HGeg0nSM0JVDYOvaXTuRCSs74YyBhnLJ4ZAKZLztyjgVwWpupDrscrQv2HOPa38ESZ7XpA9LFMR88kqfbetORMZ3kJkd7+1VmaZxEonF5UrvoxJur5PuGqrAjzkouY8tuWShm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929947; c=relaxed/simple;
	bh=f/K3iUK7KeSO8go6OciNp2ROriNSfQCq1mNA7acw1QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aNkvzTQg0sFY8Vk9sidvnTiKKpS1aDp/RIIrQ7vMaC9fmURMO/s/Fa9NX8kj5HOUHYXOGKp1xu7M/gBG6uyaBy8fB1pcrUwB8YuaIo8GGW9wriZ6Kq37iLq31AhPSL0lwdHSVvOG9xpo3OzkhS1Xgkz9AjCkCfC/UdzdOMff9i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=KInLMAVE; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="KInLMAVE"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B22F111C69C;
	Fri, 28 Aug 2026 17:12:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929939; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=nqJvjnSgNcu7LOjhXQ4TcxEYeLL+w8iL+osguagx5CA=;
	b=KInLMAVEjQgciEXqRPliH/0FpqK0nC5ufVhuheIFlfe1/Rs78/8qh4p4fxvzD2IjjaaGnr
	RjobcgkmNiS1tKzmj2KufS8QLBRFddboboOPT205tixqWpUr4k6fvtAsMyy7rlYnIerQl6
	aWuCuwvERFao2kfPop5hn+EH4IvM+6v6TclwuVsi0a6SmYb4BNyLVaM8BemBM22TfLDffM
	K8yyz1X/LcqRZjMu8LwsW9WNaNcHRANu7WfQomvvzS4HgZ08ePX2yLGJXr8zTszwig9/b5
	jXuIy3VobCQ3qpr5/CadWr59tM4LOSi+nmYPoLa/6/9pJyN7b+rkA+mBmpMfpg==
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
Subject: [PATCH v4 1/2] dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
Date: Fri, 28 Aug 2026 17:11:14 +0200
Message-ID: <20260828151216.175020-1-marex@nabladev.com>
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
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml     | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe235..d82afa39960b9 100644
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
@@ -57,10 +68,14 @@ allOf:
   - if:
       properties:
         compatible:
-          const: st,stm32mp25-syscfg
+          enum:
+            - st,stm32mp23-syscfg
+            - st,stm32mp25-syscfg
     then:
       required:
         - "#clock-cells"
+        - "#address-cells"
+        - "#size-cells"
 
 additionalProperties: false
 
-- 
2.53.0


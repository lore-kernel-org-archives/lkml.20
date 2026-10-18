Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C2139B49A;
	Sun, 18 Oct 2026 16:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339684; cv=none; b=aFy6Y8wzrgN/mdY5ed3UUqHdb1RSBNJp6RTTpwOkirlIuI7QkY8CSGUte3lamYJPSl/7BhNC41b/h5hX4RjfMbxbvv8BG3ZMlcIYMHgW/t5xpwCHYyo+co1zvt578B4KNwT162S/8jlvqebF1+F9rIbSPBVtHLp+p6lUxH4bUCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339684; c=relaxed/simple;
	bh=Ww265C1brfTYOTX+UKwTICR7ZGeL4Bj1knjlUcQBulY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBkuxWbFu0PyN9wxMeI3CjKGOyFASwrPHi9T72e71gdZwkXeXSi5D6daNOXuCj8tbymbAqtFD1kyIDyE+SYg8+f7GwI6jxAyWxzqGkhS0KKZTRHBN4IXULFJ3tgIRogY0Bt5f9f5oqmTel7M97UaPfuFh0ZDi82/FPzZTeYszbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=qlgSC/gp; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="qlgSC/gp"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69IG6rwnE1115120, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792339613; bh=1bl8OPVoTwnMPPl51iRYBO3yUTf6D0qWlAJVw0y0IXo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=qlgSC/gp9H/IqxDELVlBhwlU2iKfJOPTLETis6p66zyJWuj5PltBBUfCikrJbzDd1
	 ys6ZI8iQzK4FMBN0/rc6sQd3tMk5fYbHAO8tglbctiIV1SBzHyoI6+jc9CcEyq7wkx
	 +YKibbO4NQ4ksTF8r6Aegu88RFKE2EJYXdopq3sPEWOLpHRhDTSP/nc36Cjd7BJjyG
	 hdO58gS0494Sfu+XF8JZqBqjYIEF/uzb3EqVN0+nz7bKw3oMWT0KLbAcdS0WuHs6P3
	 b2ANjZ702drUJ7LsrUo0WYqk17HwwqFrW6AUaLh2RkFazDk/bzL/fhviX/tgAZYulM
	 XUvBeOf7kQrUg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69IG6rwnE1115120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 00:06:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 00:06:54 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 19 Oct 2026 00:06:54 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <tglx@kernel.org>, <radu@rendec.net>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<afaerber@suse.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<mfd@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v5 3/8] dt-bindings: mfd: realtek,rtd1xxx: Add interrupt controller child node
Date: Mon, 19 Oct 2026 00:06:48 +0800
Message-ID: <20261018160653.3940371-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261018160653.3940371-1-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Allow an interrupt controller as a child node by referencing the
rtd1319-intc-iso schema, update additionalProperties to
unevaluatedProperties, and append a usage example.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../bindings/mfd/realtek,rtd1xxx.yaml         | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
index 717e29c37b36..b21e14df2879 100644
--- a/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtd1xxx.yaml
@@ -65,6 +65,10 @@ properties:
     const: 1
 
 patternProperties:
+  "^interrupt-controller":
+    $ref: /schemas/interrupt-controller/realtek,rtd1319-intc-iso.yaml
+    unevaluatedProperties: false
+
   '@[0-9a-f]+$':
     type: object
 
@@ -76,3 +80,27 @@ required:
   - reg
 
 additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    syscon@7000 {
+        compatible = "realtek,rtd1625-iso", "syscon", "simple-mfd";
+        reg = <0x7000 0x1000>;
+        ranges = <0x0 0x7000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        interrupt-controller {
+            compatible = "realtek,rtd1625-intc-iso";
+            interrupt-controller;
+            interrupt-parent = <&gic>;
+            interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+            #address-cells = <0>;
+            #interrupt-cells = <1>;
+        };
+    };
-- 
2.43.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F45A35B63C;
	Mon, 21 Sep 2026 23:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033200; cv=none; b=FjYcQfPIoKeLlPl9+WjE1PmTKlZcITTXghlw4R+Vkckk7FvN1gnNQeYRzztFcdfZBRl4EBTYcOmYdUn2wgpV6bqhmupXpiJBG87dTGPKhAQQT/i62wlAh/ZNtYFWat6bUf8bFdzp0DWs5ufjlpCzWJMRQXor+EaSVBjs70RbQ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033200; c=relaxed/simple;
	bh=smt8kb1X2rKMpeewdQBQqy/3raNcUAqYkbeYylBGiGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ek6EYIiVTMWstEq/9KnQfdxMupGsbkV/qWfNW0pv+AV4tBk1QOldsB7Gz+7zUaC5KoghZodBGApq0D8Wwv04i/8l6weDJQK1YXLXMt45ZOc09oIX7y/Dq+2100ERqxkunRlhPp42JXvZhcsbj4uJ+3pwJgHGw24XUaQvUWU4zXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqOBjIAW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqOBjIAW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7CC1F000FF;
	Mon, 21 Sep 2026 23:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033188;
	bh=cfoz18aFw0a0kbpbLgZHeo5UMFDogP1mYkbYu/Bh/zI=;
	h=From:To:Cc:Subject:Date;
	b=hqOBjIAWV7W2WNtq/nN+Eqg68jqCj+kDf66t2U8T/yrXq9RqsDZMei6Ztvv1MqhG6
	 AkQ6pISjGqfiwI3EkkEvzamakcdfgiM0Luw977EiD+VVsFskb25hx5I8k1QJC9cLSh
	 Y+lZ17FujCsj/Irjl1TEA+QTjLOGY/7VB4xoncoHcYCax/JBLBpg4XevuUeDPiRvDk
	 VnYNkAcH5IinmESxCVSxln4HIa1CZi4neqlhFQRf7ohT/kFjWPyZ1gDnTn2QYHFn5w
	 vdk9a/2xXOguATZ3/hhYAPXltvk317ecsgtw5koJ8ylQP0q+lFbw8e6c+JmvqWg/X/
	 xdoybKQlXQv5g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
Date: Mon, 21 Sep 2026 18:26:24 -0500
Message-ID: <20260921232625.3131242-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the hisilicon,hi6421-spmi compatible documented by the in-tree DTS
and matched by the Hi6421 SPMI PMIC driver. Also allow the GPIO
interrupt line property used by the HiKey970 PMIC node.

Assisted-by: LLM
Fixes: dee8a4e807dc ("dt-bindings: mfd: Convert hisilicon,hi6421-pmic to DT schema")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml           | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
index 6a824351834e..9275c561e9d4 100644
--- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -24,7 +24,7 @@ properties:
     pattern: "pmic@[0-9a-f]"
 
   compatible:
-    const: hisilicon,hi6421v600-spmi
+    const: hisilicon,hi6421-spmi
 
   reg:
     maxItems: 1
@@ -32,6 +32,9 @@ properties:
   '#interrupt-cells':
     const: 2
 
+  gpios:
+    maxItems: 1
+
   interrupt-controller: true
 
   interrupts:
@@ -66,7 +69,7 @@ examples:
         #size-cells = <0>;
 
         pmic@0 {
-            compatible = "hisilicon,hi6421v600-spmi";
+            compatible = "hisilicon,hi6421-spmi";
             reg = <0 SPMI_USID>;
 
             #interrupt-cells = <2>;
-- 
2.53.0


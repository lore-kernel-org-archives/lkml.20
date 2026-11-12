Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509681;
	b=rGv/Hy0bKsBqlOKbPc4mV7C8zML1Rdhyo7slnlsJTtgI05NBCuD7HFZohUh2LTl7EFuc
	 yuo82AVGhAABJ+dNizLmzSMgDOX8Cc2PwHQvWP3ZtqtlThl4uJ7Be6Jao266CZGJHtQyI
	 fmENq/Cv59Z45CzpzMbX+mc48SgoSxoAYAU/pS0GF2X6+9UzlH+FHRlKLY7vMAdOum9c1
	 kKU0kR/6xsUUpxQg9P/9a6HaU+3G0YHX9y56UWE7Jgld5SMaFFwtS2vLZZwgVGJJZWWQn
	 jjPSMSlqjpMjZUaQXiIkZJBORs22xO3W3PG0RH20tvw3AXw7TrdvBZis8m/yCOXsEag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fWLnRTHzq44+Vxh7KKtStPCPVQVw0PPt5S1VYLelmew=;
	b=IyZWt9XptDRRdTY3XXOekAxtqTxj1b03v9BD4HtBqFDdVwzP1SFCBkV9fwOVmT5QTXOK
	 egDwisMBZM89PJdRk7dZMGHT/BrjZKqzAVDesJVdS8M6zHbxr5qYRAUmGFh/ZZp9Bm4ZK
	 2wOt6OYD5TVburovMe+Z86oeDaXSfEqRkMWClkCDlqy1iuRAI+irPrJJEAXytu0KpZkfd
	 UgLl3eqBUIv3+ToqpIIfxpUiq+RY0LDb24ougnvAybk6FoVelf4wXnqPvkHdo8UBtbft2
	 O7+Nv0ahI1wuRq2DAIaT/8dUJGTmi9izfORF3rB3j8WUG8kMEQZjoIUAJTUd/pUDreA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSSuklZK;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A9C606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95A9C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSSuklZK
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36dc4797082so22302eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509680; x=1795114480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fWLnRTHzq44+Vxh7KKtStPCPVQVw0PPt5S1VYLelmew=;
        b=iSSuklZKuBtT8njwpKc001LaXfFN+vhWrgJUEUcHcG/nJIYuWQaqz3eNp/YZcosj/u
         WYs5H+eJFwsZ7t3OraTGERkr/UOUGJXWAq3Mibl1GuKOjhjOs/MgViuKiDovLKt/kSD/
         tJSSKQ3dDjAyfVpzryYrPk9Ry3mXpgcZGEV5twYfZhPn7YM8l1/fDgftEg+0DL22iuTX
         tQbG7MnEI/ZkM+E8LATUfwg72KnahVu/UeojFPXf0++g3zb4uZnC6GQAquc+eAY/c6kO
         bWcFg0WJdI62l63QTUmomSHkDKE/GcAgb2tMSc6mMi99uXjEkseM3ZtpAvT1iXk/P56P
         dc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509680; x=1795114480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fWLnRTHzq44+Vxh7KKtStPCPVQVw0PPt5S1VYLelmew=;
        b=IUJ3TGa/jINAyORd9CBfo8ltVQsu6POIHRWbRhd6qgNG5/OA0EUn0Njx/yDhh365L5
         sKTUSgueZKOz8vC0mR4i5Pb773cwxhN4F1N2uot4Uk/dHM6hmy8lyWoilg8RH+2wI0I0
         g9/ErqKmmNM2hL4+E89ft7Dd5+yfdMZFkL1n+K/xW2aFxFWti069Zd3x5q+1FmJ+u+jD
         8CXhXsj2nf5O+OxVh6DZ4JCldAoKx/VXL5UHQj4tdDf9Plw8IPoxPNzbeM+aadoEO6PI
         TeNbEUaWr5esf9Qhg4KH0OwRgTGcN9Mr6UUWv7nYj+HlqQCL/ESE9HdZEzLhDZVc8n+C
         EF1A==
X-Forwarded-Encrypted: i=1; AL+hErFhU58sBRutSLzCnyNsSX7goB1Hx/CygXdppmqkytASXEbrgarmuIXBT9nRHDuRI8cTPeL+jWLsknSyjqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q3Oh9wVOoDlbPV06EK5AF3fu7zN1QBiGHCnURel05Loa2vgTl
	NbO6MEnV8FY1QibsYo8YRPjvUJrTw2iDLSYqn57zkQ2qKEr7nWwI9+v2
X-Gm-Gg: AYBFou0LGRxzLEpY7qqZ0tIJnwJhNnI6qPiW6Kk3FVsL0Nl12knSK4qh8sY8uFV2TSw
	RjZyx1vXFzQ80EGEdVu28HshVacrDmHIdmf1DmG3eOD++I4VWIIAxgRMtUC52Kr4p3Nz1xS5AMC
	8vt7CKKDr6UZxO0z6aYRaEEILK33D0YRqdhU7aTCHfH0Z9VSPGwSt2M1C91jduZ9DziirTNxEfo
	buqlys2F9ZgMsPRWntZKREKcFbgnunNjNKCUGuGrZJi0csLqEfWjiIdjHwT+DlmMt0yV7BdO8c0
	AuxRO2hF/pbYZEzw4zG1/s8yD0Gvb5aw8SjTDTPE/OwhHjn3wUcOYJ0YA4j09oMq7+MI3zuBGbj
	L05Z/EXFpMbb5ZvUksxgYFyWQftKturACjMB4yjI+CrEq69uUaP5Vw5VJGCY0+dovXLPBPpBQ7P
	GRQX6G+cCTAEgPmSVRyHVlq++GfNghhQdwztq6MK156ujjV/utsAuQf3tj01sHtg4bagJwN006j
	nyKljX+nt7OWdbrMncsQ8kAi+tEba2AsJ+/z3Du/sd78eGxyysi9a0/qeU3dFqaamhmXfqqPVb0
	oRrfUEdPSHL9S6qLK++cKanYltVmKl9i0svXnw==
X-Received: by 2002:a05:7300:6da8:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-379659c6815mr96217eec.2.1794509679625;
        Thu, 12 Nov 2026 10:54:39 -0800 (PST)
Received: from [192.168.1.4] ([2401:4900:881d:321d:eb39:71d3:15f6:5fe0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm339008eec.22.2026.11.12.10.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:54:39 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 13 Nov 2026 00:24:04 +0530
Subject: [PATCH v4 3/3] dt-bindings: bus: ti,omap-l3-noc: Convert to DT
 schema
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-ti-l3-noc-v4-3-5084dcf4ffb4@gmail.com>
References: <20261113-ti-l3-noc-v4-0-5084dcf4ffb4@gmail.com>
In-Reply-To: <20261113-ti-l3-noc-v4-0-5084dcf4ffb4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509656; l=3333;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=WKKUN2jQjfC7QZp1fenPy2OkomRsdptL4bsEgub5sUs=;
 b=5D5VKA3cRIKqxXzxuLlHYsOud0dxvXQ0hWDcOveXaGCvjS6IyWuXgLxqo1dqKWAi+5aEr7rmP
 Dq9LpAQ013uAi4wmvJUv4KNEQd0w8X5IOd9ef4WNucRWkYReGyt2fQE
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI OMAP L3 NoC binding from text to DT schema. Drop
deprecated ti,hwmods as it is not used anymore.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/arm/omap/l3-noc.txt        | 22 -------
 .../devicetree/bindings/bus/ti,omap-l3-noc.yaml    | 71 ++++++++++++++++++++++
 2 files changed, 71 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt b/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
deleted file mode 100644
index 66548395fbdeb..0000000000000
--- a/Documentation/devicetree/bindings/arm/omap/l3-noc.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-* TI - L3 Network On Chip (NoC)
-
-This version is an implementation of the generic NoC IP
-provided by Arteris.
-
-Required properties:
-- compatible : Should be "ti,omap4-l3-noc" for OMAP4 family
-               Should be "ti,omap5-l3-noc" for OMAP5 family
-	           Should be "ti,dra7-l3-noc" for DRA7 family
-               Should be "ti,am4372-l3-noc" for AM43 family
-- reg:	Contains L3 register address range for each noc domain.
-- ti,hwmods: "l3_main_1", ... One hwmod for each noc domain.
-
-Examples:
-
-ocp {
-	compatible = "ti,omap4-l3-noc", "simple-bus";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-	ti,hwmods = "l3_main_1", "l3_main_2", "l3_main_3";
-};
diff --git a/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml b/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml
new file mode 100644
index 0000000000000..85f314f177379
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/ti,omap-l3-noc.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/ti,omap-l3-noc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI OMAP L3 Network On Chip (NoC) Interconnect
+
+maintainers:
+  - Santosh Shilimkar <santosh.shilimkar@ti.com>
+  - Sricharan R <r.sricharan@ti.com>
+
+description:
+  The L3 interconnect is an implementation of the generic NoC IP provided by
+  Arteris.
+
+properties:
+  compatible:
+    enum:
+      - ti,omap4-l3-noc
+      - ti,omap5-l3-noc
+      - ti,dra7-l3-noc
+      - ti,am4372-l3-noc
+
+  reg:
+    minItems: 2
+    items:
+      - description: L3_MAIN_1 / L3F
+      - description: L3_MAIN_2 / L3S
+      - description: L3_MAIN_3
+
+  interrupts:
+    items:
+      - description: l3-dbg-irq
+      - description: l3-app-irq
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,omap4-l3-noc
+              - ti,omap5-l3-noc
+    then:
+      properties:
+        reg:
+          minItems: 3
+    else:
+      properties:
+        reg:
+          maxItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    l3-noc@44000000 {
+        compatible = "ti,omap4-l3-noc";
+        reg = <0x44000000 0x1000>,
+              <0x44800000 0x2000>,
+              <0x45000000 0x1000>;
+        interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.56.0


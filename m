Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FC25172E0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983963; cv=none; b=ndL9s1zQZzgD3HfjH47YuIfz6sODZ7y17Mv7kHXlGc0XfZM1xMlYR9AXKb1UmlBAPWQdYNoddFyAKWiKrFnKqiq2u6WA7EntF6R4O8R4t/CFnrcVajCDfYm//wZqDpX/R3coNqedtndDsWfOVKwFK3uXCGk8hvb2vcqoX2C4hGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983963; c=relaxed/simple;
	bh=+JOp1BK43WmATzvPSwYkoBTECpush0N0ZoA2Jjwcy5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h2eiX52nIL7tIhKjeCq1bpjTSp6hL6Vbq8m0L5z5CX/2I9aUGyCJBRJ0dgR5zez6MPRNi18uuAB4eGcJ4dtK+uJlv5z4MxnYJphPe7nMM7AhT0p3kdVwyv+2M+FfMN9G6R8/SS4wJlBiYM6lM9MkEYDLQpJfhd9SVrSblHThBrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqeZDAqO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqeZDAqO"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af27fe287so518393f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983957; x=1792588757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9bl3wxGa2XDQCpn+kEbYVmVrvIMWd1q2yCPrmzN5ANs=;
        b=bqeZDAqOQsL7TIjflbJGUodec2o10vOJ0y2vmHTnD4uO6Zieiztdz82w92B+bBODVp
         qxR5vMHN+stIwsjHEJ57SAve6yw9WQmJJJhcQUTqCBqqYQwil4g45RL1aSexlYYCUZs0
         lb5p9VaF0RP4r+aHOuLx67wXh/1TQSOazrTWycsE5fd699VitZMloIubsAwN2NM9RyB/
         G30W/+3osIPTXNYPPUs6THVKwuQ6aEgIW0T65sjAePRTghocNC+Mc1Rgo5Kja1azMb8D
         SnrNt/XOEh07+dVCXDUPZp97qZm9F5IDnNLx7CJwiuS+LAxOq27DlTDk6tVVGff2bGdn
         Y0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983957; x=1792588757;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bl3wxGa2XDQCpn+kEbYVmVrvIMWd1q2yCPrmzN5ANs=;
        b=U+Fog3xg1DyKzBwRoS4zmCLsCYc5UbljnZdruqepZohV6iyujd3yoxK0D4grtI41ll
         18jZG87LBER0kTk4z5TKSIp4cTL0wRb0Bwq47Ls2UysuwADaX/VrAATKnh//NnLkkbyq
         HarEEj61wbhityYwiW3LqM+shP66rV8IcDSbqum47UlhN7NJV2X/M0udkIB3BWNwws96
         2IXjUTgkk9iNzBtdYJIGFKnoFolDpX/X0MtUPy35AfhECOwO7Ah2abR0Jl8QyyDShf/R
         43FkNbLLIf+tTdRlZn/w/aJMumDTjwsEzu2z0GZzEsSMVWBa+2qQR+HvZd56nES+Cmr6
         t1sg==
X-Forwarded-Encrypted: i=1; AKwUvBwChL0goBSTXvuipp5f5TxO8/HkG+pWwSzoHnJoo1jmUAEQ8wgERE5ZXkR1v6Y6bAoUAtcMM76y4EIkw8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnF7ME5Ap8YQSY6tfkZjGMyhsO5+S1g/XhWkdvShjiZg10Vs76
	bGniKuzYBcJOazH18+NaiYeEAAaf98mVmds+WNwyc2NsWrzQ32QCNQV+
X-Gm-Gg: AYBFou1hUT1vUOOWsMTw1ov+hWAPIeYfyZsrmGwE9gdIihywsC64HcOO7yHu5kWJuyk
	2mD4BdZ1UYS7QZ5ONey38erRiVj4o+ymxbhd5619dwETyucWQ62kJ6H2H/SvD3i87gtwjsf0AM+
	O+c0JjEs0ZJeomUs12G4OvhB1E+o2T+fwE5vuB/BGI3e2KvM+XRMMk2A2/Q1mE83RIjNqLrIFyR
	oKzsfu699BEyKLq7w86OrKC+oEidQe4ifsaukL3AXzbxz6faOdOg32rurSu492e516fIiR99zeB
	buYJu5S2ptXwF2mnaTp8rytufmUOoTrTMST6QSCcD8wEt/6UXb0yi1fonqD6IYfmrTEjav1p3LN
	fVgavfEZ3WtZ1S1DSDCgJWP3YMvjIazRkTMSLWP2Un10JJixck0zFBsBhApq2+zXm/gbOclSa/d
	39wO+ZqMIeWOa1/ZQwJeTLPxdDS67w4z1TpFwF+Y4pjZa/rzU0u0Y1bRR5oJeOLn34+IPhw5diI
	AGBs/CNk4iVTvsvCRmXNohi1JtBUjP7gPCKQUp1TlUqCg3A75Da/B9bad4OngXQDUE+roizgHYR
	PqG1ukYdeUR9dJzGXg==
X-Received: by 2002:a05:600c:19cf:b0:4a1:7b56:1151 with SMTP id 5b1f17b1804b1-4a18e48f00dmr311005465e9.18.1791983956438;
        Wed, 14 Oct 2026 06:19:16 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 05/13] dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support
Date: Wed, 14 Oct 2026 14:18:53 +0100
Message-ID: <20261014131906.990077-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the A5PSW DSA binding to cover the ETHSW variant used on newer
Renesas RZ/T2H and RZ/N2H SoCs. ETHSW is derived from the A5PSW switch
found on RZ/N1 but differs in register layout, clocking and interrupt
topology, and exposes four ports in total (including the CPU/management
port) instead of five.

Add a dedicated compatible for RZ/T2H and use it as the fallback
compatible for RZ/N2H, since both SoCs integrate the same ETHSW IP.

Also make interrupts and interrupt-names required for all supported
variants. The existing RZ/N1 SoC DTSI already provides both properties,
so this change does not require updates to existing RZ/N1 device trees.

Add myself as a co-maintainer of the binding to support ongoing work on
the ETHSW family across RZ/T2H and RZ/N2H devices.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Added a restriction to disallow port@4
- Updated commit message

v1->v2:
- Added full names for SoCs
---
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  | 157 +++++++++++++++---
 1 file changed, 133 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index c5e652c057a9..af3b64320fa5 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -4,43 +4,108 @@
 $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/N1 Advanced 5 ports ethernet switch
+title: Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW Ethernet Switch
 
 maintainers:
   - Clément Léger <clement.leger@bootlin.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
-description: |
-  The advanced 5 ports switch is present on the Renesas RZ/N1 SoC family and
-  handles 4 ports + 1 CPU management port.
+description: >
+  This binding describes the Ethernet switch IPs used on Renesas SoCs:
 
-allOf:
-  - $ref: dsa.yaml#/$defs/ethernet-ports
+  - The A5PSW (Advanced 5-Port Switch) found on the RZ/N1 family, which
+    provides 4 external ports and 1 CPU/management port.
+  - The ETHSW (Ethernet Switch) found on the RZ/T2H and RZ/N2H families,
+    which is derived from the A5PSW IP with some register layout
+    differences, additional timestamping support, and a total of 4 ports
+    including the CPU/management port.
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a06g032-a5psw
-      - const: renesas,rzn1-a5psw
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a06g032-a5psw
+          - const: renesas,rzn1-a5psw
+
+      - const: renesas,r9a09g077-ethsw
+
+      - items:
+          - const: renesas,r9a09g087-ethsw
+          - const: renesas,r9a09g077-ethsw
 
   reg:
     maxItems: 1
 
   interrupts:
-    items:
-      - description: Device Level Ring (DLR) interrupt
-      - description: Switch interrupt
-      - description: Parallel Redundancy Protocol (PRP) interrupt
-      - description: Integrated HUB module interrupt
-      - description: Receive Pattern Match interrupt
+    oneOf:
+      - items:
+          - description: Device Level Ring (DLR) interrupt
+          - description: Switch interrupt
+          - description: Parallel Redundancy Protocol (PRP) interrupt
+          - description: Integrated HUB module interrupt
+          - description: Receive Pattern Match interrupt
+
+      - items:
+          - description: Switch interrupt
+          - description: Device Level Ring (DLR) interrupt
+          - description: Parallel Redundancy Protocol (PRP) interrupt
+          - description: Integrated HUB module interrupt
+          - description: Receive Pattern Match interrupt 0
+          - description: Receive Pattern Match interrupt 1
+          - description: Receive Pattern Match interrupt 2
+          - description: Receive Pattern Match interrupt 3
+          - description: Receive Pattern Match interrupt 4
+          - description: Receive Pattern Match interrupt 5
+          - description: Receive Pattern Match interrupt 6
+          - description: Receive Pattern Match interrupt 7
+          - description: Receive Pattern Match interrupt 8
+          - description: Receive Pattern Match interrupt 9
+          - description: Receive Pattern Match interrupt 10
+          - description: Receive Pattern Match interrupt 11
+          - description: Switch timer pulse output interrupt 0
+          - description: Switch timer pulse output interrupt 1
+          - description: Switch timer pulse output interrupt 2
+          - description: Switch timer pulse output interrupt 3
+          - description: Switch TDMA timer output interrupt 0
+          - description: Switch TDMA timer output interrupt 1
+          - description: Switch TDMA timer output interrupt 2
+          - description: Switch TDMA timer output interrupt 3
 
   interrupt-names:
-    items:
-      - const: dlr
-      - const: switch
-      - const: prp
-      - const: hub
-      - const: ptrn
+    oneOf:
+      - items:
+          - const: dlr
+          - const: switch
+          - const: prp
+          - const: hub
+          - const: ptrn
+
+      - items:
+          - const: switch
+          - const: dlr
+          - const: prp
+          - const: hub
+          - const: ptrn0
+          - const: ptrn1
+          - const: ptrn2
+          - const: ptrn3
+          - const: ptrn4
+          - const: ptrn5
+          - const: ptrn6
+          - const: ptrn7
+          - const: ptrn8
+          - const: ptrn9
+          - const: ptrn10
+          - const: ptrn11
+          - const: tp0
+          - const: tp1
+          - const: tp2
+          - const: tp3
+          - const: tdma0
+          - const: tdma1
+          - const: tdma2
+          - const: tdma3
 
   power-domains:
     maxItems: 1
@@ -50,14 +115,21 @@ properties:
     unevaluatedProperties: false
 
   clocks:
+    minItems: 2
     items:
       - description: AHB clock used for the switch register interface
       - description: Switch system clock
+      - description: Timestamp clock
 
   clock-names:
+    minItems: 2
     items:
       - const: hclk
       - const: clk
+      - const: ts
+
+  resets:
+    maxItems: 1
 
   ethernet-ports:
     type: object
@@ -80,14 +152,51 @@ properties:
               phandle pointing to a PCS sub-node compatible with
               renesas,rzn1-miic.yaml#
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - reg
   - clocks
   - clock-names
   - power-domains
+  - interrupts
+  - interrupt-names
+
+allOf:
+  - $ref: dsa.yaml#/$defs/ethernet-ports
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-ethsw
+    then:
+      properties:
+        interrupts:
+          minItems: 24
+        interrupt-names:
+          minItems: 24
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+        ethernet-ports:
+          patternProperties:
+            "^(ethernet-)?port@4$": false
+      required:
+        - resets
+    else:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          maxItems: 5
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+        resets: false
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.55.0


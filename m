Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816485;
	b=ffewem6BQl7xGL7ch01DXBYjT+wcwtA98+UqKhUxRsq77sSE5BUOGOU6IuW0t/uyZ6cs
	 FPhoja2VKDC1YpkMG6RFECBaw9zZ3bODqLS6BKE1DIUdgKpg2HBfIbH4tA6PZf/7EKP++
	 ig2eioOjmrLiSs6GWQ54j7lAq+qnlOTEvcXm/UHJtGyyF+CrOt5WQfT/2LZx3R4VcZlak
	 yuh2gqkdUg6s3MB5UViG3iueOU3SQSZ36tWxhiU5bbVddF+JInqiz3ZOFGi0wIN+QKdin
	 mxAz0qN3i4IUAaTPeJhXzJbhfD404fH37Hz41uFBCYsemIIZ5Z/aj0gpjKPLxopuctw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=k5d9AKGgnASGpBaA9KpcVgjLXomk+I+wEOEeX7xp7Ws=;
	b=IfM/gV8b/J19liUJxoiGNT9fffXSxCrF2r5zmXwaRPNdZpuZMEYdEoEBrwSoYzrVVtT9
	 qTiHLlsKVEtavCe6GmKKt+5uh2zEoxhy9Vc+jsNL4nqt5qMTjvqXboe6aqg5s6bwjowh8
	 db7kl+8D0Jzfm/L4QHUTRcYfQ86at2WAQ5dIsPHskVgmMUHohq0hqUFxxrj/ln5kA7B7x
	 r4bJAIJmxIXtnM9ikzutRX0/n6l6sESqUYt0lGL5LVda7hj/crOz0RlxU7Lhc4gZGojTr
	 9Ybx/D99p/twvxNFCK6W/kZDT+g41GL7l1KHifdAXPZJLDQtElCV4+LDi0lwZvd+7zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iXWY16W4;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C378E6082BEC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C378E6082BEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iXWY16W4
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4910b863b84so87603f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816478; x=1794421278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k5d9AKGgnASGpBaA9KpcVgjLXomk+I+wEOEeX7xp7Ws=;
        b=iXWY16W4ged8/qBPTv5M6NGbA7HDoliiumzdMwssxWszKa97bd7qAJfPEk9xnXHT8K
         5qgWRXyMB95iVCtmxVosUVT56W+9r9IuWvOSHifkoMdE4TezSTaRQXs/gZfy0ez+TF2Q
         7sXFpCnPBd156fT6hUQVoZlPtbkbW6dWE/YpjNBmJpOZSl0WH/zN3Doyn8CQCQAAqNkA
         4EHDsdZ2KdPbO8YicddvuokiwCraM3lpO+l86nxZXOOmrdyAcumvig21MR9T1UtPspt8
         pkaAXGFIDTJDfS3Mcx0DlB5Kj4OEA37j8UWBdAIHYES9nh+upNxS/tam489kYvAs7WG6
         Vd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816478; x=1794421278;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5d9AKGgnASGpBaA9KpcVgjLXomk+I+wEOEeX7xp7Ws=;
        b=A8MWmh4CzlAdvcoG1PuPIepQ9F9CwWfJh0GhfJSEOyHAxwRWdCn6KFLV1Vk0xQTiIb
         UGpo3GCIsbY17uWip5bKNjBSWelG/yBCNXd9FuQWGyvLQUs0MQSoGmN+uj0mbVZxlXZ4
         pJenuBH8amfv4Khb1I8U4lJYKUPVQWJTDdtIHsotq9MOXTegDYfYFe2dcwjwyRvRDjk8
         blg+6wGIvKDoTrzwQKnnEqK2nfg9h2IbWxljBgHrG3VHyV5ZxwpH0pcYAlDgL76iLMKO
         TFrVfMhrdUJ85pBY05HCTOHimjqSs/8IAeM6fZ7rwpCBfaBVbtCNNWtdv/1cneGRf+xV
         l3Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzhNRlSpDeE8KP85l72ARB/JYwo9N+8jJm0WVPHLv9dM5xA+RbwHQoNMla83VIxEygQNy+Oc45/FI/cxDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ME724n3L1NNRnNYq+jCf/P075V6pfbAoPZYJyd527L3Ucafhq
	L8iYVn1uHtvvQLGgpdxqmRfGV2/caf+VYqIyIeO/8yKz6p7JOTKQe+xf
X-Gm-Gg: AYBFou3aDZllVHbcrAjeJE7Mt3WeiYPITOWAoAIigzGR0OfCrm/Th+zimYdMjGAjE9o
	hyCLfSgr9g+J44T2jJl7qKXA39XpLyRZ6XKpEUz7yiEJ4VZDuJUCzXffc+zzBhjgIqK678tdUsa
	jVHeOZl4i7EKds978ePqyrMwUihzyjgUKql2jw0ds2RIwWcO/vbQxA3qAp32P3crPU+66OxD6z2
	erNMZYXZBd9AI9xe+9uqFeCzBjjWom6igG/gmta3D3CtK1UXB9VaPRIbkFJ3yKHNSKfIT4eErTi
	u5IWD+Z8TI+yat9Ja0v0NhCntxq+gt7G21E2HVoYXpZgQp+mkSumPQ/JCSUSSsgRiRTI1IdCmqe
	s0CE9xc8r1tX9qtcSwAPhzVUBzLRneZmcl+V27lOxQ8CTQc7s7Wxwv268mRQ9ZuM6WC28znk56/
	sJeKJhCw0ek/vwaf+4kFmBtQQQbkyTwQPE4jPzMaTHt0cXvZ11vqTOQV5tOGsYzgO1EXA0+wuuB
	cO9j4d4uTmYuFT8gPYHEynDos5zTh7Otmk42KjN/iX9oSmXMIU8qHianffz2+Fb3jv6nnT5Bs6P
	LpqtFvPz4e/8+BX5ak0aZZ8NAho0/uLVnIO6t13mtxE9Rgfbd2tp4goQ26aT8oMoVlhb2ZxELwX
	NXNFUcW76Ddh4rQPR1kqGfepNjMdwsv/vzx4azg==
X-Received: by 2002:a05:6000:41f0:b0:48c:54ec:ea3 with SMTP id ffacd0b85a97d-4911963185fmr440964f8f.13.1793816477918;
        Wed, 04 Nov 2026 10:21:17 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:17 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH net-next v4 06/14] dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support
Date: Wed,  4 Nov 2026 18:20:54 +0000
Message-ID: <20261104182105.1102555-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the A5PSW DSA binding to cover the ETHSW variant used on newer
Renesas RZ/T2H and RZ/N2H SoCs. ETHSW is derived from the A5PSW switch
found on RZ/N1 but differs in register layout, clocking and interrupt
topology, and exposes four ports in total (including the CPU/management
port) instead of five.

Update the schema to describe these differences by adding dedicated
compatible strings for RZ/T2H and RZ/N2H.

Use the RZ/T2H compatible string as the fallback for RZ/N2H, reflecting
that both SoCs integrate the same ETHSW IP.

Add myself as a co-maintainer of the binding to support ongoing work on
the ETHSW family across RZ/T2H and RZ/N2H devices.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v3->v4:
- Restricted the reg property for ethernet-ports to maximum 3 for RZ/T2H
- Added RB tag from Rob

v2->v3:
- Added a restriction to disallow port@4
- Updated commit message

v1->v2:
- Added full names for SoCs
---
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  | 158 +++++++++++++++---
 1 file changed, 136 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index 250c59e58439..338e499b42b1 100644
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
@@ -52,14 +117,21 @@ properties:
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
@@ -94,6 +166,48 @@ required:
   - clock-names
   - power-domains
   - ethernet-ports
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
+            "^(ethernet-)?port@[0-3]$":
+              properties:
+                reg:
+                  items:
+                    - maximum: 3
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
 
 examples:
   - |
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598079;
	b=4gG7dWbrhuAz6YCF4ihiYi1u1x0PqMH6SJ52lCNJYs8Tt0c2TAsg/hEukuCFgB4E4vjA
	 aIdP8YHfSNEX3JlR8unfEXuxHq1MqPnbaPeg9Hh3CooCObsn4M8MXWgXli2U69mTWl8C0
	 6QEf2m1vXVJgu5Qr/ESg6lWvtaEfxJi58lfB1QPcpD7TiXf/POWo0YCxdQOEWklCt/x9x
	 8XGBYGPzpy540ak7qiI8Rbr7XsbQuTgn6l9KMGp1u98rNPxaTmx4vSX5/PVt4M/HZOjwt
	 FoWr5PZ1Smy8D0sqhaaUURubVnZ+7+p/OzrDIP4XBqFq2WXtZy4hjo+/0xWHQhe03dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598079;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=bPiM5fOHv/cN9XqEKHSnEn2FGdxgPwtP/JfOgehsQYU=;
	b=hMhxG4pZE4il8JBm7MjdzvSDARJVssHHeQ7tnz8Aci3m6lSEgi0NTFWjyRxh9oL4F4wM
	 I8kc45y7nY50aW9mMFMI0iAmnh5URN7WPi9puCuqRkCXPA3GqOIuVR42LKlMZwN0DktY7
	 AkHhAq/JVSEaD4HEaWZp71b94R4E2JV1wFSenrN1yEtAzbxzm+KSisnSfW87erWXu4oJs
	 wEWwfvSVOU8UAESUqFt+JEM6fSAhWjM/XcxwR+vN4M+qLbCWkN0kfUblFR3iucf3EEe+C
	 dIhpKGuRAY9o1eAAQcE5y0JVeJNisrOOEeuiCljHYdDLzaz7prb39AhgvBIBetQ5rJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=uJtgeaJE;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1977C606A331;
	Mon,  2 Nov 2026 05:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1977C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=uJtgeaJE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=bPiM5fOHv/cN9XqEKHSnEn2FGdxgPwtP/JfOgehsQYU=; b=uJtgeaJEHcUGd
	GYBysmyGkkSpiykALsbTzEFMsLwHgSy8XCRkIfxMKPiQyxUpkAYfDiXjuQM06Irh
	jS0oTtdh3/fH2GSzytlu68levBfujO4qrzzLJq+jasAX+LmvX+pydWru8JEgALm2
	pEORWH2/+8UGmGY67NRDSYw83fZyFY=
Received: from [127.0.1.1] (unknown [114.214.182.90])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAHgDR1IuhqJ9x1AA--.3849S2;
	Mon, 02 Nov 2026 13:41:09 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: usb: snps,dwc3: tighten the two-connector
 shared HS bus
Date: Mon, 02 Nov 2026 13:41:09 +0800
Message-ID: <179359806935.413510.7108025505776923330@mail.ustc.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgAHgDR1IuhqJ9x1AA--.3849S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFyxCF47Cry5CF18CF4fuFg_yoW7tw18pF
	sIyF4rJFWkK34fZ347AF18Cw1kGrWDZrnrJF18Cw1Uuan8WF4rXa13KwnaqFWUCF92vasI
	krykWFn8X3WxWw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xS
	Y4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5
	6T5tUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARESB2rnk1cDXgBGsX

Resending only 1/2 of this series.

The earlier post of this patch (Message-ID
<20261031150154.1106455-2-xiaqinghuan@mail.ustc.edu.cn>, 0/2 cover
<20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>, 2026-10-31) used the
wrong device-tree list address: it was sent to
linux-devicetree@vger.kernel.org, which vger rejects with

  550 5.1.1 <linux-devicetree@vger.kernel.org>: Recipient address rejected:
  User unknown in virtual alias table

so it never reached devicetree@vger.kernel.org.  The patch text below is
unchanged, byte for byte, and is the same text as in the 0/2 cover.  The
sibling 2/2 went to linux-usb and linux-arm-msm and is archived there; this
resend is only about putting 1/2 into the devicetree archive.  The subject is
kept as "[PATCH v5 1/2]" so it still lines up with that cover.

AI-assistance disclosure: this patch is drafted with an AI assistant and
edited by me; the author reviewed, built and tested it, and the content and
the measurements are the author's own.

Two connectors behind one controller only take the mux path when the
controller node itself carries "usb-role-switch": dwc3_get_dr_mode()
otherwise forces dr_mode back to peripheral, dwc3_get_extcon() skips the
role-switch branch and dwc3_drd_init() never calls dwc3_role_mux_init().
The binding accepted such a DT, so a DT that passed the schema check did
not describe a DT the driver could act on.  Require the property whenever
port-select-gpios is present.

Two more holes in the endpoint schema are fixed at the same time:

  - the hs-port patternProperties only covered endpoint@0 and endpoint@1,
    so an unnumbered endpoint or endpoint@2+ escaped the
    unevaluatedProperties: false rule of the graph endpoint.  Use the same
    endpoint name pattern as graph.yaml so every endpoint is validated.

  - the mux-state complementarity was expressed with two independent "if
    const: 0" blocks, which only rejected two zeroes; two endpoints both
    claiming mux-state = <1> passed validation.  Express the pair as oneOf
    so exactly one of the two assignments is accepted.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../bindings/usb/snps,dwc3-common.yaml        | 105 +++++++++---------
 1 file changed, 55 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6b06b0027b..b23d5d8d74 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -31,7 +31,9 @@ $defs:
         enum: [0, 1]
         description:
           Logical level of the port-select GPIO which connects this
-          connector to the shared High Speed data bus.
+          connector to the shared High Speed data bus.  The two connectors of
+          one controller must use different levels; the driver rejects a
+          device tree where two connectors claim the same one.
 
     dependentRequired:
       usb-role-switch: [mux-state]
@@ -42,7 +44,7 @@ $defs:
     unevaluatedProperties: false
 
     patternProperties:
-      '^endpoint@[01]$':
+      '^endpoint(@[0-9a-f]+)?$':
         $ref: '#/$defs/hs-endpoint'
 
 allOf:
@@ -61,70 +63,74 @@ allOf:
   - if:
       required: [port-select-gpios]
     then:
-      required: [dr_mode, ports]
+      # The mux path is only taken when the controller itself carries
+      # "usb-role-switch": dwc3_get_dr_mode() forces dr_mode back to
+      # peripheral, dwc3_get_extcon() skips the role-switch branch and
+      # dwc3_drd_init() never calls dwc3_role_mux_init() without it.
+      required: [dr_mode, ports, usb-role-switch]
       properties:
         dr_mode:
           const: otg
         ports:
-          required: [port@0]
+          # Each connector is one port with a single endpoint: the mux-state
+          # property on that endpoint says which level of the port-select GPIO
+          # reaches it, so two connectors are two ports, not two endpoints of
+          # one port.  port@1 is the SuperSpeed lane of the PHY and is already
+          # described by snps,dwc3.yaml, so the second High Speed connector
+          # lands on port@2.
+          required: [port@0, port@2]
           properties:
             port@0:
-              required: ['#address-cells', '#size-cells', endpoint@0, endpoint@1]
+              $ref: '#/$defs/hs-port'
+            port@2:
+              $ref: '#/$defs/hs-port'
+
+          # The two connectors must claim opposite levels of the port-select
+          # GPIO; requiring both ports in every branch is what makes the two
+          # cases mutually exclusive for oneOf.
+          oneOf:
+            - required: [port@0, port@2]
               properties:
-                endpoint@0:
-                  required: [usb-role-switch, mux-state]
-                endpoint@1:
-                  required: [usb-role-switch, mux-state]
-    else:
-      properties:
-        ports:
-          properties:
-            port@0:
-              patternProperties:
-                '^endpoint@[01]$':
+                port@0:
+                  $ref: '#/$defs/hs-port'
                   properties:
-                    usb-role-switch: false
-                    mux-state: false
-  - if:
-      properties:
-        ports:
-          properties:
-            port@0:
-              properties:
-                endpoint@0:
+                    endpoint:
+                      properties:
+                        mux-state:
+                          const: 0
+                port@2:
+                  $ref: '#/$defs/hs-port'
                   properties:
-                    mux-state:
-                      const: 0
-    then:
-      properties:
-        ports:
-          properties:
-            port@0:
+                    endpoint:
+                      properties:
+                        mux-state:
+                          const: 1
+            - required: [port@0, port@2]
               properties:
-                endpoint@1:
+                port@0:
+                  $ref: '#/$defs/hs-port'
                   properties:
-                    mux-state:
-                      const: 1
-  - if:
-      properties:
-        ports:
-          properties:
-            port@0:
-              properties:
-                endpoint@1:
+                    endpoint:
+                      properties:
+                        mux-state:
+                          const: 1
+                port@2:
+                  $ref: '#/$defs/hs-port'
                   properties:
-                    mux-state:
-                      const: 0
-    then:
+                    endpoint:
+                      properties:
+                        mux-state:
+                          const: 0
+    else:
       properties:
         ports:
           properties:
             port@0:
-              properties:
-                endpoint@0:
+              patternProperties:
+                '^endpoint(@[0-9a-f]+)?$':
                   properties:
-                    mux-state:
-                      const: 1
+                    usb-role-switch: false
+                    mux-state: false
 
 properties:
   port-select-gpios:
@@ -536,4 +542,3 @@ required:
 
 additionalProperties: true
 ...
-
base-commit: fd69bd54e328c407b1853378b25d15803d3453fa
-- 
2.53.0


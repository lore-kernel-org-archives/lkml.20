Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793458929;
	b=mQ2geEZstcKb7Wcv730mI3N7SQ+0zasD1b9rYfiQNT1VuOPnUNH4T357ckCZavQWJHS5
	 G40kPhT+qh4p60V0oJnevvadsWPcpJ7BkcJWOyNrgD6N6rWOn/QCYm5qX4cHZxbsF0Db5
	 dtw3mhyN/J0Zx+RXIMrvOYbmK3dQG9Gh9wuBtSJEam0JY76gTtpJXUK0Sm6ytQWIir/+l
	 H4yNwWluFXH1La0dEz187QKwmDJG0jYw24QyDDRH4FHG/WKQIaCiNrQ+/mGfX0L7QSIjx
	 kGhkLPjZeXJAT7FxXiZq5fT2nAEyQtrmWIOL00lHzAWassgcANxPHCuxLoVNSckw9aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793458929;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=5P5NGlEJXNEaDlXRF0TopP/kS95CMHEOark3g9yDUVM=;
	b=AG8475qaw8qmvzjaWWyQioXWIs1LqOhT1JeT33uxFh1gARoSZdoqn8XzEhmh/8qUuMk7
	 nq0bZvhZPDaHbxUuy41qgqlvRQpoDDaVENAbvskxuekaeVCSfMcF8CyOm+DFc9iCpEr7I
	 DEJTZchq0mZLp0N1u1quaDJGtHk7WReGaCXCk329yOJt7kAa1E+VcoioLlNwn7LYhmUm4
	 1rIsug7d1A0VbBJy/xwh4VT2uP/W5qKOfa7P3Nb2SxUM+9kkho1kYiG68YztFwsDhDZph
	 NpsXrLn8ECRUZqSNzLQsT/LJtiTqGmNk9oq7grvNd6gdcJuqtWx9btYctswUCnVQEoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3899E606A31A;
	Sat, 31 Oct 2026 15:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3899E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=5P5NGlEJXNEaDlXRF0TopP/kS95CMHEOar
	k3g9yDUVM=; b=vVaXAPgm2kkqfBTHTLiRo36Qf3o6gcbFYEDH4r+DWZWh8qVsu3
	JkYyQyVG7ilmaaxXjcJbvI4ddRWyVdtIH+RjYZYSF3/MAjc8hGmK8+jQxDOE/4GB
	LtEtr+38+1U4Jj9PH9G/5EmBsG7JLFx8Do8YCIna10RdmKDR2HpMeGne4=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgA3uDziAuZqpyJvAA--.1475S3;
	Sat, 31 Oct 2026 23:01:58 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: usb: snps,dwc3: tighten the two-connector shared HS bus
Date: Sat, 31 Oct 2026 23:01:53 +0800
Message-ID: <20261031150154.1106455-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261031150154.1106455-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgA3uDziAuZqpyJvAA--.1475S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAr1rJry8CFWkAFW3Ary8Grg_yoW7JrW7pF
	sIyF48JFWDK34fZ347AF18Cw1kGr4DZrnrJF18Cr1UZanxWr45Xa13KwnaqFWUuF92va4a
	k34kWFn8X3W7Ww7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4
	AK67AK6ryrMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07bz
	g4hUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARERB2rk8FYreQAzsP

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


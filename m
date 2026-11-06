Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964516;
	b=JS6YuodLxtBGuQKPoz7XpRJ7qK8BJI1wgKbTgLTRoKEQxeeinkYrGm5PoJjsC37UJJPj
	 ErnoOQHVRbCbLaN/hGeI5lR4B9pYAEaakNumbOa4AeZIy5OjSAzo4bpcidAW59QVHOhrp
	 Xc5frfkkoIZCY+U9GyyaQLAqpMmjF1k602ZsWymtg0pKvEFllwMuUqSQDazhA6gVxofuv
	 1wjx8cm9oNPVKt8JY/rVAw+gehxSPbTANGsYfJu10lf7NsFFUeboTIvtMmCkf39MdWnfk
	 N4HQhmcJaEUZbJRCkKGaHoklm1flIIW7Zi96mYtliUB1faFgD6igX4DC3BU57aBaQ9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964516;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ERoJU+YSkcdzSJp45/76zizxO7Q36Iy9/z1bkXjHy9E=;
	b=jRIoRd0vwLPD3DZF96LRT5nFH8ofX0tgTgPzr/eZ2oYXUewGpPHRbeDW8q87PwVENWxR
	 gB7EvmER2MRwnkUKJ3iaOko/QjCm20yPznVjeY3xYzoW9HOhTlGUzVZ44Musvf84sfeGs
	 RFfA/7l5xhRd/FThLVC1Wc7+CBRXQWwkutwaB85ZI++20UCUxg63eHmtoAWR+nRJUTvof
	 IE+DKmygbTvrwrYFfVSm9HyMUxU38TFWeYKUmmL0cxAN7jzfSizy+8KLo7u3w6W0NxsGX
	 +4J4qt/VeE3VkxRJopNxiP3ebVB5Q6CtaF0p4b5S6j6kTSS/r1Sv2+U5pvpHR2vldSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=f5K0F+RR;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79657606A32C;
	Fri,  6 Nov 2026 11:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79657606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=f5K0F+RR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=ERoJU+YSkcdzSJp45/76zizxO7Q36Iy9/z
	1bkXjHy9E=; b=f5K0F+RRqLy9orWKgIp0OTDLaF+TIPPoeOeW9M69Nll1Eg8uw5
	M58ISbet5bimhGMGYizAkJUb29RU4CRsrBtvu5t4vPviZuH3rhhjv5qcmekI45Jh
	vYBxb2mtp9NYzyPZrR1yKsEqFlMOieY9QD2A2dfIouS1tQpO1aCe2SRrs=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.184.75])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3P0TLue1q1i6PAA--.473S3;
	Fri, 06 Nov 2026 19:28:16 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS bus
Date: Fri,  6 Nov 2026 19:28:09 +0800
Message-ID: <20261106112811.963923-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106112811.963923-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106112811.963923-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgC3P0TLue1q1i6PAA--.473S3
X-Coremail-Antispam: 1UD129KBjvJXoW3ArW8Jr4xCryfXr45KF1rWFg_yoW7Zw4kpF
	Zxtan3JFWkKryfZ397A3W8uwn5Kws8JrnrJr18Ar1UAan8Gr1rXw43KwnIqayUCr97Za4Y
	9rykW3WkXa17CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bO9aPUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2rs2VhhrAAesA

Two connectors can share the High Speed D+/D- pair of one DWC3 controller,
with a GPIO selecting which of them is connected, while their Super Speed
lanes stay separate.

Describe that in snps,dwc3-common.yaml:

  - "port-select-gpios" selects which connector drives the shared bus;
  - each connector is a port of the controller's "ports" node, "port@0"
    and "port@2", with one endpoint per port, so that "ports" keeps
    describing the controller's own buses as the graph bindings expect
    (port@1 is the Super Speed lane of the PHY, described by
    snps,dwc3.yaml);
  - the endpoint of a connector carries "mux-state", the level of the
    port-select GPIO that reaches it, and "usb-role-switch", declaring
    that this connector has its own role-switch input.

The controller node must carry "usb-role-switch" as well, and dr_mode is
required to be "otg": dwc3_get_dr_mode() otherwise forces dr_mode back to
peripheral, dwc3_get_extcon() skips the role-switch branch and
dwc3_drd_init() never sets the mux up, so a device tree that passed the
schema would not describe a device tree the driver can act on.

The two connectors must claim opposite levels of the GPIO, which is
expressed as one choice between the two assignments, and endpoint names
use the pattern of graph.yaml so that an unnumbered or third endpoint is
rejected instead of escaping "unevaluatedProperties: false".  When
port-select-gpios is absent the endpoint properties are rejected, so
existing single-connector descriptions are unaffected.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../bindings/usb/snps,dwc3-common.yaml        | 116 +++++++++++++++++-
 1 file changed, 114 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b6538..0be2a6e83e 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -13,6 +13,40 @@ description:
   Defines the properties of the DWC3 core as being embedded in either an
   vendor-specific implementation or as a standalone component.
 
+$defs:
+  hs-endpoint:
+    $ref: /schemas/graph.yaml#/$defs/endpoint-base
+    unevaluatedProperties: false
+
+    properties:
+      usb-role-switch:
+        type: boolean
+        description:
+          This connector endpoint has its own USB role switch. The switch is
+          registered against this endpoint and looked up with
+          usb_role_switch_at_endpoint().
+
+      mux-state:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description:
+          Logical level of the port-select GPIO which connects this
+          connector to the shared High Speed data bus.  The two connectors of
+          one controller must use different levels; the driver rejects a
+          device tree where two connectors claim the same one.
+
+    dependentRequired:
+      usb-role-switch: [mux-state]
+      mux-state: [usb-role-switch]
+
+  hs-port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    patternProperties:
+      '^endpoint(@[0-9a-f]+)?$':
+        $ref: '#/$defs/hs-endpoint'
+
 allOf:
   - $ref: usb-drd.yaml#
   - if:
@@ -26,8 +60,87 @@ allOf:
       $ref: usb.yaml#
     else:
       $ref: usb-xhci.yaml#
+  - if:
+      required: [port-select-gpios]
+    then:
+      # The mux path is only taken when the controller itself carries
+      # "usb-role-switch": dwc3_get_dr_mode() forces dr_mode back to
+      # peripheral, dwc3_get_extcon() skips the role-switch branch and
+      # dwc3_drd_init() never calls dwc3_role_mux_init() without it.
+      required: [dr_mode, ports, usb-role-switch]
+      properties:
+        dr_mode:
+          const: otg
+        ports:
+          # Each connector is one port with a single endpoint: the mux-state
+          # property on that endpoint says which level of the port-select GPIO
+          # reaches it, so two connectors are two ports, not two endpoints of
+          # one port.  port@1 is the SuperSpeed lane of the PHY and is already
+          # described by snps,dwc3.yaml, so the second High Speed connector
+          # lands on port@2.
+          required: [port@0, port@2]
+          properties:
+            port@0:
+              $ref: '#/$defs/hs-port'
+            port@2:
+              $ref: '#/$defs/hs-port'
+
+          # The two connectors must claim opposite levels of the port-select
+          # GPIO; requiring both ports in every branch is what makes the two
+          # cases mutually exclusive for oneOf.
+          oneOf:
+            - required: [port@0, port@2]
+              properties:
+                port@0:
+                  $ref: '#/$defs/hs-port'
+                  properties:
+                    endpoint:
+                      properties:
+                        mux-state:
+                          const: 0
+                port@2:
+                  $ref: '#/$defs/hs-port'
+                  properties:
+                    endpoint:
+                      properties:
+                        mux-state:
+                          const: 1
+            - required: [port@0, port@2]
+              properties:
+                port@0:
+                  $ref: '#/$defs/hs-port'
+                  properties:
+                    endpoint:
+                      properties:
+                        mux-state:
+                          const: 1
+                port@2:
+                  $ref: '#/$defs/hs-port'
+                  properties:
+                    endpoint:
+                      properties:
+                        mux-state:
+                          const: 0
+    else:
+      properties:
+        ports:
+          properties:
+            port@0:
+              patternProperties:
+                '^endpoint(@[0-9a-f]+)?$':
+                  properties:
+                    usb-role-switch: false
+                    mux-state: false
 
 properties:
+  port-select-gpios:
+    maxItems: 1
+    description:
+      Selects which of the two connectors drives the controller's shared High
+      Speed data bus.  Each connector is described by "port@0" or "port@2",
+      and the endpoint of that port carries the connector's own role-switch
+      input and the "mux-state" level selecting it.
+
   extcon:
     maxItems: 1
     deprecated: true
@@ -411,7 +524,7 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: '#/$defs/hs-port'
         description: High Speed (HS) data bus.
 
       port@1:
@@ -429,4 +542,3 @@ required:
 
 additionalProperties: true
 ...
-


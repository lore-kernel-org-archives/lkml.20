Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762842;
	b=cP2aZzwIGYp4g6HD5yUHt/eC7wkPk6KbV17VzuM9NeYbd0LSeoeE0sfM0YAvcQ7gARU6
	 SB6wjNAtJshMI7Nf0q6LWg3ag+fDvyd/D2bkfrI9WE690y+ZyJGDqXioW/Grx8oOhb4tC
	 UO3ede/bRIjVBvmzVG+nZiIk1h21rZb4mBlSukBg5V44dgjp3dTgAm7djRN1g9pYKxnAW
	 O0qaj1isoeVUvwvP8GwujEaPo0jnZe0dtfmTEtntdeSOEJNpSchXG2fOfhVBW8dxtnfhE
	 1H9fRRX4Z/lkkp/DSvpDfQZn2hoqhXEGpsozV6CV/bIOOUrQtkr0i5oLK5jPbTl7CMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762842;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ERoJU+YSkcdzSJp45/76zizxO7Q36Iy9/z1bkXjHy9E=;
	b=zUZDnUMeNDthHll/NxKMPKjuviQn7EetVSxXnm1jm+Io/XlXAVKISas3GKHASnYxyY3Q
	 zxTwpX4X0xiRY2VZH7HFmbc2x1SPsEJx4FVCiFEK98LZjssJPV8M/O8gk6MsHV9ZTmHdN
	 CFBp5OlsiNf+/pI0ChZy5Zj9WwHUm4h2FFm4a94a0q2AKLUQVeOIsW3OaqgVEOwMYcbNH
	 oh3CTnc958NU5An+ENamYq3309AWODAiS/o/kNB8m7iIgkRdMkRmg3xD1ECJwzopjimGd
	 Jp74tCUg81jbkYcAubRwvyCwychVr9C70nSqJa8154cqU+89/DeQUJ0k0F1rsyZVk/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ccv4x4PC;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46547606D81A;
	Wed,  4 Nov 2026 03:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46547606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=ccv4x4PC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=ERoJU+YSkcdzSJp45/76zizxO7Q36Iy9/z
	1bkXjHy9E=; b=ccv4x4PCwvLbZrs/3eBDb+teoEOd4rmQRISfYzSV9PDiLobC32
	oRf6sTqEAdnv9fipW4Vu2shWYbKlIPBDdHRyQdBzNNVa9VD3LkYeBA95rP366VRC
	sLt0Ti+eCsis6FayCg/sgS0u+5tmeuOhtFR56zWoiAVTgRQCDGtW1C7Zg=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.194.56])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3eT4KpupqijSAAA--.137S3;
	Wed, 04 Nov 2026 11:27:13 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS bus
Date: Wed,  4 Nov 2026 11:27:04 +0800
Message-ID: <20261104032706.210042-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104032706.210042-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032706.210042-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgD3eT4KpupqijSAAA--.137S3
X-Coremail-Antispam: 1UD129KBjvJXoW3ArW8Jr4xCryfXr45KF1rWFg_yoW7Zw4kpF
	Zxtan3JFWkKryfZ397A3W8uwn5Kws8JrnrJr18Ar1UAan8Gr1rXw43KwnIqayUCr97Za4Y
	9rykW3WkXa17CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4
	AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07br
	HUgUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2rqNlcjBwAls2

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


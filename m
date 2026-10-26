Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017942;
	b=bq9tYZ0Vo2sm26ob4TOHQWqHF/8Ugo1zuE6rEJFcK+K6wvHSFAECYAWcI+BKNYvZBmTR
	 7zknCAiY3me5r2AXXpd45oC7mBQgEanJt5Dk3+S8Gn/8JjIcTTxQvnZdJPJ+yTPQuqoSl
	 V68CW1gcA6UCoe2yN77Rg+1wVu6I6KKbcl0xOVSQx0dEjGm4nhzL/o+/x0hx3rJA7SYm5
	 yye129TY9kFWol0dGeXrAndmnbWPNww0no8aIyAgjP3z2NZt2+G264txUbppQMeKT3/0I
	 idsvJyU4cqyQV9EyBsDuT2KyI/8Tc/3avQb7Ga9jt7s11QtUUqiQ/2SXWfxr5hvjDAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017942;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=YP6TS5doeKkZA3J1McevqiS1QfTiivf4o6F01McV3DE=;
	b=E5+l5Kb7M0m0lXCKHcZiV0b1Idpga1n5Q/9a4kNd3+EbyYwrzP2bDRGbEPbOyxxdq0Hy
	 x91tFh2UTxeBuBM5bDtVf5xjG3HLywNM+oHHsBReGy5rTklNTbmQpWdkBPyRqKn96nUw/
	 t8CF3RcqPvZGZF94gutIynNJgqWxC/ikq3t07OBMArPm5nZPMtZhUfn4yplS8uNI+gM7H
	 SAEoPH/V2HC7wyqKs3/4EQmGGRsmFn960KSJMVM3zXx0BIh0nD9QQoF0hTSbmsNE7Z2s/
	 YGinWOfMqlaSH17cwZWaecafPs8owmlNGPlU17S96Aj4LH6qsYV1fxQvqKUmEb5Nv2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=KjfPsXrq;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A876460A2608;
	Mon, 26 Oct 2026 12:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A876460A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=KjfPsXrq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=YP6TS5doeKkZA3J1McevqiS1QfTiivf4o6
	F01McV3DE=; b=KjfPsXrqNaSj4Vcy28dhyHq1iGnFj1L9Wn9ev7iedyOkKBp+ka
	23TNA1Uosjx3JrIppoggJKLg5V2VEWAYsytkKgNi+1nCwnDqPb6QyxHJ3W6n80BG
	nXecgJ/MRZbAIXOvyE5oDgzmig6t0wV6pex9xcXMjo36qMxgdKTaDldPM=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.11])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCHATZLSN9qClRJAA--.2459S3;
	Mon, 26 Oct 2026 20:32:13 +0800 (CST)
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
Subject: [PATCH v4 1/3] dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS bus
Date: Mon, 26 Oct 2026 20:32:09 +0800
Message-ID: <20261026123211.243224-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCHATZLSN9qClRJAA--.2459S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGF48XFW7XF1ktF4fXryDtrb_yoWrWr4kpF
	ZxtF48JrykKryfX3s7AF18uwn5K398ArnrJryUJryUZa98Jr1rXa13Kwn0qa47Cr92va4a
	k34kWF1Yq3W7GF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUgm9-UUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREMB2reWNVnoAALsu

Two connectors can share the High Speed D+/D- pair of a single DWC3
controller, with a GPIO selecting which one is connected.  Super Speed
lanes stay per connector.

Describe that in snps,dwc3-common.yaml:

  - port-select-gpios selects which connector drives the shared HS bus;
  - the shared HS bus is port@0 with two numbered endpoints, endpoint@0
    and endpoint@1, so that "ports" keeps describing the controller's own
    buses as the graph bindings expect;
  - each endpoint carries "mux-state", the port-select level of that
    connector, and "usb-role-switch" to declare that this connector has
    its own role switch input.

When port-select-gpios is absent the endpoint properties are rejected,
so existing single-connector descriptions are unaffected.  The two
mux-state values are constrained to be complementary.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../bindings/usb/snps,dwc3-common.yaml        | 109 +++++++++++++++++-
 1 file changed, 108 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b6..6b06b00 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -13,6 +13,38 @@ description:
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
+          connector to the shared High Speed data bus.
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
+      '^endpoint@[01]$':
+        $ref: '#/$defs/hs-endpoint'
+
 allOf:
   - $ref: usb-drd.yaml#
   - if:
@@ -26,8 +58,83 @@ allOf:
       $ref: usb.yaml#
     else:
       $ref: usb-xhci.yaml#
+  - if:
+      required: [port-select-gpios]
+    then:
+      required: [dr_mode, ports]
+      properties:
+        dr_mode:
+          const: otg
+        ports:
+          required: [port@0]
+          properties:
+            port@0:
+              required: ['#address-cells', '#size-cells', endpoint@0, endpoint@1]
+              properties:
+                endpoint@0:
+                  required: [usb-role-switch, mux-state]
+                endpoint@1:
+                  required: [usb-role-switch, mux-state]
+    else:
+      properties:
+        ports:
+          properties:
+            port@0:
+              patternProperties:
+                '^endpoint@[01]$':
+                  properties:
+                    usb-role-switch: false
+                    mux-state: false
+  - if:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint@0:
+                  properties:
+                    mux-state:
+                      const: 0
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint@1:
+                  properties:
+                    mux-state:
+                      const: 1
+  - if:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint@1:
+                  properties:
+                    mux-state:
+                      const: 0
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint@0:
+                  properties:
+                    mux-state:
+                      const: 1
 
 properties:
+  port-select-gpios:
+    maxItems: 1
+    description:
+      Selects which of the two connectors drives the controller's shared High
+      Speed data bus. Each connector is described by a numbered endpoint of
+      "port@0" that carries its own role-switch input and the "mux-state"
+      level selecting it.
+
   extcon:
     maxItems: 1
     deprecated: true
@@ -411,7 +518,7 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: '#/$defs/hs-port'
         description: High Speed (HS) data bus.
 
       port@1:
-- 
2.53.0


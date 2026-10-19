Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5744F30E9;
	Mon, 19 Oct 2026 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415937; cv=none; b=iHQ4EKK+0X2JXxsfeTo0dynzqdmWml8mcLgDGIP8RGRTbZqIpIdtNELtmiQ89elgPx8GYm1b1+5Xk9f82qmJMoU97NYVyzcX3bJ2hIV2g6rv+wMRvo2pJ3DXpCKc1v0vu0k/N6GysMv/ob3AJpA9b5IeFcCdW2Ywx+VVUz2CyBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415937; c=relaxed/simple;
	bh=l5CIBNu/LqqS5aILKLlwBsGQH6jwTzGLtOflDu7nAwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eK0UroXghXqFxYnfq1zKhshWanjbb4R3gKbICWF98pN29UJAZHoHymXO45czbuM/6/OgT6hhWV03fbkRola3nIPVcnJd+pHPQTLeYRR4iMC51BlszWakclQISI5Bsc/FjOZ5OfFm0+NLahNHBoUnGLRg4tzBnfnaOrlSJaoUD9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=dxH7TK53; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="dxH7TK53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=JBiZm1e1CRAuDg1AcYOjhQJc9XW9AlJxZ4
	u0BHQjNz4=; b=dxH7TK53Scxk33JWLfphGmlZ43jG7X5JU21TUcmSaBpeXJ20Ga
	2XeI8xHOz2YjBVzQ5ZjJVhwBk8hj6kcwtQdSpMhSbayT++MzZUubtnDIqnpBohMp
	ME09H9jWBWcR/72b2Pf5BAnJ1CRYR1O8uvBT/1R9Z1K+Ag/jwWIEnUtIg=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.183.93])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAnoze4GNZquR0TAA--.3173S3;
	Mon, 19 Oct 2026 21:18:49 +0800 (CST)
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
Subject: [RFC PATCH v3 1/2] dt-bindings: usb: snps,dwc3: describe two connectors sharing one HS bus
Date: Mon, 19 Oct 2026 21:18:47 +0800
Message-ID: <20261019131848.344689-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019131848.344689-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261019131848.344689-1-xiaqinghuan@mail.ustc.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgAnoze4GNZquR0TAA--.3173S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGF48XFW7XF1ktF4fXryDtrb_yoWrWryrpF
	ZxtF48JFyvgryfX3s2yF18uwn5K398ArnrJryUJryUZa98Jr1rXa13Kwn0qa47Cr92va4a
	k34kWF1Yq3W7CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4
	AK67AK6ry8MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5Xa
	9DUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREFB2rVHlSR7ABJsT

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
index 6c0b8b653..6b06b0027 100644
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


Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094B3313540;
	Sat, 17 Oct 2026 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792224821; cv=none; b=SC1qFJ51yDpX7379GE+cPlvRtcmiQ7rcT/3qquGqbOOsaxyKW74WHHPsPNEhZ/nbE3Mw62eKJNNwb+5q3e9lDZ0gjLkI7gOmdDL6sxF3UY2d5TyA0uVHLWdprzVhxXHJz9sqewja3I84RL4eXFDFi7NEyfkrcrz76c8/zkZ53/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792224821; c=relaxed/simple;
	bh=6dVCDeTs6MVR/ITZQr4EbnomzmcEM8Sa4YCL/RXtARQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jsHyNAnSCNb7w96Dy58mhXvlTs/ehwIpklUitHNN0j5ka0huufVhcKx5Uu2JYHFbziCqpgWNrhLcIAoTVsh/0K0LfaTTuq1rjG61VXp32l+f4x0s0iOh0lzRzGwhxEEd7vbWExBvc0C1c0AF2vVnTuGjEceZWQePWh19Y3EvjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=B9tHBalj; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="B9tHBalj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=LOVn1Ud0lK2n77K+N8TpYBlPkDvD0HAzwY
	LZ1S4RRp4=; b=B9tHBaljtIjAYaI2dXfzAuf49t8B5HeE3Vbw8daPTqbsJHe1bU
	ccvWeCKtrUq7z1OCVtzQO8wrqyiI/nhuzmppnC/VxRBkGiOXaDRKbpz1hIfCwy08
	xe/02AJo/sBNnYSQwsZOqHtm8ZdB/fOO/HMpce7JsEm9qFWMioARD1DR0=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.230.12])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBH1EggLtNqndoCAA--.2781S3;
	Sat, 17 Oct 2026 16:13:25 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Cc: Felipe Balbi <balbi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: snps,dwc3: describe the two-connector HS data path
Date: Sat, 17 Oct 2026 16:13:19 +0800
Message-ID: <20261017081320.220525-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgBH1EggLtNqndoCAA--.2781S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXF1kKryfXrW5GFWxKr4DJwb_yoW5uw13pF
	yaya1xtr92qa4fZwn7C3W8uwnYgrWkJrnrtry7Jr1UAa98G3yFqa1akwnIgFyUCr92ya4a
	93yvg3W8XanrCaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x
	0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
	pf9x07bYKsbUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2rSe1QUgwBTsH

Some designs wire the High Speed data lines of a single DWC3 controller to
two receptacles and select between them with a GPIO, while the Super Speed
lanes stay per connector.

Describe that in snps,dwc3-common.yaml:

  - port-select-gpios selects which connector drives the shared HS bus;
  - each endpoint of "ports" carries "mux-state", the logical port-select
    level of that connector, and marks itself as a role-switch input with
    "usb-role-switch".

The connector endpoints are restricted to port-base/endpoint-base so that
endpoint subnodes cannot carry unrelated properties.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 .../bindings/usb/snps,dwc3-common.yaml        | 63 ++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653..3d012f222 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -13,6 +13,34 @@ description:
   Defines the properties of the DWC3 core as being embedded in either an
   vendor-specific implementation or as a standalone component.
 
+$defs:
+  hs-port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+        unevaluatedProperties: false
+
+        properties:
+          usb-role-switch:
+            type: boolean
+            description:
+              This connector provides its own role-switch input to the
+              controller.
+
+          mux-state:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+            description:
+              Logical level of the port-select GPIO which connects this
+              connector to the shared High Speed data bus.
+
+        dependentRequired:
+          usb-role-switch: [mux-state]
+          mux-state: [usb-role-switch]
+
 allOf:
   - $ref: usb-drd.yaml#
   - if:
@@ -26,8 +54,37 @@ allOf:
       $ref: usb.yaml#
     else:
       $ref: usb-xhci.yaml#
+  - if:
+      required: [port-select-gpios]
+    then:
+      required: [dr_mode, usb-role-switch]
+      properties:
+        dr_mode:
+          const: otg
+        ports:
+          required: [port@0, port@2]
+          properties:
+            port@0:
+              required: [endpoint]
+              properties:
+                endpoint:
+                  required: [usb-role-switch, mux-state]
+            port@2:
+              required: [endpoint]
+              properties:
+                endpoint:
+                  required: [usb-role-switch, mux-state]
 
 properties:
+  port-select-gpios:
+    maxItems: 1
+    description:
+      Selects which of two connectors drives the controller's shared High
+      Speed data bus. Each connector is described by a "ports" endpoint that
+      carries its own role-switch input and the "mux-state" level selecting
+      it. The controller switches the data path only after it has stopped the
+      role of the previous connector.
+
   extcon:
     maxItems: 1
     deprecated: true
@@ -411,13 +468,17 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: '#/$defs/hs-port'
         description: High Speed (HS) data bus.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS) data bus.
 
+      port@2:
+        $ref: '#/$defs/hs-port'
+        description: Second connector on the multiplexed High Speed data bus.
+
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.53.0


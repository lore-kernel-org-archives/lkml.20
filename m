Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CD93D3D09;
	Tue, 13 Oct 2026 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.38.64.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887384; cv=none; b=uKZiJntwdAwkA3ki9vvNrPKFP+hJLc972ujFDA0bROBP4w8W5RzEAXZ4JSF1+7mlZzYejRmGFnRvTzxlf8jBFlYz/DGfr/hG0R6fm0MPt7/ulseBVFJ2uN4H0oOM04YexPgi/BLOguhOFkIwGePrj161xcNp7PdVfJ/0bCYqXCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887384; c=relaxed/simple;
	bh=bihVVy7sVXGSmGqqPk+Q5zn6sctujG1mlNN0fCOiP3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZFc+fC5QpG5b59cNbeDKMM7o1M0ssEhRbJtIAGva9Pgq6pj7qKIf8LPzZXKqh7u5Ug+2tMXuJ8j3GTjU8UDXZsgAIZxwRLl2AiyJ9K1IHBHk2+LAFsbHTgSNHiGGb6POqB1P0wHL3BqRcbGlIA4vw6Kp2vX+BlBlAwvr9u/DZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn; spf=pass smtp.mailfrom=mail.ustc.edu.cn; dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b=xWhoZCCJ; arc=none smtp.client-ip=202.38.64.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.b="xWhoZCCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=lmW0r4FKr08e8fBqZBY7GS0WutG43Sy+dx
	kL9m40PeU=; b=xWhoZCCJjiMWkvSPreIfxKo34GaUymqbWNJEB6optYLWITAp3G
	4z4dhmKKr7p5F1BkoLgwbnPf0B50EWCY4y3mEwB7IbXnLF97Bgvs/lewjaTo06U4
	C0SG1gR6Isqunv+rJD1PuYBzUT4TrkncvikOZMjDj3qfMmaLtdKPMxYEM=
Received: from 5700g-x8664.ustc.edu.cn (unknown [114.214.192.228])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXEikHCM5q2w3hAQ--.890S4;
	Tue, 13 Oct 2026 18:29:28 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
Subject: [PATCH 2/3] dt-bindings: usb: snps,dwc3: describe the two-connector HS data path
Date: Tue, 13 Oct 2026 18:29:26 +0800
Message-ID: <20261013102927.1141696-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgAXEikHCM5q2w3hAQ--.890S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXF1kKryfXrW5GFWxKr4DJwb_yoWrZr15pa
	9aya17tFySqa43Xw1kJ3W8uw1rGF4kJrsrJr1UXr18Aay5CayFqa1akwn3XFWUCr97Aa4a
	9a4qq3W7Xa17CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUn_-PUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiARETB2rNcIlM4gAYss

From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

Some designs wire the High Speed data lines of a single DWC3 controller to
two receptacles and select between them with a GPIO, while the Super Speed
lanes stay per connector:

                         +-----------+  HS  +----------+
  DWC3 ---- port@0 -----| port-select|-----| connector|
        |                |   GPIO    |     +----------+
        +-- port@2 --------------------...
                         +-----------+

Describe the hardware in snps,dwc3-common.yaml:

  - port-select-gpios selects which connector drives the shared HS bus;
  - each endpoint of "ports" carries "mux-state", the logical port-select
    level of that connector, and marks itself as a role-switch input with
    "usb-role-switch".

The connector endpoints are restricted to the port-base/endpoint-base
schemas so that endpoint subnodes cannot carry unrelated properties.

Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
---
 .../bindings/usb/snps,dwc3-common.yaml        | 72 ++++++++++++++++---
 1 file changed, 63 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6609a709c1..a18bb08afb 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -13,6 +13,28 @@ description:
   Defines the properties of the DWC3 core as being embedded in either an
   vendor-specific implementation or as a standalone component.
 
+$defs:
+  hs-port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+        unevaluatedProperties: false
+        properties:
+          usb-role-switch:
+            type: boolean
+            description: Separate role-switch input for this connector.
+          mux-state:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+            description:
+              Logical port-select GPIO level for this data path. State 0
+              takes precedence when both connectors request USB data.
+        dependentRequired:
+          usb-role-switch: [mux-state]
+          mux-state: [usb-role-switch]
+
 allOf:
   - $ref: usb-drd.yaml#
   - if:
@@ -26,8 +48,44 @@ allOf:
       $ref: usb.yaml#
     else:
       $ref: usb-xhci.yaml#
+  - if:
+      required: [port-select-gpios]
+    then:
+      required: [usb-role-switch, ports, dr_mode]
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
+  usb-psy-name:
+    description:
+      Name of the USB power supply accepting the input current limit
+      requested by the gadget after USB configuration, and during bus
+      suspend and resume.
+    $ref: /schemas/types.yaml#/definitions/string
+
+  port-select-gpios:
+    maxItems: 1
+    description:
+      Selects between two external connectors sharing the controller's HS
+      data bus. The port@0 and port@2 endpoints specify distinct mux-state
+      values and provide independent role-switch inputs. The controller
+      stops the previous role before changing the data path. With neither
+      connector requesting data, the last selection is retained.
+
   extcon:
     maxItems: 1
     deprecated: true
@@ -51,13 +109,6 @@ properties:
       - items:
           pattern: "^usb(2-([0-9]|1[0-4])|3-[0-3])$"
 
-  usb-psy-name:
-    description:
-      Name of the USB power supply accepting the input current limit
-      requested by the gadget after USB configuration, and during bus
-      suspend and resume.
-    $ref: /schemas/types.yaml#/definitions/string
-
   snps,usb2-lpm-disable:
     description: Indicate if we don't want to enable USB2 HW LPM for host
       mode.
@@ -418,13 +469,17 @@ properties:
 
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
+        description: Alternate connector on the multiplexed HS data bus.
+
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -436,4 +491,3 @@ required:
 
 additionalProperties: true
 ...
-


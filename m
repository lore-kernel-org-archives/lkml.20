Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1413C278A;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719827; cv=none; b=L3/n1f1/qDKRe7Ei5jST2RFvaj2ltFs06Fd6bcM9kAVTMuFCgmjc7l7k8MXBIMnZOgPGwt5Uvan9MMSOMVOYJ6Bjx4/OOZy2uhhWxH1l17ULj6sxqBeBuXI+LAfmjF3Ms4tnWBWKPTfNdBbTWcGRafj0AernJIHTI7FBDRU+g2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719827; c=relaxed/simple;
	bh=OGa+jLNJ4hWT7lKrvc/XuPpp7Ju8W8MN1qobEWF2G78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=buVffFhwB458CVqvuSh1JUx9hCs54E0L9h9xipgsg6VEk3E7RtAEvq96VTgYHsGhlDb0GnEJIMJjxKhcHPT65tURnDWrjnrmXcaIvMCsC8EhL7v2Q5mvRrdSgT6t/n0Vtdlm4Q0RiS83r3DRwZ/S5GCePFx31dEYkpGByUrKjdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQG4c/fY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQG4c/fY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85B23C4AF14;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719827;
	bh=OGa+jLNJ4hWT7lKrvc/XuPpp7Ju8W8MN1qobEWF2G78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nQG4c/fYpbokm8d5GtPuCTxiPYn44rmqCqiQumj7SaNj1008ZUv/qmZdrHe6rncNl
	 Si3k+YJDXKxwHRPr7KGjr0SUk14dJ7zkBxMtpioX4Xou5YeHYFXArusTW96PB2Kwfm
	 qNr6pkOu45DEvagVhtGr6gBEGHYv+iM1p15j4LJERa2KoOzf6lwa6YYd4N8jAma8NS
	 5COBKZcojWBtPeXgtIF9sKY+nKBfb7SFwfztzQyJmCEyFyxqvyr+599lnPfqaFkj1x
	 xM6pmVHg5OY5SUu2htHHPx7v4f31Qm5ntGmWfwyi0cKrXvLTbnyK+PGuRfYRFNDXe0
	 7UwEcd80EeTYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703BBC79F85;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:28 +0200
Subject: [PATCH v2 05/22] dt-bindings: thunderbolt: Add Apple
 USB4/Thunderbolt NHI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-5-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6446; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=OGa+jLNJ4hWT7lKrvc/XuPpp7Ju8W8MN1qobEWF2G78=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTXuius73Ti9o1kmfGKh4nHGV6qld0ZZcVUs+vfNyu
 /PTLTSxo5SFQYyLQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRU+8Y/vBclJ7zQOXHytev
 FTgElCRcVxhWXfx4rf/wFL2MSneh2ToM/z2ES7zbTBoK9r5eKVU2P0GF97D4pd9N6zf8NS+sWPQ
 /iBUA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The Native Host Interface (NHI) provides the TX and RX rings used by the
software connection manager on Apple Silicon SoCs.

The NHI is part of the ACIO host router and is exposed to the main SoC
bus while the ACIO co-processor is running.

T6000 and T6020 use one DART stream for the TX and RX control rings and
one shared by all other rings, which are used for XDomain connections.
This likely improves the isolation of those host-to-host connections.

The M3 generation uses a slightly insane set of 24 IOMMU entries. These
are probably one DART stream for each TX and RX ring.

Signed-off-by: Sven Peter <sven@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 .../bindings/thunderbolt/apple,t8103-usb4-nhi.yaml | 151 +++++++++++++++++++++
 MAINTAINERS                                        |   2 +
 2 files changed, 153 insertions(+)

diff --git a/Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-nhi.yaml b/Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-nhi.yaml
new file mode 100644
index 000000000000..a80c8db3ef51
--- /dev/null
+++ b/Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-nhi.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thunderbolt/apple,t8103-usb4-nhi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Silicon USB4/Thunderbolt Native Host Interface (NHI)
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+description: |
+  On Apple Silicon SoCs the Native Host Interface (NHI) is part of the ACIO
+  host router. It provides the transmit and receive rings used by the software
+  connection manager.
+
+  The ACIO co-processor exposes its registers to the main SoC bus while it is
+  running. The NHI is therefore represented as a child of the ACIO node.
+
+properties:
+  compatible:
+    oneOf:
+      - const: apple,t8103-usb4-nhi
+      - items:
+          - enum:
+              - apple,t6000-usb4-nhi
+              - apple,t6020-usb4-nhi
+              - apple,t6030-usb4-nhi
+              - apple,t6031-usb4-nhi
+              - apple,t8112-usb4-nhi
+              - apple,t8122-usb4-nhi
+          - const: apple,t8103-usb4-nhi
+
+  reg:
+    items:
+      - description: NHI registers with the transmit and receive rings
+      - description:
+          Protocol Defined Field (PDF) bitmasks selecting which frames are
+          accepted by each receive ring
+
+  reg-names:
+    items:
+      - const: nhi
+      - const: pdf
+
+  interrupts:
+    description:
+      One interrupt for each of the 12 transmit rings followed by one for each
+      of the 12 receive rings.
+    maxItems: 24
+
+  interrupt-names:
+    items:
+      - const: txring0
+      - const: txring1
+      - const: txring2
+      - const: txring3
+      - const: txring4
+      - const: txring5
+      - const: txring6
+      - const: txring7
+      - const: txring8
+      - const: txring9
+      - const: txring10
+      - const: txring11
+      - const: rxring0
+      - const: rxring1
+      - const: rxring2
+      - const: rxring3
+      - const: rxring4
+      - const: rxring5
+      - const: rxring6
+      - const: rxring7
+      - const: rxring8
+      - const: rxring9
+      - const: rxring10
+      - const: rxring11
+
+  iommus:
+    minItems: 1
+    maxItems: 24
+    description: |
+      T8103 and T8112 use a single IOMMU for all DMA transactions.
+
+      T6000 and T6020 use two IOMMUs: The first is used for transmit ring 0
+      and receive ring 0 which carry control traffic. The second is shared by
+      all other rings which are only used for XDomain connections to other
+      hosts.
+
+      T6030, T6031 and T8122 use 24 IOMMUs. These are most likely one DART
+      stream for each of the 12 transmit and 12 receive rings.
+
+  apple,thunderbolt-drom:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      DROM of the host router built by the bootloader from Apple's Device Tree.
+
+  apple,tunable-nhi:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: Register offset
+        - description: Mask of bits to clear
+        - description: Bits to set
+    description: |
+      List of (register offset, mask, value) tuples copied from Apple's Device
+      Tree, converted by the bootloader and used to configure the NHI after
+      the co-processor has booted.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - apple,thunderbolt-drom
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - apple,t6030-usb4-nhi
+              - apple,t6031-usb4-nhi
+              - apple,t8122-usb4-nhi
+    then:
+      properties:
+        iommus:
+          minItems: 24
+          maxItems: 24
+    else:
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - apple,t6000-usb4-nhi
+                - apple,t6020-usb4-nhi
+      then:
+        properties:
+          iommus:
+            minItems: 2
+            maxItems: 2
+      else:
+        properties:
+          iommus:
+            maxItems: 1
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index 096fe7535c02..a9d2e2a914c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2659,6 +2659,7 @@ F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+F:	Documentation/devicetree/bindings/thunderbolt/apple,t8103-usb4-nhi.yaml
 F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	Documentation/hwmon/macsmc-hwmon.rst
@@ -27217,6 +27218,7 @@ L:	linux-usb@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git
 F:	Documentation/admin-guide/thunderbolt.rst
+F:	Documentation/devicetree/bindings/thunderbolt/
 F:	drivers/thunderbolt/
 F:	include/linux/thunderbolt.h
 

-- 
2.55.0



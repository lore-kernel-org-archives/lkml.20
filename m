Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D772340BCB6;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426433; cv=none; b=NWzjMTdcyzy6ec2tATrcwp32VpDeAfSrxmZcLGsV5a2jvsgsdVHIQntNm8c3g7iUm0CsSwCTsvnss0h46EeVcPb77uus6AI2wPD9IBLbbmNa078QhyWQh8ol0ovZf3+CtMadXBG+9fGiIZGhij2XMRPKKU1yY10Wo+nA0MqHEaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426433; c=relaxed/simple;
	bh=NVmjkH7jPCdZBTzC0lyKhmKhkaZqH5Il1xxRCP38QFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0kk+aEVrW6HbG2MEoiZf3d//I23n1Hp2qJJEXs9cilhANjW1CJ/xY9ws37RHLnZpOXmgPtC3hOw4C2N5gUKFLhjTnCtNU+cvwitoIxB82IONnEkY9x9YJdWtXdGi67XbknTrOibBLuv76Vx2OIrYVYCq/TwQVmaKbK3+f29dMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDm4bzFr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDm4bzFr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84A93C4AF0C;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790426433;
	bh=NVmjkH7jPCdZBTzC0lyKhmKhkaZqH5Il1xxRCP38QFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EDm4bzFrhQ9Sbl37KTnntug6hRzqsnMHtg+ykRDgZhb9BXJY/Df7cp1J6FBSNIWb8
	 QHaqRwSuHKHB8/fZCbeaMZH+2F4d6hQ90Td9t+PoWuNSx5x2Ngfw8PWwZnbCxvcwyM
	 p7i677dkkAGFqM0gni2hlUaRV1C5KyTvkcvf/Mi7YAFSrmb7aGfdeSxpTOyJz5DPTv
	 ZBfQOnjzACWrtuCzWwJWfu9qEiFBM9a+yiUOEesf/Kgy/o430Pgy247hxgfSwbioDR
	 bG2gk9B1cpnMElYYHkUUiACgTmW8RmQbHvvU80coIJytUJc06o91DPIgTqccSyXciR
	 oW9bWTRmL6/4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BF6C9833D;
	Sat, 26 Sep 2026 12:40:33 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 26 Sep 2026 14:40:22 +0200
Subject: [PATCH RFC 03/12] dt-bindings: usb: Add Qualcomm 1st-gen PMIC
 Type-C
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-typec-v1-3-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
In-Reply-To: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
To: Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, mfd@lists.linux.dev, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6560; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=h5jokoIGgyRIrcE5uqQ2ilFZQ7nRsHBBtFGlJGzRCmc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqt70+N08iri4moGn4GRPNFAjjCc33g/d+t6dvb
 0ntxoZYIIOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCare9PgAKCRBgAj/E00kg
 ch+6D/9KoE80RjKlFmJnGWmJvaw9C7H3rPoqPuhClVet63WdKDaAQePP35i2ICzcBUV+ELgTbo0
 r283gsIAUwZwrqZeQ8zgWERl1Ep01Wg9BdXqOvW6Fk9YrEKvVUpRQWSF9yYwj7iiayD64TjH7Uy
 Occ8KAsM93wFHd3slgoSER0JnLSckY5exUWo5FQ4mw8qjA5rdUaGpNruSBYbiIGbdAZaKehiN5h
 +bjRkxmiHpljldWXk7oJBLkAmqzZPkqMk4A6am29awqqnD0+jXOQCis0cGxoldqiqp+hEQ/8n1I
 VeOLyxIkw7sThyR5yZRfjJ5qQImD78m3KW+tUoiCqNomFXgT+gzQnEUuK8988sF3S5bRt3SQMuU
 mEcpPTiaCLPMqLp9DsfS9MbEE0V0slafl1ucO1JF9CmPaJlld+kf3SWVrqPCKbjfE3K1PI8Nna9
 YsD1sSdlkC0m0Vl5wEaxM4lENTyblaPMqDS+35yMErlIGmJDAM5EFCQjS1GoGBMyrIzf2CTmq1i
 +qX7l65nhxnRiPzkfnYAzhAqYR8IAJolG5qk2XRUIamV6xkeU5ipw1I/VsuZ3Wb2O0Kb2tdb5lU
 XtcgXPTmPCTIzouYqk6XbBwZsa8Ows0P8Lx8NGkbbRwOC8GpOOForCaO5wp01N5NefTt/pWDW0r
 YhjHPeTQXAafbOA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Add a binding for the first generation of the Qualcomm PMIC USB Type-C
port controller, found on the PM660 and PMI8998 PMICs.

Unlike the later standalone Type-C peripheral at 0x1500 (e.g. PM8150B),
the gen1 Type-C CC logic is part of the charger's USBIN peripheral
(base 0x1300) and signals all Type-C events (CC state change,
tCCDebounce done, VBUS change and error) through a single aggregate
"type-c-change" interrupt. The USB PD PHY at 0x1700 is register
compatible with PM8150B.

The different interrupt set and register layout make it a separate
binding rather than another variant of qcom,pmic-typec. As with PM8150B,
the Type-C block and PD PHY are described as a separate SPMI node from
the charger.

Allow typec nodes of the Qualcomm SPMI PMIC to use the new binding as
well.

Assisted-by: LLM
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +-
 .../bindings/usb/qcom,pmic-typec-gen1.yaml         | 130 +++++++++++++++++++++
 2 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 5e0ed30a9a466..d7a43aa423c8a 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -199,17 +199,19 @@ patternProperties:
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
   "^temperature-sensor@[0-9a-f]+$":
     type: object
     $ref: /schemas/thermal/qcom,pm8775-mbg-tm.yaml#
 
   "^typec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/usb/qcom,pmic-typec.yaml#
+    oneOf:
+      - $ref: /schemas/usb/qcom,pmic-typec.yaml#
+      - $ref: /schemas/usb/qcom,pmic-typec-gen1.yaml#
 
   "^usb-detect@[0-9a-f]+$":
     type: object
     $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
 
   "^usb-vbus-regulator@[0-9a-f]+$":
     type: object
     $ref: /schemas/regulator/qcom,usb-vbus-regulator.yaml#
diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec-gen1.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec-gen1.yaml
new file mode 100644
index 0000000000000..8e93719fac3d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec-gen1.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,pmic-typec-gen1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PMIC USB Type-C block (gen1)
+
+maintainers:
+  - David Heidelberg <david@ixit.cz>
+
+description:
+  First generation of the Qualcomm PMIC Type-C port controller.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm660-typec
+      - qcom,pmi8998-typec
+
+  reg:
+    items:
+      - description: USBIN peripheral base (Type-C CC logic)
+      - description: USB PD PHY peripheral base
+
+  interrupts:
+    items:
+      - description: Type-C change - CC state, tCCDebounce done, VBUS change or error
+      - description: Power Domain Signal TX - HardReset or CableReset signal TX
+      - description: Power Domain Signal RX - HardReset or CableReset signal RX
+      - description: Power Domain TX complete
+      - description: Power Domain RX complete
+      - description: Power Domain TX fail
+      - description: Power Domain TX message discard
+      - description: Power Domain RX message discard
+      - description: Power Domain Fast Role Swap event
+
+  interrupt-names:
+    items:
+      - const: type-c-change
+      - const: sig-tx
+      - const: sig-rx
+      - const: msg-tx
+      - const: msg-rx
+      - const: msg-tx-failed
+      - const: msg-tx-discarded
+      - const: msg-rx-discarded
+      - const: fr-swap
+
+  vdd-pdphy-supply:
+    description: VDD regulator supply to the PDPHY.
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - vdd-pdphy-supply
+  - connector
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/pd.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@1300 {
+            compatible = "qcom,pmi8998-typec";
+            reg = <0x1300>,
+                  <0x1700>;
+
+            interrupts = <0x2 0x13 0x7 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x0 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x1 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x2 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x3 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x4 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x5 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x6 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 0x7 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "type-c-change",
+                              "sig-tx",
+                              "sig-rx",
+                              "msg-tx",
+                              "msg-rx",
+                              "msg-tx-failed",
+                              "msg-tx-discarded",
+                              "msg-rx-discarded",
+                              "fr-swap";
+
+            vdd-pdphy-supply = <&vreg_l24a_3p075>;
+
+            connector {
+                compatible = "usb-c-connector";
+
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                source-pdos = <PDO_FIXED(5000, 900, PDO_FIXED_DUAL_ROLE |
+                               PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
+                sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
+                             PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
+                op-sink-microwatt = <15000000>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        endpoint {
+                            remote-endpoint = <&usb_dwc3_hs>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.55.0



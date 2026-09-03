Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B08B43D4EE;
	Thu,  3 Sep 2026 07:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421501; cv=none; b=QEN2qATzxitlZSUKUp0bOgJz7wsXUAj/cL8pr/uqOabYCNKNHoVrJhDp0Ko/i/HAgrT2YT0AOV3YwOh8ZHvEVR1f1Q75RFr2f7KAEO+75GhhD57nzy6wKWdpNoO9HrPhl0ZhFRSQWHpqpAdcsioZFKeOemZ4U2vsp0YvlzZCR30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421501; c=relaxed/simple;
	bh=PzqR8zTEGYRy1cY8mT4aSeOCftOq/lvsV8KrYPv0nLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OdW7zc2Hnfu3v035M1AlqPmUNbNaSD7gx0c8F9GxxFrSiGUFwvHrS+1pL/jLwFnlg8t3zyYcKCOPKDeG3ZMuhiZyZG25RMDW/6DOO6kHW74/rWcssEixE87QmXjcqq532H7frJpKOwLQ68jtWSzCn9nTokcRcG5EnV8sOnjbl/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgMkB5VW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgMkB5VW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F0A1F000E9;
	Thu,  3 Sep 2026 07:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788421500;
	bh=tI8RHSkImdO0nj3uMq7x9+u6nJ92+6UzBO5q/OyuHcI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DgMkB5VWYMSVONIMeM1V5oc8r3XnC5ZdojvF4DWESRc0pUOISZpqyHZMCg3Fyrf1J
	 st6/eoMG8cwzatR2Ix+CjqqOUBxkE7++Qq1Fa4RkvAH4kflw2P+5NqTZDq0/3B2Nu7
	 f0oUgtzvRkwMOWINH9JLpDK8OQfNU2oQpH0QW8OxbwSshFbTPPqecY3DUlGr9fCZkM
	 DrKXiNXIK/pyIRR4XomC2h4pJLChTJ6jg8WlAsaxc7Zx8HylA9kS9fxcxKAuYmdcB8
	 WC0Neqs/ojkjFviXcTHggA4bHElQwaEXnB55xI9zF0JcOfVOOIlFk+KjsEGsB+UZ2z
	 t/5K8ZZW6+8ig==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Thu, 03 Sep 2026 09:44:47 +0200
Subject: [PATCH v5 1/2] dt-bindings: phy: Add sa8255p USB PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-phy-qcom-qmp-usb-8255-v5-1-e251e22b341e@kernel.org>
References: <20260903-phy-qcom-qmp-usb-8255-v5-0-e251e22b341e@kernel.org>
In-Reply-To: <20260903-phy-qcom-qmp-usb-8255-v5-0-e251e22b341e@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=PzqR8zTEGYRy1cY8mT4aSeOCftOq/lvsV8KrYPv0nLw=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqmSV2SCea7lPzissVJExXmIGAVJc2ZVXbzNb1H
 vhD6AWRemCJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCapkldgAKCRAZDR20Zk4Z
 Nd7AB/9oJyimK7fPYVgVLN6htoh+EG2H+Gilkkq3kdux/lM8oDpULkpTqGgMjokdkntWubdzOOF
 eNn/AG55bKrPkkfgQfo43N4qPoqtGgbaEZ9xrLp2h6JLNFgTm/XVlIaxM00WRST8kp/AMTHpk3+
 r0/fjdAosqITeqWcHJnrlDOipjUnwwjjyzORgvfR+in3AxasQN9NGSBeS0Ue8qDsSrumc3t/znV
 9CLhUMOTUhhr0G1Z41VpExq+N314wd+GTlqRwbSCnGkheukUeNWHDRhwwyj4UNzglqzrFKHHnTU
 a0YhxjTq8zCf0BvvsWVU/8uUIetjknjLWROQuQ+9GqQgyCS1
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

SA8255p platform abstracts resources such as resets, clocks and
regulators in firmware. The SCMI firmware exposes multiple protocols to
control such resources which are identified by protocol_id.

For this USB phy, 2 SCMI protocols are exposed by the firmware:
* power domain management protocol (protocol_id=0x11)
* performance domain management protocol (protocol_id=0x13)

The power domain has 2 indices: 'core' and 'transfer'.
* core controls the regulators, the clocks and the reset
* transfer only controls the clocks

For example, to power on/off the PHY, we should use the 'core' domain.
To disable data transfer and keeping power enabled, we should use the
'transfer' domain.

Add a new binding for the for the Qualcomm QMP Super Speed (SS) UNI PHY
found in SA8255P.

Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
for which we don't have any information. Since it is not mandatory
for the PHY to be functional, we have ommited it from the bindings.
We can document it (and make them part of the dt ABI) once we have more
information.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 .../phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml         | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml
new file mode 100644
index 000000000000..90bedb05cb7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-qmp-usb3-uni-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255p QMP PHY controller
+
+maintainers:
+  - Mattijs Korpershoek <mkorpershoek@kernel.org>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-qmp-usb3-uni-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: transfer
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        phy@88e8000 {
+            compatible = "qcom,sa8255p-qmp-usb3-uni-phy";
+            reg = <0x0 0x088e8000 0x0 0x2000>;
+            #phy-cells = <0>;
+            power-domains = <&scmi12_pd 3>, <&scmi12_pd 2>;
+            power-domain-names = "core", "transfer";
+        };
+    };

-- 
2.55.0


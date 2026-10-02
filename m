Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5680474248;
	Fri,  2 Oct 2026 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934006; cv=none; b=qmJrtdksfxL2euaO9fKMBBt27vrWc7o1eLYrBhiptXqr4ibaw+ee3TlBl9qqHB3cizEhgHw6oHoK6mG+EjjivzEx2EdEgAYHIr3+zFYMaWnuRm+EReT9PvDEuRzabegz39oLp9ICmB0t9z6354IAt+z6IKBfdwTEL6hm4/16BCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934006; c=relaxed/simple;
	bh=dMdsEeC6kiAPcd6ogrL89hvZoqetjO2ex9YRuS1bgk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dWpMipPofCFOW4dkl3Zol7Yz5Z4jNXOS8Lpz8AdKb3k9OPPJPWIQIFieJuozleNQATS9hKVYAy8ZCQJ36R6XwKNXtkPoy+5BErkDrDZGeWGK5xaY4Crs9z530/7PdPXbxwm/6waC6bocihKtgm3Spbm3iSAMOAb6KD7ZUztICX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgpD+0ik; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgpD+0ik"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C95C1F000FF;
	Fri,  2 Oct 2026 09:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790934004;
	bh=zlihqHzEBJkzDcVvQjjlh/eiRm5TdeNxJq/TBnQS294=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UgpD+0ikiJQZryH5nLvYl0mpe14a0FoZ9/7vMRWVX2aI/9myhzQ7zJgASyQ+Osagx
	 2LunWQ23s/1dXOM9Iv6/+gl3wuI1GxVd2laZVFC4G1cjadUdh7AZByfYcx6LKT0deT
	 ePX2iLGfjgRL7pMpInxUqiJJqW8XCeXufLpyb+BD0PuC8DVS9THgz9p6MUabStOrXZ
	 B10muqdy8AJsm6CZxMGOqOFqZ26mIuejshqPoAvQVjZJkFRpRhNNP8N6FZtCv7ZZx1
	 LYr6D7seUEx8df2Uu4hthtAY36O3LDZ8eU2cmnjvqT38i2XhFf4IzfUopGdZmT+Tcj
	 mmDhnhHGosQxg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Fri, 02 Oct 2026 11:39:37 +0200
Subject: [PATCH v6 1/2] dt-bindings: phy: Add sa8255p USB PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-phy-qcom-qmp-usb-8255-v6-1-bb7dfc5636b4@kernel.org>
References: <20261002-phy-qcom-qmp-usb-8255-v6-0-bb7dfc5636b4@kernel.org>
In-Reply-To: <20261002-phy-qcom-qmp-usb-8255-v6-0-bb7dfc5636b4@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2837;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=dMdsEeC6kiAPcd6ogrL89hvZoqetjO2ex9YRuS1bgk4=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqv3vva3uDB2eDs8PzHLBuzbBSM6nWxqfUiXRsD
 PawuZv1JlGJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCar977wAKCRAZDR20Zk4Z
 NTc9B/9f5U20NOJ2fqnvNIh0JHdASSPzuyExHYeJam9O1UJMn850H+HACrvmZjO9Ksz/nLy3Moj
 pL5vJkb7LJpslKaUcu+IBBonQ+a1Pf2RRyGinD9KNmZqIevznwkx5qswxF4JN1JaAPUDur+Cp87
 K34L4ohSysQu9rwEB/FOBIbsE7vP9lXh7z3/wmRAln0N1nOmC93R2GzmANIPVEshg4YUQJ0HejL
 2Kc4i1DXprOJtowxeVK9mbTAyRXZj/PQfkygc3ESmjqlaPCBZpnDF1YdW/0mCyCoB9SPXypxfvV
 x26ajMI0hX44qMeRiViqakHx6AH145V+WrGE4tFXqOzbf142
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


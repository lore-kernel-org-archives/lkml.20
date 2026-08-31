Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D882A3DAABD;
	Mon, 31 Aug 2026 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168692; cv=none; b=i5otfqr2XzoTQlPvEZhaomqMrB0fKpQTzaKox9PDDts9zKRyASxk5w+R9EjaY2p8+/JSlRXR4VRce+Z2iDxWZClQqGB4wm/8uJBQU8LGBuPYeKOcqfDUS89hwsC1CJvDKzJlt45ghfFslrGJyxflczvSW5a1+wiNqBFk0WKxeqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168692; c=relaxed/simple;
	bh=lmymNw9vRwFG8RLd1ooeMOy0Pe+zb0TvI05tu3fq76Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dpjkp2sPGUt3Y73vcEZtYUKQjY/Fra4SN95AXZyftkMgnFxqIppHSjEOedZB9XMdf2wYE00/nDZFoa3I1y59l/51JEzdAnAa82JOBv+BqHORMVUfQ2rq3XkX6kfTO7qytrUfsijZUwkycXJUhvFOFJFWEyHnVlSHtnaO7cP6kLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ri+hEUGW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ri+hEUGW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031B01F000E9;
	Mon, 31 Aug 2026 09:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788168690;
	bh=GLiBEoEDVdWz7B9/oM3Z4DBrql9BwJ5kz4e26G6SP/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ri+hEUGWnZxD3+wKBpXFSfRBVENDPIEljRNNQuyP1oBBY6k4IfAmGXnHkf1zI2dBw
	 10d59Q5i1yBbbMMOabFfgwxhun2kdWbp1Fu07KINKU7DWrg71zuVxVHMluA6/XRfx1
	 8ZFpoQL85BKCw42/kO61VfIGOHBI/YzV+whEbSmDAWh/F/zSYRCoaB0ep36T3eDGTE
	 SveZ7LU0DT3yP53cBFhG51KBaCcWA2b6kRqe4Te0EibuHuWs5cKfMu5skchlcmZ2oj
	 f+mojMhwaW81lgDWwbcVrQeaSIrLpgP+BJ+2USctc8SoALq1woCuRk+vh3eaTCzyD3
	 SvGaW8KAghroA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Mon, 31 Aug 2026 11:31:21 +0200
Subject: [PATCH v2 1/2] dt-bindings: phy: Add sa8255p high-speed USB PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-phy-qcom-snps-femto-v2-8255-v2-1-dc6197ffde1b@kernel.org>
References: <20260831-phy-qcom-snps-femto-v2-8255-v2-0-dc6197ffde1b@kernel.org>
In-Reply-To: <20260831-phy-qcom-snps-femto-v2-8255-v2-0-dc6197ffde1b@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2753;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=lmymNw9vRwFG8RLd1ooeMOy0Pe+zb0TvI05tu3fq76Y=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqlUnslx12Sfd7huEnIP1amezkYgjK1AzT4Vz9t
 93peOJoDQeJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCapVJ7AAKCRAZDR20Zk4Z
 NRcAB/9vlUeBgvfJYEvc/SmDoTKe7bX4/9c11+6LP4Ogzb7wmtKaNd9vDzWrzokvRsrh2nChHOG
 4HdpO1z6kdAaNHlQ/urVGG/Kl9/B4Sb4iFNCj3Zzbbxr0V9jkxthtX7wHqmRaGwyHOlUOVP5TQi
 qHabwDartwW+asTblqRb9Ix3rTyVCWP2pEz/Ogr0zKb2lpjVGOfzPXg0ZGTyHljAO83bm368FNV
 pn4kYbQh04GxJeDO89IXbMTKhqJ+ZvAEmsjlD7PoK0+nVQFQ7/0Qq3sS2+MEFkq6b4U7lqJ96Ap
 Fi3KO7l/njHtE6JNc+NQLTkBW5Y0IZQMTkZsvvfwxZpbaWUm
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

Add a new binding for the Qualcomm SA8255p Synopsys Femto High-Speed
USB PHY V2 found in SA8255P.

Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
for which we don't have any information. Since it is not mandatory
for the PHY to be functional, we have ommited it from the bindings.
We can document it (and make them part of the dt ABI) once we have more
information.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 .../bindings/phy/qcom,sa8255p-usb-hs-phy.yaml      | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
new file mode 100644
index 000000000000..fff474a8345d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-usb-hs-phy.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-usb-hs-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255p Synopsys Femto High-Speed USB PHY V2
+
+maintainers:
+  - Mattijs Korpershoek <mkorpershoek@kernel.org>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-usb-hs-phy
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
+        phy@88e4000 {
+            compatible = "qcom,sa8255p-usb-hs-phy";
+            reg = <0x0 0x088e4000 0x0 0x120>;
+            #phy-cells = <0>;
+            power-domains = <&scmi12_pd 1>, <&scmi12_pd 0>;
+            power-domain-names = "core", "transfer";
+        };
+    };

-- 
2.55.0


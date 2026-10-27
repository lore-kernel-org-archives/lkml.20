Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106012;
	b=C0fwlEBd0Jit+KYc5gdkfhVQ6yjNEQ8tjMsMVj9cwUrf7v5mKHyNm/MQAVq3+TWNgknu
	 tR6D6uON59n7Kpre0tAsPpQNgm+3E98RHI0tyzBJ7YIQP6AtX3dnFDxowKhARmDYjzhi6
	 xqaKfd8mbb2A91fTc9LFHSHoA5LGHkCt3ujZvgU2Kj+b9ZMTPoTomZlUigS02ps6UTX5B
	 /WoXBReunJnj11pkz+GOZM0u7y4Om8ReHoWJ+G4vS6kAkvk+DYaRdnuwbywvrZQli962q
	 6vpLkypuUZe32kRrCnSXVqdDpl8FaJZJ3UY7HPKDB0HGeYLX+eBnp+M0hCPFTTF9Ltg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106012;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=0qfi8LcTEIAhkZTnzEbOof9THS6tVPWeE7DMnY79UBA=;
	b=M9Pa2h+VV3nzkGhOOxnvO7sM1eT18TgqQ1W7/U9p8LhAtQrQYgLqHw1n+nfG4LkJtAWd
	 1pJgsWYHLGTl3tssKX0KdZXRTRbrbrGrU448PhPXqo2/ShYOkd0iRDS38euAEFR/uA2H/
	 apcNSRfEcpGxd78mq0Yk1kZFH1WcQqamJHa+08gOVQjlqbbeUkeMw+QRI+noA6DSLiMiS
	 w949jQNDeARgyKJd4gt4oV/4qBQilk0Op9Jy0hFr8N8qMLnRiuqFJVVmn67530wyxH7ot
	 wAAT1F5uXsuc8bwutlzOJpFhk5/33a8bs8TPD8J9OJ0nKv+pjtBIFAW9kyvuSwpC3Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+r+1H0L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963AA606A31B;
	Tue, 27 Oct 2026 13:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+r+1H0L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBDC1F031E2;
	Tue, 27 Oct 2026 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793106012;
	bh=0qfi8LcTEIAhkZTnzEbOof9THS6tVPWeE7DMnY79UBA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=k+r+1H0LTEsR8B+HvIaup/Yslb8W4H2jnN45ufxzHytun0x/DjH7LdztmxnBVJMcF
	 lVz8VYLjkVACwjVdjnI7AALvWLEwhGjjWs0p1Zjww17aoxq14JcXigxH6kQPpZQhiW
	 cDTKfdk7J7D86IS9OCO3VmILiJyCS1+wbJmRoxJAvIyvvmWA+O2gNwZF2+4FXF5y3N
	 z/ZdCsPLU15YwcpOxUP6C0Z8hgsg3a275CTIKr9Lna0QvuL3YjRllfHJu2OpmFg2mS
	 yrarjV2BvP9qqD3ntuvBPKljmLrniucPljs4enZPGtwEB7I3Ik4xcHvBiTTLOiBEbO
	 5/jKMh2LgqKAA==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Tue, 27 Oct 2026 14:00:04 +0100
Subject: [PATCH v4 1/2] dt-bindings: phy: Add sa8255p high-speed USB PHY
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-phy-qcom-snps-femto-v2-8255-v4-1-874023825a63@kernel.org>
References: <20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org>
In-Reply-To: <20261027-phy-qcom-snps-femto-v2-8255-v4-0-874023825a63@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2826;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=WXXiGf7OrKyfO4PIIHouxwoXRO3LNHcYNvvxcogFCYs=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBq4KBXj6yJFXLiGksX0GngPV8JNaccjk0/2ijx1
 zX1EScgugqJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCauCgVwAKCRAZDR20Zk4Z
 Ndj7CADq9o8GmPw9W3kx8sBid8MN9/oWsNoON6yz0rZhCRWYnavrQWgzsYljgyq4aVcuYaIFMP4
 +d3b8ViuUuiJcBmatEPTzqT9xMoz/OAvTv3SfEt9BMEvFxayzZEtExok+oNcOxOkulEGwLdaPMy
 GbzqKUN4BxKjSJ9zPTVQCLXhDgyzaLmDQCCcKLImE8JsqMldc2yDo3IFtfB8/e6BI4nCZ99KO2I
 ZytZYNn6/hSJrYk4zsyE/GUsOAtLXc7dSV96MOOQe7vLdx19maQ2ITuRBMCYQRhWCd73jWZmcU2
 RNI2Xlnv0SB7qlo9K0WnlsGqSxUzxJTioTwu2AWxEq86qnoW
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.56.0


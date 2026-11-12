Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511437;
	b=QuN1pUt6zjE1PlT+SDTgjopl7heuFaT0eSCf+4TFzq0xjug18tuffWsnzxvvHzDhe18Z
	 ISzn+Uu/32DKDX600KyQAUFC2GENXP6dKhPiW/jn9/psdjm1mLjB/aEVjJ/gm17EPnEc0
	 jFAO1wE1kDtkrNimh9rln5HhaXlNkZnZ6zpjt2IiK8Txkqb8OvzJqYj23YPrMEulrTNKv
	 J4/pLbOuy++CK045xiqmP6ssbxoTF+qFwM+w9LXYrNc7Gp51fuonVP7ST0tuqUw6Sm5/7
	 Fb0esYal2T+dEB4Itb2DE5sh+6c6r1KC99v5ijv0Nk3WS9FndLqa3MFXCPHofJj3+VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511437;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i3t+AreUue7siiZH8t6zrV81m0hBjn5b8jFxGm+MTNE=;
	b=Zze//JpMR04iIorwto257yL0fzBTQOrz6lk9eT9sQFw+0/ksAHVqbcD7CedRknm9Mpsb
	 DbZR4+alT3U2H0q/BDVVfQIcII1fquZWMf+KP+BzKWO2nsrUem5ptCI9Lt+fnsI1kuouc
	 xHSnrcMA9bvSaWNQjsqSDEp0Hi9qxMXmeBYe+7SHXgdkTS3VSp2/QD09I3zQ/k0G9sxNh
	 VBIpUsHG8x00EDed1nCNhVXXdpzLCsoO6Qp2yvoH+fy2TXJT3M1o6te4JehE938bjkJiY
	 Nov5pHxfSIKnQGP8A2E6ahmp2GbWHtBPynJNxusqniC6qTudLX8ilFyQ2/Kf7yDnMqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSZs3QTo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332F4606A31C;
	Thu, 12 Nov 2026 19:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSZs3QTo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1661F000C5;
	Thu, 12 Nov 2026 19:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794511437;
	bh=i3t+AreUue7siiZH8t6zrV81m0hBjn5b8jFxGm+MTNE=;
	h=From:To:Cc:Subject:Date;
	b=OSZs3QTornnsEGVWo5cP+/cgdr8bt9n7x2CA05Thl1ln0yZkj4dC4NuyFRRpJa+iu
	 PTIVAkiDPz0Ri3necM92pppNyiUqkZUmudYVe2FkdxXVUqDydo3AalIXvc1DeRDz9N
	 JvylzoaXKZBfo50TYh99giTP+ibx954zHosbwIcQ7gHyOvFUaNaxYWiujW8r8UMYSy
	 su+MM3w3dSdDmCCJ5YiLy8gS0jZffsOtHssspKg4aFy7GqxIjjApIPDrW/WLDZTHH9
	 kWta8293oSdD9/9wQtjXpSb4ghaiDYgpETi76BqryINNQPgjEOoHIFF7tLY32t4200
	 ii0LtU3AEiCug==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: phy: qcom: Relax required supplies
Date: Thu, 12 Nov 2026 13:23:44 -0600
Message-ID: <20261112192345.3962577-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
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

For the QUSB2 PHY binding, keep the three regulator supplies required
except for legacy IPQ6018 nodes that do not describe the board rails.

This relaxes the requirements for the IPQ5210 as well as if it is
compatible with IPQ6018, then it shouldn't have more required
properties either.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Rebase on phy-next

v2:
 - Fix trailing whitespace
 - Add blurb to commit msg (for sashiko)
---
 .../bindings/phy/qcom,qusb2-phy.yaml          | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index cfc5a1d16b7f..de0041dd2846 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -174,11 +174,35 @@ required:
   - "#phy-cells"
   - clocks
   - clock-names
-  - vdda-pll-supply
-  - vdda-phy-dpdm-supply
   - resets
 
 allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,ipq6018-qusb2-phy
+                - qcom,ipq8074-qusb2-phy
+    then:
+      required:
+        - vdda-pll-supply
+        - vdda-phy-dpdm-supply
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,ipq6018-qusb2-phy
+                - qcom,ipq8074-qusb2-phy
+                - qcom,msm8996-qusb2-phy
+    then:
+      required:
+        - vdd-supply
+
   - if:
       not:
         properties:
@@ -208,8 +232,6 @@ allOf:
       properties:
         power-domains: false
         required-opps: false
-      required:
-        - vdd-supply
 
 additionalProperties: false
 
-- 
2.53.0


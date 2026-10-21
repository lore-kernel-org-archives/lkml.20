Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792549493;
	b=5K3f5O8S0LpBGrJyvKBYeKys4uoHMOxOSIgqhnwsKjlcfLqY6C4EUz9qVIRW29Su+yTx
	 V4PGdwRYcw/c5hX2E5lK4rAjt3Q2Zm2yxa3zdLJvP2ICFffb5fYJeKiwO4xMJ1VqyOwRO
	 WgX3QhMXP8SIZbv+zHtFRAqCHnb8LmWtP/t5BoIK07KgXGIrcJkQhKZpT9odXv1bmYH3E
	 555xd/87AWiuxdSTDOG6EWi/qaWbph7wS3S4gPX59JTuJZ0maGeIiWgQBiNHIWBHffDDU
	 W4Xc4uZG/U2FCXmRM2sujeDyubBOeHKmbSK/JcE+1h/ty8ogwv0V5MyQ0AoU1Bh3W5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792549493;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M/h5z/1XLiWED7ITGA/5bLuoTUupLcN8WsM8xHCsE1o=;
	b=ONEcjQ8Xt36SauJWvrU8UTJBIJJ6by3TBBn/2EucbHf+IK2+8+p+qusHO05v+WYl0oEG
	 0LX7NfkLF+xevVHf/J6tOdFiOoYO2VkcqdpaxHSoSCqgIbJiAYUBLYRUWdC265Omp4lUD
	 YJDHK/gc9HUoTT5U0jaW8am8x10hlURvQHqqkTOZvOnRUG43KEz4bAPxQxr2/HhU8VYPZ
	 fiDwir2DFQ/ij5QmWP4jtHpKOaa80zUVFLR8EcbeBr5VQCb/80TWT36Xt8HlDapQCsMcv
	 OppqGRSH+x11GbxQkjAZM7WuULl5e3yxO5VhsLfUeerVd26nVQIsr/0GhDrzzn5uUng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kOtmRIrP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7C606A31A;
	Wed, 21 Oct 2026 02:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kOtmRIrP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1151F000C9;
	Wed, 21 Oct 2026 02:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792549493;
	bh=M/h5z/1XLiWED7ITGA/5bLuoTUupLcN8WsM8xHCsE1o=;
	h=From:To:Cc:Subject:Date;
	b=kOtmRIrPsSuGVcUASJmkD1jltCKq0avYh3mPh5Z7KhU4BXzJLsLFrMy1rudq4k4IM
	 WxWPIOIsmk9BbbWKtD7KWHEvMn00Nc7xmcIEoHlkYF2uMxUjz9nNumpAtbhaiy1MLW
	 sG6d5SybM6kUxpr0S8woqRRKQ02pAg2TTKpQI1R3OITitXIqwGl25ULgOEddjiE6nA
	 Dyah7ktVJiBKfQ+yO/IPvjw7qEfU/5wWHr1n65HVBSUIZoFkJZrtrq9/YCx+dCCq3g
	 zVE9zNxYGfuzEhZLOAPp2ohUyf/ny5rNfob47iK/rtmWi6ABg1y42D/ZIu+fbJ5hxl
	 uK4/qdPBSHVkA==
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
Subject: [PATCH v2] dt-bindings: phy: qcom: Relax required supplies
Date: Tue, 20 Oct 2026 21:24:46 -0500
Message-ID: <20261021022446.3619435-1-robh@kernel.org>
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
v2:
 - Fix trailing whitespace
 - Add blurb to commit msg (for sashiko)
---
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 001fd0ccc985..1245b174b0ab 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -165,12 +165,23 @@ required:
   - "#phy-cells"
   - clocks
   - clock-names
-  - vdd-supply
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
+        - vdd-supply
+        - vdda-pll-supply
+        - vdda-phy-dpdm-supply
+
   - if:
       not:
         properties:
-- 
2.53.0


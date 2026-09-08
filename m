Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98122526A80;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860516; cv=none; b=aePLeCcNBOJG0QKdIWs0vUZtSQh4Gra8i6QLaMA6LLcmCgK4a4lFePd77j7/zmCKmdeoIr0IjficIQCvoYKjna5u2WQTGKTFVQfOU8zZzLtRlod+P6Zor+YXLPF+ui5wyxRvg/NMoMC4CluImUso+2T0df03Mk3NNoPdrVa0EQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860516; c=relaxed/simple;
	bh=GNhJnwzA4v6qB0oiDDOZHkZ5dU+PRCSRVX9DyexTG9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQnyGWoWnt2rWPkw0A8NP0X17uHkRgEdnZTeX86pH1upm9U3c0aFzNGpqyMDmnqnH9aCMFrdJAJMcVzooMgpJphtmzcxr5MdDcSoyZH0zYKBnjQHhX8RhNYHzJJuqOYvvOWcfEqZZKKdBfdJdg+RZBHxW04PCZgD+OkevDE6zb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1Sp2ZM0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1Sp2ZM0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79C55C2BCFF;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788860516;
	bh=GNhJnwzA4v6qB0oiDDOZHkZ5dU+PRCSRVX9DyexTG9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u1Sp2ZM0ciUvNOvDfqXh+GQDy8u7LlHRCydPv1xKtc2zSeGK0ntCScOllg4Ko8CZ5
	 lAefc4jRnJlkKnv+3m/0AAuUMqCic8OcsP/uj4QU1D6bPGeT40steRiqvSAZruAX1j
	 s/yW7/pmj9zgFKhTcPoe63VYvKkk6b1R4RyxXa7WabpOS9iDVSTzh4XjlOMfFKZKx8
	 d9KHArg62iXaHl2GbWEvi1BdMbsUaO8mbFNyHStGR9Pr1mQK3qMQLpVEBjpcJq8vcU
	 290+Oq32yYdr6SS7iIdsEwOJ3hSEEi7ifHotQiIagJ/5zXPU6CBlaMfd8pv+uN1KU2
	 YjJMBBylbrbXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CCDC79FAD;
	Tue,  8 Sep 2026 09:41:56 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 08 Sep 2026 13:41:03 +0400
Subject: [PATCH v4 10/13] dt-bindings: usb: qcom,snps-dwc3: Add clocks for
 USB3 on Qualcomm IPQ5018
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ipq5018-usb3-v4-10-b789702f0695@outlook.com>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
In-Reply-To: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Nitheesh Sekar <quic_nsekar@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860513; l=1580;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=nnok2h0uSuHM9sQQxP02Bt+VA9DyMyTiEgmYSTTwQlI=;
 b=pQK1BA+a2+WltBcL9gThdqUA4BSWpFD3YbmUWOaH4HOw+J7UJeH7FUlOlcRPF6zAmxSjaDUTL
 Yex9sjhg4FmBoAtIyKl1u3RYF3BW/0BRAC6yVt75XvHTYNdyQskM1ON
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add aux and lfps clocks in Qualcomm IPQ5018. These clocks are required
only for USB Super-Speed support.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml     | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..5cf10863aca2 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -185,6 +185,26 @@ allOf:
             - const: sleep
             - const: mock_utmi
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5018-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: aux
+            - const: lfps
+
   - if:
       properties:
         compatible:
@@ -286,7 +306,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,ipq5018-dwc3
               - qcom,msm8994-dwc3
               - qcom,qcs404-dwc3
     then:

-- 
2.53.0



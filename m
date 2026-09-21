Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14A49DBA3;
	Mon, 21 Sep 2026 23:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033185; cv=none; b=JpYDVmtVE7ss/Cwcx/fxY8ws8GbLZ8sgS30aRe3/bRWjnSW5S0HkxWzQEfcPwsHdfzFThHYy5vDjtFnmod+kHLBm8yTqRhPz6KSjXL/JppY0p12SAnB3XvobTdBkmNzusE2XwTN9VX0+OcRp1cM7w7cstO6I4MtDQKWc4VcRfYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033185; c=relaxed/simple;
	bh=FuQ5FG02Z45pFqY7t8qLiJteXem04ZaAyluPa+IRt/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iMonFBWxCiJfsw2HOfGf5BhT5t8+MjILqPfecKJYj+UhEEwh1d7G8fhs2q2n11RndL8ZVJEaVC734H0pQ7SmqJrww/OCFrzUuQqlb4pB7HS7yaz5zLsE4Jmba4qP6R77ntPocBq9oqQ8F3DumNB4KtfdHP6g33CwJ0eI77TxCT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POkAV19N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POkAV19N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129D11F00893;
	Mon, 21 Sep 2026 23:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033166;
	bh=8GAx9y7yJ/xv7ZzWtq+gXF0YOXtW3406JmpS9FGPHkQ=;
	h=From:To:Cc:Subject:Date;
	b=POkAV19NqyryMrsyWC7a+LyTrBB+FPUhjeYSS84r79quiJ8prDKy5wvDIpRDsAexT
	 Qr/GpW5AeGdxr4556y65o9MgFKuzSvTNt8tBoj6SaJXH6NDTiD/rn0bNH6yua/cmKK
	 n5WCSYThWBHaHimzrmPpZUBNgLqmF8+4E6Om/YHEwx3+ZClIk1+VH81SgYztlTGN46
	 sA+g5ktxfMlcok1NvzAfv2TitX8ZBU9H6Tf30QoVUPJK4gJBHdURUMVbDNbxg/iclv
	 Mqq/2TPre8jQLD3TbZFuVVZYt83bsLdrsxAv/90HbQ3ZoWCrX6ifI1RZjOQxeuWBCy
	 sA2Z2vg/gnwnw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: phy: qcom: Relax required supplies
Date: Mon, 21 Sep 2026 18:26:02 -0500
Message-ID: <20260921232603.3129898-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the QUSB2 PHY binding, keep the three regulator supplies required
except for legacy IPQ6018 nodes that do not describe the board rails.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 001fd0ccc985..2516eab7f6d3 100644
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


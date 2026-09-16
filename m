Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538AE4DA9B7;
	Wed, 16 Sep 2026 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591543; cv=none; b=SBaMyy1UBPCAkaPybykU15IBJK+tu74IxVvQQwC+ndLJLRgJkFwCPLoOZw5wh6Y0m9PJ4ybMV1EVzB+G17L9s7WSxSyGNH+Yb/0N2TDZHIzvAJExrg9vPefKWKmhKRAvrTOXlhgvK7A/3ddqzgcKTybjnMLLCXseRLrDfMYgfe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591543; c=relaxed/simple;
	bh=9Hhu8R52AM5i0AXYpVtAGkxWyEdJ/yoaL8+LM/k0FGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=alwXFeBnTAmbaNkjJLdixL3Y+e6quh/LXtt87g2CwwIAbDPYgZz7GLxKmS5x59uUovHJ60tCKTlGlvzU3x1E7wblve2Q9BbCmIh7B0QZyfIxPxk8BkewFmx2BuFRT/lEcUmGkoTTc6rFNOkiKSVwHxhwRZYvwQRt3/wbaeijOZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=MsM6wl97; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="MsM6wl97"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4278910485C;
	Wed, 16 Sep 2026 22:45:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789591518; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=r47px2LK1MaSlDpFcSezxdMNmccxTjNecKxUSivvSho=;
	b=MsM6wl976XxP1ZAiDG1peEfD7V9q9HgKjY9MpQcgPdjTEWDEDgfb/yaUvZMDyIySuLQg3Y
	thS6aq39W8OW+AiefX7ZW5UNClayP/hs8+3cLzR6AefXSSJ953v1aSoq5dlkYtvvQpWkvm
	Juo1Y8vksOvSLWY0hxTXdAm1VgNyYJHvLLWOZ10sqFeC4u0FpLHRVw7CWme17JN6U70J21
	jEaS9JRbmlA8PCGNsBSda5Q3E2pqT/nCwNg4axHbl8HbL+eCAuowPPPNImvSQmvzuvwyvP
	Qph55c6LGntM2hefCbl7YzF2oorwRV3k56QPp3LTR6dBXhc5CvhEeeckFb0ioQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP VHIP6 EvalBoard
Date: Wed, 16 Sep 2026 22:44:27 +0200
Message-ID: <20260916204509.166633-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document ifm ZynqMP VHIP6 EvalBoard reference design binding.
The board is populated with four ethernet ports, QSPI NOR,
eMMC, UART and USB host interfaces.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: No change
V3: Add AB from Krzysztof
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df2b35..49ef4e0c68501 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -44,6 +44,11 @@ properties:
           - const: xlnx,zynq-zed
           - const: xlnx,zynq-7000
 
+      - items:
+          - const: ifm,zynqmp-vhip6-evalboard
+          - const: ifm,zynqmp-vhip6
+          - const: xlnx,zynqmp
+
       - items:
           - enum:
               - xlnx,zynqmp-zc1751
-- 
2.53.0


Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9449EC62;
	Thu, 17 Sep 2026 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640428; cv=none; b=HByp7r7MDaQq3hM7pCFmb46pDgIoOE4EAPGlpbsspehsqL07HyEVULY/r9JtA6nm4PnMxNTWqOGGFlsdfYjO+sqC3XPklYo0TyCCQHdHBpnh4mXiogeBg8xmnT8irqt/ybfyYDZlX5gq1Ub8IUPhu840qbp8EsMTgvZ1VN3WMkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640428; c=relaxed/simple;
	bh=ahjJkDQiVsFvT1v7PZsRsJvaWJJO4CtS+VbDhaL8asM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpXoR7nKcr0kB5yyQUtAiuAuZQZNCEn1/+v8z4A4BD2wOkC8KWFTVlp6PKA/e4shvfwU6tCPL4MjdZF5zLklLjhb3CXJ5o1Xz8mWPxn0snX3Egca4en8XlqeROYwGe7Z27+llymW6s3c6X//VHcF1Pnoy9uFV/Nfn0oxukKBjyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=B53ACcXv; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="B53ACcXv"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 78B2D22831;
	Thu, 17 Sep 2026 12:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789640420;
	bh=oqLenxL/19HM/21oW+/2Rvt5NkH8DxDP5vg8uKDbrNU=; h=From:To:Subject;
	b=B53ACcXvI7XqUZL9siGF4NLr9kXTQlVlhYQuZ7eWVulsznG8I77rjStkphKwx69b5
	 FUL8IQGV6plHXL+/BGFpeZK3yqC//ytp+QueXX1aSB7v+RzoUbrx05PhP/RckkelN8
	 ftj6NiE39tehF2MWvNqs8qpUf7X972x6XOYEliO4th5c10V/hC8ipoDPW8ivNI0IZC
	 f7spaSbIwA7+pHXtu/IvKXq+OPhUBjwBONN7Xst38UmRG45DjBzA6PFP+PhvpRat87
	 hjOQyaUVJohWWZgfeljSW3X/JDnvi/OWG+GAec3C3xUzcQCIhoSlmtEYagsoGz0J3I
	 GujHODXikVj0A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Antoine Gouby <antoine.gouby@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: Add Toradex OSM iMX95
Date: Thu, 17 Sep 2026 12:20:08 +0200
Message-ID: <20260917102011.69071-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917102011.69071-1-francesco@dolcini.it>
References: <20260917102011.69071-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Antoine Gouby <antoine.gouby@toradex.com>

Add Toradex OSM iMX95 SoM and the Toradex OSM development carrier board
it can be combined with.

The Toradex OSM iMX95 is a SoM compliant with the OSM V1.2 specification
from SGET using the NXP i.MX95 SoC and is available in Size L (45x45 mm).

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx95
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 36e28e0e4ad9..9413c3e225ea 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1578,6 +1578,12 @@ properties:
           - const: toradex,aquila-imx95     # Aquila iMX95 Module
           - const: fsl,imx95
 
+      - description: Toradex Boards with OSM iMX95 Modules
+        items:
+          - const: toradex,osm-imx95-dev # Toradex OSM iMX95 Module on Toradex OSM Development Board
+          - const: toradex,osm-imx95     # Toradex OSM iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board
-- 
2.47.3


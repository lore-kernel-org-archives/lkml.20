Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D433BE156;
	Fri, 11 Sep 2026 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118426; cv=none; b=tXYkJMXnyaXkNVvt0F0J+hUWwsYTtEiYGrKJtJVFl4A+lSezDmHU4elnZH616/wtle3e/qBpNFAFt5ZP+i9QkCte7OQP7exD4FI3OwYI+koPr/beGq5y+r/1mRzdMpvY9mqUi8nh4jzX0rBXaCo3OlIV0gtNcLWJWEf7zb018As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118426; c=relaxed/simple;
	bh=IiHn0z6Tj0f17tifIL8J8urnl6ONH07od4FcuVdYksg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2B9dz08NBa9kinag5m3KJxoQylZdEZ02pGcKj89HBCx09F4pmQzSL5P/TAx/VnjwUyYphxb0EiNKu186dEelKc9oyhIpl78G0LEnnvPrSwcxE4u9JPqKTUbzriBPyh2t/9NfhW9rQ3r8RLXhvkx6YXN7tK+9gnQtQWoqyIMSmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=z8Z9cslJ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="z8Z9cslJ"
Received: from francesco-nb.. (93-33-8-46.ip42.fastwebnet.it [93.33.8.46])
	by mail11.truemail.it (Postfix) with ESMTPA id 7CDF322DF7;
	Fri, 11 Sep 2026 11:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789118422;
	bh=f1ZwUA6aZ+bCcjphsn35lodInoiS717rQCpdkCJqvLs=; h=From:To:Subject;
	b=z8Z9cslJklzZT8N5SvWMzkxrFZHuYzykH1FCXGhPZV0vWBWWxWfAu3xSjcLXbIBS0
	 EoZBFUJS7w0sSrKAQtq6u9ufFvDUW32PGrpnb0YpLBZrmSkDOzJreTTYKs/CFsA85Z
	 q3VyDN6KswvoQLK9yo9pqAeKONrl2ZHISFG5/AA9thCyTHm3mhI3p8V37yL96sQfjj
	 m1VJE3+CPuj9qdVk8l46ZTRDYq0YAoP0eAnPvOdW/1bGm0T7N1wsiRK8xzYZl+Wk68
	 LzOO+tE0CAEZWKAetQhm0Oyn1FzcnCaE+hWpJZhfNtLiUOnePk5UHWRQviaSgKFrhS
	 Jj3BNAUw7qEtg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/7] dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
Date: Fri, 11 Sep 2026 11:19:45 +0200
Message-ID: <20260911091952.96233-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911091952.96233-1-francesco@dolcini.it>
References: <20260911091952.96233-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add bindings for the Toradex OSM iMX91 and OSM iMX93 SoMs and the
OSM Development Board they can be mated with.

The Toradex OSM iMX91 and OSM iMX93 are OSM 1.2-compliant SoMs based
on the NXP i.MX91 and i.MX93 SoCs, respectively.

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
Link: https://www.toradex.com/products/carrier-board/osm-development-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2:
 - add acked-by
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index a32f779f02e4..33ced11fa2a0 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1520,6 +1520,12 @@ properties:
           - const: toradex,lino-imx91
           - const: fsl,imx91
 
+      - description: i.MX91 boards with Toradex OSM Modules
+        items:
+          - const: toradex,osm-imx91-dev # OSM iMX91 Module on OSM Dev Board
+          - const: toradex,osm-imx91
+          - const: fsl,imx91
+
       - description: i.MX93 based Boards
         items:
           - enum:
@@ -1540,6 +1546,12 @@ properties:
           - const: toradex,lino-imx93
           - const: fsl,imx93
 
+      - description: i.MX93 boards with Toradex OSM Modules
+        items:
+          - const: toradex,osm-imx93-dev # OSM iMX93 Module on OSM Dev Board
+          - const: toradex,osm-imx93
+          - const: fsl,imx93
+
       - description: i.MX94 based Boards
         items:
           - enum:
-- 
2.47.3


Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8593ABD88;
	Thu, 10 Sep 2026 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035391; cv=none; b=UPVcGHd6zM9R5LZlFXOepf6fr1oQvD3ucKU14IkC1/7IvvNGTgGkf/fmjJM5Ydp6VltTSlS0XgjZ7V5BiVhsH9RS1Ik39ZsTyb6K+3EU1+z92IM3ALSSmjlTBKYNjIl76JiudZEHQe8Z+hGkwfQ0RFoapZ9e0R8aoyBMA2CJEzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035391; c=relaxed/simple;
	bh=auczBEwTJYlmg4PKPrF9oXlWspbMMB5xF+N2Jk9y8PM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doBcI/eXmpu7mciQsPyDtBRkVxElWZzy4+XLpqapd9WK+iea3bY8UTTo3+qJ6p1sZqirEdMgVzoAKPgP9KVDj3Ivev7WMGPKYtZyQgABdpXPPm8ek3WycNd1gsMWu0WMqlRRI0chK6zuhwAFhg6bo9tcU/iBwSQZbucyHO9rpew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=vX2b7eCr; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="vX2b7eCr"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 9B92B1FA94;
	Thu, 10 Sep 2026 12:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789035386;
	bh=xfZM4b53LuolQG26Kk9/TzIiMrmHVJoXvIUiyAFFkDQ=; h=From:To:Subject;
	b=vX2b7eCrnziWc+PnldSFwKd2b7ITtBry2xu4mKTAwEX+nzylz+5eZXFMc92Gb8wRb
	 Q7qYck4V3RJZ/hO159JxbbyAHDotvc+RDhBGUvLbSe6K6jrEoWkUCrmKofkeJqFjDg
	 njZEmU9BWSh+pa1aUpW34VLR4x73yjGiGKt49AEUZptCfru32ol4AmNgPZPBug7i2L
	 RMZ3RRndwbZKZz+CfI7MY+KpwPRUzlzxsKxYqc4mQQKvdCOgWqvAVgeQ0nEBwqj3pm
	 CPMGEOo0Dw6JJltTR0wQhFoo6JqSNGQBCW62ODDmQYd8zADeJfLsN3HzoHXoKCRV3o
	 fUsXzlVqYfQsQ==
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
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/7] dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
Date: Thu, 10 Sep 2026 12:16:08 +0200
Message-ID: <20260910101616.139270-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910101616.139270-1-francesco@dolcini.it>
References: <20260910101616.139270-1-francesco@dolcini.it>
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


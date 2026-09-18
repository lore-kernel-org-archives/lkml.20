Received: from trabant.uid0.hu (trabant.uid0.hu [81.0.124.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6B225C818;
	Fri, 18 Sep 2026 20:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.0.124.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764274; cv=none; b=nkATTDIDxvW1cuEHHbVdBj6t07PboI57fgaQBe7qjsqwiT+y+18HTJtvDRLPS625TLRbZ8sGgsD4dtDyCMqQsq8fAHPi/sH79t2Oe+tE5R48bNtnttTvsNLfGtn3MuzIv1XVR65QIzaHowE4SDeHxnCR9CBTQsUQztoibXBy7Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764274; c=relaxed/simple;
	bh=IzXynBoBnQHRbZIM7KYj+WteAOsX9MEUwb/3J/Ax4hM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mXNAnY2V6qNYibbJC6Rq6tGwmciwPpkecePA24mmGV2uFfF9U563ZlPsJPh7UzgD4uQW626jKYy8paJCwNdjfU3okNPSgQHfSzHW8huaqVQaXwmMhSHHlKxD6KnCZsM2RbhEU6N6xcpUEBcKSBNxAqSl1wwrDrRA54dym5IQ9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uid0.hu; spf=none smtp.mailfrom=trabant.uid0.hu; arc=none smtp.client-ip=81.0.124.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uid0.hu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=trabant.uid0.hu
Received: from wigyori by trabant.uid0.hu with local (Exim 4.94.2 #2 (Debian))
	id 1x7ehW-0000ER-K4
	from <wigyori@trabant.uid0.hu>; Fri, 18 Sep 2026 21:56:50 +0200
From: Zoltan HERPAI <wigyori@uid0.hu>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	kernel@pengutronix.de
Cc: wigyori@uid0.hu,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm64: fsl: add Olimex i.MX8MP boards
Date: Fri, 18 Sep 2026 21:55:58 +0200
Message-Id: <20260918195559.130443-2-wigyori@uid0.hu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260918195559.130443-1-wigyori@uid0.hu>
References: <20260918195559.130443-1-wigyori@uid0.hu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Zoltan HERPAI <wigyori@trabant.uid0.hu>

Document board compatible bindings for the Olimex i.MX8MP-SOM and
-EVB boards.

Signed-off-by: Zoltan HERPAI <wigyori@uid0.hu>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e..aef153222 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1146,6 +1146,8 @@ properties:
               - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
+              - olimex,imx8mp-som      # Olimex i.MX8MP-SOM
+              - olimex,imx8mp-som-evb  # Olimex i.MX8MP-SOM-EVB
               - prt,prt8ml             # Protonic PRT8ML
               - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
               - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
@@ -1225,6 +1227,11 @@ properties:
           - const: kontron,imx8mp-osm-s               # Kontron i.MX8MP OSM-S SoM
           - const: fsl,imx8mp
 
+      - description: Olimex i.MX8MP boards
+        items:
+          - const: olimex,imx8mp-som     # Olimex i.MX8MP-SOM
+          - const: olimex,imx8mp-som-evb # Olimex i.MX8MP-SOM-EVB
+
       - description: PHYTEC phyCORE-i.MX8MP FPSC based boards
         items:
           - enum:
-- 
2.39.5


Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E27C4B0E21;
	Thu, 17 Sep 2026 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638162; cv=none; b=ltbQN29e5mdZdGIbNJ8hBrYfnyxH3pWT91gbTUQdh5WWujqCcmmANBRd22edlSLdkfuc7TTYHdxT4wmeZCUm6SBd5ieg4cKQYNZMHTy01rauTVe3A1cOe8UJ+SG+cZSvYdZZHtzJDmYeRSINsehEESFX+bnyMHYmw985/bh9f+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638162; c=relaxed/simple;
	bh=ahjJkDQiVsFvT1v7PZsRsJvaWJJO4CtS+VbDhaL8asM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ay7NuhacBt0r/eetgkg6xg/1VO6I6Xh9FudP8F1C/ZvxU8iIq2euQY9G/+iHaHrHZCuVs6yqA8XAP0d5IthNJ1ciEmioSv+XG0d8Eime4KJM2dYBbEPpkI2pe9u/sEccIys0vh//jGfSaH573vi7m8F3Xnqb/AoJFXc4uyNjF0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Nu9KQPMy; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Nu9KQPMy"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 5F59A1FCA4;
	Thu, 17 Sep 2026 11:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789638144;
	bh=oqLenxL/19HM/21oW+/2Rvt5NkH8DxDP5vg8uKDbrNU=; h=From:To:Subject;
	b=Nu9KQPMyGvEnRxMmeqBlI2wIctwrE5oIuzPKfWniQ2FyhzhEFWZ+xoFy2uhCjxQzr
	 CLfdSnZJlQ5pKcY64xTrirR8JOaonblRZ459PQVDxWj68RXdgKi3ty94dcS/GhTBB/
	 QNMVD9ktzYf/r/GDtRxtJvK+Kz8I9GZOm+ZaIp6kSsDa2Kmcmatxvf5I1ArKWtVbeZ
	 AmrrlBs7EmF33AZXHYiDkuIUd35ygYBGj8rAE4xCPrvZ//j06i1k0LJUIs9iburs1n
	 RIXPYaKvJkeBpY8KKzmL43+jH2caQG3XjjJNbaYMvno36XQLRD/lLn5GGHVCjY68Dw
	 mQrqnDw1crT3A==
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
Subject: [PATCH v1 1/2] dt-bindings: arm: fsl: Add Toradex OSM iMX95
Date: Thu, 17 Sep 2026 11:42:14 +0200
Message-ID: <20260917094217.59508-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917094217.59508-1-francesco@dolcini.it>
References: <20260917094217.59508-1-francesco@dolcini.it>
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


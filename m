Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BACA39CCF6;
	Thu, 24 Sep 2026 06:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233084; cv=none; b=gQX9BKKg5saokmUmCOV5LrrLYBrZzNZ5OT5DoFCG3N0y0voOv/LYqPVmX7xT3f8nZfdnHi30rgpkQQ/894LhbuXfDzcuv0TGtF3GTpkW8kC8Bwfcm+mfICgDcbQ87ZyBF4J5ezMMj8ghEHUHXXD7VINq3eXOmwSBYygMkrDlbUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233084; c=relaxed/simple;
	bh=iqCe5C8lOZ/zYi4WI8Dp1cLEbo7dXTITBB4PNEZXRTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlcFgkytBWdE5IB6Pt9zWH0C3DUD/2qQV58HqC1SJkoPmDyTz8/6jRqw2DDyzgJ43+57mIcBv61En85s+Ini9ms890T3yiWn5azGxGGty3S7oRKj4UkLdKnhPf8DXs7sqqNqGfYV30eM51jkfmyE2SgU38LVBmfMJSX05CR2ah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=XPwKEaA/; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="XPwKEaA/"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8B3712020D;
	Thu, 24 Sep 2026 08:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790233067;
	bh=9imW1wh7P5NcD6+FCFtASpqY9fQcjduq5Jb0jSIcZCk=; h=From:To:Subject;
	b=XPwKEaA/+oTj2IDcyMNLsr7qvw5nGGrHYPG1V2WEYtUm/nT4Yvj4Roa0AuLBD7VJK
	 XUJHj2Fh1U2rD0XNwsIdamM122hqQlFPOUCcTFcDEkGqbZm8hdRJAf8hZ+DS/a7al5
	 zfAeGxCpokrGKObCw7Yf/ZW+96l+xvEBWuS3coi/IxvSghh9EN1IvCWwzizDRw4hy3
	 Y5vZMjaLNPXmtmNglg1QVvbOMp+ZnzMDsV5yGyj+y2it6nYfBAszRjCfHlgzNgaY3A
	 uUM9Z+E1lMVfrh42e7quGI/bATET4zNpx+dTTc2HnyhMp8kcsJ0FIPvgvPQvhWJswW
	 RCuD/UlPhJKWQ==
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
Subject: [PATCH v3 1/7] dt-bindings: arm: fsl: Add Lino iMX91/iMX93
Date: Thu, 24 Sep 2026 08:57:27 +0200
Message-ID: <20260924065735.17678-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924065735.17678-1-francesco@dolcini.it>
References: <20260924065735.17678-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add bindings for the Toradex Lino iMX91 and Lino iMX93 SoMs, based on
the NXP i.MX91 and i.MX93 SoCs, respectively.

Lino SoMs use two board-to-board connectors to interface with a carrier
board. They can also be mounted on the Lino-Verdin Adapter, which
converts the Lino interface to the Toradex Verdin family pinout and
allows the SoM to be used with Verdin-compatible carrier boards.

The Lino-Verdin Adapter also provides a Wi-Fi/Bluetooth module, an
Ethernet PHY and a GPIO expander.

Add compatibles for systems consisting of a Lino SoM mounted on a
Lino-Verdin Adapter and connected to either a Verdin Development Board
or a Dahlia carrier board.

Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx91
Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
Link: https://www.toradex.com/accessories/lino-verdin-adapter
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v3: rebased
v2:
 - add acked-by
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index adf209b3b7cf..f3c73510c18b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1528,6 +1528,15 @@ properties:
               - fsl,imx91-11x11-frdm-s    # FRDM i.MX91S Development Board
           - const: fsl,imx91
 
+      - description: i.MX91 boards with Toradex Lino Modules and Verdin Adapter
+        items:
+          - enum:
+              - toradex,lino-imx91-verdin-dahlia # Lino iMX91 Module on Verdin Dahlia Board
+              - toradex,lino-imx91-verdin-dev    # Lino iMX91 Module on Verdin Dev Board
+          - const: toradex,lino-imx91-verdin     # Lino iMX91 Module on Verdin Adapter
+          - const: toradex,lino-imx91
+          - const: fsl,imx91
+
       - description: i.MX93 based Boards
         items:
           - enum:
@@ -1539,6 +1548,15 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
+        items:
+          - enum:
+              - toradex,lino-imx93-verdin-dahlia # Lino iMX93 Module on Verdin Dahlia Board
+              - toradex,lino-imx93-verdin-dev    # Lino iMX93 Module on Verdin Dev Board
+          - const: toradex,lino-imx93-verdin     # Lino iMX93 Module on Verdin Adapter
+          - const: toradex,lino-imx93
+          - const: fsl,imx93
+
       - description: i.MX94 based Boards
         items:
           - enum:
-- 
2.47.3


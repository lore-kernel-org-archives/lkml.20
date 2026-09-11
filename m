Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D1646F489;
	Fri, 11 Sep 2026 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118425; cv=none; b=XuNWlV8pvXdoLMZCpUZNUIhWvK/ndwGyxZltzs9UrJ0uNv4yZzMn1KicKRJ68KhUbWslCEAjpSVx+r5tjDc/gdotoQ9hrEPbpbLgqSifpDlB9YKyQXlXSAFs/Dn0lmr9XbghG5hHPNCfL9VCh2ebvp7Mh0PMsYdRThLcEHTQEu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118425; c=relaxed/simple;
	bh=WZA9Q5BlsfF3iIqCBUq64t/e5CCKPXdk0aQGcP4xu50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCvRI3OjvRRMJF4/kirvrd4Nd48UYIGuuz29ZFtK1eSkrEX3Kn3greiHUyHIuHUjEFnR65Tq5xSp9MGbCNC63lKCB+tDKOuA8NtNp02s28tmVIY0vgLn0MjaRcnLJIdkWsiRPK8FMwiAchbSPYNTj8U/8K3F9LNakiWEcqqzfQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=IA1th1MI; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="IA1th1MI"
Received: from francesco-nb.. (93-33-8-46.ip42.fastwebnet.it [93.33.8.46])
	by mail11.truemail.it (Postfix) with ESMTPA id 16FDB22DAE;
	Fri, 11 Sep 2026 11:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789118421;
	bh=pmEvnV8BcXRhDLiqMxfGryQ1V4DpLIU/JOkIeNjibRs=; h=From:To:Subject;
	b=IA1th1MIFHI3o41x3a8IM5xNJHcQbd3fMFHh4TkNatqZn6Ag+R08/fe78U5GPiru7
	 mP5jIX6DG1qTjHSm5E6bPCOPqmPF6QTz3aEB4IV02m4q+uGbQXhMc+tjurn7LjyGeA
	 iMi0fPIsFr6SMW6m6YvPFqL0/vAdZZB5LiuX4dUGmL02JNnkbMnQfTStqsskVfPE2L
	 +IDkfCoDYy7+A0gPl0iX46QdjRRs5VysO6qZTJRrBV+x+DH8eAF3Fs0UNtCbipXRRM
	 L8RN7hZa3A/iO9yTand0ugHmR1npfJLK2YOHMRWIeePFylv96Vc46vQByAI5X6vp5I
	 09TuMQre8tc/g==
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
Subject: [PATCH v2 1/7] dt-bindings: arm: fsl: Add Lino iMX91/iMX93
Date: Fri, 11 Sep 2026 11:19:44 +0200
Message-ID: <20260911091952.96233-2-francesco@dolcini.it>
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
v2:
 - add acked-by
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 338dd9eafb17..a32f779f02e4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1511,6 +1511,15 @@ properties:
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
@@ -1522,6 +1531,15 @@ properties:
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


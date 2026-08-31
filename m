Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6063D3D1E;
	Mon, 31 Aug 2026 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164294; cv=none; b=q1YRQf6UuFWKWyiQU+Y035l++9wfKHKgtG1dwxYX/VVMAF/dxe4X7jsaGlxCa9I7nuyk9K5Ra5MBcRndhTgFvX5CizoTaMMaHty9iMEFLiffn5lkRW63JyAOjVaq2ooC4V7incYv6RMAKjqmqJlm3kt+fT71XhbqwR206CsX6qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164294; c=relaxed/simple;
	bh=RZyWgtpU70jBz+JvuDuOLnn//DJ1hx2GrbobllffPFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFfGR8UBdGZAsWwVoVOR+8i2wxZNZeqfpOuDI/bPVjnDfyenkNKJvtR7XgfD9j7x/e517JNCwrLn7qM9vVIUTZTHkH4yglAjSGgzEgZSW3dMo8SPIiv/ScCWh5satZ8RaQJoolEelro2CcJAGbotq8rRwZZP+bZ0t2/plYZXRsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 00624201BD1;
	Mon, 31 Aug 2026 10:18:03 +0200 (CEST)
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 31 Aug 2026 10:17:39 +0200
Subject: [PATCH v8 2/5] dt-bindings: arm: fsl: add compatible for Skov
 i.MX8MP revC Touch
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-2-e2e635452ba9@pengutronix.de>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
In-Reply-To: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=RZyWgtpU70jBz+JvuDuOLnn//DJ1hx2GrbobllffPFg=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9ZUi51du0/9OOj4zrZI1Uln43eluSczr0asMDjrfmXJj
 sSvJaz7O0pZGMS4GGTFFFlUFlbwiXp88IycJsIFM4eVCWQIAxenAExEnY3hn7nS7uqFi1hrzmot
 CZ0r3jvtvfJNzUPR0yY4X879v+zxD2VGhk+WrCYZy65bFKubr/eaIS/nOLHgUFKBx64F1SYnG/T
 juQA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

Add a compatible for revC-based Skov boards with a touch panel.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59a..55d0b682a7305 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1149,6 +1149,7 @@ properties:
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - skov,imx8mp-skov-revc-touch # SKOV i.MX8MP climate control revision C with touch panel
               - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp

-- 
2.51.0


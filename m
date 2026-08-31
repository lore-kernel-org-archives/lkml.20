Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE1F3D093A;
	Mon, 31 Aug 2026 08:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164297; cv=none; b=YdCBA3r/yaTtLuvSbz5G3u7t+u8xJS+6l8dUwRJF0wJEfjGWobStxceK6nNznO5NL0GuTVqHqrNw+ZgyA2gsOPsqbDf5debH2xq94i0X6vavZX0IIUAAARs2nay5Yp5GJOWzyOm8plan/fQ6yu7JIxXp9VJVwQv8Q61NI9yOoAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164297; c=relaxed/simple;
	bh=a3k8qFYd8sPkr64F2Osdz0hiZJMNbTA5QfwPrQ3tdiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F2HPKlOtvIYh2dCiMZzZR6DuZvTTwcqE5t0TAAcTboMpIl3zgfOsQO67nXH2o1fXCFp7ge0/5a4TMc1k7coUsFBne3nPKvJdSbz2S5U3oOfs7/dvsu9zBf5SeZtzIh9ZLTYpekXx696BNcgoVz5t5M1DWtGSftTOGAvdStV7du0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9C287201CD8;
	Mon, 31 Aug 2026 10:18:05 +0200 (CEST)
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 31 Aug 2026 10:17:41 +0200
Subject: [PATCH v8 4/5] dt-bindings: arm: fsl: add compatible for new Skov
 i.MX8MP variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-4-e2e635452ba9@pengutronix.de>
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
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1363;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=a3k8qFYd8sPkr64F2Osdz0hiZJMNbTA5QfwPrQ3tdiw=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9ZUi52nXfN4pNRLJ89Y6mS8tshmqip/+Lbvz19eOSnZa
 HKnQmtxRykLgxgXg6yYIovKwgo+UY8PnpHTRLhg5rAygQxh4OIUgImc0mL478ITKSTIGM1a374i
 9r+43/bNMw9GLHtWwHRyl0LJmcuTDjMybDJSDpHZ96nW+sbl79cviLOWWXWuM9tysjH5j8Abp9K
 ZzAA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622

In preparation for adding a new device tree variant with a different 7"
panel, describe the DT compatible in the binding.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 55d0b682a7305..aaa9d18a241f8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1147,6 +1147,7 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
+              - skov,imx8mp-skov-revc-jutouch-jt070tm041 # SKOV i.MX8MP climate control with 7" JuTouch panel
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
               - skov,imx8mp-skov-revc-touch # SKOV i.MX8MP climate control revision C with touch panel

-- 
2.51.0


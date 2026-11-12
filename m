Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501446;
	b=36k9Ai/zk6GdoOm/QATE4c1KPREsor9/sp9fB7zVNttEkZ9Nbr5bNyv1ZP+M4Bl6PGou
	 QSPkbxVXepT+ZPgh1nkNbMLOoAOIrQj+4Wi4E8DAKimCqoJlJLuwZXdw9AHH+xsY6mE68
	 dO1weIq4LS9puLRiRES5ycvrZJ9P2fFTXUfmUe/cijw99CdfZLyjR5q9lDntb9SBGuXkJ
	 B0OG1dpkOQnhuXnQbbXJxtiv/ophOEsqcYDcqNBUYTaS8RKXTQPLfnzwlqdvEL03jE1z4
	 A81/c0Hhz/PZzEgej4RRWnKLLqjYjBSvJqF3Qkion1xXdLjtxw58OAZ6i+4lo0jPHRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501446;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=M5yd3L4xpmBeVM5XoGF353kDrspRqwKbIMSF1r2WHMU=;
	b=5cdImWxTdk/q4OJeHeaPXafuO4ER6gzz/BbxMOduTl0eApemnmm90j7YRJC7HL+RTidj
	 dziW+54YpJL/NXBq+q41+AjRwE1+ZNfamB3M9E1LCvuoEdQ8gS2531gzqeeHE6cUz3gQO
	 vdJLdumBqHK28znQybLoRmFpcFFQvqoun2jKwoctGXg1azaN1qy/O1UFJCU3469QN0sW+
	 SIEeTUgYKllXG+4/2Q0fErSHR9fU6/QHCFfUKhVZnlwqkfRkomMCfkwsFLkLkIchk2hfZ
	 /BJL3tZiS0Ku6YfIJmaR0qSl7itH6mrTf/nOxm/3xsXKrdtmLCrANNEDYIuVyjGUNCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b="Rd9h/v7r";
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2734D606A31C;
	Thu, 12 Nov 2026 16:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2734D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Rd9h/v7r
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB77310A716;
	Thu, 12 Nov 2026 17:37:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794501439; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=M5yd3L4xpmBeVM5XoGF353kDrspRqwKbIMSF1r2WHMU=;
	b=Rd9h/v7rSnKUtWdeUZfHA28W7NZgYmXtAD8dkv86sa2dlucShA2T3wevFF/tWU3aRF9b1i
	7aLHK91cSgMZmB5Df6N85bsuSjqtBQD1yJzQpMnfLRIn2oKtDUDx06D+Ebg7cLyN5sxhwe
	Esle93iKfga3Sspw3WDLKWvafkPlRHwcuQixxASjAR/VLaFKKB62k9QvuQ76C0GsUXZVAR
	8UU8Su9FDvAmNrtv6c6StyvMgFnCBEGODy5F5XLn196ZqKTSlk9E0sDaBKLZRjJmCLj1bj
	y0Mo5OuJWHndMyxa1ABh5AdC9muvQMidnHbj2t9P5xYAzCurDttjo3cO+f4XpQ==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Thu, 12 Nov 2026 17:37:01 +0100
Message-ID: <20261112163703.3358164-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add an entry for the i.MX8MM Cloos CBASE board.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v2:
- Place cbase in the correct order
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..0fd10f1a1a58 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1101,6 +1101,7 @@ properties:
           one compatible is needed.
         items:
           - enum:
+              - cloos,imx8mm-cbase         # i.MX8MM Cloos CBASE Board
               - cloos,imx8mm-phg           # i.MX8MM Cloos PHG Board
               - tq,imx8mm-tqma8mqml-mba8mx # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM on MBa8Mx
           - const: tq,imx8mm-tqma8mqml     # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM
-- 
2.39.5


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827900;
	b=oHEGDp8uVl5xdAAC8tkPTwgxmOVF8w6HGPZVvtSD2JQhSnsKeJkp78cAQP6aCgDysVNO
	 b1CJxEyFFH81nb++0FPusln13gHB3eJlouBbCIg0wPeqfadPmDq3Iw1ObgK2oA9Lipn7p
	 7+Xn3FJhuaEOoz5GF83WcD20MvXM2U8UL85VrD7BClMpGqxcBGSIN0bb9upoQccjX4iBy
	 zlhOXJjb05PbqrK1bUIl1xbCJQ8SR84lq/O5nZ97T1OybaUTOf/twP8H2B/UW2vPvk2B5
	 xxApW/vx9eqvOua0B58eaJfYgoTp8FRIL0G1xngy1oUUGi7hFRNJugswks1sq9SoT0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827900;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=a3AUKNlSVDZ39IZwLsl97UWsYGgmsYsDaAjeg9BZZYE=;
	b=hbJZiGbMb+4U4ZEOugM2wI/8OvQ3EnGuet/PRR0eP+zYfRKgExTegYUEzXv8L1L4eCV5
	 v8ag9+j770FiIUQNhdgW8hiqH6nW1FPoar8+eiuBf/kYPKLApk08rg9HCb4PTIPut/LDQ
	 dEIKNJgExTf9jMiRVjdkOuLJuto5yd9IanESBPARRL6KfCQrhrD2qji/SmSu00txUAMCo
	 1cM+YZdMbE40rFcrboSKKoRHfeXljSJjBOJGlOp+MfT4s3IgXCjB7jdKXTdVy9ytaGj2X
	 TspFjEtDc7mn7P9X9W0wptoMOo5rs19+2wOgAoHsduOwWWd+MDsyDmMLtXrzEthal6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KkRYS7mp;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9636606FA7F;
	Mon, 16 Nov 2026 11:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9636606FA7F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KkRYS7mp
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52A9110D21A;
	Mon, 16 Nov 2026 12:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794827897; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=a3AUKNlSVDZ39IZwLsl97UWsYGgmsYsDaAjeg9BZZYE=;
	b=KkRYS7mpH7UrflVNcXh9d6Y43DirBj6jis+xezcRiSpz5nfZ/ATIiLBUzkPM+7wMEhk2nT
	UOIRZRAaseM7yCeWo3MdW1retdbZGfCsCpZ9IXChCKSxekU0u7MscH9vyRBk8Kdg070u6V
	UNz8/EZ4RKbka4svVqh33oWxoZHFD7wQzISws98vjXsZVjhY+AC3ZGmsvhSSBDTThzv4HK
	2RejkcJJL+vhL6AF7HzC9LliXj9rL8YE1YEFaZYU3cDZFcJeFFEeTuf2fDTr9TG1G2f5Ub
	CLOVtKo8z+Oc0vPMTQMBkr4U0SawGXwvkkSgtb2Mhq+iMgkHYR/YCZEdMYFk7g==
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
	Lukasz Majewski <lukma@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Mon, 16 Nov 2026 12:18:00 +0100
Message-ID: <20261116111802.2442456-1-lukma@nabladev.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes for v2:
- Place cbase in the correct order

Changes for v3:
- Add Acked-by
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322853;
	b=M59ynB9VHGgTEJG+U1ZBgI/oxIiyRSnemH2wij3bFJjcpUc1ZrmJwwCbK46zFr3dY1mN
	 w9mgEybT4EQldzLXpfDhzwMG9U5scbi3/wy9lsyAtPpTZ3GCp3SFxs8u+ztlIfrp+gkL1
	 sUESXiRcONHuanuJ9qvGJ4kekz3/CT8cV7eojJilHR6B3ztbioWnHidoCip5rMid6UyMz
	 EohOpByDpWJgRS/gbhiNjb6B3e3ke67uEKYBOvN26RdAaWAEosBimXSoYANrm3l8YwHyS
	 C3kWFqjMK+/RpTIsdWJcdghBd8oz7WEB/uT4LZvhZAWR9fgN7QrcDR8TsFu6BA4WcvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322853;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=LUXVKyaf2YBA+Itk4l0dA4eJy7yJqBsYFAOw9EDLcDY=;
	b=lkfGsgKF2jkQ/wKbqHTwQh9l8spGHcMoWrc9i2UHF4GLAOfSquTTKyEx6mza/rtwcAbA
	 dFbkX1gmCQFJaW28j4u8FC0LJUZGjYKJMtSSugkwWGWOP4JQBUTLSdepv06fhPOygkT5B
	 DHZt+ZL1SazwWz0Lq5ot9rA5536W59vaN+lkmRKcwf2GHI3B6nW0tfuPlYA6AiVkauZIZ
	 5S4PPmrdNk4PqzulEssnxIQTLP4A8lXjKl7B2AYmiutiB4u/HjJQCtHO5CXD8o9wIjkLw
	 0txdcqkIK5zx/OlDlCcfqTujrLPWdU/ODxhzpuopwyJ5WEzl+proKNjt6h3YWmTO+Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=McBVjdYf;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A66606A32D;
	Tue, 10 Nov 2026 15:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A66606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=McBVjdYf
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2B3E10DAD8;
	Tue, 10 Nov 2026 16:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794322840; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=LUXVKyaf2YBA+Itk4l0dA4eJy7yJqBsYFAOw9EDLcDY=;
	b=McBVjdYfg+4PlVwZi6G6TaAYJMn9xbIG2ErO8vi5HnxqefugD7oVSGDk1yA8fJn2AYQc1G
	3a8R7ErWAHqLrcNfWoLsWDSD6tc6QejX8ZS3fteo2Jdh7D0XQL2IA7kbUNeDkVwXBdCCQv
	Hj1VOcsrDIOrktM7YAd0n21/YUkevW11qjRFAVikVmlzjyJSVpq/ngzu6YYRUD2TbHEGAU
	IBQMOJz3t8USHaWj4RXjlUmvdIHi9rBbTiXToxoLINYZuEOzuL0Bm1uzfcq8aQaqC51lgh
	YQYNpc+xP3FCX3amH/wEWF+mWxVUQxBr8U4ndHIvSSD4IiXZIBwrOmvcXo8Gng==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Stefano Radaelli <stefano.r@variscite.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Tue, 10 Nov 2026 16:00:24 +0100
Message-ID: <20261110150024.1530988-1-lukma@nabladev.com>
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
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..3aee85026f6c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1102,6 +1102,7 @@ properties:
         items:
           - enum:
               - cloos,imx8mm-phg           # i.MX8MM Cloos PHG Board
+              - cloos,imx8mm-cbase         # i.MX8MM Cloos CBASE Board
               - tq,imx8mm-tqma8mqml-mba8mx # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM on MBa8Mx
           - const: tq,imx8mm-tqma8mqml     # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM
           - const: fsl,imx8mm
-- 
2.39.5


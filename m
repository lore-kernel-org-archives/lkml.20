Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501452;
	b=faTbzNO5seis4h/FZvebpiqW+Ef93rrdm4WfuBlL3cSns6Va6XkcRFSUTDwoVJe3H/Tn
	 wnqsXfLYkXjWHrOhtFBmrcO8wfUR3l593jS/+e8Uk0Q6RbZ00wTqMHWV/ceBs3MGT9pAu
	 WKGtkbpB1XOpJw0g2kGzXp6AACHOVq5rBmnRpAXJ241TztOoTfhavySK6MqW8Y5N0ce2Z
	 Q3WXVeDeyleAK3Sz2iKFpgV5dAlH5h29uW/bUViIi2ylL/ZSIFyOMoAcH3IZjE5NgmztH
	 A96Zr86+AlDkuFYA6onTcOeJCc7+FR/SMAR+D5bvqakXJkVu8dO9CPGjckj5kfH6SGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501452;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=FqXsbXaCFmPnB64KL5JcY5o6vyw75pQUZ8BpYM+BYNA=;
	b=0rGvU1dLQPV/YUIeB6tcgn4J9175jhzjaAVAKyPNGdKfC2E3n9fbHoKHgKoFsJtyxDwC
	 8Hn2XaqMQoQ5k8Nb3s/vvRo/VyD3z3WxmJYOKKaOYIANBkxMpDra7B0TbB2PQf4DRMc7k
	 ZPF1LbLYloUFhMnojG33D0zZonobjZoy0sXQr7HhlD+YtsTZ9reX+UExPOb226pw7rhfz
	 vcdjjImbM6QbNFBPerD+F+FhwPRKy9y167Z76qgjrYaPYgthhagNk5hNWYgrSvlzeSwmV
	 ugxC4aI1VTLFlVRVKTWYx+YiRatdCbKnbXPvQJ2irbeyy5KFvqaGV5YFNvM3bfnKKOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=hcZ1xmlw;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BAF606A32D;
	Thu, 12 Nov 2026 16:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56BAF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=hcZ1xmlw
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F7B310CC72;
	Thu, 12 Nov 2026 17:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794501445; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FqXsbXaCFmPnB64KL5JcY5o6vyw75pQUZ8BpYM+BYNA=;
	b=hcZ1xmlwW+fEVZIeg8n+iS0iBpSHFgxMMx6Mcg+ba2LuIZoqhUBzXSvrOrEG/17VoyCEZ1
	mAnfJFEMPTAfKCXnDliWyXcuXBNK5qIVzsTBWlkJipsykm5KgvukgPJcLB8nCTIanrUl1Z
	wGAnb+/5MYIf18rcdVOZaJYFAPg8Gbp0LXprRaosky4BMb7IFulrHyIBKLI+oi+rJ01hg/
	zEEo4PG+yYZTRJx1hMi5NyyQaL7GP8BKVeJNXmzV8U2zBRe6UhUg8fmaQVKsU79QqZbsP6
	ePzNbqBnKM+nD0Z5Otk+Y6sKDHTUXsOjjs2JamIsVF0bJwOqzajIDLsnX2AEEA==
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
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77 temperature sensor
Date: Thu, 12 Nov 2026 17:37:02 +0100
Message-ID: <20261112163703.3358164-2-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112163703.3358164-1-lukma@nabladev.com>
References: <20261112163703.3358164-1-lukma@nabladev.com>
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

Add "national,lm77" as compatible for the National (now TI) LM77
digital I2C temperature sensor.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v2:
- Place the compatible name in correct place
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a8b2b9deade4..ae8f12c83043 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -375,6 +375,8 @@ properties:
           - national,lm95235
             # Temperature sensor
           - national,lm95245
+            # Temperature sensor
+          - national,lm77
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
           - national,lm80
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
-- 
2.39.5


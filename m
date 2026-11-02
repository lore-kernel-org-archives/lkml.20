Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631652;
	b=P9mToEeRMS4Z8n2+7n54cu5wP6J7+jU2MSDDpSvPVrMD2Dux9mqrU39pcN+3F6Zvzs7x
	 EP6uQ7+QcEuGh7j0dThjvEoJcs+eHttjQAUzOddTP1Kvu1UXVmugPagL0ISWMZTb7uJsI
	 lWgOeBbuqTPuTdNshGQfDJvkGOwy2y8rRxa92DomJqqsfnEz6oxE3+OYUkDP+r9kAPkcx
	 w2rEco1vXWl7t3oh0rS0HxQD0oCCt0bAB3BSnMX2u9/5xc6sMgMu49YlZ68DFlhRZx8Ch
	 l9ADqcBGj0Zi1NbArGp3XLOKc+1vufVdgL3kLgIftbalEvW1GfpHAkqHmtv7A8W9PIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631652;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=7RB0aQ170QWbQt1olwfSEj/M8xmgDSopHSlP7JzynLU=;
	b=BnIuiAhBK3b+4VDgGHnG+DFDqx/pq3OQLZDcOlAeqRCDKihVHLZxojMlcZfeW8gnqsex
	 taGtorP+IWEq3h1PhpFyEcFxX0x5jZZO2g/U189Kw8FWqR392mzbkiPvUI59Mz0dAOBa4
	 AqZ2+HHY/1uqLx4qHmQ9Iw0hfsG3B5bNi2gFl+fdEH4LPMUkC8/kQd3n4lr+yzBdk20O4
	 dngo29tpOvhP1RPHxWngA3BVslmfmrwx6n47MC3njosdBWrYUMOzNeejwfnhP6Wr+dBe1
	 BdUhF451CWrZiHvFwf5a4Enf+/czjxWzo05Y3nH6Uwmnj/6lb4mX0ThZ1sY53F/qRZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fY2vOzZo;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D46070C93;
	Mon,  2 Nov 2026 15:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E60D46070C93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fY2vOzZo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=7RB0aQ170QWbQt1olwfSEj/M8xmgDSopHSlP7JzynLU=;
	b=fY2vOzZokSwjB+uPD0JTzcUdkjb5JgFH7E1Ftrg+qYS7rIMuxC9U7um3J897GE
	W8Z11MCwqPvjIwqbYmgHx346pU5igCnJJpE7z+7whJGZN5RunueVg6u+dqlw7r8G
	9xMmSUiu/u351VadXQJvt8wooYopNK1ZVBx4DQtTHtxzY=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3_yh5pehq8uWTEg--.2912S3;
	Mon, 02 Nov 2026 23:00:12 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Mon, 02 Nov 2026 23:00:01 +0800
Subject: [PATCH v11 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-quarkpi-ca2-v11-1-eb246076a82f@163.com>
References: <20261102-quarkpi-ca2-v11-0-eb246076a82f@163.com>
In-Reply-To: <20261102-quarkpi-ca2-v11-0-eb246076a82f@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD3_yh5pehq8uWTEg--.2912S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr4UAF45Ar47WrWrZFWDJwb_yoWDZrgEka
	4xZF15WFWrJFyFgw45Aa1xGFyqqw42kFs7AF1DAF1kA34qkws3Ka95t343Ca4Ikr43urn3
	CFn5JryxWFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_pVbDUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+RxdymropXywwgAA3b

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
computer.

Assisted-by: Hermes:deepseek-v4-flash
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74f..a3191bb909b28 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -182,6 +182,11 @@ properties:
           - const: alientek,clrv1126f
           - const: rockchip,rv1126
 
+      - description: Alientek QuarkPi-CA2 board
+        items:
+          - const: alientek,quarkpi-ca2
+          - const: rockchip,rk3588s
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686427;
	b=Z8sJMe4ifC7KgRjivJXx7LKgqZpDbpsCxDvgO0WBrTnVLuHJv2v+AfVfZFtLH7Hshq0Y
	 cxbZRWrZnDVsGyn86oDX9KnHWCsejsHkkHgd8h91Vz0EimwvrZZpm1Uw9XtekXaBkih0Z
	 KFewpDdatMPDzCsg1Px198ONqECByOueLDCz341VK5/BRkh4HfWy+EBFFedDYRddpV1P/
	 64nm3HlwbY5WWixAf8QNGU1H0VOjgaFFlqFnr57GAnCR7eGdOBT1oIS99JUoq14W3RBrK
	 L0DNoRufER7IoQ/j2dW25mTLu9U6TVkbOdxCTcRmYIsEdNaivpXKC2kJAlN/7Te42Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686427;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=7RB0aQ170QWbQt1olwfSEj/M8xmgDSopHSlP7JzynLU=;
	b=AIu+V4rl7BLZtjgisuLr41dzfsHj+psMHIIwGUUHYwqtnbQd/uw7jTpQAEGvHgS+ffjp
	 9kTIQQ+nMR23HCQrrXepu96XujhlnQFBL+J//d33KUxFr1+geCttab8BXM2BQId1vivIE
	 a9gOUzdEiyz5aP1y8WeGp12Btr2zSsFh4sUMQIq9mGhLtqhr9P7I0hCOuyKXkygYAZ/21
	 R8vlzfKh9guzeQMC1K/3pjopeqUs+xpbhh/5ihl1X8NHdM7Iqw2XgQqAHu4bH2tKPAdpV
	 us77u5OTb0Z+vO8bUZXbsgJKI5s93qoqUXYEeONdsEpqU9FCUKlW+WFd4Ue6+Zk4RTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ic8WomO7;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82EE606A320;
	Thu, 22 Oct 2026 16:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82EE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ic8WomO7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=7RB0aQ170QWbQt1olwfSEj/M8xmgDSopHSlP7JzynLU=;
	b=ic8WomO7iIO4qI/WbkFSv5cvdIFpMTY3CkL74p+0HkL6TvVsTfbl5A/FjcrCR/
	laXd9fd1aBqy787pLBhErhCntFE1G4SQ9FtE5FFiAjWk+Z70WvsTV//7FEqQs7zV
	4C9HzWff7DwkFaWwpdfvrfQ488FGwGEpiXnO1qSPW0Rik=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnPxIuOdpqqEgDCA--.49816S3;
	Fri, 23 Oct 2026 00:26:25 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Fri, 23 Oct 2026 00:26:20 +0800
Subject: [PATCH v10 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
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
Message-Id: <20261023-quarkpi-ca2-v10-1-9db904194e03@163.com>
References: <20261023-quarkpi-ca2-v10-0-9db904194e03@163.com>
In-Reply-To: <20261023-quarkpi-ca2-v10-0-9db904194e03@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wDnPxIuOdpqqEgDCA--.49816S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr4UAF45Ar47WrWrZFWDJwb_yoWDZrgEka
	4xZF15WFWrJFyFgw45Aa1xGFyqqw42kFs7AF1DAF1kA34qkws3Ka95t343Ca4Ikr43urn3
	CFn5JryxWFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_tku7UUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+RGrGWraOTE8BQAA3b

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


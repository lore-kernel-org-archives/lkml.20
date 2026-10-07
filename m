Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F95A3CFF5C;
	Wed,  7 Oct 2026 05:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350404; cv=none; b=WPG9b4pr9bXkEKAxRVhhd4iP9FK1ZCp3aPEQKNoI+bOSOuzUOIZR2ELwstP+6MCqDs+8MrdNcptvUbMBegK5477sLfvQRXPP2xSHOhwYTCn7PXAhgeX87w8ghhXiLm1qf97EA9NwMAsMOC5z3YGYFgF9mwVBzQn/+pPPpqSWezg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350404; c=relaxed/simple;
	bh=2VhwS7uw2Z++4Dsbz0kj4i+d3dB/KB/XjgKBqichXKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gU55++25sqXxKFjV5Y8W2vRoymhzoLO73fd9yiBUz7C/wW9/G4qKqJsErJ0JKya405+Uis8imIO4sAcS3JPw5yMT2vdpBbbLsGBfVKw3qou3dkkRbfWiClYcs750uvV0499UfSvdMhBjakwy6Hbo+c9By/XOHJNMfeCoiB/mVT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=aLy2UZT6; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="aLy2UZT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=UTt+5FuHrUx1tCjYQAe2xq5MHeqwbx0v5ma8SnHJEo4=;
	b=aLy2UZT6jvWoQi9OFVfuSokUwvYPHOOO1rshVWLTjgigNrXthCcegFSiUCmW23
	h2CmblDihQCHqi5LoJf8M/0Cn8x2ScXt0WiF55iM3OSlAfectOx3e37z4QoDTMCo
	eyVEBpYHFuA73e8L+yTAoG40lsWdwKE9rUbhSa+hhRW6k=
Received: from 4F-GAME.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD332Ba1sVq7JaEDA--.27297S3;
	Wed, 07 Oct 2026 13:19:26 +0800 (CST)
From: Bob Hui <bg9oxa@163.com>
Date: Wed, 07 Oct 2026 13:18:14 +0800
Subject: [PATCH v8 1/2] dt-bindings: arm: rockchip: Add ALIENTEK
 QuarkPi-CA2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-quarkpi-ca2-v8-1-b83192bed07b@163.com>
References: <20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com>
In-Reply-To: <20261007-quarkpi-ca2-v8-0-b83192bed07b@163.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Bob Hui <bg9oxa@163.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:_____wD332Ba1sVq7JaEDA--.27297S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrW7Wr18Ar17Jw13WFy3urg_yoWDGrgEka
	4xZF15WFyrJFyFgws8Aa1xGFyjqw47Krs7AF1UAF1UA34qyrs3KFZ5t343Aa4xCr43urn3
	CFn5JryxXFnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_pVbDUUUUU==
X-CM-SenderInfo: lejz05rd6rljoofrz/xtbC+R7YRmrF1l4+VAAA30

Document the ALIENTEK QuarkPi-CA2, an RK3588S based single board
computer.

Assisted-by: Hermes:deepseek-v4-flash
Signed-off-by: Bob Hui <bg9oxa@163.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..a3191bb909b2 100644
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


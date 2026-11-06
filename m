Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999073;
	b=cPk1SC8OKQ0xnPFjCC7s47N1FMGJ3a+7k0Qj4QUYBugdJS7+B+fpKg4Lfd7sv7KQ99Qh
	 8B5cJtlOU1utjLNBirq0KlPg+foRnlIit5n4kdaYUpiVQmhCI17T3I9h+6XWR9NFgG0aH
	 Pz5vCFoT9FlsiCcW4t6poChIeWmoYY9WtmZMxbkV6nEChZVSflpvJsuccLVzbtGi/ZiNS
	 CVKYwWuZKH1hhJjmXc8HfNtg2dkrBeRZu1HbVsYQgQ2vWeTgDwIBQX8oFw1ZZ2tX2WgBk
	 SvBrcoFcWB2uZ5RPAiJ/975u6/IInmJtBg8tyZ3XhYjHz3K7Lx3aTdKicKsvGKurOOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999073;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=naN7Do2XKnfBEEL8wixGrdg7/Y36Mq/NZw9Z3+PlXBI=;
	b=FEYGB5ve8stjnS+gHWU12OuzOXY0l2aduFDbQusUYrPdabFqON+fCxkiDDjk0ntnb4CC
	 XXJJPrHW8L/QGErp0vwLy1otSenhBrKTrugzTLrblMCE7+QCNgxuuLfJnIfqtWU6TP+GG
	 TixkCnWItz5hCCYP8pn856/9B/8bZVvGbKBq2ehzuwkx1rnQWaDQZv6o6Bxe/ozc9g+hC
	 JPRrmRVotzPdxBjbTfHuyRmbEExvcbD2VukpH8zN094Xr2GRfoyTAn4qOIVWfbKAKIGue
	 uWriMMZ4gXWB1vX1DiskT8FFvFZRzrcleSovglgw8yk29XbpucyULJ3O+Ui0yX5rtbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=3c+SiJzj;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3AC606D809;
	Fri,  6 Nov 2026 21:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3AC606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=3c+SiJzj
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=naN7Do2XKnfBEEL8wixGrdg7/Y36Mq/NZw9Z3+PlXBI=;
	b=3c+SiJzjCODbfc1tsfQeAbiYCeHGStTsEsUhph7GCDyD7xL4PuYJiJr+zhCQX9P9orJ+oR
	fti0ziRd1IX4+maEJUpa3WjS9HBgQXgIrnfGxjWq/7ysLshmo8zcXjghQPk/NeIthJEJVq
	fuK5W0YbBt/7qjYiY+bi5xeyfV4meHI=
Date: Fri, 06 Nov 2026 22:04:18 +0100
Subject: [PATCH 09/15] dt-bindings: iommu: apple,sart: Add t8140
 compatibles
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
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-9-22f4827b4ece@cyberchaos.dev>
References: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
In-Reply-To: <20261106-apple-dts-m4-m5-nvme-v1-0-22f4827b4ece@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 iommu@lists.linux.dev, Yureka Lilian <yureka@cyberchaos.dev>

The SART IOMMU in the Apple A18 Pro SoC is compatible to
"apple,t6000-sart".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/iommu/apple,sart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/apple,sart.yaml b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
index 8cf41473b808..bf35ead191ec 100644
--- a/Documentation/devicetree/bindings/iommu/apple,sart.yaml
+++ b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -37,6 +37,7 @@ properties:
               - apple,t8112-sart
               - apple,t8122-sart
               - apple,t8132-sart
+              - apple,t8140-sart
           - const: apple,t6000-sart
       - enum:
           - apple,t6000-sart

-- 
2.56.0


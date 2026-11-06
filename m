Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999071;
	b=M68xY6PRmu307qzs3pv5ORvZp5QxjYJ5gk6yJwKb5mxrNaR96xsx6DSfcSm3zEW96ry2
	 iCAfXcNclCWs06OtoiDT5TVa6aXy6RRAz6p65djuzQslkADrr+EdbnvNDgJtLJdxju76Z
	 SL0gbr+c8YKZc9VyRdT8fr2480QfvEmZlo5g4wfsv/ISEzi1E/u3nUEhZrbQcHi020fHk
	 I4Jki/xuawHCAWITX/y9fd6OF4O5EnHxQXNPy4DZMaSiLVh1aWzq/gVOVAOmUKIobYAjm
	 QWoBaDD+62q3RAENMYQZOCDXpGCXmKp1s0Tt1TGln7VHXhLxLGnuYReIUZhl3u6t/sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999071;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=tje/iAOgXLkukdf7IpTXxmJRYT/oZk9KALyauIZxbAo=;
	b=BCwDQlViXqALCHDExTCNsUT7E+Okr7ityiLDKRRUk8D6IT12RWvQdmpAiz+aSJPzTdrw
	 EOtGLOs3V6x9Z86Izzo1g3UwUtDcDv2OT8tNRMkcTo5MAbc4lO7ZyDNAfcNn2c2tZeGwd
	 cik2EUivS6CCWtdSneQrUyQbe4EgGP8tRQJBO3PCd9KFCprgESL4xIPPdJsZAZjpOHr4R
	 iUw8GWwLc+00v9baQHR8khky6BvVN2k2KMhOPCAO61EGm+xi7l06acZHWZix3/94DliAo
	 kqDYQmlnp2hZEOJEOkvlDcLlRkkdqX9zAOdM2Gd1XHvzIJqdEbVeM6S+LB2rsvCJ/Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=PODu4cFA;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A099606A339;
	Fri,  6 Nov 2026 21:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A099606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=PODu4cFA
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793999069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tje/iAOgXLkukdf7IpTXxmJRYT/oZk9KALyauIZxbAo=;
	b=PODu4cFAfBCRmLvtm28kAPn82pmLcRFFLyT7RHSNr7UgEbNvbyrVT/GzaNy0qiq6UDTQHk
	GQVM3OiaHd4hJpYHhK05GWyZjpqsYC3WgDtUS36uz6QUt15NoIoUGoD8Ez7iR822ZYOerZ
	XkNfsyW0g8Ywf3q/AEZxNu5QbLDQG6k=
Date: Fri, 06 Nov 2026 22:04:17 +0100
Subject: [PATCH 08/15] dt-bindings: iommu: apple,sart: Add t8132
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
Message-Id: <20261106-apple-dts-m4-m5-nvme-v1-8-22f4827b4ece@cyberchaos.dev>
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

The SART IOMMU in the Apple M4 SoC is compatible to "apple,t6000-sart".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/iommu/apple,sart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/apple,sart.yaml b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
index 015158a9676b..8cf41473b808 100644
--- a/Documentation/devicetree/bindings/iommu/apple,sart.yaml
+++ b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -36,6 +36,7 @@ properties:
               - apple,t6031-sart
               - apple,t8112-sart
               - apple,t8122-sart
+              - apple,t8132-sart
           - const: apple,t6000-sart
       - enum:
           - apple,t6000-sart

-- 
2.56.0

